//
//  ResultsTableView.swift
//  MintCrispr
//
//  Created by Harry on 14/11/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class ResultsTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        register(ResultsTableViewCell.self, forCellReuseIdentifier: ResultsTableViewCell.reuseIdentifier)
        
        allowsSelection = false
//        separatorStyle = .none
        rowHeight = 45
        layer.borderWidth = 0.8
        layer.borderColor = UIColor(white: 0.4, alpha: 0.4).cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
