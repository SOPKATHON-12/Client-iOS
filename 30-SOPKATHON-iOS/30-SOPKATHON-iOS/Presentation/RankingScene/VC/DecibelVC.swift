//
//  DecibelVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 강윤서 on 2022/05/22.
//

import UIKit

class DecibelVC: UIViewController {
    
    @IBOutlet weak var rankingTV: UITableView!
    
    @IBOutlet weak var king2BackView: UIView!
    @IBOutlet weak var king3BackView: UIView!
    @IBOutlet weak var king1BackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: RankingTVC.identifier, bundle: nil)
        rankingTV.register(nib, forCellReuseIdentifier: RankingTVC.identifier)
        
        rankingTV.delegate = self
        rankingTV.dataSource = self
        
//        rankingTV.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        rankingTV.backgroundColor = .clear
        
        setBackViews()
        
    }
}

extension DecibelVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 99
    }
    
}

extension DecibelVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RankingDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingTVC.identifier, for: indexPath) as? RankingTVC else { return UITableViewCell() }
        
        if indexPath.row == 0 {
            cell.contentView.backgroundColor = .white
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.cornerRadius = 10
        } else {
            cell.contentView.backgroundColor = UIColor.init(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
            cell.layer.borderColor = .none

        }
        
        cell.setData(RankingDataModel.sampleData[indexPath.row])
        
        return cell
    }
    
    
}

extension DecibelVC {
    private func setBackViews() {
        king1BackView.backgroundColor = UIColor.white
        king2BackView.backgroundColor = UIColor.white
        king3BackView.backgroundColor = UIColor.white
        king1BackView.layer.cornerRadius = 9
        king2BackView.layer.cornerRadius = 9
        king3BackView.layer.cornerRadius = 10
        king1BackView.layer.borderWidth = 1
        king2BackView.layer.borderWidth = 1
        king3BackView.layer.borderWidth = 1

    }
}
