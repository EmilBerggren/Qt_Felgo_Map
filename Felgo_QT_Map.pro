# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo

# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = "com.EB.Felgo_Weather_Qt_Project"
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "BBC310F0360F740E2871EFA0D0D861D92A8FB6195EC97732B329989EF983138F5664D34E8E623E8A1AEED12038C06B749890DBD6D5C22EF4ABE00E6431D7A6EA5CCF649241DC3BADC9504F13C095090CA71E885C8AE0AED9AD698789A737A7F9DA639068E4A9F4A1E178FABE5301216A321FB34E28FDF4F3EC44B8E1CF1E2523C695241AEB0D3FB1F8FFCC8CB612243CEAF5948974AB554FA6CE136945A3DEFF9A8B1A9A2D4334426ABADB6E78F6E8D671CF63202E9C87196E0BE77A41B2F55C470FF8DE1E3449D1F4DD1C644B5B3C50A83090F8A203BDC23095B10848037B60D96E961C9E36A75FD20740079D0CDEC70AE1DA7E808043310C116B1B11E09E445A7302A8C55410A86726CBFE4EF9EE15082193E319B5F38741D0E4ECB56512818519BE6EA31D5ED046E09F7C23D4B8C8"

QT += positioning location

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

RESOURCES += \ #    resources.qrc # uncomment for publishing
    resources.qrc \
    weatherinfo.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

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
    qml/Main.qml \
    qml/mapinfo.qml \
    qml/weatherinfo.qml \
    win/app_icon.ico \
    win/app_icon.rc
