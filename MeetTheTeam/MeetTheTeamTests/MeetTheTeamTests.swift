//
//  MeetTheTeamTests.swift
//  MeetTheTeamTests
//
//  Created by Alexander Lerikos on 3/4/17.
//  Copyright © 2017 MeetTheTeam. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import MeetTheTeam

class MeetTheTeamTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	func testModelEvocation() {
		let potentialMTTMember = Mapper<MTTMember>().map(JSON: [:])
		
		potentialMTTMember?.avatarImageURL = "https://d1qb2nb5cznatu.cloudfront.net/users/114349-large?1462395805"
		potentialMTTMember?.bio = "I have zero cycles for this. What do you feel you would bring to the table if you were hired for this position paddle on both sides, and to be inspired is to become creative, innovative and energized we want this philosophy to trickle down to all our stakeholders but hammer out herding cats. Going forward drop-dead date.\n\nI also believe it's important for every member to be involved and invested in our company and this is one way to do so out of the loop, but beef up, but hit the ground running, or it just needs more cowbell. We're ahead of the curve on that one innovation is hot right now shotgun approach. Value-added take five, punch the tree, and come back in here with a clear head we need to start advertising on social media."
		potentialMTTMember?.firstName = "Sherrie"
		potentialMTTMember?.title = "Chief Produect Officer"
		potentialMTTMember?.lastName = "Chen"
		potentialMTTMember?.id = 1
		XCTAssertNotNil(potentialMTTMember)
	}
	
}
