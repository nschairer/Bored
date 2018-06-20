//
//  GenreCell.swift
//  Designs
//
//  Created by Noah Schairer on 5/20/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import UIKit

class GenreCell: UITableViewCell {
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateUI(genre: String, color: UIColor) {
        genreLabel.text = genre
        self.contentView.backgroundColor = color
    }
}
