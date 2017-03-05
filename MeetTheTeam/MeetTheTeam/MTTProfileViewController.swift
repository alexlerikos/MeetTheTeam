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
		self.view.backgroundColor = UIColor.red
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
		self.nameLabel = ProfileNameLabel(frame: CGRect(x: 0.0, y: 500.0, width: 100.0, height: 24.0))
		self.nameLabel!.translatesAutoresizingMaskIntoConstraints = false
		
		if self.member != nil {
			self.nameLabel!.setNameText(member: self.member!)
		}
		
		self.view.addSubview(self.nameLabel!)
		
		//Constraints
		let heightConstraint = NSLayoutConstraint(item: self.nameLabel!, attribute: .height, relatedBy: .equal,
		                                          toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24.0)
		//
		let widthConstraint = NSLayoutConstraint(item: self.nameLabel!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0)
		//
		let yConstraint = NSLayoutConstraint(item: self.nameLabel!, attribute: .bottom, relatedBy: .equal, toItem: self.profileImageView!, attribute: .bottom, multiplier: 1.0, constant: -20.0)
		//
		let xConstraint = NSLayoutConstraint(item: self.nameLabel!, attribute: .leading, relatedBy: .equal, toItem: self.nameLabel!.superview, attribute: .leading, multiplier: 1.0, constant: 8.0)
		
		self.view.addConstraints([yConstraint,xConstraint,widthConstraint,heightConstraint])

	}
	
	private func setUpTitleLabel(){
		self.titleLabel = ProfileTitleLabel(frame: CGRect.zero)
		self.titleLabel!.translatesAutoresizingMaskIntoConstraints = false
		
		if self.member != nil {
			self.titleLabel!.setTitleText(member: self.member!)
		}

		self.view.addSubview(self.titleLabel!)
		
		//Constraints
		let heightConstraint = NSLayoutConstraint(item: self.titleLabel!, attribute: .height, relatedBy: .equal,
			toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24.0)
		let trailingConstraint = NSLayoutConstraint(item: self.titleLabel!, attribute: .trailing, relatedBy: .equal, toItem: self.titleLabel!.superview, attribute: .trailing, multiplier: 1.0, constant: -8.0)
		let yConstraint = NSLayoutConstraint(item: self.titleLabel!, attribute: .top, relatedBy: .equal, toItem: self.profileImageView!, attribute: .bottom, multiplier: 1.0, constant: 8.0)
		
		let xConstraint = NSLayoutConstraint(item: self.titleLabel!, attribute: .leading, relatedBy: .equal, toItem: self.titleLabel?.superview, attribute: .leading, multiplier: 1.0, constant: 8.0)
		
		self.view.addConstraints([yConstraint,xConstraint,trailingConstraint,heightConstraint])

	}
	
	private func setUpBioLabel(){
		self.bioLabel = ProfileBioLabel(frame: CGRect.zero)
		self.bioLabel!.translatesAutoresizingMaskIntoConstraints = false
		
		if self.member != nil {
			self.bioLabel!.setBioText(member: self.member!)
		}
		
		self.view.addSubview(self.bioLabel!)
		
		//Constraints
		let topConstraint = NSLayoutConstraint(item: self.bioLabel!, attribute: .top, relatedBy: .equal, toItem: self.titleLabel!, attribute: .bottom, multiplier: 1.0, constant: 8.0)
		let bottomConstraint = NSLayoutConstraint(item: self.bioLabel!, attribute: .bottom, relatedBy: .equal,
			toItem: self.bioLabel!.superview, attribute: .bottom, multiplier: 1.0, constant: -8.0)
		let trailingConstraint = NSLayoutConstraint(item: self.bioLabel!, attribute: .trailing, relatedBy: .equal, toItem: self.bioLabel!.superview, attribute: .trailing, multiplier: 1.0, constant: -8.0)
		let leadingConstraint = NSLayoutConstraint(item: self.bioLabel!, attribute: .leading, relatedBy: .equal, toItem: self.bioLabel!.superview, attribute: .leading, multiplier: 1.0, constant: 8.0)
		
		self.view.addConstraints([topConstraint,leadingConstraint,trailingConstraint,bottomConstraint])
	}
	
}
