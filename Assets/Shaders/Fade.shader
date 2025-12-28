Shader "Custom/Fade" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
}
SubShader { 
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
uniform highp mat4 glstate_matrix_mvp;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _Color;
void main ()
{
  gl_FragData[0] = _Color;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
uniform highp mat4 glstate_matrix_mvp;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform lowp vec4 _Color;
void main ()
{
  _glesFragData[0] = _Color;
}



#endif"
}
SubProgram "metal " {
Bind "vertex" ATTR0
ConstBuffer "$Globals" 64
Matrix 0 [glstate_matrix_mvp]
"metal_vs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
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
ConstBuffer "$Globals" 8
VectorHalf 0 [_Color] 4
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 _Color;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o._glesFragData_0 = _mtl_u._Color;
  return _mtl_o;
}

"
}
}
 }
}
}