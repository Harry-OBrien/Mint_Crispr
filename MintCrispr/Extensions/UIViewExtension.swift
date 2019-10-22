//
//  UIViewExtension.swift
//  Employ
//
//  Created by Harry O'Brien on 12/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

extension UIView {
	func addConstraintsWith(format: String, views: UIView...) {
		var viewsDict = [String: UIView]()
		for (index, view) in views.enumerated() {
			let key = "v\(index)"
			viewsDict[key] = view
			view.translatesAutoresizingMaskIntoConstraints = false
		}
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict))
	}
	
	//embed subview into safe area
	func embedInsideSafeArea(_ subview: UIView) {
		addSubview(subview)
		subview.translatesAutoresizingMaskIntoConstraints = false
		subview.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
			.isActive = true
		subview.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
			.isActive = true
		subview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
			.isActive = true
		subview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
			.isActive = true
	}
	
	//add Shadow
	func addShadow(opacity: Float, offset: CGSize) {
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowRadius = 3.0
		layer.shadowOpacity = opacity
		layer.shadowOffset = offset
		layer.masksToBounds = false
	}
	
	//rotation animation
	func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
		let animation = CABasicAnimation(keyPath: "transform.rotation")
		
		animation.toValue = toValue
		animation.duration = duration
		animation.isRemovedOnCompletion = false
		animation.fillMode = CAMediaTimingFillMode.forwards
		
		self.layer.add(animation, forKey: nil)
	}
}
