//
//  text.swift
//  Furpics
//
//  Created by Rahul jha on 24/07/23.
//
import SwiftUI

struct CustomDialNumPicker: View {
    @Binding var dialcode: String
    @Binding var numlen: Int
    @State var selectedOption = 0
    var countrydata: [countryList] = countryList.countries
    let imageSystemName: String

    @State private var isPopoverVisible = false

    var body: some View {

            VStack {
                Button(action: {
                    isPopoverVisible.toggle()
                }) {
                    HStack {
                        Text(countrydata[selectedOption].flag)
                        Text("+ \(countrydata[selectedOption].dialCode)")
                        Image(systemName: imageSystemName)
                    }

                }
                .popover(isPresented: $isPopoverVisible) {
                    ScrollView{
                        VStack {
                            ForEach(0..<countrydata.count, id: \.self) { index in
                                Button(action: {
                                    selectedOption = index
                                    dialcode = countrydata[index].dialCode
                                    numlen = countrydata[index].numberOfDigit
                                    isPopoverVisible.toggle()
                                }) {
                                        HStack{
                                            Text(countrydata[index].flag)
                                            Text("+ \(countrydata[index].dialCode)")
                                                .frame(width: 70)
                                            Text(countrydata[index].name)
                                            Spacer()
                                        }.padding()
                                }
                            }
                        }}
                    .presentationDetents([.medium, .large])
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

