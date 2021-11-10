//
//  GitHubSearchViewReactor.swift
//  GitHubSearch
//
//  Created by Running Raccoon on 2020/12/30.
//

import ReactorKit
import RxSwift
import RxCocoa

final class GitHubSearchViewReactor: Reactor {
    
    var initialState = State()
    
    
    enum Action {
        
        
    }
    
    enum Mutation {
        case setQuery(String?)
    }
    
    struct State {
        var query: String?
    }
    
    private func convertToURL(for query: String?, page: Int) -> URL? {
        guard let query = query, !query.isEmpty else { return nil }
        let searchUrl = "\(Constants.baseUrl)q=\(query)&page=\(page)"
        return URL(string: searchUrl)
    }
}
