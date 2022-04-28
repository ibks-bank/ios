//
//  TabBarViewController.swift
//  bank
//
//  Created by Yulia Popova on 28/4/2022.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.systemGray6
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.systemGray6

        let nav1 = UINavigationController(rootViewController: ProfileViewController())
        let nav2 = UINavigationController(rootViewController: BankAccountsViewController())
        let nav3 = UINavigationController(rootViewController: SettingsViewController())

        [nav1, nav2, nav3].forEach {
            $0.navigationBar.scrollEdgeAppearance = navBarAppearance
            $0.navigationBar.standardAppearance = navBarAppearance
            $0.navigationBar.standardAppearance = navBarAppearance
        }

        nav1.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 0)
        nav2.tabBarItem = UITabBarItem(title: "Accounts", image: UIImage(systemName: "creditcard"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 2)

        setViewControllers([nav1, nav2, nav3], animated: false)
    }
}
