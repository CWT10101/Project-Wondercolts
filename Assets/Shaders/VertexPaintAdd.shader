Shader "FX/VertexPaintAdd" {
Properties {
 _MainTex ("Texture", 2D) = "white" {}
 ScrollSpeed ("ScrollSpeed", Float) = 0
 Gain ("Gain", Float) = 0
 TileTexture ("TileTexture", Float) = 0
}
SubShader { 
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" "DisableBatching"="true" }
 Pass {
  Tags { "QUEUE"="Transparent" "RenderType"="Transparent" "DisableBatching"="true" }
  ZWrite Off
  Cull Off
  Blend One One
Program "vp" {
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
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
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = tmpvar_1;
  xlv_TEXCOORD1 = _glesColor;
  xlv_TEXCOORD2 = o_2.xy;
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float ScrollSpeed;
uniform highp float Gain;
uniform highp float TileTexture;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  tmpvar_2.y = 0.0;
  tmpvar_2.x = (_Time.x * ScrollSpeed);
  highp vec2 P_3;
  P_3 = ((xlv_TEXCOORD2 * TileTexture) + tmpvar_2);
  tmpvar_1 = ((xlv_TEXCOORD1 * texture2D (_MainTex, P_3)) * Gain);
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesColor;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
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
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  gl_Position = tmpvar_1;
  xlv_TEXCOORD1 = _glesColor;
  xlv_TEXCOORD2 = o_2.xy;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp vec4 _Time;
uniform sampler2D _MainTex;
uniform highp float ScrollSpeed;
uniform highp float Gain;
uniform highp float TileTexture;
in highp vec4 xlv_TEXCOORD1;
in highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  tmpvar_2.y = 0.0;
  tmpvar_2.x = (_Time.x * ScrollSpeed);
  highp vec2 P_3;
  P_3 = ((xlv_TEXCOORD2 * TileTexture) + tmpvar_2);
  tmpvar_1 = ((xlv_TEXCOORD1 * texture (_MainTex, P_3)) * Gain);
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Bind "vertex" ATTR0
Bind "color" ATTR1
Bind "texcoord" ATTR2
ConstBuffer "$Globals" 96
Matrix 16 [glstate_matrix_mvp]
Vector 0 [_ProjectionParams]
Vector 80 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesColor [[attribute(1)]];
  float4 _glesMultiTexCoord0 [[attribute(2)]];
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
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.gl_Position = tmpvar_1;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesColor;
  _mtl_o.xlv_TEXCOORD2 = o_2.xy;
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
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 28
Vector 0 [_Time]
Float 16 [ScrollSpeed]
Float 20 [Gain]
Float 24 [TileTexture]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _Time;
  float ScrollSpeed;
  float Gain;
  float TileTexture;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  float2 tmpvar_2;
  tmpvar_2.y = 0.0;
  tmpvar_2.x = (_mtl_u._Time.x * _mtl_u.ScrollSpeed);
  float2 P_3;
  P_3 = ((_mtl_i.xlv_TEXCOORD2 * _mtl_u.TileTexture) + tmpvar_2);
  tmpvar_1 = half4(((_mtl_i.xlv_TEXCOORD1 * (float4)_MainTex.sample(_mtlsmp__MainTex, (float2)(P_3))) * _mtl_u.Gain));
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
}
 }
}
}