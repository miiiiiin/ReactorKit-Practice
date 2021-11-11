//
//  SearchResult.swift
//  GitHubSearch
//
//  Created by Running Raccoon on 2021/11/11.
//

import Foundation

struct SearchResult: Codable {
    var repos: [String]
    var nextPage: Int?
    
    enum CodingKeys: String, CodingKey {
        case repos = "items"
        case nextPage
    }
}
