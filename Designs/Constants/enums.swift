//
//  enums.swift
//  Designs
//
//  Created by Noah Schairer on 5/19/18.
//  Copyright © 2018 nschairer. All rights reserved.
//

import Foundation


let bookDictionary: [String:String] = [
    "Fiction": "hardcover-fiction",
    "NonFiction":"hardcover-nonfiction",
    "Sports": "sports",
    "Travel": "travel",
    "Science": "science",
    "Religion":"religion-spirituality-and-faith",
    "Politics":"hardcover-political-books",
    "Family": "family",
    "Humor": "humor",
    "Health":"health",
    "Expeditions, Disasters, and Adventures":"expeditions-disasters-and-adventures",
    "Animals": "animals",
    "Food": "food-and-fitness"
]

enum Subject: String {
    case Business
    case Sports
    case Science
    case Programming
    case Math
}
