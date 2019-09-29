

/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.0
import "qrc:///components"

//! [0]
import WeatherInfo 1.0
import QtPositioning 5.5

Item {
    id: window
    //! [0]
    width: 360
    height: 640

    property var latitude_longitude_coords: Location {
        coordinate: QtPositioning.coordinate(55.8391,
                                             13.3034)
    }
    property var player_has_selected_place_on_map: false

    signal newCoordinatesSignal(double longitude, double latitude)

    function update_coordinates(longitude, latitude) {
        latitude_longitude_coords = QtPositioning.coordinate(longitude, latitude)
        //model.findCity(55.8391198,13.3033914)
        model.findCity(longitude, latitude)
    }

    state: "loading"

    states: [
        State {
            name: "loading"
            PropertyChanges {
                target: main
                opacity: 0
            }
            PropertyChanges {
                target: wait
                opacity: 1
            }
        },
        State {
            name: "ready"
            PropertyChanges {
                target: main
                opacity: 1
            }
            PropertyChanges {
                target: wait
                opacity: 0
            }
        }
    ]
    //! [1]
    AppModel {
        id: model
        onReadyChanged: {
            if (model.ready)
                window.state = "ready"
            else
                window.state = "loading"
        }
    }
    //! [1]
    Item {
        id: wait
        anchors.fill: parent

        Text {
            text: "Loading weather data..."
            anchors.centerIn: parent
            font.pointSize: 18
        }
    }

    Item {
        id: main
        anchors.fill: parent

        Column {
            spacing: 20

            anchors {
                fill: parent
                topMargin: 6
                bottomMargin: 6
                leftMargin: 6
                rightMargin: 6
            }

            Row {
                spacing: 5

                Rectangle {
                    width: main.width / 10
                    height: main.height / 15
                    color: "white"
                    border.color: "black"
                    border.width: 2
                    radius: 10

                    Text {
                        id: city_text_eslov
                        text: "Eslöv"
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (model.useGps) {
                                model.useGps = false
                                model.city = "Eslöv"
                            } else {
                                city_text_eslov.text = "Eslöv"
                                model.useGps = true
                                model.city = "Eslöv"
                            }
                        }
                    }
                }

                Rectangle {
                    width: main.width / 10
                    height: main.height / 15
                    color: "white"
                    border.color: "black"
                    border.width: 2
                    radius: 10

                    Text {
                        id: city_text_jkp
                        text: "Jönköping"
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (model.useGps) {
                                model.useGps = false
                                model.city = "Jönköping"
                            } else {
                                city_text_jkp.text = "Jönköping"
                                model.useGps = true
                                model.city = "Jönköping"
                            }
                        }
                    }
                }
                Rectangle {
                    width: main.width / 10
                    height: main.height / 15
                    color: "white"
                    border.color: "black"
                    border.width: 2
                    radius: 10

                    Text {
                        id: city_text_gothenburg
                        text: "Göteborg"
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (model.useGps) {
                                model.useGps = false
                                model.city = "Göteborg"
                            } else {
                                city_text_gothenburg.text = "Göteborg"
                                model.useGps = true
                                model.city = "Göteborg"
                            }
                        }
                    }
                }
                Rectangle {
                    width: main.width / 10
                    height: main.height / 15
                    color: "white"
                    border.color: "black"
                    border.width: 2
                    radius: 10

                    Text {
                        id: city_text_oslo
                        text: "Oslo"
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (model.useGps) {
                                model.useGps = false
                                model.city = "Oslo"
                            } else {
                                city_text_oslo.text = "Oslo"
                                model.useGps = true
                                model.city = "Oslo"
                            }
                        }
                    }
                }
                Rectangle {
                    id: user_selected_position_on_map_textbox
                    width: main.width / 3.5
                    height: main.height / 15
                    color: "white"
                    border.color: "black"
                    border.width: 2
                    radius: 10

                    Text {
                        id: selected_city_text
                        text: "{Select a place on map}"
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.right: parent.right
                    }
                    MouseArea {

                        anchors.fill: parent
                        onClicked: {
                            if(player_has_selected_place_on_map == true)
                            {
                                user_selected_position_on_map_textbox.width = main.width/10
                                if (model.useGps) {
                                    model.useGps = false
                                    model.findCity(13.3033914, 55.8391198)
                                    model.city = model.getCurrentSelectedCityName()
                                } else {
                                    selected_city_text.text = model.getCurrentSelectedCityName()
                                    model.useGps = true
                                    model.city = "??"
                                    //model.queryCity()
                                    //model.findCity(13.3033914, 55.8391198)

                                }
                                newCoordinatesSignal( model.getLongitude(), model.getLatitude())
                            }
                        }
                    }
                }
                Rectangle {
                    width: (main.width /10)*2
                    height: window.height / 15
                    color: "white"
                    border.color: "black"
                    border.width: 2
                    radius: 10

                    Text {
                        text: "??"
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (model.useGps) {
                                model.useGps = false
                                model.city = "Brisbane"
                            } else {
                                switch (model.city) {
                                case "Brisbane":
                                    model.city = "Oslo"
                                    break
                                case "Oslo":
                                    model.city = "Helsinki"
                                    break
                                case "Helsinki":
                                    model.city = "New York"
                                    break
                                case "New York":
                                    model.useGps = true
                                    break
                                }
                            }
                        }
                    }
                }
            }
            Rectangle {
                width: main.width - 12
                height: 5
                color: "black"
            }
            Rectangle {
                width: main.width - 12
                height: window.height / 15
                color: "white"
                border.color: "black"
                border.width: 2
                radius: 10

                Text {
                    text: "Selected city: " + (model.hasValidCity ? model.city : "Unknown location")
                          + (model.useGps ? " (GPS)" : "")
                    font.pointSize: 22
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            //! [3]
            BigForecastIcon {
                id: current

                width: main.width - 12
                height: 2 * (main.height - 25 - 12) / 3

                weatherIcon: (model.hasValidWeather ? model.weather.weatherIcon : "01d")
                //! [3]
                topText: (model.hasValidWeather ? model.weather.temperature : "??")
                bottomText: (model.hasValidWeather ? model.weather.weatherDescription : "No weather data")

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        model.refreshWeather()
                    }
                }
                //! [4]
            }

            //! [4]
            Rectangle {
                width: main.width - 12
                height: 5
                color: "black"
            }

            Row {
                id: iconRow
                spacing: 6
                width: main.width - 12
                height: (main.height - 25 - 24) / 3

                property real iconWidth: iconRow.width / 4 - 10
                property real iconHeight: iconRow.height

                ForecastIcon {
                    id: forecast1
                    width: iconRow.iconWidth
                    height: iconRow.iconHeight

                    topText: (model.hasValidWeather ? model.forecast[0].dayOfWeek : "??")
                    bottomText: (model.hasValidWeather ? model.forecast[0].temperature : "??/??")
                    weatherIcon: (model.hasValidWeather ? model.forecast[0].weatherIcon : "01d")
                }
                ForecastIcon {
                    id: forecast2
                    width: iconRow.iconWidth
                    height: iconRow.iconHeight

                    topText: (model.hasValidWeather ? model.forecast[1].dayOfWeek : "??")
                    bottomText: (model.hasValidWeather ? model.forecast[1].temperature : "??/??")
                    weatherIcon: (model.hasValidWeather ? model.forecast[1].weatherIcon : "01d")
                }
                ForecastIcon {
                    id: forecast3
                    width: iconRow.iconWidth
                    height: iconRow.iconHeight

                    topText: (model.hasValidWeather ? model.forecast[2].dayOfWeek : "??")
                    bottomText: (model.hasValidWeather ? model.forecast[2].temperature : "??/??")
                    weatherIcon: (model.hasValidWeather ? model.forecast[2].weatherIcon : "01d")
                }
                ForecastIcon {
                    id: forecast4
                    width: iconRow.iconWidth
                    height: iconRow.iconHeight

                    topText: (model.hasValidWeather ? model.forecast[3].dayOfWeek : "??")
                    bottomText: (model.hasValidWeather ? model.forecast[3].temperature : "??/??")
                    weatherIcon: (model.hasValidWeather ? model.forecast[3].weatherIcon : "01d")
                }
            }
        }
    }
    //! [2]
}//! [2]

