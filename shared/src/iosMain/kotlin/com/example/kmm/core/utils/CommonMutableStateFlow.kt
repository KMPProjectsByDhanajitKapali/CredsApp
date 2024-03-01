package com.example.kmm.core.utils

import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

actual open class CommonMutableStateFlow<T> actual constructor(
    private val flow: MutableStateFlow<T>
) : CommonStateFlow<T>(flow), MutableStateFlow<T> {
    override val subscriptionCount: StateFlow<Int>
        get() = flow.subscriptionCount

    override var value: T
        get() = super.value
        set(value) {
            flow.value = value
        }

    override suspend fun emit(value: T) {
        flow.emit(value)
    }

    @ExperimentalCoroutinesApi
    override fun resetReplayCache() {
        flow.replayCache
    }

    override fun tryEmit(value: T): Boolean {
        return flow.tryEmit(value)
    }

    override fun compareAndSet(expect: T, update: T): Boolean {
        return flow.compareAndSet(expect, update)
    }
}
