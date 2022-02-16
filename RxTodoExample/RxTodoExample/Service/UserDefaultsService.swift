//
//  UserDefaultsService.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import Foundation

extension UserDefaultsKey {
  static var tasks: Key<[[String: Any]]> { return "tasks" }
}

protocol UserDefaultsServiceType {
  func value<T>(forKey key: UserDefaultsKey<T>) -> T?
  func set<T>(value: T?, forKey key: UserDefaultsKey<T>)
}

final class UserDefaultsService: BaseService, UserDefaultsServiceType {

  private var defaults: UserDefaults {
    return UserDefaults.standard
  }

  func value<T>(forKey key: UserDefaultsKey<T>) -> T? {
    return self.defaults.value(forKey: key.key) as? T
  }

  func set<T>(value: T?, forKey key: UserDefaultsKey<T>) {
    self.defaults.set(value, forKey: key.key)
  }

}
