package com.example.default_android_provider

import io.flutter.plugin.common.EventChannel
import java.util.*
import kotlin.concurrent.timer


class PushHandler() : EventChannel.StreamHandler, PushMessageGenerator.Listener {
    private var eventSink: EventChannel.EventSink? = null
    private val pushMessageGenerator = PushMessageGenerator()

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        pushMessageGenerator.register(this)
        pushMessageGenerator.start()
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
        pushMessageGenerator.stop()
    }

    override fun onPush(message: String) {
        eventSink?.success(message)
    }


}