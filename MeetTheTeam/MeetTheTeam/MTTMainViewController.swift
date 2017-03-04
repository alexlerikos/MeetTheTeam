//
//  MTTMainViewController.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit

class MTTMainViewController: UIViewController {
	
	// MARK: Properties
	var tableView:UITableView?
	
	
	// MARK: Initializers 
	override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.white
		self.setupMainTableView()
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
