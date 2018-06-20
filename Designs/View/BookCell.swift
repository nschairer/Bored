//
//  BookCell.swift
//  Designs
//
//  Created by Noah Schairer on 5/19/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    @IBOutlet weak var bookTitleLbl: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureUI(book: Book) {
        bookTitleLbl.text = book.name
        authorLabel.text = book.author
    }

}

