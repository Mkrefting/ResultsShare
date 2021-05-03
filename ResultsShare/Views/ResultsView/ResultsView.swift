//
//  ResultsView.swift
//  ResultsShare
//
//  Created by Krefting, Max (PGW) on 03/05/2021.
//

import SwiftUI

struct ResultsView: View {
    
    @EnvironmentObject var myResults: MyResults
    @State var showingAddResult: Bool = false
    
    var body: some View {
        NavigationView{
            
            List{
            
                ForEach(myResults.results){ result in
                    
                    NavigationLink(destination: ResultDetail(result: result)){
                        ResultRow(result: result)
                    }
                }
                
            }.navigationTitle("My Results")
            .navigationBarItems(trailing:
                Button(action:{
                        self.showingAddResult.toggle()}
                    ){Image(systemName:"plus")}
                .sheet(isPresented: $showingAddResult)
                    {AddResultView()}
            )
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
            .environmentObject(MyResults())
    }
}
