//
//  AppDelegate.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 13/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit
import CoreData
//import Firebase
//import Fabric
//import Crashlytics


//TODO: Complete https://www.raywenderlich.com/7569-getting-started-with-core-data-tutorial

//TODO: Complete https://www.raywenderlich.com/9477-uicollectionview-tutorial-reusable-views-selection-and-reordering

//TODO: Complete https://www.raywenderlich.com/2295-arduino-tutorial-integrating-bluetooth-le-and-ios

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		//Configure firebase
//		FirebaseApp.configure()
//		Fabric.sharedSDK().debug = true
		
		//setup window
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		
		//view controllers for the tab bar
		let scannersVC = PagingCollectionViewController(
			collectionViewLayout: PageCollectionLayout()
		)
		scannersVC.tabBarItem = UITabBarItem(title: "Scanners", image: #imageLiteral(resourceName: "target_icon"), tag: 0)
		let scannerNavVC = UINavigationController(rootViewController: scannersVC)
		setNavTitleLabelFor(scannerNavVC)
		
		let filesVC = FilesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
		filesVC.tabBarItem = UITabBarItem(title: "Files", image: #imageLiteral(resourceName: "folder_icon"), tag: 0)
		let filesNavVC = UINavigationController(rootViewController: filesVC)
		setNavTitleLabelFor(filesNavVC)
		
		// NOTE:
		
//		let analyticsVC = CBSampleViewController()
//		analyticsVC.tabBarItem = UITabBarItem(title: "Analytics", image: #imageLiteral(resourceName: "analysis_icon"), tag: 0)
//		let analyticsNavVC = UINavigationController(rootViewController: analyticsVC)
//		setNavTitleLabelFor(analyticsNavVC)
		
		let settingsVC = TableViewController(style: UITableView.Style.grouped)
		settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: #imageLiteral(resourceName: "more_icon"), tag: 0)
		let settingsNavVC = UINavigationController(rootViewController: settingsVC)
		setNavTitleLabelFor(settingsNavVC)
		
		// Initialise the tab bar and set view controllers
		let tabBarCtrl = BubbleTabBarController()
		tabBarCtrl.viewControllers = [scannerNavVC, filesNavVC, settingsNavVC]
		tabBarCtrl.tabBar.tintColor = UIColor.rgb(red: 241, green: 181, blue: 24)
		
		window?.rootViewController = tabBarCtrl
		
//		window?.rootViewController = TestVC()
		
		return true
	}
	
	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}
	
	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}
	
	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}
	
	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
		// Saves changes in the application's managed object context before the application terminates.
		self.saveContext()
	}
	
	// MARK: - Core Data stack
	
	lazy var persistentContainer: NSPersistentContainer = {
		/*
		The persistent container for the application. This implementation
		creates and returns a container, having loaded the store for the
		application to it. This property is optional since there are legitimate
		error conditions that could cause the creation of the store to fail.
		*/
		let container = NSPersistentContainer(name: "MintCrispr")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				
				/*
				Typical reasons for an error here include:
				* The parent directory does not exist, cannot be created, or disallows writing.
				* The persistent store is not accessible, due to permissions or data protection when the device is locked.
				* The device is out of space.
				* The store could not be migrated to the current model version.
				Check the error message to determine what the actual problem was.
				*/
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()
	
	// MARK: - Core Data Saving support
	
	func saveContext () {
		let context = persistentContainer.viewContext
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				let nserror = error as NSError
				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
			}
		}
	}
	
}

extension AppDelegate {
	func setNavTitleLabelFor(_ navigationController: UINavigationController) {
		let label = UILabel(frame: CGRect(x: 30,
										  y: 0,
										  width: navigationController.navigationBar.frame.width - 30,
										  height: navigationController.navigationBar.frame.height)
		)
		
		let titleString = NSMutableAttributedString(string: "MintCrispr",
													attributes: [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-CondensedBold", size: 36)!]
		)
		
		// Set 'Mint' to a minty colour
		titleString.addAttribute(NSAttributedString.Key.foregroundColor,
								 value: UIColor.rgb(red: 83, green: 182, blue: 138),
								 range: NSRange(location:0,length:4)
		)
		
		label.attributedText = titleString
		label.textAlignment = .left
		
		navigationController.navigationBar.addSubview(label)
	}
	
}
