import Felgo 3.0
import QtQuick 2.0
import QtPositioning 5.5
import QtLocation 5.5

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    Page {
        title: qsTr("Main Page")

        AppMap {
            anchors.fill: parent

            // configure plugin for displaying map here
            // see http://doc.qt.io/qt-5/qtlocation-index.html#plugin-references-and-parameters
            // for a documentation of possible Location Plugins
            plugin: Plugin {
                name: "<plugin-name>" // e.g. mapbox, ...
                parameters: [
                    // set required plugin parameters here
                ]
            }

            // Center map to Vienna, AT
            center: QtPositioning.coordinate(48.208417, 16.372472)
            zoomLevel: 13
        }

    }
}