//
//  Onbording.swift
//  Lucid
//
//  Created by Amaal on 15/06/1444 AH.
//

import SwiftUI

struct Onbording: View {
    @State private var selectedTab = 1
    //@Binding  var shouldShow :Bool
    var body: some View {
        NavigationView{
            
            //  VStack {
            TabView(selection: $selectedTab){
                
                VStack(){
                    Spacer()
                    
                    Image("OnLogo").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 130).padding().padding(.top)
                    Spacer()
                    
                    Text("Your voice  ")
                        .font(.system(size: 46)).frame(maxWidth: 300, alignment: .leading)
                    Text("hlper Lucid")
                        .font(.system(size: 46))
                        .fontWeight(.bold).frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                    
                    Divider().frame(maxWidth: 300).padding(.bottom)
                    
                    Text("Lucid is Your voice helper. It hlep you to commnicate with other, just type what you want to say and lucid will say it for you ")
                        .font(.system(size: 20))
                        .frame(maxWidth: 300, alignment: .leading)
                    Spacer()
                } .tag(1)
                
                
                
                VStack{
                    Spacer()
                    Image(systemName: "rectangle.3.group.bubble.left").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 130).padding().foregroundColor(Color("OurBlue"))
                    
                    Spacer()
                    
                    Text("Enable")
                        .font(.system(size: 46)).frame(maxWidth: 300, alignment: .leading)
                    Text("Spoken Content")
                        .font(.system(size: 46))
                        .fontWeight(.bold).frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                    Divider().frame(maxWidth: 300).padding(.bottom)
                    
                    Text("Please Go to the setting to enable the spoken content > Speak Screen in the accessibility so you can get all the benefit from the App. ")
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
                    Text("Two Fingers ")
                        .font(.system(size: 46))
                        .fontWeight(.bold).frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                    Divider().frame(maxWidth: 300).padding(.bottom)
                    
                    Text("Slide two fingers from up to down so the Spoken Content work with you. ")
                        .font(.system(size: 20))
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Spacer()
                    
                
                    
                    Button(action: {
                        //shouldShow = false
                        //Text("Start")
                    },
                           
                label:{Image(systemName: "arrow.right.circle.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 60)
                            .padding().foregroundColor(Color("OurBlue"))
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
  

struct Onbording_Previews: PreviewProvider {
    static var previews: some View {
        Onbording()
    }
}
