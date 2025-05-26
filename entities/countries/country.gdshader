shader_type canvas_item;

uniform float mix_percentage = .8;
uniform vec4 color: source_color;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
	if (tex_color.a == 1.00) {
        COLOR = mix(tex_color, color, mix_percentage);
    } else {
        COLOR = tex_color;
    }
}
