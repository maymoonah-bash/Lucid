//
//  Onbording.swift
//  Lucid
//
//  Created by Amaal on 15/06/1444 AH.
//

import SwiftUI

struct Onbording: View {
    @State private var selectedTab = 1
    @Binding  var shouldShow :Bool
    var body: some View {
        NavigationView{
            
            //  VStack {
            TabView(selection: $selectedTab){
                
                VStack(){
                    Spacer()
                    
                    Image("OnLogo").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 130).padding().padding(.top)
                    Spacer()
                    
                    Text("Lucid")
                        .font(.system(size: 46)).frame(maxWidth: 300, alignment: .leading)
                        .foregroundColor(CustomColor.Text)//Color
                        .fontWeight(.bold)
                    Text("Voice Assistant")
                        .font(.system(size: 46))
                        .frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                        .foregroundColor(CustomColor.Text)//Color
                    
                    Divider().frame(maxWidth: 300).padding(.bottom)
                    
                    Text("Lucid is your personal voice assistant that will help you communicate with others.  Just type the words and Lucid will say them for you.")
                        .font(.system(size: 20))
                        .frame(maxWidth: 300, alignment: .leading)
                        .foregroundColor(CustomColor.Text)//Color
                    Spacer()
                } .tag(1)
                
                
                
                VStack{
                    Spacer()
                    Image(systemName: "rectangle.3.group.bubble.left").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 130).padding().foregroundColor(Color("OurBlue"))
                    
                    Spacer()
                    
                    Text("Enable")
                        .font(.system(size: 46)).frame(maxWidth: 300, alignment: .leading)
                        .foregroundColor(CustomColor.Text)//Color
                    Text("Spoken Content")
                        .font(.system(size: 46))
                        .frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                        .foregroundColor(CustomColor.Text)//Color
                        .fontWeight(.bold)
                    Divider().frame(maxWidth: 300).padding(.bottom)
                    
                    Text("To enable the app to speak, press the button below to go to settings > accessibility > enable speak-screen so you can use the app to its full potential.")
                        .foregroundColor(CustomColor.Text)//Color
                        .font(.system(size: 20))
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Spacer()
                    
                    Button(action: {
                        self.settingsOpener()
                    },
                    
                label:{Text("Enable Spoken Content")
                        .padding()
                        .frame(maxWidth: 240)
                        .font(.callout)
                        .foregroundColor(.white).background(Color("OurBlue"))
                    .cornerRadius(30)})
                    
                    Spacer()
                    
                    
                    
                    
                }.tag(2)
                
                VStack{
                    Spacer()
                    Image("twoFinger").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 130).padding().foregroundColor(Color("OurBlue"))
                    
                    Spacer()
                    
                    Text("Slide")
                        .font(.system(size: 46)).frame(maxWidth: 300, alignment: .leading)
                        .foregroundColor(CustomColor.Text)//Color
                    Text("Two Fingers")
                        .font(.system(size: 46))
                        .foregroundColor(CustomColor.Text)//Color
                        .fontWeight(.bold).frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                    Divider().frame(maxWidth: 300).padding(.bottom)
                    
                    Text("Slide down with two fingers from the top of the screen to hear the text.")
                        .font(.system(size: 20))
                        .foregroundColor(CustomColor.Text)//Color
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Spacer()
                    
                
                    
                    Button(action: {
                        shouldShow = false
                        
                    },
                           
                label:{Image(systemName: "arrow.right.circle.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 60)
                            .padding().foregroundColor(Color("OurBlue")).flipsForRightToLeftLayoutDirection(true)
                        })
                    
                    Spacer()
                    
                    
                    
                    
                }.tag(3)
                
            }
            .frame(width: .infinity, height: .infinity)
            .tabViewStyle(PageTabViewStyle()).indexViewStyle(.page(backgroundDisplayMode: .always))
            
        }
                  }
    
    private func settingsOpener(){
        if let url = URL(string: "App-prefs:ACCESSIBILITY&path=SPEECH_TITLE") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        }
              
      }
  

//struct Onbording_Previews: PreviewProvider {
//    static var previews: some View {
//        Onbording()
//    }
//}
