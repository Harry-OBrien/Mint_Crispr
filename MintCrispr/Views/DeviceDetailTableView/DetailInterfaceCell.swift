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
	
	let bluetoothStatusLable: UILabel = {
		let label = UILabel()
		
		
		return label
	}()
	
	let sensorStatusLabel: UILabel = {
		let label = UILabel()
		
		return label
	}()
	
	let cardInsertedStatusLabel: UILabel = {
		let label = UILabel()
		
		return label
	}()
	
	let readyStatusLabel: UILabel = {
		let label = UILabel()
		
		return label
	}()
	
	let scanNowButton: UIButton = {
		let btn = UIButton()
		
		return btn
	}()
	
	let recentScansLabel: UILabel = {
		let label = UILabel()
		
		return label
	}()
	
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
		backgroundColor = UIColor(white: 0.95, alpha: 1)
	}
}




