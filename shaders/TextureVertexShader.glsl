#version 330 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec4 aColor;
layout (location = 2) in vec2 aTexCoord;
layout (location = 3) in float aTexIndex;
layout (location = 4) in float aMatrixIndex;

uniform mat4 uProjection;
uniform mat4 uModelMatrices[32];

out vec4 fColor;
out vec2 fTexCoord;
flat out int fTexIndex;

void main()
{
    int index = int(aMatrixIndex);
    mat4 model = uModelMatrices[index];
    
    gl_Position = uProjection * model * vec4(aPos, 1.0);
    
    fColor = aColor;
    fTexCoord = aTexCoord;
    fTexIndex = int(aTexIndex);
}