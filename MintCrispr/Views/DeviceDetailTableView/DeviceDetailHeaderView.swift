//
//  DetailHeaderView.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 20/11/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class DeviceDetailHeaderView: UIView {
	
	// MARK: View Components
	
	public let backgroundGradientImageView: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFill
		
		return iv
	}()
	
	public var fontSize: CGFloat = 34 {
		didSet {
			DeviceNameTitleLable.font = UIFont(name: "HelveticaNeue-CondensedBold", size: fontSize)
		}
	}
			
	private let DeviceNameTitleLable: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 34)
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.textColor = .black
		label.textAlignment = .center
		label.text = "Blood Scanner 1"
		
		return label
	}()
			
//	override var frame: CGRect {
//		didSet {
//			gradientLayer.frame = self.bounds
//		}
//	}
	
	// MARK: Initialisers
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension DeviceDetailHeaderView {
	private func setupViews() {
		layer.masksToBounds = true
		backgroundColor = .clear//UIColor(r: 34, g: 96, b: 134)
		embedInsideSafeArea(backgroundGradientImageView)
		
		addSubview(DeviceNameTitleLable)
		addConstraintsWith(format: "H:|-[v0]-|", views: DeviceNameTitleLable)
		addConstraintsWith(format: "V:|-90-[v0]-|", views: DeviceNameTitleLable)
	}
}
