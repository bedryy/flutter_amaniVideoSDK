package ai.amani.flutter_amanivideosdk
import android.app.Activity
import io.flutter.plugin.common.MethodChannel.Result

interface Module {
    fun start(
        serverUrl: String,
        token: String,
        name: String,
        surname: String,
        stunServer: String,
        turnServer: String,
        turnUser: String,
        turnPass: String,
        activity: Activity,
        result: Result
    )
}
