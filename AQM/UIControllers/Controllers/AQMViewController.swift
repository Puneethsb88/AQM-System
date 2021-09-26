//
//  AQMViewController.swift
//  AQM
//
//  Created by Apple on 24/09/21.
//

import UIKit

/// `AQMViewController` to display  Air quality info.
class AQMViewController: UIViewController {
    
    /// `UITableView` to display list of Air quality info.
    @IBOutlet weak var airQualityableView: UITableView!
    
    /// Instance of `AQMViewModel`.
    lazy var viewModel: AQMViewModel = {
        let viewmodel = AQMViewModel()
        return viewmodel
    }()
    
    // MARK: - UIViewController lifecycle methods
    
    /// Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.airQualityableView.register(UINib(nibName: String(describing: AQMTableCell.self), bundle: nil), forCellReuseIdentifier: "airQualityCell")
        self.viewModel.realoadTableView = { [weak self] device in
            guard let weakSelf = self else { return }
            DispatchQueue.main.async { [weak self] in
                weakSelf.airQualityableView.dataSource = self
                weakSelf.airQualityableView.reloadData()
            }
        }
    }
}

// MARK: - AQMViewController Extension for UITableViewDataSource

extension AQMViewController: UITableViewDataSource {
    
    /// Returns the number of rows (table cells) in a specified section.
    ///
    /// - Parameter tableView: An index number that identifies a section of the table. Table views in a plain style have a section index of zero.
    /// - Returns: The number of rows in the section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.airQualityModel.count-1
    }
    
    /// Asks the data source for a cell to insert in a particular location of the table view.
    ///
    /// - Parameters:
    ///   - tableView: A table-view object requesting the cell.
    ///   - indexPath: An index path locating a row in tableView.
    /// - Returns: `AQMTableCell` An object inheriting from `UITableViewCell` that the table view can use for the specified row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let airQualityCell = tableView.dequeueReusableCell(withIdentifier: "airQualityCell", for: indexPath) as? AQMTableCell
        else {
            return AQMTableCell(style: .default, reuseIdentifier: "airQualityCell")
        }
        airQualityCell.cellViewModel = self.viewModel.airQualityModel[indexPath.row]        
        return airQualityCell
    }    
}

