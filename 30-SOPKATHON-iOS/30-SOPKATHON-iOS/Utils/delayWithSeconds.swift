//
//  delayWithSeconds.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/22.
//

import UIKit

extension UIViewController {
  func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
      DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
          completion()
      }
  }
}
