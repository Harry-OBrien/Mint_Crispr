//
//  FrontContainerView.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 31/10/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class FrontContainerView: PagingCellSectionView {
	
	// MARK: View Components
	
	private let DeviceNameTitleLable: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 42)
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.textColor = .black
		label.textAlignment = .center
		label.text = "Blood Scanner 1"
		
		return label
	}()
	
	let backgroundGradientView = PagingCellSectionView()
	
	// MARK: View Setup

	override func setupViews() {
		super.setupViews()
		addShadow(opacity: 0.5, offset: CGSize(width: 0, height: 4))
		embedInsideSafeArea(backgroundGradientView)
		
		addSubview(DeviceNameTitleLable)
		addConstraintsWith(format: "H:|-[v0]-|", views: DeviceNameTitleLable)
		addConstraintsWith(format: "V:|-[v0]", views: DeviceNameTitleLable)
	}
}
