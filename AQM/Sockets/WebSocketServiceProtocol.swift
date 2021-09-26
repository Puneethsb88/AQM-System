//
//  WebSocketServiceProtocol.swift
//  AQM
//
//  Created by Apple on 24/09/21.
//

import Foundation

/// Defines  method to  connect Web socket communications
protocol WebSocketServiceProtocol {
    
    /// Method to start connection to the websocket.
    /// - Parameter url: for socket connection of type `URL`.
    func start(withSocketURL url : URL)
    
    /// Method to establish connection to Websocket and listen to the socket data
    func establishConnection()
    
    /// Method to disconnect from websocket.
    func disconnect()
}
