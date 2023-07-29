import SwiftUI

struct CustomDialNumPicker: View {
    @Binding var dialcode: String
    @Binding var numlen: Int
    @State var selectedOption = 0
    var countrydata: [countryList] = countryList.countries
    let imageSystemName: String

    @State private var isPopoverVisible = false
    @State private var searchresult = ""
    var body: some View {

            VStack {
                Button(action: {
                    isPopoverVisible.toggle()
                }) {
                    HStack {
                        Text(countrydata[selectedOption].flag)
                        Text("+\(countrydata[selectedOption].dialCode)")
                        Image(systemName: imageSystemName)
                    }

                }
                .popover(isPresented: $isPopoverVisible) {
                    
                        VStack {
                            TextField("Enter Country Name", text: $searchresult)
                                .padding()
                            ScrollView{
                            ForEach(0..<countrydata.count, id: \.self) { index in
                                Button(action: {
                                    selectedOption = index
                                    dialcode = countrydata[index].dialCode
                                    numlen = countrydata[index].numberOfDigit
                                    isPopoverVisible.toggle()
                                }) {
                                    
                                    VStack{
                                        if (countrydata[index].name.hasPrefix(searchresult) && searchresult.count>0){
                                            HStack{
                                                Text(countrydata[index].flag)
                                                Text("+ \(countrydata[index].dialCode)")
                                                    .frame(width: 70)
                                                Text(countrydata[index].name)
                                                Spacer()
                                            }
                                        }
                                        else if(searchresult.isEmpty)
                                        {
                                            HStack{
                                                Text(countrydata[index].flag)
                                                Text("+ \(countrydata[index].dialCode)")
                                                    .frame(width: 70)
                                                Text(countrydata[index].name)
                                                Spacer()
                                            }
                                        }
                                    }.padding(EdgeInsets(top: 1, leading: 1, bottom: 0, trailing: 0))
                                        
                                }
                            }
                        }}
                    .presentationDetents([.height(0.66 * UIScreen.main.bounds.height)])
                }


            }
        }}

struct mytestground: View{
    @State var numcode = "1"
    @State var numlen = 10
    var body: some View{
        VStack{
            CustomDialNumPicker(dialcode: $numcode, numlen: $numlen, imageSystemName: "chevron.down")
            
            Text("\(numcode) \(numlen)")
            
        }}}

struct mytestpreview: PreviewProvider {
    static var previews: some View {
        mytestground()}}

