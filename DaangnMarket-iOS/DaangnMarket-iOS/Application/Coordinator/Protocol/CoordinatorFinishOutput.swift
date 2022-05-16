//
//  CoordinatorFinishOutput.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

protocol CoordinatorFinishOutput {
  var finishScene: (() -> Void)? { get set }
}
