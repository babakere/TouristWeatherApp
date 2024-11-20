import SwiftUI

struct LocationDetailView: View {
    var location: Location

    var body: some View {
        VStack {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            Spacer()
            Text("Swipe right to see more images")
                           .font(.subheadline)
                           .foregroundColor(.gray)
                           .padding()
            TabView {
                ForEach(location.imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                                   .frame(maxWidth: 600, maxHeight: 600)
                                   .cornerRadius(8)
                                   .overlay(RoundedRectangle(cornerRadius: 20)
                                               .stroke(Color.clear, lineWidth: 10))
                                   .padding()
                                   .shadow(color: .gray, radius: 10)
                                   .tag(imageName)
                        
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .padding()

            Text("City Of \(location.cityName)")
                .font(.title2)
                .padding()

            Text("\(location.description)")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Link(destination: URL(string: location.link)!) {
                Text("Learn More on Wikipedia")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: 300)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
        }
        .background(Color.gray.opacity(0.1))
        
    }
}
