package com.example.qodeia_fitness

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.chaquo.python.Python
import com.chaquo.python.android.AndroidPlatform

class MainActivity: FlutterActivity() {
    private val CHANNEL = "qodeia/engine"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Inicializar Python
        if (!Python.isStarted()) {
            Python.start(AndroidPlatform(this))
        }

        val py = Python.getInstance()
        val agtr = py.getModule("agtr15_engine")
        val coach = py.getModule("coach_logic")

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                try {
                    val args = call.arguments as Map<*, *>
                    when (call.method) {
                        "calculateAgtr15" -> {
                            val bpm = (args["bpm"] as? Number)?.toDouble() ?: 0.0
                            val accel = (args["accel"] as? Number)?.toDouble() ?: 0.0
                            
                            val out = agtr.callAttr("calculate_agtr15", bpm, accel)
                                .toJava(Map::class.java)
                            
                            android.util.Log.d("AGTR15", "CANAL ACTIVO - AGTR => $out")
                            result.success(out)
                        }
                        "getDialogue" -> {
                            val s = (args["s"] as? Number)?.toDouble() ?: 0.0
                            val r = (args["r"] as? Number)?.toDouble() ?: 0.0
                            val c = (args["c"] as? Number)?.toDouble() ?: 0.0
                            val mode = args["mode"] as? String ?: "UNKNOWN"
                            
                            val out = coach.callAttr("get_dialogue", s, r, c, mode)
                                .toJava(Map::class.java)
                            
                            result.success(out)
                        }
                        else -> result.notImplemented()
                    }
                } catch (e: Exception) {
                    android.util.Log.e("AGTR15", "Error: ${e.message}")
                    result.error("PY_ERR", e.message, null)
                }
            }
    }
}
