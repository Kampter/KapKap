module greeting::kapkap;

// === Imports ===
use sui::table::{Table};
use std::string::{String};

// === Constants === 

// === Errors ===
const EINVALID_GAME_STATUS: u64 = 0;
const EINVALID_DEVELOPER: u64 = 1;
const EINVALID_PUBLISHER: u64 = 2;
const EINVALID_GAMER: u64 = 3;

// === Structs ===
public struct KapKap has key {
    id: UID,
    games: vector<address>,
}

public struct Developer has key {
    id: UID,
    name: String,
    games: vector<address>, 
    description: String, 
    rating: u8, // overall rating score (0-5)
}

public struct Gamer has key {
    id: UID,
    name: String,
    played_games: vector<address>,
    created_content: Table<ID, address>, // game_id -> content
    game_time: Table<ID, u64> // game_id -> time played
}

public struct Game has key {
    id: UID,
    name: String,
    game_type: String,     // e.g., "RPG", "Action", "Strategy"
    rating: u8,           // overall rating score (0-5)
    developer: address,
    status: u8,            // 0: testing, 1: published
    feedback: vector<address>,
    content: vector<address>,
    price: u64,
    download_url: String,
    download_count: u64,
}

public struct Content has key, store {
    id: UID,
    creator: address,
    game_id: ID,
    content_type: u8, // 0: guide, 1: video, 2: review
    content_hash: String
}

public struct Feedback has key, store {
    id: UID,
    from: address,
    rating: u8, // 0-5
    comment: String
}

/// One-Time-Witness for the module
public struct KAPKAP has drop {}

// === Events ===
public struct GameRegistered has copy, drop {
    game_id: ID,
    developer: address
}

public struct ContentCreated has copy, drop {
    content_id: ID,
    creator: address,
    game_id: ID
}

public struct PublisherMatchMade has copy, drop {
    game_id: ID,
    developer: address,
    publisher: address
}

// === Initializer ===
fun init(otw: KAPKAP, ctx: &mut TxContext) {
    // Initialize platform configuration
}

// Additional function declarations will go here...
