# P2P Mesh Chat Architecture

This document outlines the architecture of the P2P Mesh Chat application, focusing on how the system operates without central servers.

## Overview

P2P Mesh Chat is designed as a fully decentralized peer-to-peer application where:

- All data is stored locally on each device
- Communication happens directly between peers
- No central servers are needed for operation

## Key Components

### 1. Local Storage

- **Frontend**: WatermelonDB (embedded SQLite)
- **Backend**: BadgerDB (embedded key-value store)

Each user's device maintains its own database containing:
- User profile information
- Contact list
- All sent and received messages
- User preferences

### 2. P2P Communication Layer

- **Frontend**: React Native WebRTC
- **Backend**: libp2p implementation in Go

The P2P layer is responsible for:
- Peer discovery using multiple mechanisms
- Direct message exchange
- Presence notification (online status, typing indicators)
- Data synchronization

### 3. User Identity

Each user has:
- A unique ID generated locally using cryptographic functions
- An optional username/nickname for display
- A public/private key pair for secure communication

### 4. Message Flow

1. User composes a message
2. Message is stored locally
3. If the recipient is online, message is sent directly via WebRTC
4. If the recipient is offline, message is queued for delivery when they come online
5. When both peers are online, message states (read/delivered) are synchronized

## Peer Discovery Mechanisms

1. **Local Network Discovery**:
   - mDNS (Multicast DNS) for discovering peers on the same network
   - Local IP scanning

2. **WebRTC Signaling**:
   - Manual connection through sharing connection codes/QR codes
   - DHT (Distributed Hash Table) for finding peers by ID

3. **Existing Connection Mesh**:
   - Using existing peers to discover new peers (mesh network approach)

## Data Synchronization

When two peers connect:

1. Exchange message history hashes
2. Identify missing messages on each side
3. Transfer only the missing data
4. Resolve conflicts using timestamps and a conflict resolution strategy

## Security

- All peer-to-peer connections are encrypted using WebRTC's built-in encryption
- Optional end-to-end encryption for messages using the Signal Protocol
- Local database encryption
- Public/private key infrastructure for identity verification

## Offline Operation

- All sent messages are stored locally first
- Users can view their complete chat history when offline
- New messages are queued for delivery when connectivity is restored

## Mobile Integration

The Go backend is compiled into mobile libraries using gomobile, which are then integrated into the React Native application. This allows us to use Go's powerful concurrency features and existing P2P libraries while providing a smooth user experience through React Native's UI capabilities.
