//
//  SettingsTableViewController.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 14/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
	
	//TODO: handle onclick -> go to view controller
	//TODO: create view controllers for all settings
	
	typealias titledRow = (String, UIImage?, UIViewController)
	typealias titledSection = (String, [titledRow])
	
	var tableContent = [titledSection]()
	
	override func loadView() {
		super.loadView()
		
		let section1 = titledSection("Devices",
									 [titledRow("Add New Device", UIImage(named: "plus_icon_2"), UIViewController())]
		)
		
		let section2 = titledSection("Files",
									 [titledRow("Local Files", UIImage(named: "folder_icon"), UIViewController()),
									  titledRow("Server Information", UIImage(named: "database_icon"), UIViewController()),
									  titledRow("File Tags", UIImage(named: "tag_icon"), UIViewController())]
		)
		
		let section3 = titledSection("Account",
									 [titledRow("Log In", UIImage(named: "login_icon"), UIViewController()),
									  titledRow("Sign Up", UIImage(named: "fingerprint_icon"), UIViewController()),
									  titledRow("Privacy", UIImage(named: "privacy_icon"), UIViewController()),
									  titledRow("Security", UIImage(named: "locked_icon"), UIViewController())]
		)
		
		tableContent = [section1, section2, section3]
	}
	
	// Return the number of sections
	override func numberOfSections(in tableView: UITableView) -> Int {
		return tableContent.count
	}
	
	// Return the number of rows for each section in your static table
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableContent[section].1.count
	}
	
	// Return the row for the corresponding section and row
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		let (title, icon, _) = tableContent[indexPath.section].1[indexPath.row]
		
		cell.imageView?.image = icon
		cell.textLabel?.text = title
		cell.alpha = 0.5
		
		return cell
	}
	
	// Customize the section headings for each section
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return tableContent[section].0
	}
	
	// Configure the row selection code for any cells that you want to customize the row selection
	//	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	//		// Handle social cell selection to toggle checkmark
	//		if(indexPath.section == 1 && indexPath.row == 0) {
	//
	//			// deselect row
	//			tableView.deselectRow(at: indexPath, animated: false)
	//
	//			// toggle check mark
	//			if(self.shareCell.accessoryType == UITableViewCell.AccessoryType.none) {
	//				self.shareCell.accessoryType = UITableViewCell.AccessoryType.checkmark;
	//			} else {
	//				self.shareCell.accessoryType = UITableViewCell.AccessoryType.none;
	//			}
	//		}
	//	}
}
