//
//  ArticleCell.swift
//  Designs
//
//  Created by Noah Schairer on 5/19/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorOrDescriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureUI(article: Article, subject: Subject) {
        titleLbl.text = article.Title
        if subject.rawValue == "Sports" || subject.rawValue == "Science" {
            authorOrDescriptionLbl.text = article.Description
        } else {
            authorOrDescriptionLbl.text = article.Author
        }
        if subject.rawValue == "Business" {
            self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        } else if subject.rawValue == "Sports" {
           self.backgroundColor = #colorLiteral(red: 0.173061341, green: 0.7563425899, blue: 0.4194884598, alpha: 1)
        } else if subject.rawValue == "Science" {
           self.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.4431372549, blue: 0.2588235294, alpha: 1)
        } else if subject.rawValue == "Programming" {
           self.backgroundColor = #colorLiteral(red: 0.2, green: 0.2705882353, blue: 0.3098039216, alpha: 1)
        }
    }
}
