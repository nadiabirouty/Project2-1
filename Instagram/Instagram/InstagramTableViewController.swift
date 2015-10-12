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
        var cell : UITableViewCell?
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("Header", forIndexPath: indexPath)
        } else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCellWithIdentifier("MediaMain", forIndexPath: indexPath)
        } else if indexPath.section == 2 {
            cell = tableView.dequeueReusableCellWithIdentifier("Comments", forIndexPath: indexPath)
        }
        return cell!
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
