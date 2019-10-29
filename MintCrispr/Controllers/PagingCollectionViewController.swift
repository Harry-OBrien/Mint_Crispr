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
	
	//MARK: Variables
	
	//db
//	let ref = Database.database().reference(withPath: "grocery-items")
	
	//model
	internal var devices: [ScannerDevice] = [] {
		didSet {
			devices.sort {
				return $0.lastSeenDateTime > $1.lastSeenDateTime
			}
		}
	}
	
	private var itemSize = CGSize(width: 256, height: 415)
	
	//current index of cell
	public var currentIndex: Int {
		get {
			let startOffset = (collectionView.bounds.size.width - itemSize.width) / 2
			guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
				return 0
			}
			
			let minimumLineSpacing = layout.minimumLineSpacing
			let currentXLoc = collectionView.contentOffset.x + startOffset + itemSize.width / 2
			let itemWidth = itemSize.width + minimumLineSpacing
			return Int(currentXLoc / itemWidth)
		}
	}
	
	// MARK: Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView!.backgroundColor = UIColor.rgb(red: 235, green: 235, blue: 242)
		
		// Register cell classes
		self.collectionView!.register(PagingCollectionViewCell.self, forCellWithReuseIdentifier: PagingCollectionViewCell.reuseIdentifier)
		
		collectionView!.decelerationRate = .fast
		collectionView!.showsHorizontalScrollIndicator = false
		
		addGesture(to: collectionView)
	}
}

// MARK: UICollectionViewDataSource

extension PagingCollectionViewController {
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return devices.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PagingCollectionViewCell.reuseIdentifier, for: indexPath) as! PagingCollectionViewCell
		
		cell.device = devices[indexPath.item]
		
		//slightly fade devices not online
		cell.alpha = devices[indexPath.item].online ? 1 : 0.4
		
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
			let deviceDetail = DeviceDetailViewController()
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
			let deviceDetail = DeviceDetailViewController()
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
