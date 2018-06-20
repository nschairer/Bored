//
//  ListenVC.swift
//  Designs
//
//  Created by Noah Schairer on 5/19/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import UIKit

class ListenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func podcastClicked(_ sender: Any) {
        let url = URL(string: podcastURL)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        } else {
            UIApplication.shared.open(URL(string: "https://www.apple.com/itunes/podcasts/")!)
            print("need to download podcast app")
        }
    }
    
    @IBAction func spotifyClicked(_ sender: Any) {
        let url = URL(string: spotifyUrl)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        } else {
            UIApplication.shared.open(URL(string: "https://spotify.com")!)
            print("need to download spotify app")
        }
    }
    @IBAction func appleMusicClicked(_ sender: Any) {
        let url = URL(string: appleMusicUrl)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        } else {
            UIApplication.shared.open(URL(string: "https://www.apple.com/apple-music/")!)
            print("need to download apple music app")
        }
    }
    
    @IBAction func soundCloudClicked(_ sender: Any) {
        let url = URL(string: soundCloudUrl)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!)
        } else {
            UIApplication.shared.open(URL(string: "https://soundcloud.com/")!)
            print("need to download soundcloud app")
        }
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
