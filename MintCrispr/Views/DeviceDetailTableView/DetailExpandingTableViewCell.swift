//
//  DetailExpandingTableViewCell.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 20/11/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class DetailExpandingTableViewCell: UITableViewCell {
	
	var isOpen: Bool = false {
		didSet {
			print(isOpen)
			testCountLabel.isHidden = !isOpen
			resultsTable.isHidden = !isOpen
			layoutSubviews()
		}
	}
	
	// MARK: View Components
	
	private let patientNameLabel: UILabel = {
		let label = UILabel()
		let attributedText = NSMutableAttributedString(string: "Patient:",
													   attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,.font : UIFont.systemFont(ofSize: 14, weight: .semibold)])
		attributedText.append(NSAttributedString(string: "\tHarry O'Brien", attributes: [.font : UIFont.systemFont(ofSize: 14, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor(white: 0.4, alpha: 1)]))
		label.attributedText = attributedText
		
		return label
	}()
	
	private let dateLabel: UILabel = {
		let label = UILabel()
		let df = DateFormatter()
		df.dateStyle = .short
		let attributedText = NSMutableAttributedString(string: "Date:",
													   attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,.font : UIFont.systemFont(ofSize: 14, weight: .semibold)])
		attributedText.append(NSAttributedString(string: "\t\(df.string(from: Date()))", attributes: [.font : UIFont.systemFont(ofSize: 14, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor(white: 0.4, alpha: 1)]))
		label.attributedText = attributedText
		
		return label
	}()
	
	private let dateNameContainer = UIView()
	
	private let testCountLabel: UILabel = {
		let label = UILabel()
		label.text = "Tests: "
		label.font = UIFont.systemFont(ofSize: 18)
		
		let attributedText = NSMutableAttributedString(string: "Tests:",
													   attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,.font : UIFont.systemFont(ofSize: 18, weight: .semibold)])
		attributedText.append(NSAttributedString(string: "\t6 Performed", attributes: [.font : UIFont.systemFont(ofSize: 18, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor(white: 0.4, alpha: 1)]))
		label.attributedText = attributedText
		
		return label
	}()
	
	private let resultsTable = ResultsTableView()

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

extension DetailExpandingTableViewCell {
	private func setupViews() {
		resultsTable.dataSource = self
		resultsTable.delegate = self
		
		dateNameContainer.addSubview(patientNameLabel)
		dateNameContainer.addSubview(dateLabel)
		dateNameContainer.addConstraintsWith(format: "H:|[v0]-[v1(v0)]-|", views: patientNameLabel, dateLabel)
		dateNameContainer.addConstraintsWith(format: "V:|[v0]|", views: patientNameLabel)
		dateNameContainer.addConstraintsWith(format: "V:|[v0]|", views: dateLabel)
		
		addSubview(dateNameContainer)
		addSubview(testCountLabel)
		addSubview(resultsTable)
		
		addConstraintsWith(format: "H:|-[v0]-|", views: dateNameContainer)
		addConstraintsWith(format: "H:|-[v0]-|", views: testCountLabel)
		addConstraintsWith(format: "H:|-[v0]-|", views: resultsTable)
		addConstraintsWith(format: "V:|-[v0]-[v1]-[v2(\(resultsTable.rowHeight * 6))]-|", views: dateNameContainer,testCountLabel, resultsTable)
		
		testCountLabel.isHidden = true
		resultsTable.isHidden = true
	}
}

// MARK: Table View Datasource

extension DetailExpandingTableViewCell: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 6
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ResultsTableViewCell.reuseIdentifier) as! ResultsTableViewCell
		//        cell.test = testGroup.testsPerformed[indexPath.item]
		//        cell.testIndex = indexPath.item
		
		return cell
	}
	
	
}
