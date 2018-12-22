//
//  FirstViewController.swift
//  CustomView
//
//  Created by Rokon Uddin on 12/15/17.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var customView: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        customView.delegage = self
    }
}

extension FirstViewController: CustomViewDelegate {
    func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
}

