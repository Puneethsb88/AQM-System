//
//  WebSocketService.swift
//  AQM
//
//  Created by Apple on 24/09/21.
//

import Foundation

/// Handles the Web socket communications
class WebSocketService: NSObject, WebSocketServiceProtocol {
    
    var didOpenConnection : (()->())?
    var didCloseConnection : (()->())?
    var didReceiveMessage : ((_ message : String)->())?
    var didReceiveData : ((_ message : Data)->())?
    var didReceiveError : ((_ error : Error)->())?
    var urlSession : URLSession!
    lazy var operationQueue : OperationQueue = OperationQueue()
    var socket : URLSessionWebSocketTask!
    
    
    /// Listener to the socket.
    private func addListener(){
        socket.receive {[weak self] (result) in
            switch result {
            case .success(let response):
                switch response {
                case .data(let data):
                    self?.didReceiveData?(data)
                case .string(let message):
                    self?.didReceiveMessage?(message)
                default : return
                }
            case .failure(let error):
                self?.didReceiveError?(error)
            }
            self?.addListener()
            
        }
    }
    
    /// Method to start connection to the websocket.
    /// - Parameter url: for socket connection of type `URL`.
    func start(withSocketURL url: URL) {
        urlSession  = URLSession(configuration: .default, delegate: self, delegateQueue: operationQueue)
        socket = urlSession.webSocketTask(with: url)
    }
    
    /// Method to establish connection to Websocket and listen to the socket data
    func establishConnection() {
        socket.resume()
        addListener()
    }
    
    /// Method to disconnect from websocket.
    func disconnect() {
        socket.cancel(with: .goingAway, reason: nil)
    }
}

/// Extension for  WebSocketService that defines methods that URL session instances call on their delegates to handle task-level events.
extension WebSocketService : URLSessionWebSocketDelegate {
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        didOpenConnection?()
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        didCloseConnection?()
    }
}
