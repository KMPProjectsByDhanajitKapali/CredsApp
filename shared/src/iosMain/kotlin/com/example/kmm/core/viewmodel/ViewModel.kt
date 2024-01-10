package com.example.kmm.core.viewmodel

import com.example.kmm.core.coroutines.AppCoroutineDispatchers
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel

actual open class ViewModel actual constructor(actual val dispatchers: AppCoroutineDispatchers) {

    protected actual val vmScope: CoroutineScope
        get() = CoroutineScope(SupervisorJob() + dispatchers.mainImmediate)

    protected actual open fun onCleared() {
        vmScope.cancel()
    }
}