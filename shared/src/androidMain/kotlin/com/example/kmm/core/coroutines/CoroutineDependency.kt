package com.example.kmm.core.coroutines

import kotlinx.coroutines.Dispatchers

actual object CoroutineDependency {
    actual val dispatchers: AppCoroutineDispatchers = AppCoroutineDispatchers(
        io = Dispatchers.IO,
        main = Dispatchers.Main,
        default = Dispatchers.Default,
        mainImmediate = Dispatchers.Main.immediate
    )
}