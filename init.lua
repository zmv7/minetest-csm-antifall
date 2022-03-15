local antifall = false
minetest.register_globalstep(function(dtime)
if not core.localplayer then return end
if antifall == true and core.localplayer:get_velocity().y < -33 then
core.run_server_chatcommand('home','')
--core.disconnect()
antifall = false
core.after(5,function()antifall = true end)
end
end)
minetest.register_chatcommand("antifall", {
    description = "Toggle antifall",
    func = function(param)
antifall = not antifall
return true, string.format('Antifall is now %s.', antifall and 'enabled' or 'disabled')
end})
