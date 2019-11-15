//
//  ResultsTableViewCell.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 01/11/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
	
	// MARK: Data
	
	var test: Test! {
		didSet {
			diseaseUnderTestLabel.text = test.diseaseUnderTest
			
			resultLabel.textColor = (test.result) ? UIColor.green : UIColor.red
			resultLabel.text = (test.result) ? "Positive" : "Negative"
		}
	}
	var testIndex: Int! {
		didSet {
			indexLabel.text = String(testIndex) + " )"
		}
	}
	
	// MARK: View Components
	
	let indexLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16)
		label.text = "1 )"
		
		return label
	}()
	
	let diseaseUnderTestLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = UIColor(white: 0.4, alpha: 1)
		label.text = "Malaria"
		
		return label
	}()
	
	let resultLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = UIColor.red
		label.text = "Negative"
		
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

extension ResultsTableViewCell {
	private func setupViews() {
        backgroundColor = UIColor(white: 0.99, alpha: 1)
        
		addSubview(indexLabel)
		addSubview(diseaseUnderTestLabel)
		addSubview(resultLabel)
		
		indexLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		diseaseUnderTestLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		resultLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		
		addConstraintsWith(format: "H:|-[v0(30)]-[v1]-[v2]|", views: indexLabel, diseaseUnderTestLabel, resultLabel)
		diseaseUnderTestLabel.widthAnchor.constraint(equalTo: resultLabel.widthAnchor, multiplier: 1.5).isActive = true
	}
}
