import SwiftUI

struct CustomPicker: View {
    @Binding var selectedOption: Int
    let options: [String]
    let imageSystemName: String

    @State private var isPopoverVisible = false
    
    var body: some View {
        
            VStack {
                Button(action: {
                    isPopoverVisible.toggle()
                }) {
                    HStack {
                        Text(options[selectedOption])
                        Image(systemName: imageSystemName)
                    }
                    
                }
                .popover(isPresented: $isPopoverVisible) {
                    VStack {
                        ForEach(0..<options.count) { index in
                            Button(action: {
                                selectedOption = index
                                isPopoverVisible.toggle()
                            }) {
                                Text(options[index])
                                    .padding()
                            }
                        }
                    }
                }
                
                
            }
        }}


struct ContentView: View {
    @State private var selectedOption = 0
    let options = ["Option 1", "Option 2", "Option 3"]

    var body: some View {
        CustomPicker(selectedOption: $selectedOption, options: options, imageSystemName: "chevron.down")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
