//
//  ViewController.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/21/22.
//

//Our main viewController class which has a tableView setUp along with any addition UI Setup

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Initialzie our viewModel and also connect our tableView
    @IBOutlet weak var tableView: UITableView!
    var VM = EarthQuakeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //we call the API as soon as app enters ViewDidLoad and popuate the tableView and  we do it with async dispatch queue
        VM.fetchData()
        { data in
            self.VM.array = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.rowHeight = 50

    }
    
    //we import in our getRows function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.getRow()
    }

    //We import in the location bussiness logic and then setup our cell accordinly
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let index = VM.getEarthQuakeIndex(index: indexPath.row)
        let location = VM.getLocation(features: index)
        cell.locationName.text = location 
        
        return cell
    }

    //for didSelectRowAt we import in our details bussiness logic and the push to the detailViewController
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

