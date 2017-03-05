//
//  ProfileNameLabel.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit

class ProfileNameLabel: UILabel {

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		self.setupLabel()
		
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupLabel()
	}
	
	private func setupLabel(){
		self.text = "No name"
		self.textColor = UIColor.white
		self.font = UIFont.systemFont(ofSize: 30.0)
		
		// Add shadow
		self.layer.shadowOffset = CGSize(width: 0, height: 0)
		self.layer.shadowOpacity = 1
		self.layer.shadowRadius = 7.0
	}
	
	func setNameText(member:MTTMember){
		self.text = "\(member.firstName!) \(member.lastName!)"
	}
}
