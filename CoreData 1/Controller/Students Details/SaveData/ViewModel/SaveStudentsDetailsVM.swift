//
//  SaveStudentsDetailsVM.swift
//  CoreData 1
//
//  Created by Chandan Mondal on 24/11/24.
//

import Foundation
import UIKit

class SaveStudentsDetailsVM {
    
    static var shared = SaveStudentsDetailsVM()
    
    //MARK: View layout...
    func customViewLayout(view: UIView){
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
    }
    
    //MARK: custom button....
    func customButtonLayout(btn: UIButton){
        btn.layer.cornerRadius = 15
        btn.clipsToBounds = true
    }
    
}
