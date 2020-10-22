//
//  BreakingBadInfo.swift
//  BreakingBadApp
//
//  Created by Deniz Adil on 10/12/20.
//

import UIKit

struct BrBad: Decodable {
    var name: String? = ""
    var nickname: String? = ""
    var bithday: String? = ""
    var appearance: Appearance?
    var img: String? = ""
}

struct Appearance: Decodable {
    var appearance: [Int]
}
