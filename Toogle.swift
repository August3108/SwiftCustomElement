

// helpful to toggle from login with email or phone and where we need toggle between elements 
import SwiftUI

struct ToogleView: View {
    @Binding var firstButtonText: String
    @Binding var secondButtonText: String
    @Binding var isToggled: Bool
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Button(action: {
                    isToggled = true
                }) {
                    Text(firstButtonText)
                        .frame(height: 48)
                        .foregroundColor(isToggled ? .white : ColorConstants.Colors.lightTextGray)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .background(isToggled ? ColorConstants.Colors.mainOrange : Color.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    isToggled = false
                }) {
                    Text(secondButtonText)
                        .foregroundColor(isToggled ? ColorConstants.Colors.lightTextGray : .white)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isToggled ? Color.white : ColorConstants.Colors.mainOrange)
                        .cornerRadius(10)
                }
            }
        }
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.white, lineWidth: 3))
        .cornerRadius(10)
    }
}

// usage example
struct ToggleTest: View {
    @State private var firstButtonText = "Mobile"
    @State private var secondButtonText = "Email"
    @State private var toggling = false
    
    
    var body: some View {
        VStack{
            ToogleView(firstButtonText: $firstButtonText, secondButtonText: $secondButtonText, isToggled: $toggling)
            
            if(toggling==true){
                Text("true")
            }
            else{
                Text("false")
            }
        }}
}

struct ToggleTest_Previews: PreviewProvider {
    static var previews: some View {
        ToggleTest()
    }
}
