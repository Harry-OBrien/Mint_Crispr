//
//  DeviceDetailTableViewController.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 31/10/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class DeviceDetailTableViewController: UITableViewController {
	
	public var headerImage: UIImage?
	
	private lazy var headerHeight: CGFloat = view.frame.height / 4.5
	private lazy var headerView = DeviceDetailHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: headerHeight))
	private var selectedCell: Int? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.register(DetailExpandingTableViewCell.self, forCellReuseIdentifier: DetailExpandingTableViewCell.reuseIdentifier)
		tableView.register(DetailInterfaceCell.self, forCellReuseIdentifier: DetailInterfaceCell.reuseIdentifier)
		
		tableView.backgroundColor = UIColor.rgb(red: 235, green: 235, blue: 242)
		
		tableView.tableHeaderView = nil
		tableView.addSubview(headerView)
		tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
		tableView.contentOffset = CGPoint(x: 0, y: -headerHeight)
		
		headerView.backgroundGradientImageView.image = headerImage
		
		updateHeaderView()
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.item {
		case 0:
			return tableView.dequeueReusableCell(withIdentifier: DetailInterfaceCell.reuseIdentifier, for: indexPath)
			
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: DetailExpandingTableViewCell.reuseIdentifier, for: indexPath) as! DetailExpandingTableViewCell
			
			cell.isOpen = (selectedCell == indexPath.item)
			return cell
		}
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		switch indexPath.item {
		case 0:
			return view.frame.height - headerHeight - navigationController!.navigationBar.frame.size.height
			
		case selectedCell:
			return ResultsTableView().rowHeight * 6 + 80
			
		default:
			return 60
		}
	}
	
	override func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
		if indexPath.item == 0 {return false}
		return true
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.item == 0 {
			tableView.deselectRow(at: indexPath, animated: false)
			return
		}
		
		selectedCell = (selectedCell == indexPath.item) ? nil : indexPath.item
		tableView.reloadData()
	}
}

// MARK: Scroll Handling

extension DeviceDetailTableViewController {
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
		headerView.fontSize = 28 - tableView.contentOffset.y / 8
	}
}
