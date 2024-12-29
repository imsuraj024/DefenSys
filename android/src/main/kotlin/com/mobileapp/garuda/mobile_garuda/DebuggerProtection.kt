package com.mobileapp.garuda.mobile_garuda

import android.os.Debug

class DebuggerProtection {
    fun isDebuggerAttached(): Boolean {
        return Debug.isDebuggerConnected() || Debug.waitingForDebugger();
    }
}