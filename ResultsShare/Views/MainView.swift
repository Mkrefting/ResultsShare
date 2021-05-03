//
//  ContentView.swift
//  ResultsShare
//
//  Created by Krefting, Max (PGW) on 03/05/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ResultsView()
                .tabItem{
                    Label("Results", systemImage: "list.dash")
                }
            AnalysisView()
                .tabItem{
                    Label("Analysis", systemImage: "cube")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MyResults())
    }
}
