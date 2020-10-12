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
    func setActorInfo(actors: ActorsInfo) {
        self.lblName.text = actors.name
        APIManager.shared.getActorInfo(id: actors.id) { (brBaInfo, error) in
            if let brBaInfo = brBaInfo {
                self.lblBirthday.text = brBaInfo.birthday
                self.lblNickname.text = brBaInfo.nickname
                self.lblSeasons.text = "\(brBaInfo.appearance!.description)"
                if let imgName = brBaInfo.img {
                    let imgUrl = BASE_IMG_URL + imgName + "@2x.png"
                    self.picture.kf.setImage(with: URL(string: imgUrl))
                }
            }
        }
    }
}
