//
//  CycleDisplayer.swift
//  LifeCycle
//
//  Created by guillaume MAIANO on 04/12/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import UIKit

class CycleDisplayer: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // side note: if any child controller sets navigationController?.delegate = self, then once it gets popped... it gets deallocated, the weak var delegate gets set to nil
        // which is why, of course, setting the delegate needs to be done in ViewWillAppear (which will be called again once the Nav Controller is returned to) rather than in ViewDidLoad, which is only called once.
        // But surely this was obvious.
        self.delegate = self
        // drive the point home
        print("Back home")
    }

}

extension CycleDisplayer: UINavigationControllerDelegate {
    // Well, I'm not sure what I want to have this do. I ain't got no need for no special transitions. But I could.
}
