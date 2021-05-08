//
//  AddResultView.swift
//  ResultsShare
//
//  Created by Krefting, Max (PGW) on 03/05/2021.
//

import SwiftUI

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

struct AddResultView: View {
    
    @Environment(\.presentationMode) var present
    @EnvironmentObject var myResults: MyResults
    
    @State private var name: String = ""
    @State private var score: String = ""
    @State private var outOf: String = ""
    @State private var selectedSubject = Subject.mathematics

    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section{
                        Picker("Subject", selection: $selectedSubject) {
                            ForEach(Subject.allCases, id: \.self) { subject in
                                Text(subject.rawValue.capitalized)
                            }
                        }
                    }
                    
                    Section{
                        TextField("Result Name", text: $name)
                            .disableAutocorrection(true)
                    }

                    Section{
                        // to get keyboard showing in simulator -> press cmd+k
                        HStack{
                            Section{
                            TextField("Score", text: $score)
                                .keyboardType(.numberPad)
                            }
                            Section{
                            TextField("Out Of", text: $outOf)
                                .keyboardType(.numberPad)
                            }
                        }
                    }
                    

                    Button("Add Result", action:{
                        if self.name != "" && score.isInt && outOf.isInt{
                            let result = Result(id: UUID(), name: self.name, score: Int(self.score)!, outOf: Int(self.outOf)!, subject: selectedSubject)
                            myResults.add(result: result)
                            self.present.wrappedValue.dismiss()
                        } else {
                            self.showAlert = true
                        }
                    })
                    .alert(isPresented: self.$showAlert){
                        Alert(title:Text("Incomplete Form"), message: Text("Please enter valid data"), dismissButton: .default(Text("OK")))
                    }
                }
                Spacer()
            }
            .navigationBarTitle("New Result", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action:{
                    self.present.wrappedValue.dismiss()
                }){Image(systemName:"xmark")}
            )

        }
    }
}

struct AddResultView_Previews: PreviewProvider {
    static var previews: some View {
        AddResultView()
    }
}


