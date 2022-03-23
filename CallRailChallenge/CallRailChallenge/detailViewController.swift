//
//  detailViewController.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/21/22.
//

import UIKit

class detailViewController: UIViewController {
    
    @IBOutlet weak var earthQuakeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var tsunamiLabel: UILabel!
    @IBOutlet weak var magLabel: UILabel!
    
    var VM = EarthQuakeViewModel()
    
    var name : String!
    var tsunami: String!
    var mag: String!
    var time: String!
    var updatedTime: String!
    var url: String!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        earthQuakeLabel.text! = name
        timeLabel.text = time
        updateLabel.text = updatedTime
        tsunamiLabel.text = tsunami
        magLabel.text = mag
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "SHOWDETAIL"
            {
                let vc = segue.destination as! webViewController
                    vc.path = url
            }
        }

}
