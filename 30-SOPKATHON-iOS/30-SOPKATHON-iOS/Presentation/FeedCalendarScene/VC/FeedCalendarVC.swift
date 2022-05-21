//
//  FeedCalendarVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/22.
//

import UIKit

class FeedCalendarVC: UIViewController {

  // MARK: - Vars & Lets Part
  var monthEntity: MonthListEntity?

  // MARK: - UI Component Part

  
  // MARK: - Life Cycle Part
  
    override func viewDidLoad() {
        super.viewDidLoad()
      fetchData()
    }
  
  
  private func fetchData() {
    BaseService.default.getMonthData(month: 5) { result in
      result.success { entity in
        self.monthEntity = entity
      }
    }
  }
  
  
  // MARK: - IBAction Part

  @IBAction func iconClicked(_ sender: Any) {
    let vc = ModuleFactory.shared.makeFeedVC()
    self.navigationController?.pushViewController(vc, animated: true)
    
  }
  
  // MARK: - Custom Method Part

  
  // MARK: - @objc Function Part

}
// MARK: - Extension Part
