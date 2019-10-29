//
//  FilesCollectionViewController.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 14/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

class FilesCollectionViewController: UICollectionViewController {
    
    // MARK: Models
    
    private var recentlyAccessedFolders = [Folder]() {
        didSet {
            //sort into the most recent
            recentlyAccessedFolders.sort {
                return $0.lastAccessDateTime < $1.lastAccessDateTime
            }
            
            // now trim to length (if applicable)
            if recentlyAccessedFolders.count > numberOfFoldersInRecents {
                recentlyAccessedFolders = [Folder](recentlyAccessedFolders.prefix(numberOfFoldersInRecents))
            }
        }
    }
    
    private  var folders = [Folder]() {
        didSet {
            // copy self to recently accessed (which will handle its own sorting)
            recentlyAccessedFolders = folders
            
            // now sort into alphabetical for a list of all folders
            folders.sort {
                return $0.name < $1.name
            }
        }
    }
    
    // MARK: Variables
    
    private let numberOfFoldersInRecents = 6
//    private var searchController = UISearchController(searchResultsController: nil)
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
