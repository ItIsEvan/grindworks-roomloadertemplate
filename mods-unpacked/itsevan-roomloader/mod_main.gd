extends Node

## CHANGE THESE FOR YOUR MOD!!!!!
const ROOM_LOADER_DIR := "itsevan-roomloader"
const ROOM_LOADER_LOG := "itsevan-roomloader:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""
var rooms : Array[FacilityRoom] = []

func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(ROOM_LOADER_LOG)

func _ready() -> void:
	ModLoaderLog.info("Ready!", ROOM_LOADER_LOG)
	load_rooms()

func load_rooms() -> void:
	for file in DirAccess.get_files_at(get_rooms_path()):
		var custom_room : Resource = ResourceLoader.load(get_rooms_path() + file)
		if custom_room is FacilityRoom and custom_room.has_method('setup'):
			rooms.append(custom_room)
			custom_room.setup()
			ModLoaderLog.info("Successfully loaded room at: %s" % file, ROOM_LOADER_LOG)
		else:
			ModLoaderLog.error("File %s in custom rooms folder not a Custom Facility Room" % file, ROOM_LOADER_LOG)

func get_rooms_path() -> String:
	return ModLoaderMod.get_unpacked_dir().path_join(ROOM_LOADER_DIR + "/custom_rooms/")
