shader_type canvas_item;

//void vertex() {
	//// Called for every vertex the material is visible on.
//}

const float frequency = 750.00;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    vec4 overlay_color = vec4(.3, .3, .9, .8);
    
    // Create a diagonal striped pattern
    float stripe = mod((UV.x + UV.y) * frequency, 2) > 1.00 ? 1.0 : 0.0;
	
    // Apply overlay only to non-transparent areas and within stripe pattern
    if (tex_color.a > 0.0 && stripe == 1.0) {
        COLOR = mix(tex_color, overlay_color, overlay_color.a);
    } else {
        COLOR = tex_color;
    }
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
