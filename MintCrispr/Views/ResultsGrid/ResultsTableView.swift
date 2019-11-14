//
//  ResultsTableView.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 01/11/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class ResultsTableView: UITableView {

	// MARK: Vars
	
	var testGroup: TestGroup!

	var heightForTableView: CGFloat {
		get {
			if let count = testGroup?.testCount {
				return self.rowHeight * CGFloat(count)
			}
			else {
				return 0
			}
		}
	}
	
	// MARK: Initialisers
	
	override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: style)
		
		rowHeight = 60
		register(ResultsTableViewCell.self, forCellReuseIdentifier: ResultsTableViewCell.reuseIdentifier)
		allowsSelection = false
		layer.borderWidth = 0.4
		layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Data Source
	
	override func numberOfRows(inSection section: Int) -> Int {
		return 6//testGroup.testCount
	}
	
	override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
		let cell = dequeueReusableCell(withIdentifier: ResultsTableViewCell.reuseIdentifier) as! ResultsTableViewCell
		
//		cell.test = testGroup.testsPerformed[indexPath.item]
//		cell.testIndex = indexPath.item
		
		return cell
	}
	
	
}
