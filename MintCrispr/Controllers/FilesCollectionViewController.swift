//
//  FilesCollectionViewController.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 14/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class FilesCollectionViewController: UICollectionViewController {
	
	//TODO: Add header titles
	//TODO: Add folders 'add' footer
	//TODO: Add search bar
	//TODO: remove large cell section
	//TODO: handle 'onclick' for patient data
	//TODO: handle 'onlick' for folder
	//TODO: handle 'onclick' for new folder button
	//TODO: create drag and drop for putting patient data into given folder
	
	// MARK: Models
	var folders = [Folder]()
	
	// MARK: Variables
	private var searchController = UISearchController(searchResultsController: nil)
	private let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
	
	// MARK: Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		collectionView.backgroundColor = UIColor.rgb(red: 235, green: 235, blue: 242)
		
		setupBarButtonItems()

        // Register cell classes
        collectionView!.register(LargeFileCell.self, forCellWithReuseIdentifier: LargeFileCell.reuseIdentifier)
		collectionView!.register(MediumFileCell.self, forCellWithReuseIdentifier: MediumFileCell.reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 1
			
		case 1:
			return folders.count
			
		default:
			return 0
		}
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch indexPath.section {
		case 0:
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeFileCell.reuseIdentifier, for: indexPath) as? LargeFileCell
				else {
					break
			}
			
			return cell
			
		case 1:
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediumFileCell.reuseIdentifier, for: indexPath) as? MediumFileCell
				else {
					break
			}
			
			cell.titleLabel.text = folders[indexPath.item].name
			return cell
			
		default:
			break
		}
		
		return UICollectionViewCell()
    }

    // MARK: UICollectionViewDelegate
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		switch indexPath.section {
		case 0:
			let folderContentsView = PatientInformationTableViewController()
			navigationItem.backBarButtonItem = UIBarButtonItem()
			//folderContentsView.content = unsorted Patients
			navigationController?.pushViewController(folderContentsView, animated: true)

			return
			
		case 1:
			let folderContentsView = PatientInformationTableViewController()
			navigationItem.backBarButtonItem = UIBarButtonItem()
			//folderContentsView.content = someContent
			navigationController?.pushViewController(folderContentsView, animated: true)
			return
			
		default:
			return
		}
	}
}

// MARK: Helper functions
extension FilesCollectionViewController {
	private func setupBarButtonItems() {
		let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNewFolder))
		
		navigationItem.rightBarButtonItem = barButton
	}
	
	@objc private func addNewFolder() {
		let alert = UIAlertController(title: "New Folder",
									  message: "Please enter a name for the new folder:",
									  preferredStyle: .alert)
		
		let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
			let textField = alert.textFields![0]
			
			let newFolder = Folder(name: textField.text!)
			
			self.folders.append(newFolder)
			self.collectionView.reloadData()
		}
		
		let cancelAction = UIAlertAction(title: "Cancel",
										 style: .cancel)
		
		alert.addTextField()
		
		alert.addAction(saveAction)
		alert.addAction(cancelAction)
		
		present(alert, animated: true, completion: nil)
	}
}


// MARK: Flow Delegate

extension FilesCollectionViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		switch indexPath.section {
		case 0:
			let paddingSpace = sectionInsets.left + sectionInsets.right
			return CGSize(width: view.frame.width - paddingSpace, height: 130)
			
		case 1:
			let paddingSpace = sectionInsets.left * 3
			let availableWidth = view.frame.width - paddingSpace
			let widthPerItem = availableWidth / 2
			return CGSize(width: widthPerItem, height: 100)

		case 2:
			let paddingSpace = sectionInsets.left + sectionInsets.right
			return CGSize(width: view.frame.width - paddingSpace, height: 60)
			
		default:
			return .zero
		}
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						insetForSectionAt section: Int) -> UIEdgeInsets {
		return sectionInsets
	}
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return sectionInsets.left
	}
}
