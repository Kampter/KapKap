module kamkam::gamer;

use std::string::{String};
use sui::table::{Self, Table};
use kamkam::game::{Game};

public struct Gamer has key {
    id: UID,
    name: String,
    played_games: vector<address>,
    created_content: Table<ID, address>, // game_id -> content address
    game_time: Table<ID, u64>,// game_id -> time played
}

public struct Content has key, store {
    id: UID,
    creator: address,
    game_id: ID,
    content_type: u8, // 0: guide, 1: video, 2: review
    content_hash: String, // content hash
    rating: u8, // 0-5
}

public entry fun register_gamer(name: String, ctx: &mut TxContext) {
    let gamer = Gamer {
        id: object::new(ctx),
        name: name,
        played_games: vector::empty<address>(),
        created_content: table::new(ctx),
        game_time: table::new(ctx),
    };
    transfer::transfer(gamer, ctx.sender());
}

public entry fun create_content(game_id: ID, content_type: u8, content_hash: String, rating: u8, ctx: &mut TxContext) {
    let content = Content {
        id: object::new(ctx),x
        creator: ctx.sender(),
        game_id: game_id,
        content_type: content_type,
        content_hash: content_hash,
        rating: rating,
    };
    table::set(&mut ctx.state().content, content.id, content);
    table::set(&mut ctx.state().gamer[&ctx.sender()].created_content, game_id, content.id);
}