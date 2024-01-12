package com.example.kmm.core.coroutines

expect object CoroutineDependency {
    val dispatchers: AppCoroutineDispatchers
}