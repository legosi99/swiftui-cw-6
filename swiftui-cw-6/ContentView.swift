//
//  ContentView.swift
//  swiftui-cw-6
//
//  Created by Yousif on 29/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            NavigationView{
                VStack {
                    Text("متاكد تبي تعرف ؟؟")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    NavigationLink(
                        destination: BMI(),
                        label: {
                            Text("اي متاكد")
                                .modifier(textPro())
                            Text("نجرب يلا")
                                .modifier(textPro())
                        })
                        .navigationTitle("BMI Calculator")
                }
            }
        }
    }
}

struct BMI: View {
    @State var hightMeter = ""
    @State var weightKG = ""
    @State var bmi = ""
    @State var answer = 0.0
    var body: some View {
        ZStack{
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                Image("fat-person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("حاسبة BMI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                TextField("الطول بالمتر", text: $hightMeter)
                    .modifier(BMITextModifier())
                TextField("الوزن بالكيلو جرام", text: $weightKG)
                    .modifier(BMITextModifier())
                Button(action: {
                    let hight = Double(hightMeter) ?? 1
                    let wieght = Double(weightKG) ?? 1
                    answer = Double(wieght / (hight * hight))
                    
                    bmi = String(format: "%.2f", answer)
                    
                }){
                    Text("احسب")
                        .padding()
                        .frame(width: 100, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                Text("BMI: \(bmi)")
                    .bold()
                    .font(.title)
                    .padding()
                Image("\(imgChooser(bmi: answer))")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(bmiStatus(bmi: answer))
                    .bold()
                    .font(.title)
                    .padding()
            }.padding()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    func bmiStatus(bmi: Double) -> String{
        switch bmi {
        case 0.0: return ""
        case 0.0..<20: return "عظمه لازم تاكل"
        case 20..<25: return "طبيعي يالنمر"
        case 25...: return "يالبطه لازم تضعف"
        default: return ""
        }
    }
    
    func imgChooser(bmi: Double) -> String {
        if (bmi == 0) {
            return ""
        } else if (bmi < 20){
            return "Brook"
        } else if (20 <= bmi && bmi < 25){
            return "Tiger"
        } else if (bmi >= 25){
            return "rabbit"
        }
        else {return ""}
    }
    
}

struct BMITextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.trailing)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct textPro: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 100, height: 40)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        BMI()
    }
}

