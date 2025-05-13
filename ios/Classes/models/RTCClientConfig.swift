//
//  RTCClientConfig.swift
//  flutter_amanivideosdk
//
//  Created by Bedri Dogan on 08.05.2025.
//

import Foundation

struct RTCClientConfig: Codable {
  var stunServerURL: String = "stun:tr.amani.ai:3478"
  var turnServerURL: String = "turn:tr.amani.ai:3478"
  var turnUsername: String = "st_user"
  var turnPassword: String = "yHB4N!ec%FA3kZ%5xsgB"
}
