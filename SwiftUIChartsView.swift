//
//  SwiftUIChartsView.swift
//  ChartsPlayground
//
//  Created by Michael Planu on 13/03/25.
//

import SwiftUI
import SwiftUICharts

struct SwiftUIChartsView: View {

    let stackData = stackData()
//    let extraLineData = extraLineData()

    private var extraLineData: [ExtraLineDataPoint] {
        [
            ExtraLineDataPoint(value: 200),
            ExtraLineDataPoint(value: 90),
            ExtraLineDataPoint(value: 700),
            ExtraLineDataPoint(value: 175),
        ]
    }
    
    private var extraLineStyle: ExtraLineStyle {
        ExtraLineStyle(lineColour: ColourStyle(colour: .gray),
                       lineType: .line,
                       lineSpacing: .bar,
                       markerType: .topLeading(attachment: .point, colour: .black, style: .init()),
                       yAxisTitle: "Bob",
                       yAxisNumberOfLabels: 7,
                       animationType: .raise,
                       baseline: .zero)
    }


    var body: some View {
        StackedBarChart(chartData: stackData)
            .extraLine(chartData: stackData, legendTitle: "Title", datapoints: extraLineData, style: extraLineStyle)
            .touchOverlay(chartData: stackData)
            .yAxisGrid(chartData: stackData)
            .xAxisLabels(chartData: stackData)
            .yAxisLabels(chartData: stackData)
        //            .headerBox(chartData: data)
        //            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .id(stackData.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
    }
}

extension SwiftUIChartsView {
//    static func extraLineData() -> ExtraLineData {
//        enum Group {
//            case england
//            case scotland
//            case wales
//
//            var data : GroupingData {
//                switch self {
//                case .england:
//                    return GroupingData(title: "England" , colour: ColourStyle(colour: .red))
//                case .scotland:
//                    return GroupingData(title: "Scotland", colour: ColourStyle(colour: .blue))
//                case .wales:
//                    return GroupingData(title: "Wales"   , colour: ColourStyle(colour: .green))
//                }
//            }
//        }
//
//        var extraLineData: [ExtraLineDataPoint] {
//            [ExtraLineDataPoint(value: 200),
//             ExtraLineDataPoint(value: 90),
//             ExtraLineDataPoint(value: 700),
//             ExtraLineDataPoint(value: 175),
//             ExtraLineDataPoint(value: 60),
//             ExtraLineDataPoint(value: 100),
//             ExtraLineDataPoint(value: 600)]
//        }
//
//
//        return ExtraLineData(legendTitle: "Title", dataPoints: extraLineData)
//    }

    static func stackData() -> StackedBarChartData {
        enum Group {
            case england
            case scotland
            case wales

            var data : GroupingData {
                switch self {
                case .england:
                    return GroupingData(title: "England" , colour: ColourStyle(colour: .red))
                case .scotland:
                    return GroupingData(title: "Scotland", colour: ColourStyle(colour: .blue))
                case .wales:
                    return GroupingData(title: "Wales"   , colour: ColourStyle(colour: .green))
                }
            }
        }

        let groups: [GroupingData] = [Group.england.data, Group.scotland.data, Group.wales.data]

        let data = StackedBarDataSets(dataSets: [
            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 100, description: "Q1 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 500, description: "Q1 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 300, description: "Q1 Sales", group: Group.wales.data),
            ], setTitle: "Q1"),

            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 200, description: "Q2 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 600, description: "Q2 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 400, description: "Q2 Sales", group: Group.wales.data),
            ], setTitle: "Q2"),

            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 300, description: "Q3 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 700, description: "Q3 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 300, description: "Q3 Sales", group: Group.wales.data),
            ], setTitle: "Q3"),

            StackedBarDataSet(dataPoints: [
                 StackedBarDataPoint(value: 400, description: "Q4 Sales", group: Group.england.data),
                 StackedBarDataPoint(value: 800, description: "Q4 Sales", group: Group.scotland.data),
                 StackedBarDataPoint(value: 200, description: "Q4 Sales", group: Group.wales.data),
            ], setTitle: "Q4")
        ])

        return StackedBarChartData(dataSets: data,
                                   groups: groups,
                                   metadata: ChartMetadata(title: "Haggis Sales", subtitle: "Per Quarter"),
                                   xAxisLabels: ["One", "Two", "Three"],
                                   barStyle: BarStyle(barWidth: 0.5),
                                   chartStyle: BarChartStyle(infoBoxPlacement: .header,
                                                             xAxisLabelsFrom: .dataPoint(rotation: .degrees(0)),
                                                             yAxisGridStyle: GridStyle(numberOfLines: 8,
                                                                                       lineColour: Color.gray.opacity(0.25)),
                                                             yAxisNumberOfLabels: 8,
                                                             baseline: .zero,
                                                             topLine: .maximum(of: 1600)))
    }
}


#Preview {
    SwiftUIChartsView()
}
