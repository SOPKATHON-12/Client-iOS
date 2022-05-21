//
//  SoundKingVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/21.
//

import UIKit
import AVFoundation
import CoreAudio

class SoundKingVC: UIViewController {
  
  // MARK: - Vars & Lets Part
  
  
  var recorder: AVAudioRecorder!
  var levelTimer = Timer()
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var lblDecibel: UILabel!
  @IBOutlet weak var lblLoudState: UILabel!
  
  // MARK: - Life Cycle Part
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initRecord()
    
  }
  
  func initRecord() {
    
    
      
    
    
    switch AVAudioSession.sharedInstance().recordPermission {
      case AVAudioSession.RecordPermission.granted:
        record()
      case AVAudioSession.RecordPermission.denied:
        recordNotAllowed()
      case AVAudioSession.RecordPermission.undetermined:
        AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
          print(granted)
          if granted {
            // timer는 main thread 에서 실행됨
            // 그러나 requestRecordPermission 의 클로저 함수는 별도의 스레드에서 실행되므로
            // 강제로 main 에서 실행되도록 한다.
            //
            DispatchQueue.main.sync {
              self.record()
            }
          } else {
            self.recordNotAllowed()
          }
        })
      default:
        break
    }
  }
  
  
  func recordNotAllowed() {
    print("permission denied")
  }
  
  func record() {
    
    let audioSession = AVAudioSession.sharedInstance()
    
    // userDomainMask에 녹음 파일 생성
    let documents = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0])
    let url = documents.appendingPathComponent("record.caf")
    print("이 URL을 복사한 뒤 Finder - '이동' 메뉴 - '폴더로 가기'를 사용해 이동하세요.",
          documents.absoluteString.replacingOccurrences(of: "file://", with: "")
    )
    
    // 녹음 세팅
    let recordSettings: [String: Any] = [
      
      AVFormatIDKey:              kAudioFormatAppleIMA4,
      AVSampleRateKey:            44100.0, // 44100.0(표준), 32kHz, 24, 16, 12
      AVNumberOfChannelsKey:      1, // 1: 모노 2: 스테레오(표준)
      AVEncoderBitRateKey:        128, // 32k, 96, 128(표준), 160, 192, 256, 320
      AVLinearPCMBitDepthKey:     16, // 4, 8, 11, 12, 16(표준), 18,
      AVEncoderAudioQualityKey:   AVAudioQuality.max.rawValue
    ]
    
    do {
      try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
      try audioSession.setActive(true)
      try recorder = AVAudioRecorder(url:url, settings: recordSettings)
    } catch {
      return
    }
    
    recorder.prepareToRecord()
    recorder.isMeteringEnabled = true
    recorder.record()
    
    // 타이머는 main thread 에서 실행됨
    levelTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(levelTimerCallback), userInfo: nil, repeats: true)
  }
  
  @objc func levelTimerCallback() {
    recorder.updateMeters()
    
    let level = recorder.averagePower(forChannel: 0)
    let power = pow(10.0, level / 20.0) * 70.0  + 55
    let powerInt = String(Int(round(power)))
    print("level",powerInt)
    lblDecibel.text = powerInt
    

    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
// MARK: - Extension Part
