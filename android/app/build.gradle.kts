plugins {
    id("com.android.application")
    id("kotlin-android")
   
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        
        applicationId = "com.alaa.personalnotese"
        namespace = "com.alaa.personalnotes"
       
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }
signingConfigs {
        create("release") {
          
            storeFile = file("upload-keystore.jks") 
            storePassword = "alaa123459" 
            keyAlias = "upload"
            keyPassword = "alaa123459"
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}
