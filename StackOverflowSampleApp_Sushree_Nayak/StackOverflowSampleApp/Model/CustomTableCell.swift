
//
//  CustomTableCell.swift
//  StackOverflowSampleApp_Sushree_Nayak
//
//  Created by SUSHREE SANGITA NAYAK on 2/12/22.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    
    @IBOutlet var keywords: UILabel!
    @IBOutlet var datePosted: UILabel!
    @IBOutlet var scoreLbl: UILabel!
    @IBOutlet var scoreImage: UIImageView!
    @IBOutlet var replyLbl: UILabel!
    @IBOutlet var replyImage: UIImageView!
    @IBOutlet var viewImage: UIImageView!
    @IBOutlet var viewLbl: UILabel!
    @IBOutlet var titleTextField: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
