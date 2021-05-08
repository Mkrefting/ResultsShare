//
//  BarChart.swift
//  ResultsShare
//
//  Created by Krefting, Max (PGW) on 07/05/2021.
//

import SwiftUI

struct BarChart: View {
    
    var data: [Int]
    var labels: [String]

    let axisColor: Color = .black
    let spacing: CGFloat = 8
    
    var body: some View {
        VStack {
          ZStack {
            BarStack(data: data,
                     labels: labels,
                     spacing: spacing)
            
            BarChartAxes()
              .stroke(Color.black, lineWidth: 2)
          }
          
          LabelStack(labels: labels, spacing: spacing)
        }
        .padding([.horizontal, .top], 20)
    }
}



struct BarStack: View {
    var data: [Int]
    var labels: [String]
    let spacing: CGFloat
  
    var body: some View {
        HStack(alignment: .bottom, spacing: spacing) {
            ForEach(0 ..< data.count) { index in
                BarPath(data: data[index]).fill(Color.green)//.padding(5)
            }
        }
        .shadow(color: .black, radius: 5, x: 1, y: 1)
        .padding(.horizontal, spacing)
    }
}

struct BarPath: Shape {
  let data: Int

  func path(in rect: CGRect) -> Path {
    guard data != 0 else {
      return Path()
    }
    
    var height = CGFloat(data)/100 * rect.height
    
    if (data/100) > 1 {
        print("data is larger than 100%")
        height = CGFloat(100) * rect.height
    }
    
    let bar = CGRect(x: rect.minX, y: rect.maxY - (rect.minY + height), width: rect.width, height: height)
    
    return RoundedRectangle(cornerRadius: 5).path(in: bar)
  }
}


struct BarChartAxes: Shape {
    func path(in rect: CGRect) -> Path {
      var path = Path()
      
      path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
      path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
      
      return path
    }
}

struct LabelStack: View {
  var labels: [String]
  let spacing: CGFloat
  
  var body: some View {
    HStack(alignment: .center, spacing: spacing) {
      ForEach(labels, id: \.self) { label in
        Text(label)
            .font(.caption)
          .frame(maxWidth: .infinity)
      }
    }
    .padding(.horizontal, spacing)
  }
}



struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(data: [9,41,75], labels: ["1","2","3"])
    }
}
