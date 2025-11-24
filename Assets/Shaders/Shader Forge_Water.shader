Shader "Shader Forge/Water" {
	Properties {
		_RGBAwater ("RGBA water", 2D) = "white" {}
		_WaterColor ("Water Color", Vector) = (0.3278006,0.7173615,0.9485294,1)
		_FlowWaterTile ("Flow Water Tile", Range(0, 10)) = 0
		_FlowWaterSpeed ("Flow Water Speed", Range(0, 25)) = 0
		_FlowWaterDistortTile ("Flow Water Distort Tile", Range(0, 5)) = 0
		_FlowDistortion ("Flow Distortion", Float) = 0.1
		_CalmWaterTile ("Calm Water Tile", Range(1, 40)) = 1
		_CalmWaterSpeed ("Calm Water Speed", Range(0, 5)) = 3.473058
		_CalmWaterDistortTile ("Calm Water Distort Tile", Range(0, 10)) = 0
		_CalmWaterDistort ("Calm Water Distort", Float) = 0.1
		_FoamTile ("Foam Tile", Range(0, 40)) = 0
		_FoamSpeed ("Foam Speed", Range(0, 40)) = 0
		_FoamDistortTile ("Foam Distort Tile", Range(0, 10)) = 0
		_FoamDistortion ("Foam Distortion", Float) = 0.1
		_EdgesScale ("Edges Scale", Range(0, 2)) = 0
		_EdgesSpeed ("Edges Speed", Range(0, 5)) = 0
		_InvFade ("Inv fade", Range(0, 3)) = 1
		_DistanceFade ("Fade from camera", Range(0, 3)) = 0
		_StartAlpha ("Start alpha", Range(0, 1)) = 0.5
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
	Fallback "Shader Forge/Water Opaque"
}