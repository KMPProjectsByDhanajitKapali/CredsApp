package com.example.credsapp.model

data class CreditDebitModel(
    val type: CredType? = CredType.CREDIT,
    val name: String = "",
    val number: String = "",
    val cvv: String = "",
    val cardExpiryDate: String = "",
    val cardLastUsed: String = "",
    val cardLastUsedInterval: String = ""
)

enum class CredType {
    CREDIT,
    DEBIT
}
