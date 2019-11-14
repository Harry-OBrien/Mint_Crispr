//
//  PatientInformationTableViewController.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 27/09/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class PatientInformationTableViewController: UITableViewController {
	
	let count = 10
	
	var rowHeights: [CGFloat]! {
		get {
			var heightForCells = [CGFloat].init(repeating: 0, count: count)
			for i in 0..<count {
				let cell = tableView(tableView, cellForRowAt: IndexPath(row: i, section: 0)) as! PatientTestTableViewCell
				heightForCells[i] = cell.resultsTable.heightForTableView + 80
			}
			return heightForCells
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.separatorStyle = .none
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.backgroundColor = UIColor.rgb(red: 235, green: 235, blue: 242)
		navigationItem.rightBarButtonItem = self.editButtonItem
		
		tableView.register(PatientTestTableViewCell.self, forCellReuseIdentifier: PatientTestTableViewCell.reuseIdentifier)
	}
	
	// MARK: - Table view data source
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 70
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: PatientTestTableViewCell.reuseIdentifier, for: indexPath)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		switch section {
		case 0:
			let view = PatientTableViewSectionHeader()
			//view.title = patient
			return view
			
		default:
			return nil
		}
	}
	
	// Override to support conditional editing of the table view.
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
	}
	
	
	
	// Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			// Delete the row from the data source
			tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}
	
	
	
	// Override to support rearranging the table view.
	override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
		super.tableView(tableView, moveRowAt: fromIndexPath, to: to)
	}
	
	
	
	// Override to support conditional rearranging of the table view.
	override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the item to be re-orderable.
		return true
	}
	
	
	
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destination.
		// Pass the selected object to the new view controller.
	}
	
	
}
