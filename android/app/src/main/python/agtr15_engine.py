import math

def calculate_agtr15(bpm, accel):
    """
    Calcula la intensidad del entrenamiento basada en BPM o acelerómetro.
    
    Args:
        bpm: Pulsaciones por minuto (0 si no hay HR disponible)
        accel: Aceleración del acelerómetro (m/s²)
    
    Returns:
        Dict con S (score), R (risk), C (continuity) y mode
    """
    if bpm > 0:
        # Usar BPM como fuente principal
        intensity = (bpm - 60) / 130.0
        mode = "BPM"
    else:
        # Fallback a acelerómetro
        intensity = accel / 20.0
        mode = "ACCEL"
    
    # Normalizar intensidad entre 0 y 1
    intensity = max(0.0, min(1.0, intensity))
    
    # Calcular componentes AGTR
    # S: Zona de flujo (máximo en 0.7)
    s_score = math.exp(-pow(intensity - 0.7, 2) / 0.1)
    
    # R: Riesgo (aumenta después de 0.8)
    risk_r = (intensity - 0.8) / 0.2 if intensity > 0.8 else 0.0
    
    # C: Continuidad (constante)
    continuity_c = 0.9
    
    return {
        "S": float(s_score),
        "R": float(risk_r),
        "C": float(continuity_c),
        "mode": mode,
        "intensity": float(intensity)
    }
