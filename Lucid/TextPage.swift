//
//  ContentView.swift
//  Lucid
//
//  Created by Maimuna on 15/06/1444 AH.
//

import SwiftUI

struct TextPage: View {
    @State private var content = ""
    @AppStorage("key") var shouldShow = true
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                TextEditor(text: $content)
                    .font(.largeTitle)
                    .padding(.top, 25)
                    .padding(.leading, 10)
                    .opacity(self.content.isEmpty ? 0.25 : 1)
                
                if content.isEmpty {
                    Text("Tap to start typing")
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .padding(.top, 65)
                        .padding(.top, -370)
                        .padding(.leading, 14)
                }
            }
            if content.isEmpty {
                Button("Clear") {
                    self.content = ""
                }
                .padding(.leading, 270)
                
                .buttonStyle(GrowingButton())
            }
        }.onTapGesture { hideKeyboard() }
            .ignoresSafeArea(.keyboard).fullScreenCover(isPresented: $shouldShow) {
                Onbording(shouldShow: $shouldShow)
            }
        
        
    }
}
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
struct CustomColor {
    static let Text = Color("Text")
    static let OurBlue = Color("OurBlue")
    // Add more here...
}
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(CustomColor.OurBlue)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            .font(.system(size: 20))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
struct TextPage_Previews: PreviewProvider {
    static var previews: some View {
        TextPage()
    }
}
