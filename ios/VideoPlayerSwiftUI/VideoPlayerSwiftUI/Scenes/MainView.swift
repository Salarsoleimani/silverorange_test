//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var networkManager: APIService

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                
            }
    }
}

#Preview {
    MainView()
}
