//
//  ModuleFactory.swift

import Foundation


protocol ModuleFactoryProtocol {
  func makeBaseVC() -> BaseVC
  func makeHomeVC() -> HomeVC
  func makeSoundKingVC() -> SoundKingVC
  func makeTouchKingVC() -> TouchKingVC
  func makeWritingVC() -> WritingVC
  func makeFeedVC() -> FeedVC
  func makeRankingVC() -> RankingVC
func makeDecibelVC() -> DecibelVC
    func makeTabVC() -> TabVC
}

final class ModuleFactory: ModuleFactoryProtocol{

    

  static var shared = ModuleFactory()
  private init() { }
  
  func makeBaseVC() -> BaseVC {
    return BaseVC.controllerFromStoryboard(.base)
  }
  
  func makeHomeVC() -> HomeVC {
    return HomeVC.controllerFromStoryboard(.home)
  }
  
  func makeSoundKingVC() -> SoundKingVC {
    return SoundKingVC.controllerFromStoryboard(.soundKing)
  }
  
  func makeTouchKingVC() -> TouchKingVC {
    return TouchKingVC.controllerFromStoryboard(.touchKing)
  }
  
  func makeWritingVC() -> WritingVC {
    return WritingVC.controllerFromStoryboard(.writing)
  }

  func makeFeedVC() -> FeedVC {
    return FeedVC.controllerFromStoryboard(.feed)
  }
  
  func makeRankingVC() -> RankingVC {
    return RankingVC.controllerFromStoryboard(.ranking)
  }
    
    func makeDecibelVC() -> DecibelVC {
        return DecibelVC.controllerFromStoryboard(.decibel)
    }
    
    func makeTabVC() -> TabVC {
        return TabVC.controllerFromStoryboard(.tab)
    }
  
}
