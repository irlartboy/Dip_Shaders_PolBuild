Shader "Custom/Outline"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0

		_OutlineColor ("Outline Color", Color) = (0,0,0,1)
		_OutlineSize ("Outline Size", Range(0,1)) = 0.05
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

		struct Input {
		float4 color : COLOR;
		};
		 
		 
		 
		half _Glossiness;
        half _Metallic;
        half4 _Color;
   
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _Color.rgb* IN.color.rgb;
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = _Color.a * IN.color.a;
        }
        ENDCG

		Pass
		{
		Cull Front
			CGPROGRAM
			#pragma vertex VertexProgram
			#pragma fragment FragmentProgrm

			half _OutlineSize;

			float4 VertexProgram(float4 position : POSITION, float3 normal : NORMAL): SV_POSITION {
			position.xyz += normal * _OutlineSize;

			return UnityObjectToClipPos(position);
			
			}
			half4 _OutlineColor;
			half4 FragmentProgrm(): SV_TARGET {
				return _OutlineColor;
			}
			ENDCG
		}
    }
    FallBack "Diffuse"
}
