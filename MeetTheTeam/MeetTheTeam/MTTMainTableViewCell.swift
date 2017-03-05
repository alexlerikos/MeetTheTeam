//
//  MTTMainTableViewCell.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit


class MTTMainTableViewCell: UITableViewCell {
	
	var member:MTTMember?
	var memberNameLabel: MainMemberNameLabel?
	var memberTitleLabel: MainMemberTitleLabel?
	var memberAvatarImageView:AvatarRoundImageView?
	
	// MARK: Initializers
	override init(style:UITableViewCellStyle, reuseIdentifier:String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.setupAvatarImage()
		self.setupNameLabel()
		self.setupTitleLabel()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: Setup Methods
	private func setupAvatarImage() {
		
		self.memberAvatarImageView = AvatarRoundImageView(frame: CGRect(x: 0.0, y: 0.0, width: 75.0, height: 75.0))
		
		guard self.memberAvatarImageView != nil else{
			return
		}
		
		self.memberAvatarImageView!.image = UIImage(named:"AvatarBase")
		self.memberAvatarImageView!.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(self.memberAvatarImageView!)
		
		
		// Constraints
		let imageSide:CGFloat = 2.0 * AvatarImageRadius
		
		let heightConstraint = NSLayoutConstraint(item: self.memberAvatarImageView!, attribute: .height, relatedBy: .equal,
			toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageSide)
		
		let widthConstraint = NSLayoutConstraint(item: self.memberAvatarImageView!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageSide)
		
		let yConstraint = NSLayoutConstraint(item: self.memberAvatarImageView!, attribute: .centerY, relatedBy: .equal, toItem: self.memberAvatarImageView!.superview, attribute: .centerY, multiplier: 1, constant: 0.0)
		
		let xConstraint = NSLayoutConstraint(item: self.memberAvatarImageView!, attribute: .leading, relatedBy: .equal, toItem: self.memberAvatarImageView!.superview, attribute: .leading, multiplier: 1, constant: 8.0)
		
		self.addConstraints([yConstraint,xConstraint,heightConstraint, widthConstraint])
	}
	
	private func setupNameLabel() {
		
		self.memberNameLabel = MainMemberNameLabel(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 24.0))
		self.memberNameLabel!.translatesAutoresizingMaskIntoConstraints = false
		
		if self.member != nil {
			self.memberNameLabel!.setNameText(member: self.member!)
		}
		
		self.addSubview(self.memberNameLabel!)
		
		//Constraints
		let heightConstraint = NSLayoutConstraint(item: self.memberNameLabel!, attribute: .height, relatedBy: .equal,
		                                          toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24.0)
		
		let widthConstraint = NSLayoutConstraint(item: self.memberNameLabel!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0)
		
		let yConstraint = NSLayoutConstraint(item: self.memberNameLabel!, attribute: .centerY, relatedBy: .equal, toItem: self.memberAvatarImageView!.superview, attribute: .centerY, multiplier: 1, constant: -25.0)
		
		let xConstraint = NSLayoutConstraint(item: self.memberNameLabel!, attribute: .leading, relatedBy: .equal, toItem: self.memberAvatarImageView, attribute: .trailing, multiplier: 1, constant: 8.0)
		
		self.addConstraints([yConstraint,xConstraint,heightConstraint, widthConstraint])
		
		
	}

	private func setupTitleLabel() {
		
		self.memberTitleLabel = MainMemberTitleLabel(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 24.0))
		self.memberTitleLabel!.translatesAutoresizingMaskIntoConstraints = false
		
		if self.member != nil {
			self.memberTitleLabel!.setTitleText(member: self.member!)
		}
		
		self.addSubview(self.memberTitleLabel!)
		
		//Constraints
		let heightConstraint = NSLayoutConstraint(item: self.memberTitleLabel!, attribute: .height, relatedBy: .equal,
		                                          toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 24.0)
		
		let widthConstraint = NSLayoutConstraint(item: self.memberTitleLabel!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0)
		
		let yConstraint = NSLayoutConstraint(item: self.memberTitleLabel!, attribute: .centerY, relatedBy: .equal, toItem: self.memberAvatarImageView!.superview, attribute: .centerY, multiplier: 1, constant: 25.0)
		
		let xConstraint = NSLayoutConstraint(item: self.memberTitleLabel!, attribute: .leading, relatedBy: .equal, toItem: self.memberAvatarImageView, attribute: .trailing, multiplier: 1, constant: 8.0)
		
		self.addConstraints([yConstraint,xConstraint,heightConstraint, widthConstraint])
		
		
	}
	
	// MARK: Configure Cell
	func configureCell(member:MTTMember){
		self.member = member
		self.memberTitleLabel?.setTitleText(member:member)
		self.memberNameLabel?.setNameText(member: member)
		
		self.updateAvatarImage()
	}
	
	private func updateAvatarImage(){
	
		guard let imageURLString = self.member?.avatarImageURL else {
			return
		}
		
		let avatarImageURL = URL(string: imageURLString)
		
		self.memberAvatarImageView!.kf.setImage(with: avatarImageURL!,
			completionHandler: {(image, error, cacheType, imageUrl) in
				guard error == nil else {
					self.memberAvatarImageView!.image = UIImage(named:"AvatarBase")
					return
				}
				self.memberAvatarImageView?.image = image
			}
		)
	
	}


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
