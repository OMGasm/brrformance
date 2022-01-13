function choose(seed, options)
    SetRandomSeed( px, py - seed )
    local rnd = Random( 1, #options )
    return options[rnd]
end