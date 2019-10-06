import Felgo 3.0
import QtLocation 5.5
import QtPositioning 5.5
import QtQuick 2.5

App {
    id: main_app

    licenseKey: "BBC310F0360F740E2871EFA0D0D861D92A8FB6195EC97732B329989EF983138F5664D34E8E623E8A1AEED12038C06B749890DBD6D5C22EF4ABE00E6431D7A6EA5CCF649241DC3BADC9504F13C095090CA71E885C8AE0AED9AD698789A737A7F9DA639068E4A9F4A1E178FABE5301216A321FB34E28FDF4F3EC44B8E1CF1E2523C695241AEB0D3FB1F8FFCC8CB612243CEAF5948974AB554FA6CE136945A3DEFF9A8B1A9A2D4334426ABADB6E78F6E8D671CF63202E9C87196E0BE77A41B2F55C470FF8DE1E3449D1F4DD1C644B5B3C50A83090F8A203BDC23095B10848037B60D96E961C9E36A75FD20740079D0CDEC70AE1DA7E808043310C116B1B11E09E445A7302A8C55410A86726CBFE4EF9EE15082193E319B5F38741D0E4ECB56512818519BE6EA31D5ED046E09F7C23D4B8C8"

    property var selectedCoordinates: Location {
        coordinate: QtPositioning.coordinate(55.8391,
                                             13.3034)
    }

    signal updateCoords()

    Navigation
    {
        id: navigation_page

        NavigationItem {
            title: "Map"
            icon: IconType.streetview

            NavigationStack {
                Page {
                    id: map_page
                    property var coordinates
                    title: "Map page"

                    Loader {
                        id: mapLoader
                        source: "mapinfo.qml"
                        anchors.fill: parent
                        anchors.top: parent.top

                        onLoaded: {
                            mapLoader.item.objectName.c
                        }
                    }
                    Connections {
                        target: mapLoader.item
                        onNewCoordinatesSignal: {
                            selectedCoordinates.coordinate = QtPositioning.coordinate(longitude, latitude)
                            map_page.title = "lat: %1; lon:%2".arg
                                    (selectedCoordinates.coordinate.latitude).arg
                                    (selectedCoordinates.coordinate.longitude)
                        }
                    }
                }
            }
        }
        NavigationItem {
            title: "Weather"
            icon: IconType.tree
            NavigationStack {
                Page {
                    id: weather_page
                    title: "Weather page"

                    Loader {
                        id: weatherLoader
                        source: "weatherinfo.qml"
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                    }

                    Connections{
                        target: weatherLoader.item
                        onNewCoordinatesSignal: {
                            selectedCoordinates = QtPositioning.coordinate(longitude, latitude)
                            weather_page.title = "lat: %1; lon:%2".arg
                                        (selectedCoordinates.coordinate.latitude).arg
                                        (selectedCoordinates.coordinate.longitude)
                        }
                    }
                }
            }
        }
    }
}
