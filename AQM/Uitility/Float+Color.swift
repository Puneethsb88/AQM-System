//
//  Float+Color.swift
//  AQM
//
//  Created by Apple on 26/09/21.
//

import Foundation
import UIKit

extension Float {
    /// Method to get color for the given rage of Air Quality Index.
    /// - Parameter range: Air Quality Index of type `Float`.
    /// - Returns: UIColors
    func getColor(range: Float)-> UIColor {
        switch range {
        case 0...50.9 :
            return UIColor(red: 106.0/255, green: 185.0/255, blue: 89.0/255, alpha: 1.0)
        case 51...100.9 :
            return UIColor(red: 171.0/255, green: 197.0/255, blue: 100.0/255, alpha: 1.0)
        case 101...200.9 :
            return UIColor.yellow
        case 201...300.9 :
            return UIColor(red: 230.0/255, green: 159.0/255, blue: 74.0/255, alpha: 1.0)
        case 301...400.9 :
            return UIColor(red: 216.0/255, green: 77.0/255, blue: 62.0/255, alpha: 1.0)
        case 401...500.9 :
            return UIColor(red: 162.0/255, green: 56.0/255, blue: 44.0/255, alpha: 1.0)
        default:
            break
        }
        return UIColor.black
    }
}
