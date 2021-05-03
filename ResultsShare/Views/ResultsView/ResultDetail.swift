//
//  ResultDetail.swift
//  ResultsShare
//
//  Created by Krefting, Max (PGW) on 03/05/2021.
//

import SwiftUI

struct ResultDetail: View {
    
    var result: Result
    
    var body: some View {
        VStack{
            Text(result.name).font(.title)
            Text("Score: \(result.score)")
            Text("Out of: \(result.outOf)")
            Text("Percentage: \(result.percentage)")
            Text("Data: \(result.date)")
            Text("Subject: \(result.subject.rawValue.capitalized)")
            
        }
    }
    
}

struct ResultDetail_Previews: PreviewProvider {
    static var previews: some View {
        ResultDetail(result: Result.example)
    }
}
