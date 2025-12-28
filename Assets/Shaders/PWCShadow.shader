Shader "MLP/MLPShadow" {
Properties {
 _MainTex ("Particle Texture", 2D) = "white" {}
 _InvFade ("Soft Particles Factor", Range(0.01,3)) = 1
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "color", Color
   Bind "texcoord", TexCoord
  }
  ZWrite Off
  Fog {
   Color (1,1,1,1)
  }
  Blend Zero SrcColor
Program "vp" {
SubProgram "gles " {
Keywords { "SOFTPARTICLES_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}



#endif
#ifdef FRAGMENT

uniform highp float transition_Mix;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 prev_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = (xlv_COLOR * texture2D (_MainTex, xlv_TEXCOORD0));
  prev_2 = tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = mix (vec4(1.0, 1.0, 1.0, 1.0), prev_2, vec4((1.0 - transition_Mix)));
  tmpvar_1 = tmpvar_4;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SOFTPARTICLES_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesColor;
in vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
out lowp vec4 xlv_COLOR;
out highp vec2 xlv_TEXCOORD0;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp float transition_Mix;
uniform sampler2D _MainTex;
in lowp vec4 xlv_COLOR;
in highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 prev_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = (xlv_COLOR * texture (_MainTex, xlv_TEXCOORD0));
  prev_2 = tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = mix (vec4(1.0, 1.0, 1.0, 1.0), prev_2, vec4((1.0 - transition_Mix)));
  tmpvar_1 = tmpvar_4;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "SOFTPARTICLES_OFF" }
Bind "vertex" ATTR0
Bind "color" ATTR1
Bind "texcoord" ATTR2
ConstBuffer "$Globals" 80
Matrix 0 [glstate_matrix_mvp]
Vector 64 [_MainTex_ST]
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
  half4 xlv_COLOR;
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = half4(_mtl_i._glesColor);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_COLOR = tmpvar_1;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "SOFTPARTICLES_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  tmpvar_1.xyw = o_3.xyw;
  tmpvar_1.z = -((glstate_matrix_modelview0 * _glesVertex).z);
  gl_Position = tmpvar_2;
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _ZBufferParams;
uniform highp float transition_Mix;
uniform sampler2D _MainTex;
uniform sampler2D _CameraDepthTexture;
uniform highp float _InvFade;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2.xyz = xlv_COLOR.xyz;
  mediump vec4 prev_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2DProj (_CameraDepthTexture, xlv_TEXCOORD1);
  highp float z_5;
  z_5 = tmpvar_4.x;
  highp float tmpvar_6;
  tmpvar_6 = (xlv_COLOR.w * clamp ((_InvFade * 
    ((1.0/(((_ZBufferParams.z * z_5) + _ZBufferParams.w))) - xlv_TEXCOORD1.z)
  ), 0.0, 1.0));
  tmpvar_2.w = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_2 * texture2D (_MainTex, xlv_TEXCOORD0));
  prev_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = mix (vec4(1.0, 1.0, 1.0, 1.0), prev_3, vec4((1.0 - transition_Mix)));
  tmpvar_1 = tmpvar_8;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SOFTPARTICLES_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX


in vec4 _glesVertex;
in vec4 _glesColor;
in vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp vec4 _MainTex_ST;
out lowp vec4 xlv_COLOR;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_2 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_2.zw;
  tmpvar_1.xyw = o_3.xyw;
  tmpvar_1.z = -((glstate_matrix_modelview0 * _glesVertex).z);
  gl_Position = tmpvar_2;
  xlv_COLOR = _glesColor;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
}



#endif
#ifdef FRAGMENT


layout(location=0) out mediump vec4 _glesFragData[4];
uniform highp vec4 _ZBufferParams;
uniform highp float transition_Mix;
uniform sampler2D _MainTex;
uniform sampler2D _CameraDepthTexture;
uniform highp float _InvFade;
in lowp vec4 xlv_COLOR;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2.xyz = xlv_COLOR.xyz;
  mediump vec4 prev_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = textureProj (_CameraDepthTexture, xlv_TEXCOORD1);
  highp float z_5;
  z_5 = tmpvar_4.x;
  highp float tmpvar_6;
  tmpvar_6 = (xlv_COLOR.w * clamp ((_InvFade * 
    ((1.0/(((_ZBufferParams.z * z_5) + _ZBufferParams.w))) - xlv_TEXCOORD1.z)
  ), 0.0, 1.0));
  tmpvar_2.w = tmpvar_6;
  lowp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_2 * texture (_MainTex, xlv_TEXCOORD0));
  prev_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = mix (vec4(1.0, 1.0, 1.0, 1.0), prev_3, vec4((1.0 - transition_Mix)));
  tmpvar_1 = tmpvar_8;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "metal " {
Keywords { "SOFTPARTICLES_ON" }
Bind "vertex" ATTR0
Bind "color" ATTR1
Bind "texcoord" ATTR2
ConstBuffer "$Globals" 160
Matrix 16 [glstate_matrix_mvp]
Matrix 80 [glstate_matrix_modelview0]
Vector 0 [_ProjectionParams]
Vector 144 [_MainTex_ST]
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
  half4 xlv_COLOR;
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
};
struct xlatMtlShaderUniform {
  float4 _ProjectionParams;
  float4x4 glstate_matrix_mvp;
  float4x4 glstate_matrix_modelview0;
  float4 _MainTex_ST;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  tmpvar_1 = half4(_mtl_i._glesColor);
  float4 tmpvar_2;
  float4 tmpvar_3;
  tmpvar_3 = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  float4 o_4;
  float4 tmpvar_5;
  tmpvar_5 = (tmpvar_3 * 0.5);
  float2 tmpvar_6;
  tmpvar_6.x = tmpvar_5.x;
  tmpvar_6.y = (tmpvar_5.y * _mtl_u._ProjectionParams.x);
  o_4.xy = (tmpvar_6 + tmpvar_5.w);
  o_4.zw = tmpvar_3.zw;
  tmpvar_2.xyw = o_4.xyw;
  tmpvar_2.z = -((_mtl_u.glstate_matrix_modelview0 * _mtl_i._glesVertex).z);
  _mtl_o.gl_Position = tmpvar_3;
  _mtl_o.xlv_COLOR = tmpvar_1;
  _mtl_o.xlv_TEXCOORD0 = ((_mtl_i._glesMultiTexCoord0.xy * _mtl_u._MainTex_ST.xy) + _mtl_u._MainTex_ST.zw);
  _mtl_o.xlv_TEXCOORD1 = tmpvar_2;
  return _mtl_o;
}

"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "SOFTPARTICLES_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SOFTPARTICLES_OFF" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "SOFTPARTICLES_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 4
Float 0 [transition_Mix]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  half4 xlv_COLOR;
  float2 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float transition_Mix;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  half4 prev_2;
  half4 tmpvar_3;
  tmpvar_3 = (_mtl_i.xlv_COLOR * _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0)));
  prev_2 = tmpvar_3;
  float4 tmpvar_4;
  tmpvar_4 = mix (float4(1.0, 1.0, 1.0, 1.0), (float4)prev_2, float4((1.0 - _mtl_u.transition_Mix)));
  tmpvar_1 = half4(tmpvar_4);
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "gles " {
Keywords { "SOFTPARTICLES_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SOFTPARTICLES_ON" }
"!!GLES3"
}
SubProgram "metal " {
Keywords { "SOFTPARTICLES_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_CameraDepthTexture] 2D 1
ConstBuffer "$Globals" 24
Vector 0 [_ZBufferParams]
Float 16 [transition_Mix]
Float 20 [_InvFade]
"metal_fs
#include <metal_stdlib>
using namespace metal;
struct xlatMtlShaderInput {
  half4 xlv_COLOR;
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD1;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float4 _ZBufferParams;
  float transition_Mix;
  float _InvFade;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _MainTex [[texture(0)]], sampler _mtlsmp__MainTex [[sampler(0)]]
  ,   texture2d<half> _CameraDepthTexture [[texture(1)]], sampler _mtlsmp__CameraDepthTexture [[sampler(1)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1;
  half4 tmpvar_2;
  tmpvar_2.xyz = _mtl_i.xlv_COLOR.xyz;
  half4 prev_3;
  half4 tmpvar_4;
  tmpvar_4 = _CameraDepthTexture.sample(_mtlsmp__CameraDepthTexture, ((float2)(_mtl_i.xlv_TEXCOORD1).xy / (float)(_mtl_i.xlv_TEXCOORD1).w));
  float z_5;
  z_5 = float(tmpvar_4.x);
  float tmpvar_6;
  tmpvar_6 = ((float)_mtl_i.xlv_COLOR.w * clamp ((_mtl_u._InvFade * 
    ((1.0/(((_mtl_u._ZBufferParams.z * z_5) + _mtl_u._ZBufferParams.w))) - _mtl_i.xlv_TEXCOORD1.z)
  ), 0.0, 1.0));
  tmpvar_2.w = half(tmpvar_6);
  half4 tmpvar_7;
  tmpvar_7 = (tmpvar_2 * _MainTex.sample(_mtlsmp__MainTex, (float2)(_mtl_i.xlv_TEXCOORD0)));
  prev_3 = tmpvar_7;
  float4 tmpvar_8;
  tmpvar_8 = mix (float4(1.0, 1.0, 1.0, 1.0), (float4)prev_3, float4((1.0 - _mtl_u.transition_Mix)));
  tmpvar_1 = half4(tmpvar_8);
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
}
 }
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "color", Color
   Bind "texcoord", TexCoord
  }
  ZWrite Off
  Fog {
   Color (1,1,1,1)
  }
  Blend Zero SrcColor
  SetTexture [_MainTex] { combine texture * primary }
  SetTexture [_MainTex] { ConstantColor (1,1,1,1) combine previous lerp(previous) constant }
 }
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "color", Color
   Bind "texcoord", TexCoord
  }
  ZWrite Off
  Fog {
   Color (1,1,1,1)
  }
  Blend Zero SrcColor
  SetTexture [_MainTex] { ConstantColor (1,1,1,1) combine texture lerp(texture) constant }
 }
}
}