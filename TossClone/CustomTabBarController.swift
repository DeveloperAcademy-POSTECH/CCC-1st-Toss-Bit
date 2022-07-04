//
//  CustomTabBarController.swift
//  TossClone
//
//  Created by yeongwoocho on 2022/07/04.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    enum TabBarPage {
        case home
        case benefit
        case remit
        case stock
        case whole

        init?(index: Int) {
            switch index {
            case 0:
                self = .home
            case 1:
                self = .benefit
            case 2:
                self = .remit
            case 3:
                self = .stock
            case 4:
                self = .whole
            default:
                return nil
            }
        }
        
        func pageTitleValue() -> String {
            switch self {
            
            case .home:
                return "홈"
            case .benefit:
                return "혜택"
            case .remit:
                return "송금"
            case .stock:
                return "주식"
            case .whole:
                return "전체"
            }
        }

        func pageImage() -> UIImage? {
            switch self {
            case .home:
                return UIImage(systemName: "house.fill")
            case .benefit:
                return UIImage(named: "diamond.svg")
            case .remit:
                return UIImage(systemName: "wonsign.circle.fill")
            case .stock:
                return UIImage(systemName: "chart.line.uptrend.xyaxis")
            case .whole:
                return UIImage(systemName: "line.3.horizontal")
            }
        }
        
        func pageOrderNumber() -> Int {
            switch self {
            case .home:
                return 0
            case .benefit:
                return 1
            case .remit:
                return 2
            case .stock:
                return 3
            case .whole:
                return 4
            }
        }
        
        func pageViewController() -> UIViewController {
            switch self {
            case .home:
                return HomeViewController()
            case .benefit:
                return UIViewController()
            case .remit:
                return UIViewController()
            case .stock:
                return UIViewController()
            case .whole:
                return UIViewController()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabBar()
        configureViewControllers()
    }
    
    private func configureTabBar() {
        tabBar.backgroundColor = .darkGray
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
    }
    
    private func getNavigationController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: page.pageViewController())
        navController.tabBarItem = UITabBarItem(title: page.pageTitleValue(),
                                                image: page.pageImage(),
                                                tag: page.pageOrderNumber())
        return navController
    }
    
    private func configureViewControllers() {
        let pages: [TabBarPage] = [.home, .benefit, .remit, .stock, .whole]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        let controllers: [UINavigationController] = pages.map({ getNavigationController($0) })
        self.viewControllers = controllers
    }
}
