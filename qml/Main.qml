import Felgo 3.0
import QtLocation 5.5
import QtPositioning 5.5
import QtQuick 2.5

App {
    id: main_app

    licenseKey: "57EC4122B98575ED7DEA06583353CD2843735F7F66488F61D240
                1C6F021E4816C664FA4A5DC9F71E017F9C5943600139688290C21666BB607A1C72E791C034A
                F33D0643A80DFC28076F89D20D2C8DD045E32AB8813DE60E8FEBFA4A7DC25BA61EAE66C215B
                DC56C02C5FCC21DA49245D8D25A085240514298DAEA122294BC03A0EB17DE47ECC99C140CF6
                FC2ECC4B26CE0DA24B1CF02EB0AA8E0CC0368B40BFAE50F88A31B7A0788636E3024E72577B9
                AF75DA52457928E0678DD5C35CE9F556F2F6CD0F0081C96E5E1FB78C6D48DFF0AADEA32959F
                312331E5F00916952DF5969E89D2E52C026364CAAFA9F10849FD4D4EE8F1EE1ECC998D6E870
                02C62354FC56B781166A1B5506E3F4E91C01D4D91787F1B0920265BB12CEF648E9B87D6E7E"

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
