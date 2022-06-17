# Maintainer: Kainoa Kanter <alsheikhAminulislam@gmail.com>
# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=supreme-discord-rpc

pkgname="${_pkgname}"
pkgver=0.0.1
pkgrel=1
pkgdesc="Supreme Discord RPC lets you make and manage custom Discord Rich Presences with buttons!"
arch=('x86_64')
url="https://alsheikhaminulislam.github.io/Supreme-Discord-RPC/"
license=('GPL')
depends=('libnotify' 'libappindicator-gtk3' 'fuse2' 'fuse3' 'fuse-common' 'libsecret')
_appimage="supreme-discord-rpc-linux.appimage"
source_x86_64=("${_appimage}::https://github.com/alsheikhaminulislam/Supreme-Discord-RPC/releases/download/v${pkgver}/${_appimage}")
noextract=("${_appimage}")
sha256sums_x86_64=('480e717f2f6883cd454c7df26a9fd9f51911b6db5dae5cbe0d0347b560e82afb')
options+=('!strip')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
