//
//  RearContainerView.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 31/10/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class RearContainerView: PagingCellSectionView {
	
	// MARK: View Components
	
	private let LastOnlineLabel: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 16, weight: .thin)
		label.textAlignment = .center
		return label
	}()
	
	public var openWidthConstraint: NSLayoutConstraint!
	
	// MARK: View Setup
	
	override func setupViews() {
		super.setupViews()
		backgroundColor = .white
		addShadow(opacity: 0.2, offset: CGSize(width: 0, height: 2))
	}
	
	override var isOpen: Bool {
		didSet {
			if isOpen {
				widthConstraint.isActive = false
				openWidthConstraint.isActive = true
			} else {
				openWidthConstraint.isActive = false
				widthConstraint.isActive = true
			}
		}
	}
}

