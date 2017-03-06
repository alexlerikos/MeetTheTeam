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
	var titleLabel:ProfileTitleLabel?
	var bioTextView:ProfileBioTextView?
	var profileImageView:UIImageView?
	
	// MARK: Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.setUpViewAppearance()
		self.setUpProfileImageView()
		self.setUpTitleLabel()
		self.setUpBioLabelTextView()
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	private func setUpViewAppearance() {
		guard self.member != nil else {
			self.navigationItem.title = "No Name"
			return
		}
		
		self.navigationItem.title = "\(self.member!.firstName!) \(self.member!.lastName!)"
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
		self.view.backgroundColor = UIColor.mainBackgroundColor()
	}
	
	// MARK: Profile ImageView
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
		
		let radius:CGFloat = self.view.frame.width/2
		self.profileImageView?.layer.cornerRadius = radius
		self.profileImageView?.clipsToBounds = true
		
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
	
	// MARK: Title Label
	private func setUpTitleLabel(){
		self.titleLabel = ProfileTitleLabel(frame: CGRect.zero)
		self.titleLabel!.translatesAutoresizingMaskIntoConstraints = false
		
		if self.member != nil {
			self.titleLabel!.setTitleText(member: self.member!)
		}
		
		self.view.addSubview(self.titleLabel!)
		
		//Constraints
		let heightConstraint = NSLayoutConstraint(item: self.titleLabel!, attribute: .height, relatedBy: .equal,
			toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 28.0)
		let trailingConstraint = NSLayoutConstraint(item: self.titleLabel!, attribute: .trailing, relatedBy: .equal, toItem: self.titleLabel!.superview, attribute: .trailing, multiplier: 1.0, constant: -8.0)
		let yConstraint = NSLayoutConstraint(item: self.titleLabel!, attribute: .top, relatedBy: .equal, toItem: self.profileImageView!, attribute: .bottom, multiplier: 1.0, constant: 8.0)
		
		let xConstraint = NSLayoutConstraint(item: self.titleLabel!, attribute: .leading, relatedBy: .equal, toItem: self.titleLabel?.superview, attribute: .leading, multiplier: 1.0, constant: 8.0)
		
		self.view.addConstraints([yConstraint,xConstraint,trailingConstraint,heightConstraint])

	}

	// MARK: Bio Label
	private func setUpBioLabelTextView(){
		self.bioTextView = ProfileBioTextView(frame: CGRect.zero, textContainer: nil)
		self.bioTextView!.translatesAutoresizingMaskIntoConstraints = false
		
		if self.member != nil {
			self.bioTextView!.setBioText(member: self.member!)
		}
		
		self.view.addSubview(self.bioTextView!)
		
		//Constraints
		let topConstraint = NSLayoutConstraint(item: self.bioTextView!, attribute: .top, relatedBy: .equal, toItem: self.titleLabel!, attribute: .bottom, multiplier: 1.0, constant: 8.0)
		let bottomConstraint = NSLayoutConstraint(item: self.bioTextView!, attribute: .bottom, relatedBy: .equal,
		                                          toItem: self.bioTextView!.superview, attribute: .bottom, multiplier: 1.0, constant: -8.0)
		let trailingConstraint = NSLayoutConstraint(item: self.bioTextView!, attribute: .trailing, relatedBy: .equal, toItem: self.bioTextView!.superview, attribute: .trailing, multiplier: 1.0, constant: -8.0)
		let leadingConstraint = NSLayoutConstraint(item: self.bioTextView!, attribute: .leading, relatedBy: .equal, toItem: self.bioTextView!.superview, attribute: .leading, multiplier: 1.0, constant: 8.0)
		
		self.view.addConstraints([topConstraint,leadingConstraint,trailingConstraint,bottomConstraint])
	}

	
	
}
