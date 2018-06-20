//
//  BookGenreVC.swift
//  Designs
//
//  Created by Noah Schairer on 5/19/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import UIKit

class BookGenreVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var keys = [String]()
    var colorArray = [#colorLiteral(red: 1, green: 0.5935227871, blue: 0.5804076195, alpha: 1), #colorLiteral(red: 0.1234033778, green: 0.9532757401, blue: 0.6887583733, alpha: 1), #colorLiteral(red: 0.9568627451, green: 0.4431372549, blue: 0.2588235294, alpha: 1),#colorLiteral(red: 0.7746887803, green: 0.7746887803, blue: 0.7746887803, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.9098039216, green: 0, blue: 0.1254901961, alpha: 1), #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.5935227871, blue: 0.5804076195, alpha: 1), #colorLiteral(red: 0.1234033778, green: 0.9532757401, blue: 0.6887583733, alpha: 1), #colorLiteral(red: 0.9568627451, green: 0.4431372549, blue: 0.2588235294, alpha: 1),#colorLiteral(red: 0.7746887803, green: 0.7746887803, blue: 0.7746887803, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.9098039216, green: 0, blue: 0.1254901961, alpha: 1), #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 20
        for obj in bookDictionary {
            keys.append(obj.key)
        }
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
  
}


extension BookGenreVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookDictionary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GenreCell") as? GenreCell else {return UITableViewCell()}
        keys.sort()
        cell.updateUI(genre: keys[indexPath.row], color: colorArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let key = keys[indexPath.row]
        let genre = bookDictionary[key]
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let BLVC = storyBoard.instantiateViewController(withIdentifier: "BLVC") as? BookListVC
        BLVC?.genre = genre
        BLVC?.cellColor = self.colorArray[indexPath.row]
        present(BLVC!, animated: false, completion: nil)
    }

}
