//
//  WritingVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/21.
//

import UIKit

class WritingVC: UIViewController {

  // MARK: - Vars & Lets Part
  
  var angryLevel = 0

  @IBOutlet weak var writeContainerTopConstraint: NSLayoutConstraint!
  
  // MARK: - UI Component Part
    @IBOutlet weak var writingView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var upsetLabel: UILabel!
    @IBOutlet weak var userImgView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var finishButton: UIButton!
    // MARK: - Life Cycle Part
  
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
        writingView.layer.cornerRadius = 10
        commentTextField.layer.cornerRadius = 10
      writingView.layer.applyShadow(color: .black, alpha: 0.25, x: 2.23, y: 4.47, blur: 4.47, spread: 0)
         
    }
  
  override func viewWillAppear(_ animated: Bool) {
    registerForKeyboardNotifications()
  }
    
  override func viewDidDisappear(_ animated: Bool) {
    unregisterForKeyboardNotifications()
  }
  // MARK: - IBAction Part
  @IBAction func writeFinishButton(_ sender: Any) {
    dismiss(animated: true)
    postObserverAction(.writeComplete)
    
    BaseService.default.writeRankList(type: "tab", score: 100, comment: "한줄평", emojiLevel: 2) { result in
      
    }
  }
    
    
  // MARK: - Custom Method Part

  
  private func registerForKeyboardNotifications() {
    NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  private func unregisterForKeyboardNotifications() {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  
  @objc private func keyboardWillShow(_ notification: Notification) {
    let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keyboardRectangle = keyboardFrame.cgRectValue
      let keyboardHeight = keyboardRectangle.height
      writeContainerTopConstraint.constant = 50
    }
    
    UIView.animate(withDuration: duration, delay: 0){
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func keyboardWillHide(_ notification: Notification) {
    let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
    writeContainerTopConstraint.constant = 216
    UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve)) {
      self.view.layoutIfNeeded()
    }
  }
  
  private func makeImg() {
    
    
      switch (angryLevel) {
        case 1:
          self.userImgView.image = ImageLiterals.MainIcon.angryIcon1
          
        case 2 :
          self.userImgView.image = ImageLiterals.MainIcon.angryIcon2
          
        case 3 :
          self.userImgView.image = ImageLiterals.MainIcon.angryIcon3
          
        default :
          self.userImgView.image = ImageLiterals.MainIcon.angryIcon4

    }
  }
  
  // MARK: - @objc Function Part

}
// MARK: - Extension Part
