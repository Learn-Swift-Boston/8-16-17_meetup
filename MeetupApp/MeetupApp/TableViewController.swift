//
//  TableViewController.swift
//  MeetupApp
//
//  Created by Matt Dias on 8/16/17.
//  Copyright © 2017 Zipcar. All rights reserved.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {

	var datasource: [[String: Any]]? // will eventually be the source data for the table

    override func viewDidLoad() {
        super.viewDidLoad()

		guard let url = URL(string: "http://localhost:8080/schedule") else {
			print("my god the url is borked")
			return
		} // ensure we have a good URL to make a request with

		Alamofire.request(url).responseJSON { (response) in

			if let json = response.result.value as? [String: Any], // make sure we have a good response
			   let schedule = json["schedule"] as? [[String: Any]]
			{
				self.datasource = schedule // set the source data for the table
				self.tableView.reloadData() // reload the table after downloading source data
			}
		}

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		guard datasource != nil else { // if we haven't received the data from the server, don't show anything
			return 0
		}

        return datasource!.count
		/*
			I use the ! to force unwrap datasource because the guard 
			above it ensure's that it's not nil (since we declared it as 
			an optional variable). While it's allowed, it's generally 
			considered a bad practice to use ! to force unwrap optionals. 
			
			In this case, I used to it for explanation purposes. If you 
			want to follow "good" standards and practices, datasource 
			could be unwrapped in a guard like we do in other places in 
			this file.
		*/
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

		guard let dataDictionary = datasource?[indexPath.row],
			  let title = dataDictionary["startTime"] as? String,
			  let event = dataDictionary["event"] as? String else {
			return cell
		} // get the display data from datasouce or exit

		cell.textLabel?.text = title
		cell.detailTextLabel?.text = event

        return cell
    }
}
