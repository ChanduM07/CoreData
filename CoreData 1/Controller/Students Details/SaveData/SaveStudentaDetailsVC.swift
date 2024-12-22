//
//  SaveStudentaDetailsVC.swift
//  CoreData 1
//
//  Created by Chandan Mondal on 24/11/24.
//

import UIKit


protocol ReloadSaveData: AnyObject {
    func reloadTableViewData()
}

class SaveStudentaDetailsVC: UIViewController {

    @IBOutlet weak var bgView: UIView!{
        didSet{
            bgView.layer.cornerRadius = 20
            bgView.layer.borderWidth = 2
            bgView.layer.borderColor = UIColor.red.cgColor
            bgView.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnDismis: UIButton!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    weak var reloadDelegate: ReloadSaveData?
    var isEdit: Bool = false
    var editIDX: Int?
    var editdData : Students?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveStudentsDetailsVM.shared.customViewLayout(view: nameView)
        SaveStudentsDetailsVM.shared.customViewLayout(view: cityView)
        SaveStudentsDetailsVM.shared.customViewLayout(view: addressView)
        SaveStudentsDetailsVM.shared.customViewLayout(view: phoneNumberView)
        SaveStudentsDetailsVM.shared.customButtonLayout(btn: btnSave)
        if isEdit == true {
            btnDismis.isHidden = true
            txtName.text = editdData?.name
            txtCity.text = editdData?.city
            txtAddress.text = editdData?.address
            txtPhoneNumber.text = editdData?.phoneNumber
        } else {
            btnDismis.isHidden = false
        }
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
    
    @IBAction func didTapDismis(_ sender: UIButton) {
        reloadDelegate?.reloadTableViewData()
        self.dismiss(animated: true)
    }
    
    
    @IBAction func didTapSave(_ sender: UIButton) {
        if isEdit == true {
            let updateStudentsData = ["name": txtName.text!,
                                "city": txtCity.text!,
                                "address": txtAddress.text!,
                                "phoneNumber": txtPhoneNumber.text!]
            DatabaseManager.shared.editData(object: updateStudentsData, indx: editIDX ?? 0)
            reloadDelegate?.reloadTableViewData()
            self.dismiss(animated: true)
        } else {
            let validationResult = validateFields()
            if !validationResult.0 {
                let alert = UIAlertController(title: "Alert", message: validationResult.1, preferredStyle: .alert)
                let Okay = UIAlertAction(title: "Okay", style: .default)
                alert.addAction(Okay)
                present(alert, animated: true)
            } else {
                let studentsData = ["name": txtName.text!,
                                    "city": txtCity.text!,
                                    "address": txtAddress.text!,
                                    "phoneNumber": "+91 \(txtPhoneNumber.text!)"]
                
                DatabaseManager.shared.saveData(object: studentsData)
                txtName.text = ""
                txtCity.text = ""
                txtAddress.text = ""
                txtPhoneNumber.text = ""
            }
        }
    }
    
    //MARK: Validation...
    private func validateFields() -> (Bool, String?) {
        if txtName.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true {
            return (false, "Name is empty!")
        }
        if txtCity.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true {
            return (false, "City is empty!")
        }
        if txtAddress.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true {
            return (false, "Address is empty!")
        }
        if txtPhoneNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true {
            return (false, "Phone Number is empty!")
        }
        return (true, nil)
    }


}
