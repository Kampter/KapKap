module kamkam::game;

use std::string::{String};

public struct Game has key, store {
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

public fun get_game_id(self: &Game): ID {
    object::uid_to_inner(&self.id)
}

public fun get_game_address(self: &Game): address {
    object::uid_to_address(&self.id)
}