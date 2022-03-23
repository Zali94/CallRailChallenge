//
//  ViewController.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/21/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController

       let index = VM.getEarthQuakeIndex(index: indexPath.row)
        vc.name = VM.getLocation(features: index)
        vc.time = VM.getTime(features: index)
        vc.updatedTime = VM.getUpdated(features: index)
        vc.tsunami = VM.getTsunami(features: index)
        vc.mag = VM.getMagnitude(features: index)
        vc.url = VM.getURL(features: index)


        navigationController?.pushViewController(vc, animated: true)
    }

}

