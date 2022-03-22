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
        let mag = VM.getMagnitude(features: index)
        let time = VM.getTime(features: index)
        
        cell.locationName.text = location 
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SHOWDETAIL"
        {
            let vc = segue.destination as! detailViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let index = VM.getEarthQuakeIndex(index: indexPath.row)
                vc.earthQuakeLabel.text = VM.getLocation(features: index)
                vc.magLabel.text = VM.getMagnitude(features: index)
                vc.tsunamiLabel.text = VM.getTsunami(features: index)
                vc.updateLabel.text = VM.getUpdated(features: index)
                vc.timeLabel.text = VM.getTime(features: index)
            }
        }
    }


}

