////
////  Reactor.swift
////  GitHubSearch
////
////  Created by Running Raccoon on 2021/11/10.
////
//
//import Foundation
//
// enum Action {
//     case updateQuery(String?)
//     case loadNextPage
// }
//
// enum Mutation {
//     case setQuery(String?)
//     case setRepose([String], nextPage: Int?)
//     case appendRepos([String], nextPage: Int?)
//     case setLoadingNextPage(Bool)
// }
//
// struct State {
//     var query: String?
//     var repos: [String] = []
//     var nextPage: Int?
//     var isLoadingNextPage: Bool = false
// }
//
// let initialState = State()
//
////    func mutate(action: Action) -> Observable<Mutation> {
////        print("mustate: \(action)")
////        switch action {
////        case let .updateQuery(query):
////            return Observable.concat([
////                // 1. set current state's query (.setQuery)
////                Observable.just(Mutation.setQuery(query)),
////
////                // 2. call API and set repos (.setRepos)
////                self.search(query: query, page: 1)
////                // cancel
////
////            ])
////            break
////        case .loadNextPage:
////            break
////        }
////    }
//
// func reduce(state: State, mutation: Mutation) -> State {
//     switch mutation {
//     case let .setQuery(query):
//         var newState = state
//         newState.query = query
//         return newState
//
//     case let .setRepose(repos, nextPage):
//         var newState = state
//         newState.repos = repos
//         newState.nextPage = nextPage
//         return newState
//
//     case let .appendRepos(repos, nextPage):
//         var newState = state
//         newState.repos.append(contentsOf: repos)
//         newState.nextPage = nextPage
//         return newState
//
//     case let .setLoadingNextPage(isLoadingNextPage):
//         var newState = state
//         newState.isLoadingNextPage = isLoadingNextPage
//         return newState
//     }
// }
//
// private func url(for query: String?, page: Int) -> URL? {
//     guard let query = query, !query.isEmpty else { return nil }
//     return URL(string: "https://api.github.com/search/repositories?q=\(query)&page=\(page)")
// }
//
// private func search(query: String?, page: Int) -> Observable<(repos: [String], nextPage: Int?)> {
//     let emptyResult: ([String], Int?) = ([], nil)
//     guard let url = self.url(for: query, page: page) else { return .just(emptyResult) }
//     return URLSession.shared.rx.json(url: url)
//         .map { json -> ([String], Int?) in
//             guard let dict = json as? [String:Any] else { return emptyResult }
//             guard let items = dict["items"] as? [[String:Any]] else { return emptyResult }
//
//             let repos = items.compactMap { $0["full_name"] as? String }
//             let nextPage = repos.isEmpty ? nil : page + 1
//             return (repos, nextPage)
//         }
//         .do(onError: { error in
//             if case let .some(.httpRequestFailed(reponse, _)) = error as? RxCocoaURLError, reponse.statusCode == 403 {
//                 print("⚠️ GitHub API rate limit exceeded. Wait for 60 seconds and try again.")
//             }
//         })
//         .catchErrorJustReturn(emptyResult)
// }
