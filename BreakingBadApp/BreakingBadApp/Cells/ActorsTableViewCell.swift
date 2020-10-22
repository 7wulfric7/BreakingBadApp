//
//  ActorsTableViewCell.swift
//  BreakingBadApp
//
//  Created by Deniz Adil on 10/12/20.
//

import UIKit

class ActorsTableViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNickname: UILabel!
    @IBOutlet weak var lblSeasons: UILabel!
    @IBOutlet weak var lblBirthday: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setActorInfo(actors: BreakingBadInfo) {
        self.lblName.text = actors.name
        self.lblBirthday.text = actors.birthday
        self.lblNickname.text = actors.nickname
//        self.lblSeasons.text = "\(actors.appearance!)"
//            if let imgName = actors.img {
//                let imgUrl = BASE_IMG_URL + imgName + "@2x.png"
//                self.picture.kf.setImage(with: URL(string: imgUrl))
//            }
        }
    }
 
