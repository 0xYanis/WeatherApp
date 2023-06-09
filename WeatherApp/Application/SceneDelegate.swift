//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by Yan Rybkin on 14.03.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let mainVC = ModuleBuilder.createMainModule()
        
        window.rootViewController = UINavigationController(rootViewController: mainVC)
        self.window = window
        window.makeKeyAndVisible()
    }
}
