//
//  webViewController.swift
//  CallRailChallenge
//
//  Created by Z Ali on 3/22/22.
//

import UIKit
import WebKit

class webViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var path: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: path ?? "") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
