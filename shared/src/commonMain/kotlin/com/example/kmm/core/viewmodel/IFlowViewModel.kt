package com.example.kmm.core.viewmodel

import kotlinx.coroutines.flow.StateFlow

interface IFlowViewModel<S, E, A> {
    val initialState: S
    fun add(action: A)
    val stateHolder: StateFlow<S>
    val eventHolder: StateFlow<E?>
    fun onEventConsumed()
}
