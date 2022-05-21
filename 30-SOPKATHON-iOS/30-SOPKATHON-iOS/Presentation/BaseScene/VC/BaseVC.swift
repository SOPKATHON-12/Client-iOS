//
//  BaseVC.swift
//  ReadMe-iOS
//
//  Created by 송지훈 on 2022/04/12.
//

import UIKit
import SnapKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class BaseVC: UIViewController {
  // MARK: - Vars & Lets Part
  private let moduleFactory = ModuleFactory.shared
  private var tabList: [TabbarIconType] = []

  // MARK: - UI Component Part
  @IBOutlet weak var sceneContainerView: UIView!
  @IBOutlet weak var tabbar: TabbarView!
  
  // MARK: - Life Cycle Part
  override func viewDidLoad() {
    self.sceneContainerView.alpha = 0
    self.tabbar.alpha = 0
    super.viewDidLoad()
    configureTabbarDelegate()
    tabbarClicked(.home)
    addObserver()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.showAnimation()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    guard let navigationController = navigationController else { return }
    for (index,vc) in navigationController.viewControllers.enumerated() {
//      if vc.className == SplashVC.className {
//        navigationController.viewControllers.remove(at: index)
//      }
    }
  }
  
  open override func didMove(toParent parent: UIViewController?) {
    navigationController?.fixInteractivePopGestureRecognizer(delegate: self)
  }
  
  private func showAnimation() {
    UIView.animate(withDuration: 1, delay: 0) {
      self.sceneContainerView.alpha = 1
      self.tabbar.alpha = 1
    }
  }
}

// MARK: - 탭바를 제외한 Scene 세팅하는 부분

extension BaseVC: MainTabbarDelegate{
  private func configureTabbarDelegate(){
    tabbar.delegate = self
  }
  
  func tabbarClicked(_ type: TabbarIconType) {


    if !tabList.contains(type){
      let vc = makeScene(type)
      vc.view.translatesAutoresizingMaskIntoConstraints = false
      self.addChild(vc)
      sceneContainerView.addSubview(vc.view)
      vc.view.snp.makeConstraints{ $0.edges.equalToSuperview() }
      vc.didMove(toParent: self)
      tabList.append(type)
    }else {
      if let index = tabList.firstIndex(of: type) {
        let vc = sceneContainerView.subviews[index]
        sceneContainerView.bringSubviewToFront(vc)
        tabList.remove(at: index)
        tabList.append(type)
      }

      
    }
    

    
  }
  
  func plusButtonClicked() {
    
  }
  
  private func makeScene(_ type: TabbarIconType) -> UIViewController{
    switch(type) {
      case .home: return moduleFactory.makeHomeVC()
      case .feed: return moduleFactory.makeFeedVC()
      case .ranking: return moduleFactory.makeRankingVC()
        
    }
  }
}

extension BaseVC {
  func addObserver() {
    
    addObserverAction(.logout) { _ in

    }
  }
}

extension BaseVC : UIGestureRecognizerDelegate {
  public func gestureRecognizer(
    _ gestureRecognizer: UIGestureRecognizer,
    shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer
  ) -> Bool {
    return otherGestureRecognizer is PanDirectionGestureRecognizer
  }

}
