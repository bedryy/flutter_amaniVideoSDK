//  AmaniVideoBuilder.swift
//  flutter_amanivideosdk
//
//  Created by Bedri Doğan on 08.05.2025.
//

import AmaniVideoSDK
import Flutter
import UIKit
import Foundation

class AmaniVideoBuilder {
    private let module = AmaniVideoSDK.AmaniVideoBuilder()
    private let amaniVideo = AmaniVideo()

    @discardableResult
    public func setServerURL(url: URL)  -> AmaniVideoBuilder {
        module.setServerURL(url: url)
        return self
    
    }

    @discardableResult
    public func setToken(token: String) -> AmaniVideoBuilder {
        module.setToken(token: token)
        return self
      
    }

    @discardableResult
    public func setName(name: String, surname: String) -> AmaniVideoBuilder {
        module.setName(name: name, surname: surname)
        return self
        
    }

    @discardableResult
    public func setDelegate(delegate: AmaniVideoSDK.AmaniVideoDelegate) -> AmaniVideoBuilder {
        module.setDelegate(delegate: delegate)
        return self
     
    }

    @discardableResult
    public func setRemoteViewMode(viewMode: AmaniVideoSDK.AmaniVideo.ViewMode) -> AmaniVideoBuilder {
        module.setRemoteViewMode(viewMode: viewMode)
        return self
        
    }

    @discardableResult
    public func setBackgroundViewColor(color: UIColor) -> AmaniVideoBuilder {
        module.setBackgroundViewColor(color: color)
        return self
       
    }

    @discardableResult
    public func setButtonColors(colors: [AmaniVideoSDK.AmaniVideo.ButtonColors: UIColor]) -> AmaniVideoBuilder {
        module.setButtonColors(colors: colors)
        return self
      
    }

    @discardableResult
    public func setButtonIcons(icons: [AmaniVideoSDK.AmaniVideo.ButtonIcons: UIImage]) -> AmaniVideoBuilder {
        module.setButtonIcons(icons: icons)
        return self
       
    }

    @discardableResult
    public func setRTCConfig(stunServerURL: String, turnServerURL: String, turnUsername: String, turnPassword: String) -> AmaniVideoBuilder {
        module.setRTCConfig(stunServerURL: stunServerURL, turnServerURL: turnServerURL, turnUsername: turnUsername, turnPassword: turnPassword)
        return self
      
    }

    @discardableResult
    public func build() throws -> AmaniVideo? {
        do {
           try module.build()
           return amaniVideo
        }
        catch let error {
            debugPrint(error)
            throw error
        }
       
       
    }
}