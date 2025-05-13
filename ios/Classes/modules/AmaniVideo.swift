//
//  AmaniVideo.swift
//  flutter_amanivideosdk
//
//  Created by Bedri Doğan on 08.05.2025.
//

// import AmaniVideoSDK
// import Flutter
// import UIKit

// public class AmaniVideo {
//     private let module = AmaniVideo()
//     private var sdkView: SDKView!

//     // public func start(on view: UIView, status: AmaniVideoSDK.CallStatus = .waiting, result: @escaping FlutterResult) {
        
//     //     guard let vc = UIApplication.shared.windows.last?.rootViewController else {

//     //         result(FlutterError(code: "30001", message: "No root view controller", details: nil))
//     //         return
//     //     }

//     //     do {
//     //         let moduleView: UIView = module.start(on: vc.view, status: status)

//     //         DispatchQueue.main.async {
//     //         self.sdkView.removeFromSuperview()
//     //         }

//     //         sdkView = SDKView(sdkView: moduleView)
//     //         sdkView.start(on: vc)
//     //         sdkView.setupBackButton(on: moduleView)

//     //     } catch let err {
//     //         result(FlutterError(code: "30007", message: err.localizedDescription, details: nil))
//     //     }
//     // }

//     public func setDelegate(delegate: AmaniVideoSDK.AmaniVideoDelegate, result: @escaping FlutterResult) {
//         module.setDelegate(delegate: delegate, result: result)
//         result(nil)
//     }


//     public func toggleTorch(result: @escaping FlutterResult) {
//         module.toggleTorch(result: result)
//         result(nil)
//     }

//     public func switchCamera(result: @escaping FlutterResult) {
//         module.switchCamera(result: result)
//         result(nil)
//     }

//     public func closeSDK(result: @escaping FlutterResult) {
//         module.closeSDK(result: result)
//         result(nil)
//     }
// }

// extension AmaniVideo {
//   public enum ConnectionState {
//     case connecting
//     case connected
//     case disconnected
//     case failed
//   }
// }


// extension AmaniVideo {
//   public enum UIEvent {
//     case cameraSwitch
//     case cameraClose
//     case callEnd
//     case mute
//     case torch
//   }
  
//   public enum CameraPosition {
//     case front
//     case back
//   }
  
//   public enum RemoteEvent {
//     case cameraSwitch
//     case callEnd
//     case torch
//     case escalated
//   }
// }

// extension AmaniVideo { 
//   public enum ViewMode {
//     case landscape
//     case portrait
//   }
// }

// extension AmaniVideo {
//  public enum ButtonIcons {
//     case switchCamera
//     case endCall
//     case microphone
//     case microphoneOff
//     case camera
//     case cameraOff
//   }
// }

// extension AmaniVideo {
//   public enum ButtonColors {
//     case switchCameraButtonBackground
//     case switchCameraButton
//     case closeCameraButtonBackground
//     case closeCameraButton
//     case muteButtonBackground
//     case muteButton
//     case endCallButtonBackground
//     case endCallButton
//   }

  
// } 