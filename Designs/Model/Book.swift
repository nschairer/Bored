//
//  Book.swift
//  Designs
//
//  Created by Noah Schairer on 5/19/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import Foundation

class Book {
    private var _Name: String
    private var _Author: String
    private var _url: String
    
    var name: String {
        return _Name
    }
    var author: String {
        return _Author
    }
    var url: String {
        return _url
    }
    
    init(name: String, author: String, url: String) {
        _Name = name
        _Author = author
        _url = url
    }
}
