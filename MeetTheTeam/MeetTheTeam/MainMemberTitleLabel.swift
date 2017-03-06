//
//  MainMemberTitleLabel.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit

class MainMemberTitleLabel: UILabel {
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		self.setupLabel()
		
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupLabel()
	}
	
	private func setupLabel(){
		self.text = "No title"
		self.textColor = UIColor.textColor()
		self.font = UIFont.mainTitleFont()
	}
	
	func setTitleText(member:MTTMember){
		self.text = member.title
	}
}
