//
//  LoginVC.swift
//  CoreData 1
//
//  Created by Chandan Mondal on 24/11/24.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!{
        didSet {
            btnLogin.layer.cornerRadius = 25
            btnLogin.clipsToBounds = true
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  

}
