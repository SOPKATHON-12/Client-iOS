//
//  SplashVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/22.
//

import UIKit

class SplashVC: UIViewController {

  // MARK: - UI Component Part

  @IBOutlet weak var splashIconView: UIImageView!
  
  // MARK: - Life Cycle Part
  
    override func viewDidLoad() {
        super.viewDidLoad()
      delayWithSeconds(1) {
        self.showAnimation()
      }
    }
    
  private func showAnimation() {
    
    UIView.animate(withDuration: 1, delay: 0) {
      self.splashIconView.alpha = 0
    } completion: { _ in
      self.moveBaseView()
    }
    
  }
  
  private func moveBaseView() {
    let baseVC = ModuleFactory.shared.makeBaseVC()
    self.navigationController?.pushViewController(baseVC, animated: false)
  }
  
  // MARK: - @objc Function Part

}
// MARK: - Extension Part
