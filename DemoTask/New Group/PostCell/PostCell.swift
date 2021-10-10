//
//  PostCell.swift
//  DemoTask
//
//  Created by SOTSYS140 on 10/10/21.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: SetupUI()
    private func setupUI() {
        
    }
}
