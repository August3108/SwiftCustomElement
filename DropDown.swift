import SwiftUI

struct DropdownView: View {
    @Binding var selectedOption: String
    @State private var isDropdownVisible = false
    
    let options: [String]
    
    var body: some View {
        VStack {
            Button(action: {
                self.isDropdownVisible.toggle()
            }) {
                HStack {
                    Text(selectedOption)
                        .foregroundColor(.black)
                    Image(systemName: isDropdownVisible ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }
            
            if isDropdownVisible {
                List(options, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                        self.isDropdownVisible.toggle()
                    }) {
                        Text(option)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .padding()
    }
}

struct DropDown: View {
    @State private var selectedOption = "Option 1"
    
    let options = ["Option 1", "Option 2", "Option 3"] // Replace this with your own data
    
    var body: some View {
        VStack {
            DropdownView(selectedOption: $selectedOption, options: options)
            
            Text("Selected Option: \(selectedOption)")
        }
        .padding()
    }
}

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDown()
    }
}
