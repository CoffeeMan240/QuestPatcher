rm -f macos-dmg/QuestPatcher.dmg
echo Building with .NET core . . .
dotnet publish -c Release -r osx-x64
echo Copying built files to app directory . . .
cp -r QuestPatcher/bin/Release/net5.0/osx-x64/publish/* macos-dmg/dmg-root/QuestPatcher.app/Contents/MacOS/
echo Building DMG file . . .
hdiutil create -srcfolder macos-dmg/dmg-root /tmp/QuestPatcher.dmg -volname QuestPatcher
echo Removing built files . . .
rm -r macos-dmg/dmg-root/QuestPatcher.app/Contents/MacOS/*
echo Compressing DMG file . . .
hdiutil convert /tmp/QuestPatcher.dmg -format UDZO -o macos-dmg/QuestPatcher.dmg
rm /tmp/QuestPatcher.dmg
echo Done!
