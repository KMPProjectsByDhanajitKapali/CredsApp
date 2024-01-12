plugins {
    alias(libs.plugins.kotlinMultiplatform)
    alias(libs.plugins.androidLibrary)
}

kotlin {
    androidTarget {
        compilations.all {
            kotlinOptions {
                jvmTarget = "1.8"
            }
        }
    }
    
    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "shared"
            isStatic = true
            linkerOpts += "-ld64"
        }
    }

    sourceSets {
        val commonMain by getting {
            //put your multiplatform dependencies here
            dependencies {
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.1")
            }
        }

        val androidMain by getting {
            dependencies {
                api("androidx.lifecycle:lifecycle-viewmodel-ktx:2.5.1")
            }
        }

        val iosX64Main by getting
        val iosArm64Main by getting {
            dependencies {
            }
        }
        val iosSimulatorArm64Main by getting
        val iosMain by creating {
            dependencies {
            }
            dependsOn(commonMain)
            iosX64Main.dependsOn(this)
            iosArm64Main.dependsOn(this)
            iosSimulatorArm64Main.dependsOn(this)
        }
    }
}

android {
    namespace = "com.example.credsapp"
    compileSdk = 34
    defaultConfig {
        minSdk = 24
    }
}
