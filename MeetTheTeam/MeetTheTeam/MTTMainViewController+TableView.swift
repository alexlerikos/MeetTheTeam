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
		self.tableView?.register(MTTMainTableViewCell.self, forCellReuseIdentifier: MemberCellIdentifier)
		self.tableView?.delegate = self
		self.tableView?.dataSource = self
		self.tableView?.backgroundColor = UIColor.mainBackgroundColor()
		self.view.addSubview(self.tableView!)
		
	}
	
	// MARK: TableViewDelegate Methods
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if self.teamMemberArray == nil {
			return 0
		} else {
			return self.teamMemberArray!.count
		}
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
		return MainTableViewRowHeight
	}
	
	// MARK: TableViewDataSource Methods
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier:String = MemberCellIdentifier
		
		let cell:MTTMainTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MTTMainTableViewCell
		if let member = self.teamMemberArray?[indexPath.row]{
			cell.configureCell(member: member)
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let profileVC = MTTProfileViewController()
		profileVC.member = self.teamMemberArray?[indexPath.row]
		
		let backItem = UIBarButtonItem()
		backItem.title = ""
		backItem.tintColor = UIColor.textColor()
		self.navigationItem.backBarButtonItem = backItem
		self.navigationController?.pushViewController(profileVC, animated: true)
	}
}
