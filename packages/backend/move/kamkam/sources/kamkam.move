module kamkam::kamkam;

use std::string::{String};
use kamkam::game::{Game};

public struct KamKam has key {
    id: UID,
    games: vector<ID>,
}

fun init(ctx: &mut TxContext) {
    let kamkam = KamKam {
        id: object::new(ctx),
        games: vector::empty<ID>(),
    };
    transfer::transfer(kamkam, ctx.sender());
}

