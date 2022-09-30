# Promptme

Flutter project to prompt yaml inputs for audio recording and give cool features like :
- Play / Pause / Jump back / Jump forth at any time
- Edit prompted text on pause (WIP)
- Export modifications (WIP)
- Record audio directly from the app (WIP)

**Full support desktop** Currently, i'm only testing desktop.

I'll make adjustment for mobile one day :')

![Promptme Preview](https://media.giphy.com/media/ybsXegkKDs40NbjZ4G/giphy.gif)

## Requirements

1. A folder structure like this where you put your yaml files (on your machine):

```
AudioProjectMainFolder
│  ...
│
└───FirstProjectFolder
│   │   audiocontent.yaml
│   │   audioOutput1.mp3
│   │   audioOutput2.mp3
│   │   ...
│   
└───SecondProjectFolder
    │   audiocontent.yaml
    │   audioOutput1.mp3
    │   ...
```


1. A yaml file containing this keys (must not be nested into a parent) :

```yaml
---
sections:
    text: "blablabla"

```


## Getting started

Pull it and run `Flutter run`

Flutter is required on your machine
