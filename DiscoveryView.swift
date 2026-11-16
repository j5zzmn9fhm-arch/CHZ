import SwiftUI

struct DiscoveryView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 24) {
                Text("CHZ")
                    .font(.system(size: 42, weight: .bold))
                    .foregroundColor(.white)

                Text("DISCOVERY")
                    .font(.system(size: 14, weight: .medium))
                    .tracking(6)
                    .foregroundColor(.gray)

                Spacer()

                Image(systemName: "wifi")
                    .font(.system(size: 55))
                    .foregroundColor(.white)

                Text("Descubra suas Smart TVs")
                    .font(.title2.bold())
                    .foregroundColor(.white)

                Text("Encontre dispositivos conectados à sua rede Wi-Fi.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)

                Spacer()

                Text("BUSCAR DISPOSITIVOS")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding(28)
        }
        .preferredColorScheme(.dark)
    }
}
