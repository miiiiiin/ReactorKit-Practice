//
//  BaseService.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import Foundation

class BaseService {
  unowned let provider: ServiceProviderType

  init(provider: ServiceProviderType) {
    self.provider = provider
  }
}
