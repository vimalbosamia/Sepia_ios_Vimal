//
//  PetListTableViewCell.swift
//  Sepia_iOS_Vimal
//
//  Created by Vimal on 15/11/22.
//

import UIKit
import Kingfisher
class PetListTableViewCell: UITableViewCell {
    static let identifier = "PetListTableViewCell"
    
    @IBOutlet weak var petTitle: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(model: Pet) {
        DispatchQueue.main.async {
            self.petImage.kf.setImage(with: URL(string: model.imageUrl ?? ""))
            self.petTitle.text =  model.title ?? ""
        }
    }
}
