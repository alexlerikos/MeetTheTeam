//
//  ProfileBioTextView.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit

class ProfileBioTextView: UITextView {

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		setUpTextView()
	}

	override init(frame: CGRect, textContainer: NSTextContainer?) {
		super.init(frame: frame,textContainer: textContainer)
		self.setUpTextView()
	}
	private func setUpTextView(){
		self.text = "No Bio"
		self.backgroundColor = UIColor.clear
		self.textColor = UIColor.textColor()
		self.font = UIFont.italicSystemFont(ofSize: 12.0)
	}

	func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
		return false; //do not show keyboard nor cursor
	}
	
	func setBioText(member:MTTMember){
		self.text = member.bio!
		self.font = UIFont.systemFont(ofSize: 20.0)
	}
	
}
