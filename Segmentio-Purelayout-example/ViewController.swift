//
//  ViewController.swift
//  Segmentio-Purelayout-example
//
//  Created by Mohamed Saleh on 10/6/16.
//  Copyright © 2016 Venta Apps. All rights reserved.
//

import UIKit
import PureLayout
import Segmentio

class ViewController: UIViewController {
    var segmentioStyle = SegmentioStyle.ImageUnderLabel
    // Segmentio View
    var segmentioView: Segmentio = {
        let view = Segmentio.newAutoLayoutView()
        return view
    }()
    // another View
    var anotherView: UIView = {
        let view = UIView.newAutoLayoutView()
        return view
    }()
    var didSetupConstraints = false
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        view.addSubview(segmentioView)
        view.addSubview(anotherView)
        
        segmentioView.backgroundColor = UIColor.orangeColor()
        anotherView.backgroundColor = UIColor.greenColor()
        
        view.setNeedsUpdateConstraints() // bootstrap Auto Layout
    }
    override func updateViewConstraints() {
        if (!didSetupConstraints) {
            // segmentioView
            segmentioView.autoPinToTopLayoutGuideOfViewController(self, withInset: 0.0)
            segmentioView.autoPinEdgeToSuperviewEdge(.Leading)
            segmentioView.autoPinEdgeToSuperviewEdge(.Trailing)
            segmentioView.autoPinEdge(.Bottom, toEdge: .Top, ofView: anotherView, withOffset: 0.0)
            segmentioView.autoSetDimension(.Height, toSize: 150)
            // anotherView
            anotherView.autoPinEdgeToSuperviewEdge(.Leading)
            anotherView.autoPinEdgeToSuperviewEdge(.Trailing)
            anotherView.autoPinToBottomLayoutGuideOfViewController(self, withInset: 0.0)
            
            didSetupConstraints = true
        }
        
        super.updateViewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setupSegmentioView()
        
    }
    
    // MARK:- SelctionView Segmentio
    func setupSegmentioView() {
        segmentioView.setup(
            content: segmentioContent(),
            style: segmentioStyle,
            options: segmentioOptions()
        )
        
        segmentioView.selectedSegmentioIndex = selectedSegmentioIndex()
        
        segmentioView.valueDidChange = { [weak self] _, segmentIndex in

        }
    }
    
    private func segmentioContent() -> [SegmentioItem] {
        return [
            SegmentioItem(title: "Contacts", image: UIImage(named: "750-home")),
            SegmentioItem(title: "About Us", image: UIImage(named: "724-info")),
            SegmentioItem(title: "Our Location", image: UIImage(named: "852-map")),
            SegmentioItem(title: "Get in touch!", image: UIImage(named: "730-envelope"))
        ]
    }
    private func segmentioOptions() -> SegmentioOptions {
        var imageContentMode = UIViewContentMode.Center
        switch segmentioStyle {
        case .ImageBeforeLabel, .ImageAfterLabel:
            imageContentMode = .ScaleAspectFit
        default:
            break
        }
        
        return SegmentioOptions(
            backgroundColor: ColorPalette.WhiteColor,
            maxVisibleItems: 3,
            scrollEnabled: true,
            indicatorOptions: segmentioIndicatorOptions(),
            horizontalSeparatorOptions: segmentioHorizontalSeparatorOptions(),
            verticalSeparatorOptions: segmentioVerticalSeparatorOptions(),
            imageContentMode: imageContentMode,
            labelTextAlignment: .Center,
            segmentStates: segmentioStates()
        )
    }
    private func segmentioStates() -> SegmentioStates {
        let font = UIFont.avenirMediumWithSize(13)
        return SegmentioStates(
            defaultState: segmentioState(
                backgroundColor: UIColor.clearColor(),
                titleFont: font,
                titleTextColor: ColorPalette.GrayChateauColor
            ),
            selectedState: segmentioState(
                backgroundColor: UIColor.clearColor(),
                titleFont: font,
                titleTextColor: ColorPalette.BlackColor
            ),
            highlightedState: segmentioState(
                backgroundColor: ColorPalette.WhiteSmokeColor,
                titleFont: font,
                titleTextColor: ColorPalette.GrayChateauColor
            )
        )
    }
    private func segmentioState(backgroundColor backgroundColor: UIColor, titleFont: UIFont, titleTextColor: UIColor) -> SegmentioState {
        return SegmentioState(backgroundColor: backgroundColor, titleFont: titleFont, titleTextColor: titleTextColor)
    }
    private func segmentioIndicatorOptions() -> SegmentioIndicatorOptions {
        return SegmentioIndicatorOptions(
            type: .Bottom,
            ratio: 1,
            height: 5,
            color: ColorPalette.CoralColor
        )
    }
    private func segmentioHorizontalSeparatorOptions() -> SegmentioHorizontalSeparatorOptions {
        return SegmentioHorizontalSeparatorOptions(
            type: .TopAndBottom,
            height: 1,
            color: ColorPalette.WhiteSmokeColor
        )
    }
    private func segmentioVerticalSeparatorOptions() -> SegmentioVerticalSeparatorOptions {
        return SegmentioVerticalSeparatorOptions(
            ratio: 1,
            color: ColorPalette.WhiteSmokeColor
        )
    }
    private func selectedSegmentioIndex() -> Int {
        return 0
    }
    private func setupBadgeCountForIndex() {
        segmentioView.setupBadgeAtIndex(1, count: 3, color: ColorPalette.WhiteSmokeColor)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

