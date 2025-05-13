import Foundation
import Flutter
import AmaniVideoSDK

class DelegateEventHandler: NSObject, FlutterStreamHandler {
  private var eventSink: FlutterEventSink?
  
  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    print("DELEGATE EVENT HANDLER EVENTS TETİKLENDİ ---------------------");
    print(events);
    self.eventSink = events
    return nil
  }
  
  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    eventSink = nil
    return nil
  }
}

extension DelegateEventHandler: AmaniVideoDelegate {
  public func onConnectionState(newState: AmaniVideoSDK.AmaniVideo.ConnectionState) {
    debugPrint(newState)
  }

  public func onException(error: [String]) {
    debugPrint(error)
  }

  public func onUIEvent(event: AmaniVideoSDK.AmaniVideo.UIEvent) {
     debugPrint(event)
  }

  public func onRemoteEvent(event: AmaniVideoSDK.AmaniVideo.RemoteEvent) {
      debugPrint(event)
  }
  
}