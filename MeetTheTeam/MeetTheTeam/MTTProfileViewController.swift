//
//  MTTProfileViewController.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit

class MTTProfileViewController: UIViewController {

	// MARK: Properties
	var member:MTTMember?
	var nameLabel:ProfileNameLabel?
	var titleLabel:ProfileTitleLabel?
	var bioLabel:ProfileBioLabel?
	var profileImageView:UIImageView?
	
	// MARK: Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.red
		
		self.setUpProfileImageView()
		self.setUpNameLabelView()
		self.setUpTitleLabel()
		self.setUpBioLabel()
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	private func setUpProfileImageView() {
		
	}
	
	private func setUpNameLabelView() {
		
	}
	
	private func setUpTitleLabel(){
		
	}
	
	private func setUpBioLabel(){
		
	}
	
}
