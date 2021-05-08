//
//  File.swift
//  ResultsShare
//
//  Created by Krefting, Max (PGW) on 03/05/2021.
//

import SwiftUI

class MyResults: ObservableObject {
    
    @Published var results: [Result] = [Result.example, Result.example1, Result.example2, Result.example3]
    // was results = [Result]()
    func add(result: Result){
        results.append(result)
    }
    
    func getData() -> [Int] {
        var data: [Int] = []
        for result in self.results {
            data.append(result.percentage)
        }
        return data
    }
    
    func getLabels() -> [String] {
        var labels: [String] = []
        for result in self.results {
            labels.append(result.subject.rawValue.capitalized)
        }
        return labels
    }
    
}
