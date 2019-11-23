//
//  PatientTestTableViewCell.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 01/11/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class PatientTestTableViewCell: UITableViewCell {
    
    // MARK: - Vars
    
    var patient: Patient! {
        didSet {
        }
    }
    
    // MARK: View Components
    
    let timeStampLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Date:",
                                                       attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,.font : UIFont.systemFont(ofSize: 18, weight: .semibold)])
        attributedText.append(NSAttributedString(string: "\t26/10/19", attributes: [.font : UIFont.systemFont(ofSize: 18, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor(white: 0.4, alpha: 1)]))
        label.attributedText = attributedText
        
        return label
    }()
    
    let testCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Tests: "
        
        let attributedText = NSMutableAttributedString(string: "Tests:",
                                                       attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,.font : UIFont.systemFont(ofSize: 18, weight: .semibold)])
        attributedText.append(NSAttributedString(string: "\t8 Performed", attributes: [.font : UIFont.systemFont(ofSize: 18, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor(white: 0.4, alpha: 1)]))
        label.attributedText = attributedText
        
        return label
    }()
    
    let resultsTable = ResultsTableView()
    
    var cellHeight: CGFloat {
        get {
            return resultsTable.rowHeight * 6 + 82
        }
    }
    
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
        resultsTable.dataSource = self
        resultsTable.delegate = self
        
        addSubview(timeStampLabel)
        addSubview(testCountLabel)
        addSubview(resultsTable)
        
        addConstraintsWith(format: "H:|-[v0]-|", views: timeStampLabel)
        addConstraintsWith(format: "H:|-[v0]-|", views: testCountLabel)
        addConstraintsWith(format: "H:|-[v0]-|", views: resultsTable)
        addConstraintsWith(format: "V:|-[v0]-[v1]-[v2(\(resultsTable.rowHeight * 6))]-|", views: timeStampLabel, testCountLabel, resultsTable)
    }
}

// MARK: Table View Datasource

extension PatientTestTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6//testGroup.testCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultsTableViewCell.reuseIdentifier) as! ResultsTableViewCell
//        cell.test = testGroup.testsPerformed[indexPath.item]
//        cell.testIndex = indexPath.item
        
        return cell
    }
}
