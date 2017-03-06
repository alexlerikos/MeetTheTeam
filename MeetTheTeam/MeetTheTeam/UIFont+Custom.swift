//
//  UIFont+Custom.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/5/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
	class func navigationBarFont() -> UIFont {
		return UIFont(name: "Exo-ExtraBold", size: 27)!
	}
	
	class func mainNameFont() -> UIFont {
		return UIFont(name: "Exo-Bold", size: 22)!
	}

	class func profileTitleFont() -> UIFont {
		
		let modelName = UIDevice.current.modelName
		
		if modelName.contains("5") || modelName.contains("Simulator"){
			return UIFont(name: "Exo-Bold", size: 22)!
		}else {
			return UIFont(name: "Exo-Bold", size: 25)!
		}
	}
	
	class func bioProfileFont() -> UIFont {
		return UIFont(name:"SanFranciscoText-Regular",size:18)!
	}

	class func mainTitleFont() -> UIFont {
		let modelName = UIDevice.current.modelName
		
		if modelName.contains("5") || modelName.contains("Simulator"){
			return UIFont(name:"SanFranciscoText-Regular",size:16)!
		} else {
			return UIFont(name:"SanFranciscoText-Regular",size:18)!
		}
	}
	

}
