# Test chat client

Test chat application, with two screens:
- Channels
- Messages of selected channel

No data is fetched from any source, instead all the locally used data is
hardcoded into the source code, and can be found in data directory.

## Getting Started

Launch the application on your connected phone, or emulator:
```sh
flutter run --release
```

Messages screen supports basic formating:
- bold text
```
*this is bold text*
```
- italic text
```
_this is italic text_
```
- strikethrough text
```
~this is italic text~
```

The application support adding new messages (you can format message and add
emojis). But because it doesn't have any backing store, any changes are not
persistent, and will be lost with application restart.


Additionally application makes heavy use of material design, so on apple
devises it will look weird.
