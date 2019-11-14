//
//  PatientTableViewSectionHeader.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 01/11/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class PatientTableViewSectionHeader: UIView {
	
	// MARK: View Components
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.attributedText = NSAttributedString(string: "Harry O'Brien", attributes: [.kern : 1.3, .underlineStyle: NSUnderlineStyle.single.rawValue, .font : UIFont(name: "HelveticaNeue-CondensedBold", size: 30)!])
		
		return label
	}()
	
	// MARK: Initialisers
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: View Setup

extension PatientTableViewSectionHeader {
	private func setupViews() {
		backgroundColor = .white
		addSubview(titleLabel)
		addConstraintsWith(format: "H:|-[v0]-|", views: titleLabel)
		addConstraintsWith(format: "V:|[v0]|", views: titleLabel)
	}
}
