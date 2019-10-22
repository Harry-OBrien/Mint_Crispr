//
//  PagingCollectionViewCell.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 22/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class PagingCollectionViewCell: UICollectionViewCell {
	
	//MARK: Variables
	var device: ScannerDevice? {
		didSet {
			//check not nil
			guard let device = device
				else {
					return
			}
			
			DeviceNameTitleLable.text = device.deviceName
			
			if device.online {
				LastOnlineLabel.text = "Online now!"
			}
			else {
				LastOnlineLabel.text = "Last seen: \(device.readableLastSeenDate)"
			}
		}
	}
	
	public var willAnimateCell = false
	public var isOpen: Bool = false {
		didSet {
			if oldValue != isOpen {
				setCellOpen(isOpen, animated: willAnimateCell)
			}
		}
	}
	
	private let cellHeight: CGFloat = 335
	private lazy var cellWidth = self.frame.width
	
	private let openCellOffset: CGFloat = 40
	
	private lazy var frontClosedStateFrame = {
		CGRect(x: 0,
			   y: bounds.midY - (cellHeight / 2),
			   width: bounds.width,
			   height: cellHeight)
	}()
	private lazy var rearClosedStateFrame = {
		CGRect(x: 0,
			   y: bounds.midY - (cellHeight / 2),
			   width: bounds.width,
			   height: cellHeight)
	}()
	private lazy var frontOpenedStateFrame = {
		CGRect(x: 0,
			   y: bounds.midY - (cellHeight / 2) - openCellOffset,
			   width: bounds.width,
			   height: cellHeight)
	}()
	private lazy var rearOpenedStateFrame = {
		CGRect(x: -(openCellOffset / 2),
			   y: bounds.midY - (cellHeight / 2) + openCellOffset,
			   width: bounds.width + openCellOffset,
			   height: cellHeight)
	}()
	
	//MARK: View components
	
	//TODO: set gradient colour in model to keep consistency across view loadwing
	private let frontContainerView: UIView = {
		let view = UIView()
		view.backgroundColor = .white
		view.layer.masksToBounds = true
		view.layer.cornerRadius = 5
		
		view.addShadow(opacity: 0.5, offset: CGSize(width: 0, height: 4))
		
		return view
	}()
	
	private let rearContainerView: UIView = {
		let view = UIView()
		view.backgroundColor = .white
		view.layer.masksToBounds = true
		view.layer.cornerRadius = 5
		view.addShadow(opacity: 0.2, offset: CGSize(width: 0, height: 2))
		
		return view
	}()
	
	private let DeviceNameTitleLable: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 42)
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.textColor = .black
		label.textAlignment = .center
		
		return label
	}()
	
	private let LastOnlineLabel: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 16, weight: .thin)
		label.textAlignment = .center
		return label
	}()
	
	// MARK: Initialisers
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: view config

extension PagingCollectionViewCell {
	private func setupViews() {
		setRearView()
		setFrontView()
	}
	
	private func setFrontView() {
		addSubview(frontContainerView)
		frontContainerView.frame = frontClosedStateFrame
		
		frontContainerView.addSubview(DeviceNameTitleLable)
		frontContainerView.addConstraintsWith(format: "H:|-10-[v0]-10-|", views: DeviceNameTitleLable)
		frontContainerView.addConstraintsWith(format: "V:|-10-[v0]", views: DeviceNameTitleLable)
	}
	
	private func setRearView() {
		addSubview(rearContainerView)
		rearContainerView.frame = rearClosedStateFrame
		
		rearContainerView.addSubview(LastOnlineLabel)
		rearContainerView.addConstraintsWith(format: "H:|-10-[v0]-10-|", views: LastOnlineLabel)
		rearContainerView.addConstraintsWith(format: "V:[v0]-10-|", views: LastOnlineLabel)
	}
}

// MARK: cell dynamics

extension PagingCollectionViewCell {
	
	private func setCellOpen(_ cellWillOpen: Bool, animated: Bool) {
		if animated {
			UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
				self.setCellFrame(open: cellWillOpen)
				self.layoutIfNeeded()
			}, completion: nil)
		} else {
			setCellFrame(open: cellWillOpen)
		}
	}
	
	private func setCellFrame(open: Bool) {
		open ? setOpenCellFrames() : setCloseCellFrames()
	}
	
	private func setOpenCellFrames() {
		rearContainerView.frame = rearOpenedStateFrame
		frontContainerView.frame = frontOpenedStateFrame
	}
	
	private func setCloseCellFrames() {
		rearContainerView.frame = rearClosedStateFrame
		frontContainerView.frame = frontClosedStateFrame
	}
}
