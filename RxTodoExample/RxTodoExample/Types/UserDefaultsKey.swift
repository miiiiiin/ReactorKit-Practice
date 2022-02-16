//
//  UserDefaultsKey.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

/// A generic key for `UserDefaults`. Extend this type to define custom user defaults keys.
///
/// ```
/// extension UserDefaultsKey {
///   static var myKey: Key<String> {
///     return "myKey"
///   }
///
///   static var anotherKey: Key<Int> {
///     return "anotherKey"
///   }
/// }
/// ```
struct UserDefaultsKey<T> {
  typealias Key<T> = UserDefaultsKey<T>
  let key: String
}

extension UserDefaultsKey: ExpressibleByStringLiteral {
  public init(unicodeScalarLiteral value: StringLiteralType) {
    self.init(key: value)
  }

  public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
    self.init(key: value)
  }

  public init(stringLiteral value: StringLiteralType) {
    self.init(key: value)
  }
}
