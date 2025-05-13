import AmaniVideoSDK
import Flutter
import UIKit

public class SwiftFlutterAmanivideosdkPlugin: NSObject, FlutterPlugin {
  var amaniVideo: AmaniVideo?
  var methodChannel: FlutterMethodChannel!
  var delegateChannel: FlutterEventChannel!
  static var eventHandler = DelegateEventHandler()
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let methodChannel = FlutterMethodChannel(name: "amanivideosdk_method_channel", binaryMessenger: registrar.messenger())
    let delegateChannel = FlutterEventChannel(name: "amanivideosdk_delegate_channel", binaryMessenger: registrar.messenger())
    
    let instance = SwiftFlutterAmanivideosdkPlugin()
    instance.methodChannel = methodChannel
    instance.methodChannel = methodChannel
    instance.delegateChannel = delegateChannel
    instance.delegateChannel.setStreamHandler(SwiftFlutterAmanivideosdkPlugin.eventHandler)
    
    registrar.addMethodCallDelegate(instance, channel: methodChannel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let arguments = call.arguments as? [String: Any]
    switch call.method {
    case "startVideo":
    
     if let args = call.arguments as? [String: Any] {
        do {
          self.amaniVideo = try AmaniVideoBuilder()
            .setServerURL(url: URL(string: args["server_url"] as! String)!)
            .setToken(token: args["token"] as! String)
            .setName(name: args["name"] as! String, surname: args["surname"] as! String)
            .setRemoteViewMode(viewMode: AmaniVideoSDK.AmaniVideo.ViewMode.portrait)
            .setRTCConfig(
              stunServerURL: args["stun"] as! String,
              turnServerURL: args["turn"] as! String,
              turnUsername: args["turn_user"] as! String,
              turnPassword: args["turn_pass"] as! String
            )
            .setBackgroundViewColor(color: UIColor.darkGray)
            .setDelegate(delegate: SwiftFlutterAmanivideosdkPlugin.eventHandler)
            .build()
          
          guard let vc = UIApplication.shared.windows.last?.rootViewController else {
                result(FlutterError(code: "30001", message: "No root view controller", details: nil))
                return
          }

          self.amaniVideo?.start(on: vc.view, status: AmaniVideoSDK.CallStatus.waiting)
        } catch {
          print("AmaniVideo build error: \(error.localizedDescription)")
        }
      }
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

 
}