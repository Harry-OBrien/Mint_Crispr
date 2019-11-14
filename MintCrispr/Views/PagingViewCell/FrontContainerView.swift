//
//  FrontContainerView.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 31/10/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class FrontContainerView: PagingCellContainerView {
	
	// MARK: View Components
	
	private let DeviceNameTitleLable: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 42)
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.textColor = .black
		label.textAlignment = .center
		
		return label
	}()
	

//	frontContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -openCellOffset).isActive = true
//	rearContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: +openCellOffset).isActive = true
	
	// MARK: View Setup

	override func setupViews() {
		super.setupViews()
		
		addShadow(opacity: 0.5, offset: CGSize(width: 0, height: 4))
		
		addSubview(DeviceNameTitleLable)
		addConstraintsWith(format: "H:|-[v0]-|", views: DeviceNameTitleLable)
		addConstraintsWith(format: "V:|-[v0]", views: DeviceNameTitleLable)
		
	}

}
