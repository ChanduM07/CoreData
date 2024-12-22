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
    
    deinit{
       print("Memori Relise!!")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationItem.hidesBackButton = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

    @IBAction func didTapLogin(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Students", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewStudentsDataVC") as! ViewStudentsDataVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
