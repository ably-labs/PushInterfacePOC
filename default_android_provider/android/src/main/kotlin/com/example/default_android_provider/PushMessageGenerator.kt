package com.example.default_android_provider

import android.os.Handler
import java.util.*
import kotlin.concurrent.timerTask


class PushMessageGenerator() {
    private lateinit var listener: Listener
    private var messageCounter = 0
    private val handler = Handler()

    interface Listener {
        fun onPush(message: String)
    }

    fun start() {
       runDelayedHandler(5000)
    }
    private fun runDelayedHandler(frequency:Long){
        handler.postDelayed({
            listener.onPush("Message ${++messageCounter}")
            runDelayedHandler(frequency)
        }, frequency)
    }

    fun stop() {
        handler.removeCallbacksAndMessages(null)
    }

    fun register(listener: Listener) {
        this.listener = listener
    }


}