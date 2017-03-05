//
//  MTTMainViewController.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit
import ObjectMapper

class MTTMainViewController: UIViewController {
	
	// MARK: Properties
	var tableView:UITableView?
	var teamMemberArray:[MTTMember]?
	
	// MARK: Initializers 
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.backgroundColor = UIColor.white
		self.navigationItem.title = "Meet The Team"
		
		self.setupMainTableView()
		
		self.setupTeamMemberData()
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: Setup Team Member Array
	
	private func setupTeamMemberData(){
		
		
		let member = Mapper<MTTMember>().map(JSON: [:])
		
		member?.avatarImageURL = "https://d1qb2nb5cznatu.cloudfront.net/users/114349-large?1462395805"
		member?.bio = "I have zero cycles for this. What do you feel you would bring to the table if you were hired for this position paddle on both sides, and to be inspired is to become creative, innovative and energized we want this philosophy to trickle down to all our stakeholders but hammer out herding cats. Going forward drop-dead date.\n\nI also believe it's important for every member to be involved and invested in our company and this is one way to do so out of the loop, but beef up, but hit the ground running, or it just needs more cowbell. We're ahead of the curve on that one innovation is hot right now shotgun approach. Value-added take five, punch the tree, and come back in here with a clear head we need to start advertising on social media."
		member?.firstName = "Sherrie"
		member?.title = "Chief Produect Officer"
		member?.lastName = "Chen"
		member?.id = 1
		
		self.teamMemberArray = [member!,member!,member!,member!,member!,member!,member!,member!,member!,member!,member!,member!,member!,member!,member!,member!,member!,member!]
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
