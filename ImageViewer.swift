import SwiftUI

struct CustomImageView: View {
    let url: URL
    
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            Spacer()
            if let image = image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            else {
                ProgressView()
            }
            Spacer()
        }
        .onAppear(perform: loadImage)
    }
    
    private func loadImage() {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: UIImage(data: imageData) ?? UIImage())
            }
        }.resume()
    }
}


struct MyCustomImageView: View{
    var body: some View{
        CustomImageView(url: URL(string: "https://freepngimg.com/thumb/vector/11-2-vector-png-pic.png")!)
    }
}

struct MyCustomImageView_Preview: PreviewProvider{
    static var previews: some View{
        MyCustomImageView()
    }
}
