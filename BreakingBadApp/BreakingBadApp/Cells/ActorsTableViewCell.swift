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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func getActorInfo(actors: BrBad) {
        self.lblName.text = actors.name
        self.lblNickname.text = actors.nickname
        self.lblBirthday.text = actors.bithday
        self.lblSeasons.text = "\(actors.appearance!)"
    }
}

