package com.example.kmm.core.coroutines

import kotlinx.coroutines.CoroutineDispatcher

class AppCoroutineDispatchers(
    val io: CoroutineDispatcher,
    val main: CoroutineDispatcher,
    val default: CoroutineDispatcher,
    val mainImmediate: CoroutineDispatcher
)