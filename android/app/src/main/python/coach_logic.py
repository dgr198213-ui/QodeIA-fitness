def get_dialogue(s, r, c, mode):
    """
    Genera diálogos del coach basado en métricas AGTR.
    
    Args:
        s: Score de flujo (0-1)
        r: Riesgo (0-1)
        c: Continuidad (0-1)
        mode: Fuente de datos (BPM o ACCEL)
    
    Returns:
        Dict con type (ASK, TELL, SILENCE) y text
    """
    
    # Riesgo alto: preguntar cómo se siente
    if r > 0.85:
        return {
            "type": "ASK",
            "text": "Intensidad alta. ¿Cómo te sientes? Di Bien o Cansado."
        }
    
    # Flujo óptimo: felicitar
    if s > 0.9:
        return {
            "type": "TELL",
            "text": "Zona de flujo alcanzada. ¡Excelente!"
        }
    
    # Flujo bueno: motivar
    if s > 0.7:
        return {
            "type": "TELL",
            "text": "¡Vas muy bien! Mantén este ritmo."
        }
    
    # Intensidad baja: motivar a aumentar
    if s < 0.3:
        return {
            "type": "TELL",
            "text": "Aumenta un poco la intensidad para mejor resultado."
        }
    
    # Por defecto: silencio
    return {
        "type": "SILENCE",
        "text": ""
    }
