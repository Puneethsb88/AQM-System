//
//  AQMTableCell.swift
//  AQM
//
//  Created by Apple on 26/09/21.
//

import UIKit

/// `AQMTableCell` to display Air Quality Monitoring.
class AQMTableCell: UITableViewCell {

    /// `UILabel` to display city.
    @IBOutlet weak var city: UILabel!
    
    /// `UILabel` to display Air Quality Index.
    @IBOutlet weak var aqiValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

 /// `cellViewModel` object having details about `AQMModel`.
    var cellViewModel: AQMModel! {
        didSet {
            self.city.text = cellViewModel?.city
            self.aqiValue.text = String(cellViewModel.aqi)
            self.aqiValue.textColor = cellViewModel?.aqi.getColor(range: cellViewModel.aqi)
            self.aqiValue.text = String(format: "%.2f", cellViewModel.aqi)
        }
    }
    
}
