//
//  ContentView.swift
//  UserDefaultsSwiftUI
//
//  Created by Alex Nagy on 13/10/2020.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published("profile") var profile = Profile(name: "Alex", age: 10)
}

struct ContentView: View {
    
    @AppStorage("score") var score = 0
    
    @AppStorage("cool", store: UserDefaults(suiteName: "group.com.rebeloper.UserDefaultsSwiftUI")) var isCool = false
    
    @StateObject var model = ContentViewModel()
    
    var body: some View {
        Text("Hello, \(model.profile.name)!")
            .padding().onTapGesture(count: 1, perform: {
                score += 1
                print(score)
                
                isCool.toggle()
                print(isCool)
                
                model.profile.name = "Alexander"
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
