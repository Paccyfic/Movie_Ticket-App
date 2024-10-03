# Razorpay classes
-keep class com.razorpay.** { *; }

# Google Pay Wallet classes
-keep class com.google.android.apps.nbu.paisa.inapp.client.api.** { *; }
-keep class com.google.android.gms.wallet.** { *; }

# Keep classes related to Analytics and payments in Razorpay
-keep class proguard.annotation.Keep
-keep class proguard.annotation.KeepClassMembers
-keepattributes *Annotation*

-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
