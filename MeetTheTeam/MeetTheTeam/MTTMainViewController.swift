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
		
		guard let path = getJsonPath() else {
			return
		}
		
		guard let jsonData = NSData(contentsOfFile: path) else{
			return
		}
		do {
			let json:Any! = try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers)
			self.teamMemberArray = Mapper<MTTMember>().mapArray(JSONArray: json as! [[String : Any]])
		} catch {
			return
		}
	}
	
	private func getJsonPath() -> String? {
		guard let path = Bundle.main.path(forResource: "team", ofType: "json") else {
			return nil
		}
		return path
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
