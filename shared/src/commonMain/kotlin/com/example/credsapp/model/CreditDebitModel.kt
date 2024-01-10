package com.example.credsapp.model

data class CreditDebitModel (
    val type: CredType,
    val name: String,
    val number: String,
    val cvv: String,
    val cardExpiryData: String,
    val cardLastUsed: String,
    val cardUsedInterval: String
)