# AQM-System
Air Quality Monitoring
This is a  project uses MVVM architecture 
Model: The responsiblity of model here is to hold parsed json objects.

View: Module is responsible for displaying the view to the end users and enables them to perform user interface events.The UI layer is created using storyboard provided by apple. And each of the UI element  is associated with UI controller.

Viewmodel: This module is responsible for handling all business logics, converting data in model into human readable format that can be presented in the view by view controller.
Updates to View data would not go directly to the Model, rather they would
be triggered by the view controller talking to the View Model which would then talk to the model.

Logics:
After the app launch viewmodel is initiated through `AQMViewController`.
Viewmodel calls the `init()` method to initialize the websocket call, fetches the data from webSocket and parse the JSON object. Once the fetch completed from websocket it triggered to `AQMViewController` to load the data.

All the methods related to Websocket communications are added in ` WebSocketServiceProtocol`.
`Float+Color` extensions are added to get the color for Air Quality Index based on the range

The  project uses new URLSessionWebSocketTask API introduced in iOS 13.


Total hour used 8 Hrs.
