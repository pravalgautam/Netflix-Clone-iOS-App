//
//  ViewController.swift
//  NetflixClone
//
//  Created by Praval Gautam on 10/02/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        view.backgroundColor = .systemRed
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        
        vc1.tabBarItem.image = .init(systemName: "house")
        vc2.tabBarItem.image = .init(systemName: "play.circle")
        vc3.tabBarItem.image = .init(systemName: "magnifyingglass")
        vc4.tabBarItem.image = .init(systemName: "arrow.down.to.line")
        
        vc1.title = "Home"
        vc2.title = "Coming"
        vc3.title = "Search"
        vc4.title =  "Downloads"
        tabBar.tintColor =  .label
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }


}

