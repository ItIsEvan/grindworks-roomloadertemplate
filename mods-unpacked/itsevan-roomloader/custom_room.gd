extends FacilityRoom
class_name FacilityRoomCustom

enum RoomType {
	BATTLE,
	OBSTACLE,
	SPECIAL,
	BOSS,
}
@export var room_type := RoomType.BATTLE

enum RoomDept {
	SELL,
	CASH,
	LAW,
	BOSS,
	MOLTEN,
}
@export var room_dept := RoomDept.SELL

const ROOM_MAPPING: Dictionary[RoomDept, String] = {
	RoomDept.SELL: "res://scenes/game_floor/department_floors/rooms_sell.tres",
	RoomDept.CASH: "res://scenes/game_floor/department_floors/rooms_cash.tres",
	RoomDept.LAW: "res://scenes/game_floor/department_floors/rooms_law.tres",
	RoomDept.BOSS: "res://scenes/game_floor/department_floors/rooms_boss.tres",
	RoomDept.MOLTEN: "res://scenes/game_floor/department_floors/rooms_molten.tres",
}

const ROOM_ARRAYS: Dictionary[RoomType, String] = {
	RoomType.BATTLE: "battle_rooms",
	RoomType.OBSTACLE: "obstacle_rooms",
	RoomType.SPECIAL: "special_rooms",
	RoomType.BOSS: "final_rooms",
}

func setup() -> void:
	Util.s_floor_started.connect(inject_room)

func inject_room(game_floor: GameFloor) -> void:
	var department_floor: DepartmentFloor = game_floor.floor_variant.floor_type
	if not department_floor.resource_path == ROOM_MAPPING[room_dept]: return
	var room_array: Array[FacilityRoom] = department_floor.get(get_array_name())
	if not self in room_array:
		room_array.append(self)
		department_floor.set(get_array_name(), room_array)

func get_array_name() -> String:
	return ROOM_ARRAYS[room_type]
