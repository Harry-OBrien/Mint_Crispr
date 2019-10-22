//
//  PatientCollectionViewCell.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 21/09/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class PatientCollectionViewCell: UITableViewCell {
	
	var willShowDragDropIcon = true {
		didSet {
			selectorIcon.isHidden = !willShowDragDropIcon
		}
	}
	
	var isopen = false
	
	static let defaultCellHeight: CGFloat = 60
	static let expandedCellHeight: CGFloat = 300
	
	var currentHeight: CGFloat {
		get {
			return isopen ? PatientCollectionViewCell.expandedCellHeight : PatientCollectionViewCell.defaultCellHeight
		}
	}
	
	private let cellInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
	
	private let patientNameLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 2
		let attributedText = NSMutableAttributedString(string: "Patient Name:\n\t",
													   attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 13)!]
		)

		attributedText.append(NSAttributedString(string: "Harry O'Brien",
												 attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-LightItalic", size: 10)!]))

		label.attributedText = attributedText
		
		return label
	}()
	
	private let scanDateLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 2
		let attributedText = NSMutableAttributedString(string: "Scan Date:\n\t",
													   attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 13)!]
		)
		let df = DateFormatter()
		df.dateStyle = .medium
		attributedText.append(NSAttributedString(string: df.string(from: Date()),
												 attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-LightItalic", size: 10)!]))

		label.attributedText = attributedText
		
		return label
	}()
	
	private let selectorIcon: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFit
//		iv.image = UIImage(named: "selector_icon")
		
		return iv
	}()
	
	private let containerView: UIView = {
		let view = UIView()
		
		view.backgroundColor = .white
		view.layer.cornerRadius = 16
		view.layer.masksToBounds = true
		view.addShadow(opacity: 0.1, offset: CGSize(width: 0, height: 3))
		
		return view
	}()
	
	// MARK: Initialisers
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
	}
	
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: View setup

extension PatientCollectionViewCell {
	private func setupViews() {
		
		backgroundColor = .clear
		
		containerView.addSubview(patientNameLabel)
		containerView.addSubview(scanDateLabel)
		containerView.addSubview(selectorIcon)
		containerView.addConstraintsWith(format: "V:|-10-[v0]-10-|", views: patientNameLabel)
		containerView.addConstraintsWith(format: "V:|-10-[v0]-10-|", views: scanDateLabel)
		containerView.addConstraintsWith(format: "V:|-10-[v0]-10-|", views: selectorIcon)
		
		containerView.addConstraintsWith(format: "H:|-30-[v0(v1)]-10-[v1]-10-[v2(25)]-10-|", views: patientNameLabel, scanDateLabel, selectorIcon)
		
		addSubview(containerView)
		addConstraintsWith(format: "H:|-\(cellInsets.left)-[v0]-\(cellInsets.right)-|", views: containerView)
		addConstraintsWith(format: "V:|-\(cellInsets.top)-[v0]-\(cellInsets.bottom)-|", views: containerView)
	}
}
