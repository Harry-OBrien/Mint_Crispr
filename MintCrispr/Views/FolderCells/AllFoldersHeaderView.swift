//
//  AllFoldersHeaderView.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 01/11/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class AllFoldersHeaderView: UICollectionReusableView {
	
	// MARK: View Components
	
	private let headerLabel: UILabel = {
		let label = UILabel()
		label.attributedText = NSAttributedString(string: "A - Z", attributes:
			[.underlineStyle: NSUnderlineStyle.single.rawValue, .font : UIFont(name: "HelveticaNeue-CondensedBold", size: 30)!])
		
		return label
	}()
	
	private let lineDividerView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
		return view
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

extension AllFoldersHeaderView {
	private func setupViews() {
		addSubview(lineDividerView)
		addSubview(headerLabel)
		
		addConstraintsWith(format: "H:|-[v0]-|", views: lineDividerView)
		addConstraintsWith(format: "H:|-[v0]-|", views: headerLabel)
		addConstraintsWith(format: "V:|-[v0(0.6)]-[v1]-|", views: lineDividerView, headerLabel)
	}
}
