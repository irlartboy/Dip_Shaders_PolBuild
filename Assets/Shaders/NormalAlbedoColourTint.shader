Shader "Lesson/Normal Albedo Colour Tint"
{
	//The public properties seen on the material 
	Properties
	{
		_Texture("Texture", 2D) = "black"{} 
		// Varible name is _Texture
		// Our display names is Texture
		// It is of type 2D 
		// The default untextured colour is black
		_NormalMap("Normal", 2D) = "bump"{} // uses rbg colours to create xyz depths on the material 
		_Colour("Tint", Color) =(0,0,0,0)
	}
	// Can have multiple SubShader
	// These can run at different GPU levels on different platfroms 
	SubShader 
	{
		Tags
		{
			"RenderType" = "Opaque"
			// Tags are key value pairs
			// inside a subshader tags are used to determine rendering orderand other parameters 

			// REnderType tag catergirses shaders into several predefined groups
		}
	
	CGPROGRAM // This is the start of the C for Graphics Language
	#pragma surface MainColour Lambert
	// The surface of the model is affected by the mainColour function
	// Lambert is a flat material that has no shine or reflection 
	sampler2D _Texture; // this connects the texure varible in the properties sections  
	sampler2D _NormalMap; // Connects the normalmpa varible in the properties sections
	fixed4 _Colour; // 
	struct Input
	{
		float2 uv_Texture; // This references the UV Map of the model
		float2 uv_NormalMap;
	};
	void MainColour(Input IN, inout SurfaceOutput o)
	{
		o.Albedo = tex2D(_Texture, IN.uv_Texture).rgb * _Colour; // Albedo references the surface image and RGB of the model 
		o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap)); // Unpack is required because trhe file is compressed 
	}
	
	ENDCG // This is the end of the C for Graphics Language 
} 
FallBack "Diffuse" // If it doesnt work it will fall back on this 
}