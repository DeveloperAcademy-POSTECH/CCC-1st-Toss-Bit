//
//  ColorAsset.swift
//  TossClone
//
//  Created by yeongwoocho on 2022/07/11.
//

import UIKit

enum ColorStyle: String {
    case background
    case contentView

    var color: UIColor {
        switch  self {
        case .background:
            return UIColor(red: 23/255.0, green: 23/255.0, blue: 28/255.0, alpha: 1)
        case .contentView:
            return UIColor(red: 16/255.0, green: 16/255.0, blue: 19/255.0, alpha: 1)
        }
    }
}
