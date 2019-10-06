import Felgo 3.0
import QtLocation 5.5
import QtPositioning 5.5
import QtQuick 2.5
import QtQuick.Controls 2.5

Item{
    id: mapinfo
    signal newCoordinatesSignal(double longitude, double latitude)

    AppMap {
        id: map

        anchors.fill: parent
        center: QtPositioning.coordinate(55.8391, 13.3034)

        plugin: Plugin {
            name: "mapbox"
            // configure your own map_id and access_token here
            parameters: [
                PluginParameter {
                    name: "mapbox.mapping.map_id"
                    value: "mapbox.streets"
                },
                PluginParameter {
                    name: "mapbox.access_token"
                    value: "pk.eyJ1IjoiZ3R2cGxheSIsImEiOiJjaWZ0Y2pkM2cwMXZqdWVsenJhcGZ3ZDl5In0.6xMVtyc0CkYNYup76iMVNQ"
                },
                PluginParameter {
                    name: "mapbox.mapping.highdpi_tiles"
                    value: true
                }
            ]
        }

        Label {
            id: instructions_label

            text: "Hint: Press somewhere on the map"
            color: "steelblue"
            font.pixelSize: 22
            font.italic: true
        }

        MapCircle {
            id: marker
            center {
                latitude: 0
                longitude: 0
            }
            radius: 1500.0
            color: 'transparent'
            border.width: 2
            border.color: "steelblue"
            visible: false
        }

        MouseArea {
            anchors.fill: map //parent

            property var player_selected_coordinates: Location {
                coordinate: QtPositioning.coordinate(55.8391,
                                                     13.3034)
            } //Coordinates of Eslöv

            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                if (mouse.button == Qt.RightButton || mouse.button == Qt.LeftButton) {
                    marker.center = map.toCoordinate(Qt.point(mouse.x, mouse.y))
                    marker.visible = true

                    player_selected_coordinates.coordinate = map.toCoordinate(
                                Qt.point(mouse.x, mouse.y))
                    map_page.coordinates = "hey"
                    //map_page.title = "lat: %1; lon:%2".arg
                    //        (player_selected_coordinates.coordinate.latitude).arg
                    //        (player_selected_coordinates.coordinate.longitude)
                    newCoordinatesSignal(player_selected_coordinates.coordinate.longitude, player_selected_coordinates.coordinate.latitude);
                    instructions_label.visible = false
            }
        }
    }
}
}
