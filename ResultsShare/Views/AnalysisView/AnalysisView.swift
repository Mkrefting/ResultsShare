//
//  AnalysisView.swift
//  ResultsShare
//
//  Created by Krefting, Max (PGW) on 03/05/2021.
//

import SwiftUI

struct AnalysisView: View {
    
    @EnvironmentObject var myResults: MyResults

    var body: some View {
        NavigationView{
            
            ScrollView(.horizontal){
                BarChart(data: myResults.getData(), labels: myResults.getLabels())
            }.padding()
            
                .navigationTitle("Result Analysis")
        }
    }
}



struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
            .environmentObject(MyResults())
    }
}
