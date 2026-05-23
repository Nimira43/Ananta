uniform float uTime;
uniform float uSize;

attribute vec3 aRandomness;
attribute float aScale;

varying vec3 vColour;

void main()
{
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);
  float angle = atan(modelPosition.x, modelPosition.z);
  float distanceToCentre = length(modelPosition.xz);
  float angleOffset = (1.0 / distanceToCentre) * uTime;

  angle += angleOffset;
  modelPosition.x = cos(angle) * distanceToCentre;
  modelPosition.z = sin(angle) * distanceToCentre;
  modelPosition.xyz += aRandomness;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;
  gl_Position = projectedPosition;

  gl_PointSize = uSize * aScale;
  gl_PointSize *= (1.0 / - viewPosition.z);

  vColour = color;
}