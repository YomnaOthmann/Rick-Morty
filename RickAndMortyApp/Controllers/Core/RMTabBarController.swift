//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Mac on 21/01/2024.
//

import UIKit

/// ViewController that contains TabViewController and root TabControllers
final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        setUpTabs()
        
    }
    
    private func setUpTabs(){
        let characterVC = RMCharacterViewController()
        let episodeVC = RMEpisodeViewController()
        let locationVC = RMLocationViewController()
        let settingsVC = RMSettingsViewController()
        
        characterVC.title = "Characters"
        episodeVC.title = "Episodes"
        locationVC.title = "Locations"
        settingsVC.title = "Settings"
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic

        let characterNav = UINavigationController(rootViewController: characterVC)
        let episodeNav = UINavigationController(rootViewController: episodeVC)
        let locationNav = UINavigationController(rootViewController: locationVC)
        let settingsNav = UINavigationController(rootViewController: settingsVC)
        
        for nav in [characterNav, episodeNav, locationNav, settingsNav]{
            nav.navigationBar.prefersLargeTitles = true
        }
        
        characterNav.tabBarItem = UITabBarItem(
            title: "Characters",
            image: UIImage(systemName: "person"),
            tag: 1
        )
        characterNav.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        episodeNav.tabBarItem = UITabBarItem(
            title: "Episodes",
            image: UIImage(systemName: "play.circle"),
            tag: 2
        )
        episodeNav.tabBarItem.selectedImage = UIImage(systemName: "play.circle.fill")
        
        locationNav.tabBarItem = UITabBarItem(
            title: "Locations",
            image: UIImage(systemName: "map"),
            tag: 3
        )
        locationNav.tabBarItem.selectedImage = UIImage(systemName: "map.fill")
        
        settingsNav.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gearshape.2"),
            tag: 4
        )
        settingsNav.tabBarItem.selectedImage = UIImage(systemName: "gearshape.2.fill")
        setViewControllers(
            [
                characterNav,
                episodeNav,
                locationNav,
                settingsNav
            ],
            animated: true
        )

    }


}

