//
//  RankingVC.swift
//  30-SOPKATHON-iOS
//
//  Created by 송지훈 on 2022/05/21.
//

import UIKit

class RankingVC: UIViewController {

  // MARK: - Vars & Lets Part
    private let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private let contents: [UIViewController] = [
        ModuleFactory.shared.makeDecibelVC(),
        ModuleFactory.shared.makeTabVC()
    ]

    private var currentIndex: Int = 0
    private var tappedButton: Bool = false
  // MARK: - UI Component Part
    @IBOutlet weak var tabStackView: UIStackView!
    @IBOutlet weak var barBackgroundView: UIView!
    @IBOutlet weak var barView: UIView!
    
    @IBOutlet weak var barWidth: NSLayoutConstraint!
    @IBOutlet weak var barLeading: NSLayoutConstraint!
    
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Life Cycle Part
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupPageVC()
        
    }
    
  // MARK: - IBAction Part

    @IBAction func tabButtonClicked(_ sender: UIButton) {
        guard let index = tabStackView.arrangedSubviews.firstIndex(where: { $0 == sender }),
                index != currentIndex else {
            return
        }
        tappedButton = true
        UIView.animate(withDuration: 0.3){
            self.barLeading.constant = CGFloat(index) * self.barView.frame.width
            self.barBackgroundView.layoutIfNeeded()
        }
        
        let content = contents[index]
        
        pageVC.setViewControllers([content], direction: currentIndex < index ? .forward : .reverse, animated: true) { _ in
            self.currentIndex = index
            self.tappedButton = false
            
        }
    }
    
  // MARK: - Custom Method Part
    private func setupUI() {
        barWidth.constant = view.bounds.width / CGFloat(tabStackView.arrangedSubviews.count)
    }
    
    private func setupPageVC() {
        self.addChild(pageVC)
        
        containerView.frame = pageVC.view.frame
        self.containerView.addSubview(pageVC.view)

        pageVC.didMove(toParent: self)
        
        pageVC.delegate = self
        pageVC.dataSource = self
        
        if let firstVC = contents.first {
            pageVC.setViewControllers([firstVC], direction: .forward, animated: true)
        }
        
        for subview in pageVC.view.subviews {
            if let scrollView = subview as? UIScrollView {
                scrollView.delegate = self
            }
        }
    }
  
  // MARK: - @objc Function Part

}
// MARK: - Extension Part
extension RankingVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewController = pageVC.viewControllers?.first,
              let index = contents.firstIndex(where: { $0 == viewController }) else {return}
        
        currentIndex = index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = contents.firstIndex(of: viewController) else {return nil}
        let prevIndex = index - 1
        
        if prevIndex < 0 {
            return nil
        }
        return contents[prevIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = contents.firstIndex(of: viewController) else {return nil}
        let nextIndex = index + 1
        
        if nextIndex == contents.count {
            return nil
        }
        return contents[nextIndex]
    }
}

extension RankingVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print(scrollView.contentOffset.x)
        
        let offsetX = scrollView.contentOffset.x
        let contentWidth = pageVC.view.frame.width
        
        let percent = (offsetX - contentWidth) / contentWidth
        
        let constant = barView.frame.width * (CGFloat(currentIndex) + percent)
        barView.frame.origin.x = constant
    }
}

