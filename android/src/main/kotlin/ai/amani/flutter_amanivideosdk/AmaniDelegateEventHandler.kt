package ai.amani.flutter_amanivideosdk
import ai.amani.videosdk.VideoSDK
import ai.amani.videosdk.observer.AmaniVideoButtonEvents
import ai.amani.videosdk.observer.AmaniVideoCallObserver
import ai.amani.videosdk.observer.AmaniVideoRemoteEvents
import ai.amani.videosdk.observer.CameraPosition
import ai.amani.videosdk.observer.ConnectionState
import ai.amani.videosdk.observer.SwitchCameraObserver
import ai.amani.videosdk.observer.ToggleTorchObserver

import android.os.Handler
import android.os.Looper
import com.google.gson.Gson
import io.flutter.plugin.common.EventChannel

class AmaniDelegateEventHandler: EventChannel.StreamHandler {

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        Handler(Looper.getMainLooper()).post {
            Amani.sharedInstance().AmaniEvent().setListener(object: AmaniEventCallBack {
                override fun onError(type: String?, error: ArrayList<AmaniError?>?) {
                    if (error != null) {
                        val dataMap = mapOf(
                            "errorType" to type,
                            "errors" to Gson().toJson(error)
                        )
                        val returnMap = mapOf(
                            "type" to "error",
                            "data" to dataMap
                        )

                        Handler(Looper.getMainLooper()).post {
                            events?.success(returnMap)
                        }

                    }
                }

                override fun profileStatus(profileStatus: ProfileStatus) {
                    val returnMap = mapOf(
                        "type" to "profileStatus",
                        "data" to Gson().toJson(profileStatus)
                    )

                    Handler(Looper.getMainLooper()).post {
                        events?.success(returnMap)
                    }
                }

                override fun stepsResult(stepsResult: StepsResult?) {
                    if (stepsResult != null) {
                        val returnMap = mapOf(
                            "type" to "stepModel",
                            "data" to Gson().toJson(stepsResult)
                        )
                        Handler(Looper.getMainLooper()).post {
                            events?.success(returnMap)
                        }
                    }
                }

            })
        }
    }

    override fun onCancel(arguments: Any?) {
    }
}