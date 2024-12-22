//
//  DetailsViewVC.swift
//  CoreData 1
//
//  Created by Chandan Mondal on 24/11/24.
//

import UIKit

class DetailsViewVC: UIViewController {
    
    
    @IBOutlet weak var lblStudentsName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    var studentsData : Students?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpData()
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
    
    deinit{
       print("Memori Relise!!")
    }
    
    @IBAction func didTapReturn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: SetupData....
    private func setUpData(){
        lblStudentsName.text = studentsData?.name
        lblPhoneNumber.text = "Phone Number: \(studentsData?.phoneNumber ?? "")"
        lblCity.text = "City: \(studentsData?.city ?? "")"
        lblAddress.text = "Address: \(studentsData?.address ?? "")"
    }

}
