Chase Mattin
Owen Wysotski
Zach Smith
Introduction to Computer Graphics
October 28, 2026
# Neon Corridor Project Progression
### Links
Project Proposal: https://docs.google.com/document/d/1nY8wNJjN0V3iCF9_hjmiiyZWqwSkvFXlV2LUC_ktMDI/edit?tab=t.0
Project Progression Reflection: https://docs.google.com/document/d/1ZLY-dAUMpGcXDongo00kzRv0cSQDzoidylNby9VjsXA/edit?tab=t.0
Video Report:
https://youtu.be/NJyrY1ymPZ8

## Base
### Dynamic Game Objects
![App Screenshot](untitiled.png)
The barstools in the scene are physics bodies. They are dynamic in that they can be moved by colliding with the player and other physics bodies.
### Playable Character
The playable character is a capsule with a first person camera. The camera is controlled with mouse movement and the player is controlled with WASD or arrow keys.
### Game Objects

Neon Corridor includes custom 3D meshes for the doors, the lights, and the hallway itself. Each of these is a separate mesh object in the engine. The sleek metallic doors and neon lights suit the game’s cyberpunk theme.

There’s also this very mysterious button. This is also a custom model. What does it do?
### Win/Lose Condition

Oh…that’s what it does. Since Neon Corridor is a walking simulator, we originally didn’t see the need for a true Win/Lose condition. We added this button to meet the requirement, but if it isn’t necessary for the final project, it likely won’t make it in.
Visual Style
The aesthetic is cyberpunk-inspired and is relatively realistic. This suits the scene as it mirrors the planned style for our year-long game, which has a serious, gritty tone. The meshes, colours, and textures are designed to be grounded in their lighting and proportions.
## Illumination
### Simple Diffuse


We implemented diffuse lighting using Godot’s visual shaders. We used the equations learned in class to replicate the effect. This greatly improves the realism of the lighting in our scene and especially gives depth to rougher objects that don’t have much shine to them.
### Diffuse + Ambient

Godot’s shader language doesn’t have any functions that would allow us to calculate ambient light manually. The only way to use ambient light is to add render mode flags that are applied at compile time, so it was a challenge to work around this. Our solution was to compile two separate shaders both with and without ambient light enabled, and swap between the two shaders when toggled. Although this is an indoor space, it benefits from ambient lighting since the walls are so close together. With a room packed this tightly with light sources, it makes sense that the room would have some ambient light bouncing around. This also helps to make the room appear well-lit.
### Specular


This adds some much-needed reflectiveness to the game objects that would generally be expected to be glossy. This includes the barstools’ fake leather seats and metal bases, as well as the door handles.
### Diffuse Wrap


To implement diffuse wrapping, we did some research to find out how to modify the diffuse formula from class to add a wrap coefficient, and adjusted the simple diffuse shader. This effect allows the diffuse light to wrap around an object past the terminator line. This adds to the realism we are going for and fits this scene much better because it simulates the light that comes from different angles due to the many light sources.
Emission

Emissive textures in godot require color values that extend past the value of 1, as well as settings in the scene’s WorldEnvironment node to be changed to be able to display bloom. Without these, this project would just be called “Corridor”. The emission effect makes the light fixtures look like they’re actually glowing and emitting light. This effect heavily contributes to the scene’s cyberpunk feel.
All Effects Enabled

## Colour Grading
### Warm Lookup Table

This is the first colour grade applied to the scene. The Lookup Table was made in Photoshop by putting a warm colour filter over the original scene, cranking up the hue and saturation values, and exporting the image as a Lookup Table.
### Cool Lookup Table

### This Lookup Table was made in Photoshop again by putting a cool colour filter over the original scene, turning down the hue and saturation values, and exporting the image as a Lookup Table. These colour grades were added to Godot by putting the png files into the WorldEnvironment’s Color Correction.
Custom Lookup Table (Monochrome)

This Lookup Table was made by adding a monochrome filter, turning down the hue value, turning up the saturation, and exporting the image as a Lookup Table.
## Shaders and Effects
### X-Ray


To create this effect, you must add a new shader to the object as an added overlay, and invert its depth test so that the only part of it that renders is the part that is behind other objects. You need to also set proper stencil references, so that the multiple meshes that make up the barstools don’t get blocked by each other. Then, you return a single color for every pixel rendered this way. This effect makes the coloured silhouette of specific objects visible through other objects. In the future, this will contribute to the project by helping the player find interactables that may be too understated to find easily.
### Rim Lighting


This rim lighting effect was again created by adapting the calculations shown in class to work inside of godot’s own shader language. This is used in this case to highlight interactable objects when the camera is looking at them directly. This gives players some much-needed feedback to help them identify which objects are actually dynamic.
### Normal Mapping


This effect was applied to the barstool model in Substance Painter and exported as a png. This makes the mesh itself appear more detailed without increasing its actual polygon count. This is especially effective since it is applied to a moving object, allowing these false details to react dynamically to the environment’s lighting.
### Metallicity and Roughness Mapping


Our implementation of metallic and roughness mapping both differ from the one in class, because it also multiplies the sampled value by a float. This means that the same shader can both be applied to objects with and without metallic and roughness maps, while still being able to modify their metallic and roughness values for all surfaces, or even modify the values from the maps. Again, this effect was also applied to the barstool model in Substance Painter. Metallicity and roughness mapping allows for precise control of these attributes beyond a slider or a simple algorithm. These make the object look more realistic, which contributes to our overall goal of realism.
