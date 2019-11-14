//
//  RecentFoldersHeaderView.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 01/11/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class RecentFoldersHeaderView: UICollectionReusableView {
	
	// MARK: View Components
	
	private let headerLabel: UILabel = {
		let label = UILabel()
		label.attributedText = NSAttributedString(string: "Recents", attributes:
			[.kern : 1.3, .underlineStyle: NSUnderlineStyle.single.rawValue, .font : UIFont(name: "HelveticaNeue-CondensedBold", size: 30)!])
		
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

// MARK: View setup

extension RecentFoldersHeaderView {
	private func setupViews() {
		addSubview(headerLabel)
		
		addConstraintsWith(format: "H:|-[v0]-|", views: headerLabel)
		addConstraintsWith(format: "V:|[v0]|", views: headerLabel)
	}
}
