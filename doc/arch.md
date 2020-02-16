# FPV/IP architecture {#arch}

## white IP pool

Every client connects directly to its @ref mob, the game provider has leased
white IP pool and routes clients to mobs with fixed addresses.

@dot
digraph {
    rankdir=LR
    fpvip1 -> fpvd1
    fpvip2 -> fpvd2
    fpvip3 -> fpvd3
    fpvip4 -> fpvd4
}
@enddot

## write IP only for 1+ routers

@dot
digraph {
    rankdir=LR
    fpvip1 -> fpvgw1 -> fpvd1
    fpvip2 -> fpvgw1 -> fpvd2
    fpvip3 -> fpvgw2 -> fpvd3
    fpvip4 -> fpvgw2 -> fpvd4
}
@enddot
