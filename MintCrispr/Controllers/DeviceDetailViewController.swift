//
//  DeviceDetailViewController.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 14/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class DeviceDetailViewController: UIViewController {
	
	//TODO: Add 'pull down to return' (inc. animations)
	
	// Model
	var device: ScannerDevice? {
		didSet {

		}
	}
	
	// MARK: Visual components
	// Upper and lower sections
	private let topSectionContainerView = DeviceDetailUpperSectionView()
	private let bottomSectionContainerView = DeviceDetailLowerSectionView()
	
	// MARK: Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setCustomNavBarButtons()
		setupView()
	}
}

// MARK: View components

extension DeviceDetailViewController {
	
	private func setCustomNavBarButtons() {
		//TODO: override the default back btn
	}
	
	private func setupView() {
		view.backgroundColor = .white
		view.addSubview(topSectionContainerView)
		view.addSubview(bottomSectionContainerView)
		
		view.addConstraintsWith(format: "H:|[v0]|", views: topSectionContainerView)
		view.addConstraintsWith(format: "H:|[v0]|", views: bottomSectionContainerView)
		
		view.addConstraintsWith(format: "V:|[v0][v1]|", views: topSectionContainerView, bottomSectionContainerView)
		view.addConstraint(NSLayoutConstraint(item: bottomSectionContainerView, attribute: .height, relatedBy: .equal, toItem: topSectionContainerView, attribute: .height, multiplier: 1.9, constant: 0))
	}
}
