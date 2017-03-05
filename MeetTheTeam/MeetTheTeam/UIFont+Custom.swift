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
		return UIFont(name: "Exo-Bold", size: 25)!
	}
	
	class func bioProfileFont() -> UIFont {
		return UIFont(name:"SanFranciscoText-Italic",size:20)!
	}
}
