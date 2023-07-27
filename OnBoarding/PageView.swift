//
//  OnBoarding.swift
//
//  Created by Rahul jha on 19/07/23.
//
import SwiftUI
struct PageView: View {
    @State var radius = 40.0
    var page: Page
    var body: some View {
        VStack {
            // image
            VStack{
                ZStack{
                    page.color
                    Image("\(page.imageUrl)")
                }.frame(maxHeight: UIScreen.main.bounds.height/1.9)
                    .padding(.bottom, radius)
                    .cornerRadius(radius)
                    .padding(.bottom, -radius)
                }
                .padding()
            // text , button , radiobutton
            VStack{
                //title
                    Text("\(page.name)")
                        .font(.title)
                        .foregroundColor(ColorConstants.Colors.titleGray)
                        .font(.system(size: 30))
                        .fontWeight(.semibold)

                        .padding()

                // paragraph
                
                    Text("\(page.description)")
                        .foregroundColor(ColorConstants.Colors.textGray)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16))
                
            }.padding()
            Spacer()
                // Buttons and radio
        }
        
    }
}
struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.samplePage)
    }
}
