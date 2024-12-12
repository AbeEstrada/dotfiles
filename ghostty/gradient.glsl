void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec3 gradientStartColor = vec3(0.10, 0.09, 0.17);
    vec3 gradientEndColor = vec3(0.0);
    vec2 center = vec2(0.5, 0.5);
    float dist = distance(uv, center);
    float mixValue = smoothstep(0.0, 1.2, dist);
    mixValue = pow(mixValue, 1.5);
    vec3 gradientColor = mix(gradientStartColor, gradientEndColor, mixValue);
    vec4 terminalColor = texture(iChannel0, uv);
    float mask = 1.0 - step(0.5, dot(terminalColor.rgb, vec3(1.0)));
    vec3 blendedColor = mix(terminalColor.rgb, gradientColor, mask);
    fragColor = vec4(blendedColor, terminalColor.a);
}
