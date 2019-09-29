# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = FelgoQTMap
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = ""

QT += positioning location

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

RESOURCES += \ #    resources.qrc # uncomment for publishing
    resources.qrc \
    weatherinfo.qrc

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    appmodel.cpp


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}

HEADERS += \
    appmodel.h \
    main.h

SUBDIRS += \
    weatherinfo.pro \
    weatherinfo.pro

DISTFILES += \
    android/res/drawable-hdpi/ic_launcher.png \
    android/res/drawable-mdpi/ic_launcher.png \
    android/res/drawable-xhdpi/ic_launcher.png \
    android/res/drawable-xxhdpi/ic_launcher.png \
    android/res/values/strings.xml \
    android/res/xml/file_paths.xml \
    components/BigForecastIcon.qml \
    components/ForecastIcon.qml \
    components/WeatherIcon.qml \
    icons/README.txt \
    icons/qt_attribution.json \
    icons/weather-few-clouds.png \
    icons/weather-fog.png \
    icons/weather-haze.png \
    icons/weather-icy.png \
    icons/weather-overcast.png \
    icons/weather-showers.png \
    icons/weather-sleet.png \
    icons/weather-snow.png \
    icons/weather-storm.png \
    icons/weather-sunny-very-few-clouds.png \
    icons/weather-sunny.png \
    icons/weather-thundershower.png \
    ios/Assets.xcassets/AppIcon.appiconset/Contents.json \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x-1.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x-1.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x-1.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@3x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png \
    ios/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png \
    ios/Assets.xcassets/AppIcon.appiconset/ItunesArtwork@2x.png \
    ios/Assets.xcassets/Contents.json \
    ios/Assets.xcassets/LaunchImage.launchimage/Contents.json \
    ios/Assets.xcassets/LaunchImage.launchimage/Default1125x2436.png \
    ios/Assets.xcassets/LaunchImage.launchimage/Default1242x2208.png \
    ios/Assets.xcassets/LaunchImage.launchimage/Default1536x2048.png \
    ios/Assets.xcassets/LaunchImage.launchimage/Default2048x1536.png \
    ios/Assets.xcassets/LaunchImage.launchimage/Default2208x1242.png \
    ios/Assets.xcassets/LaunchImage.launchimage/Default2436x1125.png \
    ios/Assets.xcassets/LaunchImage.launchimage/Default640x1136.png \
    ios/Assets.xcassets/LaunchImage.launchimage/Default640x960.png \
    ios/Assets.xcassets/LaunchImage.launchimage/Default750x1334.png \
    ios/Assets.xcassets/LaunchImage.launchimage/Default768x1024.png \
    qml/mapinfo.qml \
    weatherinfo.qml \
    win/app_icon.ico \
    win/app_icon.rc
