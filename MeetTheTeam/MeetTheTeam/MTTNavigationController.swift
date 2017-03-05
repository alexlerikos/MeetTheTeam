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
        // Dispose of any resources that can be recreated.
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
			NSFontAttributeName: UIFont(name: "AbadiMT-CondensedExtraBold", size: 27)!]
		for family: String in UIFont.familyNames
		{
			print("\(family)")
			for names: String in UIFont.fontNames(forFamilyName: family)
			{
				print("== \(names)")
			}
		}
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
