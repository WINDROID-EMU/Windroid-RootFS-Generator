PKG_VER="GE-Proton8-27"
PKG_CATEGORY="Wine"
PKG_PRETTY_NAME="Wine Proton ($PKG_VER)"
PKG_NEED_AUTORECONF=true

BLACKLIST_ARCH=aarch64

# Fork do Wine com os patches do Proton
GIT_URL="https://github.com/GloriousEggroll/wine-ge-custom.git"
GIT_COMMIT="GE-Proton8-27"

HOST_BUILD_FOLDER="$INIT_DIR/workdir/$package/wine-tools"
HOST_BUILD_CONFIGURE_ARGS="--enable-win64 --without-x"
HOST_BUILD_MAKE="make -j$(nproc) __tooldeps__ nls/all"

OVERRIDE_PREFIX="$(realpath $PREFIX/../wine-proton)"

CONFIGURE_ARGS="--enable-archs=i386,x86_64 \
                --host=$TOOLCHAIN_TRIPLE \
                --with-wine-tools=$HOST_BUILD_FOLDER \
                --prefix=$OVERRIDE_PREFIX \
                --without-oss \
                --disable-winemenubuilder \
                --disable-win16 \
                --disable-tests \
                --with-x \
                --x-libraries=$PREFIX/lib \
                --x-includes=$PREFIX/include \
                --with-pulse \
                --with-gstreamer \
                --with-opengl \
                --with-gnutls \
                --with-mingw=gcc \
                --with-xinput \
                --with-xinput2 \
                --enable-nls \
                --without-xshm \
                --without-xxf86vm \
                --without-osmesa \
                --without-usb \
                --without-sdl \
                --without-cups \
                --without-netapi \
                --without-pcap \
                --without-gphoto \
                --without-v4l2 \
                --without-pcsclite \
                --without-wayland \
                --without-opencl \
                --without-dbus \
                --without-sane \
                --without-udev \
                --without-capi"
