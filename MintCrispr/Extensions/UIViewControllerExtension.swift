//
//  UIViewControllerExtension.swift
//  Employ
//
//  Created by Harry O'Brien on 29/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

extension UIViewController {
	func addViewControllerAsChild(viewController child: UIViewController) {
		addChild(child)
		child.willMove(toParent: self)
	}
}
