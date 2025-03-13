//
//  ChartsPlaygroundVC.swift
//  ChartsPlayground
//
//  Created by Michael Planu on 12/03/25.
//

import UIKit
import SwiftUI
import AAInfographics
import SnapKit

class AAInfographicsVC: UIViewController {
    private lazy var aaChartView: AAChartView = {
        let view = AAChartView()
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        setupViews()
    }

    private func setupViews() {
        view.addSubview(aaChartView)

        aaChartView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }

        let aaChartModel = AAChartModel()
            .title("16年1月-16年11月充值客单分析")//图形标题
            .subtitle("BY MICVS")//图形副标题
            .chartType(.column)
            .stacking(.normal)
            .animationDuration(0)
            .legendEnabled(true)
            .tooltipEnabled(false)
            .colorsTheme([
                AAColor.green,
                AAColor.orange,
                AAColor.gray,
            ])
            .zoomType(.none)
            .series([
                AASeriesElement()
                    .name("新用户")
                    .data([82.89, 67.54, 62.07, 59.43, 67.02, 67.09, 35.66, 71.78, 81.61, 78.85, 79.12, 72.30]),
                AASeriesElement()
                    .name("老用户")
                    .data([198.66, 330.81, 151.95, 160.12, 222.56, 229.05, 128.53, 250.91, 224.47, 473.99, 126.85, 260.50]),
                AASeriesElement()
                    .name("总量")
                    .type(.line)
                    .data([281.55, 398.35, 214.02, 219.55, 289.57, 296.14, 164.18, 322.69, 306.08, 552.84, 205.97, 332.79])
            ])

        //The chart view object calls the instance object of AAChartModel and draws the final graphic
        aaChartView.aa_drawChartWithChartModel(aaChartModel)
    }
}

extension AAInfographicsVC: AAChartViewDelegate {
    open func aaChartView(_ aaChartView: AAChartView, clickEventMessage: AAClickEventMessageModel) {
        print(
            """

            clicked point series element name: \(clickEventMessage.name ?? "")
            🖱🖱🖱WARNING!!!!!!!!!!!!!!!!!!!! Click Event Message !!!!!!!!!!!!!!!!!!!! WARNING🖱🖱🖱
            ==========================================================================================
            ------------------------------------------------------------------------------------------
            user finger moved over!!!,get the move over event message: {
            category = \(String(describing: clickEventMessage.category))
            index = \(String(describing: clickEventMessage.index))
            name = \(String(describing: clickEventMessage.name))
            offset = \(String(describing: clickEventMessage.offset))
            x = \(String(describing: clickEventMessage.x))
            y = \(String(describing: clickEventMessage.y))
            }
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            
            
            """
        )
    }

    open func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel) {
        print(
            """

            moved over point series element name: \(moveOverEventMessage.name ?? "")
            ✋🏻✋🏻✋🏻✋🏻✋🏻WARNING!!!!!!!!!!!!!! Move Over Event Message !!!!!!!!!!!!!! WARNING✋🏻✋🏻✋🏻✋🏻✋🏻
            ==========================================================================================
            ------------------------------------------------------------------------------------------
            user finger moved over!!!,get the move over event message: {
            category = \(String(describing: moveOverEventMessage.category))
            index = \(String(describing: moveOverEventMessage.index))
            name = \(String(describing: moveOverEventMessage.name))
            offset = \(String(describing: moveOverEventMessage.offset))
            x = \(String(describing: moveOverEventMessage.x))
            y = \(String(describing: moveOverEventMessage.y))
            }
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            
            
            """
        )
    }
}

#Preview {
    AAInfographicsVC()
}

struct AAInfographicsView : UIViewControllerRepresentable {
    typealias UIViewControllerType = AAInfographicsVC

    func makeUIViewController(context: Context) -> AAInfographicsVC {
        return AAInfographicsVC()
    }

    func updateUIViewController(_ uiViewController: AAInfographicsVC, context: Context) {
        /* code here to make changes to the view controller if necessary when this view is updated*/
    }
}
