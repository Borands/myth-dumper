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
    end; aZ.lerp = function(self, bu, bv, bw)
        if type(bu) == 'table' and type(bv) == 'table' then
            return { self:lerp(bu[1], bv[1], bw), self:lerp(bu[2], bv[2],
                bw), self:lerp(bu[3], bv[3], bw) }
        end; return bu + (bv - bu) * bw
    end; aZ.console = function(self, ...)
        for br, bx in ipairs({ ... }) do
            if type(bx[1]) == 'table' and type(bx[2]) == 'table' and type(bx[3]) == 'string' then
                for by = 1, #bx[3] do
                    local bz = self:lerp(bx[1], bx[2], by / #bx[3])
                    j(bz[1], bz[2], bz[3], bx[3]:sub(by, by) .. '\0')
                end
            elseif type(bx[1]) == 'table' and type(bx[2]) == 'string' then
                j(bx[1][1], bx[1][2], bx[1][3],
                    bx[2] .. '\0')
            end
        end
    end; aZ.text = function(self, ...)
        local bA = false; local bB = 255; local bC = ''
        for br, bx in ipairs({ ... }) do
            if type(bx) == 'boolean' then
                bA = bx
            elseif type(bx) == 'number' then
                bB = bx
            elseif type(bx) == 'string' then
                bC =
                    bC .. bx
            elseif type(bx) == 'table' then
                if type(bx[1]) == 'table' and type(bx[2]) == 'string' then
                    bC =
                        bC .. ('\a%02x%02x%02x%02x'):format(bx[1][1], bx[1][2], bx[1][3], bB) .. bx[2]
                elseif type(bx[1]) == 'table' and type(bx[2]) == 'table' and type(bx[3]) == 'string' then
                    for by = 1, #bx[3] do
                        local bD = self:lerp(bx[1], bx[2], by / #bx[3])
                        bC = bC .. ('\a%02x%02x%02x%02x'):format(bD[1], bD[2], bD[3], bB) .. bx[3]:sub(by, by)
                    end
                end
            end
        end; return ('%s\a%s%02x'):format(bC, bA and 'cdcdcd' or 'ffffff', bB)
    end; aZ.log = function(self, ...)
        for br, bx in ipairs({ ... }) do
            if type(bx) == 'table' then
                if type(bx[1]) == 'table' then
                    if type(bx[2]) == 'string' then
                        self:console({ bx[1], bx[1], bx[2] })
                        if bx[3] then self:console({ { 255, 255, 255 }, '\n' }) end
                    elseif type(bx[2]) == 'table' then
                        self:console({ bx[1], bx[2], bx[3] })
                        if bx[4] then self:console({ { 255, 255, 255 }, '\n' }) end
                    end
                elseif type(bx[1]) == 'string' then
                    self:console({ { 205, 205, 205 }, bx[1] })
                    if bx[2] then self:console({ { 255, 255, 255 }, '\n' }) end
                end
            end
        end
    end; aZ.gradient_text = function(bE, bF, bG, bH, bI, bJ, bK, bL, bM)
        local bN = ''
        local bO = #bM - 1; local bP = (bI - bE) / bO; local bQ = (bJ - bF) / bO; local bR = (bK - bG) / bO; local bS = (bL - bH) /
            bO; for br = 1, bO + 1 do
            bN = bN .. ('\a%02x%02x%02x%02x%s'):format(bE, bF, bG, bH, bM:sub(br, br))
            bE = bE + bP; bF = bF + bQ; bG = bG + bR; bH = bH + bS
        end; return bN
    end; aZ.fade_text = function(bE, bF, bG, bH, bI, bJ, bK, bL, bT)
        local bU = globals.realtime() / 2 % 1.2 * 2 - 1.2; local bN = ""
        if bT == nil then return end; for bV = 1, #bT do
            local bW = bT:sub(bV, bV)
            local bX = bV / #bT; local bY = bX - bU; if bY >= 0 and bY <= 1.4 then
                if bY > 0.7 then bY = 1.4 - bY end; local bZ, b_, c0, c1 = bI - bE, bJ - bF, bK - bG; bE = bE + bZ * bY /
                    0.8; bF = bF + b_ * bY / 0.8; bG = bG + c0 * bY / 0.8
            end; bN = bN .. ('\a%02x%02x%02x%02x%s'):format(bE, bF, bG, bH, bT:sub(bV, bV))
        end; return bN
    end; local c2 = function(...)
        local c3 = { ... }
        aZ:log({ { 235, 42, 142 }, { 186, 198, 212 }, "Myth" }, { { 100, 100, 100 }, " <=> " },
            { { 255, 255, 255 }, string.format(unpack(c3)), true })
    end; c2('Started your Myth!')
    aV.build = 'Initiate'
    aZ:log({ { 235, 42, 142 }, { 186, 198, 212 }, "Myth" }, { { 100, 100, 100 }, " <=> " },
        { { 255, 255, 255 }, "Myth Anti-aimbot angles system V.1" }, { { 144, 194, 54 }, '._A' },
        { { 205, 205, 205 }, " edition:" }, { { 239, 86, 86 }, " " .. aV.build, true })
    c2('Warning: This is BETA test version, if you met any problem while playing, please contact admin directly.')
    c2('Welcome BACK! ' .. b8.username)
    b2.register_data = {}
    b2.register_ui = { ['number'] = {}, ['string'] = {}, ['boolean'] = {}, ['table'] = {} }
    b2.register_aa = { ['number'] = {}, ['string'] = {}, ['boolean'] = {}, ['table'] = {} }
    local c4, c5 = 'aa', 'anti-aimbot angles'
    local c6, c7 = 'aa', 'other'
    local c8, c9 = 'aa', 'Fake lag'
    b3.c_og = b0.new(aU(c4, c5, "\a6E6868FF#hide og  ▲"), b2.register_data, b2.register_ui)
    b3.c_og_box = b0.new(a5(c4, c5, "=========================================="), b2.register_data, b2.register_ui)
    b3.spacing = aU(c4, c5, ' ')
    b3.cnameS = b0.new(aU(c4, c5, "\aFF105DFFMyth\a6E6868FF.lua - \a774CFFFF" .. aV.build .. " - \a96C83CFF" ..
        b8.username), b2.register_data, b2.register_ui)
    b3.cname2 = b0.new(aU(c4, c5, "\a6E6868FF£- Born to be a legend."), b2.register_data, b2.register_ui)
    b3.spacingA = aU(c6, c7, ' ')
    b3.spacingB = aU(c6, c7, ' ')
    b3.spacingC = aU(c6, c7, ' ')
    b3.spacingA = aU(c6, c7, ' ')
    b3.page_slider = b0.new(
    X(c6, c7, " ", 0, 3, 0, true, '', 1, {
        [0] = 'init.',
        [1] = 'anti-aim.',
        [2] = 'func.',
        [3] =
        'up.inf.'
    }), b2.register_data, b2.register_ui)
    b3.cname = b0.new(
        aU(c6, c7, "               \aFF105DFFMyth\a6E6868FF.lua - \a774CFFFF" .. aV.build ..
            "\aFFFFFFC8 - Page \a6E6868FFMain"), b2.register_data, b2.register_ui)
    local ca = { 'stand', 'move', 'duck', 'slow-motion', 'air', 'air + duck' }
    b3.a_enable = b0.new(a5(c4, c5, "Boost anti-aimbot angles"), b2.register_data, b2.register_ui)
    b3.a_state = b0.new(Y(c4, c5, "states", ca), b2.register_data, b2.register_ui)
    b3.builder = {}
    b3.pos_x = b0.new(X("LUA", "B", "\nSaved Position X INDICATOR", 0, 10000, 10), b2.register_data, b2.register_ui)
    b3.pos_y = b0.new(X("LUA", "B", "\nSaved Position Y INDICATOR", 0, 10000, 10), b2.register_data, b2.register_ui)
    local cb = {}
    for by, bx in pairs(ca) do
        cb[by] = "\a6E6868FF#" .. ca[by] .. ""
        b3.builder[by] = { defen_option = { b0.new(Y(c4, c5, 'should defen.?', { 'off', 'adp.', 'force' }), b2.register_data, b2.register_ui, b2.register_aa) }, pitch_defn = { b0.new(Y(c4, c5, '\aE5D841FF*pitch', { "Off", "Default", "Up", "Down", "Minimal", "Random", "Custom" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " pd", -89, 89, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) }, yaw_defn = { b0.new(Y(c4, c5, "\aE5D841FF*yaw", { "Off", '180', 'Spin', 'Static', '180 Z', 'Crosshair' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c4, c5, "\aE5D841FF*extend yaw", { "off", 'traditional', 'extend jitter' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " sA", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " tr. lefts", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " tr. rights", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " ex. values", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) }, pitch = { b0.new(Y(c4, c5, 'pitch', { "Off", "Default", "Up", "Down", "Minimal", "Random", "Custom" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " p", -89, 89, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) }, yaw = { b0.new(Y(c4, c5, "yaw", { "Off", '180', 'Spin', 'Static', '180 Z', 'Crosshair' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c4, c5, "extend yaw", { "off", 'traditional', 'extend jitter' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " a", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " tr. leftd", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " tr. rightd", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " ex. valued", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) }, yaw_jitter = { b0.new(Y(c4, c5, "yaw jitter", { "Off", 'Offset', 'Center', "Random", "Skitter" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c4, c5, "extend func.", { "off", 'traditional', 'extend jitter' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " a.", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " tr. leftp", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " tr. rightp", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " ex. valuep", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa) }, body_yaw = { b0.new(Y(c4, c5, "body yaw", { 'Off', 'Opposite', 'Jitter', 'Static' }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(Y(c4, c5, "optional body", { "off", "traditional", "extend", "adaptive" }), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. "sAp", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " tr. min", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " tr. max", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " ex. max", -180, 180, 0, true, "°"), b2.register_data, b2.register_ui, b2.register_aa), b0.new(X(c4, c5, cb[by] .. " adp. relay", -27, 34, 0, true, "*"), b2.register_data, b2.register_ui, b2.register_aa) } }
    end; b3.p2_spacingA = b0.new(aU(c4, c5, '\a6E6868FF#'), b2.register_data, b2.register_ui)
    b3.p2_cnameA = b0.new(aU(c4, c5, '\a6E6868FFkey sets.'), b2.register_data, b2.register_ui)
    b3.p2_spacingB = b0.new(aU(c4, c5, ' '), b2.register_data, b2.register_ui)
    b3.manual_options = b0.new(a8(c4, c5, 'manual options', { 'f. static', 'f. straight' }), b2.register_data,
        b2.register_ui)
    b3.manual_left = { false, a6(c4, c5, 'manual left') }
    b3.manual_right = { false, a6(c4, c5, 'manual right') }
    b3.manual_reset = { false, a6(c4, c5, 'manual reset') }
    b3.legit_aa = a6(c4, c5, 'antiaim on use')
    b3.freestanding = { false, a6(c4, c5, 'freestanding') }
    b3.edge_yaw = { false, a6(c4, c5, 'edge yaw') }
    b3.p2_spacingE = b0.new(aU(c4, c5, ' '), b2.register_data, b2.register_ui)
    b3.p2_spacingC = b0.new(aU(c4, c5, '\a6E6868FF#'), b2.register_data, b2.register_ui)
    b3.p2_cnameB = b0.new(aU(c4, c5, '\a6E6868FFui.'), b2.register_data, b2.register_ui)
    b3.p2_spacingD = b0.new(aU(c4, c5, ' '), b2.register_data, b2.register_ui)
    b3.indicator = b0.new(a8(c4, c5, 'should render.?', { 'manual indicator', '1v1 helper', 'center', 'notify', '...' }),
        b2.register_data, b2.register_ui)
    b3.arrow_distance = b0.new(X(c4, c5, ' distance', 10, 100, 15, true, 'pt.'), b2.register_data, b2.register_ui)
    b3.p2_spacingF = b0.new(aU(c4, c5, ' '), b2.register_data, b2.register_ui)
    b3.th_color_cname = b0.new(aU(c4, c5, 'change 1v1 helper color.?'), b2.register_data, b2.register_ui)
    b3.th_color = b0.new(a2(c4, c5, 'change 1v1 helper  color.?_color', 235, 42, 142, 255), b2.register_data,
        b2.register_ui)
    b3.center_color_cname = b0.new(aU(c4, c5, 'change center color.?'), b2.register_data, b2.register_ui)
    b3.center_color = b0.new(a2(c4, c5, 'change center color.?_color', 235, 42, 142, 255), b2.register_data,
        b2.register_ui)
    b3.arrow_color_cname = b0.new(aU(c4, c5, 'change arrows color.?'), b2.register_data, b2.register_ui)
    b3.arrow_color = b0.new(a2(c4, c5, 'change arrows color.?_color', 235, 42, 142, 255), b2.register_data,
        b2.register_ui)
    b3.noti_color_cname = b0.new(aU(c4, c5, 'change notify color.?'), b2.register_data, b2.register_ui)
    b3.noti_color = b0.new(a2(c4, c5, 'change notify color.?_color', 235, 42, 142, 255), b2.register_data, b2
        .register_ui)
    b3.p2_spacingG = b0.new(aU(c4, c5, ' '), b2.register_data, b2.register_ui)
    b3.p2_spacingH = b0.new(aU(c4, c5, '\a6E6868FF#'), b2.register_data, b2.register_ui)
    b3.p2_cnameC = b0.new(aU(c4, c5, '\a6E6868FFmisc.'), b2.register_data, b2.register_ui)
    b3.p2_spacingI = b0.new(aU(c4, c5, ' '), b2.register_data, b2.register_ui)
    b3.features = b0.new(a8(c4, c5, 'should enable.?', { 'anti-knife', 'anim. breaker', '...' }), b2.register_data,
        b2.register_ui)
    b3.m_antidis = b0.new(X(c4, c5, ' anti-distance', 200, 600, 280, true, 'm'), b2.register_data, b2.register_ui)
    b3.m_animbreak = b0.new(a8(c4, c5, ' anims', { "in air", "on land", "leg fucker" }), b2.register_data, b2
        .register_ui)
    b5.visible = function()
        local cc = Z('MISC', 'Settings', "Menu color")
        a4(cc, 235, 42, 142, 255)
        local cd = aZ.fade_text(61, 61, 61, 255, 200, 200, 200, 255, 'legend')
        a4(b3.cname2, "\a6E6868FF£- Born to be a " .. cd .. '.')
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
        end; local ce = function(
            cf)
            a0(aX.enabled, cf)
            a0(aX.pitch[1], cf)
            a0(aX.pitch[2], cf)
            a0(aX.yaw_base, cf)
            a0(aX.yaw[1], cf)
            a0(aX.yaw[2], cf)
            a0(aX.yaw_jitter[1], cf)
            a0(aX.yaw_jitter[2], cf)
            a0(aX.body_yaw[1], cf)
            a0(aX.body_yaw[2], cf)
            a0(aX.freestanding_body_yaw, cf)
            a0(aX.edge_yaw, cf)
            a0(aX.freestanding[1], cf)
            a0(aX.freestanding[2], cf)
            a0(aX.roll, cf)
        end; if not a9(b3.a_enable) then ce(a9(b3.c_og_box)) end; local cg, ch, ci, cj = a9(b3.page_slider) == 0,
            a9(b3.page_slider) == 1, a9(b3.page_slider) == 2, a9(b3.page_slider) == 3; a0(b3.cnameS, cg)
        a0(b3.cname2, cg)
        a0(b3.a_enable, ch)
        local ck = a9(b3.a_enable) and ch; a0(b3.a_state, ck)
        for by, bx in pairs(ca) do
            local cl = ck and a9(b3.a_state) == ca[by]
            a0(b3.builder[by].defen_option[1], cl)
            local cm = cl and a9(b3.builder[by].defen_option[1]) ~= "off"
            a0(b3.builder[by].pitch_defn[1], cm)
            a0(b3.builder[by].pitch_defn[2], cm and a9(b3.builder[by].pitch_defn[1]) == 'Custom')
            a0(b3.builder[by].yaw_defn[1], cm)
            a0(b3.builder[by].yaw_defn[2], cm and a9(b3.builder[by].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[by].yaw_defn[3],
                cm and a9(b3.builder[by].yaw_defn[2]) == 'off' and a9(b3.builder[by].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[by].yaw_defn[4],
                cm and a9(b3.builder[by].yaw_defn[2]) == 'traditional' and a9(b3.builder[by].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[by].yaw_defn[5],
                cm and a9(b3.builder[by].yaw_defn[2]) == 'traditional' and a9(b3.builder[by].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[by].yaw_defn[6],
                cm and a9(b3.builder[by].yaw_defn[2]) == 'extend jitter' and a9(b3.builder[by].yaw_defn[1]) ~= 'Off')
            a0(b3.builder[by].pitch[1], cl)
            a0(b3.builder[by].pitch[2], cl and a9(b3.builder[by].pitch[1]) == 'Custom')
            a0(b3.builder[by].yaw[1], cl)
            a0(b3.builder[by].yaw[2], cl and a9(b3.builder[by].yaw[1]) ~= 'Off')
            a0(b3.builder[by].yaw[3], cl and a9(b3.builder[by].yaw[2]) == 'off' and a9(b3.builder[by].yaw[1]) ~= 'Off')
            a0(b3.builder[by].yaw[4], cl and a9(b3.builder[by].yaw[2]) == 'traditional' and
                a9(b3.builder[by].yaw[1]) ~= 'Off')
            a0(b3.builder[by].yaw[5], cl and a9(b3.builder[by].yaw[2]) == 'traditional' and
                a9(b3.builder[by].yaw[1]) ~= 'Off')
            a0(b3.builder[by].yaw[6],
                cl and a9(b3.builder[by].yaw[2]) == 'extend jitter' and a9(b3.builder[by].yaw[1]) ~= 'Off')
            a0(b3.builder[by].yaw_jitter[1], cl)
            a0(b3.builder[by].yaw_jitter[2], cl and a9(b3.builder[by].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[by].yaw_jitter[3],
                cl and a9(b3.builder[by].yaw_jitter[2]) == 'off' and a9(b3.builder[by].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[by].yaw_jitter[4],
                cl and a9(b3.builder[by].yaw_jitter[2]) == 'traditional' and a9(b3.builder[by].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[by].yaw_jitter[5],
                cl and a9(b3.builder[by].yaw_jitter[2]) == 'traditional' and a9(b3.builder[by].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[by].yaw_jitter[6],
                cl and a9(b3.builder[by].yaw_jitter[2]) == 'extend jitter' and a9(b3.builder[by].yaw_jitter[1]) ~= 'Off')
            a0(b3.builder[by].body_yaw[1], cl)
            a0(b3.builder[by].body_yaw[2], cl and a9(b3.builder[by].body_yaw[1]) ~= 'Off')
            a0(b3.builder[by].body_yaw[3],
                cl and a9(b3.builder[by].body_yaw[2]) == 'off' and a9(b3.builder[by].body_yaw[1]) ~= 'Off')
            a0(b3.builder[by].body_yaw[4],
                cl and a9(b3.builder[by].body_yaw[2]) == 'traditional' and a9(b3.builder[by].body_yaw[1]) ~= 'Off')
            a0(b3.builder[by].body_yaw[5],
                cl and a9(b3.builder[by].body_yaw[2]) == 'traditional' and a9(b3.builder[by].body_yaw[1]) ~= 'Off')
            a0(b3.builder[by].body_yaw[6],
                cl and a9(b3.builder[by].body_yaw[2]) == 'extend' and a9(b3.builder[by].body_yaw[1]) ~= 'Off')
            a0(b3.builder[by].body_yaw[7],
                cl and a9(b3.builder[by].body_yaw[2]) == 'adaptive' and a9(b3.builder[by].body_yaw[1]) ~= 'Off')
        end; a0(b3.manual_options, ci)
        a0(b3.manual_left[2], ci)
        a0(b3.manual_right[2], ci)
        a0(b3.manual_reset[2], ci)
        a0(b3.legit_aa, ci)
        a0(b3.freestanding[2], ci)
        a0(b3.edge_yaw[2], ci)
        a0(b3.p2_cnameA, ci)
        a0(b3.p2_spacingA, ci)
        a0(b3.p2_spacingB, ci)
        a0(b3.p2_cnameB, ci)
        a0(b3.p2_cnameC, ci)
        a0(b3.p2_spacingC, ci)
        a0(b3.p2_spacingD, ci)
        a0(b3.p2_spacingE, ci)
        a0(b3.p2_spacingF, ci)
        a0(b3.p2_spacingG, ci)
        a0(b3.p2_spacingH, ci)
        a0(b3.p2_spacingI, ci)
        a0(b3.indicator, ci)
        a0(b3.arrow_distance, ci and b0.table_contain(a9(b3.indicator), 'manual indicator'))
        a0(b3.th_color_cname, ci and b0.table_contain(a9(b3.indicator), '1v1 helper'))
        a0(b3.th_color, ci and b0.table_contain(a9(b3.indicator), '1v1 helper'))
        a0(b3.center_color_cname, ci and b0.table_contain(a9(b3.indicator), 'center'))
        a0(b3.center_color, ci and b0.table_contain(a9(b3.indicator), 'center'))
        a0(b3.arrow_color_cname, ci and b0.table_contain(a9(b3.indicator), 'manual indicator'))
        a0(b3.arrow_color, ci and b0.table_contain(a9(b3.indicator), 'manual indicator'))
        a0(b3.noti_color_cname, ci and b0.table_contain(a9(b3.indicator), 'notify'))
        a0(b3.noti_color, ci and b0.table_contain(a9(b3.indicator), 'notify'))
        a0(b3.features, ci)
        a0(b3.m_antidis, ci and b0.table_contain(a9(b3.features), 'anti-knife'))
        a0(b3.m_animbreak, ci and b0.table_contain(a9(b3.features), 'anim. breaker'))
    end; b5.visible()
    local cn = ui.new_slider('lua', 'b', '_temp_states', 0, 3, 0)
    a0(cn, false)
    local J, K = entity.get_player_weapon, entity.get_prop; local co = 0; local cp = function(cq)
        local cr = bit.band(K(cq, "m_fFlags"), 1)
        if cr == 1 then co = co + 1 else co = 0 end; return co > 8
    end; local cs = function(ct, cu, cv, cw, cx, cy) return math.sqrt((cw - ct) ^ 2 + (cx - cu) ^ 2 + (cy - cv) ^ 2) end; a_.get_dist_to_ety = function(
        cz, cA, cB, cC, cD, cE)
        return cs(cz, cA, cB, cC, cD, cE)
    end; a_.is_scoped = function(a_)
        if J(a_) == nil then return end; return K(J(a_), "m_zoomLevel") == 1 or K(J(a_), "m_zoomLevel") == 2
    end; a_.is_slowdown = function(cq) return K(cq, "m_flVelocityModifier") ~= 1 end; a_.get_velocity = function(cq)
        local cF, cG, cH = K(cq, "m_vecVelocity")
        return math.sqrt(cF ^ 2 + cG ^ 2)
    end; a_.is_static = function(cq) return a_.get_velocity(cq) < 2 and cp(cq) end; a_.is_move = function(cq)
        return a_
            .get_velocity(cq) > 10 and cp(cq)
    end; a_.is_duck = function(cq)
        local cI = K(cq, "m_flDuckAmount") > 0.8; return cI and cp(cq)
    end; a_.is_slowmotion = function(cq) return ui.get(aX.slow_motion[1]) and ui.get(aX.slow_motion[2]) end; a_.is_air = function(
        cq)
        return bit.band(K(cq, "m_fFlags"), 1) == 0 and co <= 6
    end; a_.is_airduck = function(cq)
        return a_.is_air(cq) and
            K(cq, "m_flDuckAmount") > 0.8 and co <= 6
    end; local cJ = { dir = 0, m_states = 0, left = false, right = false, back = false }
    local cn = ui.new_slider('lua', 'b', '_aafunc_states', 0, 3, 1)
    ui.set_visible(cn, false)
    aY.get_direct = function(...)
        local cK = { ... }
        for by, bx in pairs(cK) do
            if type(bx) ~= 'number' then
                print('args should be menu elements')
                return
            end
        end; ui.set(cK[1], 'On hotkey')
        ui.set(cK[2], 'On hotkey')
        ui.set(cK[3], 'On hotkey')
        ui.set(aX.freestanding[2], 'Always on')
        local cL, cM = ui.get(cK[4]), ui.get(cK[5])
        ui.set(aX.freestanding[1], cL)
        ui.set(aX.edge_yaw, cM)
        m_states = ui.get(cn)
        left, right, back = ui.get(cK[1]), ui.get(cK[2]), ui.get(cK[3])
        if left == cJ.left and right == cJ.right and back == cJ.back then return end; cJ.left, cJ.right, cJ.back = left,
            right, back; if left and m_states == 1 or right and m_states == 2 or back and m_states == 3 then
            ui.set(cn, 0)
            return
        end; if left and m_states ~= 1 then ui.set(cn, 1) end; if right and m_states ~= 2 then ui.set(cn, 2) end; if back and m_states ~= 3 then
            ui.set(cn, 3)
        end; cJ.dir = ui.get(cn) == 0 and 0 or ui.get(cn) == 1 and -90 or ui.get(cn) == 2 and 90 or
            ui.get(cn) == 3 and 0; return cJ.dir
    end; aY.get_dir_data = function() return cJ.dir end; aY.normalize_angle = function(cN)
        while cN > 180 do cN = cN - 360 end; while cN < -180 do cN = cN + 360 end; return cN
    end; aY.get_sIndex = function(cq, cO) if a_.is_airduck(cq) then return 6 elseif a_.is_air(cq) then return 5 elseif a_.is_slowmotion(cq) then return 4 elseif a_.is_duck(cq) then return 3 elseif a_.is_move(cq) and not a_.is_slowmotion(cq) then return 2 elseif a_.is_static(cq) and not a_.is_slowmotion(cq) then return 1 else return 6 end end; local cP = false; local cQ = function()
        if entity.get_local_player() == nil then return end; local cR = ui.get(aX.body_yaw[2])
        cR = math.abs(cR) == 0 and 60 or cR; cP = math.floor(math.min(math.abs(cR / 3),
                entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * math.abs(cR / 3) * 2 -
                math.abs(cR / 3))) >
            0
    end; client.set_event_callback('paint_ui', cQ)
    aY.tr_jitter = function(cS, cT) return cP and cS or cT end; aY.ex_jitter = function(cS, cT, cU)
        cS = cS + cU; cT = cT + cU; return cP and aY.normalize_angle(cS) or aY.normalize_angle(cT)
    end; aY.on_use = function(cV)
        local cs = function(ct, cu, cv, cw, cx, cy) return math.sqrt((cw - ct) ^ 2 + (cx - cu) ^ 2 + (cy - cv) ^ 2) end; local cW = function(
            cX)
            local cY = entity.get_all("CC4")[1]
            return cY ~= nil and entity.get_prop(cY, "m_hOwnerEntity") == cX
        end; local cZ = entity.get_local_player()
        local c_ = 100; local cY = entity.get_all('CPlantedC4')[1]
        local d0, d1, d2 = K(cY, "m_vecOrigin")
        if d0 ~= nil then
            local d3, d4, d5 = K(cZ, "m_vecOrigin")
            c_ = cs(d0, d1, d2, d3, d4, d5)
        end; local d6 = K(cZ, "m_iTeamNum")
        local d7 = d6 == 3 and c_ < 62; local d8 = K(cZ, "m_bInBombZone")
        local d9 = cW(cZ)
        local da = d8 ~= 0 and d6 == 2 and d9 and false; local db, dc, dd = o()
        local de, df = t()
        local dg = az(aE(de))
        local dh = al(aE(de))
        local di = az(aE(df))
        local dj = al(aE(df))
        local dk = { dh * dj, dh * di, -dg }
        local dl, dm = f(cZ, db, dc, dd, db + dk[1] * 8192, dc + dk[2] * 8192, dd + dk[3] * 8192)
        local dn = true; local dp = { "CWorld", "CCSPlayer", "CFuncBrush" }
        if dm ~= nil then for br = 0, #dp do if entity.get_classname(dm) == dp[br] then dn = false end end end; if not dn and not da and not d7 then cV.in_use = 0 end
    end; b6.update_manual = function()
        a4(b3.manual_left[2], 'On hotkey')
        a4(b3.manual_right[2], 'On hotkey')
        a4(b3.manual_reset[2], 'On hotkey')
        a0(cn, false)
        local dq = a9(cn)
        local dr, ds, dt = a9(b3.manual_left[2]), a9(b3.manual_right[2]), a9(b3.manual_reset[2])
        local du = a9(b3.edge_yaw[2])
        a4(aX.edge_yaw, du and true or false)
        if a9(b3.freestanding[2]) then
            b3.freestanding[1] = true; a4(aX.freestanding[1], true)
            a4(aX.freestanding[2], 'Always on')
            return
        else
            a4(aX.freestanding[1], false)
            b3.freestanding[1] = true
        end; if dr == b3.manual_left[1] and ds == b3.manual_right[1] and dt == b3.manual_reset[1] then return end; b3.manual_left[1], b3.manual_right[1], b3.manual_reset[1] =
            dr, ds, dt; if dr and dq == 1 or ds and dq == 2 or dt and dq == 3 then
            a4(cn, 0)
            return
        end; if dr and dq ~= 1 then a4(cn, 1) end; if ds and dq ~= 2 then a4(cn, 2) end; if dt and dq ~= 3 then a4(cn, 3) end
    end; b6.rf_data = { pitch = { 'Default', 0 }, yaw_base = 'Local view', yaw = { '180', 0 }, yaw_jitter = { 'Off', 0 }, body_yaw = { 'Static', 0 }, freestand_yaw = false }
    b6.def_data = { cmd_num = 0, checker = 0, tickbase = 0 }
    b6.update_cmdnumber = function(cV) b6.def_data.cmd_num = cV.command_number end; b6.update_tickbase = function(cV)
        if cV.command_number == b6.def_data.cmd_num then
            local dv = K(y(), "m_nTickBase")
            b6.def_data.tickbase = math.abs(dv - b6.def_data.checker)
            b6.def_data.checker = math.max(dv, b6.def_data.checker or 0)
            b6.def_data.cmd_num = 1
        end
    end; b6.is_defensive_active = function()
        local dw = y()
        if dw == nil then return false end; if (a9(aX.hide_shots[1]) == false or a9(aX.hide_shots[2]) == false) and (a9(aX.doubletap[1]) == false or a9(aX.doubletap[2]) == false) then return false end; return
            b6.def_data.tickbase > 2.999681459999995998498010104 and
            b6.def_data.tickbase < 16.02989523959497059475636968798249830139991
    end; b6.reset_defn = function()
        b6.def_data.defensive = 0; b6.def_data.checker = 0
    end; local dx = require('gamesense/csgo_weapons')
    b6.do_defensive = function(cV)
        local dy = aY.get_sIndex(y(), b3.builder)
        if a9(b3.builder[dy].defen_option[1]) ~= 'off' then cV.force_defensive = true end; local dz = true; if J(y()) ~= nil and dx(J(y())).type == "knife" then dz = false end; if b6.is_defensive_active() and dz then return true end
    end; g("run_command", b6.update_cmdnumber)
    g("predict_command", b6.update_tickbase)
    g("level_init", b6.reset_defn)
    b6.setup_anti = function(cV)
        local dA = a9(b3.a_enable)
        local cS = b6.rf_data; b6.update_manual()
        local dB = a9(cn)
        local dC = ({ [1] = b0.table_contain(a9(b3.manual_options), 'f. straight') and -90 or -70, [2] = b0.table_contain(a9(b3.manual_options), 'f. straight°') and 90 or 110 })
            [dB]
        local dy = aY.get_sIndex(y(), b3.builder)
        if dA then
            if a9(b3.legit_aa) then
                aY.on_use(cV)
                cS.pitch[1] = 'Off'
                cS.yaw[1] = 'Off'
                cS.yaw_jitter[1] = 'Off'
                cS.body_yaw[1] = 'Static'
                cS.body_yaw[2] = -180; cS.freestand_yaw = true
            else
                local dD = b6.do_defensive(cV)
                cS.pitch[1] = a9(b3.builder[dy].defen_option[1]) ~= 'off' and dD and a9(b3.builder[dy].pitch_defn[1]) or
                    a9(b3.builder[dy].pitch[1])
                cS.pitch[2] = a9(b3.builder[dy].defen_option[1]) ~= 'off' and dD and a9(b3.builder[dy].pitch_defn[2]) or
                    a9(b3.builder[dy].pitch[2])
                cS.yaw[1] = a9(b3.builder[dy].defen_option[1]) ~= 'off' and dD and a9(b3.builder[dy].yaw_defn[1]) or
                    a9(b3.builder[dy].yaw[1])
                cS.yaw_jitter[1] = a9(b3.builder[dy].yaw_jitter[1])
                cS.yaw[2] = a9(b3.builder[dy].defen_option[1]) ~= 'off' and dD and
                    (a9(b3.builder[dy].yaw_defn[2]) == 'off' and a9(b3.builder[dy].yaw_defn[3]) or a9(b3.builder[dy].yaw_defn[2]) == 'traditional' and aY.tr_jitter(a9(b3.builder[dy].yaw_defn[4]), a9(b3.builder[dy].yaw_defn[5])) or a9(b3.builder[dy].yaw_defn[2]) == 'extend jitter' and aY.ex_jitter(10, -10, a9(b3.builder[dy].yaw_defn[6]))) or
                    (a9(b3.builder[dy].yaw[2]) == 'off' and a9(b3.builder[dy].yaw[3]) or a9(b3.builder[dy].yaw[2]) == 'traditional' and aY.tr_jitter(a9(b3.builder[dy].yaw[4]), a9(b3.builder[dy].yaw[5])) or a9(b3.builder[dy].yaw[2]) == 'extend jitter' and aY.ex_jitter(60, -60, a9(b3.builder[dy].yaw[6])))
                cS.yaw_jitter[2] = a9(b3.builder[dy].yaw_jitter[2]) == 'off' and a9(b3.builder[dy].yaw_jitter[3]) or
                    a9(b3.builder[dy].yaw_jitter[2]) == 'traditional' and
                    aY.tr_jitter(a9(b3.builder[dy].yaw_jitter[4]), a9(b3.builder[dy].yaw_jitter[5])) or
                    a9(b3.builder[dy].yaw_jitter[2]) == 'extend jitter' and
                    aY.ex_jitter(60, -60, a9(b3.builder[dy].yaw_jitter[6]))
                cS.body_yaw[1] = a9(b3.builder[dy].body_yaw[1])
                cS.body_yaw[2] = a9(b3.builder[dy].body_yaw[2]) == 'off' and a9(b3.builder[dy].body_yaw[3]) or
                    a9(b3.builder[dy].body_yaw[2]) == 'traditional' and
                    aY.tr_jitter(a9(b3.builder[dy].body_yaw[4]), a9(b3.builder[dy].body_yaw[5])) or
                    a9(b3.builder[dy].body_yaw[2]) == 'extend' and aY.ex_jitter(60, -60, a9(b3.builder[dy].body_yaw[6])) or
                    a9(b3.builder[dy].body_yaw[2]) == 'adaptive' and aY.ex_jitter(1, -1, a9(b3.builder[dy].body_yaw[7]))
                cS.freestand_yaw = false
            end; b6.rf_data.yaw_base = (dB == 0 or dB == 3 and not a9(b3.legit_aa)) and 'At targets' or 'Local view'
            b6.rf_data.yaw[2] = (dB == 0 or dB == 3) and b6.rf_data.yaw[2] or dC; b6.rf_data.yaw_jitter[1] = b0
                .table_contain(a9(b3.manual_options), 'f. static') and dB ~= 0 and 'Off' or b6.rf_data.yaw_jitter[1]
            b6.rf_data.body_yaw[1] = b0.table_contain(a9(b3.manual_options), 'f. static') and dB ~= 0 and 'Off' or
                b6.rf_data.body_yaw[1]
        elseif dA == false then
            cS.pitch[1] = 'Minimal'
            cS.pitch[2] = 0; cS.yaw_base = 'Local view'
            cS.yaw[1] = '180'
            cS.yaw[2] = 0; cS.yaw_jitter[1] = 'Center'
            cS.yaw_jitter[2] = 0; cS.body_yaw[1] = 'Static'
            cS.body_yaw[2] = 0
        end; a4(aX.enabled, a9(b3.a_enable))
        a4(aX.pitch[1], cS.pitch[1])
        a4(aX.pitch[2], cS.pitch[2])
        a4(aX.yaw_base, cS.yaw_base)
        a4(aX.yaw[1], cS.yaw[1])
        a4(aX.yaw[2], cS.yaw[2])
        a4(aX.yaw_jitter[1], cS.yaw_jitter[1])
        a4(aX.yaw_jitter[2], cS.yaw_jitter[2])
        a4(aX.body_yaw[1], cS.body_yaw[1])
        a4(aX.body_yaw[2], cS.body_yaw[2])
        a4(aX.freestanding_body_yaw, cS.freestand_yaw)
        local ce = function(cf)
            a0(aX.enabled, cf)
            a0(aX.pitch[1], cf)
            a0(aX.pitch[2], cf)
            a0(aX.yaw_base, cf)
            a0(aX.yaw[1], cf)
            a0(aX.yaw[2], cf)
            a0(aX.yaw_jitter[1], cf)
            a0(aX.yaw_jitter[2], cf)
            a0(aX.body_yaw[1], cf)
            a0(aX.body_yaw[2], cf)
            a0(aX.freestanding_body_yaw, cf)
            a0(aX.edge_yaw, cf)
            a0(aX.freestanding[1], cf)
            a0(aX.freestanding[2], cf)
            a0(aX.roll, cf)
        end; ce(not a9(b3.a_enable))
    end; local dE = function(dF, dG, dH)
        dH = dH or 3; return dF + (dG - dF) * V() * dH
    end; aW.new = function(bn, dI, dJ, dK, dH)
        if dK ~= nil then
            if dK then
                return dE(bn, dI, dH)
            else
                return dE(bn, dJ,
                    dH)
            end
        else
            return dE(bn, dI, dH)
        end
    end; aW.new_color = function(aZ, dL, dM, dK, dH)
        if dK ~= nil then
            if dK then
                aZ.r = dE(aZ.r, dL.r, dH)
                aZ.g = dE(aZ.g, dL.g, dH)
                aZ.b = dE(aZ.b, dL.b, dH)
                aZ.a = dE(aZ.a, dL.a, dH)
            else
                aZ.r = dE(aZ.r, dM.r, dH)
                aZ.g = dE(aZ.g, dM.g, dH)
                aZ.b = dE(aZ.b, dM.b, dH)
                aZ.a = dE(aZ.a, dM.a, dH)
            end
        else
            aZ.r = dE(aZ.r, dL.r, dH)
            aZ.g = dE(aZ.g, dL.g, dH)
            aZ.b = dE(aZ.b, dL.b, dH)
            aZ.a = dE(aZ.a, dL.a, dH)
        end; return { r = aZ.r, g = aZ.g, b = aZ.b, a = aZ.a }
    end; aW.counter = function(dN, dO, dP)
        return 100 / (dN / (dO + dP - globals.realtime())) <= 0 and 0 or
            100 / (dN / (dO + dP - globals.realtime()))
    end; b1.c_alpha = 0; b1.c_scoped = 0; b1.c_scopedA = 0; b1.pixel_rectangle = function(
        cC, cD, dN, dQ, dR, bD, cT, cS, dS, dT)
        ab(cC - 1, cD - 1, dN + 2, dQ + 2, 25, 25, 25, cS)
        ab(cC, cD, dN, dQ, dR, bD, cT, cS)
    end; b1.blur_outlined_rect = function(cC, cD, dN, dQ, dR, bD, cT, cS, dU, dV, dW, dX)
        ab(cC - 1, cD - 1, dN + 2, dQ + 2, 0, 0, 0, cS / 2)
        renderer.blur(cC, cD, dN * dU, dQ * dU)
        if dV >= dN - dN / 10 then dV = dN - dN / 10 end; if dX >= dN - dN / 10 then dX = dN - dN / 10 end; ab(
            cC + dN / 10 / 2 - 1, cD + dW - 1, dN - dN / 10 + 2, 5, 10, 10, 10, cS)
        ab(cC + dN / 10 / 2, cD + dW, dV, 3, dR, bD, cT, cS)
        ab(cC + dN / 10 / 2, cD + dW, dX, 3, dR, bD, cT, cS / 2)
    end; b1.limited_rectangle = function(cC, cD, dN, dQ, dV, dR, bD, cT, cS, dD)
        ab(cC, cD, dN, dQ, dR, bD, cT, cS)
        ab(cC - 1, cD - 1, dV + 2, dQ + 2, 25, 25, 25, cS / 2)
        af(cC - 1 + dV + 2, cD - 3, cC - 1 + dV + 2, cD - 3 + dQ + 5, 1, 1, 1, cS)
        af(cC - 1, cD - 3, cC - 1, cD - 3 + dQ + 5, 1, 1, 1, cS)
        af(cC - 1, cD - 2, cC - 1 + dV + 2, cD - 2, 1, 1, 1, cS)
        af(cC - 1, cD + dQ + 1, cC - 1 + dV + 2, cD + dQ + 1, 0, 0, 0, cS)
        local dY = dV / dD; for br = 1, dD - 1, 1 do
            local dZ = cC + br * dY; ab(dZ, cD, 1, dQ, 25, 25, 25, cS / 2)
        end
    end; b1.distance = 0; local d_ = 50; b1.center = function()
        local e0, e1 = h()
        local e2, e3 = e0 / 2, e1 / 2; local e4, e5 = ag('-', 'MYTH LUA')
        local e6, e7 = ag('-', 'MYTH')
        local dR, bD, cT, cS = a9(b3.center_color)
        b1.c_alpha = aW.new(b1.c_alpha, 1, 0, b0.table_contain(a9(b3.indicator), 'center'), 6)
        b1.c_scopedA = aW.new(b1.c_scopedA, 0, 1, a_.is_scoped(y()), 8)
        b1.c_scoped = aW.new(b1.c_scoped, 1, 0, b1.c_scopedA <= 0.2, 6)
        local e8 = aZ.fade_text(dR, bD, cT, cS * b1.c_scopedA * b1.c_alpha, 186, 198, 212, 255 * b1.c_scopedA *
            b1.c_alpha, 'MYTH')
        ae(e2 - (e4 / 2 + 5), e3 + 10 + 1, 25, 25, 25, 180 * b1.c_scopedA * b1.c_alpha, '-', nil, 'MYTH')
        ae(e2 - (e4 / 2 + 5), e3 + 10, 255, 255, 255, 255 * b1.c_scopedA * b1.c_alpha, '-', nil, e8)
        b1.pixel_rectangle(e2 - (e4 / 2 + 11) * b1.c_alpha + 1 + aq(17 * b1.c_scoped) + 1 + 1, e3 + 10 + 1 + 1, 2, 9, 25,
            25, 25, 180 * b1.c_scopedA * b1.c_alpha)
        b1.pixel_rectangle(e2 - (e4 / 2 + 11) * b1.c_alpha + 1 + aq(17 * b1.c_scoped) + 1, e3 + 10 + 1, 2, 9, 125, 125,
            125, 255 * b1.c_scopedA * b1.c_alpha)
        local e9 = L(true)
        local cz, cA, cB = K(y(), "m_vecOrigin")
        for br = 1, #e9 do
            local cC, cD, cE = K(e9[br], "m_vecOrigin")
            local c_ = cs(cz, cA, cB, cC, cD, cE)
            if c_ > d_ then d_ = c_ end; local ea = c_ / d_ * 50; b1.distance = aW.new(b1.distance, ea, 6)
        end; local eb = 50; b1.limited_rectangle(e2 - eb / 2, e3 + 25, b1.distance, 5, eb, dR, bD, cT,
            cS * b1.c_scoped * b1.c_alpha, 6)
        ae(e2 - eb / 2 - 1, e3 + 31, 205, 205, 205, 180 * b1.c_scoped * b1.c_alpha, '-', nil,
            aR(D(client.current_threat())))
        ae(e2 - (e4 / 2 + 5) + e6 + 2 + 2, e3 + 10 + 1, 25, 25, 25, 180 * b1.c_scopedA * b1.c_alpha, '-',
            e4 * b1.c_scopedA * b1.c_alpha, 'LUA.')
        ae(e2 - (e4 / 2 + 5) + e6 + 2, e3 + 10, 90, 90, 90, 255 * b1.c_scopedA * b1.c_alpha, '-',
            e4 * b1.c_scopedA * b1.c_alpha, 'LUA.')
    end; b1.ox = 0; b1.oy = 0; b1.dragging = false; b1.run_dragging = function()
        local ec = client.key_state(0x01)
        local ed, ee = ui.mouse_position()
        local cC, cD = a9(b3.pos_x), a9(b3.pos_y)
        local e0, e1 = h()
        if b1.dragging then
            local dZ, ef = cC - b1.ox, cD - b1.oy; a4(b3.pos_x, ay(ao(ed + dZ, 0), e0))
            a4(b3.pos_y, ay(ao(ee + ef, 0), e1))
            b1.ox, b1.oy = ed, ee
        else
            b1.ox, b1.oy = ed, ee
        end
    end; b1.is_dragging = function(cC, cD, dN, dQ)
        local ed, ee = ui.mouse_position()
        local ec = client.key_state(0x01)
        local eg = ed > cC and ed < cC + dN; local eh = ee > cD and ee < cD + dQ; return eg and eh and ec and _()
    end; b1.is_dragging_menu = function()
        local cC, cD = ui.mouse_position()
        local db, dc = ui.menu_position()
        local e0, e1 = ui.menu_size()
        local ec = client.key_state(0x01)
        local eg = cC > db and cC < db + e0; local eh = cD > dc and cD < dc + e1; return eg and eh and ec and _()
    end; b1.t_alpha = 0; b1.t_rect = 0; b1.arrows = {
        g_alpha = 0,
        ['left'] = { r = 0, g = 0, b = 0, a = 0 },
        ['right'] = { r = 0, g = 0, b = 0, a = 0 },
        ['animate'] = { right_x = 0, left_x = 0 },
        menu_alpha = 0
    }
    b1.arrows_render = function()
        local ei = b1.arrows; local e0, e1 = h()
        local ed, ee = e0 / 2, e1 / 2; local ej = ed / 210 * a9(b3.arrow_distance)
        ei.g_alpha = aW.new(ei.g_alpha, 1, 0, b0.table_contain(a9(b3.indicator), 'manual indicator'), 6)
        if ei.g_alpha < 0.01 then return end; local ek =
        '<svg t="1686019116149" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1930" width="200" height="200"><path d="M262.144 405.504l255.68-170.432a128 128 0 0 1 198.976 106.496v340.864a128 128 0 0 1-199.008 106.496l-255.648-170.432a128 128 0 0 1 0-212.992z" p-id="1931" fill="#ffffff"></path></svg>'
        local el =
        '<svg t="1686019127483" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2144" width="200" height="200"><path d="M761.856 405.504l-255.68-170.432A128 128 0 0 0 307.2 341.568v340.864a128 128 0 0 0 199.008 106.496l255.648-170.432a128 128 0 0 0 0-212.992z" p-id="2145" fill="#ffffff"></path></svg>'
        local em = renderer.load_svg(ek, 32, 32)
        local en = renderer.load_svg(el, 32, 32)
        local dB = a9(cn)
        local bE, bF, bG, bH = ui.get(b3.arrow_color)
        ei['left'] = aW.new_color(ei['left'], { r = bE, g = bF, b = bG, a = bH * ei.g_alpha },
            { r = 0, g = 0, b = 0, a = 0 },
            dB == 1 or _(), 6)
        ei['right'] = aW.new_color(ei['right'], { r = bE, g = bF, b = bG, a = bH * ei.g_alpha },
            { r = 0, g = 0, b = 0, a = 0 },
            dB == 2 or _(), 6)
        local eo = ed - 34 + ej; local ep = ed - ej; ei['animate'].right_x = aW.new(ei['animate'].right_x, eo, 6)
        ei['animate'].left_x = aW.new(ei['animate'].left_x, ep, 6)
        local eq = aq(ei['animate'].right_x)
        local er = aq(ei['animate'].left_x)
        renderer.texture(em, er + 1, ee + 1 + 1, 32, 31, 25, 25, 25, ei['left'].a, 'f')
        renderer.texture(en, eq + 1, ee - 1 + 1, 32, 32, 25, 25, 25, ei['right'].a, 'f')
        renderer.texture(em, er, ee + 1, 32, 31, ei['left'].r, ei['left'].g, ei['left'].b, ei['left'].a, 'f')
        renderer.texture(en, eq, ee - 1, 32, 32, ei['right'].r, ei['right'].g, ei['right'].b, ei['right'].a, 'f')
    end; b1.target_hud = function()
        local e0, e1 = h()
        local e2, e3 = e0 / 2, e1 / 2; local es = D(client.current_threat())
        b1.t_alpha = aW.new(b1.t_alpha, 1, 0, b0.table_contain(a9(b3.indicator), '1v1 helper') and es ~= 'unknown', 6)
        if es == 'unknown' then return end; local et = K(client.current_threat(), "m_iHealth")
        local ec = client.key_state(0x01)
        local cC, cD = a9(b3.pos_x), a9(b3.pos_y)
        local dN, dQ = 300, 30; local dR, bD, cT, cS = a9(b3.th_color)
        b1.t_rect = aW.new(b1.t_rect, math.floor(et / 100 * dN), 6)
        b1.blur_outlined_rect(cC, cD, dN * b1.t_alpha, dQ, dR, bD, cT, cS * b1.t_alpha, b1.t_alpha, math.floor(et / 100 *
            dN), 8, b1.t_rect)
        local eu, ev = ag('-', string.upper(es))
        ae(cC + 13, cD + 15, 255, 255, 255, 255 * b1.t_alpha, '-', eu * b1.t_alpha + 2, string.upper(es))
        ae(cC + dN - 48 + 1, cD + 14 - 1, 10, 10, 10, cS * b1.t_alpha, '-', nil, '❤')
        ae(cC + dN - 48 - 1, cD + 14 + 1, 10, 10, 10, cS * b1.t_alpha, '-', nil, '❤')
        ae(cC + dN - 48 + 1, cD + 14 + 1, 10, 10, 10, cS * b1.t_alpha, '-', nil, '❤')
        ae(cC + dN - 48 - 1, cD + 14 - 1, 10, 10, 10, cS * b1.t_alpha, '-', nil, '❤')
        ae(cC + dN - 48, cD + 14, dR, bD, cT, cS * b1.t_alpha, '-', nil, '❤')
        ae(cC + dN - 49 + 15, cD + 15, 255, 255, 255, 255 * b1.t_alpha, '-', nil, ":  " .. string.upper(et))
        if b1.is_dragging(cC, cD, dN, dQ) and not b1.is_dragging_menu() then b1.dragging = true elseif not ec then b1.dragging = false end; b1
            .run_dragging()
    end; b1.render = function()
        b1.target_hud()
        b1.center()
        b1.arrows_render()
    end; b0._call = function(bb, ew) for ex, bn in pairs(bb) do ui.set_callback(bn, ew) end end; b4.setup_command = function(
        cV)
        b6.setup_anti(cV)
    end; b4.paint_ui = function() b5.visible() end; b4.paint = function() b1.render() end; b4
        .paint_ui()
    b4._register = function()
        g('paint_ui', b4.paint)
        g('paint_ui', b4.paint_ui)
        g('setup_command', b4.setup_command)
    end; for by, bx in pairs(ca) do
        ui.set_callback(b3.builder[by].defen_option[1], b5.visible)
        ui.set_callback(b3.builder[by].pitch_defn[1], b5.visible)
        ui.set_callback(b3.builder[by].pitch_defn[2], b5.visible)
        ui.set_callback(b3.builder[by].yaw_defn[1], b5.visible)
        ui.set_callback(b3.builder[by].yaw_defn[2], b5.visible)
        ui.set_callback(b3.builder[by].yaw_defn[3], b5.visible)
        ui.set_callback(b3.builder[by].yaw_defn[4], b5.visible)
        ui.set_callback(b3.builder[by].yaw_defn[5], b5.visible)
        ui.set_callback(b3.builder[by].yaw_defn[6], b5.visible)
    end; b0._call(b2.register_data, b5.visible)
    b4._register()
end
b9()
