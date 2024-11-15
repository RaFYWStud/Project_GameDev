shader_type canvas_item;

uniform float pulse_speed : hint_range(0.5, 5.0) = 3.5;  // Kecepatan detak
uniform float scale_amount : hint_range(0.1, 1.0) = 0.1; // Seberapa besar skalanya

void fragment() {
    vec2 center = vec2(0.5, 0.5);  // Pusat sprite (normalisasi koordinat UV)
    float pulse = sin(TIME * pulse_speed) * scale_amount + 1.0;  // Animasi detak jantung
    COLOR = texture(TEXTURE, UV * pulse + center * (1.0 - pulse));  // Efek zoom
}
