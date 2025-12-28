Shader "MLP/BakedTransparent" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "black" {}
 _Hightlight ("Hightlight", Range(0,1)) = 0.4
 _DiffuseThreshold ("Hightlight Threshold", Range(0,2)) = 0.7
 _Smooth ("Smooth", Float) = 8
}
SubShader { 
 Tags { "QUEUE"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform lowp vec4 _MainTex_ST;
varying highp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec4 tmpvar_2;
  tmpvar_2 = tmpvar_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR0 = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(_glesNormal);
  xlv_TEXCOORD2 = (_Object2World * _glesVertex).xyz;
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform highp float _Hightlight;
uniform highp float _DiffuseThreshold;
uniform highp float _Smooth;
varying highp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 fragmentColor_1;
  highp float attenuation_2;
  highp vec3 lightDirection_3;
  highp vec4 t_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  t_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD1);
  if ((0.0 == _WorldSpaceLightPos0.w)) {
    attenuation_2 = 1.0;
    lightDirection_3 = normalize(_WorldSpaceLightPos0).xyz;
  } else {
    highp vec3 tmpvar_7;
    tmpvar_7 = (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2);
    attenuation_2 = inversesqrt(dot (tmpvar_7, tmpvar_7));
    lightDirection_3 = normalize(tmpvar_7);
  };
  fragmentColor_1.xyz = (((
    (_LightColor0 * _Hightlight)
   * 
    (1.0 - pow (clamp ((_DiffuseThreshold - 
      dot (tmpvar_6, lightDirection_3)
    ), 0.0, 1.0), _Smooth))
  ) + (
    (t_4 * xlv_COLOR0.w)
   + 
    (xlv_COLOR0 * (1.0 - xlv_COLOR0.w))
  )) * attenuation_2).xyz;
  fragmentColor_1.w = t_4.w;
  highp vec4 tmpvar_8;
  tmpvar_8 = (fragmentColor_1 * _Color);
  gl_FragData[0] = tmpvar_8;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform lowp vec4 _MainTex_ST;
out highp vec4 xlv_COLOR0;
out highp vec2 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec4 tmpvar_2;
  tmpvar_2 = tmpvar_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR0 = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = normalize(_glesNormal);
  xlv_TEXCOORD2 = (_Object2World * _glesVertex).xyz;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform highp float _Hightlight;
uniform highp float _DiffuseThreshold;
uniform highp float _Smooth;
in highp vec4 xlv_COLOR0;
in highp vec2 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 fragmentColor_1;
  highp float attenuation_2;
  highp vec3 lightDirection_3;
  highp vec4 t_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture (_MainTex, xlv_TEXCOORD0);
  t_4 = tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD1);
  if ((0.0 == _WorldSpaceLightPos0.w)) {
    attenuation_2 = 1.0;
    lightDirection_3 = normalize(_WorldSpaceLightPos0).xyz;
  } else {
    highp vec3 tmpvar_7;
    tmpvar_7 = (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD2);
    attenuation_2 = inversesqrt(dot (tmpvar_7, tmpvar_7));
    lightDirection_3 = normalize(tmpvar_7);
  };
  fragmentColor_1.xyz = (((
    (_LightColor0 * _Hightlight)
   * 
    (1.0 - pow (clamp ((_DiffuseThreshold - 
      dot (tmpvar_6, lightDirection_3)
    ), 0.0, 1.0), _Smooth))
  ) + (
    (t_4 * xlv_COLOR0.w)
   + 
    (xlv_COLOR0 * (1.0 - xlv_COLOR0.w))
  )) * attenuation_2).xyz;
  fragmentColor_1.w = t_4.w;
  highp vec4 tmpvar_8;
  tmpvar_8 = (fragmentColor_1 * _Color);
  _glesFragData[0] = tmpvar_8;
}



#endif"
}
SubProgram "metal " {
Bind "vertex" ATTR0
Bind "color" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
ConstBuffer "$Globals" 136
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [_Object2World]
VectorHalf 128 [_MainTex_ST] 4
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesColor [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float4 xlv_COLOR0;
  float2 xlv_TEXCOORD0;
  float3 xlv_TEXCOORD1;
  float3 xlv_TEXCOORD2;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 _Object2World;
  half4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = half4(_mtl_i._glesColor);
  float4 tmpvar_2;
  tmpvar_2 = float4(tmpvar_1);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_COLOR0 = tmpvar_2;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * (float2)_mtl_u._MainTex_ST.xy) + (float2)_mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = normalize(_mtl_i._glesNormal);
  _mtl_o.xlv_TEXCOORD2 = (_mtl_u._Object2World * _mtl_i._glesVertex).xyz;
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
ConstBuffer "$Globals" 44
Vector 0 [_WorldSpaceLightPos0]
VectorHalf 16 [_LightColor0] 4
VectorHalf 24 [_Color] 4
Float 32 [_Hightlight]
Float 36 [_DiffuseThreshold]
Float 40 [_Smooth]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_COLOR0;
  float2 xlv_TEXCOORD0;
  float3 xlv_TEXCOORD1;
  float3 xlv_TEXCOORD2;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  half4 _Color;
  float _Hightlight;
  float _DiffuseThreshold;
  float _Smooth;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 fragmentColor_1;
  float attenuation_2;
  float3 lightDirection_3;
  float4 t_4;
  half4 tmpvar_5;
  tmpvar_5 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  t_4 = float4(tmpvar_5);
  float3 tmpvar_6;
  tmpvar_6 = normalize(_mtl_i.xlv_TEXCOORD1);
  if ((0.0 == _mtl_u._WorldSpaceLightPos0.w)) {
    attenuation_2 = 1.0;
    lightDirection_3 = normalize(_mtl_u._WorldSpaceLightPos0).xyz;
  } else {
    float3 tmpvar_7;
    tmpvar_7 = (_mtl_u._WorldSpaceLightPos0.xyz - _mtl_i.xlv_TEXCOORD2);
    attenuation_2 = rsqrt(dot (tmpvar_7, tmpvar_7));
    lightDirection_3 = normalize(tmpvar_7);
  };
  fragmentColor_1.xyz = (((
    ((float4)_mtl_u._LightColor0 * _mtl_u._Hightlight)
   * 
    (1.0 - pow (clamp ((_mtl_u._DiffuseThreshold - 
      dot (tmpvar_6, lightDirection_3)
    ), 0.0, 1.0), _mtl_u._Smooth))
  ) + (
    (t_4 * _mtl_i.xlv_COLOR0.w)
   + 
    (_mtl_i.xlv_COLOR0 * (1.0 - _mtl_i.xlv_COLOR0.w))
  )) * attenuation_2).xyz;
  fragmentColor_1.w = t_4.w;
  float4 tmpvar_8;
  tmpvar_8 = (fragmentColor_1 * (float4)_mtl_u._Color);
  _mtl_o._glesFragData_0 = half4(tmpvar_8);
  return _mtl_o;
}

"
}
}
 }
}
}