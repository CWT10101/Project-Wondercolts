Shader "MLP/Baked" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "black" {}
 _LevelGlow ("LevelUpRange", Range(0,1)) = 0
}
SubShader { 
 Pass {
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
  highp vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = normalize(_glesNormal);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR0 = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (_Object2World * tmpvar_3).xyz;
  xlv_TEXCOORD2 = (_Object2World * _glesVertex).xyz;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform highp float _LevelGlow;
varying highp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 t_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  t_1 = tmpvar_2;
  if (((t_1.w < 0.1) && (xlv_COLOR0.w > 0.9))) {
    discard;
  };
  highp vec3 tmpvar_3;
  tmpvar_3 = (_WorldSpaceCameraPos - xlv_TEXCOORD2);
  highp float tmpvar_4;
  tmpvar_4 = pow ((clamp (
    dot (normalize(tmpvar_3), xlv_TEXCOORD1)
  , 0.15, 1.0) * 4.0), 0.5);
  highp vec4 tmpvar_5;
  tmpvar_5 = ((t_1 * xlv_COLOR0.w) + (xlv_COLOR0 * (1.0 - xlv_COLOR0.w)));
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = (mix ((tmpvar_5 - 
    (((1.0 - (
      (pow (((tmpvar_4 * 0.5) + 0.5), 0.66) * 1.25)
     - 0.3)) * 0.5) + 0.2)
  ), tmpvar_5, vec4(clamp (
    (1.0 - float(((
      (tmpvar_4 / sqrt(dot (tmpvar_3, tmpvar_3)))
     * 10.0) >= (1.0 - tmpvar_4))))
  , 0.0, 1.0))) + _LevelGlow).xyz;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * _Color);
  gl_FragData[0] = tmpvar_7;
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
  highp vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = normalize(_glesNormal);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR0 = tmpvar_2;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (_Object2World * tmpvar_3).xyz;
  xlv_TEXCOORD2 = (_Object2World * _glesVertex).xyz;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
uniform highp float _LevelGlow;
in highp vec4 xlv_COLOR0;
in highp vec2 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec4 t_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture (_MainTex, xlv_TEXCOORD0);
  t_1 = tmpvar_2;
  if (((t_1.w < 0.1) && (xlv_COLOR0.w > 0.9))) {
    discard;
  };
  highp vec3 tmpvar_3;
  tmpvar_3 = (_WorldSpaceCameraPos - xlv_TEXCOORD2);
  highp float tmpvar_4;
  tmpvar_4 = pow ((clamp (
    dot (normalize(tmpvar_3), xlv_TEXCOORD1)
  , 0.15, 1.0) * 4.0), 0.5);
  highp vec4 tmpvar_5;
  tmpvar_5 = ((t_1 * xlv_COLOR0.w) + (xlv_COLOR0 * (1.0 - xlv_COLOR0.w)));
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = (mix ((tmpvar_5 - 
    (((1.0 - (
      (pow (((tmpvar_4 * 0.5) + 0.5), 0.66) * 1.25)
     - 0.3)) * 0.5) + 0.2)
  ), tmpvar_5, vec4(clamp (
    (1.0 - float(((
      (tmpvar_4 / sqrt(dot (tmpvar_3, tmpvar_3)))
     * 10.0) >= (1.0 - tmpvar_4))))
  , 0.0, 1.0))) + _LevelGlow).xyz;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * _Color);
  _glesFragData[0] = tmpvar_7;
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
  float4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = normalize(_mtl_i._glesNormal);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_COLOR0 = tmpvar_2;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * (float2)_mtl_u._MainTex_ST.xy) + (float2)_mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = (_mtl_u._Object2World * tmpvar_3).xyz;
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
ConstBuffer "$Globals" 28
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_Color] 4
Float 24 [_LevelGlow]
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
  float3 _WorldSpaceCameraPos;
  half4 _Color;
  float _LevelGlow;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 t_1;
  half4 tmpvar_2;
  tmpvar_2 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  t_1 = float4(tmpvar_2);
  if (((t_1.w < 0.1) && (_mtl_i.xlv_COLOR0.w > 0.9))) {
    discard_fragment();
  };
  float3 tmpvar_3;
  tmpvar_3 = (_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD2);
  float tmpvar_4;
  tmpvar_4 = pow ((clamp (
    dot (normalize(tmpvar_3), _mtl_i.xlv_TEXCOORD1)
  , 0.15, 1.0) * 4.0), 0.5);
  float4 tmpvar_5;
  tmpvar_5 = ((t_1 * _mtl_i.xlv_COLOR0.w) + (_mtl_i.xlv_COLOR0 * (1.0 - _mtl_i.xlv_COLOR0.w)));
  float4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = (mix ((tmpvar_5 - 
    (((1.0 - (
      (pow (((tmpvar_4 * 0.5) + 0.5), 0.66) * 1.25)
     - 0.3)) * 0.5) + 0.2)
  ), tmpvar_5, float4(clamp (
    (1.0 - float(((
      (tmpvar_4 / sqrt(dot (tmpvar_3, tmpvar_3)))
     * 10.0) >= (1.0 - tmpvar_4))))
  , 0.0, 1.0))) + _mtl_u._LevelGlow).xyz;
  float4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (float4)_mtl_u._Color);
  _mtl_o._glesFragData_0 = half4(tmpvar_7);
  return _mtl_o;
}

"
}
}
 }
}
}