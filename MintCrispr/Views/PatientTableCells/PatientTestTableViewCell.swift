//
//  PatientTestTableViewCell.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 01/11/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class PatientTestTableViewCell: UITableViewCell {
	
	// MARK: View Components
	let patientDateContainerView = UIView()
	let patientNameLabel: UILabel = {
		let label = UILabel()
		let attributedText = NSMutableAttributedString(string: "Patient:\t",
													   attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,.font : UIFont.systemFont(ofSize: 16, weight: .semibold)])
		attributedText.append(NSAttributedString(string: "Harry O'Brien", attributes: [.font : UIFont.systemFont(ofSize: 16, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor(white: 0.6, alpha: 1)]))
		label.attributedText = attributedText
		
		return label
	}()
	
	let timeStampLabel: UILabel = {
		let label = UILabel()
		let attributedText = NSMutableAttributedString(string: "Date:\t",
													   attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,.font : UIFont.systemFont(ofSize: 16, weight: .semibold)])
		attributedText.append(NSAttributedString(string: "26/10/19", attributes: [.font : UIFont.systemFont(ofSize: 16, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor(white: 0.6, alpha: 1)]))
		label.attributedText = attributedText
		
		return label
	}()
	
	let resultsTable: ResultsTableView = {
		let table = ResultsTableView()
		
		return table
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

extension PatientTestTableViewCell {
	private func setupViews() {
		//
	}
}
