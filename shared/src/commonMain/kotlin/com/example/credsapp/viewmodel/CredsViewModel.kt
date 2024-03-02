package com.example.credsapp.viewmodel

import com.example.credsapp.model.CreditDebitModel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow

class CredsViewModel {
    private val viewModelScope = CoroutineScope(Dispatchers.Main)

    // Data Members
    val credList = MutableStateFlow(listOf(CreditDebitModel()))

}