//
//  NativeCharts.swift
//  ChartsPlayground
//
//  Created by Michael Planu on 13/03/25.
//

import SwiftUI
import Charts

enum ConsumptionType: String {
    case t1 = "Mesi precedenti"
    case t2 = "Mese in corso"
    case t3 = "Litri in eccesso"
}

struct ConsuptionData: Identifiable {
    let id = UUID()
    let xLabel = "x placeholder"
    let yLabel = "y placeholder"
    let xValue: String
    let yValue: Double
    let type: ConsumptionType
}

struct NativeChartsViewModel {
    var data: [ConsuptionData] = [
        ConsuptionData(xValue: "JAN", yValue: 200, type: .t1),
        ConsuptionData(xValue: "JAN", yValue: 800, type: .t2),
        ConsuptionData(xValue: "JAN", yValue: 1000, type: .t3),

        ConsuptionData(xValue: "FEB", yValue: 200, type: .t1),
        ConsuptionData(xValue: "FEB", yValue: 400, type: .t2),
        ConsuptionData(xValue: "FEB", yValue: 800, type: .t3),

        ConsuptionData(xValue: "MAR", yValue: 200, type: .t1),
        ConsuptionData(xValue: "MAR", yValue: 400, type: .t2),
        ConsuptionData(xValue: "MAR", yValue: 800, type: .t3),

        ConsuptionData(xValue: "APR", yValue: 200, type: .t1),
        ConsuptionData(xValue: "APR", yValue: 400, type: .t2),
        ConsuptionData(xValue: "APR", yValue: 800, type: .t3),

        ConsuptionData(xValue: "MAY", yValue: 200, type: .t1),
        ConsuptionData(xValue: "MAY", yValue: 400, type: .t2),
        ConsuptionData(xValue: "MAY", yValue: 800, type: .t3),

        ConsuptionData(xValue: "JUN", yValue: 200, type: .t1),
        ConsuptionData(xValue: "JUN", yValue: 400, type: .t2),
        ConsuptionData(xValue: "JUN", yValue: 800, type: .t3),
    ]
}

struct NativeCharts: View {
    let viewModel = NativeChartsViewModel()

    var body: some View {
        Chart {
            ForEach(viewModel.data) { item in
                BarMark(
                    x: .value(item.xLabel, item.xValue),
                    y: .value(item.yLabel, item.yValue)
                )
                .cornerRadius(8)
                .foregroundStyle(by: .value("test", item.type.rawValue))
            }

            LineMark(
                x: .value("", "JAN"),
                y: .value("", 2000)
            )

            LineMark(
                x: .value("", "FEB"),
                y: .value("", 800)
            )

            LineMark(
                x: .value("", "MAR"),
                y: .value("", 1200)
            )

            LineMark(
                x: .value("", "APR"),
                y: .value("", 700)
            )

            LineMark(
                x: .value("", "MAY"),
                y: .value("", 10)
            )

            LineMark(
                x: .value("", "JUN"),
                y: .value("", 1600)
            )

        }
        .chartScrollableAxes(.horizontal)
        .padding(.horizontal)
        .padding(.vertical)
        .chartXVisibleDomain(length: 4)
        .chartYScale(range: .plotDimension(endPadding: 40))
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .chartForegroundStyleScale([
            ConsumptionType.t1.rawValue: .green,
            ConsumptionType.t2.rawValue: .gray,
            ConsumptionType.t3.rawValue: .orange,
        ])
    }
}

#Preview {
    NativeCharts()
}
