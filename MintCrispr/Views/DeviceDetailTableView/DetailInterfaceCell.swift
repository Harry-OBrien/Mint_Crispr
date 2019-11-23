//
//  DetailInterfaceCell.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 20/11/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class DetailInterfaceCell: UITableViewCell {
	
	// MARK: View Components
	
	
	// MARK: Initialisers
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: View Setup

extension DetailInterfaceCell {
	private func setupViews() {
		backgroundColor = .orange //UIColor(white: 0.2, alpha: 1)
	}
}




