//
//  ResultsShareApp.swift
//  ResultsShare
//
//  Created by Krefting, Max (PGW) on 03/05/2021.
//

import SwiftUI

@main
struct ResultsShareApp: App {

    @StateObject var myResults = MyResults()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(myResults)
        }
    }
}
