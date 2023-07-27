import SwiftUI
struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    let color : Color
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "OnBoarding-1", tag: 0, color: ColorConstants.Colors.lightPurple)
    // images in asset
    static var samplePages: [Page] = [
        Page(name: "Explore", description: "The best app.", imageUrl: "OnBoarding-1", tag: 0,  color: Color.green),
        Page(name: "tittle 2", description: "you can meet new people!", imageUrl: "OnBoarding-2", tag: 1, color: Color.blue),
        Page(name: "title 3", description: "Don't like your pet? Well then edit your pet with our edit-pet tool!", imageUrl: "OnBoarding-3", tag: 2,  color: Color.red),
    ]
}
