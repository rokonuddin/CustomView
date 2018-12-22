//
//  SecondViewController.swift
//  CustomView
//
//  Created by Rokon Uddin on 12/22/18.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let customView = CustomView(frame: .zero)
        customView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customView)

        customView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        customView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        customView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        customView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        
        customView.backButtonPressed = {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
