# itsevan-roomloader
This mod allows creators to easily inject custom rooms into any of the game's facilities. Before using, please be sure to change the mod's attributes.

## How to Use:
Rooms are created in the Godot Editor. In your mod hierarchy, you may create whatever folder structure you want, aside from changing the custom_rooms folder. This is the folder all of your FacilityRoomCustom resources should be placed. The actual room scenes should go elsewhere. FacilityRoomCustom comes with many customizable attributes to determine the room should appear in, and the type of room it should appear as. This template should also make the boilerplate of creating custom end-floor bosses much easier to manage, as Boss rooms are a type that you can inject.

WORTH NOTING: Room rarity weight is averaged at 1.0. Making it much higher than that will make your room incredibly common. Practically guaranteed at 100.0.
