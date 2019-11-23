//
//  PagingCollectionViewController.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 23/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit
import Firebase

class PagingCollectionViewController: UICollectionViewController {
	
	// MARK: View Components
	
	lazy var addNewBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNewDevice))
	
	let noDevicesBackgroundLabel: UILabel = {
		let label = UILabel()
		
		let text = NSMutableAttributedString(string: "You have no devices yet!\n", attributes: [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-CondensedBold", size: 30)!])
		
		let secondaryText = NSMutableAttributedString(string: "Add a new device by pressing the '+' button at the top right of the screen.", attributes: [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-CondensedBold", size: 16)!, NSAttributedString.Key.foregroundColor : UIColor(white: 0.4, alpha: 1)])
	
		text.append(secondaryText)
		label.attributedText = text
		
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		
		label.textAlignment = .center
		
		return label
	}()
	
	//MARK: Variables
	
	//model
	internal var devices: [ScannerDevice] = [] {
		didSet {
			devices.sort {
				return $0.lastSeenDateTime > $1.lastSeenDateTime
			}
		}
	}
		
	//current index of cell
	public var currentIndex: Int {
		get {
			guard let layout = collectionViewLayout as? PageCollectionLayout
				else {
					return 0
			}
			
			let startOffset = (collectionView.bounds.size.width - layout.itemSize.width) / 2
			let minimumLineSpacing = layout.minimumLineSpacing
			let currentXLoc = collectionView.contentOffset.x + startOffset + layout.itemSize.width / 2
			let itemWidth = layout.itemSize.width + minimumLineSpacing
			
			return Int(currentXLoc / itemWidth)
		}
	}
	
	// MARK: Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// configure collection view
		collectionView.backgroundColor = UIColor.rgb(red: 235, green: 235, blue: 242)
		collectionView.decelerationRate = .fast
		collectionView.showsHorizontalScrollIndicator = false
		
		if let layout = collectionViewLayout as? PageCollectionLayout {
			layout.itemSize = CGSize(width: self.collectionView!.bounds.width * 0.65, height: self.collectionView!.bounds.height * 0.45)
		}
		
		// Register cell classes
		self.collectionView!.register(PagingCollectionViewCell.self, forCellWithReuseIdentifier: PagingCollectionViewCell.reuseIdentifier)
		
		// Add swipe up gesture for opening cell
		addGesture(to: collectionView)
		
		//set "add" btn
		navigationItem.rightBarButtonItem = addNewBarButtonItem
		
		// set the label for 'no devices'
//		if devices.count == 0 {
//			collectionView.backgroundView = noDevicesBackgroundLabel
//		}
	}
}

// MARK: UICollectionViewDataSource

extension PagingCollectionViewController {
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3//devices.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PagingCollectionViewCell.reuseIdentifier, for: indexPath) as! PagingCollectionViewCell
		
//		cell.device = devices[indexPath.item]
//		
//		//slightly fade devices not online
//		cell.alpha = devices[indexPath.item].online ? 1 : 0.4
		
		//we need to force the cell to not animate on cell reuse
		cell.willAnimateCell = false
		cell.isOpen = false
		cell.willAnimateCell = true
		
		return cell
	}
}

// MARK: UICollectionViewDelegate

extension PagingCollectionViewController {
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let cell = collectionView.cellForItem(at: indexPath) as? PagingCollectionViewCell,
		currentIndex == indexPath.row
			else {
				return
		}
		
		if cell.isOpen {
			let deviceDetail = DeviceDetailTableViewController()
			deviceDetail.backgroundGradientImage = UIImage(named: "low_poly_6")//cell.gradientImage
			
			navigationItem.backBarButtonItem = UIBarButtonItem()
			navigationController?.pushViewController(deviceDetail, animated: true)
		}
		else {
			//close cells either side
			closeCellsNeighbouring(indexPath)
			
			//open this cell
			cell.isOpen = true
		}
	}
	
	override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
		return false
	}
	
	override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
		return false
	}
	
	override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
		
	}
}

// MARK: Gesture handlers

extension PagingCollectionViewController {
	private func addGesture(to view: UIView) {
		let upGesture = UISwipeGestureRecognizer(target: self, action: #selector(PagingCollectionViewController.swipeHandler(_:)))
		upGesture.direction = .up
		
		let downGesture = UISwipeGestureRecognizer(target: self, action: #selector(PagingCollectionViewController.swipeHandler(_:)))
		downGesture.direction = .down
		
		view.addGestureRecognizer(upGesture)
		view.addGestureRecognizer(downGesture)
	}
	
	@objc func swipeHandler(_ sender: UISwipeGestureRecognizer) {
		let indexPath = IndexPath(row: currentIndex, section: 0)
		guard let cell = collectionView?.cellForItem(at: indexPath) as? PagingCollectionViewCell
			else {
				return
		}
		
		// double swipe up for transition
		if cell.isOpen && sender.direction == .up {
			let deviceDetail = DeviceDetailTableViewController()
			deviceDetail.backgroundGradientImage = UIImage(named: "low_poly_6")//cell.gradientImage
			
			navigationItem.backBarButtonItem = UIBarButtonItem()
			navigationController?.pushViewController(deviceDetail, animated: true)
		}
		else {
			//we haven't double swiped. set the state of the cell depending on the swipe action
			let willOpen = (sender.direction == .up)
			
			if willOpen {
				//close cells either side
				closeCellsNeighbouring(indexPath)
			}
			
			cell.isOpen = willOpen
		}
	}
}

// MARK: Bar button handler

extension PagingCollectionViewController {
	@objc private func addNewDevice() {
		let vc = AddNewDeviceTableViewController()
		navigationItem.backBarButtonItem = UIBarButtonItem()
		navigationController?.pushViewController(vc, animated: true)
	}
}

// MARK: Helper functions

extension PagingCollectionViewController {
	private func closeCellsNeighbouring(_ index: IndexPath) {
		let prevCellIndex = IndexPath(item: index.item - 1, section: index.section)
		let nextCellIndex = IndexPath(item: index.item + 1, section: index.section)
		
		if let prevCell = collectionView.cellForItem(at: prevCellIndex) as? PagingCollectionViewCell {
			prevCell.isOpen = false
		}
		
		if let nextCell = collectionView.cellForItem(at: nextCellIndex) as? PagingCollectionViewCell {
			nextCell.isOpen = false
		}
	}
}
