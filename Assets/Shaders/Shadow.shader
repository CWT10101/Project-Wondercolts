Shader "Custom/Shadow" {
Properties {
 _MainTex ("Particle Texture", 2D) = "white" {}
 _Alpha ("Alpha", Range(0,1)) = 1
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Fog {
   Color (1,1,1,1)
  }
  Blend Zero SrcColor
Program "vp" {
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform lowp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform lowp float _Alpha;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 color_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_MainTex, xlv_TEXCOORD0) + (1.0 - _Alpha));
  color_1 = tmpvar_2;
  gl_FragData[0] = color_1;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform lowp vec4 _MainTex_ST;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform lowp float _Alpha;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 color_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture (_MainTex, xlv_TEXCOORD0) + (1.0 - _Alpha));
  color_1 = tmpvar_2;
  _glesFragData[0] = color_1;
}



#endif"
}
SubProgram "metal " {
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
ConstBuffer "$Globals" 72
Matrix 0 [glstate_matrix_mvp]
VectorHalf 64 [_MainTex_ST] 4
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesMultiTexCoord0 [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  half4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * (float2)_mtl_u._MainTex_ST.xy) + (float2)_mtl_u._MainTex_ST.zw);
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
ConstBuffer "$Globals" 2
ScalarHalf 0 [_Alpha]
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
  half _Alpha;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 color_1;
  half4 tmpvar_2;
  tmpvar_2 = (_MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0)) + ((half)1.0 - _mtl_u._Alpha));
  color_1 = float4(tmpvar_2);
  _mtl_o._glesFragData_0 = half4(color_1);
  return _mtl_o;
}

"
}
}
 }
}
}