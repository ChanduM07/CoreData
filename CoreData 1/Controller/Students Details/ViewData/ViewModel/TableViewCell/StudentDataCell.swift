//
//  StudentDataCell.swift
//  CoreData 1
//
//  Created by Chandan Mondal on 24/11/24.
//

import UIKit

class StudentDataCell: UITableViewCell {
    
    
    @IBOutlet weak var bgView: UIView!{
        didSet{
            bgView.layer.cornerRadius = 10
            bgView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
