//
//  UIImageViewExtension.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 14/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

extension UIImageView {
	func addBlur(usingLightStyle isLight: Bool) {
		let blurEffect =  isLight ? UIBlurEffect(style: UIBlurEffect.Style.light) : UIBlurEffect(style: UIBlurEffect.Style.dark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = self.bounds
		
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
		self.addSubview(blurEffectView)
	}
	
	func removeBlurEffect() {
		let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
		blurredEffectViews.forEach{ blurView in
			blurView.removeFromSuperview()
		}
	}
}
