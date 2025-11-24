Shader "Reflective/River Water Vertex Color" {
	Properties {
		_Color ("Main Color", Vector) = (1,1,1,1)
		_WaveScale ("Wave scale", Range(0.02, 0.15)) = 0.07
		WaveSpeed ("Wave speed (map1 x,y; map2 x,y)", Vector) = (19,9,-16,-7)
		_SpecColor ("Specular Color", Vector) = (0.5,0.5,0.5,1)
		_Shininess ("Shininess", Range(0.01, 1)) = 0.078125
		_ChromaticDispersion ("_ChromaticDispersion", Range(0, 4)) = 0.1
		_Refraction ("Refraction", Range(0, 100)) = 1
		_ReflToRefrExponent ("_ReflToRefrExponent", Range(0, 4)) = 1
		_ReflectColor ("Reflection Color", Vector) = (1,1,1,0.5)
		_BumpReflectionStr ("_BumpReflectionStr", Range(0, 1)) = 0.5
		_MainTex ("Base (RGB) RefStrGloss (A)", 2D) = "white" {}
		_ReflectionTex ("_ReflectionTex", Cube) = "white" {}
		_BumpMap ("Normalmap", 2D) = "bump" {}
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _MainTex_ST;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float2 uv : TEXCOORD0;
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.uv = (input.uv.xy * _MainTex_ST.xy) + _MainTex_ST.zw;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;
			float4 _Color;

			struct Fragment_Stage_Input
			{
				float2 uv : TEXCOORD0;
			};

			float4 frag(Fragment_Stage_Input input) : SV_TARGET
			{
				return _MainTex.Sample(sampler_MainTex, input.uv.xy) * _Color;
			}

			ENDHLSL
		}
	}
	Fallback "Reflective/Bumped Diffuse"
}