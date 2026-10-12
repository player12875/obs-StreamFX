# Cute Pet Cat - KDE Plasma Widget

A charming desktop pet cat with mint pixel aesthetic for KDE Plasma.

## Features

- **Mint pixel art style** - Adorable cat sprite in mint green (#88CCAA) color scheme
- **Walking animation** - 8-frame walking cycle when idle
- **Jump response** - Cat jumps when clicked
- **Sitting pose** - Default sitting position
- **Lightweight** - Pure QML implementation with PPM sprite assets

## Installation

1. Place the `plasmoid` directory in your KDE Plasma widgets directory
2. Or install via: `plasmapkg2 -i plasmoid/`
3. Enable editing mode and add the "Cute Pet Cat" widget to your desktop

## Files Structure

```
plasmoid/
├── metadata/
│   ├── org.kde.cpet.desktop    # Service metadata
│   └── org.kde.cpet.json       # Plasmoid configuration
├── src/
│   └── ui/
│       └── main.qml            # Main QML widget with animation
└── images/
    ├── cat-sitting.ppm         # Sitting pose sprite
    ├── cat-walk1.ppm through cat-walk8.ppm  # Walking animation frames
    └── resources.qrc           # Resource collection
```

## Controls

- **Click** on the cat to make it jump
- Cat walks animated when idle
- Returns to sitting pose after jump

## Design

- Mint color palette: #88CCAA (minty teal)
- Pixel art style sprites at 64x64 resolution
- Smooth animation with QEasing curves
