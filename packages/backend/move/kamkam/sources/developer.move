module kamkam::developer;

use std::string::{String};

public struct Developer has key {
    id: UID,
    name: String,
    games: vector<address>, 
    description: String, 
    rating: u8, // overall rating score (0-5)
}

public entry fun register_developer(name: String, description: String, ctx: &mut TxContext) {
    let developer = Developer {
        id: object::new(ctx),
        name: name,
        games: vector::empty<address>(),
        description: description,
        rating: 0,
    };
    transfer::transfer(developer, ctx.sender());
}