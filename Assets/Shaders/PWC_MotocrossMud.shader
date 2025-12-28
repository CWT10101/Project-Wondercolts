Shader "MLP/MotocrossMud" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
 _Dissolve ("Dissovle map", 2D) = "white" {}
 _DissolveSlider ("Dissolve slider", Range(0,1)) = 0
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec2 tmpvar_2;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform sampler2D _Dissolve;
uniform highp float _DissolveSlider;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_Dissolve, xlv_TEXCOORD0);
  highp float x_2;
  x_2 = ((tmpvar_1.w * 0.9) - _DissolveSlider);
  if ((x_2 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  gl_FragData[0] = tmpvar_3;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
out mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  highp vec2 tmpvar_2;
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_1 = tmpvar_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform sampler2D _Dissolve;
uniform highp float _DissolveSlider;
in mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture (_Dissolve, xlv_TEXCOORD0);
  highp float x_2;
  x_2 = ((tmpvar_1.w * 0.9) - _DissolveSlider);
  if ((x_2 < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture (_MainTex, xlv_TEXCOORD0);
  _glesFragData[0] = tmpvar_3;
}



#endif"
}
SubProgram "metal " {
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
ConstBuffer "$Globals" 80
Matrix 0 [glstate_matrix_mvp]
Vector 64 [_MainTex_ST]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesMultiTexCoord0 [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  half2 xlv_TEXCOORD0;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half2 tmpvar_1;
  float2 tmpvar_2;
  tmpvar_2 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  tmpvar_1 = half2(tmpvar_2);
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
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Dissolve] 2D 1
ConstBuffer "$Globals" 4
Float 0 [_DissolveSlider]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  half2 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float _DissolveSlider;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _Dissolve [[texture(1)]], sampler _mtlsmp__Dissolve [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = _Dissolve.sample(_mtlsmp__Dissolve, (float2)(_mtl_i.xlv_TEXCOORD0));
  float x_2;
  x_2 = ((float)(tmpvar_1.w * (half)0.9) - _mtl_u._DissolveSlider);
  if ((x_2 < 0.0)) {
    discard_fragment();
  };
  half4 tmpvar_3;
  tmpvar_3 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  _mtl_o._glesFragData_0 = tmpvar_3;
  return _mtl_o;
}

"
}
}
 }
}
}