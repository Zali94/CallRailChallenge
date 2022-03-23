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


        navigationController?.pushViewController(vc, animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "SHOWDETAIL"
//        {
//            let vc = segue.destination as! detailViewController
//
//            if let indexPath = self.tableView.indexPathForSelectedRow
//            {
//                let index = VM.getEarthQuakeIndex(index: indexPath.row)
//                vc.indexAt = indexPath.row
//                vc.earthQuakeLabel.text = VM.getLocation(features: index)
//                vc.timeLabel.text = VM.getTime(features: index)
//                vc.updateLabel.text = VM.getUpdated(features: index)
//                vc.tsunamiLabel.text = VM.getTsunami(features: index)
//                vc.magLabel.text = VM.getMagnitude(features: index)
//            }
//        }
//    }


}

