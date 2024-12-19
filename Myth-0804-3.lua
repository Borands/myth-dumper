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
local b8 = database.read("myth_cred") or {}
b8.username = "cracked by gmatch"
local b9 = function()
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
    b0.new = function(ba, bb, bc, bd)
        bd = bd or nil; if type(ba) ~= "number" then return end; table.insert(bc[type(ui.get(ba))], ba)
        if bd ~= nil then table.insert(bd[type(ui.get(ba))], ba) end; table.insert(bb, ba)
        return ba
    end; b0.load = function(bc, be)
        if be == nil then return end; local bf = function(bg, bh)
            local bi = {}
            for bj in string.gmatch(bg, "([^" .. bh .. "]+)") do bi[#bi + 1] = string.gsub(bj, "\n", "") end; return bi
        end; local bk = function(bj) if bj == "true" or bj == "false" then return bj == "true" else return bj end end; local bi =
            bf(b7.decode(be and be or nil, 'base64'), "|")
        local bl = 1; for bm, bn in pairs(bc['number']) do
            if bi[bl] == nil then return end; ui.set(bn, tonumber(bi[bl]))
            bl = bl + 1
        end; for bm, bn in pairs(bc['string']) do
            if bi[bl] == nil then return end; ui.set(bn, bi[bl])
            bl = bl + 1
        end; for bm, bn in pairs(bc['boolean']) do
            if bi[bl] == nil then return end; ui.set(bn, bk(bi[bl]))
            bl = bl + 1
        end; for bm, bn in pairs(bc['table']) do
            if bi[bl] == nil then return end; ui.set(bn, bf(bi[bl], ","))
            bl = bl + 1
        end
    end; b0.exp = function(bc)
        local bo = ""
        local bp = function(bq)
            local bj = ""
            for br = 1, #bq do bj = bj .. bq[br] .. (br == #bq and "" or ",") end; if bj == "" then bj = "-" end; return
                bj
        end; for bm, bn in pairs(bc['number']) do bo = bo .. tostring(ui.get(bn)) .. "|" end; for bm, bn in pairs(bc['string']) do
            bo =
                bo .. ui.get(bn) .. "|"
        end; for bm, bn in pairs(bc['boolean']) do bo = bo .. tostring(ui.get(bn)) .. "|" end; for bm, bn in pairs(bc['table']) do
            bo =
                bo .. bp(ui.get(bn)) .. "|"
        end; return b7.encode(bo)
    end; b0.table_contain = function(bs, bt)
        for br = 1, #bs do if bs[br] == bt then return true end end; return false
    end; b0._call = function(bb, bu) for bv, bn in pairs(bb) do ui.set_callback(bn, bu) end end; aZ.lerp = function(self,
                                                                                                                    bw,
                                                                                                                    bx,
                                                                                                                    by)
        if type(bw) == 'table' and type(bx) == 'table' then
            return { self:lerp(bw[1], bx[1], by), self:lerp(bw[2], bx[2],
                by), self:lerp(bw[3], bx[3], by) }
        end; return bw + (bx - bw) * by
    end; aZ.console = function(self, ...)
        for br, bz in ipairs({ ... }) do
            if type(bz[1]) == 'table' and type(bz[2]) == 'table' and type(bz[3]) == 'string' then
                for bA = 1, #bz[3] do
                    local bB = self:lerp(bz[1], bz[2], bA / #bz[3])
                    j(bB[1], bB[2], bB[3], bz[3]:sub(bA, bA) .. '\0')
                end
            elseif type(bz[1]) == 'table' and type(bz[2]) == 'string' then
                j(bz[1][1], bz[1][2], bz[1][3],
                    bz[2] .. '\0')
            end
        end
    end; aZ.text = function(self, ...)
        local bC = false; local bD = 255; local bE = ''
        for br, bz in ipairs({ ... }) do
            if type(bz) == 'boolean' then
                bC = bz
            elseif type(bz) == 'number' then
                bD = bz
            elseif type(bz) == 'string' then
                bE =
                    bE .. bz
            elseif type(bz) == 'table' then
                if type(bz[1]) == 'table' and type(bz[2]) == 'string' then
                    bE =
                        bE .. ('\a%02x%02x%02x%02x'):format(bz[1][1], bz[1][2], bz[1][3], bD) .. bz[2]
                elseif type(bz[1]) == 'table' and type(bz[2]) == 'table' and type(bz[3]) == 'string' then
                    for bA = 1, #bz[3] do
                        local bF = self:lerp(bz[1], bz[2], bA / #bz[3])
                        bE = bE .. ('\a%02x%02x%02x%02x'):format(bF[1], bF[2], bF[3], bD) .. bz[3]:sub(bA, bA)
                    end
                end
            end
        end; return ('%s\a%s%02x'):format(bE, bC and 'cdcdcd' or 'ffffff', bD)
    end; aZ.log = function(self, ...)
        for br, bz in ipairs({ ... }) do
            if type(bz) == 'table' then
                if type(bz[1]) == 'table' then
                    if type(bz[2]) == 'string' then
                        self:console({ bz[1], bz[1], bz[2] })
                        if bz[3] then self:console({ { 255, 255, 255 }, '\n' }) end
                    elseif type(bz[2]) == 'table' then
                        self:console({ bz[1], bz[2], bz[3] })
                        if bz[4] then self:console({ { 255, 255, 255 }, '\n' }) end
                    end
                elseif type(bz[1]) == 'string' then
                    self:console({ { 205, 205, 205 }, bz[1] })
                    if bz[2] then self:console({ { 255, 255, 255 }, '\n' }) end
                end
            end
        end
    end; aZ.gradient_text = function(bG, bH, bI, bJ, bK, bL, bM, bN, bO)
        local bP = ''
        local bQ = #bO - 1; local bR = (bK - bG) / bQ; local bS = (bL - bH) / bQ; local bT = (bM - bI) / bQ; local bU = (bN - bJ) /
            bQ; for br = 1, bQ + 1 do
            bP = bP .. ('\a%02x%02x%02x%02x%s'):format(bG, bH, bI, bJ, bO:sub(br, br))
            bG = bG + bR; bH = bH + bS; bI = bI + bT; bJ = bJ + bU
        end; return bP
    end; aZ.fade_text = function(bG, bH, bI, bJ, bK, bL, bM, bN, bV)
        local bW = globals.realtime() / 2 % 1.2 * 2 - 1.2; local bP = ""
        if bV == nil then return end; for bX = 1, #bV do
            local bY = bV:sub(bX, bX)
            local bZ = bX / #bV; local b_ = bZ - bW; if b_ >= 0 and b_ <= 1.4 then
                if b_ > 0.7 then b_ = 1.4 - b_ end; local c0, c1, c2, c3 = bK - bG, bL - bH, bM - bI; bG = bG + c0 * b_ /
                    0.8; bH = bH + c1 * b_ / 0.8; bI = bI + c2 * b_ / 0.8
            end; bP = bP .. ('\a%02x%02x%02x%02x%s'):format(bG, bH, bI, bJ, bV:sub(bX, bX))
        end; return bP
    end; local c4 = function(...)
        local c5 = { ... }
        aZ:log({ { 235, 42, 142 }, { 186, 198, 212 }, "Myth" }, { { 100, 100, 100 }, " <=> " },
            { { 255, 255, 255 }, string.format(unpack(c5)), true })
    end; c4('Started your Myth!')
    aV.build = 'Initiate'
    aZ:log({ { 235, 42, 142 }, { 186, 198, 212 }, "Myth" }, { { 100, 100, 100 }, " <=> " },
        { { 255, 255, 255 }, "Myth Anti-aimbot angles system V.1" }, { { 144, 194, 54 }, '._A' },
        { { 205, 205, 205 }, " edition:" }, { { 239, 86, 86 }, " " .. aV.build, true })
    c4('Warning: This is BETA test version, if you met any problem while playing, please contact admin directly.')
    c4('Welcome BACK! ' .. b8.username)
    b2.register_data = {}
    b2.register_ui = { ['number'] = {}, ['string'] = {}, ['boolean'] = {}, ['table'] = {} }
    b2.register_aa = { ['number'] = {}, ['string'] = {}, ['boolean'] = {}, ['table'] = {} }
    local c6, c7 = 'aa', 'anti-aimbot angles'
    local c8, c9 = 'aa', 'other'
    local ca, cb = 'aa', 'Fake lag'
    b3.c_og = b0.new(aU(c6, c7, "\a6E6868FF#hide og  ▲"), b2.register_data, b2.register_ui)
    b3.c_og_box = b0.new(a5(c6, c7, "=========================================="), b2.register_data, b2.register_ui)
    b3.spacing = aU(c6, c7, ' ')
    b3.cnameS = b0.new(aU(c6, c7, "\aFF105DFFMyth\a6E6868FF.lua - \a774CFFFF" .. aV.build .. " - \a96C83CFF" ..
        b8.username), b2.register_data, b2.register_ui)
    b3.cname2 = b0.new(aU(c6, c7, "\a6E6868FF£- Born to be a legend."), b2.register_data, b2.register_ui)
    b3.spacingA = aU(c8, c9, ' ')
    b3.spacingB = aU(c8, c9, ' ')
    b3.spacingC = aU(c8, c9, ' ')
    b3.spacingA = aU(c8, c9, ' ')
    b3.page_slider = b0.new(
    X(c8, c9, " ", 0, 3, 0, true, '', 1, {
        [0] = 'init.',
        [1] = 'anti-aim.',
        [2] = 'func.',
        [3] =
        'up.inf.'
    }), b2.register_data, b2.register_ui)
    b3.cname = b0.new(
        aU(c8, c9, "               \aFF105DFFMyth\a6E6868FF.lua - \a774CFFFF" .. aV.build ..
            "\aFFFFFFC8 - Page \a6E6868FFMain"), b2.register_data, b2.register_ui)
    local cc = { 'stand', 'move', 'duck', 'slow-motion', 'air', 'air + duck' }
    b3.a_enable = b0.new(a5(c6, c7, "Boost anti-aimbot angles"), b2.register_data, b2.register_ui)
    b3.a_state = b0.new(Y(c6, c7, "states", cc), b2.register_data, b2.register_ui)
    b3.builder = {}
    b3.pos_x = b0.new(X("LUA", "B", "\nSaved Position X INDICATOR", 0, 10000, 10), b2.register_data, b2.register_ui)
    b3.pos_y = b0.new(X("LUA", "B", "\nSaved Position Y INDICATOR", 0, 10000, 10), b2.register_data, b2.register_ui)
    local cd = {}
    for bA, bz in pairs(cc) do
        cd[bA] = "\a6E6868FF#" .. cc[bA] .. ""
        b3.builder[bA] = {
            defen_option = b0.new(Y(c6, c7, 'should defen.?', { 'off', 'adp.', 'force' }),
                b2.register_data, b2.register_ui, b2.register_aa),
            pitch_defn = { b0.new(Y(c6, c7, '\aE5D841FF*pitch', { "Off", "Default", "Up", "Down", "Minimal", "Random", "Custom" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " pd", -89, 89, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) },
            yaw_defn = { b0.new(Y(c6, c7, "\aE5D841FF*yaw", { "Off", '180', 'Spin', 'Static', '180 Z', 'Crosshair' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c6, c7, "\aE5D841FF*extend yaw", { "off", 'traditional', 'extend jitter' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " sA", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " tr. lefts", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " tr. rights", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " ex. values", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) },
            pitch = { b0.new(Y(c6, c7, 'pitch', { "Off", "Default", "Up", "Down", "Minimal", "Random", "Custom" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " p", -89, 89, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) },
            yaw = { b0.new(Y(c6, c7, "yaw", { "Off", '180', 'Spin', 'Static', '180 Z', 'Crosshair' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c6, c7, "extend yaw", { "off", 'traditional', 'extend jitter' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " a", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " tr. leftd", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " tr. rightd", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " ex. valued", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) },
            yaw_jitter = { b0.new(Y(c6, c7, "yaw jitter", { "Off", 'Offset', 'Center', "Random", "Skitter" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c6, c7, "extend func.", { "off", 'traditional', 'extend jitter' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " a.", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " tr. leftp", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " tr. rightp", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " ex. valuep", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) },
            body_yaw = { b0.new(Y(c6, c7, "body yaw", { 'Off', 'Opposite', 'Jitter', 'Static' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c6, c7, "optional body", { "off", "traditional", "extend", "adaptive" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. "sAp", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " tr. min", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " tr. max", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " ex. max", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c6, c7, cd[bA] .. " adp. relay", -27, 34, 0, true, "*"), b2.register_data, b2.register_ui, b2.register_aa) }
        }
    end; b3.p2_spacingA = b0.new(aU(c6, c7, '\a6E6868FF#'), b2.register_data, b2.register_ui)
    b3.p2_cnameA = b0.new(aU(c6, c7, '\a6E6868FFkey sets.'), b2.register_data, b2.register_ui)
    b3.p2_spacingB = b0.new(aU(c6, c7, ' '), b2.register_data, b2.register_ui)
    b3.manual_options = b0.new(a8(c6, c7, 'manual options', { 'f. static', 'f. straight' }), b2.register_data,
        b2.register_ui)
    b3.manual_left = { false, a6(c6, c7, 'manual left') }
    b3.manual_right = { false, a6(c6, c7, 'manual right') }
    b3.manual_reset = { false, a6(c6, c7, 'manual reset') }
    b3.legit_aa = a6(c6, c7, 'antiaim on use')
    b3.freestanding = { false, a6(c6, c7, 'freestanding') }
    b3.edge_yaw = { false, a6(c6, c7, 'edge yaw') }
    b3.p2_spacingE = b0.new(aU(c6, c7, ' '), b2.register_data, b2.register_ui)
    b3.p2_spacingC = b0.new(aU(c6, c7, '\a6E6868FF#'), b2.register_data, b2.register_ui)
    b3.p2_cnameB = b0.new(aU(c6, c7, '\a6E6868FFui.'), b2.register_data, b2.register_ui)
    b3.p2_spacingD = b0.new(aU(c6, c7, ' '), b2.register_data, b2.register_ui)
    b3.indicator = b0.new(a8(c6, c7, 'should render.?', { 'manual indicator', '1v1 helper', 'center', 'notify', '...' }),
        b2.register_data, b2.register_ui)
    b3.arrow_distance = b0.new(X(c6, c7, ' distance', 10, 100, 15, true, 'pt.'), b2.register_data, b2.register_ui)
    b3.p2_spacingF = b0.new(aU(c6, c7, ' '), b2.register_data, b2.register_ui)
    b3.th_color_cname = b0.new(aU(c6, c7, 'change 1v1 helper color.?'), b2.register_data, b2.register_ui)
    b3.th_color = b0.new(a2(c6, c7, 'change 1v1 helper  color.?_color', 235, 42, 142, 255), b2.register_data,
        b2.register_ui)
    b3.center_color_cname = b0.new(aU(c6, c7, 'change center color.?'), b2.register_data, b2.register_ui)
    b3.center_color = b0.new(a2(c6, c7, 'change center color.?_color', 235, 42, 142, 255), b2.register_data,
        b2.register_ui)
    b3.arrow_color_cname = b0.new(aU(c6, c7, 'change arrows color.?'), b2.register_data, b2.register_ui)
    b3.arrow_color = b0.new(a2(c6, c7, 'change arrows color.?_color', 235, 42, 142, 255), b2.register_data,
        b2.register_ui)
    b3.noti_color_cname = b0.new(aU(c6, c7, 'change notify color.?'), b2.register_data, b2.register_ui)
    b3.noti_color = b0.new(a2(c6, c7, 'change notify color.?_color', 235, 42, 142, 255), b2.register_data, b2
        .register_ui)
    b3.p2_spacingG = b0.new(aU(c6, c7, ' '), b2.register_data, b2.register_ui)
    b3.p2_spacingH = b0.new(aU(c6, c7, '\a6E6868FF#'), b2.register_data, b2.register_ui)
    b3.p2_cnameC = b0.new(aU(c6, c7, '\a6E6868FFmisc.'), b2.register_data, b2.register_ui)
    b3.p2_spacingI = b0.new(aU(c6, c7, ' '), b2.register_data, b2.register_ui)
    b3.features = b0.new(a8(c6, c7, 'should enable.?', { 'anti-knife', 'anim. breaker', '...' }), b2.register_data,
        b2.register_ui)
    b3.m_antidis = b0.new(X(c6, c7, ' anti-distance', 200, 600, 280, true, 'm'), b2.register_data, b2.register_ui)
    b3.m_animbreak = b0.new(a8(c6, c7, ' anims', { "in air", "on land", "leg fucker" }), b2.register_data, b2
        .register_ui)
    b5.visible = function()
        local ce = Z('MISC', 'Settings', "Menu color")
        a4(ce, 235, 42, 142, 255)
        local cf = aZ.fade_text(61, 61, 61, 255, 200, 200, 200, 255, 'legend')
        a4(b3.cname2, "\a6E6868FF£- Born to be a " .. cf .. '.')
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
        end; local cg = function(
            ch)
            a0(aX.enabled, ch)
            a0(aX.pitch[1], ch)
            a0(aX.pitch[2], ch)
            a0(aX.yaw_base, ch)
            a0(aX.yaw[1], ch)
            a0(aX.yaw[2], ch)
            a0(aX.yaw_jitter[1], ch)
            a0(aX.yaw_jitter[2], ch)
            a0(aX.body_yaw[1], ch)
            a0(aX.body_yaw[2], ch)
            a0(aX.freestanding_body_yaw, ch)
            a0(aX.edge_yaw, ch)
            a0(aX.freestanding[1], ch)
            a0(aX.freestanding[2], ch)
            a0(aX.roll, ch)
        end; if not a9(b3.a_enable) then cg(a9(b3.c_og_box)) end; local ci, cj, ck, cl = a9(b3.page_slider) == 0,
            a9(b3.page_slider) == 1, a9(b3.page_slider) == 2, a9(b3.page_slider) == 3; a0(b3.cnameS, ci)
        a0(b3.cname2, ci)
        a0(b3.a_enable, cj)
        local cm = a9(b3.a_enable) and cj; a0(b3.a_state, cm)
        for bA, bz in pairs(cc) do
            local cn = cm and a9(b3.a_state) == cc[bA]
            a0(b3.builder[bA].defen_option, cn)
            local co = cn and a9(b3.builder[bA].defen_option) ~= "off"
            a0(b3.builder[bA].pitch_defn[1], co)
            a0(b3.builder[bA].pitch_defn[2], co and a9(b3.builder[bA].pitch_defn[1]) == 'Custom')
            a0(b3.builder[bA].yaw_defn[1], co)
            a0(b3.builder[bA].yaw_defn[2], co and a9(b3.builder[bA].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[bA].yaw_defn[3],
                co and a9(b3.builder[bA].yaw_defn[2]) == 'off' and a9(b3.builder[bA].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[bA].yaw_defn[4],
                co and a9(b3.builder[bA].yaw_defn[2]) == 'traditional' and a9(b3.builder[bA].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[bA].yaw_defn[5],
                co and a9(b3.builder[bA].yaw_defn[2]) == 'traditional' and a9(b3.builder[bA].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[bA].yaw_defn[6],
                co and a9(b3.builder[bA].yaw_defn[2]) == 'extend jitter' and a9(b3.builder[bA].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[bA].pitch[1], cn)
            a0(b3.builder[bA].pitch[2], cn and a9(b3.builder[bA].pitch[1]) == 'Custom')
            a0(b3.builder[bA].yaw[1], cn)
            a0(b3.builder[bA].yaw[2], cn and a9(b3.builder[bA].yaw[1]) ~= 'Off')
            a0(b3.builder[bA].yaw[3], cn and a9(b3.builder[bA].yaw[2]) == 'off' and a9(b3.builder[bA].yaw[1]) ~= 'Off')
            a0(b3.builder[bA].yaw[4], cn and a9(b3.builder[bA].yaw[2]) == 'traditional' and
                a9(b3.builder[bA].yaw[1]) ~= 'Off')
            a0(b3.builder[bA].yaw[5], cn and a9(b3.builder[bA].yaw[2]) == 'traditional' and
                a9(b3.builder[bA].yaw[1]) ~= 'Off')
            a0(b3.builder[bA].yaw[6],
                cn and a9(b3.builder[bA].yaw[2]) == 'extend jitter' and a9(b3.builder[bA].yaw[1]) ~= 'Off')
            a0(b3.builder[bA].yaw_jitter[1], cn)
            a0(b3.builder[bA].yaw_jitter[2], cn and a9(b3.builder[bA].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[bA].yaw_jitter[3],
                cn and a9(b3.builder[bA].yaw_jitter[2]) == 'off' and a9(b3.builder[bA].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[bA].yaw_jitter[4],
                cn and a9(b3.builder[bA].yaw_jitter[2]) == 'traditional' and a9(b3.builder[bA].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[bA].yaw_jitter[5],
                cn and a9(b3.builder[bA].yaw_jitter[2]) == 'traditional' and a9(b3.builder[bA].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[bA].yaw_jitter[6],
                cn and a9(b3.builder[bA].yaw_jitter[2]) == 'extend jitter' and a9(b3.builder[bA].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[bA].body_yaw[1], cn)
            a0(b3.builder[bA].body_yaw[2], cn and a9(b3.builder[bA].body_yaw[1]) ~= 'Off')
            a0(b3.builder[bA].body_yaw[3],
                cn and a9(b3.builder[bA].body_yaw[2]) == 'off' and a9(b3.builder[bA].body_yaw[1]) ~= 'Off')
            a0(b3.builder[bA].body_yaw[4],
                cn and a9(b3.builder[bA].body_yaw[2]) == 'traditional' and a9(b3.builder[bA].body_yaw[1]) ~= 'Off')
            a0(b3.builder[bA].body_yaw[5],
                cn and a9(b3.builder[bA].body_yaw[2]) == 'traditional' and a9(b3.builder[bA].body_yaw[1]) ~= 'Off')
            a0(b3.builder[bA].body_yaw[6],
                cn and a9(b3.builder[bA].body_yaw[2]) == 'extend' and a9(b3.builder[bA].body_yaw[1]) ~= 'Off')
            a0(b3.builder[bA].body_yaw[7],
                cn and a9(b3.builder[bA].body_yaw[2]) == 'adaptive' and a9(b3.builder[bA].body_yaw[1]) ~= 'Off')
        end; a0(b3.manual_options, ck)
        a0(b3.manual_left[2], ck)
        a0(b3.manual_right[2], ck)
        a0(b3.manual_reset[2], ck)
        a0(b3.legit_aa, ck)
        a0(b3.freestanding[2], ck)
        a0(b3.edge_yaw[2], ck)
        a0(b3.p2_cnameA, ck)
        a0(b3.p2_spacingA, ck)
        a0(b3.p2_spacingB, ck)
        a0(b3.p2_cnameB, ck)
        a0(b3.p2_cnameC, ck)
        a0(b3.p2_spacingC, ck)
        a0(b3.p2_spacingD, ck)
        a0(b3.p2_spacingE, ck)
        a0(b3.p2_spacingF, ck)
        a0(b3.p2_spacingG, ck)
        a0(b3.p2_spacingH, ck)
        a0(b3.p2_spacingI, ck)
        a0(b3.indicator, ck)
        a0(b3.arrow_distance, ck and b0.table_contain(a9(b3.indicator), 'manual indicator'))
        a0(b3.th_color_cname, ck and b0.table_contain(a9(b3.indicator), '1v1 helper'))
        a0(b3.th_color, ck and b0.table_contain(a9(b3.indicator), '1v1 helper'))
        a0(b3.center_color_cname, ck and b0.table_contain(a9(b3.indicator), 'center'))
        a0(b3.center_color, ck and b0.table_contain(a9(b3.indicator), 'center'))
        a0(b3.arrow_color_cname, ck and b0.table_contain(a9(b3.indicator), 'manual indicator'))
        a0(b3.arrow_color, ck and b0.table_contain(a9(b3.indicator), 'manual indicator'))
        a0(b3.noti_color_cname, ck and b0.table_contain(a9(b3.indicator), 'notify'))
        a0(b3.noti_color, ck and b0.table_contain(a9(b3.indicator), 'notify'))
        a0(b3.features, ck)
        a0(b3.m_antidis, ck and b0.table_contain(a9(b3.features), 'anti-knife'))
        a0(b3.m_animbreak, ck and b0.table_contain(a9(b3.features), 'anim. breaker'))
    end; b5.visible()
    local cp = ui.new_slider('lua', 'b', '_temp_states', 0, 3, 0)
    a0(cp, false)
    local J, K = entity.get_player_weapon, entity.get_prop; local cq = 0; local cr = function(cs)
        local ct = bit.band(K(cs, "m_fFlags"), 1)
        if ct == 1 then cq = cq + 1 else cq = 0 end; return cq > 8
    end; local cu = function(cv, cw, cx, cy, cz, cA) return math.sqrt((cy - cv) ^ 2 + (cz - cw) ^ 2 + (cA - cx) ^ 2) end; a_.get_dist_to_ety = function(
        cB, cC, cD, cE, cF, cG)
        return cu(cB, cC, cD, cE, cF, cG)
    end; a_.is_scoped = function(a_)
        if J(a_) == nil then return end; return K(J(a_), "m_zoomLevel") == 1 or K(J(a_), "m_zoomLevel") == 2
    end; a_.is_slowdown = function(cs) return K(cs, "m_flVelocityModifier") ~= 1 end; a_.get_velocity = function(cs)
        local cH, cI, cJ = K(cs, "m_vecVelocity")
        return math.sqrt(cH ^ 2 + cI ^ 2)
    end; a_.is_static = function(cs) return a_.get_velocity(cs) < 2 and cr(cs) end; a_.is_move = function(cs)
        return a_
            .get_velocity(cs) > 10 and cr(cs)
    end; a_.is_duck = function(cs)
        local cK = K(cs, "m_flDuckAmount") > 0.8; return cK and cr(cs)
    end; a_.is_slowmotion = function(cs) return ui.get(aX.slow_motion[1]) and ui.get(aX.slow_motion[2]) end; a_.is_air = function(
        cs)
        return bit.band(K(cs, "m_fFlags"), 1) == 0 and cq <= 6
    end; a_.is_airduck = function(cs)
        return a_.is_air(cs) and
            K(cs, "m_flDuckAmount") > 0.8 and cq <= 6
    end; local cL = { dir = 0, m_states = 0, left = false, right = false, back = false }
    local cp = ui.new_slider('lua', 'b', '_aafunc_states', 0, 3, 1)
    ui.set_visible(cp, false)
    aY.get_direct = function(...)
        local cM = { ... }
        for bA, bz in pairs(cM) do
            if type(bz) ~= 'number' then
                print('args should be menu elements')
                return
            end
        end; ui.set(cM[1], 'On hotkey')
        ui.set(cM[2], 'On hotkey')
        ui.set(cM[3], 'On hotkey')
        ui.set(aX.freestanding[2], 'Always on')
        local cN, cO = ui.get(cM[4]), ui.get(cM[5])
        ui.set(aX.freestanding[1], cN)
        ui.set(aX.edge_yaw, cO)
        m_states = ui.get(cp)
        left, right, back = ui.get(cM[1]), ui.get(cM[2]), ui.get(cM[3])
        if left == cL.left and right == cL.right and back == cL.back then return end; cL.left, cL.right, cL.back = left,
            right, back; if left and m_states == 1 or right and m_states == 2 or back and m_states == 3 then
            ui.set(cp, 0)
            return
        end; if left and m_states ~= 1 then ui.set(cp, 1) end; if right and m_states ~= 2 then ui.set(cp, 2) end; if back and m_states ~= 3 then
            ui.set(cp, 3)
        end; cL.dir = ui.get(cp) == 0 and 0 or ui.get(cp) == 1 and -90 or ui.get(cp) == 2 and 90 or
            ui.get(cp) == 3 and 0; return cL.dir
    end; aY.get_dir_data = function() return cL.dir end; aY.normalize_angle = function(cP)
        while cP > 180 do cP = cP - 360 end; while cP < -180 do cP = cP + 360 end; return cP
    end; aY.get_sIndex = function(cs, cQ) if a_.is_airduck(cs) then return 6 elseif a_.is_air(cs) then return 5 elseif a_.is_slowmotion(cs) then return 4 elseif a_.is_duck(cs) then return 3 elseif a_.is_move(cs) and not a_.is_slowmotion(cs) then return 2 elseif a_.is_static(cs) and not a_.is_slowmotion(cs) then return 1 else return 6 end end; local cR = false; local cS = function()
        if entity.get_local_player() == nil then return end; local cT = ui.get(aX.body_yaw[2])
        cT = math.abs(cT) == 0 and 60 or cT; cR = math.floor(math.min(math.abs(cT / 3),
                entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * math.abs(cT / 3) * 2 -
                math.abs(cT / 3))) >
            0
    end; client.set_event_callback('paint_ui', cS)
    aY.tr_jitter = function(cU, cV) return cR and cU or cV end; aY.ex_jitter = function(cU, cV, cW)
        cU = cU + cW; cV = cV + cW; return cR and aY.normalize_angle(cU) or aY.normalize_angle(cV)
    end; aY.on_use = function(cX)
        local cu = function(cv, cw, cx, cy, cz, cA) return math.sqrt((cy - cv) ^ 2 + (cz - cw) ^ 2 + (cA - cx) ^ 2) end; local cY = function(
            cZ)
            local c_ = entity.get_all("CC4")[1]
            return c_ ~= nil and entity.get_prop(c_, "m_hOwnerEntity") == cZ
        end; local d0 = entity.get_local_player()
        local d1 = 100; local c_ = entity.get_all('CPlantedC4')[1]
        local d2, d3, d4 = K(c_, "m_vecOrigin")
        if d2 ~= nil then
            local d5, d6, d7 = K(d0, "m_vecOrigin")
            d1 = cu(d2, d3, d4, d5, d6, d7)
        end; local d8 = K(d0, "m_iTeamNum")
        local d9 = d8 == 3 and d1 < 62; local da = K(d0, "m_bInBombZone")
        local db = cY(d0)
        local dc = da ~= 0 and d8 == 2 and db and false; local dd, de, df = o()
        local dg, dh = t()
        local di = az(aE(dg))
        local dj = al(aE(dg))
        local dk = az(aE(dh))
        local dl = al(aE(dh))
        local dm = { dj * dl, dj * dk, -di }
        local dn, dp = f(d0, dd, de, df, dd + dm[1] * 8192, de + dm[2] * 8192, df + dm[3] * 8192)
        local dq = true; local dr = { "CWorld", "CCSPlayer", "CFuncBrush" }
        if dp ~= nil then for br = 0, #dr do if entity.get_classname(dp) == dr[br] then dq = false end end end; if not dq and not dc and not d9 then cX.in_use = 0 end
    end; b6.update_manual = function()
        a4(b3.manual_left[2], 'On hotkey')
        a4(b3.manual_right[2], 'On hotkey')
        a4(b3.manual_reset[2], 'On hotkey')
        a0(cp, false)
        local ds = a9(cp)
        local dt, du, dv = a9(b3.manual_left[2]), a9(b3.manual_right[2]), a9(b3.manual_reset[2])
        local dw = a9(b3.edge_yaw[2])
        a4(aX.edge_yaw, dw and true or false)
        if a9(b3.freestanding[2]) then
            b3.freestanding[1] = true; a4(aX.freestanding[1], true)
            a4(aX.freestanding[2], 'Always on')
            return
        else
            a4(aX.freestanding[1], false)
            b3.freestanding[1] = true
        end; if dt == b3.manual_left[1] and du == b3.manual_right[1] and dv == b3.manual_reset[1] then return end; b3.manual_left[1], b3.manual_right[1], b3.manual_reset[1] =
            dt, du, dv; if dt and ds == 1 or du and ds == 2 or dv and ds == 3 then
            a4(cp, 0)
            return
        end; if dt and ds ~= 1 then a4(cp, 1) end; if du and ds ~= 2 then a4(cp, 2) end; if dv and ds ~= 3 then a4(cp, 3) end
    end; b6.rf_data = { pitch = { 'Default', 0 }, yaw_base = 'Local view', yaw = { '180', 0 }, yaw_jitter = { 'Off', 0 }, body_yaw = { 'Static', 0 }, freestand_yaw = false }
    b6.def_data = { cmd_num = 0, checker = 0, tickbase = 0 }
    b6.update_cmdnumber = function(cX) b6.def_data.cmd_num = cX.command_number end; b6.update_tickbase = function(cX)
        if cX.command_number == b6.def_data.cmd_num then
            local dx = K(y(), "m_nTickBase")
            b6.def_data.tickbase = math.abs(dx - b6.def_data.checker)
            b6.def_data.checker = math.max(dx, b6.def_data.checker or 0)
            b6.def_data.cmd_num = 1
        end
    end; b6.is_defensive_active = function()
        local dy = y()
        if dy == nil then return false end; if (a9(aX.hide_shots[1]) == false or a9(aX.hide_shots[2]) == false) and (a9(aX.doubletap[1]) == false or a9(aX.doubletap[2]) == false) then return false end; return
            b6.def_data.tickbase > 2.999681459999995998498010104 and
            b6.def_data.tickbase < 16.02989523959497059475636968798249830139991
    end; b6.reset_defn = function()
        b6.def_data.defensive = 0; b6.def_data.checker = 0
    end; local dz = require('gamesense/csgo_weapons')
    b6.do_defensive = function(cX)
        local dA = aY.get_sIndex(y(), b3.builder)
        if a9(b3.builder[dA].defen_option) ~= 'off' then cX.force_defensive = true end; local dB = true; if J(y()) ~= nil and dz(J(y())).type == "knife" then dB = false end; if b6.is_defensive_active() and dB then return true end
    end; g("run_command", b6.update_cmdnumber)
    g("predict_command", b6.update_tickbase)
    g("level_init", b6.reset_defn)
    b6.setup_anti = function(cX)
        local dC = a9(b3.a_enable)
        local cU = b6.rf_data; b6.update_manual()
        local dD = a9(cp)
        local dE = ({ [1] = b0.table_contain(a9(b3.manual_options), 'f. straight') and -90 or -70, [2] = b0.table_contain(a9(b3.manual_options), 'f. straight°') and 90 or 110 })
            [dD]
        local dA = aY.get_sIndex(y(), b3.builder)
        if dC then
            if a9(b3.legit_aa) then
                aY.on_use(cX)
                cU.pitch[1] = 'Off'
                cU.yaw[1] = 'Off'
                cU.yaw_jitter[1] = 'Off'
                cU.body_yaw[1] = 'Static'
                cU.body_yaw[2] = -180; cU.freestand_yaw = true
            else
                local dF = b6.do_defensive(cX)
                cU.pitch[1] = a9(b3.builder[dA].defen_option) ~= 'off' and dF and a9(b3.builder[dA].pitch_defn[1]) or
                    a9(b3.builder[dA].pitch[1])
                cU.pitch[2] = a9(b3.builder[dA].defen_option) ~= 'off' and dF and a9(b3.builder[dA].pitch_defn[2]) or
                    a9(b3.builder[dA].pitch[2])
                cU.yaw[1] = a9(b3.builder[dA].defen_option) ~= 'off' and dF and a9(b3.builder[dA].yaw_defn[1]) or
                    a9(b3.builder[dA].yaw[1])
                cU.yaw_jitter[1] = a9(b3.builder[dA].yaw_jitter[1])
                cU.yaw[2] = a9(b3.builder[dA].defen_option) ~= 'off' and dF and
                    (a9(b3.builder[dA].yaw_defn[2]) == 'off' and a9(b3.builder[dA].yaw_defn[3]) or a9(b3.builder[dA].yaw_defn[2]) == 'traditional' and aY.tr_jitter(a9(b3.builder[dA].yaw_defn[4]), a9(b3.builder[dA].yaw_defn[5])) or a9(b3.builder[dA].yaw_defn[2]) == 'extend jitter' and aY.ex_jitter(10, -10, a9(b3.builder[dA].yaw_defn[6]))) or
                    (a9(b3.builder[dA].yaw[2]) == 'off' and a9(b3.builder[dA].yaw[3]) or a9(b3.builder[dA].yaw[2]) == 'traditional' and aY.tr_jitter(a9(b3.builder[dA].yaw[4]), a9(b3.builder[dA].yaw[5])) or a9(b3.builder[dA].yaw[2]) == 'extend jitter' and aY.ex_jitter(60, -60, a9(b3.builder[dA].yaw[6])))
                cU.yaw_jitter[2] = a9(b3.builder[dA].yaw_jitter[2]) == 'off' and a9(b3.builder[dA].yaw_jitter[3]) or
                    a9(b3.builder[dA].yaw_jitter[2]) == 'traditional' and
                    aY.tr_jitter(a9(b3.builder[dA].yaw_jitter[4]), a9(b3.builder[dA].yaw_jitter[5])) or
                    a9(b3.builder[dA].yaw_jitter[2]) == 'extend jitter' and
                    aY.ex_jitter(60, -60, a9(b3.builder[dA].yaw_jitter[6]))
                cU.body_yaw[1] = a9(b3.builder[dA].body_yaw[1])
                cU.body_yaw[2] = a9(b3.builder[dA].body_yaw[2]) == 'off' and a9(b3.builder[dA].body_yaw[3]) or
                    a9(b3.builder[dA].body_yaw[2]) == 'traditional' and
                    aY.tr_jitter(a9(b3.builder[dA].body_yaw[4]), a9(b3.builder[dA].body_yaw[5])) or
                    a9(b3.builder[dA].body_yaw[2]) == 'extend' and aY.ex_jitter(60, -60, a9(b3.builder[dA].body_yaw[6])) or
                    a9(b3.builder[dA].body_yaw[2]) == 'adaptive' and aY.ex_jitter(1, -1, a9(b3.builder[dA].body_yaw[7]))
                cU.freestand_yaw = false
            end; b6.rf_data.yaw_base = (dD == 0 or dD == 3 and not a9(b3.legit_aa)) and 'At targets' or 'Local view'
            b6.rf_data.yaw[2] = (dD == 0 or dD == 3) and b6.rf_data.yaw[2] or dE; b6.rf_data.yaw_jitter[1] = b0
                .table_contain(a9(b3.manual_options), 'f. static') and dD ~= 0 and 'Off' or b6.rf_data.yaw_jitter[1]
            b6.rf_data.body_yaw[1] = b0.table_contain(a9(b3.manual_options), 'f. static') and dD ~= 0 and 'Off' or
                b6.rf_data.body_yaw[1]
        elseif dC == false then
            cU.pitch[1] = 'Minimal'
            cU.pitch[2] = 0; cU.yaw_base = 'Local view'
            cU.yaw[1] = '180'
            cU.yaw[2] = 0; cU.yaw_jitter[1] = 'Center'
            cU.yaw_jitter[2] = 0; cU.body_yaw[1] = 'Static'
            cU.body_yaw[2] = 0
        end; a4(aX.enabled, a9(b3.a_enable))
        a4(aX.pitch[1], cU.pitch[1])
        a4(aX.pitch[2], cU.pitch[2])
        a4(aX.yaw_base, cU.yaw_base)
        a4(aX.yaw[1], cU.yaw[1])
        a4(aX.yaw[2], cU.yaw[2])
        a4(aX.yaw_jitter[1], cU.yaw_jitter[1])
        a4(aX.yaw_jitter[2], cU.yaw_jitter[2])
        a4(aX.body_yaw[1], cU.body_yaw[1])
        a4(aX.body_yaw[2], cU.body_yaw[2])
        a4(aX.freestanding_body_yaw, cU.freestand_yaw)
        local cg = function(ch)
            a0(aX.enabled, ch)
            a0(aX.pitch[1], ch)
            a0(aX.pitch[2], ch)
            a0(aX.yaw_base, ch)
            a0(aX.yaw[1], ch)
            a0(aX.yaw[2], ch)
            a0(aX.yaw_jitter[1], ch)
            a0(aX.yaw_jitter[2], ch)
            a0(aX.body_yaw[1], ch)
            a0(aX.body_yaw[2], ch)
            a0(aX.freestanding_body_yaw, ch)
            a0(aX.edge_yaw, ch)
            a0(aX.freestanding[1], ch)
            a0(aX.freestanding[2], ch)
            a0(aX.roll, ch)
        end; cg(not a9(b3.a_enable))
    end; local dG = function(dH, dI, dJ)
        dJ = dJ or 3; return dH + (dI - dH) * V() * dJ
    end; aW.new = function(bn, dK, dL, dM, dJ)
        if dM ~= nil then
            if dM then
                return dG(bn, dK, dJ)
            else
                return dG(bn, dL,
                    dJ)
            end
        else
            return dG(bn, dK, dJ)
        end
    end; aW.new_color = function(aZ, dN, dO, dM, dJ)
        if dM ~= nil then
            if dM then
                aZ.r = dG(aZ.r, dN.r, dJ)
                aZ.g = dG(aZ.g, dN.g, dJ)
                aZ.b = dG(aZ.b, dN.b, dJ)
                aZ.a = dG(aZ.a, dN.a, dJ)
            else
                aZ.r = dG(aZ.r, dO.r, dJ)
                aZ.g = dG(aZ.g, dO.g, dJ)
                aZ.b = dG(aZ.b, dO.b, dJ)
                aZ.a = dG(aZ.a, dO.a, dJ)
            end
        else
            aZ.r = dG(aZ.r, dN.r, dJ)
            aZ.g = dG(aZ.g, dN.g, dJ)
            aZ.b = dG(aZ.b, dN.b, dJ)
            aZ.a = dG(aZ.a, dN.a, dJ)
        end; return { r = aZ.r, g = aZ.g, b = aZ.b, a = aZ.a }
    end; aW.counter = function(dP, dQ, dR)
        return 100 / (dP / (dQ + dR - globals.realtime())) <= 0 and 0 or
            100 / (dP / (dQ + dR - globals.realtime()))
    end; b1.c_alpha = 0; b1.c_scoped = 0; b1.c_scopedA = 0; b1.pixel_rectangle = function(
        cE, cF, dP, dS, dT, bF, cV, cU, dU, dV)
        ab(cE - 1, cF - 1, dP + 2, dS + 2, 25, 25, 25, cU)
        ab(cE, cF, dP, dS, dT, bF, cV, cU)
    end; b1.blur_outlined_rect = function(cE, cF, dP, dS, dT, bF, cV, cU, dW, dX, dY, dZ)
        ab(cE - 1, cF - 1, dP + 2, dS + 2, 0, 0, 0, cU / 2)
        renderer.blur(cE, cF, dP * dW, dS * dW)
        if dX >= dP - dP / 10 then dX = dP - dP / 10 end; if dZ >= dP - dP / 10 then dZ = dP - dP / 10 end; ab(
            cE + dP / 10 / 2 - 1, cF + dY - 1, dP - dP / 10 + 2, 5, 10, 10, 10, cU)
        ab(cE + dP / 10 / 2, cF + dY, dX, 3, dT, bF, cV, cU)
        ab(cE + dP / 10 / 2, cF + dY, dZ, 3, dT, bF, cV, cU / 2)
    end; b1.limited_rectangle = function(cE, cF, dP, dS, dX, dT, bF, cV, cU, dF)
        ab(cE, cF, dP, dS, dT, bF, cV, cU)
        ab(cE - 1, cF - 1, dX + 2, dS + 2, 25, 25, 25, cU / 2)
        af(cE - 1 + dX + 2, cF - 3, cE - 1 + dX + 2, cF - 3 + dS + 5, 1, 1, 1, cU)
        af(cE - 1, cF - 3, cE - 1, cF - 3 + dS + 5, 1, 1, 1, cU)
        af(cE - 1, cF - 2, cE - 1 + dX + 2, cF - 2, 1, 1, 1, cU)
        af(cE - 1, cF + dS + 1, cE - 1 + dX + 2, cF + dS + 1, 0, 0, 0, cU)
        local d_ = dX / dF; for br = 1, dF - 1, 1 do
            local e0 = cE + br * d_; ab(e0, cF, 1, dS, 25, 25, 25, cU / 2)
        end
    end; b1.distance = 0; local e1 = 50; b1.center = function()
        local e2, e3 = h()
        local e4, e5 = e2 / 2, e3 / 2; local e6, e7 = ag('-', 'MYTH LUA')
        local e8, e9 = ag('-', 'MYTH')
        local dT, bF, cV, cU = a9(b3.center_color)
        b1.c_alpha = aW.new(b1.c_alpha, 1, 0, b0.table_contain(a9(b3.indicator), 'center'), 6)
        b1.c_scopedA = aW.new(b1.c_scopedA, 0, 1, a_.is_scoped(y()), 8)
        b1.c_scoped = aW.new(b1.c_scoped, 1, 0, b1.c_scopedA <= 0.2, 6)
        local ea = aZ.fade_text(dT, bF, cV, cU * b1.c_scopedA * b1.c_alpha, 186, 198, 212, 255 * b1.c_scopedA *
            b1.c_alpha, 'MYTH')
        ae(e4 - (e6 / 2 + 5), e5 + 10 + 1, 25, 25, 25, 180 * b1.c_scopedA * b1.c_alpha, '-', nil, 'MYTH')
        ae(e4 - (e6 / 2 + 5), e5 + 10, 255, 255, 255, 255 * b1.c_scopedA * b1.c_alpha, '-', nil, ea)
        b1.pixel_rectangle(e4 - (e6 / 2 + 11) * b1.c_alpha + 1 + aq(17 * b1.c_scoped) + 1 + 1, e5 + 10 + 1 + 1, 2, 9, 25,
            25, 25, 180 * b1.c_scopedA * b1.c_alpha)
        b1.pixel_rectangle(e4 - (e6 / 2 + 11) * b1.c_alpha + 1 + aq(17 * b1.c_scoped) + 1, e5 + 10 + 1, 2, 9, 125, 125,
            125, 255 * b1.c_scopedA * b1.c_alpha)
        local eb = L(true)
        local cB, cC, cD = K(y(), "m_vecOrigin")
        for br = 1, #eb do
            local cE, cF, cG = K(eb[br], "m_vecOrigin")
            local d1 = cu(cB, cC, cD, cE, cF, cG)
            if d1 > e1 then e1 = d1 end; local ec = d1 / e1 * 50; b1.distance = aW.new(b1.distance, ec, 6)
        end; local ed = 50; b1.limited_rectangle(e4 - ed / 2, e5 + 25, b1.distance, 5, ed, dT, bF, cV,
            cU * b1.c_scoped * b1.c_alpha, 6)
        ae(e4 - ed / 2 - 1, e5 + 31, 205, 205, 205, 180 * b1.c_scoped * b1.c_alpha, '-', nil,
            aR(D(client.current_threat())))
        ae(e4 - (e6 / 2 + 5) + e8 + 2 + 2, e5 + 10 + 1, 25, 25, 25, 180 * b1.c_scopedA * b1.c_alpha, '-',
            e6 * b1.c_scopedA * b1.c_alpha, 'LUA.')
        ae(e4 - (e6 / 2 + 5) + e8 + 2, e5 + 10, 90, 90, 90, 255 * b1.c_scopedA * b1.c_alpha, '-',
            e6 * b1.c_scopedA * b1.c_alpha, 'LUA.')
    end; b1.ox = 0; b1.oy = 0; b1.dragging = false; b1.run_dragging = function()
        local ee = client.key_state(0x01)
        local ef, eg = ui.mouse_position()
        local cE, cF = a9(b3.pos_x), a9(b3.pos_y)
        local e2, e3 = h()
        if b1.dragging then
            local e0, eh = cE - b1.ox, cF - b1.oy; a4(b3.pos_x, ay(ao(ef + e0, 0), e2))
            a4(b3.pos_y, ay(ao(eg + eh, 0), e3))
            b1.ox, b1.oy = ef, eg
        else
            b1.ox, b1.oy = ef, eg
        end
    end; b1.is_dragging = function(cE, cF, dP, dS)
        local ef, eg = ui.mouse_position()
        local ee = client.key_state(0x01)
        local ei = ef > cE and ef < cE + dP; local ej = eg > cF and eg < cF + dS; return ei and ej and ee and _()
    end; b1.is_dragging_menu = function()
        local cE, cF = ui.mouse_position()
        local dd, de = ui.menu_position()
        local e2, e3 = ui.menu_size()
        local ee = client.key_state(0x01)
        local ei = cE > dd and cE < dd + e2; local ej = cF > de and cF < de + e3; return ei and ej and ee and _()
    end; b1.t_alpha = 0; b1.t_rect = 0; b1.arrows = {
        g_alpha = 0,
        ['left'] = { r = 0, g = 0, b = 0, a = 0 },
        ['right'] = { r = 0, g = 0, b = 0, a = 0 },
        ['animate'] = { right_x = 0, left_x = 0 },
        menu_alpha = 0
    }
    b1.arrows_render = function()
        local ek = b1.arrows; local e2, e3 = h()
        local ef, eg = e2 / 2, e3 / 2; local el = ef / 210 * a9(b3.arrow_distance)
        ek.g_alpha = aW.new(ek.g_alpha, 1, 0, b0.table_contain(a9(b3.indicator), 'manual indicator'), 6)
        if ek.g_alpha < 0.01 then return end; local em =
        '<svg t="1686019116149" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1930" width="200" height="200"><path d="M262.144 405.504l255.68-170.432a128 128 0 0 1 198.976 106.496v340.864a128 128 0 0 1-199.008 106.496l-255.648-170.432a128 128 0 0 1 0-212.992z" p-id="1931" fill="#ffffff"></path></svg>'
        local en =
        '<svg t="1686019127483" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2144" width="200" height="200"><path d="M761.856 405.504l-255.68-170.432A128 128 0 0 0 307.2 341.568v340.864a128 128 0 0 0 199.008 106.496l255.648-170.432a128 128 0 0 0 0-212.992z" p-id="2145" fill="#ffffff"></path></svg>'
        local eo = renderer.load_svg(em, 32, 32)
        local ep = renderer.load_svg(en, 32, 32)
        local dD = a9(cp)
        local bG, bH, bI, bJ = ui.get(b3.arrow_color)
        ek['left'] = aW.new_color(ek['left'], { r = bG, g = bH, b = bI, a = bJ * ek.g_alpha },
            { r = 0, g = 0, b = 0, a = 0 },
            dD == 1 or _(), 6)
        ek['right'] = aW.new_color(ek['right'], { r = bG, g = bH, b = bI, a = bJ * ek.g_alpha },
            { r = 0, g = 0, b = 0, a = 0 },
            dD == 2 or _(), 6)
        local eq = ef - 34 + el; local er = ef - el; ek['animate'].right_x = aW.new(ek['animate'].right_x, eq, 6)
        ek['animate'].left_x = aW.new(ek['animate'].left_x, er, 6)
        local es = aq(ek['animate'].right_x)
        local et = aq(ek['animate'].left_x)
        renderer.texture(eo, et + 1, eg + 1 + 1, 32, 31, 25, 25, 25, ek['left'].a, 'f')
        renderer.texture(ep, es + 1, eg - 1 + 1, 32, 32, 25, 25, 25, ek['right'].a, 'f')
        renderer.texture(eo, et, eg + 1, 32, 31, ek['left'].r, ek['left'].g, ek['left'].b, ek['left'].a, 'f')
        renderer.texture(ep, es, eg - 1, 32, 32, ek['right'].r, ek['right'].g, ek['right'].b, ek['right'].a, 'f')
    end; b1.target_hud = function()
        local e2, e3 = h()
        local e4, e5 = e2 / 2, e3 / 2; local eu = D(client.current_threat())
        b1.t_alpha = aW.new(b1.t_alpha, 1, 0, b0.table_contain(a9(b3.indicator), '1v1 helper') and eu ~= 'unknown', 6)
        if eu == 'unknown' then return end; local ev = K(client.current_threat(), "m_iHealth")
        local ee = client.key_state(0x01)
        local cE, cF = a9(b3.pos_x), a9(b3.pos_y)
        local dP, dS = 300, 30; local dT, bF, cV, cU = a9(b3.th_color)
        b1.t_rect = aW.new(b1.t_rect, math.floor(ev / 100 * dP), 6)
        b1.blur_outlined_rect(cE, cF, dP * b1.t_alpha, dS, dT, bF, cV, cU * b1.t_alpha, b1.t_alpha, math.floor(ev / 100 *
            dP), 8, b1.t_rect)
        local ew, ex = ag('-', string.upper(eu))
        ae(cE + 13, cF + 15, 255, 255, 255, 255 * b1.t_alpha, '-', ew * b1.t_alpha + 2, string.upper(eu))
        ae(cE + dP - 48 + 1, cF + 14 - 1, 10, 10, 10, cU * b1.t_alpha, '-', nil, '❤')
        ae(cE + dP - 48 - 1, cF + 14 + 1, 10, 10, 10, cU * b1.t_alpha, '-', nil, '❤')
        ae(cE + dP - 48 + 1, cF + 14 + 1, 10, 10, 10, cU * b1.t_alpha, '-', nil, '❤')
        ae(cE + dP - 48 - 1, cF + 14 - 1, 10, 10, 10, cU * b1.t_alpha, '-', nil, '❤')
        ae(cE + dP - 48, cF + 14, dT, bF, cV, cU * b1.t_alpha, '-', nil, '❤')
        ae(cE + dP - 49 + 15, cF + 15, 255, 255, 255, 255 * b1.t_alpha, '-', nil, ":  " .. string.upper(ev))
        if b1.is_dragging(cE, cF, dP, dS) and not b1.is_dragging_menu() then b1.dragging = true elseif not ee then b1.dragging = false end; b1
            .run_dragging()
    end; b1.render = function()
        b1.target_hud()
        b1.center()
        b1.arrows_render()
    end; b4.setup_command = function(cX) b6.setup_anti(cX) end; b4.paint_ui = function() b5.visible() end; b4.paint = function()
        b1.render()
    end; b4.paint_ui()
    b4._register = function()
        g('paint_ui', b4.paint)
        g('paint_ui', b4.paint_ui)
        g('setup_command', b4.setup_command)
        b0._call(b2.register_data, b5.visible)
    end; b4._register()
end
b9()
