Shader "Lesson/Albedo"
{
	//The public properties seen on the material 
	Properties
	{
		_Texture("Texture", 2D) = "black"{} 
		// Varible name is _Texture
		// Our display names is Texture
		// It is of type 2D 
		// The default untextured colour is black

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
	struct Input
	{
		float2 uv_Texture; // This references the UV Map of the model
	};
	void MainColour(Input IN, inout SurfaceOutput o)
	{
		o.Albedo = tex2D(_Texture, IN.uv_Texture).rgb; // Albedo references the surface image and RGB of the model 
	}
	ENDCG // This is the end of the C for Graphics Language 
} 
FallBack "Diffuse" // If it doesnt work it will fall back on this 
}