package com.example.credsapp

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform