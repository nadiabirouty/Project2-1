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
        let nilCell : UITableViewCell
        if indexPath.section == 0 {
            let cell : HeaderTableViewCell
            cell = tableView.dequeueReusableCellWithIdentifier("Header", forIndexPath: indexPath)
            let member = mediaDirectory[indexPath.row]
            cell.profileUserName.text = member.MediaUser.username
            cell.date.text = member.datePhotoTaken.description
            return cell
        } else if indexPath.section == 1 {
            let cell : MediaMainTableViewCell
            cell = tableView.dequeueReusableCellWithIdentifier("MediaMain", forIndexPath: indexPath)
            let member = mediaDirectory[indexPath.row]
            cell.mediaCaption.text = member.MediaCaption
            cell.numLikes.text = member.mediaLikes.description
            return cell
        } else if indexPath.section == 2 {
            let cell : CommentsTableViewCell
            cell = tableView.dequeueReusableCellWithIdentifier("Comments", forIndexPath: indexPath)
            let member = mediaDirectory[indexPath.row]
           //usercomments
            return cell
        }
        return nilCell
    }
    //for (int i = 0; i <= 8; i++) {
    //  cell.commentUser.text = member.mediaComments[i].userComment.username
    //cell.comment.text = member.mediaComments[i].userComment.comment
    //}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
