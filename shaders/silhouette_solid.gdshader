shader_type spatial;
stencil_mode read, write, compare_not_equal, 1;
render_mode unshaded, depth_test_inverted, depth_draw_never;
uniform vec4 colour : source_color = vec4(1.0, 1.0, 1.0, 1.0); 

void fragment() {
    ALBEDO = colour.rgb;
    ALPHA = colour.a;
}