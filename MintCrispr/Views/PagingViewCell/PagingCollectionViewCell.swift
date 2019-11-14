//
//  PagingCollectionViewCell.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 22/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class PagingCollectionViewCell: UICollectionViewCell {
	
	//MARK: Variables
	var device: ScannerDevice! {
		didSet {
			
		}
	}
	
	public var willAnimateCell = false
	private let openCellOffset: CGFloat = 40
	public var isOpen: Bool = false {
		didSet {
			if oldValue != isOpen {
				setCellOpen(isOpen, animated: willAnimateCell)
			}
		}
	}
	
	//MARK: View components
	
	private let frontContainerView = FrontContainerView()
	private let rearContainerView = RearContainerView()
	
	
	// MARK: Initialisers
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: View Config

extension PagingCollectionViewCell {
	private func setupViews() {
		backgroundColor = .clear
		
		setupRearContainerView()
		setupFrontContainerView()
	}
	
	private func setupRearContainerView() {
		addSubview(rearContainerView)

		// Set the constraints for the rear view
		rearContainerView.widthConstraint = rearContainerView.widthAnchor.constraint(equalTo: self.widthAnchor)
		rearContainerView.closedCenterYConstraint = rearContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		rearContainerView.openCenterYConstraint = rearContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: openCellOffset)
		rearContainerView.openWidthConstraint = rearContainerView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.15)
		
		rearContainerView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
		rearContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		
		// Now set the relevant constaints to active
		rearContainerView.widthConstraint.isActive = true
		rearContainerView.closedCenterYConstraint.isActive = true
	}
	
	private func setupFrontContainerView() {
		addSubview(frontContainerView)

		// Set the constraints for the front view
		frontContainerView.widthConstraint = frontContainerView.widthAnchor.constraint(equalTo: self.widthAnchor)
		frontContainerView.closedCenterYConstraint = frontContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		frontContainerView.openCenterYConstraint = frontContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -openCellOffset)
		
		frontContainerView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
		frontContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		
		// now activate the constraints
		frontContainerView.widthConstraint.isActive = true
		frontContainerView.closedCenterYConstraint.isActive = true
	}
}

// MARK: cell dynamics

extension PagingCollectionViewCell {
	
	private func setCellOpen(_ cellWillOpen: Bool, animated: Bool) {
		self.frontContainerView.isOpen = cellWillOpen
		self.rearContainerView.isOpen = cellWillOpen
		
		if animated {
			UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
				self.layoutIfNeeded()
			}, completion: nil)
		} else {
			layoutIfNeeded()
		}
	}
}
