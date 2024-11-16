
func make_arist(list_stations_id: Array) -> Array:
    var list_id_arist: Array = []
    for i in range(len(list_stations_id) - 1):
        if str(list_stations_id[i])[0] == str(list_stations_id[i + 1])[0]:
            list_id_arist.append(list_stations_id[i] * list_stations_id[i + 1])
        else:
            list_id_arist.append(list_stations_id[i] * list_stations_id[i + 1] * 100)
    return list_id_arist