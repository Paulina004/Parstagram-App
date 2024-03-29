//
//  PostCell.swift
//  Parstagram
//
//  Created by Paulina DeVito on 10/3/22.
//

import UIKit

class PostCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    
    //MARK: - Other
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
