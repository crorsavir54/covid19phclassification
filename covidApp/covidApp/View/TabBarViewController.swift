//
//  TabBarViewController.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = HomeViewController()
        let vc2 = StatisticsViewController()
        
        vc1.title = "Home"
        vc2.title = "Stats"
        
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        
        nav1.navigationBar.tintColor = .label
        nav2.navigationBar.tintColor = .label
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Stats", image: UIImage(systemName: "chart.bar"), tag: 2)
        
        setViewControllers([nav1, nav2], animated: true)
    }
    
}
