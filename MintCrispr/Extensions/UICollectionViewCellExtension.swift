//
//  UICollectionViewCellExtension.swift
//  Employ
//
//  Created by Harry O'Brien on 18/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

//collection view cell
protocol CollectionViewCellIdentifiable {
	static var reuseIdentifier: String { get }
}

extension CollectionViewCellIdentifiable where Self: UICollectionViewCell {
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}

extension UICollectionViewCell: CollectionViewCellIdentifiable {}


//reusable view
protocol CollectionReusableViewIdentifiable {
	static var reuseIdentifier: String { get }
}

extension CollectionReusableViewIdentifiable where Self: UICollectionReusableView {
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}

extension UICollectionReusableView: CollectionReusableViewIdentifiable {}

