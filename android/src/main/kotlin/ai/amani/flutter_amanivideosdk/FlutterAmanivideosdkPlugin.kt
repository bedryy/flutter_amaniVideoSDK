package ai.amani.flutter_amanivideosdk

import android.app.Activity
import com.google.gson.Gson
import io.flutter.Log
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** FlutterAmanisdkPlugin */
class FlutterAmanivideosdkPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel: MethodChannel
  private lateinit var nfcChannel: MethodChannel
  private lateinit var bioLoginChannel: MethodChannel
  private lateinit var delegateChannel: EventChannel
  // Give this reference to other modules e.g IdCapture when init.
  private var activity: Activity? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "amanisdk_method_channel")
    channel.setMethodCallHandler(this)

    // Channels below is created due to usage of the different call handlers of different classes on
    // dart side
    nfcChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "amanisdk_nfc_channel")
    bioLoginChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "amanisdk_biologin_channel")
    // Event channel goes brr
    delegateChannel = EventChannel(flutterPluginBinding.binaryMessenger, "amanisdk_delegate_channel")
    delegateChannel.setStreamHandler(AmaniDelegateEventHandler())
  }

  override fun onMethodCall(call: MethodCall, result: Result) {

    when (call.method) {
      "initAmani" -> {
     
        activity?.runOnUiThread {
         
        }
      }
      
  }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    activity = null
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
      activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    activity = null
  }
 
}
