//
//  UITableViewExtension.swift
//  Employ
//
//  Created by Harry O'Brien on 11/09/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

protocol TableViewCellIdentifiable {
	static var reuseIdentifier: String { get }
}

extension TableViewCellIdentifiable where Self: UITableViewCell {
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}

extension UITableViewCell: TableViewCellIdentifiable {}



