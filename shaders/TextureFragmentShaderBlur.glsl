#version 330 core

in vec4 fColor;
in vec2 fTexCoord;
flat in int fTexIndex;

uniform sampler2D uTextures[32];
uniform vec2 uTexelSize;

out vec4 FragColor;

void main()
{
    vec4 result = vec4(0.0);
    
    // 3x3 box blur
    float weights[9] = float[](
        1.0, 2.0, 1.0,
        2.0, 4.0, 2.0,
        1.0, 2.0, 1.0
    );
    
    float totalWeight = 16.0;
    
    for (int y = -1; y <= 1; y++)
    {
        for (int x = -1; x <= 1; x++)
        {
            vec2 offset = vec2(float(x) * uTexelSize.x, float(y) * uTexelSize.y);
            int weightIndex = (y + 1) * 3 + (x + 1);
            result += texture(uTextures[fTexIndex], fTexCoord + offset) * weights[weightIndex];
        }
    }
    
    FragColor = (result / totalWeight) * fColor;
}