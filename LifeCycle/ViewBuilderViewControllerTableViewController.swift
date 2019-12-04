//
//  ViewBuilderViewControllerTableViewController.swift
//  LifeCycle
//
//  Created by guillaume MAIANO on 04/12/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import UIKit

// Solid contender for most useless name ever... thanks Xcode.
class ViewBuilderViewControllerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Home"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Got it", style: .done, target: nil, action: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // we only need one section to hold our unique demo cell
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // we only need one cell to pop in our demo view
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Tables.ViewBuilder.reuseId, for: indexPath)
        cell.textLabel?.text = "HERRO"
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // only ever has one row/section
        if indexPath.section == 0 && indexPath.row == 0 {
            print("Creating a demo view -- via SB")
        }
    }
// use this to notify delegate when creating out of hierarchy
// don't forget to insert  //navigationController?.delegate = self in viewWillAppear
//
//    var lastVC: UIViewController?
//}
//extension ViewBuilderViewControllerTableViewController: UINavigationControllerDelegate {
//
//        func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//            lastVC?.viewWillDisappear(animated)
//            viewController.viewWillAppear(animated)
//        }
//        func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//            lastVC?.viewWillDisappear(animated)
//            viewDidAppear(animated)
//        }
    
    @objc func appMovedToForeground() {
        print("App moved to Foreground - called via notification center")
    }
    
    @objc func appMovedToBackground() {
        print("App moved to Background  - called via notification center")
    }
}
