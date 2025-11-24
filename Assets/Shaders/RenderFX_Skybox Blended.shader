Shader "RenderFX/Skybox Blended" {
	Properties {
		_Tint ("Tint Color", Vector) = (0.5,0.5,0.5,0.5)
		[Gamma] _Exposure ("Exposure", Range(0, 8)) = 1
		_FogColor2 ("Fog 2", Vector) = (0.5,0.5,0.5,1)
		_Ambient2 ("Ambient 2", Vector) = (0.5,0.5,0.5,1)
		_Blend ("Blend", Range(0, 1)) = 0.5
		[NoScaleOffset] _Tex ("Day (HDR)", Cube) = "grey" {}
		[NoScaleOffset] _Tex2 ("Night (HDR)", Cube) = "grey" {}
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
			};

			struct Vertex_Stage_Output
			{
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return float4(1.0, 1.0, 1.0, 1.0); // RGBA
			}

			ENDHLSL
		}
	}
}