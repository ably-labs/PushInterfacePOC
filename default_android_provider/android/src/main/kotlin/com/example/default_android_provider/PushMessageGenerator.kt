package com.example.default_android_provider

import java.util.*
import kotlin.concurrent.timerTask


class PushMessageGenerator() {
    private lateinit var listener: Listener
    private val timer = Timer()
    private var messageCounter = 0
    interface Listener {
        fun onPush(message: String)
    }
    fun start(){
        timer.scheduleAtFixedRate(timerTask {
            listener.onPush("Message ${++messageCounter}")
        }, 5000, 5000)
    }

    fun stop(){
        timer.cancel();
    }

    fun register(listener: Listener) {
        this.listener = listener
    }


}