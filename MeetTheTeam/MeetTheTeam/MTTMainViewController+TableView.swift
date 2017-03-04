//
//  MTTMainViewController+TableView.swift
//  MeetTheTeam
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import UIKit

extension MTTMainViewController : UITableViewDelegate, UITableViewDataSource {
	
	// MARK: Setup
	internal func setupMainTableView(){
		
		self.tableView = UITableView(frame: self.view.frame, style: .plain)
		self.tableView?.register(MTTMainTableViewCell.classForCoder(), forCellReuseIdentifier: memberCellIdentifier)
		self.tableView?.delegate = self
		self.tableView?.dataSource = self
		self.view.addSubview(self.tableView!)
		
	}
	
	// MARK: TableViewDelegate Methods
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}
	
	// MARK: TableViewDataSource Methods
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier:String = memberCellIdentifier
		
		let cell:MTTMainTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MTTMainTableViewCell
		return cell
	}
}
