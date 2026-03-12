// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unity Shaders Book/Chapter 5/Shader01" {
	Properties {
		//����һ��Color���͵�����
		_Color ("Color Tint", Color) = ( 1.0, 1.0, 1.0, 1.0 )
	}
	SubShader {
		Pass {
			CGPROGRAM
			// Upgrade NOTE: excluded shader from DX11; has structs without semantics (struct v2f members pos)
			#pragma exclude_renderers d3d11
			#pragma vertex vert
			#pragma fragment frag
			//��CG����У� ������Ҫ����һ�����������ƺ����Ͷ�ƥ��ı���
			fixed4 _Color;

			struct a2v{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord: TEXCOORDO;
			};
			struct v2f {
				float4 pos : SV POSITION;
				fixed3 color : COLORO;
			};

			v2f vert(a2v v) {
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
				return o;
			}

			fixed4 frag(v2f i) : SV_Target {
				fixed3 c = i. color;
				//ʹ��_Color���������������ɫ
				c *= _Color.rgb;
				return fixed4(c, 1.0);
			}

			ENDCG 	
		}
	}
}