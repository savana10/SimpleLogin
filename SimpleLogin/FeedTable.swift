//
//  FeedTable.swift
//  HexMask
//
//  Created by Savana on 01/06/16.
//  Copyright © 2016 SH. All rights reserved.
//

import UIKit


class FeedTable: UITableViewController {

    @IBOutlet weak var bbi_signOut: UIBarButtonItem!
    //MARK: UIViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView!.estimatedRowHeight = 200;
        self.tableView!.rowHeight = UITableViewAutomaticDimension;
        self.navigationController?.navigationBar.hidden = false;
        self.navigationItem.hidesBackButton = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DisplayCell", forIndexPath: indexPath);
        return cell;
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
    }
    //MARK:- Logout
 
    @IBAction func signput(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true);
    }

}
