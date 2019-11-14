//
//  FolderCollectionViewCell.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 14/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class FolderCollectionViewCell: UICollectionViewCell {
	
	// MARK: Visual Components
	
	private let folderIcon: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFit
		iv.image = UIImage(named: "folder_icon_3")
		
		return iv
	}()
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 3
		label.textAlignment = .left
		label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
		label.text = "Harry O'Brien"
		
		return label
	}()
	
	// MARK: Vars
	var textIsCentered = false {
		didSet {
			titleLabel.textAlignment = textIsCentered ? .center : .left
		}
	}
	
	// MARK: Initialisers
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: View setup

extension FolderCollectionViewCell {
	
	internal func setupViews() {
		backgroundColor = .white
		layer.cornerRadius = 16
		layer.masksToBounds = true
		
		addSubview(titleLabel)
		addSubview(folderIcon)
		
		addConstraintsWith(format: "H:|-[v0(50)]-[v1]-|", views: folderIcon, titleLabel)
		addConstraintsWith(format: "V:|-[v0]-|", views: folderIcon)
		addConstraintsWith(format: "V:|-[v0]-|", views: titleLabel)
	}
}
