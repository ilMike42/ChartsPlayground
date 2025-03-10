//
//  ToyShape.swift
//  ChartsPlayground
//
//  Created by Michael Planu on 10/03/25.
//

import SwiftUI
import Charts


struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}

var data: [ToyShape] = [
    .init(type: "Cube", count: 5),
    .init(type: "Sphere", count: 4),
    .init(type: "Pyramid", count: 4),
    .init(type: "Pyramid2", count: 4),
    .init(type: "Pyramid3", count: 3),
    .init(type: "Pyramid4", count: 10)
]

struct BarChart: View {
    let gradient = LinearGradient(colors: [.red, .brown], startPoint: .top, endPoint: .bottom)
    @State private var selectedIndex: Int?
    var body: some View {
        Chart {
            ForEach(data) { item in
                BarMark(
                    x: .value("Shape Type", item.type),
                    y: .value("Total Count", item.count)
                )
                .cornerRadius(15)
                .foregroundStyle(gradient)
            }
        }
        .chartScrollableAxes(.horizontal)
        .chartXVisibleDomain(length: 4)
        .chartXSelection(value: $selectedIndex)

        Text(String(selectedIndex ?? 1))
    }
}

#Preview {
    BarChart()
}

