Shader "MLP/BakedOutline" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "black" {}
 _Outline ("Outline (RGB)", 2D) = "black" {}
 _Hightlight ("Hightlight", Range(0,1)) = 0.4
 _Darkness ("Darkness", Range(0,1)) = 0.5
 _DiffuseThreshold ("Hightlight Threshold", Range(0,2)) = 1
 _OutlineWidth ("OutlineWidth", Float) = 1
}
SubShader { 
 Pass {
  Name "OUTLINE"
  Tags { "LIGHTMODE"="ForwardBase" }
  Cull Front
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_invtrans_modelview0;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _OutlineWidth;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.zw = tmpvar_2.zw;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = glstate_matrix_invtrans_modelview0[0].xyz;
  tmpvar_3[1] = glstate_matrix_invtrans_modelview0[1].xyz;
  tmpvar_3[2] = glstate_matrix_invtrans_modelview0[2].xyz;
  highp mat2 tmpvar_4;
  tmpvar_4[0] = glstate_matrix_projection[0].xy;
  tmpvar_4[1] = glstate_matrix_projection[1].xy;
  tmpvar_1.xy = (tmpvar_2.xy + ((
    (tmpvar_4 * (tmpvar_3 * normalize(_glesNormal)).xy)
   * tmpvar_2.z) * _OutlineWidth));
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = _glesMultiTexCoord1.xy;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _Outline;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 t_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Outline, xlv_TEXCOORD0);
  t_2 = tmpvar_3;
  tmpvar_1 = t_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord1;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_invtrans_modelview0;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _OutlineWidth;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_1.zw = tmpvar_2.zw;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = glstate_matrix_invtrans_modelview0[0].xyz;
  tmpvar_3[1] = glstate_matrix_invtrans_modelview0[1].xyz;
  tmpvar_3[2] = glstate_matrix_invtrans_modelview0[2].xyz;
  highp mat2 tmpvar_4;
  tmpvar_4[0] = glstate_matrix_projection[0].xy;
  tmpvar_4[1] = glstate_matrix_projection[1].xy;
  tmpvar_1.xy = (tmpvar_2.xy + ((
    (tmpvar_4 * (tmpvar_3 * normalize(_glesNormal)).xy)
   * tmpvar_2.z) * _OutlineWidth));
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = _glesMultiTexCoord1.xy;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform sampler2D _Outline;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 t_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture (_Outline, xlv_TEXCOORD0);
  t_2 = tmpvar_3;
  tmpvar_1 = t_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Bind "vertex" ATTR0
Bind "normal" ATTR1
Bind "texcoord1" ATTR2
ConstBuffer "$Globals" 196
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_invtrans_modelview0]
Matrix 128 [glstate_matrix_projection]
Float 192 [_OutlineWidth]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float3 _glesNormal [[attribute(1)]];
  float4 _glesMultiTexCoord1 [[attribute(2)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 glstate_matrix_invtrans_modelview0;
  float4x4 glstate_matrix_projection;
  float _OutlineWidth;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 tmpvar_1;
  float4 tmpvar_2;
  tmpvar_2 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  tmpvar_1.zw = tmpvar_2.zw;
  float3x3 tmpvar_3;
  tmpvar_3[0] = _mtl_u.glstate_matrix_invtrans_modelview0[0].xyz;
  tmpvar_3[1] = _mtl_u.glstate_matrix_invtrans_modelview0[1].xyz;
  tmpvar_3[2] = _mtl_u.glstate_matrix_invtrans_modelview0[2].xyz;
  float2x2 tmpvar_4;
  tmpvar_4[0] = _mtl_u.glstate_matrix_projection[0].xy;
  tmpvar_4[1] = _mtl_u.glstate_matrix_projection[1].xy;
  tmpvar_1.xy = (tmpvar_2.xy + ((
    (tmpvar_4 * (tmpvar_3 * normalize(_mtl_i._glesNormal)).xy)
   * tmpvar_2.z) * _mtl_u._OutlineWidth));
  _mtl_o.gl_Position = tmpvar_1;
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord1.xy;
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
SetTexture 0 [_Outline] 2D 0
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
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _Outline [[texture(0)]], sampler _mtlsmp__Outline [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  float4 t_2;
  half4 tmpvar_3;
  tmpvar_3 = _Outline.sample(_mtlsmp__Outline, (float2)(_mtl_i.xlv_TEXCOORD0));
  t_2 = float4(tmpvar_3);
  tmpvar_1 = half4(t_2);
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
}
 }
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

uniform highp vec4 _WorldSpaceLightPos0;
uniform sampler2D _MainTex;
uniform highp float _Darkness;
uniform highp float _DiffuseThreshold;
uniform highp vec4 ShadowDirection;
varying highp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 fragmentColor_1;
  highp vec3 lightDirection_2;
  highp vec4 t_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  t_3 = tmpvar_4;
  if (((t_3.w < 0.1) && (xlv_COLOR0.w > 0.9))) {
    discard;
  };
  if ((0.0 == _WorldSpaceLightPos0.w)) {
    lightDirection_2 = ShadowDirection.xyz;
  } else {
    lightDirection_2 = ShadowDirection.xyz;
  };
  highp vec4 tmpvar_5;
  tmpvar_5 = ((t_3 * xlv_COLOR0.w) + (xlv_COLOR0 * (1.0 - xlv_COLOR0.w)));
  fragmentColor_1.xyz = (tmpvar_5 - ((_Darkness * 
    pow (clamp ((_DiffuseThreshold - dot (xlv_TEXCOORD1, lightDirection_2)), 0.0, 1.0), 100.0)
  ) * tmpvar_5)).xyz;
  fragmentColor_1.w = 1.0;
  gl_FragData[0] = fragmentColor_1;
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
uniform highp vec4 _WorldSpaceLightPos0;
uniform sampler2D _MainTex;
uniform highp float _Darkness;
uniform highp float _DiffuseThreshold;
uniform highp vec4 ShadowDirection;
in highp vec4 xlv_COLOR0;
in highp vec2 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 fragmentColor_1;
  highp vec3 lightDirection_2;
  highp vec4 t_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture (_MainTex, xlv_TEXCOORD0);
  t_3 = tmpvar_4;
  if (((t_3.w < 0.1) && (xlv_COLOR0.w > 0.9))) {
    discard;
  };
  if ((0.0 == _WorldSpaceLightPos0.w)) {
    lightDirection_2 = ShadowDirection.xyz;
  } else {
    lightDirection_2 = ShadowDirection.xyz;
  };
  highp vec4 tmpvar_5;
  tmpvar_5 = ((t_3 * xlv_COLOR0.w) + (xlv_COLOR0 * (1.0 - xlv_COLOR0.w)));
  fragmentColor_1.xyz = (tmpvar_5 - ((_Darkness * 
    pow (clamp ((_DiffuseThreshold - dot (xlv_TEXCOORD1, lightDirection_2)), 0.0, 1.0), 100.0)
  ) * tmpvar_5)).xyz;
  fragmentColor_1.w = 1.0;
  _glesFragData[0] = fragmentColor_1;
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
ConstBuffer "$Globals" 48
Vector 0 [_WorldSpaceLightPos0]
Float 16 [_Darkness]
Float 20 [_DiffuseThreshold]
Vector 32 [ShadowDirection]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 xlv_COLOR0;
  float2 xlv_TEXCOORD0;
  float3 xlv_TEXCOORD1;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _WorldSpaceLightPos0;
  float _Darkness;
  float _DiffuseThreshold;
  float4 ShadowDirection;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 fragmentColor_1;
  float3 lightDirection_2;
  float4 t_3;
  half4 tmpvar_4;
  tmpvar_4 = _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0));
  t_3 = float4(tmpvar_4);
  if (((t_3.w < 0.1) && (_mtl_i.xlv_COLOR0.w > 0.9))) {
    discard_fragment();
  };
  if ((0.0 == _mtl_u._WorldSpaceLightPos0.w)) {
    lightDirection_2 = _mtl_u.ShadowDirection.xyz;
  } else {
    lightDirection_2 = _mtl_u.ShadowDirection.xyz;
  };
  float4 tmpvar_5;
  tmpvar_5 = ((t_3 * _mtl_i.xlv_COLOR0.w) + (_mtl_i.xlv_COLOR0 * (1.0 - _mtl_i.xlv_COLOR0.w)));
  fragmentColor_1.xyz = (tmpvar_5 - ((_mtl_u._Darkness * 
    pow (clamp ((_mtl_u._DiffuseThreshold - dot (_mtl_i.xlv_TEXCOORD1, lightDirection_2)), 0.0, 1.0), 100.0)
  ) * tmpvar_5)).xyz;
  fragmentColor_1.w = 1.0;
  _mtl_o._glesFragData_0 = half4(fragmentColor_1);
  return _mtl_o;
}

"
}
}
 }
}
}