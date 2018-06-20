//
//  Article.swift
//  Designs
//
//  Created by Noah Schairer on 5/19/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import Foundation

class Article {
    private var _Title: String
    private var _Author: String
    private var _Url: String
    private var _Description: String
    
    var Description: String {
        return _Description
    }
    var Title: String {
        return _Title
    }
    var Author: String {
        return _Author
    }
    var Url: String {
        return _Url
    }
    
    init(title: String, author: String, url: String, description: String) {
        self._Title = title
        self._Author = author
        self._Url = url
        self._Description = description
    }
}
