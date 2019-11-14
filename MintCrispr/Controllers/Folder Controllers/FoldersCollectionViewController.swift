//
//  FilesCollectionViewController.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 14/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class FilesCollectionViewController: UICollectionViewController {
	
	// TODO: Create headers for 'recently opened folders' and 'all other users' sections
    
	// MARK: View Components
	
	let noFoldersBackgroundLabel: UILabel = {
		let label = UILabel()
		
		let text = NSMutableAttributedString(string: "You have no folders yet!\n", attributes: [.font : UIFont(name: "HelveticaNeue-CondensedBold", size: 30)!])
		
		let secondaryText = NSMutableAttributedString(string: "A folder will appear when you perform your first scan.", attributes: [NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-CondensedBold", size: 16)!, NSAttributedString.Key.foregroundColor : UIColor(white: 0.4, alpha: 1)])
	
		text.append(secondaryText)
		label.attributedText = text
		
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		
		label.textAlignment = .center
		
		return label
	}()
	
    // MARK: Models
    
    // MARK: Variables
    
    private let numberOfFoldersInRecents = 6
    private let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.rgb(red: 235, green: 235, blue: 242)
        
        setupBarButtonItems()
        
        // Register cell classes
        collectionView.register(FolderCollectionViewCell.self,
								forCellWithReuseIdentifier: FolderCollectionViewCell.reuseIdentifier)
		
		// Headers
		collectionView.register(RecentFoldersHeaderView.self,
								forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
								withReuseIdentifier: RecentFoldersHeaderView.reuseIdentifier)
		
		collectionView.register(AllFoldersHeaderView.self,
								forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
								withReuseIdentifier: AllFoldersHeaderView.reuseIdentifier)
		
//		if folders.count == 0 {
//			collectionView.backgroundView = noFoldersBackgroundLabel
//		}
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 8
            
        case 1:
            return 23//folders.count
            
        default:
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FolderCollectionViewCell.reuseIdentifier, for: indexPath) as? FolderCollectionViewCell
			else {
				return UICollectionViewCell()
		}
		
		if indexPath.section == 0 {
			cell.textIsCentered = true
		} else {
			cell.textIsCentered = false
		}
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		switch indexPath.section {
		case 0:
			return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecentFoldersHeaderView.reuseIdentifier, for: indexPath)
		case 1:
			return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AllFoldersHeaderView.reuseIdentifier, for: indexPath)
			
		default:
			return UICollectionReusableView()
		}
	}
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let folderContentsView = PatientInformationTableViewController()
		navigationItem.backBarButtonItem = UIBarButtonItem()
		//folderContentsView.content = someContent
		navigationController!.pushViewController(folderContentsView, animated: true)
    }
}

// MARK: Helper functions
extension FilesCollectionViewController {
    private func setupBarButtonItems() {
        let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(handleSearchIconPress))
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc private func handleSearchIconPress() {
        print("search btn pressed!")
    }
}


// MARK: Flow Delegate

extension FilesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            let paddingSpace = sectionInsets.left * 3
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / 2
            return CGSize(width: widthPerItem, height: 100)
            
        case 1:
            let paddingSpace = sectionInsets.left + sectionInsets.right
            return CGSize(width: view.frame.width - paddingSpace, height: 60)
            
        default:
            return .zero
        }
    }
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		switch section {
		case 0:
			return CGSize(width: collectionView.bounds.width, height: 52)
			
		case 1:
			return CGSize(width: collectionView.bounds.width, height: 60)
			
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
		switch section {
		case 0:
			return 10
			
		default:
			return 1
		}
    }
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		switch section {
		case 0:
			return 10
			
		default:
			return 1
		}
	}
}
