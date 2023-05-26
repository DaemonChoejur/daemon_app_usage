package com.alphaNapster.daemon_app_usage

import android.app.Activity
import android.app.AppOpsManager
import android.app.usage.UsageStats
import android.app.usage.UsageStatsManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.provider.Settings
import androidx.annotation.RequiresApi
import androidx.core.content.ContextCompat.getSystemService
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import java.text.SimpleDateFormat
import java.util.*


class DaemonAppUsagePlugin: FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
    private val dateFormat: SimpleDateFormat = SimpleDateFormat("M-d-yyyy HH:mm:ss")
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private val methodChannelName = "daemon_app_usage.methodChannel"
    private lateinit var activity: Activity

    private lateinit var usageStats: UsageStatsManager

    private val packageName = "DaemonAppUsagePlugin"


    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, methodChannelName)
        channel.setMethodCallHandler(this)
        context = binding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
//      TODO: user will be able to specify interval, startTime and endTime
        when(call.method) {
            "getAppUsage" -> getAppUsage(result)
            else -> result.notImplemented()
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivity() {

    }
    

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    @SuppressWarnings("ResourceType")
//    @RequiresApi(Build.VERSION_CODES.KITKAT)
   private fun getAppUsage(result: Result) {
//        val usageStatsManager = context.getSystemService("usagestats") as UsageStatsManager

        val isPermissionGranted = checkUsageStatsPermission()

        if(isPermissionGranted) {
            usageStats = getSystemService<UsageStatsManager>()
        }else {
            val intent = Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS)
//            intent.addFlags()
            this.activity.startActivity(intent)
        }
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    @SuppressWarnings("ResourceType")
    private fun getAppUsageList(usageStatsManager: UsageStatsManager): List<UsageStats> {
//        val usageStatsManager = context.getSystemService("usagestats") as UsageStatsManager
//        val now: Long = Calendar.getInstance().timeInMillis

        val interval = UsageStatsManager.INTERVAL_DAILY

        val cal = Calendar.getInstance()
        cal.add(Calendar.YEAR, -1)

        val startTime = cal.timeInMillis
        val endTime = System.currentTimeMillis()

        Log.d(packageName, "Range start:" + dateFormat.format(startTime) );
        Log.d(packageName, "Range end:" + dateFormat.format(endTime));

        return usageStatsManager.queryUsageStats(
           interval,
           startTime,
            endTime
        );
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    private fun checkUsageStatsPermission() : Boolean {
//        val appOpsManager = getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        val appOpsManager = getSystemService(context, AppOpsManager::class.java)
        // `AppOpsManager.checkOpNoThrow` is deprecated from Android Q
        val mode = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            appOpsManager?.unsafeCheckOpNoThrow(
                "android:get_usage_stats",
                android.os.Process.myUid(), packageName
            )
        }
        else {
            appOpsManager?.checkOpNoThrow(
                "android:get_usage_stats",
                android.os.Process.myUid(), packageName
            )
        }
        return mode == AppOpsManager.MODE_ALLOWED
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    fun printUsageStats(usageStatsList: List<UsageStats>) {
        for (u in usageStatsList) {
            Log.d(
                packageName, "Pkg: " + u.packageName + "\t" + "ForegroundTime: "
                        + u.totalTimeInForeground
            )
        }
    }


}


    

