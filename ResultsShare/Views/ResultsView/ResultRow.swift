//
//  ResultView.swift
//  ResultsShare
//
//  Created by Krefting, Max (PGW) on 03/05/2021.
//

import SwiftUI

struct ResultRow: View {
    
    var result: Result
    
    var body: some View {
        HStack{
            Image(result.subjectImageName)
                .resizable()
                .scaledToFill()
                .frame(width: 35, height: 35)
                .clipShape(
                    RoundedRectangle(cornerRadius: 5))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1))
                .padding()

            Text(result.name)
                .padding()
            
            Spacer()
      
            
            Text("\(result.percentage)%")
                .padding()
        }
    }
}

struct ResultRow_Previews: PreviewProvider {
    static var previews: some View {
        ResultRow(result: Result.example)
    }
}
