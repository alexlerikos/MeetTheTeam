//
//  ProfileBioLabel.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit

class ProfileBioLabel: UILabel {

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		self.setupLabel()
		
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupLabel()
	}
	
	private func setupLabel(){
		self.text = "No Bio"
		self.textColor = UIColor.white
		self.numberOfLines = 0
	}
	
	func setBioText(member:MTTMember){
		self.text = member.bio!
	}

}
