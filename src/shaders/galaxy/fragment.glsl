varying vec3 vColour;

void main()
{
  float strength = distance(gl_PointCoord, vec2(0.5));
  strength = 1.0 - strength;
  strength = pow(strength, 10.0);

  vec3 colour = mix(vec3(0.0), vColour, strength);

  gl_FragColor = vec4(colour, 1.0);
  #include <colorspace_fragment>
}