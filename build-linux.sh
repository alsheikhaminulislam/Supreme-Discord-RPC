#/bin/sh

yay -S rpm-tools
cp ./PKGBUILD ../aur/supreme-discord-rpc/
rm -rf ./dist/
yarn install
electron-builder -l AppImage tar.gz deb rpm -c.productName "Supreme Discord RPC"
electron-builder -w -c.productName "Supreme Discord RPC"
cd ./dist/
chmod +x *.AppImage
mv *.AppImage supreme-discord-rpc-linux.appimage
mv *.deb supreme-discord-rpc-linux.deb
mv *.rpm supreme-discord-rpc-linux.rpm
mv *.tar.gz supreme-discord-rpc-linux.tar.gz
mv *.exe supreme-discord-rpc-windows.exe
mv *mac.zip supreme-discord-rpc-macos-pre.zip
rm *.blockmap
yay -Rnscd rpm-tools
nemo . & disown
# cd ../../aur/supreme-discord-rpc
# rm ./.SRCINFO
# cp ../../supreme-discord-rpc/PKGBUILD ./
# makepkg --printsrcinfo > .SRCINFO
# git add .SRCINFO PKGBUILD
# git commit -m "automatic script commit message"
# git push