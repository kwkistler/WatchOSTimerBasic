//
//  ContentView.swift
//  WatchOSTimerBasic Watch App
//
//  Created by Kraig Kistler on 4/9/23.
//  Copyright © 2023 Kraig Kistler. All rights reserved.
//  https://www.youtube.com/watch?v=PnAvYJGNTPQ
//

import SwiftUI

struct ContentView: View {
    @State var secondScreenShown = false
    @State var  timerVal = 1
    
    var body: some View {
        VStack {
            Text("Start timer for \(timerVal) seconds")
            Picker(selection: $timerVal, label: Text("")) {
                Text("1").tag(1)
                Text("5").tag(1)
                Text("10").tag(1)
                Text("15").tag(1)
            }
            NavigationLink(destination: SecondView(secondScreenShown: $secondScreenShown, timerVal: timerVal), isActive: $secondScreenShown, label: {Text("Go")})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SecondView: View {
    @Binding var secondScreenShown: Bool
    @State var  timerVal = 1
    
    var body: some View {
        
        VStack {
            
            if timerVal > 0 {
                Text("Time remaining")
                    .font(.system(size: 14))
                Text("\((timerVal))")
                    .font(.system(size: 40))
                    .onAppear() {
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                            if self.timerVal > 0 {
                                self.timerVal -= 1
                            }
                        }
                    }
                Text("seconds")
                    .font(.system(size: 14))
                Button(action: {
                    self.secondScreenShown = false
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
            } else {
                Button(action: {
                    self.secondScreenShown = false
                }) {
                    Text("Done")
                        .foregroundColor(.green)
                }
            }
        }
    }
}

