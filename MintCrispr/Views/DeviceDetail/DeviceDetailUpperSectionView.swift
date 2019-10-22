//
//  DeviceDetailUpperSectionView.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 20/09/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class DeviceDetailUpperSectionView: UIView {
	
	// Device name label
	let deviceNameTitleLable: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 42)
		label.numberOfLines = 2
		label.lineBreakMode = .byTruncatingTail
		label.textColor = .black
		label.textAlignment = .center
		label.text = "Scanner 1"
		
		return label
	}()
	
	// MARK: Initialiser
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: View construction

extension DeviceDetailUpperSectionView {
	private func setupViews() {
		backgroundColor = UIColor.rgb(red: 83, green: 182, blue: 138)
		addSubview(deviceNameTitleLable)
		
		addConstraintsWith(format: "H:|[v0]|", views: deviceNameTitleLable)
		addConstraintsWith(format: "V:|-44-[v0]|", views: deviceNameTitleLable)
	}
}
