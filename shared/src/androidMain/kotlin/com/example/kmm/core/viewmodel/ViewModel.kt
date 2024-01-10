package com.example.kmm.core.viewmodel

import androidx.lifecycle.viewModelScope
import com.example.kmm.core.coroutines.AppCoroutineDispatchers
import kotlinx.coroutines.CoroutineScope

actual open class ViewModel actual constructor(actual val dispatchers: AppCoroutineDispatchers) :
    androidx.lifecycle.ViewModel() {

    companion object {
        val TAG = "ViewModelWrapper"
    }

    protected actual val vmScope: CoroutineScope
        get() = viewModelScope

    actual override fun onCleared() {
        super.onCleared()
    }
}
