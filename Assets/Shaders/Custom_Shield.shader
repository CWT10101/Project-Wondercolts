Shader "Custom/Shield" {
	Properties {
		_BaseTexture ("_BaseTexture", 2D) = "white" {}
		_BaseStrength ("_BaseStrength", Range(0, 1)) = 0
		_BaseColor ("_BaseColor", Vector) = (0,1,0,1)
		_Color ("_Color", Vector) = (0,1,0,1)
		_RefractionColor ("_RefractionColor", Vector) = (0,1,0,1)
		_Inside ("_Inside", Range(0, 2)) = 0
		_Rim ("_Rim", Range(0, 1)) = 1.2
		_Texture ("_Texture", 2D) = "white" {}
		_TextureStrength ("_TextureStrength", Range(0, 1)) = 1
		_Speed ("_Speed", Range(0.5, 5)) = 0.5
		_Tile ("_Tile", Range(1, 10)) = 5
		_Strength ("_Strength", Range(0, 5)) = 1.5
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

			float4 _Color;

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return _Color; // RGBA
			}

			ENDHLSL
		}
	}
	Fallback "Diffuse"
}