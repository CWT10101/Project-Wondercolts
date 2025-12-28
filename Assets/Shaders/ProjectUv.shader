Shader "Custom/ProjectUv" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _Size ("Size", Range(0,1)) = 1
 _Grayed ("_Grayed", Float) = 0
}
SubShader { 
 Pass {
Program "vp" {
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_COLOR;
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
  xlv_TEXCOORD0 = o_2;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_COLOR = _glesColor.xyz;
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform highp vec4 _Color;
uniform sampler2D _MainTex;
uniform highp float _Size;
uniform highp float _Grayed;
uniform highp float _VignetPow;
uniform highp float _VignetLevel;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  tmpvar_2 = ((xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w) - vec2(0.5, 0.25));
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD1.xz * _Size);
  tmpvar_3 = texture2D (_MainTex, P_4);
  highp vec3 tmpvar_5;
  tmpvar_5 = ((tmpvar_3 - (
    pow (sqrt(dot (tmpvar_2, tmpvar_2)), _VignetPow)
   * _VignetLevel)) * _Color).xyz;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = mix (tmpvar_5, vec3((0.249997 * (
    (tmpvar_5.x + tmpvar_5.y)
   + tmpvar_5.z))), vec3(_Grayed));
  highp vec4 tmpvar_7;
  tmpvar_7 = mix (tmpvar_6, transition_Color, vec4(transition_Mix));
  tmpvar_1 = tmpvar_7;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesColor;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
out highp vec4 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_COLOR;
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
  xlv_TEXCOORD0 = o_2;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_COLOR = _glesColor.xyz;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform highp vec4 _Color;
uniform sampler2D _MainTex;
uniform highp float _Size;
uniform highp float _Grayed;
uniform highp float _VignetPow;
uniform highp float _VignetLevel;
in highp vec4 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec2 tmpvar_2;
  tmpvar_2 = ((xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w) - vec2(0.5, 0.25));
  lowp vec4 tmpvar_3;
  highp vec2 P_4;
  P_4 = (xlv_TEXCOORD1.xz * _Size);
  tmpvar_3 = texture (_MainTex, P_4);
  highp vec3 tmpvar_5;
  tmpvar_5 = ((tmpvar_3 - (
    pow (sqrt(dot (tmpvar_2, tmpvar_2)), _VignetPow)
   * _VignetLevel)) * _Color).xyz;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = mix (tmpvar_5, vec3((0.249997 * (
    (tmpvar_5.x + tmpvar_5.y)
   + tmpvar_5.z))), vec3(_Grayed));
  highp vec4 tmpvar_7;
  tmpvar_7 = mix (tmpvar_6, transition_Color, vec4(transition_Mix));
  tmpvar_1 = tmpvar_7;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Bind "vertex" ATTR0
Bind "color" ATTR1
ConstBuffer "$Globals" 144
Matrix 16 [glstate_matrix_mvp]
Matrix 80 [_Object2World]
Vector 0 [_ProjectionParams]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesColor [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
  float3 xlv_COLOR;
};
struct xlatMtlShaderUniform {
  float4 _ProjectionParams;
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
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
  _mtl_o.xlv_TEXCOORD0 = o_2;
  _mtl_o.xlv_TEXCOORD1 = (_mtl_u._Object2World * _mtl_i._glesVertex);
  _mtl_o.xlv_COLOR = _mtl_i._glesColor.xyz;
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
ConstBuffer "$Globals" 64
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Vector 32 [_Color]
Float 48 [_Size]
Float 52 [_Grayed]
Float 56 [_VignetPow]
Float 60 [_VignetLevel]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float4 _Color;
  float _Size;
  float _Grayed;
  float _VignetPow;
  float _VignetLevel;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  float2 tmpvar_2;
  tmpvar_2 = ((_mtl_i.xlv_TEXCOORD0.xy / _mtl_i.xlv_TEXCOORD0.w) - float2(0.5, 0.25));
  half4 tmpvar_3;
  float2 P_4;
  P_4 = (_mtl_i.xlv_TEXCOORD1.xz * _mtl_u._Size);
  tmpvar_3 = _MainTex.sample(_mtlsmp__MainTex, (float2)(P_4));
  float3 tmpvar_5;
  tmpvar_5 = (((float4)tmpvar_3 - (
    pow (sqrt(dot (tmpvar_2, tmpvar_2)), _mtl_u._VignetPow)
   * _mtl_u._VignetLevel)) * _mtl_u._Color).xyz;
  float4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = mix (tmpvar_5, float3((0.249997 * (
    (tmpvar_5.x + tmpvar_5.y)
   + tmpvar_5.z))), float3(_mtl_u._Grayed));
  float4 tmpvar_7;
  tmpvar_7 = mix (tmpvar_6, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix));
  tmpvar_1 = half4(tmpvar_7);
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
}
 }
}
Fallback "VertexLit"
}