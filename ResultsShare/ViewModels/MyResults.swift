//
//  File.swift
//  ResultsShare
//
//  Created by Krefting, Max (PGW) on 03/05/2021.
//

import SwiftUI

class MyResults: ObservableObject {
    
    @Published var results = [Result]()

    func add(result: Result){
        results.append(result)
    }
    
}
