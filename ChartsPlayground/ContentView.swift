//
//  ContentView.swift
//  ChartsPlayground
//
//  Created by Michael Planu on 10/03/25.
//

import SwiftUI

enum NavigableDestination {
    case aaInfographics
    case swiftUICharts
    case nativeCharts
}

struct NavigationLinkModel: Identifiable {
    let id = UUID()
    let name: String
    let destination: NavigableDestination
}

struct ContentView: View {
    let views: [NavigationLinkModel] = [
        NavigationLinkModel(name: "AAInfographics", destination: .aaInfographics),
        NavigationLinkModel(name: "SwiftUICharts", destination: .swiftUICharts),
        NavigationLinkModel(name: "Native Charts", destination: .nativeCharts)
    ]

    var body: some View {
        NavigationView {
            List(views) { item in
                // NavigationLink for each item in the list
                NavigationLink(destination: destinationView(for: item.destination)) {
                    Text(item.name)
                        .font(.headline)
                }
            }
            .navigationTitle("List Navigation") // Title for the navigation bar
        }
    }

    @ViewBuilder
    private func destinationView(for destination: NavigableDestination) -> some View {
        switch destination {
        case .aaInfographics:
            AAInfographicsView()
        case .swiftUICharts:
            SwiftUIChartsView()
        case .nativeCharts:
            NativeCharts()
        }
    }
}

#Preview {
    ContentView()
}
