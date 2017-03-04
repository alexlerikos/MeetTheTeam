//
//  MTTMember.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class MTTMember: NSObject, Mappable {
	
	// MARK: Properties
	var avatarImageURL:String?
	var bio:String?
	var firstName:String?
	var lastName:String?
	var title:String?
	var id:Int?
	
	
	// MARK: Initializers
	
	required init?(map:Map) {
		super.init()
		self.mapping(map: map)
	}
	
	internal func mapping(map: Map) {
		self.avatarImageURL <- map["avatar"]
		self.bio <- map["bio"]
		self.firstName <- map["firstName"]
		self.lastName <- map["lastName"]
		self.title <- map["title"]
	}
	
}
