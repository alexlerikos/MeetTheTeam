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
	var memberNameLabel:UILabel?
	var memberTitleLabel:UILabel?
	var memberAvatarImageView:AvatarRoundImageView?
	
	// MARK: Initializers
	override init(style:UITableViewCellStyle, reuseIdentifier:String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.setupAvatarImage()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: Setup Methods
	private func setupAvatarImage() {
		
		self.memberAvatarImageView = AvatarRoundImageView(frame: CGRect(x: 0.0, y: 0.0, width: 75.0, height: 75.0))
		
		guard self.memberAvatarImageView != nil else{
			NSLog("Error instantiating avitar image", nil)
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
