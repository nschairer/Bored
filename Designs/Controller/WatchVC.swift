//
//  WatchVC.swift
//  Designs
//
//  Created by Noah Schairer on 5/19/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import UIKit

class WatchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func youtubeClicked(_ sender: Any) {
        let url = URL(string: youtubeUrl)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        } else {
            UIApplication.shared.open(URL(string: "https://www.youtube.com")!)
            print("need to download youtube app")
        }
    }
    @IBAction func netflixClicked(_ sender: Any) {
        let url = URL(string: netflixUrl)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        } else {
            UIApplication.shared.open(URL(string: "https://www.netflix.com")!)
            print("need to download netflix app")
        }
    }
    @IBAction func huluClicked(_ sender: Any) {
        let url = URL(string: huluUrl)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        } else {
            UIApplication.shared.open(URL(string: "https://www.hulu.com")!)
            print("need to download hulu app")
        }
    }
    
    
    
}
