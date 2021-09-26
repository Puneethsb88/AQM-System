//
//  AQMViewModel.swift
//  AQM
//
//  Created by Apple on 24/09/21.
//

import Foundation

/// ViewModel handles logic related to connecting and fetching the data.
class AQMViewModel {
    lazy var airQualityModel = [AQMModel]()
    
    /// Closure call back whenever the fetching thedata completed.
    var realoadTableView: ([AQMModel]) -> Void = { _ in }
    
    /// Initialization.
    init() {
        let webSocket = WebSocketService()
        webSocket.start(withSocketURL: URL(string: "ws://city-ws.herokuapp.com/")!)
        webSocket.establishConnection()
        webSocket.didReceiveMessage = {[weak self] message in
            guard let weakSelf = self else { return }
            if let data = message.data(using: .utf8) {
                let decoder = JSONDecoder()
                do {
                    weakSelf.airQualityModel = try decoder.decode([AQMModel].self, from: data)
                    weakSelf.realoadTableView(weakSelf.airQualityModel )
                }
                catch {}
            }
        }
    }
}
