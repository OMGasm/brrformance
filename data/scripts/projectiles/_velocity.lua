local funcs = {
    velocity = function()
        local vel_x, vel_y = 0,0
        local velocitycomponents = EntityGetComponent( projectile_id, "VelocityComponent" )
        if ( velocitycomponents ~= nil ) then
            edit_component( projectile_id, "VelocityComponent", function(comp,vars)
                vel_x,vel_y = ComponentGetValueVector2( comp, "mVelocity", vel_x, vel_y)
            end)
        end
        return vel_x, vel_y
    end,
    null = function() return 0,0 end
}
return function(velo) return velo and funcs.velocity or funcs.null end