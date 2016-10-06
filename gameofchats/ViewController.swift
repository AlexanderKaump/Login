//
//  ViewController.swift
//  gameofchats
//
//  Created by Alexander Kaump on 9/28/16.
//  Copyright © 2016 Alexander Kaump. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        // if user is not logged in
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
            handleLogout()
        }
    }

    func handleLogout() {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print (logoutError)
        }
        
        
       let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }


}

