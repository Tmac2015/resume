attribute vec3 position;
attribute float delay;
attribute float startY;

uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform float time;
uniform float duration;
uniform vec2 resolution;
uniform float pixelRatio;
uniform sampler2D noiseTex;

varying vec3 vColor;
varying float vAlpha;

#pragma glslify: convertHsvToRgb = require(glsl-util/src/convertHsvToRgb);

void main() {
  // Coordinate transformation
  float alpha = clamp((time - delay) / duration, 0.0, 1.0);
  vec3 risePosition = vec3(0.0, alpha * 14.0 - 8.0 + startY, 0.0);

  float noiseR = texture2D(
    noiseTex,
    position.yz * 0.4 + vec2(time * 0.02, 0.0)
    ).r * 2.0 - 1.0;
  float noiseG = texture2D(
    noiseTex,
    position.zx * 0.4 + vec2(0.0, time * 0.02)
    ).g * 2.0 - 1.0;
  float noiseB = texture2D(
    noiseTex,
    position.xy * 0.4 - time * 0.02
    ).b * 2.0 - 1.0;
  vec3 noisePosition = vec3(noiseR, noiseG, noiseB) * alpha * 22.0;

  vec4 mvPosition = viewMatrix * modelMatrix * vec4(position + noisePosition + risePosition, 1.0);
  float distanceFromCamera = length(mvPosition.xyz);

  // Define the point size.
  float pointSize = 4.0 * pixelRatio * 50.0 / distanceFromCamera * resolution.y / 1024.0;

  vColor = convertHsvToRgb(
    vec3(
      0.08 + delay * 0.02,
      0.8,
      0.4
      )
    );
  vAlpha = alpha;

  gl_Position = projectionMatrix * mvPosition;
  gl_PointSize = pointSize;
}
