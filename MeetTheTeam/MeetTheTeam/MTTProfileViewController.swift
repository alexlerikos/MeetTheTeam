//
//  MTTProfileViewController.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit
import Kingfisher

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
		
		self.setUpNavigationTitle()
		self.setUpProfileImageView()
		self.setUpNameLabelView()
		self.setUpTitleLabel()
		self.setUpBioLabel()
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	private func setUpNavigationTitle(){
		guard self.member != nil else {
			self.navigationItem.title = "No Name"
			return
		}
		
		self.navigationItem.title = "\(self.member!.firstName!) \(self.member!.lastName!)"
	}
	
	private func setUpProfileImageView() {
		
		self.profileImageView = UIImageView(frame: CGRect.zero)
		self.profileImageView!.translatesAutoresizingMaskIntoConstraints = false
		if let member = self.member {
			let avatarImageURL = URL(string: member.avatarImageURL!)
			
			self.profileImageView!.kf.setImage(with: avatarImageURL!,
				completionHandler: {(image, error, cacheType, imageUrl) in
					guard error == nil else {
						self.profileImageView!.image = UIImage(named:"AvatarBase")
						return
					}
					self.profileImageView!.image = image
				}
			)
		} else {
			self.profileImageView!.image = UIImage(named:"AvatarBase")
		}
		
		self.view.addSubview(self.profileImageView!)
		// Constraints
		
		let imageHeight = self.view.frame.width
		
		let heightConstraint = NSLayoutConstraint(item: self.profileImageView!, attribute: .height, relatedBy: .equal,
		                                          toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageHeight)
		
		let widthConstraint = NSLayoutConstraint(item: self.profileImageView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.view.frame.width)
		
		let yConstraint = NSLayoutConstraint(item: self.profileImageView!, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0.0)
		
		let xConstraint = NSLayoutConstraint(item: self.profileImageView!, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0.0)
		
		self.view.addConstraints([yConstraint,xConstraint,heightConstraint, widthConstraint])

	}
	
	private func setUpNameLabelView() {
		
	}
	
	private func setUpTitleLabel(){
		
	}
	
	private func setUpBioLabel(){
		
	}
	
}
