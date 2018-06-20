//
//  ArticleVC.swift
//  Designs
//
//  Created by Noah Schairer on 5/19/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import UIKit

class ArticleVC: UIViewController, XMLParserDelegate {
    var subject: Subject!
    
    var parser: XMLParser = XMLParser()
    var aTitle: String = String()
    var author: String = String()
    var aurl: String = String()
    var aDescription: String = String()

    var eName: String!
    var articleArray: [Article] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 20
        prepare()
        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func prepare() {
        let url: URL!
        if subject.rawValue == "Business" {
            url = URL(string: "https://www.investopedia.com/feedbuilder/feed/getfeed/?feedName=rss_articles")!
            print("Business articles loading...")
        } else if subject.rawValue == "Sports" {
            url = URL(string: "http://www.espn.com/espn/rss/news")!
            print("Sports articles loading...")
        } else if subject.rawValue == "Science" {
            url = URL(string: "http://feeds.newscientist.com/features")!
            print("Science articles loading...")
        } else if subject.rawValue == "Programming" {
            print("programming articles loading...")
            url = URL(string: "https://medium.com/feed/topic/programming/")!
        } else if subject.rawValue == "Math" {
            return
        } else {
            return
        }
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()
        tableView.reloadData()
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        //setup
        eName = elementName
        if elementName == "item" {
            aTitle = String()
            author = String()
            aurl = String()
            aDescription = String()
        }
        
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        //parse
        if eName == "title" {
            aTitle += string
        } else if eName == "dc:creator" {
            author += string
        } else if eName == "link" {
            aurl += string
        } else if eName == "description" {
            aDescription += string
        }
        
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        //wrapup
        if elementName == "item" {
            print(aDescription)
            articleArray.append(Article(title: aTitle, author: author, url: aurl, description: aDescription))
        }
    }
}


extension ArticleVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LearningCell") as? ArticleCell else {return UITableViewCell()}
        let art = articleArray[indexPath.row]
        cell.configureUI(article: art, subject: subject)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let art = articleArray[indexPath.row]
        let url = URL(string: art.Url.trimmingCharacters(in: .whitespacesAndNewlines))!
        tableView.deselectRow(at: indexPath, animated: true)
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}




