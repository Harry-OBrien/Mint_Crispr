//
//  UIImageExtension.swift
//  Employ
//
//  Created by Harry O'Brien on 12/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import UIKit

extension UIImage {
	func tinted(color: UIColor) -> UIImage? {
		UIGraphicsBeginImageContextWithOptions(size, false, scale)
		color.set()
		draw(in: CGRect(origin: .zero, size: size))
		
		guard let imageColored = UIGraphicsGetImageFromCurrentImageContext() else {
			return nil
		}
		
		UIGraphicsEndImageContext()
		return imageColored
	}
}
