//
//  PatientInformationTableViewController.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 27/09/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class PatientInformationTableViewController: UITableViewController {
    
    //TODO: Implement model
    
    let rowCount = 10
    let headerHeight: CGFloat = 64
    lazy var rowHeights = [CGFloat].init(repeating: 0, count: self.rowCount)
    
    var headerView = PatientTableViewSectionHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.rgb(red: 235, green: 235, blue: 242)
        tableView.register(PatientTestTableViewCell.self, forCellReuseIdentifier: PatientTestTableViewCell.reuseIdentifier)
        tableView.allowsSelection = false
        
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -headerHeight)
        
        updateHeaderView()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeights[indexPath.item]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PatientTestTableViewCell.reuseIdentifier, for: indexPath) as! PatientTestTableViewCell
        rowHeights[indexPath.item] = cell.cellHeight
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return headerHeight
            
        default:
            return 0
        }
    }
    
    // MARK: Scroll handling
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    private func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -headerHeight, width: tableView.bounds.width, height: headerHeight)
        
        if tableView.contentOffset.y < -headerHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
        headerView.fontSize = 30 - tableView.contentOffset.y/8
    }
}
