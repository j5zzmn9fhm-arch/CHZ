import SwiftUI

struct DiscoveryView: View {
    @StateObject private var viewModel = DiscoveryViewModel()
    @State private var ipAddress = ""

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 22) {
                Text("CHZ")
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(.white)

                Text("DISCOVERY")
                    .tracking(6)
                    .foregroundColor(.gray)

                Image(systemName: "wifi")
                    .font(.system(size: 55))
                    .foregroundColor(.white)
                    .padding(.top, 30)

                Text("Descubra suas Smart TVs")
                    .font(.title2.bold())
                    .foregroundColor(.white)

                TextField("Endereço IP da TV", text: $ipAddress)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .foregroundColor(.white)

                Button {
                    viewModel.identifyRoku(ipAddress: ipAddress)
                } label: {
                    Text(viewModel.isSearching ? "VERIFICANDO..." : "IDENTIFICAR ROKU")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .disabled(viewModel.isSearching || ipAddress.isEmpty)

                Text(viewModel.statusMessage)
                    .foregroundColor(.gray)

                ForEach(viewModel.devices) { device in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(device.name)
                            .font(.headline)
                        Text("\(device.manufacturer) • \(device.model)")
                        Text("IP: \(device.ipAddress)")
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }

                Spacer()
            }
            .padding(24)
        }
        .preferredColorScheme(.dark)
    }
}
