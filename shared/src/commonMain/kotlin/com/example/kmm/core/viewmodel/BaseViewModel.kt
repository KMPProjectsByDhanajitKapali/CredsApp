package com.example.kmm.core.viewmodel

import com.example.kmm.core.coroutines.AppCoroutineDispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

abstract class BaseViewModel<S, E, A>(
    final override val initialState: S,
    dispatchers: AppCoroutineDispatchers
) :
    ViewModel(dispatchers), IFlowViewModel<S, E, A> {

    abstract val TAG: String

    private val _stateHolder: MutableStateFlow<S> = MutableStateFlow(initialState)

    private val _eventHolder: MutableStateFlow<E?> = MutableStateFlow(null)

    override val eventHolder: StateFlow<E?>
        get() = _eventHolder.asStateFlow()

    override val stateHolder: StateFlow<S>
        get() = _stateHolder.asStateFlow()

    protected fun setState(state: S) {
        _stateHolder.value = state
    }

    protected fun pushEvent(event: E?) {
        vmScope.launch(dispatchers.mainImmediate) {
            _eventHolder.value = event
        }
    }

    override fun onEventConsumed() {
        pushEvent(null)
    }
}
