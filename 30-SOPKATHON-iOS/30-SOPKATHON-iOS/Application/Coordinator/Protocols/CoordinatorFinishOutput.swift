//
//  CoordinatorFinishOutput.swift

protocol CoordinatorFinishOutput {
  var finishScene: (() -> Void)? { get set }
}
