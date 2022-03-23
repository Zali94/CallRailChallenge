//
//  detailViewController.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/21/22.
//

import UIKit

class detailViewController: UIViewController {
    //connect our labels
    @IBOutlet weak var earthQuakeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var tsunamiLabel: UILabel!
    @IBOutlet weak var magLabel: UILabel!
   //initialize local variables for sending details into DetailViewController
    var name : String!
    var tsunami: String!
    var mag: String!
    var time: String!
    var updatedTime: String!
    var url: String!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //initialize our labels with the value we passed over
        earthQuakeLabel.text = name
        timeLabel.text = "\(time ?? "") UTC"
        updateLabel.text = "\(updatedTime ?? "") UTC"
        tsunamiLabel.text = tsunami
        magLabel.text = mag
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    
        //setup a segue push for us to show more details regarding the earthquake on the URL Site 
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "SHOWDETAIL"
            {
                let vc = segue.destination as! webViewController
                    vc.path = url
            }
        }
}
