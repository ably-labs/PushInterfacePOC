package com.example.default_android_provider

import android.util.Log
import io.flutter.plugin.common.EventChannel
import java.util.*
import kotlin.concurrent.timer


private const val TAG = "PushHandler"
class PushHandler() : EventChannel.StreamHandler, PushMessageGenerator.Listener {
    private var eventSink: EventChannel.EventSink? = null
    private val pushMessageGenerator = PushMessageGenerator()

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        pushMessageGenerator.register(this)
        pushMessageGenerator.start()
        Log.d(TAG, "onListen: ")
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
        pushMessageGenerator.stop()
        Log.d(TAG, "onCancel: ")
    }

    override fun onPush(message: String) {
        eventSink?.success(message)
        Log.d(TAG, "onPush: ")
    }


}