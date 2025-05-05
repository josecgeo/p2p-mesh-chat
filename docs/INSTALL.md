# Installation Guide

Follow these steps to set up the P2P Mesh Chat application for development.

## Prerequisites

### For React Native (Frontend)

- Node.js 16 or newer
- npm or yarn
- React Native CLI
- Android Studio (for Android development)
- Xcode (for iOS development, macOS only)

### For Go (Backend)

- Go 1.18 or newer
- gomobile

## Step 1: Clone the Repository

```bash
git clone https://github.com/josecgeo/p2p-mesh-chat.git
cd p2p-mesh-chat
```

## Step 2: Set Up the Go Backend

```bash
# Install Go dependencies
cd core
go mod download

# Build the Go backend as a mobile library
cd ../scripts
./build_gomobile.sh
```

## Step 3: Set Up the React Native Frontend

```bash
cd ../mobile
npm install
```

## Step 4: Run the Application

### For Android

```bash
npm run android
```

### For iOS

```bash
npm run ios
```

## Development Workflow

1. Make changes to the Go code in the `core/` directory
2. Run `./scripts/build_gomobile.sh` to rebuild the mobile library
3. Make changes to the React Native code in the `mobile/` directory
4. Run the application using `npm run android` or `npm run ios`

## Troubleshooting

### Common Issues

#### Permission Issues with gomobile

If you encounter permission issues when running gomobile, try:

```bash
chmod +x ./scripts/build_gomobile.sh
```

#### Network Discovery Not Working

Ensure both devices are on the same network and that the necessary permissions are granted in the app settings.

#### Build Errors

If you encounter build errors, try cleaning the project:

```bash
# For Android
cd mobile/android
./gradlew clean

# For iOS
cd mobile/ios
pod install --repo-update
```
