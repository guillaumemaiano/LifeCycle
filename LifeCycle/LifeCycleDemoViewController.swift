//
//  LifeCycleDemoViewController.swift
//  LifeCycle
//
//  Created by guillaume MAIANO on 04/12/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import UIKit

class LifeCycleDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear")
    }

}
