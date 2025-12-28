Shader "Unlit/DiscoFloor" {
Properties {
 resolution ("resolution", Float) = 1
 tex ("tex", 2D) = "white" {}
}
SubShader { 
 Tags { "RenderType"="Opaque" }
 Pass {
  Tags { "RenderType"="Opaque" }
Program "vp" {
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _Time;
uniform highp float resolution;
uniform sampler2D tex;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 s_2;
  highp vec2 tmpvar_3;
  tmpvar_3 = (abs((xlv_TEXCOORD0 - 0.5)) * resolution);
  highp vec2 tmpvar_4;
  tmpvar_4 = fract(tmpvar_3);
  highp float tmpvar_5;
  tmpvar_5 = (1.0 - (dot (
    (tmpvar_4 - 0.5)
  , 
    (tmpvar_4 - 0.5)
  ) * 2.0));
  highp vec2 tmpvar_6;
  tmpvar_6.y = 0.5;
  tmpvar_6.x = (-1.0 + (2.0 * fract(
    (sin(dot ((
      (floor(tmpvar_3) / resolution)
     + 
      (_Time.x * 0.01233)
    ), vec2(12.1, 31.7))) * 43.5453)
  )));
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (tex, tmpvar_6);
  s_2 = tmpvar_7;
  tmpvar_1 = (s_2 * tmpvar_5);
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp vec4 _Time;
uniform highp float resolution;
uniform sampler2D tex;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 s_2;
  highp vec2 tmpvar_3;
  tmpvar_3 = (abs((xlv_TEXCOORD0 - 0.5)) * resolution);
  highp vec2 tmpvar_4;
  tmpvar_4 = fract(tmpvar_3);
  highp float tmpvar_5;
  tmpvar_5 = (1.0 - (dot (
    (tmpvar_4 - 0.5)
  , 
    (tmpvar_4 - 0.5)
  ) * 2.0));
  highp vec2 tmpvar_6;
  tmpvar_6.y = 0.5;
  tmpvar_6.x = (-1.0 + (2.0 * fract(
    (sin(dot ((
      (floor(tmpvar_3) / resolution)
     + 
      (_Time.x * 0.01233)
    ), vec2(12.1, 31.7))) * 43.5453)
  )));
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture (tex, tmpvar_6);
  s_2 = tmpvar_7;
  tmpvar_1 = (s_2 * tmpvar_5);
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
ConstBuffer "$Globals" 64
Matrix 0 [glstate_matrix_mvp]
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
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
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
SetTexture 0 [tex] 2D 0
ConstBuffer "$Globals" 20
Vector 0 [_Time]
Float 16 [resolution]
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
  float4 _Time;
  float resolution;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> tex [[texture(0)]], sampler _mtlsmp_tex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  float4 s_2;
  float2 tmpvar_3;
  tmpvar_3 = (abs((_mtl_i.xlv_TEXCOORD0 - 0.5)) * _mtl_u.resolution);
  float2 tmpvar_4;
  tmpvar_4 = fract(tmpvar_3);
  float tmpvar_5;
  tmpvar_5 = (1.0 - (dot (
    (tmpvar_4 - 0.5)
  , 
    (tmpvar_4 - 0.5)
  ) * 2.0));
  float2 tmpvar_6;
  tmpvar_6.y = 0.5;
  tmpvar_6.x = (-1.0 + (2.0 * fract(
    (sin(dot ((
      (floor(tmpvar_3) / _mtl_u.resolution)
     + 
      (_mtl_u._Time.x * 0.01233)
    ), float2(12.1, 31.7))) * 43.5453)
  )));
  half4 tmpvar_7;
  tmpvar_7 = tex.sample(_mtlsmp_tex, (float2)(tmpvar_6));
  s_2 = float4(tmpvar_7);
  tmpvar_1 = half4((s_2 * tmpvar_5));
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
}
 }
}
}