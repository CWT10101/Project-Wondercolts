Shader "Bkom/VP_CG_ONLY" {
Properties {
 _Grayed ("_Grayed", Float) = 0
 Colo ("Colo", Color) = (1,1,1,1)
}
SubShader { 
 Pass {
Program "vp" {
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec3 xlv_COLOR;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = _glesColor.xyz;
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform highp float _Grayed;
uniform highp vec4 Colo;
varying highp vec3 xlv_COLOR;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = mix (xlv_COLOR, vec3((0.249997 * (
    (xlv_COLOR.x + xlv_COLOR.y)
   + xlv_COLOR.z))), vec3(_Grayed));
  highp vec4 tmpvar_3;
  tmpvar_3 = mix (tmpvar_2, transition_Color, vec4(transition_Mix));
  tmpvar_1 = (tmpvar_3 * Colo);
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesColor;
uniform highp mat4 glstate_matrix_mvp;
out highp vec3 xlv_COLOR;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = _glesColor.xyz;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform highp vec4 transition_Color;
uniform highp float _Grayed;
uniform highp vec4 Colo;
in highp vec3 xlv_COLOR;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = mix (xlv_COLOR, vec3((0.249997 * (
    (xlv_COLOR.x + xlv_COLOR.y)
   + xlv_COLOR.z))), vec3(_Grayed));
  highp vec4 tmpvar_3;
  tmpvar_3 = mix (tmpvar_2, transition_Color, vec4(transition_Mix));
  tmpvar_1 = (tmpvar_3 * Colo);
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Bind "vertex" ATTR0
Bind "color" ATTR1
ConstBuffer "$Globals" 64
Matrix 0 [glstate_matrix_mvp]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesColor [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float3 xlv_COLOR;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
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
ConstBuffer "$Globals" 64
Float 0 [transition_Mix]
Vector 16 [transition_Color]
Float 32 [_Grayed]
Vector 48 [Colo]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float3 xlv_COLOR;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
  float4 transition_Color;
  float _Grayed;
  float4 Colo;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  float4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = mix (_mtl_i.xlv_COLOR, float3((0.249997 * (
    (_mtl_i.xlv_COLOR.x + _mtl_i.xlv_COLOR.y)
   + _mtl_i.xlv_COLOR.z))), float3(_mtl_u._Grayed));
  float4 tmpvar_3;
  tmpvar_3 = mix (tmpvar_2, _mtl_u.transition_Color, float4(_mtl_u.transition_Mix));
  tmpvar_1 = half4((tmpvar_3 * _mtl_u.Colo));
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