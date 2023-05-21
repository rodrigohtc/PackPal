//
//  SplashViewController.swift
//  PackPal
//
//  Created by Rodrigo on 21/05/23.
//

import UIKit

class SplashViewController: UIViewController {
    private let splashView = SplashView()
    
    override func loadView() {
        view = splashView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.navigateToMainScreen()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = nil
    }
    
    private func navigateToMainScreen() {
        // Create and set the main view controller as the root view controller based on your app's navigation
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
