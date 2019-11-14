//
//  PagingCellContainerView.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 31/10/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class PagingCellContainerView: UIView {
	
	public var widthConstraint: NSLayoutConstraint!
	public var closedCenterYConstraint: NSLayoutConstraint!
	public var openCenterYConstraint: NSLayoutConstraint!
	
	// MARK: Initialisers
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: View Setup
	
	internal func setupViews() {
		backgroundColor = .white
		layer.masksToBounds = true
		layer.cornerRadius = 5
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	// MARK: Dynamics
	public var isOpen: Bool = false {
		didSet {
			// NB: We have to do it like this so that we don't have conflicting constraints (note the order of operations here)
			if isOpen {
				closedCenterYConstraint.isActive = false
				openCenterYConstraint.isActive = true
			}
			else {
				openCenterYConstraint.isActive = false
				closedCenterYConstraint.isActive = true
			}
			
		}
	}
}
