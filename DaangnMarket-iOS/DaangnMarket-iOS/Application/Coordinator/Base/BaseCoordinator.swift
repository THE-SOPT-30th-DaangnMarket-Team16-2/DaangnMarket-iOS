//
//  BaseCoordinator.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

import UIKit

class BaseCoordinator: Coordinator {
  
  // MARK: - Vars & Lets
  var childCoordinators = [Coordinator]()
  
  // MARK: - Public methods
  func addDependency(_ coordinator: Coordinator) {
    for element in childCoordinators {
      if element === coordinator { return }
    }
    childCoordinators.append(coordinator)
  }
  
  func removeDependency(_ coordinator: Coordinator?) {
    guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
    
    for (index, element) in childCoordinators.enumerated() {
      if element === coordinator {
        childCoordinators.remove(at: index)
        break
      }
    }
  }
  
  // MARK: - Coordinator
  func start() {
    start()
  }
}
