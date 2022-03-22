//
//  ViewController.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/21/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var VM = EarthQuakeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        VM.fetchData()
        { data in
            self.VM.array = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.getRow()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let index = VM.getEarthQuakeIndex(index: indexPath.row)
        let location = VM.getLocation(features: index)
        cell.locationName.text = location 
        
        return cell
    }


}

