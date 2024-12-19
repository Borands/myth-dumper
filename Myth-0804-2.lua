local a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w = client.latency, client.set_clan_tag,
    client.log, client.timestamp, client.userid_to_entindex, client.trace_line, client.set_event_callback,
    client.screen_size, client.trace_bullet, client.color_log, client.system_time, client.delay_call, client.visible,
    client.exec, client.eye_position, client.set_cvar, client.scale_damage, client.draw_hitboxes, client.get_cvar,
    client.camera_angles, client.draw_debug_text, client.random_int, client.random_float; local x, y, z, A, B, C, D, E, F, G, H, I, J, K, L, M =
entity.get_player_resource, entity.get_local_player, entity.is_enemy, entity.get_bounding_box, entity.is_dormant,
    entity.get_steam64, entity.get_player_name, entity.hitbox_position, entity.get_game_rules, entity.get_all,
    entity.set_prop, entity.is_alive, entity.get_player_weapon, entity.get_prop, entity.get_players, entity
.get_classname; local N, O, P, Q, R, S, T, U, V, W = globals.realtime, globals.absoluteframetime, globals.tickcount,
    globals.lastoutgoingcommand, globals.curtime, globals.mapname, globals.tickinterval, globals.framecount,
    globals.frametime, globals.maxplayers; local X, Y, Z, _, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9 = ui.new_slider,
    ui.new_combobox, ui.reference, ui.is_menu_open, ui.set_visible, ui.new_textbox, ui.new_color_picker, ui.set_callback,
    ui.set, ui.new_checkbox, ui.new_hotkey, ui.new_button, ui.new_multiselect, ui.get; local aa, ab, ac, ad, ae, af, ag, ah, ai =
renderer.circle_outline, renderer.rectangle, renderer.gradient, renderer.circle, renderer.text, renderer.line,
    renderer.measure_text, renderer.indicator, renderer.world_to_screen; local aj, ak, al, am, an, ao, ap, aq, ar, as, at, au, av, aw, ax, ay, az, aA, aB, aC, aD, aE =
math.ceil, math.tan, math.cos, math.sinh, math.pi, math.max, math.atan2, math.floor, math.sqrt, math.deg, math.atan,
    math.fmod, math.acos, math.pow, math.abs, math.min, math.sin, math.log, math.exp, math.cosh, math.asin, math.rad; local aF, aG, aH, aI =
table.sort, table.remove, table.concat, table.insert; local aJ = materialsystem.find_material; local aK, aL, aM, aN, aO, aP, aQ, aR, aS, aT =
string.find, string.format, string.gsub, string.len, string.gmatch, string.match, string.reverse, string.upper,
    string.lower, string.sub; local ipairs, assert, pairs, next, tostring, tonumber, setmetatable, unpack, type, getmetatable, pcall, error =
ipairs, assert, pairs, next, tostring, tonumber, setmetatable, unpack, type, getmetatable, pcall, error; local aU = ui
.new_label; local aV, aW, aX, aY, aZ, a_, b0, b1, b2, b3, b4, b5, b6 = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
local b7 = require "gamesense/base64"
local b8 = function()
    aX.enabled = Z("AA", "Anti-aimbot angles", "Enabled")
    aX.pitch = { Z("AA", "Anti-aimbot angles", "Pitch") }
    aX.yaw_base = Z("AA", "Anti-aimbot angles", "Yaw base")
    aX.yaw = { Z("AA", "Anti-aimbot angles", "Yaw") }
    aX.yaw_jitter = { Z("AA", "Anti-aimbot angles", "Yaw jitter") }
    aX.body_yaw = { Z("AA", "Anti-aimbot angles", "Body yaw") }
    aX.freestanding_body_yaw = Z("AA", "Anti-aimbot angles", "Freestanding body yaw")
    aX.edge_yaw = Z("AA", "Anti-aimbot angles", "Edge yaw")
    aX.freestanding = { Z("AA", "Anti-aimbot angles", "Freestanding") }
    aX.roll = Z("AA", "Anti-aimbot angles", "Roll")
    aX.slow_motion = { Z("AA", "Other", "Slow motion") }
    aX.leg_movement = Z("AA", "Other", "Leg movement")
    aX.hide_shots = { Z("AA", "Other", "On shot anti-aim") }
    aX.fake_peek = { Z("AA", "Other", "Fake peek") }
    aX.fake_lag = Z("AA", "Fake lag", "Enabled")
    aX.fake_lag_limit = Z("AA", "Fake lag", "Limit")
    aX.anti_untrusted = Z("MISC", "Settings", "Anti-untrusted")
    aX.fakeduck = Z("Rage", "Other", "Duck peek assist")
    aX.thirdperson = { Z("VISUALS", "Effects", "Force third person (alive)") }
    aX.doubletap = { Z("RAGE", "Aimbot", "Double tap") }
    aX.force_body_aim = Z("RAGE", "Aimbot", "Force body aim")
    aX.force_safe_point = Z("RAGE", "Aimbot", "Force safe point")
    aX.ping_spike = { Z("MISC", "miscellaneous", "ping spike") }
    aX.menu_color = Z("MISC", "Settings", "Menu color")
    aX.quick_peek_assist = { Z("RAGE", "Other", "Quick peek assist") }
    aX.fake_enable = { Z('AA', 'Fake lag', 'Enabled') }
    aX.fake_amount = Z('AA', 'Fake lag', 'Amount')
    aX.fake_variance = Z('AA', 'Fake lag', 'Variance')
    aX.fake_limit = Z('AA', 'Fake lag', 'Limit')
    b0.new = function(b9, ba, bb, bc)
        bc = bc or nil; if type(b9) ~= "number" then return end; table.insert(bb[type(ui.get(b9))], b9)
        if bc ~= nil then table.insert(bc[type(ui.get(b9))], b9) end; table.insert(ba, b9)
        return b9
    end; b0.load = function(bb, bd)
        if bd == nil then return end; local be = function(bf, bg)
            local bh = {}
            for bi in string.gmatch(bf, "([^" .. bg .. "]+)") do bh[#bh + 1] = string.gsub(bi, "\n", "") end; return bh
        end; local bj = function(bi) if bi == "true" or bi == "false" then return bi == "true" else return bi end end; local bh =
            be(b7.decode(bd and bd or nil, 'base64'), "|")
        local bk = 1; for bl, bm in pairs(bb['number']) do
            if bh[bk] == nil then return end; ui.set(bm, tonumber(bh[bk]))
            bk = bk + 1
        end; for bl, bm in pairs(bb['string']) do
            if bh[bk] == nil then return end; ui.set(bm, bh[bk])
            bk = bk + 1
        end; for bl, bm in pairs(bb['boolean']) do
            if bh[bk] == nil then return end; ui.set(bm, bj(bh[bk]))
            bk = bk + 1
        end; for bl, bm in pairs(bb['table']) do
            if bh[bk] == nil then return end; ui.set(bm, be(bh[bk], ","))
            bk = bk + 1
        end
    end; b0.exp = function(bb)
        local bn = ""
        local bo = function(bp)
            local bi = ""
            for bq = 1, #bp do bi = bi .. bp[bq] .. (bq == #bp and "" or ",") end; if bi == "" then bi = "-" end; return
                bi
        end; for bl, bm in pairs(bb['number']) do bn = bn .. tostring(ui.get(bm)) .. "|" end; for bl, bm in pairs(bb['string']) do
            bn =
                bn .. ui.get(bm) .. "|"
        end; for bl, bm in pairs(bb['boolean']) do bn = bn .. tostring(ui.get(bm)) .. "|" end; for bl, bm in pairs(bb['table']) do
            bn =
                bn .. bo(ui.get(bm)) .. "|"
        end; return b7.encode(bn)
    end; b0.table_contain = function(br, bs)
        for bq = 1, #br do if br[bq] == bs then return true end end; return false
    end; b0._call = function(ba, bt) for bu, bm in pairs(ba) do ui.set_callback(bm, bt) end end; aZ.lerp = function(self,
                                                                                                                    bv,
                                                                                                                    bw,
                                                                                                                    bx)
        if type(bv) == 'table' and type(bw) == 'table' then
            return { self:lerp(bv[1], bw[1], bx), self:lerp(bv[2], bw[2],
                bx), self:lerp(bv[3], bw[3], bx) }
        end; return bv + (bw - bv) * bx
    end; aZ.console = function(self, ...)
        for bq, by in ipairs({ ... }) do
            if type(by[1]) == 'table' and type(by[2]) == 'table' and type(by[3]) == 'string' then
                for bz = 1, #by[3] do
                    local bA = self:lerp(by[1], by[2], bz / #by[3])
                    j(bA[1], bA[2], bA[3], by[3]:sub(bz, bz) .. '\0')
                end
            elseif type(by[1]) == 'table' and type(by[2]) == 'string' then
                j(by[1][1], by[1][2], by[1][3],
                    by[2] .. '\0')
            end
        end
    end; aZ.text = function(self, ...)
        local bB = false; local bC = 255; local bD = ''
        for bq, by in ipairs({ ... }) do
            if type(by) == 'boolean' then
                bB = by
            elseif type(by) == 'number' then
                bC = by
            elseif type(by) == 'string' then
                bD =
                    bD .. by
            elseif type(by) == 'table' then
                if type(by[1]) == 'table' and type(by[2]) == 'string' then
                    bD =
                        bD .. ('\a%02x%02x%02x%02x'):format(by[1][1], by[1][2], by[1][3], bC) .. by[2]
                elseif type(by[1]) == 'table' and type(by[2]) == 'table' and type(by[3]) == 'string' then
                    for bz = 1, #by[3] do
                        local bE = self:lerp(by[1], by[2], bz / #by[3])
                        bD = bD .. ('\a%02x%02x%02x%02x'):format(bE[1], bE[2], bE[3], bC) .. by[3]:sub(bz, bz)
                    end
                end
            end
        end; return ('%s\a%s%02x'):format(bD, bB and 'cdcdcd' or 'ffffff', bC)
    end; aZ.log = function(self, ...)
        for bq, by in ipairs({ ... }) do
            if type(by) == 'table' then
                if type(by[1]) == 'table' then
                    if type(by[2]) == 'string' then
                        self:console({ by[1], by[1], by[2] })
                        if by[3] then self:console({ { 255, 255, 255 }, '\n' }) end
                    elseif type(by[2]) == 'table' then
                        self:console({ by[1], by[2], by[3] })
                        if by[4] then self:console({ { 255, 255, 255 }, '\n' }) end
                    end
                elseif type(by[1]) == 'string' then
                    self:console({ { 205, 205, 205 }, by[1] })
                    if by[2] then self:console({ { 255, 255, 255 }, '\n' }) end
                end
            end
        end
    end; aZ.gradient_text = function(bF, bG, bH, bI, bJ, bK, bL, bM, bN)
        local bO = ''
        local bP = #bN - 1; local bQ = (bJ - bF) / bP; local bR = (bK - bG) / bP; local bS = (bL - bH) / bP; local bT = (bM - bI) /
            bP; for bq = 1, bP + 1 do
            bO = bO .. ('\a%02x%02x%02x%02x%s'):format(bF, bG, bH, bI, bN:sub(bq, bq))
            bF = bF + bQ; bG = bG + bR; bH = bH + bS; bI = bI + bT
        end; return bO
    end; aZ.fade_text = function(bF, bG, bH, bI, bJ, bK, bL, bM, bU)
        local bV = globals.realtime() / 2 % 1.2 * 2 - 1.2; local bO = ""
        if bU == nil then return end; for bW = 1, #bU do
            local bX = bU:sub(bW, bW)
            local bY = bW / #bU; local bZ = bY - bV; if bZ >= 0 and bZ <= 1.4 then
                if bZ > 0.7 then bZ = 1.4 - bZ end; local b_, c0, c1, c2 = bJ - bF, bK - bG, bL - bH; bF = bF + b_ * bZ /
                    0.8; bG = bG + c0 * bZ / 0.8; bH = bH + c1 * bZ / 0.8
            end; bO = bO .. ('\a%02x%02x%02x%02x%s'):format(bF, bG, bH, bI, bU:sub(bW, bW))
        end; return bO
    end; local c3 = function(...)
        local c4 = { ... }
        aZ:log({ { 235, 42, 142 }, { 186, 198, 212 }, "Myth" }, { { 100, 100, 100 }, " <=> " },
            { { 255, 255, 255 }, string.format(unpack(c4)), true })
    end; c3('Started your Myth!')
    aV.build = 'Initiate'
    aZ:log({ { 235, 42, 142 }, { 186, 198, 212 }, "Myth" }, { { 100, 100, 100 }, " <=> " },
        { { 255, 255, 255 }, "Myth Anti-aimbot angles system V.1" }, { { 144, 194, 54 }, '._A' },
        { { 205, 205, 205 }, " edition:" }, { { 239, 86, 86 }, " " .. aV.build, true })
    b2.register_data = {}
    b2.register_ui = { ['number'] = {}, ['string'] = {}, ['boolean'] = {}, ['table'] = {} }
    b2.register_aa = { ['number'] = {}, ['string'] = {}, ['boolean'] = {}, ['table'] = {} }
    local c5, c6 = 'aa', 'anti-aimbot angles'
    local c7, c8 = 'aa', 'other'
    local c9, ca = 'aa', 'Fake lag'
    b3.c_og = b0.new(aU(c5, c6, "\a6E6868FF#hide og  ▲"), b2.register_data, b2.register_ui)
    b3.c_og_box = b0.new(a5(c5, c6, "=========================================="), b2.register_data, b2.register_ui)
    b3.spacing = aU(c5, c6, ' ')
    b3.cnameS = b0.new(aU(c5, c6, "\aFF105DFFMyth\a6E6868FF.lua - \a774CFFFF" .. aV.build), b2.register_data,
        b2.register_ui)
    b3.cname2 = b0.new(aU(c5, c6, "\a6E6868FF£- Born to be a legend."), b2.register_data, b2.register_ui)
    b3.spacingA = aU(c7, c8, ' ')
    b3.spacingB = aU(c7, c8, ' ')
    b3.spacingC = aU(c7, c8, ' ')
    b3.spacingA = aU(c7, c8, ' ')
    b3.page_slider = b0.new(
    X(c7, c8, " ", 0, 3, 0, true, '', 1, {
        [0] = 'init.',
        [1] = 'anti-aim.',
        [2] = 'func.',
        [3] =
        'up.inf.'
    }), b2.register_data, b2.register_ui)
    b3.cname = b0.new(
        aU(c7, c8, "               \aFF105DFFMyth\a6E6868FF.lua - \a774CFFFF" .. aV.build ..
            "\aFFFFFFC8 - Page \a6E6868FFMain"), b2.register_data, b2.register_ui)
    local cb = { 'stand', 'move', 'duck', 'slow-motion', 'air', 'air + duck' }
    b3.a_enable = b0.new(a5(c5, c6, "Boost anti-aimbot angles"), b2.register_data, b2.register_ui)
    b3.a_state = b0.new(Y(c5, c6, "states", cb), b2.register_data, b2.register_ui)
    b3.builder = {}
    b3.pos_x = b0.new(X("LUA", "B", "\nSaved Position X INDICATOR", 0, 10000, 10), b2.register_data, b2.register_ui)
    b3.pos_y = b0.new(X("LUA", "B", "\nSaved Position Y INDICATOR", 0, 10000, 10), b2.register_data, b2.register_ui)
    local cc = {}
    for bz, by in pairs(cb) do
        cc[bz] = "\a6E6868FF#" .. cb[bz] .. ""
        b3.builder[bz] = {
            defen_option = b0.new(Y(c5, c6, 'should defen.?', { 'off', 'adp.', 'force' }),
                b2.register_data, b2.register_ui, b2.register_aa),
            pitch_defn = { b0.new(Y(c5, c6, '\aE5D841FF*pitch', { "Off", "Default", "Up", "Down", "Minimal", "Random", "Custom" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " pd", -89, 89, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) },
            yaw_defn = { b0.new(Y(c5, c6, "\aE5D841FF*yaw", { "Off", '180', 'Spin', 'Static', '180 Z', 'Crosshair' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c5, c6, "\aE5D841FF*extend yaw", { "off", 'traditional', 'extend jitter' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " sA", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " tr. lefts", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " tr. rights", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " ex. values", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) },
            pitch = { b0.new(Y(c5, c6, 'pitch', { "Off", "Default", "Up", "Down", "Minimal", "Random", "Custom" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " p", -89, 89, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) },
            yaw = { b0.new(Y(c5, c6, "yaw", { "Off", '180', 'Spin', 'Static', '180 Z', 'Crosshair' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c5, c6, "extend yaw", { "off", 'traditional', 'extend jitter' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " a", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " tr. leftd", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " tr. rightd", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " ex. valued", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) },
            yaw_jitter = { b0.new(Y(c5, c6, "yaw jitter", { "Off", 'Offset', 'Center', "Random", "Skitter" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c5, c6, "extend func.", { "off", 'traditional', 'extend jitter' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " a.", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " tr. leftp", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " tr. rightp", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " ex. valuep", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) },
            body_yaw = { b0.new(Y(c5, c6, "body yaw", { 'Off', 'Opposite', 'Jitter', 'Static' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c5, c6, "optional body", { "off", "traditional", "extend", "adaptive" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. "sAp", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " tr. min", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " tr. max", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " ex. max", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c5, c6, cc[bz] .. " adp. relay", -27, 34, 0, true, "*"), b2.register_data, b2.register_ui, b2.register_aa) }
        }
    end; b3.p2_spacingA = b0.new(aU(c5, c6, '\a6E6868FF#'), b2.register_data, b2.register_ui)
    b3.p2_cnameA = b0.new(aU(c5, c6, '\a6E6868FFkey sets.'), b2.register_data, b2.register_ui)
    b3.p2_spacingB = b0.new(aU(c5, c6, ' '), b2.register_data, b2.register_ui)
    b3.manual_options = b0.new(a8(c5, c6, 'manual options', { 'f. static', 'f. straight' }), b2.register_data,
        b2.register_ui)
    b3.manual_left = { false, a6(c5, c6, 'manual left') }
    b3.manual_right = { false, a6(c5, c6, 'manual right') }
    b3.manual_reset = { false, a6(c5, c6, 'manual reset') }
    b3.legit_aa = a6(c5, c6, 'antiaim on use')
    b3.freestanding = { false, a6(c5, c6, 'freestanding') }
    b3.edge_yaw = { false, a6(c5, c6, 'edge yaw') }
    b3.p2_spacingE = b0.new(aU(c5, c6, ' '), b2.register_data, b2.register_ui)
    b3.p2_spacingC = b0.new(aU(c5, c6, '\a6E6868FF#'), b2.register_data, b2.register_ui)
    b3.p2_cnameB = b0.new(aU(c5, c6, '\a6E6868FFui.'), b2.register_data, b2.register_ui)
    b3.p2_spacingD = b0.new(aU(c5, c6, ' '), b2.register_data, b2.register_ui)
    b3.indicator = b0.new(a8(c5, c6, 'should render.?', { 'manual indicator', '1v1 helper', 'center', 'notify', '...' }),
        b2.register_data, b2.register_ui)
    b3.arrow_distance = b0.new(X(c5, c6, ' distance', 10, 100, 15, true, 'pt.'), b2.register_data, b2.register_ui)
    b3.p2_spacingF = b0.new(aU(c5, c6, ' '), b2.register_data, b2.register_ui)
    b3.th_color_cname = b0.new(aU(c5, c6, 'change 1v1 helper color.?'), b2.register_data, b2.register_ui)
    b3.th_color = b0.new(a2(c5, c6, 'change 1v1 helper  color.?_color', 235, 42, 142, 255), b2.register_data,
        b2.register_ui)
    b3.center_color_cname = b0.new(aU(c5, c6, 'change center color.?'), b2.register_data, b2.register_ui)
    b3.center_color = b0.new(a2(c5, c6, 'change center color.?_color', 235, 42, 142, 255), b2.register_data,
        b2.register_ui)
    b3.arrow_color_cname = b0.new(aU(c5, c6, 'change arrows color.?'), b2.register_data, b2.register_ui)
    b3.arrow_color = b0.new(a2(c5, c6, 'change arrows color.?_color', 235, 42, 142, 255), b2.register_data,
        b2.register_ui)
    b3.noti_color_cname = b0.new(aU(c5, c6, 'change notify color.?'), b2.register_data, b2.register_ui)
    b3.noti_color = b0.new(a2(c5, c6, 'change notify color.?_color', 235, 42, 142, 255), b2.register_data, b2
        .register_ui)
    b3.p2_spacingG = b0.new(aU(c5, c6, ' '), b2.register_data, b2.register_ui)
    b3.p2_spacingH = b0.new(aU(c5, c6, '\a6E6868FF#'), b2.register_data, b2.register_ui)
    b3.p2_cnameC = b0.new(aU(c5, c6, '\a6E6868FFmisc.'), b2.register_data, b2.register_ui)
    b3.p2_spacingI = b0.new(aU(c5, c6, ' '), b2.register_data, b2.register_ui)
    b3.features = b0.new(a8(c5, c6, 'should enable.?', { 'anti-knife', 'anim. breaker', '...' }), b2.register_data,
        b2.register_ui)
    b3.m_antidis = b0.new(X(c5, c6, ' anti-distance', 200, 600, 280, true, 'm'), b2.register_data, b2.register_ui)
    b3.m_animbreak = b0.new(a8(c5, c6, ' anims', { "in air", "on land", "leg fucker" }), b2.register_data, b2
        .register_ui)
    b5.visible = function()
        local cd = Z('MISC', 'Settings', "Menu color")
        a4(cd, 235, 42, 142, 255)
        local ce = aZ.fade_text(61, 61, 61, 255, 200, 200, 200, 255, 'legend')
        a4(b3.cname2, "\a6E6868FF£- Born to be a " .. ce .. '.')
        if a9(b3.c_og_box) then a4(b3.c_og, '\a6E6868FF#hide og  ▲') else a4(b3.c_og, '\a6E6868FF#hide og  ▼') end; if a9(b3.page_slider) == 0 then
            a4(b3.cname,
                "               \aFF105DFFMyth\a6E6868FF.lua - \a774CFFFF" ..
                aV.build .. "\aFFFFFFC8 - Page \a6E6868FFMain")
        elseif a9(b3.page_slider) == 1 then
            a4(b3.cname,
                "               \aFF105DFFMyth\a6E6868FF.lua - \a774CFFFF" .. aV.build .. "\aFFFFFFC8 - Page \a6E6868FF1")
        elseif a9(b3.page_slider) == 2 then
            a4(b3.cname,
                "               \aFF105DFFMyth\a6E6868FF.lua - \a774CFFFF" .. aV.build .. "\aFFFFFFC8 - Page \a6E6868FF2")
        elseif a9(b3.page_slider) == 3 then
            a4(b3.cname,
                "               \aFF105DFFMyth\a6E6868FF.lua - \a774CFFFF" .. aV.build .. "\aFFFFFFC8 - Page \a6E6868FF3")
        end; local cf = function(
            cg)
            a0(aX.enabled, cg)
            a0(aX.pitch[1], cg)
            a0(aX.pitch[2], cg)
            a0(aX.yaw_base, cg)
            a0(aX.yaw[1], cg)
            a0(aX.yaw[2], cg)
            a0(aX.yaw_jitter[1], cg)
            a0(aX.yaw_jitter[2], cg)
            a0(aX.body_yaw[1], cg)
            a0(aX.body_yaw[2], cg)
            a0(aX.freestanding_body_yaw, cg)
            a0(aX.edge_yaw, cg)
            a0(aX.freestanding[1], cg)
            a0(aX.freestanding[2], cg)
            a0(aX.roll, cg)
        end; if not a9(b3.a_enable) then cf(a9(b3.c_og_box)) end; local ch, ci, cj, ck = a9(b3.page_slider) == 0,
            a9(b3.page_slider) == 1, a9(b3.page_slider) == 2, a9(b3.page_slider) == 3; a0(b3.cnameS, ch)
        a0(b3.cname2, ch)
        a0(b3.a_enable, ci)
        local cl = a9(b3.a_enable) and ci; a0(b3.a_state, cl)
        for bz, by in pairs(cb) do
            local cm = cl and a9(b3.a_state) == cb[bz]
            a0(b3.builder[bz].defen_option, cm)
            local cn = cm and a9(b3.builder[bz].defen_option) ~= "off"
            a0(b3.builder[bz].pitch_defn[1], cn)
            a0(b3.builder[bz].pitch_defn[2], cn and a9(b3.builder[bz].pitch_defn[1]) == 'Custom')
            a0(b3.builder[bz].yaw_defn[1], cn)
            a0(b3.builder[bz].yaw_defn[2], cn and a9(b3.builder[bz].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[bz].yaw_defn[3],
                cn and a9(b3.builder[bz].yaw_defn[2]) == 'off' and a9(b3.builder[bz].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[bz].yaw_defn[4],
                cn and a9(b3.builder[bz].yaw_defn[2]) == 'traditional' and a9(b3.builder[bz].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[bz].yaw_defn[5],
                cn and a9(b3.builder[bz].yaw_defn[2]) == 'traditional' and a9(b3.builder[bz].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[bz].yaw_defn[6],
                cn and a9(b3.builder[bz].yaw_defn[2]) == 'extend jitter' and a9(b3.builder[bz].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[bz].pitch[1], cm)
            a0(b3.builder[bz].pitch[2], cm and a9(b3.builder[bz].pitch[1]) == 'Custom')
            a0(b3.builder[bz].yaw[1], cm)
            a0(b3.builder[bz].yaw[2], cm and a9(b3.builder[bz].yaw[1]) ~= 'Off')
            a0(b3.builder[bz].yaw[3], cm and a9(b3.builder[bz].yaw[2]) == 'off' and a9(b3.builder[bz].yaw[1]) ~= 'Off')
            a0(b3.builder[bz].yaw[4], cm and a9(b3.builder[bz].yaw[2]) == 'traditional' and
                a9(b3.builder[bz].yaw[1]) ~= 'Off')
            a0(b3.builder[bz].yaw[5], cm and a9(b3.builder[bz].yaw[2]) == 'traditional' and
                a9(b3.builder[bz].yaw[1]) ~= 'Off')
            a0(b3.builder[bz].yaw[6],
                cm and a9(b3.builder[bz].yaw[2]) == 'extend jitter' and a9(b3.builder[bz].yaw[1]) ~= 'Off')
            a0(b3.builder[bz].yaw_jitter[1], cm)
            a0(b3.builder[bz].yaw_jitter[2], cm and a9(b3.builder[bz].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[bz].yaw_jitter[3],
                cm and a9(b3.builder[bz].yaw_jitter[2]) == 'off' and a9(b3.builder[bz].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[bz].yaw_jitter[4],
                cm and a9(b3.builder[bz].yaw_jitter[2]) == 'traditional' and a9(b3.builder[bz].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[bz].yaw_jitter[5],
                cm and a9(b3.builder[bz].yaw_jitter[2]) == 'traditional' and a9(b3.builder[bz].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[bz].yaw_jitter[6],
                cm and a9(b3.builder[bz].yaw_jitter[2]) == 'extend jitter' and a9(b3.builder[bz].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[bz].body_yaw[1], cm)
            a0(b3.builder[bz].body_yaw[2], cm and a9(b3.builder[bz].body_yaw[1]) ~= 'Off')
            a0(b3.builder[bz].body_yaw[3],
                cm and a9(b3.builder[bz].body_yaw[2]) == 'off' and a9(b3.builder[bz].body_yaw[1]) ~= 'Off')
            a0(b3.builder[bz].body_yaw[4],
                cm and a9(b3.builder[bz].body_yaw[2]) == 'traditional' and a9(b3.builder[bz].body_yaw[1]) ~= 'Off')
            a0(b3.builder[bz].body_yaw[5],
                cm and a9(b3.builder[bz].body_yaw[2]) == 'traditional' and a9(b3.builder[bz].body_yaw[1]) ~= 'Off')
            a0(b3.builder[bz].body_yaw[6],
                cm and a9(b3.builder[bz].body_yaw[2]) == 'extend' and a9(b3.builder[bz].body_yaw[1]) ~= 'Off')
            a0(b3.builder[bz].body_yaw[7],
                cm and a9(b3.builder[bz].body_yaw[2]) == 'adaptive' and a9(b3.builder[bz].body_yaw[1]) ~= 'Off')
        end; a0(b3.manual_options, cj)
        a0(b3.manual_left[2], cj)
        a0(b3.manual_right[2], cj)
        a0(b3.manual_reset[2], cj)
        a0(b3.legit_aa, cj)
        a0(b3.freestanding[2], cj)
        a0(b3.edge_yaw[2], cj)
        a0(b3.p2_cnameA, cj)
        a0(b3.p2_spacingA, cj)
        a0(b3.p2_spacingB, cj)
        a0(b3.p2_cnameB, cj)
        a0(b3.p2_cnameC, cj)
        a0(b3.p2_spacingC, cj)
        a0(b3.p2_spacingD, cj)
        a0(b3.p2_spacingE, cj)
        a0(b3.p2_spacingF, cj)
        a0(b3.p2_spacingG, cj)
        a0(b3.p2_spacingH, cj)
        a0(b3.p2_spacingI, cj)
        a0(b3.indicator, cj)
        a0(b3.arrow_distance, cj and b0.table_contain(a9(b3.indicator), 'manual indicator'))
        a0(b3.th_color_cname, cj and b0.table_contain(a9(b3.indicator), '1v1 helper'))
        a0(b3.th_color, cj and b0.table_contain(a9(b3.indicator), '1v1 helper'))
        a0(b3.center_color_cname, cj and b0.table_contain(a9(b3.indicator), 'center'))
        a0(b3.center_color, cj and b0.table_contain(a9(b3.indicator), 'center'))
        a0(b3.arrow_color_cname, cj and b0.table_contain(a9(b3.indicator), 'manual indicator'))
        a0(b3.arrow_color, cj and b0.table_contain(a9(b3.indicator), 'manual indicator'))
        a0(b3.noti_color_cname, cj and b0.table_contain(a9(b3.indicator), 'notify'))
        a0(b3.noti_color, cj and b0.table_contain(a9(b3.indicator), 'notify'))
        a0(b3.features, cj)
        a0(b3.m_antidis, cj and b0.table_contain(a9(b3.features), 'anti-knife'))
        a0(b3.m_animbreak, cj and b0.table_contain(a9(b3.features), 'anim. breaker'))
    end; b5.visible()
    local co = ui.new_slider('lua', 'b', '_temp_states', 0, 3, 0)
    a0(co, false)
    local J, K = entity.get_player_weapon, entity.get_prop; local cp = 0; local cq = function(cr)
        local cs = bit.band(K(cr, "m_fFlags"), 1)
        if cs == 1 then cp = cp + 1 else cp = 0 end; return cp > 8
    end; local ct = function(cu, cv, cw, cx, cy, cz) return math.sqrt((cx - cu) ^ 2 + (cy - cv) ^ 2 + (cz - cw) ^ 2) end; a_.get_dist_to_ety = function(
        cA, cB, cC, cD, cE, cF)
        return ct(cA, cB, cC, cD, cE, cF)
    end; a_.is_scoped = function(a_)
        if J(a_) == nil then return end; return K(J(a_), "m_zoomLevel") == 1 or K(J(a_), "m_zoomLevel") == 2
    end; a_.is_slowdown = function(cr) return K(cr, "m_flVelocityModifier") ~= 1 end; a_.get_velocity = function(cr)
        local cG, cH, cI = K(cr, "m_vecVelocity")
        return math.sqrt(cG ^ 2 + cH ^ 2)
    end; a_.is_static = function(cr) return a_.get_velocity(cr) < 2 and cq(cr) end; a_.is_move = function(cr)
        return a_
            .get_velocity(cr) > 10 and cq(cr)
    end; a_.is_duck = function(cr)
        local cJ = K(cr, "m_flDuckAmount") > 0.8; return cJ and cq(cr)
    end; a_.is_slowmotion = function(cr) return ui.get(aX.slow_motion[1]) and ui.get(aX.slow_motion[2]) end; a_.is_air = function(
        cr)
        return bit.band(K(cr, "m_fFlags"), 1) == 0 and cp <= 6
    end; a_.is_airduck = function(cr)
        return a_.is_air(cr) and
            K(cr, "m_flDuckAmount") > 0.8 and cp <= 6
    end; local cK = { dir = 0, m_states = 0, left = false, right = false, back = false }
    local co = ui.new_slider('lua', 'b', '_aafunc_states', 0, 3, 1)
    ui.set_visible(co, false)
    aY.get_direct = function(...)
        local cL = { ... }
        for bz, by in pairs(cL) do
            if type(by) ~= 'number' then
                print('args should be menu elements')
                return
            end
        end; ui.set(cL[1], 'On hotkey')
        ui.set(cL[2], 'On hotkey')
        ui.set(cL[3], 'On hotkey')
        ui.set(aX.freestanding[2], 'Always on')
        local cM, cN = ui.get(cL[4]), ui.get(cL[5])
        ui.set(aX.freestanding[1], cM)
        ui.set(aX.edge_yaw, cN)
        m_states = ui.get(co)
        left, right, back = ui.get(cL[1]), ui.get(cL[2]), ui.get(cL[3])
        if left == cK.left and right == cK.right and back == cK.back then return end; cK.left, cK.right, cK.back = left,
            right, back; if left and m_states == 1 or right and m_states == 2 or back and m_states == 3 then
            ui.set(co, 0)
            return
        end; if left and m_states ~= 1 then ui.set(co, 1) end; if right and m_states ~= 2 then ui.set(co, 2) end; if back and m_states ~= 3 then
            ui.set(co, 3)
        end; cK.dir = ui.get(co) == 0 and 0 or ui.get(co) == 1 and -90 or ui.get(co) == 2 and 90 or
            ui.get(co) == 3 and 0; return cK.dir
    end; aY.get_dir_data = function() return cK.dir end; aY.normalize_angle = function(cO)
        while cO > 180 do cO = cO - 360 end; while cO < -180 do cO = cO + 360 end; return cO
    end; aY.get_sIndex = function(cr, cP) if a_.is_airduck(cr) then return 6 elseif a_.is_air(cr) then return 5 elseif a_.is_slowmotion(cr) then return 4 elseif a_.is_duck(cr) then return 3 elseif a_.is_move(cr) and not a_.is_slowmotion(cr) then return 2 elseif a_.is_static(cr) and not a_.is_slowmotion(cr) then return 1 else return 6 end end; local cQ = false; local cR = function()
        if entity.get_local_player() == nil then return end; local cS = ui.get(aX.body_yaw[2])
        cS = math.abs(cS) == 0 and 60 or cS; cQ = math.floor(math.min(math.abs(cS / 3),
                entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * math.abs(cS / 3) * 2 -
                math.abs(cS / 3))) >
            0
    end; client.set_event_callback('paint_ui', cR)
    aY.tr_jitter = function(cT, cU) return cQ and cT or cU end; aY.ex_jitter = function(cT, cU, cV)
        cT = cT + cV; cU = cU + cV; return cQ and aY.normalize_angle(cT) or aY.normalize_angle(cU)
    end; aY.on_use = function(cW)
        local ct = function(cu, cv, cw, cx, cy, cz) return math.sqrt((cx - cu) ^ 2 + (cy - cv) ^ 2 + (cz - cw) ^ 2) end; local cX = function(
            cY)
            local cZ = entity.get_all("CC4")[1]
            return cZ ~= nil and entity.get_prop(cZ, "m_hOwnerEntity") == cY
        end; local c_ = entity.get_local_player()
        local d0 = 100; local cZ = entity.get_all('CPlantedC4')[1]
        local d1, d2, d3 = K(cZ, "m_vecOrigin")
        if d1 ~= nil then
            local d4, d5, d6 = K(c_, "m_vecOrigin")
            d0 = ct(d1, d2, d3, d4, d5, d6)
        end; local d7 = K(c_, "m_iTeamNum")
        local d8 = d7 == 3 and d0 < 62; local d9 = K(c_, "m_bInBombZone")
        local da = cX(c_)
        local db = d9 ~= 0 and d7 == 2 and da and false; local dc, dd, de = o()
        local df, dg = t()
        local dh = az(aE(df))
        local di = al(aE(df))
        local dj = az(aE(dg))
        local dk = al(aE(dg))
        local dl = { di * dk, di * dj, -dh }
        local dm, dn = f(c_, dc, dd, de, dc + dl[1] * 8192, dd + dl[2] * 8192, de + dl[3] * 8192)
        local dp = true; local dq = { "CWorld", "CCSPlayer", "CFuncBrush" }
        if dn ~= nil then for bq = 0, #dq do if entity.get_classname(dn) == dq[bq] then dp = false end end end; if not dp and not db and not d8 then cW.in_use = 0 end
    end; b6.update_manual = function()
        a4(b3.manual_left[2], 'On hotkey')
        a4(b3.manual_right[2], 'On hotkey')
        a4(b3.manual_reset[2], 'On hotkey')
        a0(co, false)
        local dr = a9(co)
        local ds, dt, du = a9(b3.manual_left[2]), a9(b3.manual_right[2]), a9(b3.manual_reset[2])
        local dv = a9(b3.edge_yaw[2])
        a4(aX.edge_yaw, dv and true or false)
        if a9(b3.freestanding[2]) then
            b3.freestanding[1] = true; a4(aX.freestanding[1], true)
            a4(aX.freestanding[2], 'Always on')
            return
        else
            a4(aX.freestanding[1], false)
            b3.freestanding[1] = true
        end; if ds == b3.manual_left[1] and dt == b3.manual_right[1] and du == b3.manual_reset[1] then return end; b3.manual_left[1], b3.manual_right[1], b3.manual_reset[1] =
            ds, dt, du; if ds and dr == 1 or dt and dr == 2 or du and dr == 3 then
            a4(co, 0)
            return
        end; if ds and dr ~= 1 then a4(co, 1) end; if dt and dr ~= 2 then a4(co, 2) end; if du and dr ~= 3 then a4(co, 3) end
    end; b6.rf_data = { pitch = { 'Default', 0 }, yaw_base = 'Local view', yaw = { '180', 0 }, yaw_jitter = { 'Off', 0 }, body_yaw = { 'Static', 0 }, freestand_yaw = false }
    b6.def_data = { cmd_num = 0, checker = 0, tickbase = 0 }
    b6.update_cmdnumber = function(cW) b6.def_data.cmd_num = cW.command_number end; b6.update_tickbase = function(cW)
        if cW.command_number == b6.def_data.cmd_num then
            local dw = K(y(), "m_nTickBase")
            b6.def_data.tickbase = math.abs(dw - b6.def_data.checker)
            b6.def_data.checker = math.max(dw, b6.def_data.checker or 0)
            b6.def_data.cmd_num = 1
        end
    end; b6.is_defensive_active = function()
        local dx = y()
        if dx == nil then return false end; if (a9(aX.hide_shots[1]) == false or a9(aX.hide_shots[2]) == false) and (a9(aX.doubletap[1]) == false or a9(aX.doubletap[2]) == false) then return false end; return
            b6.def_data.tickbase > 2.999681459999995998498010104 and
            b6.def_data.tickbase < 16.02989523959497059475636968798249830139991
    end; b6.reset_defn = function()
        b6.def_data.defensive = 0; b6.def_data.checker = 0
    end; local dy = require('gamesense/csgo_weapons')
    b6.do_defensive = function(cW)
        local dz = aY.get_sIndex(y(), b3.builder)
        if a9(b3.builder[dz].defen_option) ~= 'off' then cW.force_defensive = true end; local dA = true; if J(y()) ~= nil and dy(J(y())).type == "knife" then dA = false end; if b6.is_defensive_active() and dA then return true end
    end; g("run_command", b6.update_cmdnumber)
    g("predict_command", b6.update_tickbase)
    g("level_init", b6.reset_defn)
    b6.setup_anti = function(cW)
        local dB = a9(b3.a_enable)
        local cT = b6.rf_data; b6.update_manual()
        local dC = a9(co)
        local dD = ({ [1] = b0.table_contain(a9(b3.manual_options), 'f. straight') and -90 or -70, [2] = b0.table_contain(a9(b3.manual_options), 'f. straight°') and 90 or 110 })
            [dC]
        local dz = aY.get_sIndex(y(), b3.builder)
        if dB then
            if a9(b3.legit_aa) then
                aY.on_use(cW)
                cT.pitch[1] = 'Off'
                cT.yaw[1] = 'Off'
                cT.yaw_jitter[1] = 'Off'
                cT.body_yaw[1] = 'Static'
                cT.body_yaw[2] = -180; cT.freestand_yaw = true
            else
                local dE = b6.do_defensive(cW)
                cT.pitch[1] = a9(b3.builder[dz].defen_option) ~= 'off' and dE and a9(b3.builder[dz].pitch_defn[1]) or
                    a9(b3.builder[dz].pitch[1])
                cT.pitch[2] = a9(b3.builder[dz].defen_option) ~= 'off' and dE and a9(b3.builder[dz].pitch_defn[2]) or
                    a9(b3.builder[dz].pitch[2])
                cT.yaw[1] = a9(b3.builder[dz].defen_option) ~= 'off' and dE and a9(b3.builder[dz].yaw_defn[1]) or
                    a9(b3.builder[dz].yaw[1])
                cT.yaw_jitter[1] = a9(b3.builder[dz].yaw_jitter[1])
                cT.yaw[2] = a9(b3.builder[dz].defen_option) ~= 'off' and dE and
                    (a9(b3.builder[dz].yaw_defn[2]) == 'off' and a9(b3.builder[dz].yaw_defn[3]) or a9(b3.builder[dz].yaw_defn[2]) == 'traditional' and aY.tr_jitter(a9(b3.builder[dz].yaw_defn[4]), a9(b3.builder[dz].yaw_defn[5])) or a9(b3.builder[dz].yaw_defn[2]) == 'extend jitter' and aY.ex_jitter(10, -10, a9(b3.builder[dz].yaw_defn[6]))) or
                    (a9(b3.builder[dz].yaw[2]) == 'off' and a9(b3.builder[dz].yaw[3]) or a9(b3.builder[dz].yaw[2]) == 'traditional' and aY.tr_jitter(a9(b3.builder[dz].yaw[4]), a9(b3.builder[dz].yaw[5])) or a9(b3.builder[dz].yaw[2]) == 'extend jitter' and aY.ex_jitter(60, -60, a9(b3.builder[dz].yaw[6])))
                cT.yaw_jitter[2] = a9(b3.builder[dz].yaw_jitter[2]) == 'off' and a9(b3.builder[dz].yaw_jitter[3]) or
                    a9(b3.builder[dz].yaw_jitter[2]) == 'traditional' and
                    aY.tr_jitter(a9(b3.builder[dz].yaw_jitter[4]), a9(b3.builder[dz].yaw_jitter[5])) or
                    a9(b3.builder[dz].yaw_jitter[2]) == 'extend jitter' and
                    aY.ex_jitter(60, -60, a9(b3.builder[dz].yaw_jitter[6]))
                cT.body_yaw[1] = a9(b3.builder[dz].body_yaw[1])
                cT.body_yaw[2] = a9(b3.builder[dz].body_yaw[2]) == 'off' and a9(b3.builder[dz].body_yaw[3]) or
                    a9(b3.builder[dz].body_yaw[2]) == 'traditional' and
                    aY.tr_jitter(a9(b3.builder[dz].body_yaw[4]), a9(b3.builder[dz].body_yaw[5])) or
                    a9(b3.builder[dz].body_yaw[2]) == 'extend' and aY.ex_jitter(60, -60, a9(b3.builder[dz].body_yaw[6])) or
                    a9(b3.builder[dz].body_yaw[2]) == 'adaptive' and aY.ex_jitter(1, -1, a9(b3.builder[dz].body_yaw[7]))
                cT.freestand_yaw = false
            end; b6.rf_data.yaw_base = (dC == 0 or dC == 3 and not a9(b3.legit_aa)) and 'At targets' or 'Local view'
            b6.rf_data.yaw[2] = (dC == 0 or dC == 3) and b6.rf_data.yaw[2] or dD; b6.rf_data.yaw_jitter[1] = b0
                .table_contain(a9(b3.manual_options), 'f. static') and dC ~= 0 and 'Off' or b6.rf_data.yaw_jitter[1]
            b6.rf_data.body_yaw[1] = b0.table_contain(a9(b3.manual_options), 'f. static') and dC ~= 0 and 'Off' or
                b6.rf_data.body_yaw[1]
        elseif dB == false then
            cT.pitch[1] = 'Minimal'
            cT.pitch[2] = 0; cT.yaw_base = 'Local view'
            cT.yaw[1] = '180'
            cT.yaw[2] = 0; cT.yaw_jitter[1] = 'Center'
            cT.yaw_jitter[2] = 0; cT.body_yaw[1] = 'Static'
            cT.body_yaw[2] = 0
        end; a4(aX.enabled, a9(b3.a_enable))
        a4(aX.pitch[1], cT.pitch[1])
        a4(aX.pitch[2], cT.pitch[2])
        a4(aX.yaw_base, cT.yaw_base)
        a4(aX.yaw[1], cT.yaw[1])
        a4(aX.yaw[2], cT.yaw[2])
        a4(aX.yaw_jitter[1], cT.yaw_jitter[1])
        a4(aX.yaw_jitter[2], cT.yaw_jitter[2])
        a4(aX.body_yaw[1], cT.body_yaw[1])
        a4(aX.body_yaw[2], cT.body_yaw[2])
        a4(aX.freestanding_body_yaw, cT.freestand_yaw)
        local cf = function(cg)
            a0(aX.enabled, cg)
            a0(aX.pitch[1], cg)
            a0(aX.pitch[2], cg)
            a0(aX.yaw_base, cg)
            a0(aX.yaw[1], cg)
            a0(aX.yaw[2], cg)
            a0(aX.yaw_jitter[1], cg)
            a0(aX.yaw_jitter[2], cg)
            a0(aX.body_yaw[1], cg)
            a0(aX.body_yaw[2], cg)
            a0(aX.freestanding_body_yaw, cg)
            a0(aX.edge_yaw, cg)
            a0(aX.freestanding[1], cg)
            a0(aX.freestanding[2], cg)
            a0(aX.roll, cg)
        end; cf(not a9(b3.a_enable))
    end; local dF = function(dG, dH, dI)
        dI = dI or 3; return dG + (dH - dG) * V() * dI
    end; aW.new = function(bm, dJ, dK, dL, dI)
        if dL ~= nil then
            if dL then
                return dF(bm, dJ, dI)
            else
                return dF(bm, dK,
                    dI)
            end
        else
            return dF(bm, dJ, dI)
        end
    end; aW.new_color = function(aZ, dM, dN, dL, dI)
        if dL ~= nil then
            if dL then
                aZ.r = dF(aZ.r, dM.r, dI)
                aZ.g = dF(aZ.g, dM.g, dI)
                aZ.b = dF(aZ.b, dM.b, dI)
                aZ.a = dF(aZ.a, dM.a, dI)
            else
                aZ.r = dF(aZ.r, dN.r, dI)
                aZ.g = dF(aZ.g, dN.g, dI)
                aZ.b = dF(aZ.b, dN.b, dI)
                aZ.a = dF(aZ.a, dN.a, dI)
            end
        else
            aZ.r = dF(aZ.r, dM.r, dI)
            aZ.g = dF(aZ.g, dM.g, dI)
            aZ.b = dF(aZ.b, dM.b, dI)
            aZ.a = dF(aZ.a, dM.a, dI)
        end; return { r = aZ.r, g = aZ.g, b = aZ.b, a = aZ.a }
    end; aW.counter = function(dO, dP, dQ)
        return 100 / (dO / (dP + dQ - globals.realtime())) <= 0 and 0 or
            100 / (dO / (dP + dQ - globals.realtime()))
    end; b1.c_alpha = 0; b1.c_scoped = 0; b1.c_scopedA = 0; b1.pixel_rectangle = function(
        cD, cE, dO, dR, dS, bE, cU, cT, dT, dU)
        ab(cD - 1, cE - 1, dO + 2, dR + 2, 25, 25, 25, cT)
        ab(cD, cE, dO, dR, dS, bE, cU, cT)
    end; b1.blur_outlined_rect = function(cD, cE, dO, dR, dS, bE, cU, cT, dV, dW, dX, dY)
        ab(cD - 1, cE - 1, dO + 2, dR + 2, 0, 0, 0, cT / 2)
        renderer.blur(cD, cE, dO * dV, dR * dV)
        if dW >= dO - dO / 10 then dW = dO - dO / 10 end; if dY >= dO - dO / 10 then dY = dO - dO / 10 end; ab(
            cD + dO / 10 / 2 - 1, cE + dX - 1, dO - dO / 10 + 2, 5, 10, 10, 10, cT)
        ab(cD + dO / 10 / 2, cE + dX, dW, 3, dS, bE, cU, cT)
        ab(cD + dO / 10 / 2, cE + dX, dY, 3, dS, bE, cU, cT / 2)
    end; b1.limited_rectangle = function(cD, cE, dO, dR, dW, dS, bE, cU, cT, dE)
        ab(cD, cE, dO, dR, dS, bE, cU, cT)
        ab(cD - 1, cE - 1, dW + 2, dR + 2, 25, 25, 25, cT / 2)
        af(cD - 1 + dW + 2, cE - 3, cD - 1 + dW + 2, cE - 3 + dR + 5, 1, 1, 1, cT)
        af(cD - 1, cE - 3, cD - 1, cE - 3 + dR + 5, 1, 1, 1, cT)
        af(cD - 1, cE - 2, cD - 1 + dW + 2, cE - 2, 1, 1, 1, cT)
        af(cD - 1, cE + dR + 1, cD - 1 + dW + 2, cE + dR + 1, 0, 0, 0, cT)
        local dZ = dW / dE; for bq = 1, dE - 1, 1 do
            local d_ = cD + bq * dZ; ab(d_, cE, 1, dR, 25, 25, 25, cT / 2)
        end
    end; b1.distance = 0; local e0 = 50; b1.center = function()
        local e1, e2 = h()
        local e3, e4 = e1 / 2, e2 / 2; local e5, e6 = ag('-', 'MYTH LUA')
        local e7, e8 = ag('-', 'MYTH')
        local dS, bE, cU, cT = a9(b3.center_color)
        b1.c_alpha = aW.new(b1.c_alpha, 1, 0, b0.table_contain(a9(b3.indicator), 'center'), 6)
        b1.c_scopedA = aW.new(b1.c_scopedA, 0, 1, a_.is_scoped(y()), 8)
        b1.c_scoped = aW.new(b1.c_scoped, 1, 0, b1.c_scopedA <= 0.2, 6)
        local e9 = aZ.fade_text(dS, bE, cU, cT * b1.c_scopedA * b1.c_alpha, 186, 198, 212, 255 * b1.c_scopedA *
            b1.c_alpha, 'MYTH')
        ae(e3 - (e5 / 2 + 5), e4 + 10 + 1, 25, 25, 25, 180 * b1.c_scopedA * b1.c_alpha, '-', nil, 'MYTH')
        ae(e3 - (e5 / 2 + 5), e4 + 10, 255, 255, 255, 255 * b1.c_scopedA * b1.c_alpha, '-', nil, e9)
        b1.pixel_rectangle(e3 - (e5 / 2 + 11) * b1.c_alpha + 1 + aq(17 * b1.c_scoped) + 1 + 1, e4 + 10 + 1 + 1, 2, 9, 25,
            25, 25, 180 * b1.c_scopedA * b1.c_alpha)
        b1.pixel_rectangle(e3 - (e5 / 2 + 11) * b1.c_alpha + 1 + aq(17 * b1.c_scoped) + 1, e4 + 10 + 1, 2, 9, 125, 125,
            125, 255 * b1.c_scopedA * b1.c_alpha)
        local ea = L(true)
        local cA, cB, cC = K(y(), "m_vecOrigin")
        for bq = 1, #ea do
            local cD, cE, cF = K(ea[bq], "m_vecOrigin")
            local d0 = ct(cA, cB, cC, cD, cE, cF)
            if d0 > e0 then e0 = d0 end; local eb = d0 / e0 * 50; b1.distance = aW.new(b1.distance, eb, 6)
        end; local ec = 50; b1.limited_rectangle(e3 - ec / 2, e4 + 25, b1.distance, 5, ec, dS, bE, cU,
            cT * b1.c_scoped * b1.c_alpha, 6)
        ae(e3 - ec / 2 - 1, e4 + 31, 205, 205, 205, 180 * b1.c_scoped * b1.c_alpha, '-', nil,
            aR(D(client.current_threat())))
        ae(e3 - (e5 / 2 + 5) + e7 + 2 + 2, e4 + 10 + 1, 25, 25, 25, 180 * b1.c_scopedA * b1.c_alpha, '-',
            e5 * b1.c_scopedA * b1.c_alpha, 'LUA.')
        ae(e3 - (e5 / 2 + 5) + e7 + 2, e4 + 10, 90, 90, 90, 255 * b1.c_scopedA * b1.c_alpha, '-',
            e5 * b1.c_scopedA * b1.c_alpha, 'LUA.')
    end; b1.ox = 0; b1.oy = 0; b1.dragging = false; b1.run_dragging = function()
        local ed = client.key_state(0x01)
        local ee, ef = ui.mouse_position()
        local cD, cE = a9(b3.pos_x), a9(b3.pos_y)
        local e1, e2 = h()
        if b1.dragging then
            local d_, eg = cD - b1.ox, cE - b1.oy; a4(b3.pos_x, ay(ao(ee + d_, 0), e1))
            a4(b3.pos_y, ay(ao(ef + eg, 0), e2))
            b1.ox, b1.oy = ee, ef
        else
            b1.ox, b1.oy = ee, ef
        end
    end; b1.is_dragging = function(cD, cE, dO, dR)
        local ee, ef = ui.mouse_position()
        local ed = client.key_state(0x01)
        local eh = ee > cD and ee < cD + dO; local ei = ef > cE and ef < cE + dR; return eh and ei and ed and _()
    end; b1.is_dragging_menu = function()
        local cD, cE = ui.mouse_position()
        local dc, dd = ui.menu_position()
        local e1, e2 = ui.menu_size()
        local ed = client.key_state(0x01)
        local eh = cD > dc and cD < dc + e1; local ei = cE > dd and cE < dd + e2; return eh and ei and ed and _()
    end; b1.t_alpha = 0; b1.t_rect = 0; b1.arrows = {
        g_alpha = 0,
        ['left'] = { r = 0, g = 0, b = 0, a = 0 },
        ['right'] = { r = 0, g = 0, b = 0, a = 0 },
        ['animate'] = { right_x = 0, left_x = 0 },
        menu_alpha = 0
    }
    b1.arrows_render = function()
        local ej = b1.arrows; local e1, e2 = h()
        local ee, ef = e1 / 2, e2 / 2; local ek = ee / 210 * a9(b3.arrow_distance)
        ej.g_alpha = aW.new(ej.g_alpha, 1, 0, b0.table_contain(a9(b3.indicator), 'manual indicator'), 6)
        if ej.g_alpha < 0.01 then return end; local el =
        '<svg t="1686019116149" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1930" width="200" height="200"><path d="M262.144 405.504l255.68-170.432a128 128 0 0 1 198.976 106.496v340.864a128 128 0 0 1-199.008 106.496l-255.648-170.432a128 128 0 0 1 0-212.992z" p-id="1931" fill="#ffffff"></path></svg>'
        local em =
        '<svg t="1686019127483" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2144" width="200" height="200"><path d="M761.856 405.504l-255.68-170.432A128 128 0 0 0 307.2 341.568v340.864a128 128 0 0 0 199.008 106.496l255.648-170.432a128 128 0 0 0 0-212.992z" p-id="2145" fill="#ffffff"></path></svg>'
        local en = renderer.load_svg(el, 32, 32)
        local eo = renderer.load_svg(em, 32, 32)
        local dC = a9(co)
        local bF, bG, bH, bI = ui.get(b3.arrow_color)
        ej['left'] = aW.new_color(ej['left'], { r = bF, g = bG, b = bH, a = bI * ej.g_alpha },
            { r = 0, g = 0, b = 0, a = 0 },
            dC == 1 or _(), 6)
        ej['right'] = aW.new_color(ej['right'], { r = bF, g = bG, b = bH, a = bI * ej.g_alpha },
            { r = 0, g = 0, b = 0, a = 0 },
            dC == 2 or _(), 6)
        local ep = ee - 34 + ek; local eq = ee - ek; ej['animate'].right_x = aW.new(ej['animate'].right_x, ep, 6)
        ej['animate'].left_x = aW.new(ej['animate'].left_x, eq, 6)
        local er = aq(ej['animate'].right_x)
        local es = aq(ej['animate'].left_x)
        renderer.texture(en, es + 1, ef + 1 + 1, 32, 31, 25, 25, 25, ej['left'].a, 'f')
        renderer.texture(eo, er + 1, ef - 1 + 1, 32, 32, 25, 25, 25, ej['right'].a, 'f')
        renderer.texture(en, es, ef + 1, 32, 31, ej['left'].r, ej['left'].g, ej['left'].b, ej['left'].a, 'f')
        renderer.texture(eo, er, ef - 1, 32, 32, ej['right'].r, ej['right'].g, ej['right'].b, ej['right'].a, 'f')
    end; b1.target_hud = function()
        local e1, e2 = h()
        local e3, e4 = e1 / 2, e2 / 2; local et = D(client.current_threat())
        b1.t_alpha = aW.new(b1.t_alpha, 1, 0, b0.table_contain(a9(b3.indicator), '1v1 helper') and et ~= 'unknown', 6)
        if et == 'unknown' then return end; local eu = K(client.current_threat(), "m_iHealth")
        local ed = client.key_state(0x01)
        local cD, cE = a9(b3.pos_x), a9(b3.pos_y)
        local dO, dR = 300, 30; local dS, bE, cU, cT = a9(b3.th_color)
        b1.t_rect = aW.new(b1.t_rect, math.floor(eu / 100 * dO), 6)
        b1.blur_outlined_rect(cD, cE, dO * b1.t_alpha, dR, dS, bE, cU, cT * b1.t_alpha, b1.t_alpha, math.floor(eu / 100 *
            dO), 8, b1.t_rect)
        local ev, ew = ag('-', string.upper(et))
        ae(cD + 13, cE + 15, 255, 255, 255, 255 * b1.t_alpha, '-', ev * b1.t_alpha + 2, string.upper(et))
        ae(cD + dO - 48 + 1, cE + 14 - 1, 10, 10, 10, cT * b1.t_alpha, '-', nil, '❤')
        ae(cD + dO - 48 - 1, cE + 14 + 1, 10, 10, 10, cT * b1.t_alpha, '-', nil, '❤')
        ae(cD + dO - 48 + 1, cE + 14 + 1, 10, 10, 10, cT * b1.t_alpha, '-', nil, '❤')
        ae(cD + dO - 48 - 1, cE + 14 - 1, 10, 10, 10, cT * b1.t_alpha, '-', nil, '❤')
        ae(cD + dO - 48, cE + 14, dS, bE, cU, cT * b1.t_alpha, '-', nil, '❤')
        ae(cD + dO - 49 + 15, cE + 15, 255, 255, 255, 255 * b1.t_alpha, '-', nil, ":  " .. string.upper(eu))
        if b1.is_dragging(cD, cE, dO, dR) and not b1.is_dragging_menu() then b1.dragging = true elseif not ed then b1.dragging = false end; b1
            .run_dragging()
    end; b1.render = function()
        b1.target_hud()
        b1.center()
        b1.arrows_render()
    end; b4.setup_command = function(cW) b6.setup_anti(cW) end; b4.paint_ui = function() b5.visible() end; b4.paint = function()
        b1.render()
    end; b4.paint_ui()
    b4._register = function()
        g('paint_ui', b4.paint)
        g('paint_ui', b4.paint_ui)
        g('setup_command', b4.setup_command)
        b0._call(b2.register_data, b5.visible)
    end; b4._register()
end
b8()
