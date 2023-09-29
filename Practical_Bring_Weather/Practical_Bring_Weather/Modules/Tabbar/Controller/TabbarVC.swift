//
//  TabbarVC.swift
//  Practical_Bring_Weather
//

import UIKit

class TabbarVC: UITabBarController {

    //MARK: - ViewController Method
    override func viewDidLoad() {
        super.viewDidLoad()

        initialization()
    }

    //MARK: - Initialization Method
    private func initialization() {

        hideNavigationBar(isTabbar: true)

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()

        tabBarAppearance.backgroundColor = .appPrimaryColor()

        tabBar.standardAppearance = tabBarAppearance

        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBarAppearance
        }

        tabBar.tintColor = .appBackgroundColor()
        tabBar.barTintColor = .appPrimaryColor()

        tabBar.unselectedItemTintColor = .appGrayColor()
    }
}
