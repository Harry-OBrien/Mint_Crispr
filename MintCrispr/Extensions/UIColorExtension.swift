//
//  UIColorExtension.swift
//  Employ
//
//  Created by Harry O'Brien on 12/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

extension UIColor {
	static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
		return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
	}
	
	class func palette() -> [UIColor] {
		let palette = [
			UIColor.rgb(red: 85, green: 0, blue: 255),
			UIColor.rgb(red: 170, green: 0, blue: 170),
			UIColor.rgb(red: 85, green: 170, blue: 85),
			UIColor.rgb(red: 0, green: 85, blue: 0),
			UIColor.rgb(red: 255, green: 170, blue: 0),
			UIColor.rgb(red: 255, green: 255, blue: 0),
			UIColor.rgb(red: 255, green: 85, blue: 0),
			UIColor.rgb(red: 0, green: 85, blue: 85),
			UIColor.rgb(red: 0, green: 85, blue: 255),
			UIColor.rgb(red: 170, green: 170, blue: 255),
			UIColor.rgb(red: 85, green: 0, blue: 0),
			UIColor.rgb(red: 170, green: 85, blue: 85),
			UIColor.rgb(red: 170, green: 255, blue: 0),
			UIColor.rgb(red: 85, green: 170, blue: 255),
			UIColor.rgb(red: 0, green: 170, blue: 170)
		]
		return palette
	}
}
