//
//  DecibelVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 강윤서 on 2022/05/22.
//

import UIKit

class DecibelVC: UIViewController {
    
    @IBOutlet weak var rankingTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: RankingTVC.identifier, bundle: nil)
        rankingTV.register(nib, forCellReuseIdentifier: RankingTVC.identifier)
        
        rankingTV.delegate = self
        rankingTV.dataSource = self
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
        
        cell.setData(RankingDataModel.sampleData[indexPath.row])
        
        return cell
    }
    
    
}
