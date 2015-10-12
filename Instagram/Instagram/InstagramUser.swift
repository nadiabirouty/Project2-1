//
//  InstagramUser.swift
//  Instagram
//
//  Created by Nadia Birouty on 9/19/15.
//  Copyright © 2015 Nadia Birouty. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class InstagramUser {
    static let Instagram = "Instagram"
    static let PopularMediaAPI = "https://api.instagram.com/v1/media/popular?client_id=c953ffadb974463f9f6813fc4fc91673"
    static let UserRecentMediaAPI_1 = "https://api.instagram.com/v1/users/"
    static let UserRecentMediaAPI_2 = "/media/recent/?client_id=c953ffadb974463f9f6813fc4fc91673"
    static let UserProfileAPI_1 = "https://api.instagram.com/v1/users/"
    static let UserProfileAPI_2 = "/?client_id=c953ffadb974463f9f6813fc4fc91673"

    struct ProfileInfo {
        let userID: String
        let numPosts: Int
        let numFollowers: Int
        let numFollowing: Int
    }
    
    struct InstaUser {
        let profileImageUrl: String
        let username: String
        let userID: String
    }
    
    struct CommentUser {
        let userComment: InstaUser
        let comment: String
    }
    
    struct MediaItem {
        let MediaUser: InstaUser
        let MediaCaption: String?
        let datePhotoTaken: Int
        let mediaLikes: Int
        let mediaComments: [CommentUser]?
    }

    func fetchPopularMedia(callback: ([MediaItem]) -> Void) {
        Alamofire.request(.GET, InstagramUser.PopularMediaAPI).responseJSON { _, _, jsonObj in
            self.populateFeedWith(jsonObj.value!, callback: callback)
        }
    }
    
    func fetchUserRecentMedia(aParticularMediaItem: MediaItem, callback: ([MediaItem]) -> Void) {
        Alamofire.request(.GET, InstagramUser.UserRecentMediaAPI_1 + aParticularMediaItem.MediaUser.userID + InstagramUser.UserRecentMediaAPI_2).responseJSON { _, _, jsonObj in
            self.populateFeedWith(jsonObj.value!, callback: callback)
        }
    }
    
    func fetchUserProfile(aParticularUser: InstaUser, callback: (ProfileInfo) -> Void) {
        Alamofire.request(.GET, InstagramUser.UserProfileAPI_1 + aParticularUser.userID + InstagramUser.UserProfileAPI_2).responseJSON {_, _, jsonObj in
            self.populateUserInfoView(jsonObj.value!, callback: callback)
        }
    }
    
    func populateUserInfoView(data: AnyObject?, callback: (ProfileInfo) -> Void) {
        let json = JSON(data!)
        callback(ProfileInfo(userID: json["id"].stringValue, numPosts: json["counts"]["media"].intValue, numFollowers: json["counts"]["followed_by"].intValue, numFollowing: json["counts"]["follows"].intValue))
    }
    
    func populateFeedWith(data: AnyObject?, callback: ([MediaItem]) -> Void) {
        let json = JSON(data!)
        var feedMediaItems = [MediaItem]()
        
        for item in json.arrayValue {
            let id = item["user"]["id"].stringValue
            let newUser = InstaUser(profileImageUrl: item["user"]["profile_picture"].stringValue, username: item["user"]["username"].stringValue, userID: id)
            var commentList = [CommentUser]()
            for comment in item["comments"].arrayValue {
                let id = comment["from"]["id"].stringValue
                let commentUser = InstaUser(profileImageUrl: comment["from"]["profile_picture"].stringValue, username: comment["from"]["username"].stringValue, userID: id)
                //see explanation #1 in ReadMe 
                commentList.append(CommentUser(userComment: commentUser, comment: comment["text"].stringValue))
            }
            feedMediaItems.append(MediaItem(MediaUser: newUser, MediaCaption: item["caption"]["text"].stringValue, datePhotoTaken: item["created_time"].intValue, mediaLikes: item["likes"]["count"].intValue, mediaComments: commentList))
        }
        callback(feedMediaItems)
    }
}