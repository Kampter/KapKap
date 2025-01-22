module kamkam::kamkam;

use sui::table::{Table};
use std::string::{String};

public struct KamKam has key {
    id: UID,
    games: vector<address>,
}

fun init(ctx: &mut TxContext) {
    let kamkam = KamKam {
        id: object::new(ctx),
        games: vector::empty<address>(),
    };
    transfer::transfer(kamkam, ctx.sender());
}

