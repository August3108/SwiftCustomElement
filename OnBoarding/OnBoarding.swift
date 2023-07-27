//
//  OnBoarding.swift

//
//  Created by Rahul jha on 19/07/23.
import SwiftUI

struct OnBoardingView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    private let goRegister = false
    
    var body: some View {
        NavigationView{
            ZStack{
                ZStack{
                    VStack{
                        TabView(selection: $pageIndex) {
                            ForEach(pages) { page in
                                VStack {
                                    
                                    PageView(page: page)
                                }
                                .tag(page.tag)
                                
                            }
                            
                        }.tabViewStyle(PageTabViewStyle())
                            
                    }
                    Spacer()
                    VStack{
                        Spacer()
                        HStack{
                            
                            NavigationLink(destination: RegistrationView(), label: {
                                VStack{
                                    Text("Skip")
                                        .foregroundColor(ColorConstants.Colors.mainOrange)
                                            .bold()
                                }}
                            )
                            
                            Spacer()
                            if(pageIndex<2)
                            {
                                Button(action: incrementPage)
                                {
                                    Text("Next")
                                    
                                        .frame(width: 100,height: 52)
                                        .background(ColorConstants.Colors.mainOrange)
                                        .cornerRadius(10)
                                        .foregroundColor(Color.white)
                                }
                                
                            }
                            else{
                                
                                NavigationLink(destination: RegistrationView(), label: {
                                    VStack{
                                        Text("Next")
                                            .frame(width: 100,height: 52)
                                            .background(ColorConstants.Colors.mainOrange)
                                            .cornerRadius(10)
                                            .foregroundColor(Color.white)
                                    }}
                                )}
                        }.padding(EdgeInsets(top: 0, leading: 24, bottom: 40, trailing: 24))
                    }
                }
                .animation(.easeInOut, value: pageIndex)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                
                .onAppear {
                    dotAppearance.currentPageIndicatorTintColor = .black
                    dotAppearance.pageIndicatorTintColor = .gray
                    dotAppearance.clipsToBounds = true
                    
                }
                
            }
        }
        
    }

    func incrementPage() {
        pageIndex += 1
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
