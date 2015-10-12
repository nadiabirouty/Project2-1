//
//  InstagramTableViewController.swift
//  Instagram
//
//  Created by Nadia Birouty on 9/19/15.
//  Copyright © 2015 Nadia Birouty. All rights reserved.
//

import UIKit

class InstagramTableViewController: UITableViewController {
    
    var mediaDirectory: [InstagramUser.MediaItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        InstagramUser().fetchPopularMedia { (callback: [InstagramUser.MediaItem]) -> () in
            self.mediaDirectory = callback
            self.tableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2 //tableView.numberOfSections
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  8 //mediaDirectory.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let nilCell : UITableViewCell
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("Header", forIndexPath: indexPath) as! HeaderTableViewCell
            let member = mediaDirectory[indexPath.section]
            cell.profileUserName.text = member.MediaUser.username
            cell.date.text = member.datePhotoTaken.description
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("MediaMain", forIndexPath: indexPath) as! MediaMainTableViewCell
            let member = mediaDirectory[indexPath.section]
            cell.mediaCaption.text = member.MediaCaption
            cell.numLikes.text = member.mediaLikes.description
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("Comments", forIndexPath: indexPath) as! CommentsTableViewCell
            let member = mediaDirectory[indexPath.section]
            let numComments = member.mediaComments?.indices
            for var i in numComments! {
                if let comment : InstagramUser.CommentUser = member.mediaComments![i] {
                    cell.commentUser.text = comment.userComment.username
                    cell.comment.text = comment.comment
                }
                
            }
            return cell
        }
        return UITableViewCell()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
