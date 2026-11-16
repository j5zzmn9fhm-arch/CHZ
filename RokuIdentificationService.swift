import Foundation

struct RokuIdentificationService {

    func identify(ipAddress: String) async -> DiscoveredDevice? {
        guard let url = URL(
            string: "http://\(ipAddress):8060/query/device-info"
        ) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 5

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let xml = String(data: data, encoding: .utf8),
                  xml.contains("<device-info") else {
                return nil
            }

            let model = value(for: "model-name", in: xml) ?? "Roku"
            let friendlyName = value(for: "user-device-name", in: xml) ?? "Roku TV"

            return DiscoveredDevice(
                name: friendlyName,
                manufacturer: "Roku",
                model: model,
                ipAddress: ipAddress,
                port: 8060,
                operatingSystem: "Roku OS",
                isConfirmed: true
            )

        } catch {
            return nil
        }
    }

    private func value(for tag: String, in xml: String) -> String? {
        let openingTag = "<\(tag)>"
        let closingTag = "</\(tag)>"

        guard let start = xml.range(of: openingTag),
              let end = xml.range(of: closingTag),
              start.upperBound <= end.lowerBound else {
            return nil
        }

        return String(xml[start.upperBound..<end.lowerBound])
    }
}
