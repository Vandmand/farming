shader_type spatial;
render_mode unshaded;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform vec4 OUTLINE_COLOR : source_color;
uniform float OUTLINE_WIDTH = 2.0;

void fragment() {
	vec4 pixelatedTexture = texture(SCREEN_TEXTURE, SCREEN_UV);
	vec2 pixelSize = 1.0 / VIEWPORT_SIZE;
	ALBEDO = pixelatedTexture.rgb;
	
	for (int y = -1 * int(OUTLINE_WIDTH); y <= 1 * int(OUTLINE_WIDTH); y++) {
		for (int x = -1 * int(OUTLINE_WIDTH); x <= 1 * int(OUTLINE_WIDTH); x++) {
		vec4 outlinedTexture = texture(SCREEN_TEXTURE, SCREEN_UV + vec2(float(x), float(y)) * pixelSize);
		if( 
			outlinedTexture.a == 0.0 && 
			SCREEN_UV.x + float(x) * pixelSize.x < 1.0 && 
			SCREEN_UV.x + float(x) * pixelSize.x > 0.0 && 
			SCREEN_UV.y + float(y) * pixelSize.y < 1.0 && 
			SCREEN_UV.y + float(y) * pixelSize.y > 0.0) 
			{
			ALBEDO = OUTLINE_COLOR.rgb;
			ALPHA = 1.0;
		}
	}	
	}	
}



//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
