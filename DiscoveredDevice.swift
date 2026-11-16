import Foundation

struct DiscoveredDevice: Identifiable {
    let id = UUID()
    let name: String
    let manufacturer: String
    let model: String
    let ipAddress: String
    let port: Int
    let operatingSystem: String
    let isConfirmed: Bool
}
