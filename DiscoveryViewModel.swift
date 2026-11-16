import Foundation

@MainActor
final class DiscoveryViewModel: ObservableObject {

    @Published var devices: [DiscoveredDevice] = []
    @Published var isSearching = false
    @Published var statusMessage = "Pronto para buscar"

    private let discoveryService = DeviceDiscoveryService()

    func identifyRoku(ipAddress: String) {
        guard !isSearching else { return }

        isSearching = true
        statusMessage = "Verificando dispositivo Roku..."

        Task {
            defer { isSearching = false }

            if let device = await discoveryService.discoverRoku(at: ipAddress) {
                devices = [device]
                statusMessage = "Dispositivo identificado"
            } else {
                devices = []
                statusMessage = "Nenhum Roku identificado nesse endereço"
            }
        }
    }
}
