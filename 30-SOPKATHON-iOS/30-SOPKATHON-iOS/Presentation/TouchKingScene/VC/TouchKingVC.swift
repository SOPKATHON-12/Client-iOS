//
//  TouchKingVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/21.
//

import UIKit

class TouchKingVC: UIViewController {
  
  // MARK: - Vars & Lets Part
  var fingers = [String?](repeating: "", count: 5)

  weak var videoTimer: Timer?
  var minutes = 0
  var seconds = 30
  var milliseconds = 0
  
  var isTimerValid = false
  var count = 0 {
    didSet{
      countLabel.text = String(count)
    }
  }
  
  // MARK: - UI Component Part
  
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
      makeVibrate(degree: .medium)
      count += 1
    }
  }
  // MARK: - Custom Method Part
  
  
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
