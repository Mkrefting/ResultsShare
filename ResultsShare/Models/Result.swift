//
//  Result.swift
//  ResultsShare
//
//  Created by Krefting, Max (PGW) on 03/05/2021.
//

import Foundation

enum Subject: String, CaseIterable, Identifiable{
    case mathematics
    case english
    case physics
    case chemistry
    case biology
    case computing
    
    var id: String { self.rawValue }

}

struct Result: Identifiable {
    
    var id: UUID
    var name: String
    var score: Int
    var outOf: Int
    var date = Date()
    
    var subject: Subject
    var subjectImageName: String {
        "\(subject.rawValue)-icon"
    }
    
    var percentage: Int {
        Int(100*score/outOf)
    }
    
    #if DEBUG
    static let example = Result(id: UUID(), name: "System Software 1", score: 19, outOf: 20, subject: Subject.mathematics)
    #endif
    
}
