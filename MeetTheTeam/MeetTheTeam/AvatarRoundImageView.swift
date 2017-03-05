//
//  AvatarRoundImageView.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit
import Kingfisher

class AvatarRoundImageView: UIImageView {

	var borderColor:CGColor?
	var fillColor: CGColor?
	var maskSize: CGFloat?
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.baseValues()
	}
	
	required override init(frame: CGRect) {
		super.init(frame: frame)
		self.baseValues()
	}
	
	private func baseValues() {
		self.maskSize = AvtarMaskSize
		self.borderColor = UIColor.textColor().cgColor
		self.fillColor = UIColor.clear.cgColor
		self.layer.borderColor = self.borderColor!
	}
	

}
