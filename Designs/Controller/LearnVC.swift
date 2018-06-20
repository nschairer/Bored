//
//  LearnVC.swift
//  Designs
//
//  Created by Noah Schairer on 5/19/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import UIKit

class LearnVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func businessPressed(_ sender: Any) {
        let subject = Subject.Business
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let AVC = storyBoard.instantiateViewController(withIdentifier: "AVC") as? ArticleVC
        AVC?.subject = subject
        present(AVC!, animated: false, completion: nil)
    }
    @IBAction func sportsPressed(_ sender: Any) {
        let subject = Subject.Sports
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let AVC = storyBoard.instantiateViewController(withIdentifier: "AVC") as? ArticleVC
        AVC?.subject = subject
        present(AVC!, animated: false, completion: nil)
    }
    @IBAction func sciencePressed(_ sender: Any) {
        let subject = Subject.Science
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let AVC = storyBoard.instantiateViewController(withIdentifier: "AVC") as? ArticleVC
        AVC?.subject = subject
        present(AVC!, animated: false, completion: nil)
    }
    @IBAction func programmingPressed(_ sender: Any) {
        let subject = Subject.Programming
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let AVC = storyBoard.instantiateViewController(withIdentifier: "AVC") as? ArticleVC
        AVC?.subject = subject
        present(AVC!, animated: false, completion: nil)
    }
    
    
    
}
