import Foundation
import Flutter
import AmaniVideoSDK

class DelegateEventHandler: NSObject, FlutterStreamHandler {
  private var eventSink: FlutterEventSink?
  private var amaniVideo: AmaniVideo?
  
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
    debugPrint("flutter on newState event: \(newState)")

    switch newState {
    case .connecting:
      break
    case .connected:
      break
    case .disconnected:
      break
    case .failed:
      DispatchQueue.main.async {
        // self.videoView?.removeFromSuperview()
        // self.amaniVideo?.closeSDK()
        // self.amaniVideo = nil
      }
    }
  }

  public func onException(error: [String]) {
    debugPrint(error)
    DispatchQueue.main.async {
      // self.videoView?.removeFromSuperview()
    }
  }

  public func onUIEvent(event: AmaniVideoSDK.AmaniVideo.UIEvent) {
     debugPrint("flutter on UI event: \(event)")

    switch event {
    case .cameraSwitch:
      break
    case .cameraClose:
      break
    case .callEnd:
      // amaniVideo?.closeSDK()
      DispatchQueue.main.async {
        // self.videoView?.removeFromSuperview()
        // self.videoView = nil
      }
      // self.amaniVideo = nil
      
      break
    case .mute:
      break
    case .torch:
      break
    }
  }

  public func onRemoteEvent(event: AmaniVideoSDK.AmaniVideo.RemoteEvent) {
      debugPrint("flutter on remote event: \(event)")

    switch event {
    case .cameraSwitch:
      
      break
    case .callEnd:
      DispatchQueue.main.async {
        // self.videoView?.removeFromSuperview()
      }
      break
    case .torch:
      eventSink?("torch_toggle_requested")
    case .cameraSwitch:
      eventSink?("camera_switch_requested")
    case .escalated:
      print("escalated")
      
    }
  }
  
}