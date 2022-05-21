//
//  HomeVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/21.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - Vars & Lets Part
    
    
    // MARK: - UI Component Part
    @IBOutlet weak var decibelButton: UIButton!
    @IBOutlet weak var touchButton: UIButton!
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBAction Part
    @IBAction func tapDecibelButton(_ sender: Any) {
      moveDecible()
    }
    
    @IBAction func tapTouchButton(_ sender: Any) {
      moveTap()
    }
  
  private func moveDecible() {
    let decibelVC = ModuleFactory.shared.makeSoundKingVC()
    self.navigationController?.pushViewController(decibelVC, animated: true)
  }
  
  private func moveTap() {
    let tapVC = ModuleFactory.shared.makeTouchKingVC()
    self.navigationController?.pushViewController(tapVC, animated: true)
  }
}


// MARK: - Custom Method Part


// MARK: - @objc Function Part

// MARK: - Extension Part
