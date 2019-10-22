//
//  DeviceDetailLowerSectionView.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 20/09/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class DeviceDetailLowerSectionView: UIView {
	// Buttons
	private let beginScanButton: UIButton = {
		let btn = UIButton(type: .roundedRect)
		
		return btn
	}()
	
	private let disconnectButton: UIButton = {
		let btn = UIButton(type: .roundedRect)
		
		return btn
	}()
	
	private let viewFileButton: UIButton = {
		let btn = UIButton(type: .roundedRect)
		
		return btn
	}()
	
	private let cancelScanButton: UIButton = {
		let btn = UIButton(type: .roundedRect)
		
		return btn
	}()
	
	// Loading bar and conter
	private let loadingBarView: UIView = {
		let view = UIView()
		view.layer.cornerRadius = 6
		view.layer.masksToBounds = true
		
		return view
	}()
	
	private let loadingBarNumericalValueLable: UILabel = {
		let label = UILabel()
		label.text = "0%"
		label.textAlignment = .center
		
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
	
	// MARK: View construction
	
	private func setupViews() {
		backgroundColor = UIColor.rgb(red: 235, green: 235, blue: 242)
		displayInitialView()
	}
}

// MARK: Accessible methods

extension DeviceDetailLowerSectionView {
	public func displayInitialView() {
		//set buttons in the lower 2/3 of the view
		//TODO: this ^^
	}
	
	public func displayScanView() {
		//display the loading bar and the cancel btn
	}
	
	public func setScanCompletionPercentage(_ percentComplete: Double) {
		//modify the loading bar view to show the percentage complete
		
		//then set the label for loadingBarNumericalValueLable as an Int
	}
	
	public func displayScanCompleteView() {
		//animate the loading bar upwards
		
		//display the 'view file', 'New Scan' and 'Disconnect' btns
	}
}
