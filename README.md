# P2P Mesh Chat

A fully decentralized peer-to-peer chat application built with React Native (frontend) and Go (backend). This application runs entirely on client devices without relying on any central servers, cloud services, or centralized databases.

## Features

- **Fully Decentralized**: No central servers or authorities
- **Local-First Storage**: All data is stored locally on the user's device
- **P2P Communication**: Direct communication between peers
- **Offline Support**: Access chat history even when offline
- **End-to-End Encryption**: Optional message encryption for security
- **User Presence**: See when contacts are online, offline, or typing
- **Contact Management**: Add and manage trusted contacts via unique IDs

## Advanced Features

- QR code-based user ID sharing
- Chat backup/restore via encrypted export/import
- Local notifications
- Conflict resolution for message syncing

## Technology Stack

- **Frontend**: React Native
- **Local Database**: WatermelonDB
- **P2P Communication**: WebRTC, libp2p
- **Backend**: Go (embedded)
- **Storage**: BadgerDB

## Project Structure

```
├── mobile/               # React Native frontend
├── core/                 # Go backend core
│   ├── p2p/              # P2P networking layer
│   ├── storage/          # Local storage implementation
│   └── crypto/           # Encryption utilities
├── docs/                 # Documentation
└── scripts/              # Build scripts
```

## Getting Started

### Prerequisites

- Node.js and npm
- Go 1.18 or higher
- React Native development environment
- Android Studio / Xcode

### Installation

1. Clone the repository
2. Set up the development environment
3. Install dependencies
4. Build and run the application

Detailed installation instructions can be found in the [Installation Guide](docs/INSTALL.md).

## How It Works

This application uses a combination of technologies to enable true peer-to-peer communication without central servers:

1. **Local Storage**: All user data and chat history are stored locally using WatermelonDB (React Native) and BadgerDB (Go)
2. **Peer Discovery**: Users discover each other through a combination of local network discovery and libp2p DHT
3. **Direct Communication**: Once peers are discovered, communication happens directly via WebRTC
4. **Data Synchronization**: When peers are online, they synchronize their chat history

## License

MIT
