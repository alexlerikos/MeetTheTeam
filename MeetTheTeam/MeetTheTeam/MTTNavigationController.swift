//
//  MTTNavigationController.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit

class MTTNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.setUpAppearance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	private func setUpAppearance(){
		
		// add blur effect
		let bounds = self.navigationBar.bounds as CGRect!
		let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
		visualEffectView.frame = bounds!
		visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.navigationController?.navigationBar.addSubview(visualEffectView)
		
		// set color tint
		self.navigationBar.barTintColor = UIColor.navBarBackgroundColor()
		self.navigationBar.titleTextAttributes = [
			NSForegroundColorAttributeName : UIColor.textColor(),
			NSFontAttributeName: UIFont.navigationBarFont()]
		self.navigationBar.tintColor = UIColor.textColor()
		
		for family in UIFont.familyNames {
			print("\(family)")
			
			for name in UIFont.fontNames(forFamilyName: family) {
				print("   \(name)")
			}
		}
	}

}
