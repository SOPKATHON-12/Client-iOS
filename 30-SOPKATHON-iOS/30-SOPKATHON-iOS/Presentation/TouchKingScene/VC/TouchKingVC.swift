//
//  TouchKingVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/21.
//

import UIKit

class TouchKingVC: UIViewController {
  
  // MARK: - Vars & Lets Part

  weak var videoTimer: Timer?
  var minutes = 0
  var seconds = 15
  var milliseconds = 0
  
  var isTimerValid = false
  var count = 0 {
    didSet{
      countLabel.text = String(count)
    }
  }
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var angryIconView: UIImageView!
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  
  // MARK: - Life Cycle Part
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startTimer()
  }
  // MARK: - IBAction Part

  
  @IBAction func targetButtonsClicked(_ sender: Any) {
    if isTimerValid {
      UIView.animate(withDuration: 0.1) {
        self.angryIconView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
      } completion: { _ in
        UIView.animate(withDuration: 0.1) {
          self.angryIconView.transform = .identity
        }
      }
      makeVibrate(degree: .medium)
      count += 1
      makeAngryIcon()
    }
  }
  // MARK: - Custom Method Part
  
  private func makeAngryIcon() {
    switch (count) {
      case 0 ... 10 :
        self.angryIconView.image = ImageLiterals.MainIcon.angryIcon0
        
      case 11 ... 40 :
        self.angryIconView.image = ImageLiterals.MainIcon.angryIcon1
        
      case 41 ... 70 :
        self.angryIconView.image = ImageLiterals.MainIcon.angryIcon2
        
      default :
        self.angryIconView.image = ImageLiterals.MainIcon.angryIcon3

    }
  }
  
  
  // MARK: - @objc Function Part
  
}
// MARK: - Extension Part

extension TouchKingVC {
  
  func startTimer() {
    
    isTimerValid = true
    videoTimer?.invalidate()
    
    videoTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] _ in
      self?.timerIsRunning()
    })
    RunLoop.current.add(videoTimer!, forMode: RunLoop.Mode.common)
  }
  
  func timerIsRunning() {
    
    showTimer()
    if seconds == 0 {
      if minutes != 0 {
        minutes -= 1
      }
    }
    
    if milliseconds == 0 {
      seconds -= 1
    }
    if seconds < 0 {
      seconds = 59
    }
    milliseconds -= 1
    if milliseconds < 0 {
      milliseconds = 9
    }
    if minutes == 0 && seconds == 0 && milliseconds == 0 {
      showTimer()
      videoTimer?.invalidate()
      isTimerValid = false
    }
  }
  
  func showTimer() {
    let millisecStr = "\(milliseconds)"
    let secondsStr = seconds > 9 ? "\(seconds)" : "\(seconds)"
    let minutesStr = minutes > 9 ? "\(minutes)" : "0\(minutes)"
    
    timerLabel.text = secondsStr + " : " + millisecStr
  }
  
}
