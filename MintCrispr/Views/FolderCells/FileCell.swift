//
//  FileCell.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 14/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class BaseFileCell: UICollectionViewCell {
	
	// MARK: - Components
	
	let folderIcon: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFit
		iv.image = UIImage(named: "folder_icon_3")
		return iv
	}()
	
	// MARK: - Initialisers
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - View setup
	
	internal func setupViews() {
		backgroundColor = .white
		layer.cornerRadius = 16
		layer.masksToBounds = true
		addShadow(opacity: 0.1, offset: CGSize(width: 0, height: 3))
	}
}

class LargeFileCell: BaseFileCell {
	
	// MARK: - Components
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
		label.text = "Unsorted patients"
	
		return label
	}()
	
	// MARK: - View Setup
	
	override func setupViews(){
		super.setupViews()
		
		addSubview(titleLabel)
		addSubview(folderIcon)
		addConstraintsWith(format: "H:|-10-[v0(80)]-20-[v1]|", views: folderIcon, titleLabel)
		addConstraintsWith(format: "V:|-10-[v0]-10-|", views: folderIcon)
		addConstraintsWith(format: "V:|-10-[v0]-10-|", views: titleLabel)
	}
}

class MediumFileCell: BaseFileCell {
	
	// MARK: - Components
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 3
		label.textAlignment = .center
		label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
		label.text = "Folder Name"
		
		return label
	}()

	// MARK: - View Setup
	
	override func setupViews(){
		super.setupViews()
		
		addSubview(titleLabel)
		addSubview(folderIcon)
		addConstraintsWith(format: "H:|-10-[v0(50)]-10-[v1]|", views: folderIcon, titleLabel)
		addConstraintsWith(format: "V:|-10-[v0]-10-|", views: folderIcon)
		addConstraintsWith(format: "V:|-10-[v0]-10-|", views: titleLabel)
	}
}
