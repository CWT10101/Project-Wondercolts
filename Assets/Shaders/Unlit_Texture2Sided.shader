Shader "Unlit/Texture2Sided" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" {}
}
SubShader { 
 LOD 100
 Tags { "RenderType"="Opaque" }
 Pass {
  Tags { "RenderType"="Opaque" }
  Cull Off
  SetTexture [_MainTex] { combine texture }
 }
}
}