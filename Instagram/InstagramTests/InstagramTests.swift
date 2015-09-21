//
//  InstagramTests.swift
//  InstagramTests
//
//  Created by Nadia Birouty on 9/19/15.
//  Copyright © 2015 Nadia Birouty. All rights reserved.
//

import XCTest
@testable import Instagram

class InstagramTests: XCTestCase {
    
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
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    //test using my BobaGuys instagram instagram
    func testBaseCasePopularMedia(){
        /**
        let bobaGuys = InstagramUser.InstaUser(profileImageUrl: "notrelevant", username: "bobaguys", userID: "240315031", profileInfo: nil)
        let mediaItem = InstagramUser.MediaItem(MediaUser: bobaGuys, MediaCaption: nil, datePhotoTaken: 25, mediaLikes: 23, mediaComments: nil)
        InstagramUser.fetchPopularMedia(callback: mediaItem)
        **/
    }
    
    func testPrivateUser(){
        
    }
    
}
