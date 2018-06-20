//
//  BookListVC.swift
//  Designs
//
//  Created by Noah Schairer on 5/19/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import UIKit
import Alamofire

class BookListVC: UIViewController {
    var genre: String!
    var bookArray: [Book] = []
    var cellColor: UIColor!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 20
        print(genre)
        downloadBooks(Key: NYTAPIKEY, URL: NYTURL)
        // Do any additional setup after loading the view.
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    func downloadBooks(Key: String, URL: String) {
        var name: String!
        var author: String!
        var url: String!
        Alamofire.request(URL + "?list=" + genre, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["api-key": Key]).responseJSON(completionHandler: { (response) in
            print(response.result)
            guard let json = response.result.value as? [String: Any] else {return}
            print(json)
            if let results = json["results"] as? [Dictionary<String, Any>] {
                for obj in results {
                    url = obj["amazon_product_url"] as! String
                    if let bookDetails = obj["book_details"] as? [Dictionary<String, Any>] {
                        author = bookDetails[0]["author"] as! String
                        name = bookDetails[0]["title"] as! String
                        self.bookArray.append(Book(name: name, author: author, url: url))
                    }
                }
            }
            print(self.bookArray)
            self.tableView.reloadData()
        })
    }
}

extension BookListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as? BookCell else {return UITableViewCell()}
        let book: Book!
        
        book = bookArray[indexPath.row]
        cell.contentView.backgroundColor = cellColor
        cell.configureUI(book: book)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = bookArray[indexPath.row]
        do {
            let url = try book.url.asURL()
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } catch {
            print("error convertin url")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}








