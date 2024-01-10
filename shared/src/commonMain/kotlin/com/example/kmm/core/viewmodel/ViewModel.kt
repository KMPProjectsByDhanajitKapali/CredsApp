package com.example.kmm.core.viewmodel

import com.example.kmm.core.coroutines.AppCoroutineDispatchers
import kotlinx.coroutines.CoroutineScope

expect open class ViewModel(dispatchers: AppCoroutineDispatchers) {

    val dispatchers: AppCoroutineDispatchers

    protected val vmScope: CoroutineScope

    protected open fun onCleared()
}
