Shader "Custom/MLPDiffuse" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
}
SubShader { 
 LOD 200
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
Program "vp" {
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_2 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec3 tmpvar_7;
  mediump vec4 normal_8;
  normal_8 = tmpvar_6;
  highp float vC_9;
  mediump vec3 x3_10;
  mediump vec3 x2_11;
  mediump vec3 x1_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAr, normal_8);
  x1_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAg, normal_8);
  x1_12.y = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAb, normal_8);
  x1_12.z = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBr, tmpvar_16);
  x2_11.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBg, tmpvar_16);
  x2_11.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBb, tmpvar_16);
  x2_11.z = tmpvar_19;
  mediump float tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_SHC.xyz * vC_9);
  x3_10 = tmpvar_21;
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = tmpvar_7;
  tmpvar_3 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out lowp vec3 xlv_TEXCOORD1;
out lowp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_2 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec3 tmpvar_7;
  mediump vec4 normal_8;
  normal_8 = tmpvar_6;
  highp float vC_9;
  mediump vec3 x3_10;
  mediump vec3 x2_11;
  mediump vec3 x1_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAr, normal_8);
  x1_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAg, normal_8);
  x1_12.y = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAb, normal_8);
  x1_12.z = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBr, tmpvar_16);
  x2_11.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBg, tmpvar_16);
  x2_11.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBb, tmpvar_16);
  x2_11.z = tmpvar_19;
  mediump float tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_SHC.xyz * vC_9);
  x3_10 = tmpvar_21;
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = tmpvar_7;
  tmpvar_3 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_3;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
ConstBuffer "$Globals" 272
Matrix 112 [glstate_matrix_mvp]
Matrix 176 [_Object2World]
Vector 0 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 32 [unity_SHAb]
Vector 48 [unity_SHBr]
Vector 64 [unity_SHBg]
Vector 80 [unity_SHBb]
Vector 96 [unity_SHC]
Vector 240 [unity_Scale]
Vector 256 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half3 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4 unity_SHAr;
  float4 unity_SHAg;
  float4 unity_SHAb;
  float4 unity_SHBr;
  float4 unity_SHBg;
  float4 unity_SHBb;
  float4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float3 shlight_1;
  half3 tmpvar_2;
  half3 tmpvar_3;
  float3x3 tmpvar_4;
  tmpvar_4[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_4[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_4[2] = _mtl_u._Object2World[2].xyz;
  float3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  tmpvar_2 = half3(tmpvar_5);
  float4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  half3 tmpvar_7;
  half4 normal_8;
  normal_8 = half4(tmpvar_6);
  float vC_9;
  half3 x3_10;
  half3 x2_11;
  half3 x1_12;
  float tmpvar_13;
  tmpvar_13 = dot (_mtl_u.unity_SHAr, (float4)normal_8);
  x1_12.x = half(tmpvar_13);
  float tmpvar_14;
  tmpvar_14 = dot (_mtl_u.unity_SHAg, (float4)normal_8);
  x1_12.y = half(tmpvar_14);
  float tmpvar_15;
  tmpvar_15 = dot (_mtl_u.unity_SHAb, (float4)normal_8);
  x1_12.z = half(tmpvar_15);
  half4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  float tmpvar_17;
  tmpvar_17 = dot (_mtl_u.unity_SHBr, (float4)tmpvar_16);
  x2_11.x = half(tmpvar_17);
  float tmpvar_18;
  tmpvar_18 = dot (_mtl_u.unity_SHBg, (float4)tmpvar_16);
  x2_11.y = half(tmpvar_18);
  float tmpvar_19;
  tmpvar_19 = dot (_mtl_u.unity_SHBb, (float4)tmpvar_16);
  x2_11.z = half(tmpvar_19);
  half tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = float(tmpvar_20);
  float3 tmpvar_21;
  tmpvar_21 = (_mtl_u.unity_SHC.xyz * vC_9);
  x3_10 = half3(tmpvar_21);
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = float3(tmpvar_7);
  tmpvar_3 = half3(shlight_1);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = tmpvar_2;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_3;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out highp vec2 xlv_TEXCOORD1;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
Bind "texcoord1" ATTR2
ConstBuffer "$Globals" 96
Matrix 0 [glstate_matrix_mvp]
Vector 64 [unity_LightmapST]
Vector 80 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesMultiTexCoord0 [[attribute(1)]];
  float4 _glesMultiTexCoord1 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4 unity_LightmapST;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = ((_mtl_i._glesMultiTexCoord1.xy * _mtl_u.unity_LightmapST.xy) + _mtl_u.unity_LightmapST.zw);
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out highp vec2 xlv_TEXCOORD1;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
Bind "texcoord1" ATTR2
ConstBuffer "$Globals" 96
Matrix 0 [glstate_matrix_mvp]
Vector 64 [unity_LightmapST]
Vector 80 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesMultiTexCoord0 [[attribute(1)]];
  float4 _glesMultiTexCoord1 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4 unity_LightmapST;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = ((_mtl_i._glesMultiTexCoord1.xy * _mtl_u.unity_LightmapST.xy) + _mtl_u.unity_LightmapST.zw);
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_2 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec3 tmpvar_7;
  mediump vec4 normal_8;
  normal_8 = tmpvar_6;
  highp float vC_9;
  mediump vec3 x3_10;
  mediump vec3 x2_11;
  mediump vec3 x1_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAr, normal_8);
  x1_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAg, normal_8);
  x1_12.y = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAb, normal_8);
  x1_12.z = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBr, tmpvar_16);
  x2_11.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBg, tmpvar_16);
  x2_11.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBb, tmpvar_16);
  x2_11.z = tmpvar_19;
  mediump float tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_SHC.xyz * vC_9);
  x3_10 = tmpvar_21;
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = tmpvar_7;
  tmpvar_3 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_2 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec3 tmpvar_7;
  mediump vec4 normal_8;
  normal_8 = tmpvar_6;
  highp float vC_9;
  mediump vec3 x3_10;
  mediump vec3 x2_11;
  mediump vec3 x1_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAr, normal_8);
  x1_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAg, normal_8);
  x1_12.y = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAb, normal_8);
  x1_12.z = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBr, tmpvar_16);
  x2_11.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBg, tmpvar_16);
  x2_11.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBb, tmpvar_16);
  x2_11.z = tmpvar_19;
  mediump float tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_SHC.xyz * vC_9);
  x3_10 = tmpvar_21;
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = tmpvar_7;
  tmpvar_3 = shlight_1;
  highp vec3 tmpvar_22;
  tmpvar_22 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - tmpvar_22.x);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - tmpvar_22.y);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - tmpvar_22.z);
  highp vec4 tmpvar_26;
  tmpvar_26 = (((tmpvar_23 * tmpvar_23) + (tmpvar_24 * tmpvar_24)) + (tmpvar_25 * tmpvar_25));
  highp vec4 tmpvar_27;
  tmpvar_27 = (max (vec4(0.0, 0.0, 0.0, 0.0), (
    (((tmpvar_23 * tmpvar_5.x) + (tmpvar_24 * tmpvar_5.y)) + (tmpvar_25 * tmpvar_5.z))
   * 
    inversesqrt(tmpvar_26)
  )) * (1.0/((1.0 + 
    (tmpvar_26 * unity_4LightAtten0)
  ))));
  highp vec3 tmpvar_28;
  tmpvar_28 = (tmpvar_3 + ((
    ((unity_LightColor[0].xyz * tmpvar_27.x) + (unity_LightColor[1].xyz * tmpvar_27.y))
   + 
    (unity_LightColor[2].xyz * tmpvar_27.z)
  ) + (unity_LightColor[3].xyz * tmpvar_27.w)));
  tmpvar_3 = tmpvar_28;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_3;
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out lowp vec3 xlv_TEXCOORD1;
out lowp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_2 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec3 tmpvar_7;
  mediump vec4 normal_8;
  normal_8 = tmpvar_6;
  highp float vC_9;
  mediump vec3 x3_10;
  mediump vec3 x2_11;
  mediump vec3 x1_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAr, normal_8);
  x1_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAg, normal_8);
  x1_12.y = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAb, normal_8);
  x1_12.z = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBr, tmpvar_16);
  x2_11.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBg, tmpvar_16);
  x2_11.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBb, tmpvar_16);
  x2_11.z = tmpvar_19;
  mediump float tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_SHC.xyz * vC_9);
  x3_10 = tmpvar_21;
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = tmpvar_7;
  tmpvar_3 = shlight_1;
  highp vec3 tmpvar_22;
  tmpvar_22 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - tmpvar_22.x);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - tmpvar_22.y);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - tmpvar_22.z);
  highp vec4 tmpvar_26;
  tmpvar_26 = (((tmpvar_23 * tmpvar_23) + (tmpvar_24 * tmpvar_24)) + (tmpvar_25 * tmpvar_25));
  highp vec4 tmpvar_27;
  tmpvar_27 = (max (vec4(0.0, 0.0, 0.0, 0.0), (
    (((tmpvar_23 * tmpvar_5.x) + (tmpvar_24 * tmpvar_5.y)) + (tmpvar_25 * tmpvar_5.z))
   * 
    inversesqrt(tmpvar_26)
  )) * (1.0/((1.0 + 
    (tmpvar_26 * unity_4LightAtten0)
  ))));
  highp vec3 tmpvar_28;
  tmpvar_28 = (tmpvar_3 + ((
    ((unity_LightColor[0].xyz * tmpvar_27.x) + (unity_LightColor[1].xyz * tmpvar_27.y))
   + 
    (unity_LightColor[2].xyz * tmpvar_27.z)
  ) + (unity_LightColor[3].xyz * tmpvar_27.w)));
  tmpvar_3 = tmpvar_28;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_3;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
ConstBuffer "$Globals" 464
Matrix 304 [glstate_matrix_mvp]
Matrix 368 [_Object2World]
Vector 0 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 32 [unity_4LightPosZ0]
Vector 48 [unity_4LightAtten0]
Vector 64 [unity_LightColor0]
Vector 80 [unity_LightColor1]
Vector 96 [unity_LightColor2]
Vector 112 [unity_LightColor3]
Vector 128 [unity_LightColor4]
Vector 144 [unity_LightColor5]
Vector 160 [unity_LightColor6]
Vector 176 [unity_LightColor7]
Vector 192 [unity_SHAr]
Vector 208 [unity_SHAg]
Vector 224 [unity_SHAb]
Vector 240 [unity_SHBr]
Vector 256 [unity_SHBg]
Vector 272 [unity_SHBb]
Vector 288 [unity_SHC]
Vector 432 [unity_Scale]
Vector 448 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half3 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4 unity_4LightPosX0;
  float4 unity_4LightPosY0;
  float4 unity_4LightPosZ0;
  float4 unity_4LightAtten0;
  float4 unity_LightColor[8];
  float4 unity_SHAr;
  float4 unity_SHAg;
  float4 unity_SHAb;
  float4 unity_SHBr;
  float4 unity_SHBg;
  float4 unity_SHBb;
  float4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float3 shlight_1;
  half3 tmpvar_2;
  half3 tmpvar_3;
  float3x3 tmpvar_4;
  tmpvar_4[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_4[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_4[2] = _mtl_u._Object2World[2].xyz;
  float3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  tmpvar_2 = half3(tmpvar_5);
  float4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  half3 tmpvar_7;
  half4 normal_8;
  normal_8 = half4(tmpvar_6);
  float vC_9;
  half3 x3_10;
  half3 x2_11;
  half3 x1_12;
  float tmpvar_13;
  tmpvar_13 = dot (_mtl_u.unity_SHAr, (float4)normal_8);
  x1_12.x = half(tmpvar_13);
  float tmpvar_14;
  tmpvar_14 = dot (_mtl_u.unity_SHAg, (float4)normal_8);
  x1_12.y = half(tmpvar_14);
  float tmpvar_15;
  tmpvar_15 = dot (_mtl_u.unity_SHAb, (float4)normal_8);
  x1_12.z = half(tmpvar_15);
  half4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  float tmpvar_17;
  tmpvar_17 = dot (_mtl_u.unity_SHBr, (float4)tmpvar_16);
  x2_11.x = half(tmpvar_17);
  float tmpvar_18;
  tmpvar_18 = dot (_mtl_u.unity_SHBg, (float4)tmpvar_16);
  x2_11.y = half(tmpvar_18);
  float tmpvar_19;
  tmpvar_19 = dot (_mtl_u.unity_SHBb, (float4)tmpvar_16);
  x2_11.z = half(tmpvar_19);
  half tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = float(tmpvar_20);
  float3 tmpvar_21;
  tmpvar_21 = (_mtl_u.unity_SHC.xyz * vC_9);
  x3_10 = half3(tmpvar_21);
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = float3(tmpvar_7);
  tmpvar_3 = half3(shlight_1);
  float3 tmpvar_22;
  tmpvar_22 = (_mtl_u._Object2World * _mtl_i._glesVertex).xyz;
  float4 tmpvar_23;
  tmpvar_23 = (_mtl_u.unity_4LightPosX0 - tmpvar_22.x);
  float4 tmpvar_24;
  tmpvar_24 = (_mtl_u.unity_4LightPosY0 - tmpvar_22.y);
  float4 tmpvar_25;
  tmpvar_25 = (_mtl_u.unity_4LightPosZ0 - tmpvar_22.z);
  float4 tmpvar_26;
  tmpvar_26 = (((tmpvar_23 * tmpvar_23) + (tmpvar_24 * tmpvar_24)) + (tmpvar_25 * tmpvar_25));
  float4 tmpvar_27;
  tmpvar_27 = (max (float4(0.0, 0.0, 0.0, 0.0), (
    (((tmpvar_23 * tmpvar_5.x) + (tmpvar_24 * tmpvar_5.y)) + (tmpvar_25 * tmpvar_5.z))
   * 
    rsqrt(tmpvar_26)
  )) * (1.0/((1.0 + 
    (tmpvar_26 * _mtl_u.unity_4LightAtten0)
  ))));
  float3 tmpvar_28;
  tmpvar_28 = ((float3)tmpvar_3 + ((
    ((_mtl_u.unity_LightColor[0].xyz * tmpvar_27.x) + (_mtl_u.unity_LightColor[1].xyz * tmpvar_27.y))
   + 
    (_mtl_u.unity_LightColor[2].xyz * tmpvar_27.z)
  ) + (_mtl_u.unity_LightColor[3].xyz * tmpvar_27.w)));
  tmpvar_3 = half3(tmpvar_28);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = tmpvar_2;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_3;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_2 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec3 tmpvar_7;
  mediump vec4 normal_8;
  normal_8 = tmpvar_6;
  highp float vC_9;
  mediump vec3 x3_10;
  mediump vec3 x2_11;
  mediump vec3 x1_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAr, normal_8);
  x1_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAg, normal_8);
  x1_12.y = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAb, normal_8);
  x1_12.z = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBr, tmpvar_16);
  x2_11.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBg, tmpvar_16);
  x2_11.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBb, tmpvar_16);
  x2_11.z = tmpvar_19;
  mediump float tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_SHC.xyz * vC_9);
  x3_10 = tmpvar_21;
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = tmpvar_7;
  tmpvar_3 = shlight_1;
  highp vec4 cse_22;
  cse_22 = (_Object2World * _glesVertex);
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - cse_22.x);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - cse_22.y);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - cse_22.z);
  highp vec4 tmpvar_26;
  tmpvar_26 = (((tmpvar_23 * tmpvar_23) + (tmpvar_24 * tmpvar_24)) + (tmpvar_25 * tmpvar_25));
  highp vec4 tmpvar_27;
  tmpvar_27 = (max (vec4(0.0, 0.0, 0.0, 0.0), (
    (((tmpvar_23 * tmpvar_5.x) + (tmpvar_24 * tmpvar_5.y)) + (tmpvar_25 * tmpvar_5.z))
   * 
    inversesqrt(tmpvar_26)
  )) * (1.0/((1.0 + 
    (tmpvar_26 * unity_4LightAtten0)
  ))));
  highp vec3 tmpvar_28;
  tmpvar_28 = (tmpvar_3 + ((
    ((unity_LightColor[0].xyz * tmpvar_27.x) + (unity_LightColor[1].xyz * tmpvar_27.y))
   + 
    (unity_LightColor[2].xyz * tmpvar_27.z)
  ) + (unity_LightColor[3].xyz * tmpvar_27.w)));
  tmpvar_3 = tmpvar_28;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * cse_22);
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_2 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec3 tmpvar_7;
  mediump vec4 normal_8;
  normal_8 = tmpvar_6;
  highp float vC_9;
  mediump vec3 x3_10;
  mediump vec3 x2_11;
  mediump vec3 x1_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAr, normal_8);
  x1_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAg, normal_8);
  x1_12.y = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAb, normal_8);
  x1_12.z = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBr, tmpvar_16);
  x2_11.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBg, tmpvar_16);
  x2_11.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBb, tmpvar_16);
  x2_11.z = tmpvar_19;
  mediump float tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_SHC.xyz * vC_9);
  x3_10 = tmpvar_21;
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = tmpvar_7;
  tmpvar_3 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out lowp vec3 xlv_TEXCOORD1;
out lowp vec3 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_2 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec3 tmpvar_7;
  mediump vec4 normal_8;
  normal_8 = tmpvar_6;
  highp float vC_9;
  mediump vec3 x3_10;
  mediump vec3 x2_11;
  mediump vec3 x1_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAr, normal_8);
  x1_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAg, normal_8);
  x1_12.y = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAb, normal_8);
  x1_12.z = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBr, tmpvar_16);
  x2_11.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBg, tmpvar_16);
  x2_11.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBb, tmpvar_16);
  x2_11.z = tmpvar_19;
  mediump float tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_SHC.xyz * vC_9);
  x3_10 = tmpvar_21;
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = tmpvar_7;
  tmpvar_3 = shlight_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
ConstBuffer "$Globals" 528
Matrix 112 [unity_World2Shadow0]
Matrix 176 [unity_World2Shadow1]
Matrix 240 [unity_World2Shadow2]
Matrix 304 [unity_World2Shadow3]
Matrix 368 [glstate_matrix_mvp]
Matrix 432 [_Object2World]
Vector 0 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 32 [unity_SHAb]
Vector 48 [unity_SHBr]
Vector 64 [unity_SHBg]
Vector 80 [unity_SHBb]
Vector 96 [unity_SHC]
Vector 496 [unity_Scale]
Vector 512 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half3 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
};
struct xlatMtlShaderUniform {
  float4 unity_SHAr;
  float4 unity_SHAg;
  float4 unity_SHAb;
  float4 unity_SHBr;
  float4 unity_SHBg;
  float4 unity_SHBb;
  float4 unity_SHC;
  float4x4 unity_World2Shadow[4];
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float3 shlight_1;
  half3 tmpvar_2;
  half3 tmpvar_3;
  float3x3 tmpvar_4;
  tmpvar_4[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_4[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_4[2] = _mtl_u._Object2World[2].xyz;
  float3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  tmpvar_2 = half3(tmpvar_5);
  float4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  half3 tmpvar_7;
  half4 normal_8;
  normal_8 = half4(tmpvar_6);
  float vC_9;
  half3 x3_10;
  half3 x2_11;
  half3 x1_12;
  float tmpvar_13;
  tmpvar_13 = dot (_mtl_u.unity_SHAr, (float4)normal_8);
  x1_12.x = half(tmpvar_13);
  float tmpvar_14;
  tmpvar_14 = dot (_mtl_u.unity_SHAg, (float4)normal_8);
  x1_12.y = half(tmpvar_14);
  float tmpvar_15;
  tmpvar_15 = dot (_mtl_u.unity_SHAb, (float4)normal_8);
  x1_12.z = half(tmpvar_15);
  half4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  float tmpvar_17;
  tmpvar_17 = dot (_mtl_u.unity_SHBr, (float4)tmpvar_16);
  x2_11.x = half(tmpvar_17);
  float tmpvar_18;
  tmpvar_18 = dot (_mtl_u.unity_SHBg, (float4)tmpvar_16);
  x2_11.y = half(tmpvar_18);
  float tmpvar_19;
  tmpvar_19 = dot (_mtl_u.unity_SHBb, (float4)tmpvar_16);
  x2_11.z = half(tmpvar_19);
  half tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = float(tmpvar_20);
  float3 tmpvar_21;
  tmpvar_21 = (_mtl_u.unity_SHC.xyz * vC_9);
  x3_10 = half3(tmpvar_21);
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = float3(tmpvar_7);
  tmpvar_3 = half3(shlight_1);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = tmpvar_2;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_3;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_World2Shadow[0] * (_mtl_u._Object2World * _mtl_i._glesVertex));
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out highp vec2 xlv_TEXCOORD1;
out highp vec4 xlv_TEXCOORD2;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
Bind "texcoord1" ATTR2
ConstBuffer "$Globals" 416
Matrix 0 [unity_World2Shadow0]
Matrix 64 [unity_World2Shadow1]
Matrix 128 [unity_World2Shadow2]
Matrix 192 [unity_World2Shadow3]
Matrix 256 [glstate_matrix_mvp]
Matrix 320 [_Object2World]
Vector 384 [unity_LightmapST]
Vector 400 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesMultiTexCoord0 [[attribute(1)]];
  float4 _glesMultiTexCoord1 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float4 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4x4 unity_World2Shadow[4];
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_LightmapST;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = ((_mtl_i._glesMultiTexCoord1.xy * _mtl_u.unity_LightmapST.xy) + _mtl_u.unity_LightmapST.zw);
  _mtl_o.xlv_TEXCOORD2 = (_mtl_u.unity_World2Shadow[0] * (_mtl_u._Object2World * _mtl_i._glesVertex));
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out highp vec2 xlv_TEXCOORD1;
out highp vec4 xlv_TEXCOORD2;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
Bind "texcoord1" ATTR2
ConstBuffer "$Globals" 416
Matrix 0 [unity_World2Shadow0]
Matrix 64 [unity_World2Shadow1]
Matrix 128 [unity_World2Shadow2]
Matrix 192 [unity_World2Shadow3]
Matrix 256 [glstate_matrix_mvp]
Matrix 320 [_Object2World]
Vector 384 [unity_LightmapST]
Vector 400 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesMultiTexCoord0 [[attribute(1)]];
  float4 _glesMultiTexCoord1 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float4 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4x4 unity_World2Shadow[4];
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_LightmapST;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = ((_mtl_i._glesMultiTexCoord1.xy * _mtl_u.unity_LightmapST.xy) + _mtl_u.unity_LightmapST.zw);
  _mtl_o.xlv_TEXCOORD2 = (_mtl_u.unity_World2Shadow[0] * (_mtl_u._Object2World * _mtl_i._glesVertex));
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_2 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec3 tmpvar_7;
  mediump vec4 normal_8;
  normal_8 = tmpvar_6;
  highp float vC_9;
  mediump vec3 x3_10;
  mediump vec3 x2_11;
  mediump vec3 x1_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAr, normal_8);
  x1_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAg, normal_8);
  x1_12.y = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAb, normal_8);
  x1_12.z = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBr, tmpvar_16);
  x2_11.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBg, tmpvar_16);
  x2_11.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBb, tmpvar_16);
  x2_11.z = tmpvar_19;
  mediump float tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_SHC.xyz * vC_9);
  x3_10 = tmpvar_21;
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = tmpvar_7;
  tmpvar_3 = shlight_1;
  highp vec4 cse_22;
  cse_22 = (_Object2World * _glesVertex);
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - cse_22.x);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - cse_22.y);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - cse_22.z);
  highp vec4 tmpvar_26;
  tmpvar_26 = (((tmpvar_23 * tmpvar_23) + (tmpvar_24 * tmpvar_24)) + (tmpvar_25 * tmpvar_25));
  highp vec4 tmpvar_27;
  tmpvar_27 = (max (vec4(0.0, 0.0, 0.0, 0.0), (
    (((tmpvar_23 * tmpvar_5.x) + (tmpvar_24 * tmpvar_5.y)) + (tmpvar_25 * tmpvar_5.z))
   * 
    inversesqrt(tmpvar_26)
  )) * (1.0/((1.0 + 
    (tmpvar_26 * unity_4LightAtten0)
  ))));
  highp vec3 tmpvar_28;
  tmpvar_28 = (tmpvar_3 + ((
    ((unity_LightColor[0].xyz * tmpvar_27.x) + (unity_LightColor[1].xyz * tmpvar_27.y))
   + 
    (unity_LightColor[2].xyz * tmpvar_27.z)
  ) + (unity_LightColor[3].xyz * tmpvar_27.w)));
  tmpvar_3 = tmpvar_28;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * cse_22);
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out lowp vec3 xlv_TEXCOORD1;
out lowp vec3 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = _Object2World[0].xyz;
  tmpvar_4[1] = _Object2World[1].xyz;
  tmpvar_4[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_2 = tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  mediump vec3 tmpvar_7;
  mediump vec4 normal_8;
  normal_8 = tmpvar_6;
  highp float vC_9;
  mediump vec3 x3_10;
  mediump vec3 x2_11;
  mediump vec3 x1_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAr, normal_8);
  x1_12.x = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAg, normal_8);
  x1_12.y = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAb, normal_8);
  x1_12.z = tmpvar_15;
  mediump vec4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBr, tmpvar_16);
  x2_11.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBg, tmpvar_16);
  x2_11.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBb, tmpvar_16);
  x2_11.z = tmpvar_19;
  mediump float tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_SHC.xyz * vC_9);
  x3_10 = tmpvar_21;
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = tmpvar_7;
  tmpvar_3 = shlight_1;
  highp vec4 cse_22;
  cse_22 = (_Object2World * _glesVertex);
  highp vec4 tmpvar_23;
  tmpvar_23 = (unity_4LightPosX0 - cse_22.x);
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosY0 - cse_22.y);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosZ0 - cse_22.z);
  highp vec4 tmpvar_26;
  tmpvar_26 = (((tmpvar_23 * tmpvar_23) + (tmpvar_24 * tmpvar_24)) + (tmpvar_25 * tmpvar_25));
  highp vec4 tmpvar_27;
  tmpvar_27 = (max (vec4(0.0, 0.0, 0.0, 0.0), (
    (((tmpvar_23 * tmpvar_5.x) + (tmpvar_24 * tmpvar_5.y)) + (tmpvar_25 * tmpvar_5.z))
   * 
    inversesqrt(tmpvar_26)
  )) * (1.0/((1.0 + 
    (tmpvar_26 * unity_4LightAtten0)
  ))));
  highp vec3 tmpvar_28;
  tmpvar_28 = (tmpvar_3 + ((
    ((unity_LightColor[0].xyz * tmpvar_27.x) + (unity_LightColor[1].xyz * tmpvar_27.y))
   + 
    (unity_LightColor[2].xyz * tmpvar_27.z)
  ) + (unity_LightColor[3].xyz * tmpvar_27.w)));
  tmpvar_3 = tmpvar_28;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * cse_22);
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  mediump vec4 c_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * _Color);
  c_3 = tmpvar_5;
  highp vec4 Current_6;
  Current_6 = c_3;
  highp vec3 tmpvar_7;
  tmpvar_7 = mix (Current_6, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_2 = tmpvar_7;
  c_1.w = 0.0;
  c_1.xyz = tmpvar_2;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
ConstBuffer "$Globals" 720
Matrix 304 [unity_World2Shadow0]
Matrix 368 [unity_World2Shadow1]
Matrix 432 [unity_World2Shadow2]
Matrix 496 [unity_World2Shadow3]
Matrix 560 [glstate_matrix_mvp]
Matrix 624 [_Object2World]
Vector 0 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 32 [unity_4LightPosZ0]
Vector 48 [unity_4LightAtten0]
Vector 64 [unity_LightColor0]
Vector 80 [unity_LightColor1]
Vector 96 [unity_LightColor2]
Vector 112 [unity_LightColor3]
Vector 128 [unity_LightColor4]
Vector 144 [unity_LightColor5]
Vector 160 [unity_LightColor6]
Vector 176 [unity_LightColor7]
Vector 192 [unity_SHAr]
Vector 208 [unity_SHAg]
Vector 224 [unity_SHAb]
Vector 240 [unity_SHBr]
Vector 256 [unity_SHBg]
Vector 272 [unity_SHBb]
Vector 288 [unity_SHC]
Vector 688 [unity_Scale]
Vector 704 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  half3 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
};
struct xlatMtlShaderUniform {
  float4 unity_4LightPosX0;
  float4 unity_4LightPosY0;
  float4 unity_4LightPosZ0;
  float4 unity_4LightAtten0;
  float4 unity_LightColor[8];
  float4 unity_SHAr;
  float4 unity_SHAg;
  float4 unity_SHAb;
  float4 unity_SHBr;
  float4 unity_SHBg;
  float4 unity_SHBb;
  float4 unity_SHC;
  float4x4 unity_World2Shadow[4];
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float3 shlight_1;
  half3 tmpvar_2;
  half3 tmpvar_3;
  float3x3 tmpvar_4;
  tmpvar_4[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_4[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_4[2] = _mtl_u._Object2World[2].xyz;
  float3 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  tmpvar_2 = half3(tmpvar_5);
  float4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  half3 tmpvar_7;
  half4 normal_8;
  normal_8 = half4(tmpvar_6);
  float vC_9;
  half3 x3_10;
  half3 x2_11;
  half3 x1_12;
  float tmpvar_13;
  tmpvar_13 = dot (_mtl_u.unity_SHAr, (float4)normal_8);
  x1_12.x = half(tmpvar_13);
  float tmpvar_14;
  tmpvar_14 = dot (_mtl_u.unity_SHAg, (float4)normal_8);
  x1_12.y = half(tmpvar_14);
  float tmpvar_15;
  tmpvar_15 = dot (_mtl_u.unity_SHAb, (float4)normal_8);
  x1_12.z = half(tmpvar_15);
  half4 tmpvar_16;
  tmpvar_16 = (normal_8.xyzz * normal_8.yzzx);
  float tmpvar_17;
  tmpvar_17 = dot (_mtl_u.unity_SHBr, (float4)tmpvar_16);
  x2_11.x = half(tmpvar_17);
  float tmpvar_18;
  tmpvar_18 = dot (_mtl_u.unity_SHBg, (float4)tmpvar_16);
  x2_11.y = half(tmpvar_18);
  float tmpvar_19;
  tmpvar_19 = dot (_mtl_u.unity_SHBb, (float4)tmpvar_16);
  x2_11.z = half(tmpvar_19);
  half tmpvar_20;
  tmpvar_20 = ((normal_8.x * normal_8.x) - (normal_8.y * normal_8.y));
  vC_9 = float(tmpvar_20);
  float3 tmpvar_21;
  tmpvar_21 = (_mtl_u.unity_SHC.xyz * vC_9);
  x3_10 = half3(tmpvar_21);
  tmpvar_7 = ((x1_12 + x2_11) + x3_10);
  shlight_1 = float3(tmpvar_7);
  tmpvar_3 = half3(shlight_1);
  float4 cse_22;
  cse_22 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  float4 tmpvar_23;
  tmpvar_23 = (_mtl_u.unity_4LightPosX0 - cse_22.x);
  float4 tmpvar_24;
  tmpvar_24 = (_mtl_u.unity_4LightPosY0 - cse_22.y);
  float4 tmpvar_25;
  tmpvar_25 = (_mtl_u.unity_4LightPosZ0 - cse_22.z);
  float4 tmpvar_26;
  tmpvar_26 = (((tmpvar_23 * tmpvar_23) + (tmpvar_24 * tmpvar_24)) + (tmpvar_25 * tmpvar_25));
  float4 tmpvar_27;
  tmpvar_27 = (max (float4(0.0, 0.0, 0.0, 0.0), (
    (((tmpvar_23 * tmpvar_5.x) + (tmpvar_24 * tmpvar_5.y)) + (tmpvar_25 * tmpvar_5.z))
   * 
    rsqrt(tmpvar_26)
  )) * (1.0/((1.0 + 
    (tmpvar_26 * _mtl_u.unity_4LightAtten0)
  ))));
  float3 tmpvar_28;
  tmpvar_28 = ((float3)tmpvar_3 + ((
    ((_mtl_u.unity_LightColor[0].xyz * tmpvar_27.x) + (_mtl_u.unity_LightColor[1].xyz * tmpvar_27.y))
   + 
    (_mtl_u.unity_LightColor[2].xyz * tmpvar_27.z)
  ) + (_mtl_u.unity_LightColor[3].xyz * tmpvar_27.w)));
  tmpvar_3 = half3(tmpvar_28);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = tmpvar_2;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_3;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_World2Shadow[0] * cse_22);
  return _mtl_o;
}

"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 48
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  half3 tmpvar_2;
  half4 c_3;
  half4 tmpvar_4;
  tmpvar_4 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_5;
  tmpvar_5 = ((float4)tmpvar_4 * _mtl_u._Color);
  c_3 = half4(tmpvar_5);
  float4 Current_6;
  Current_6 = float4(c_3);
  float3 tmpvar_7;
  tmpvar_7 = mix (Current_6, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_2 = half3(tmpvar_7);
  c_1.w = half(0.0);
  c_1.xyz = tmpvar_2;
  _mtl_o._glesFragData_0 = c_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 48
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  half3 tmpvar_2;
  half4 c_3;
  half4 tmpvar_4;
  tmpvar_4 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_5;
  tmpvar_5 = ((float4)tmpvar_4 * _mtl_u._Color);
  c_3 = half4(tmpvar_5);
  float4 Current_6;
  Current_6 = float4(c_3);
  float3 tmpvar_7;
  tmpvar_7 = mix (Current_6, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_2 = half3(tmpvar_7);
  c_1.w = half(0.0);
  c_1.xyz = tmpvar_2;
  _mtl_o._glesFragData_0 = c_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 48
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  half3 tmpvar_2;
  half4 c_3;
  half4 tmpvar_4;
  tmpvar_4 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_5;
  tmpvar_5 = ((float4)tmpvar_4 * _mtl_u._Color);
  c_3 = half4(tmpvar_5);
  float4 Current_6;
  Current_6 = float4(c_3);
  float3 tmpvar_7;
  tmpvar_7 = mix (Current_6, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_2 = half3(tmpvar_7);
  c_1.w = half(0.0);
  c_1.xyz = tmpvar_2;
  _mtl_o._glesFragData_0 = c_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 48
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  half3 tmpvar_2;
  half4 c_3;
  half4 tmpvar_4;
  tmpvar_4 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_5;
  tmpvar_5 = ((float4)tmpvar_4 * _mtl_u._Color);
  c_3 = half4(tmpvar_5);
  float4 Current_6;
  Current_6 = float4(c_3);
  float3 tmpvar_7;
  tmpvar_7 = mix (Current_6, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_2 = half3(tmpvar_7);
  c_1.w = half(0.0);
  c_1.xyz = tmpvar_2;
  _mtl_o._glesFragData_0 = c_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 48
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  half3 tmpvar_2;
  half4 c_3;
  half4 tmpvar_4;
  tmpvar_4 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_5;
  tmpvar_5 = ((float4)tmpvar_4 * _mtl_u._Color);
  c_3 = half4(tmpvar_5);
  float4 Current_6;
  Current_6 = float4(c_3);
  float3 tmpvar_7;
  tmpvar_7 = mix (Current_6, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_2 = half3(tmpvar_7);
  c_1.w = half(0.0);
  c_1.xyz = tmpvar_2;
  _mtl_o._glesFragData_0 = c_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 48
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  half3 tmpvar_2;
  half4 c_3;
  half4 tmpvar_4;
  tmpvar_4 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_5;
  tmpvar_5 = ((float4)tmpvar_4 * _mtl_u._Color);
  c_3 = half4(tmpvar_5);
  float4 Current_6;
  Current_6 = float4(c_3);
  float3 tmpvar_7;
  tmpvar_7 = mix (Current_6, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_2 = half3(tmpvar_7);
  c_1.w = half(0.0);
  c_1.xyz = tmpvar_2;
  _mtl_o._glesFragData_0 = c_1;
  return _mtl_o;
}

"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "RenderType"="Opaque" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "gles " {
Keywords { "POINT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
varying lowp vec3 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = _Object2World[0].xyz;
  tmpvar_3[1] = _Object2World[1].xyz;
  tmpvar_3[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_4;
  highp vec3 tmpvar_5;
  highp vec4 cse_6;
  cse_6 = (_Object2World * _glesVertex);
  tmpvar_5 = (_WorldSpaceLightPos0.xyz - cse_6.xyz);
  tmpvar_2 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (_LightMatrix0 * cse_6).xyz;
}



#endif
#ifdef FRAGMENT

void main ()
{
  lowp vec4 c_1;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
out lowp vec3 xlv_TEXCOORD0;
out mediump vec3 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = _Object2World[0].xyz;
  tmpvar_3[1] = _Object2World[1].xyz;
  tmpvar_3[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_4;
  highp vec3 tmpvar_5;
  highp vec4 cse_6;
  cse_6 = (_Object2World * _glesVertex);
  tmpvar_5 = (_WorldSpaceLightPos0.xyz - cse_6.xyz);
  tmpvar_2 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (_LightMatrix0 * cse_6).xyz;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
void main ()
{
  lowp vec4 c_1;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "POINT" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
ConstBuffer "$Globals" 224
Matrix 16 [glstate_matrix_mvp]
Matrix 80 [_Object2World]
Matrix 160 [_LightMatrix0]
Vector 0 [_WorldSpaceLightPos0]
Vector 144 [unity_Scale]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  half3 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  float3 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  half3 tmpvar_2;
  float3x3 tmpvar_3;
  tmpvar_3[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_3[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_3[2] = _mtl_u._Object2World[2].xyz;
  float3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  tmpvar_1 = half3(tmpvar_4);
  float3 tmpvar_5;
  float4 cse_6;
  cse_6 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_5 = (_mtl_u._WorldSpaceLightPos0.xyz - cse_6.xyz);
  tmpvar_2 = half3(tmpvar_5);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = tmpvar_1;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_2;
  _mtl_o.xlv_TEXCOORD2 = (_mtl_u._LightMatrix0 * cse_6).xyz;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
varying lowp vec3 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = _Object2World[0].xyz;
  tmpvar_3[1] = _Object2World[1].xyz;
  tmpvar_3[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  tmpvar_2 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
}



#endif
#ifdef FRAGMENT

void main ()
{
  lowp vec4 c_1;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
out lowp vec3 xlv_TEXCOORD0;
out mediump vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = _Object2World[0].xyz;
  tmpvar_3[1] = _Object2World[1].xyz;
  tmpvar_3[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  tmpvar_2 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
void main ()
{
  lowp vec4 c_1;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
ConstBuffer "$Globals" 160
Matrix 16 [glstate_matrix_mvp]
Matrix 80 [_Object2World]
VectorHalf 0 [_WorldSpaceLightPos0] 4
Vector 144 [unity_Scale]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  half3 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
};
struct xlatMtlShaderUniform {
  half4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  half3 tmpvar_2;
  float3x3 tmpvar_3;
  tmpvar_3[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_3[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_3[2] = _mtl_u._Object2World[2].xyz;
  float3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  tmpvar_1 = half3(tmpvar_4);
  float3 tmpvar_5;
  tmpvar_5 = float3(_mtl_u._WorldSpaceLightPos0.xyz);
  tmpvar_2 = half3(tmpvar_5);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = tmpvar_1;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_2;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
varying lowp vec3 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = _Object2World[0].xyz;
  tmpvar_3[1] = _Object2World[1].xyz;
  tmpvar_3[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_4;
  highp vec3 tmpvar_5;
  highp vec4 cse_6;
  cse_6 = (_Object2World * _glesVertex);
  tmpvar_5 = (_WorldSpaceLightPos0.xyz - cse_6.xyz);
  tmpvar_2 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (_LightMatrix0 * cse_6);
}



#endif
#ifdef FRAGMENT

void main ()
{
  lowp vec4 c_1;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SPOT" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
out lowp vec3 xlv_TEXCOORD0;
out mediump vec3 xlv_TEXCOORD1;
out highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = _Object2World[0].xyz;
  tmpvar_3[1] = _Object2World[1].xyz;
  tmpvar_3[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_4;
  highp vec3 tmpvar_5;
  highp vec4 cse_6;
  cse_6 = (_Object2World * _glesVertex);
  tmpvar_5 = (_WorldSpaceLightPos0.xyz - cse_6.xyz);
  tmpvar_2 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (_LightMatrix0 * cse_6);
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
void main ()
{
  lowp vec4 c_1;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "SPOT" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
ConstBuffer "$Globals" 224
Matrix 16 [glstate_matrix_mvp]
Matrix 80 [_Object2World]
Matrix 160 [_LightMatrix0]
Vector 0 [_WorldSpaceLightPos0]
Vector 144 [unity_Scale]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  half3 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  float4 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  half3 tmpvar_2;
  float3x3 tmpvar_3;
  tmpvar_3[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_3[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_3[2] = _mtl_u._Object2World[2].xyz;
  float3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  tmpvar_1 = half3(tmpvar_4);
  float3 tmpvar_5;
  float4 cse_6;
  cse_6 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_5 = (_mtl_u._WorldSpaceLightPos0.xyz - cse_6.xyz);
  tmpvar_2 = half3(tmpvar_5);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = tmpvar_1;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_2;
  _mtl_o.xlv_TEXCOORD2 = (_mtl_u._LightMatrix0 * cse_6);
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
varying lowp vec3 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = _Object2World[0].xyz;
  tmpvar_3[1] = _Object2World[1].xyz;
  tmpvar_3[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_4;
  highp vec3 tmpvar_5;
  highp vec4 cse_6;
  cse_6 = (_Object2World * _glesVertex);
  tmpvar_5 = (_WorldSpaceLightPos0.xyz - cse_6.xyz);
  tmpvar_2 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (_LightMatrix0 * cse_6).xyz;
}



#endif
#ifdef FRAGMENT

void main ()
{
  lowp vec4 c_1;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
out lowp vec3 xlv_TEXCOORD0;
out mediump vec3 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = _Object2World[0].xyz;
  tmpvar_3[1] = _Object2World[1].xyz;
  tmpvar_3[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_4;
  highp vec3 tmpvar_5;
  highp vec4 cse_6;
  cse_6 = (_Object2World * _glesVertex);
  tmpvar_5 = (_WorldSpaceLightPos0.xyz - cse_6.xyz);
  tmpvar_2 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (_LightMatrix0 * cse_6).xyz;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
void main ()
{
  lowp vec4 c_1;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "POINT_COOKIE" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
ConstBuffer "$Globals" 224
Matrix 16 [glstate_matrix_mvp]
Matrix 80 [_Object2World]
Matrix 160 [_LightMatrix0]
Vector 0 [_WorldSpaceLightPos0]
Vector 144 [unity_Scale]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  half3 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  float3 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  half3 tmpvar_2;
  float3x3 tmpvar_3;
  tmpvar_3[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_3[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_3[2] = _mtl_u._Object2World[2].xyz;
  float3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  tmpvar_1 = half3(tmpvar_4);
  float3 tmpvar_5;
  float4 cse_6;
  cse_6 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  tmpvar_5 = (_mtl_u._WorldSpaceLightPos0.xyz - cse_6.xyz);
  tmpvar_2 = half3(tmpvar_5);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = tmpvar_1;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_2;
  _mtl_o.xlv_TEXCOORD2 = (_mtl_u._LightMatrix0 * cse_6).xyz;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
varying lowp vec3 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = _Object2World[0].xyz;
  tmpvar_3[1] = _Object2World[1].xyz;
  tmpvar_3[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  tmpvar_2 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

void main ()
{
  lowp vec4 c_1;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
out lowp vec3 xlv_TEXCOORD0;
out mediump vec3 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = _Object2World[0].xyz;
  tmpvar_3[1] = _Object2World[1].xyz;
  tmpvar_3[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  tmpvar_2 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_TEXCOORD2 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
void main ()
{
  lowp vec4 c_1;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
ConstBuffer "$Globals" 224
Matrix 16 [glstate_matrix_mvp]
Matrix 80 [_Object2World]
Matrix 160 [_LightMatrix0]
VectorHalf 0 [_WorldSpaceLightPos0] 4
Vector 144 [unity_Scale]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  half3 xlv_TEXCOORD0;
  half3 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  half4 _WorldSpaceLightPos0;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
  float4x4 _LightMatrix0;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  half3 tmpvar_2;
  float3x3 tmpvar_3;
  tmpvar_3[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_3[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_3[2] = _mtl_u._Object2World[2].xyz;
  float3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  tmpvar_1 = half3(tmpvar_4);
  float3 tmpvar_5;
  tmpvar_5 = float3(_mtl_u._WorldSpaceLightPos0.xyz);
  tmpvar_2 = half3(tmpvar_5);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = tmpvar_1;
  _mtl_o.xlv_TEXCOORD1 = tmpvar_2;
  _mtl_o.xlv_TEXCOORD2 = (_mtl_u._LightMatrix0 * (_mtl_u._Object2World * _mtl_i._glesVertex)).xy;
  return _mtl_o;
}

"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "POINT" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "POINT" }
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  c_1.xyz = half3(float3(0.0, 0.0, 0.0));
  c_1.w = half(0.0);
  _mtl_o._glesFragData_0 = c_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL" }
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  c_1.xyz = half3(float3(0.0, 0.0, 0.0));
  c_1.w = half(0.0);
  _mtl_o._glesFragData_0 = c_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SPOT" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "SPOT" }
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  c_1.xyz = half3(float3(0.0, 0.0, 0.0));
  c_1.w = half(0.0);
  _mtl_o._glesFragData_0 = c_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "POINT_COOKIE" }
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  c_1.xyz = half3(float3(0.0, 0.0, 0.0));
  c_1.w = half(0.0);
  _mtl_o._glesFragData_0 = c_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "DIRECTIONAL_COOKIE" }
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 c_1;
  c_1.xyz = half3(float3(0.0, 0.0, 0.0));
  c_1.w = half(0.0);
  _mtl_o._glesFragData_0 = c_1;
  return _mtl_o;
}

"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "RenderType"="Opaque" }
  Fog { Mode Off }
Program "vp" {
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
varying lowp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec3 tmpvar_1;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = _Object2World[0].xyz;
  tmpvar_2[1] = _Object2World[1].xyz;
  tmpvar_2[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 res_1;
  res_1.xyz = ((xlv_TEXCOORD0 * 0.5) + 0.5);
  res_1.w = 0.0;
  gl_FragData[0] = res_1;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
out lowp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec3 tmpvar_1;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = _Object2World[0].xyz;
  tmpvar_2[1] = _Object2World[1].xyz;
  tmpvar_2[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * (normalize(_glesNormal) * unity_Scale.w));
  tmpvar_1 = tmpvar_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
in lowp vec3 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 res_1;
  res_1.xyz = ((xlv_TEXCOORD0 * 0.5) + 0.5);
  res_1.w = 0.0;
  _glesFragData[0] = res_1;
}



#endif"
}
SubProgram "metal " {
Bind "vertex" ATTR0
Bind "normal" ATTR1
ConstBuffer "$Globals" 144
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [_Object2World]
Vector 128 [unity_Scale]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  half3 xlv_TEXCOORD0;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half3 tmpvar_1;
  float3x3 tmpvar_2;
  tmpvar_2[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_2[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_2[2] = _mtl_u._Object2World[2].xyz;
  float3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  tmpvar_1 = half3(tmpvar_3);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = tmpvar_1;
  return _mtl_o;
}

"
}
}
Program "fp" {
SubProgram "gles " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
SubProgram "metal " {
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  half3 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 res_1;
  res_1.xyz = ((_mtl_i.xlv_TEXCOORD0 * (half)0.5) + (half)0.5);
  res_1.w = half(0.0);
  _mtl_o._glesFragData_0 = res_1;
  return _mtl_o;
}

"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "RenderType"="Opaque" }
  ZWrite Off
Program "vp" {
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_8;
  mediump vec4 normal_9;
  normal_9 = tmpvar_7;
  highp float vC_10;
  mediump vec3 x3_11;
  mediump vec3 x2_12;
  mediump vec3 x1_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAr, normal_9);
  x1_13.x = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAg, normal_9);
  x1_13.y = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAb, normal_9);
  x1_13.z = tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normal_9.xyzz * normal_9.yzzx);
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBr, tmpvar_17);
  x2_12.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBg, tmpvar_17);
  x2_12.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBb, tmpvar_17);
  x2_12.z = tmpvar_20;
  mediump float tmpvar_21;
  tmpvar_21 = ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y));
  vC_10 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (unity_SHC.xyz * vC_10);
  x3_11 = tmpvar_22;
  tmpvar_8 = ((x1_13 + x2_12) + x3_11);
  tmpvar_1 = tmpvar_8;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_3;
  xlv_TEXCOORD2 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
uniform sampler2D _LightBuffer;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * _Color);
  c_5 = tmpvar_7;
  highp vec4 Current_8;
  Current_8 = c_5;
  highp vec3 tmpvar_9;
  tmpvar_9 = mix (Current_8, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_4 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2DProj (_LightBuffer, xlv_TEXCOORD1);
  light_3 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_11.w;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11.xyz + xlv_TEXCOORD2);
  light_3.xyz = tmpvar_12;
  lowp vec4 c_13;
  c_13.xyz = vec3(0.0, 0.0, 0.0);
  c_13.w = 0.0;
  c_2 = c_13;
  c_2.xyz = (c_2.xyz + tmpvar_4);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_8;
  mediump vec4 normal_9;
  normal_9 = tmpvar_7;
  highp float vC_10;
  mediump vec3 x3_11;
  mediump vec3 x2_12;
  mediump vec3 x1_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAr, normal_9);
  x1_13.x = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAg, normal_9);
  x1_13.y = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAb, normal_9);
  x1_13.z = tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normal_9.xyzz * normal_9.yzzx);
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBr, tmpvar_17);
  x2_12.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBg, tmpvar_17);
  x2_12.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBb, tmpvar_17);
  x2_12.z = tmpvar_20;
  mediump float tmpvar_21;
  tmpvar_21 = ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y));
  vC_10 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (unity_SHC.xyz * vC_10);
  x3_11 = tmpvar_22;
  tmpvar_8 = ((x1_13 + x2_12) + x3_11);
  tmpvar_1 = tmpvar_8;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_3;
  xlv_TEXCOORD2 = tmpvar_1;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
uniform sampler2D _LightBuffer;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * _Color);
  c_5 = tmpvar_7;
  highp vec4 Current_8;
  Current_8 = c_5;
  highp vec3 tmpvar_9;
  tmpvar_9 = mix (Current_8, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_4 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = textureProj (_LightBuffer, xlv_TEXCOORD1);
  light_3 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_11.w;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11.xyz + xlv_TEXCOORD2);
  light_3.xyz = tmpvar_12;
  lowp vec4 c_13;
  c_13.xyz = vec3(0.0, 0.0, 0.0);
  c_13.w = 0.0;
  c_2 = c_13;
  c_2.xyz = (c_2.xyz + tmpvar_4);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
ConstBuffer "$Globals" 288
Matrix 128 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 0 [_ProjectionParams]
Vector 16 [unity_SHAr]
Vector 32 [unity_SHAg]
Vector 48 [unity_SHAb]
Vector 64 [unity_SHBr]
Vector 80 [unity_SHBg]
Vector 96 [unity_SHBb]
Vector 112 [unity_SHC]
Vector 256 [unity_Scale]
Vector 272 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
  float3 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4 _ProjectionParams;
  float4 unity_SHAr;
  float4 unity_SHAg;
  float4 unity_SHAb;
  float4 unity_SHBr;
  float4 unity_SHBg;
  float4 unity_SHBb;
  float4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float3 tmpvar_1;
  float4 tmpvar_2;
  tmpvar_2 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 o_3;
  float4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  float2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _mtl_u._ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  float3x3 tmpvar_6;
  tmpvar_6[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_6[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_6[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (tmpvar_6 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  half3 tmpvar_8;
  half4 normal_9;
  normal_9 = half4(tmpvar_7);
  float vC_10;
  half3 x3_11;
  half3 x2_12;
  half3 x1_13;
  float tmpvar_14;
  tmpvar_14 = dot (_mtl_u.unity_SHAr, (float4)normal_9);
  x1_13.x = half(tmpvar_14);
  float tmpvar_15;
  tmpvar_15 = dot (_mtl_u.unity_SHAg, (float4)normal_9);
  x1_13.y = half(tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = dot (_mtl_u.unity_SHAb, (float4)normal_9);
  x1_13.z = half(tmpvar_16);
  half4 tmpvar_17;
  tmpvar_17 = (normal_9.xyzz * normal_9.yzzx);
  float tmpvar_18;
  tmpvar_18 = dot (_mtl_u.unity_SHBr, (float4)tmpvar_17);
  x2_12.x = half(tmpvar_18);
  float tmpvar_19;
  tmpvar_19 = dot (_mtl_u.unity_SHBg, (float4)tmpvar_17);
  x2_12.y = half(tmpvar_19);
  float tmpvar_20;
  tmpvar_20 = dot (_mtl_u.unity_SHBb, (float4)tmpvar_17);
  x2_12.z = half(tmpvar_20);
  half tmpvar_21;
  tmpvar_21 = ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y));
  vC_10 = float(tmpvar_21);
  float3 tmpvar_22;
  tmpvar_22 = (_mtl_u.unity_SHC.xyz * vC_10);
  x3_11 = half3(tmpvar_22);
  tmpvar_8 = ((x1_13 + x2_12) + x3_11);
  tmpvar_1 = float3(tmpvar_8);
  _mtl_o.gl_Position = tmpvar_2;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = o_3;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  tmpvar_1.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_1.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  lowp vec3 tmpvar_7;
  mediump vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * _Color);
  c_8 = tmpvar_10;
  highp vec4 Current_11;
  Current_11 = c_8;
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (Current_11, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_7 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD1);
  light_6 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = -(log2(max (light_6, vec4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_14.w;
  highp float tmpvar_15;
  tmpvar_15 = ((sqrt(
    dot (xlv_TEXCOORD3, xlv_TEXCOORD3)
  ) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_15;
  lowp vec3 tmpvar_16;
  tmpvar_16 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD2).xyz);
  lmFull_4 = tmpvar_16;
  lowp vec3 tmpvar_17;
  tmpvar_17 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD2).xyz);
  lmIndirect_3 = tmpvar_17;
  light_6.xyz = (tmpvar_14.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_18;
  c_18.xyz = vec3(0.0, 0.0, 0.0);
  c_18.w = 0.0;
  c_2 = c_18;
  c_2.xyz = (c_2.xyz + tmpvar_7);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  tmpvar_1.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_1.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = tmpvar_1;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  lowp vec3 tmpvar_7;
  mediump vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * _Color);
  c_8 = tmpvar_10;
  highp vec4 Current_11;
  Current_11 = c_8;
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (Current_11, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_7 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = textureProj (_LightBuffer, xlv_TEXCOORD1);
  light_6 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = -(log2(max (light_6, vec4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_14.w;
  highp float tmpvar_15;
  tmpvar_15 = ((sqrt(
    dot (xlv_TEXCOORD3, xlv_TEXCOORD3)
  ) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_15;
  lowp vec3 tmpvar_16;
  tmpvar_16 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD2).xyz);
  lmFull_4 = tmpvar_16;
  lowp vec3 tmpvar_17;
  tmpvar_17 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD2).xyz);
  lmIndirect_3 = tmpvar_17;
  light_6.xyz = (tmpvar_14.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_18;
  c_18.xyz = vec3(0.0, 0.0, 0.0);
  c_18.w = 0.0;
  c_2 = c_18;
  c_2.xyz = (c_2.xyz + tmpvar_7);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
Bind "texcoord1" ATTR2
ConstBuffer "$Globals" 256
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [glstate_matrix_modelview0]
Matrix 160 [_Object2World]
Vector 0 [_ProjectionParams]
Vector 16 [unity_ShadowFadeCenterAndType]
Vector 224 [unity_LightmapST]
Vector 240 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesMultiTexCoord0 [[attribute(1)]];
  float4 _glesMultiTexCoord1 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
};
struct xlatMtlShaderUniform {
  float4 _ProjectionParams;
  float4 unity_ShadowFadeCenterAndType;
  float4x4 glstate_matrix_mvp;
  float4x4 glstate_matrix_modelview0;
  float4x4 _Object2World;
  float4 unity_LightmapST;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 tmpvar_1;
  float4 tmpvar_2;
  tmpvar_2 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 o_3;
  float4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  float2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _mtl_u._ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  tmpvar_1.xyz = (((_mtl_u._Object2World * _mtl_i._glesVertex).xyz - _mtl_u.unity_ShadowFadeCenterAndType.xyz) * _mtl_u.unity_ShadowFadeCenterAndType.w);
  tmpvar_1.w = (-((_mtl_u.glstate_matrix_modelview0 * _mtl_i._glesVertex).z) * (1.0 - _mtl_u.unity_ShadowFadeCenterAndType.w));
  _mtl_o.gl_Position = tmpvar_2;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = o_3;
  _mtl_o.xlv_TEXCOORD2 = ((_mtl_i._glesMultiTexCoord1.xy * _mtl_u.unity_LightmapST.xy) + _mtl_u.unity_LightmapST.zw);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_4;
  tmpvar_4.x = tmpvar_3.x;
  tmpvar_4.y = (tmpvar_3.y * _ProjectionParams.x);
  o_2.xy = (tmpvar_4 + tmpvar_3.w);
  o_2.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * _Color);
  c_4 = tmpvar_6;
  highp vec4 Current_7;
  Current_7 = c_4;
  highp vec3 tmpvar_8;
  tmpvar_8 = mix (Current_7, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_3 = tmpvar_8;
  lowp vec4 c_9;
  c_9.xyz = vec3(0.0, 0.0, 0.0);
  c_9.w = 0.0;
  c_2 = c_9;
  c_2.xyz = (c_2.xyz + tmpvar_3);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_4;
  tmpvar_4.x = tmpvar_3.x;
  tmpvar_4.y = (tmpvar_3.y * _ProjectionParams.x);
  o_2.xy = (tmpvar_4 + tmpvar_3.w);
  o_2.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * _Color);
  c_4 = tmpvar_6;
  highp vec4 Current_7;
  Current_7 = c_4;
  highp vec3 tmpvar_8;
  tmpvar_8 = mix (Current_7, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_3 = tmpvar_8;
  lowp vec4 c_9;
  c_9.xyz = vec3(0.0, 0.0, 0.0);
  c_9.w = 0.0;
  c_2 = c_9;
  c_2.xyz = (c_2.xyz + tmpvar_3);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
Bind "texcoord1" ATTR2
ConstBuffer "$Globals" 112
Matrix 16 [glstate_matrix_mvp]
Vector 0 [_ProjectionParams]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesMultiTexCoord0 [[attribute(1)]];
  float4 _glesMultiTexCoord1 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4 _ProjectionParams;
  float4x4 glstate_matrix_mvp;
  float4 unity_LightmapST;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 tmpvar_1;
  tmpvar_1 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 o_2;
  float4 tmpvar_3;
  tmpvar_3 = (tmpvar_1 * 0.5);
  float2 tmpvar_4;
  tmpvar_4.x = tmpvar_3.x;
  tmpvar_4.y = (tmpvar_3.y * _mtl_u._ProjectionParams.x);
  o_2.xy = (tmpvar_4 + tmpvar_3.w);
  o_2.zw = tmpvar_1.zw;
  _mtl_o.gl_Position = tmpvar_1;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = o_2;
  _mtl_o.xlv_TEXCOORD2 = ((_mtl_i._glesMultiTexCoord1.xy * _mtl_u.unity_LightmapST.xy) + _mtl_u.unity_LightmapST.zw);
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_8;
  mediump vec4 normal_9;
  normal_9 = tmpvar_7;
  highp float vC_10;
  mediump vec3 x3_11;
  mediump vec3 x2_12;
  mediump vec3 x1_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAr, normal_9);
  x1_13.x = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAg, normal_9);
  x1_13.y = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAb, normal_9);
  x1_13.z = tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normal_9.xyzz * normal_9.yzzx);
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBr, tmpvar_17);
  x2_12.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBg, tmpvar_17);
  x2_12.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBb, tmpvar_17);
  x2_12.z = tmpvar_20;
  mediump float tmpvar_21;
  tmpvar_21 = ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y));
  vC_10 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (unity_SHC.xyz * vC_10);
  x3_11 = tmpvar_22;
  tmpvar_8 = ((x1_13 + x2_12) + x3_11);
  tmpvar_1 = tmpvar_8;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_3;
  xlv_TEXCOORD2 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
uniform sampler2D _LightBuffer;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * _Color);
  c_5 = tmpvar_7;
  highp vec4 Current_8;
  Current_8 = c_5;
  highp vec3 tmpvar_9;
  tmpvar_9 = mix (Current_8, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_4 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2DProj (_LightBuffer, xlv_TEXCOORD1);
  light_3 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_11.w;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11.xyz + xlv_TEXCOORD2);
  light_3.xyz = tmpvar_12;
  lowp vec4 c_13;
  c_13.xyz = vec3(0.0, 0.0, 0.0);
  c_13.w = 0.0;
  c_2 = c_13;
  c_2.xyz = (c_2.xyz + tmpvar_4);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (tmpvar_6 * (normalize(_glesNormal) * unity_Scale.w));
  mediump vec3 tmpvar_8;
  mediump vec4 normal_9;
  normal_9 = tmpvar_7;
  highp float vC_10;
  mediump vec3 x3_11;
  mediump vec3 x2_12;
  mediump vec3 x1_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAr, normal_9);
  x1_13.x = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAg, normal_9);
  x1_13.y = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAb, normal_9);
  x1_13.z = tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normal_9.xyzz * normal_9.yzzx);
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBr, tmpvar_17);
  x2_12.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBg, tmpvar_17);
  x2_12.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBb, tmpvar_17);
  x2_12.z = tmpvar_20;
  mediump float tmpvar_21;
  tmpvar_21 = ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y));
  vC_10 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (unity_SHC.xyz * vC_10);
  x3_11 = tmpvar_22;
  tmpvar_8 = ((x1_13 + x2_12) + x3_11);
  tmpvar_1 = tmpvar_8;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_3;
  xlv_TEXCOORD2 = tmpvar_1;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
uniform sampler2D _LightBuffer;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  lowp vec3 tmpvar_4;
  mediump vec4 c_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * _Color);
  c_5 = tmpvar_7;
  highp vec4 Current_8;
  Current_8 = c_5;
  highp vec3 tmpvar_9;
  tmpvar_9 = mix (Current_8, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_4 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = textureProj (_LightBuffer, xlv_TEXCOORD1);
  light_3 = tmpvar_10;
  mediump vec4 tmpvar_11;
  tmpvar_11 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_11.w;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11.xyz + xlv_TEXCOORD2);
  light_3.xyz = tmpvar_12;
  lowp vec4 c_13;
  c_13.xyz = vec3(0.0, 0.0, 0.0);
  c_13.w = 0.0;
  c_2 = c_13;
  c_2.xyz = (c_2.xyz + tmpvar_4);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord" ATTR2
ConstBuffer "$Globals" 288
Matrix 128 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 0 [_ProjectionParams]
Vector 16 [unity_SHAr]
Vector 32 [unity_SHAg]
Vector 48 [unity_SHAb]
Vector 64 [unity_SHBr]
Vector 80 [unity_SHBg]
Vector 96 [unity_SHBb]
Vector 112 [unity_SHC]
Vector 256 [unity_Scale]
Vector 272 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
  float3 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4 _ProjectionParams;
  float4 unity_SHAr;
  float4 unity_SHAg;
  float4 unity_SHAb;
  float4 unity_SHBr;
  float4 unity_SHBg;
  float4 unity_SHBb;
  float4 unity_SHC;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  float4 unity_Scale;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float3 tmpvar_1;
  float4 tmpvar_2;
  tmpvar_2 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 o_3;
  float4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  float2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _mtl_u._ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  float3x3 tmpvar_6;
  tmpvar_6[0] = _mtl_u._Object2World[0].xyz;
  tmpvar_6[1] = _mtl_u._Object2World[1].xyz;
  tmpvar_6[2] = _mtl_u._Object2World[2].xyz;
  float4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (tmpvar_6 * (normalize(_mtl_i._glesNormal) * _mtl_u.unity_Scale.w));
  half3 tmpvar_8;
  half4 normal_9;
  normal_9 = half4(tmpvar_7);
  float vC_10;
  half3 x3_11;
  half3 x2_12;
  half3 x1_13;
  float tmpvar_14;
  tmpvar_14 = dot (_mtl_u.unity_SHAr, (float4)normal_9);
  x1_13.x = half(tmpvar_14);
  float tmpvar_15;
  tmpvar_15 = dot (_mtl_u.unity_SHAg, (float4)normal_9);
  x1_13.y = half(tmpvar_15);
  float tmpvar_16;
  tmpvar_16 = dot (_mtl_u.unity_SHAb, (float4)normal_9);
  x1_13.z = half(tmpvar_16);
  half4 tmpvar_17;
  tmpvar_17 = (normal_9.xyzz * normal_9.yzzx);
  float tmpvar_18;
  tmpvar_18 = dot (_mtl_u.unity_SHBr, (float4)tmpvar_17);
  x2_12.x = half(tmpvar_18);
  float tmpvar_19;
  tmpvar_19 = dot (_mtl_u.unity_SHBg, (float4)tmpvar_17);
  x2_12.y = half(tmpvar_19);
  float tmpvar_20;
  tmpvar_20 = dot (_mtl_u.unity_SHBb, (float4)tmpvar_17);
  x2_12.z = half(tmpvar_20);
  half tmpvar_21;
  tmpvar_21 = ((normal_9.x * normal_9.x) - (normal_9.y * normal_9.y));
  vC_10 = float(tmpvar_21);
  float3 tmpvar_22;
  tmpvar_22 = (_mtl_u.unity_SHC.xyz * vC_10);
  x3_11 = half3(tmpvar_22);
  tmpvar_8 = ((x1_13 + x2_12) + x3_11);
  tmpvar_1 = float3(tmpvar_8);
  _mtl_o.gl_Position = tmpvar_2;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = o_3;
  _mtl_o.xlv_TEXCOORD2 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  tmpvar_1.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_1.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  lowp vec3 tmpvar_7;
  mediump vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * _Color);
  c_8 = tmpvar_10;
  highp vec4 Current_11;
  Current_11 = c_8;
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (Current_11, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_7 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2DProj (_LightBuffer, xlv_TEXCOORD1);
  light_6 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = max (light_6, vec4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_14.w;
  highp float tmpvar_15;
  tmpvar_15 = ((sqrt(
    dot (xlv_TEXCOORD3, xlv_TEXCOORD3)
  ) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_15;
  lowp vec3 tmpvar_16;
  tmpvar_16 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD2).xyz);
  lmFull_4 = tmpvar_16;
  lowp vec3 tmpvar_17;
  tmpvar_17 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD2).xyz);
  lmIndirect_3 = tmpvar_17;
  light_6.xyz = (tmpvar_14.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_18;
  c_18.xyz = vec3(0.0, 0.0, 0.0);
  c_18.w = 0.0;
  c_2 = c_18;
  c_2.xyz = (c_2.xyz + tmpvar_7);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  tmpvar_1.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_1.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_3;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = tmpvar_1;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  lowp vec3 tmpvar_7;
  mediump vec4 c_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * _Color);
  c_8 = tmpvar_10;
  highp vec4 Current_11;
  Current_11 = c_8;
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (Current_11, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_7 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = textureProj (_LightBuffer, xlv_TEXCOORD1);
  light_6 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14 = max (light_6, vec4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_14.w;
  highp float tmpvar_15;
  tmpvar_15 = ((sqrt(
    dot (xlv_TEXCOORD3, xlv_TEXCOORD3)
  ) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_15;
  lowp vec3 tmpvar_16;
  tmpvar_16 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD2).xyz);
  lmFull_4 = tmpvar_16;
  lowp vec3 tmpvar_17;
  tmpvar_17 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD2).xyz);
  lmIndirect_3 = tmpvar_17;
  light_6.xyz = (tmpvar_14.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_18;
  c_18.xyz = vec3(0.0, 0.0, 0.0);
  c_18.w = 0.0;
  c_2 = c_18;
  c_2.xyz = (c_2.xyz + tmpvar_7);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
Bind "texcoord1" ATTR2
ConstBuffer "$Globals" 256
Matrix 32 [glstate_matrix_mvp]
Matrix 96 [glstate_matrix_modelview0]
Matrix 160 [_Object2World]
Vector 0 [_ProjectionParams]
Vector 16 [unity_ShadowFadeCenterAndType]
Vector 224 [unity_LightmapST]
Vector 240 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesMultiTexCoord0 [[attribute(1)]];
  float4 _glesMultiTexCoord1 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
};
struct xlatMtlShaderUniform {
  float4 _ProjectionParams;
  float4 unity_ShadowFadeCenterAndType;
  float4x4 glstate_matrix_mvp;
  float4x4 glstate_matrix_modelview0;
  float4x4 _Object2World;
  float4 unity_LightmapST;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 tmpvar_1;
  float4 tmpvar_2;
  tmpvar_2 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 o_3;
  float4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  float2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _mtl_u._ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  tmpvar_1.xyz = (((_mtl_u._Object2World * _mtl_i._glesVertex).xyz - _mtl_u.unity_ShadowFadeCenterAndType.xyz) * _mtl_u.unity_ShadowFadeCenterAndType.w);
  tmpvar_1.w = (-((_mtl_u.glstate_matrix_modelview0 * _mtl_i._glesVertex).z) * (1.0 - _mtl_u.unity_ShadowFadeCenterAndType.w));
  _mtl_o.gl_Position = tmpvar_2;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = o_3;
  _mtl_o.xlv_TEXCOORD2 = ((_mtl_i._glesMultiTexCoord1.xy * _mtl_u.unity_LightmapST.xy) + _mtl_u.unity_LightmapST.zw);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_4;
  tmpvar_4.x = tmpvar_3.x;
  tmpvar_4.y = (tmpvar_3.y * _ProjectionParams.x);
  o_2.xy = (tmpvar_4 + tmpvar_3.w);
  o_2.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * _Color);
  c_4 = tmpvar_6;
  highp vec4 Current_7;
  Current_7 = c_4;
  highp vec3 tmpvar_8;
  tmpvar_8 = mix (Current_7, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_3 = tmpvar_8;
  lowp vec4 c_9;
  c_9.xyz = vec3(0.0, 0.0, 0.0);
  c_9.w = 0.0;
  c_2 = c_9;
  c_2.xyz = (c_2.xyz + tmpvar_3);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_4;
  tmpvar_4.x = tmpvar_3.x;
  tmpvar_4.y = (tmpvar_3.y * _ProjectionParams.x);
  o_2.xy = (tmpvar_4 + tmpvar_3.w);
  o_2.zw = tmpvar_1.zw;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = o_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform sampler2D _MainTex;
uniform highp vec4 _Color;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec3 tmpvar_3;
  mediump vec4 c_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_5 * _Color);
  c_4 = tmpvar_6;
  highp vec4 Current_7;
  Current_7 = c_4;
  highp vec3 tmpvar_8;
  tmpvar_8 = mix (Current_7, transition_Color, vec4(transition_Mix)).xyz;
  tmpvar_3 = tmpvar_8;
  lowp vec4 c_9;
  c_9.xyz = vec3(0.0, 0.0, 0.0);
  c_9.w = 0.0;
  c_2 = c_9;
  c_2.xyz = (c_2.xyz + tmpvar_3);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
Bind "texcoord1" ATTR2
ConstBuffer "$Globals" 112
Matrix 16 [glstate_matrix_mvp]
Vector 0 [_ProjectionParams]
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesMultiTexCoord0 [[attribute(1)]];
  float4 _glesMultiTexCoord1 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4 _ProjectionParams;
  float4x4 glstate_matrix_mvp;
  float4 unity_LightmapST;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 tmpvar_1;
  tmpvar_1 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 o_2;
  float4 tmpvar_3;
  tmpvar_3 = (tmpvar_1 * 0.5);
  float2 tmpvar_4;
  tmpvar_4.x = tmpvar_3.x;
  tmpvar_4.y = (tmpvar_3.y * _mtl_u._ProjectionParams.x);
  o_2.xy = (tmpvar_4 + tmpvar_3.w);
  o_2.zw = tmpvar_1.zw;
  _mtl_o.gl_Position = tmpvar_1;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = o_2;
  _mtl_o.xlv_TEXCOORD2 = ((_mtl_i._glesMultiTexCoord1.xy * _mtl_u.unity_LightmapST.xy) + _mtl_u.unity_LightmapST.zw);
  return _mtl_o;
}

"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 48
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
  float3 xlv_TEXCOORD2;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _LightBuffer [[texture(1)]], sampler _mtlsmp__LightBuffer [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  half4 c_2;
  half4 light_3;
  half3 tmpvar_4;
  half4 c_5;
  half4 tmpvar_6;
  tmpvar_6 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_7;
  tmpvar_7 = ((float4)tmpvar_6 * _mtl_u._Color);
  c_5 = half4(tmpvar_7);
  float4 Current_8;
  Current_8 = float4(c_5);
  float3 tmpvar_9;
  tmpvar_9 = mix (Current_8, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_4 = half3(tmpvar_9);
  half4 tmpvar_10;
  tmpvar_10 = _LightBuffer.sample(_mtlsmp__LightBuffer, ((float2)(_mtl_i.xlv_TEXCOORD1).xy / (float)(_mtl_i.xlv_TEXCOORD1).w));
  light_3 = tmpvar_10;
  half4 tmpvar_11;
  tmpvar_11 = -(log2(max (light_3, (half4)float4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_11.w;
  float3 tmpvar_12;
  tmpvar_12 = ((float3)tmpvar_11.xyz + _mtl_i.xlv_TEXCOORD2);
  light_3.xyz = half3(tmpvar_12);
  half4 c_13;
  c_13.xyz = half3(float3(0.0, 0.0, 0.0));
  c_13.w = half(0.0);
  c_2 = c_13;
  c_2.xyz = (c_2.xyz + tmpvar_4);
  tmpvar_1 = c_2;
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 64
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
Vector 48 [unity_LightmapFade]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
  float4 unity_LightmapFade;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _LightBuffer [[texture(1)]], sampler _mtlsmp__LightBuffer [[sampler(1)]]
  ,   texture2d<half> unity_Lightmap [[texture(2)]], sampler _mtlsmp_unity_Lightmap [[sampler(2)]]
  ,   texture2d<half> unity_LightmapInd [[texture(3)]], sampler _mtlsmp_unity_LightmapInd [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  half4 c_2;
  half3 lmIndirect_3;
  half3 lmFull_4;
  half lmFade_5;
  half4 light_6;
  half3 tmpvar_7;
  half4 c_8;
  half4 tmpvar_9;
  tmpvar_9 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_10;
  tmpvar_10 = ((float4)tmpvar_9 * _mtl_u._Color);
  c_8 = half4(tmpvar_10);
  float4 Current_11;
  Current_11 = float4(c_8);
  float3 tmpvar_12;
  tmpvar_12 = mix (Current_11, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_7 = half3(tmpvar_12);
  half4 tmpvar_13;
  tmpvar_13 = _LightBuffer.sample(_mtlsmp__LightBuffer, ((float2)(_mtl_i.xlv_TEXCOORD1).xy / (float)(_mtl_i.xlv_TEXCOORD1).w));
  light_6 = tmpvar_13;
  half4 tmpvar_14;
  tmpvar_14 = -(log2(max (light_6, (half4)float4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_14.w;
  float tmpvar_15;
  tmpvar_15 = ((sqrt(
    dot (_mtl_i.xlv_TEXCOORD3, _mtl_i.xlv_TEXCOORD3)
  ) * _mtl_u.unity_LightmapFade.z) + _mtl_u.unity_LightmapFade.w);
  lmFade_5 = half(tmpvar_15);
  half3 tmpvar_16;
  tmpvar_16 = ((half)2.0 * unity_Lightmap.sample(_mtlsmp_unity_Lightmap, (float2)(_mtl_i.xlv_TEXCOORD2)).xyz);
  lmFull_4 = tmpvar_16;
  half3 tmpvar_17;
  tmpvar_17 = ((half)2.0 * unity_LightmapInd.sample(_mtlsmp_unity_LightmapInd, (float2)(_mtl_i.xlv_TEXCOORD2)).xyz);
  lmIndirect_3 = tmpvar_17;
  light_6.xyz = (tmpvar_14.xyz + mix (lmIndirect_3, lmFull_4, half3(clamp (lmFade_5, (half)0.0, (half)1.0))));
  half4 c_18;
  c_18.xyz = half3(float3(0.0, 0.0, 0.0));
  c_18.w = half(0.0);
  c_2 = c_18;
  c_2.xyz = (c_2.xyz + tmpvar_7);
  tmpvar_1 = c_2;
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 48
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  half4 c_2;
  half3 tmpvar_3;
  half4 c_4;
  half4 tmpvar_5;
  tmpvar_5 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_6;
  tmpvar_6 = ((float4)tmpvar_5 * _mtl_u._Color);
  c_4 = half4(tmpvar_6);
  float4 Current_7;
  Current_7 = float4(c_4);
  float3 tmpvar_8;
  tmpvar_8 = mix (Current_7, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_3 = half3(tmpvar_8);
  half4 c_9;
  c_9.xyz = half3(float3(0.0, 0.0, 0.0));
  c_9.w = half(0.0);
  c_2 = c_9;
  c_2.xyz = (c_2.xyz + tmpvar_3);
  tmpvar_1 = c_2;
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 48
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
  float3 xlv_TEXCOORD2;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _LightBuffer [[texture(1)]], sampler _mtlsmp__LightBuffer [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  half4 c_2;
  half4 light_3;
  half3 tmpvar_4;
  half4 c_5;
  half4 tmpvar_6;
  tmpvar_6 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_7;
  tmpvar_7 = ((float4)tmpvar_6 * _mtl_u._Color);
  c_5 = half4(tmpvar_7);
  float4 Current_8;
  Current_8 = float4(c_5);
  float3 tmpvar_9;
  tmpvar_9 = mix (Current_8, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_4 = half3(tmpvar_9);
  half4 tmpvar_10;
  tmpvar_10 = _LightBuffer.sample(_mtlsmp__LightBuffer, ((float2)(_mtl_i.xlv_TEXCOORD1).xy / (float)(_mtl_i.xlv_TEXCOORD1).w));
  light_3 = tmpvar_10;
  half4 tmpvar_11;
  tmpvar_11 = max (light_3, (half4)float4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_11.w;
  float3 tmpvar_12;
  tmpvar_12 = ((float3)tmpvar_11.xyz + _mtl_i.xlv_TEXCOORD2);
  light_3.xyz = half3(tmpvar_12);
  half4 c_13;
  c_13.xyz = half3(float3(0.0, 0.0, 0.0));
  c_13.w = half(0.0);
  c_2 = c_13;
  c_2.xyz = (c_2.xyz + tmpvar_4);
  tmpvar_1 = c_2;
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 64
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
Vector 48 [unity_LightmapFade]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
  float4 unity_LightmapFade;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _LightBuffer [[texture(1)]], sampler _mtlsmp__LightBuffer [[sampler(1)]]
  ,   texture2d<half> unity_Lightmap [[texture(2)]], sampler _mtlsmp_unity_Lightmap [[sampler(2)]]
  ,   texture2d<half> unity_LightmapInd [[texture(3)]], sampler _mtlsmp_unity_LightmapInd [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  half4 c_2;
  half3 lmIndirect_3;
  half3 lmFull_4;
  half lmFade_5;
  half4 light_6;
  half3 tmpvar_7;
  half4 c_8;
  half4 tmpvar_9;
  tmpvar_9 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_10;
  tmpvar_10 = ((float4)tmpvar_9 * _mtl_u._Color);
  c_8 = half4(tmpvar_10);
  float4 Current_11;
  Current_11 = float4(c_8);
  float3 tmpvar_12;
  tmpvar_12 = mix (Current_11, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_7 = half3(tmpvar_12);
  half4 tmpvar_13;
  tmpvar_13 = _LightBuffer.sample(_mtlsmp__LightBuffer, ((float2)(_mtl_i.xlv_TEXCOORD1).xy / (float)(_mtl_i.xlv_TEXCOORD1).w));
  light_6 = tmpvar_13;
  half4 tmpvar_14;
  tmpvar_14 = max (light_6, (half4)float4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_14.w;
  float tmpvar_15;
  tmpvar_15 = ((sqrt(
    dot (_mtl_i.xlv_TEXCOORD3, _mtl_i.xlv_TEXCOORD3)
  ) * _mtl_u.unity_LightmapFade.z) + _mtl_u.unity_LightmapFade.w);
  lmFade_5 = half(tmpvar_15);
  half3 tmpvar_16;
  tmpvar_16 = ((half)2.0 * unity_Lightmap.sample(_mtlsmp_unity_Lightmap, (float2)(_mtl_i.xlv_TEXCOORD2)).xyz);
  lmFull_4 = tmpvar_16;
  half3 tmpvar_17;
  tmpvar_17 = ((half)2.0 * unity_LightmapInd.sample(_mtlsmp_unity_LightmapInd, (float2)(_mtl_i.xlv_TEXCOORD2)).xyz);
  lmIndirect_3 = tmpvar_17;
  light_6.xyz = (tmpvar_14.xyz + mix (lmIndirect_3, lmFull_4, half3(clamp (lmFade_5, (half)0.0, (half)1.0))));
  half4 c_18;
  c_18.xyz = half3(float3(0.0, 0.0, 0.0));
  c_18.w = half(0.0);
  c_2 = c_18;
  c_2.xyz = (c_2.xyz + tmpvar_7);
  tmpvar_1 = c_2;
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 48
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  half4 c_2;
  half3 tmpvar_3;
  half4 c_4;
  half4 tmpvar_5;
  tmpvar_5 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  float4 tmpvar_6;
  tmpvar_6 = ((float4)tmpvar_5 * _mtl_u._Color);
  c_4 = half4(tmpvar_6);
  float4 Current_7;
  Current_7 = float4(c_4);
  float3 tmpvar_8;
  tmpvar_8 = mix (Current_7, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix)).xyz;
  tmpvar_3 = half3(tmpvar_8);
  half4 c_9;
  c_9.xyz = half3(float3(0.0, 0.0, 0.0));
  c_9.w = half(0.0);
  c_2 = c_9;
  c_2.xyz = (c_2.xyz + tmpvar_3);
  tmpvar_1 = c_2;
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
}
 }
}
Fallback "Diffuse"
}