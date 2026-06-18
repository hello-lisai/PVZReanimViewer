#version 330 core

in vec4 fColor;
in vec2 fTexCoord;
flat in int fTexIndex;

uniform sampler2D uTextures[32];

out vec4 FragColor;

void main()
{
    vec4 texColor = texture(uTextures[fTexIndex], fTexCoord);
    FragColor = texColor * fColor;
}