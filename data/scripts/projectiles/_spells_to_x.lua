dofile_once("data/scripts/lib/utilities.lua")
return function(spell, velo, opt)
    local entity_id = GetUpdatedEntityID()
    local x, y = EntityGetTransform( entity_id )

    local projectiles = EntityGetWithTag( "projectile" )

    if ( #projectiles > 0 ) then
        for i,projectile_id in ipairs( projectiles ) do
            local tags = EntityGetTags( projectile_id )
            
            if ( tags == nil ) or ( string.find( tags, spell ) == nil ) then
                local px, py = EntityGetTransform( projectile_id )
                
                local projectilecomponents = EntityGetComponent( projectile_id, "ProjectileComponent" )
                
                if ( projectilecomponents ~= nil ) then
                    for j,comp_id in ipairs( projectilecomponents ) do
                        ComponentSetValue( comp_id, "on_death_explode", "0" )
                        ComponentSetValue( comp_id, "on_lifetime_out_explode", "0" )
                    end
                end
                
                local velocity = dofile_once("data/scripts/projectiles/_velocity.lua")(velo)
                local vel_x, vel_y = velocity(projectile_id)
                
                shoot_projectile_from_projectile( projectile_id, "data/entities/projectiles/deck/" .. (opt and opt() or spell) .. ".xml", px, py, vel_x, vel_y )
                EntityKill( projectile_id )
            end
        end
    end
end
