package com.example.credsapp.viewmodel

import com.example.credsapp.model.CredType
import com.example.credsapp.model.CreditDebitModel
import com.example.kmm.core.utils.toCommonStateFlow
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlin.random.Random

class CredsViewModel {
    private val viewModelScope = CoroutineScope(Dispatchers.Main)

    // Data Members
    private val _credList = MutableStateFlow(listOf(CreditDebitModel()))
    val credList = _credList.toCommonStateFlow()



    fun getCredList() {
        val dummyDataArray = generateDummyData()

        // Print the generated dummy data
        for (data in dummyDataArray) {
            println(data)
        }

        _credList.value = dummyDataArray.toList()
    }

    private fun generateDummyData(): Array<CreditDebitModel> {
        val dummyDataArray = mutableListOf<CreditDebitModel>()

        for (i in 1..20) {
            val dummyData = CreditDebitModel(
                type = if (i % 2 == 0) CredType.CREDIT else CredType.DEBIT,
                name = "CardHolder$i",
                number = "1234 5678 9012 ${i.toString().padStart(2, '0')}",
                cvv = "123",
                cardExpiryDate = "12/25",
                cardLastUsed = "01/01/2023",
                cardLastUsedInterval = Random.nextInt(0, 20)
            )
            dummyDataArray.add(dummyData)
        }

        return dummyDataArray.toTypedArray()
    }



}