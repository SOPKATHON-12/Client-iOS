//
//  FeedVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/21.
//

import UIKit

class FeedVC: UIViewController {
    
  var monthEntity: MonthListEntity?
    // MARK: - UI Component Part
    @IBOutlet weak var gaugeImageView: UIImageView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var feedTV: UITableView!
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTVC()
        setView()
      addObserver()
    }
}

// MARK: - Custom Method Part
extension FeedVC {
    private func setTVC() {
        FeedTVC.register(target: feedTV)
        feedTV.delegate = self
        feedTV.dataSource = self
    }
    
    private func setView() {
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        self.feedTV.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
    }
  
  private func fetchData() {
    BaseService.default.getMonthData(month: 5) { result in
      result.success { entity in
        self.monthEntity = entity
      }
    }
  }
  
  private func addObserver() {
    addObserverAction(.feedButtonClicked) { _ in
      self.navigationController?.popViewController(animated: true)
    }
  }
}

// MARK: - UITableViewDelegate
extension FeedVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 97
    }
}

// MARK: - UITableViewDataSource
extension FeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTVC.className, for: indexPath) as? FeedTVC else { return UITableViewCell() }
        
        cell.setData(FeedDataModel.sampleData[indexPath.row])
        
        return cell
    }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.transform = CGAffineTransform(translationX: 0, y: 74 * 1.4)
    cell.alpha = 0
    UIView.animate(
        withDuration: 0.5,
        delay: 0.15 * Double(indexPath.row),
        options: [.curveEaseInOut],
        animations: {
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
            cell.alpha = 1
        
        }
    )
    
  }
}
