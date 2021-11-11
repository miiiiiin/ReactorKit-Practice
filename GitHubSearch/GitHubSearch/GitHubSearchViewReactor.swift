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
        case updateQuery(String?)
        case loadNextPage
    }
    
    enum Mutation {
        case setQuery(String?)
        case setRepos([String], nextPage: Int?)
        case setLoadingNextPage(Bool)
        case appendRepos([String], nextPage: Int?)
    }
    
    struct State {
        var query: String?
        var repos: [String] = []
        var nextPage: Int?
        var isLoadingNextPage: Bool = false
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .updateQuery(query):
            let setQuery = Observable.just(Mutation.setQuery(query))
            
            let search = self.search(query: query, page: 1)
                .map { result in
                    return Mutation.setRepos(result.repos, nextPage: result.nextPage)
                }
            
            return .concat([setQuery, search])
            
        case .loadNextPage:
            // prevent from multiple requests
            guard !self.currentState.isLoadingNextPage else { return .empty() }
            guard let page = self.currentState.nextPage else { return .empty() }
            
            let startLoading = Observable.just(Mutation.setLoadingNextPage(true))
            let stopLoading = Observable.just(Mutation.setLoadingNextPage(false))
            
            // call API and append repos
            let search = self.search(query: self.currentState.query, page: page)
                .map {
                    Mutation.appendRepos($0.repos, nextPage: $0.nextPage)
                }
            
            return .concat([startLoading, search, stopLoading])
            
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        switch mutation {
        case let .setQuery(query):
            var newState = state
            newState.query = query
            return newState
            
        case let .setRepos(repos, nextPage):
            var newState = state
            newState.repos = repos
            newState.nextPage = nextPage
            return newState
            
        case let .setLoadingNextPage(isLoadingNextPage):
            var newState = state
            newState.isLoadingNextPage = isLoadingNextPage
            return newState
            
        case let .appendRepos(repos, nextPage):
            var newState = state
            newState.repos.append(contentsOf: repos)
            newState.nextPage = nextPage
            return newState
        }
    }
    
    
    private func convertToURL(for query: String?, page: Int) -> URL? {
        guard let query = query, !query.isEmpty else { return nil }
        let searchUrl = "\(Constants.baseUrl)q=\(query)&page=\(page)"
        return URL(string: searchUrl)
    }
    
    private func search(query: String?, page: Int) -> Observable<SearchResult> {
        let emptyResult = SearchResult(repos: [], nextPage: nil)
        
        guard let url = self.convertToURL(for: query, page: page) else { return .just(emptyResult) }
        
        return URLSession.shared.rx.json(url: url)
            .map { json -> SearchResult in
                print("result json: \(json)")
                guard let dict = json as? [String: Any] else { return emptyResult }
                guard let items = dict["items"] as? [[String: Any]] else { return emptyResult }
                
                let repos = items.compactMap { $0 ["full_name"] as? String }
                let nextPage = repos.isEmpty ? nil : page + 1
                
                print("repos check: \(repos.count), \(SearchResult(repos: repos, nextPage: nextPage))")
                return SearchResult(repos: repos, nextPage: nextPage)
            }
            .do(onError: { error in
                print("doonerror: \(error)")
            })
            .catchAndReturn(emptyResult)
    }
}
