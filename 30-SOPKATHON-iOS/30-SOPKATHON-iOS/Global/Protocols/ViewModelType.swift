//
//  ViewModelType.swift


import Foundation
import RxSwift

protocol ViewModelType{
  associatedtype Input
  associatedtype Output
  
  func transform(from input: Input, disposeBag: DisposeBag) -> Output
}
