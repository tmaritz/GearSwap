function user_job_setup()

    state.OffenseMode:options('Normal', 'SomeAcc', 'Acc', 'HighAcc', 'FullAcc')
    state.HybridMode:options('Normal', 'Tank_Inquartata', 'Tank_Magic', 'TP')
    state.WeaponskillMode:options('Match', 'Normal', 'SomeAcc', 'Acc', 'HighAcc', 'FullAcc')
    state.CastingMode:options('Normal', 'SIRD')
    state.PhysicalDefenseMode:options('PDT_HP', 'PDT')
    state.MagicalDefenseMode:options('MDT_HP', 'BDT_HP', 'MDT', 'BDT')
    state.ResistDefenseMode:options('MEVA_HP', 'MEVA', 'Death', 'Charm', 'DTCharm')
    state.IdleMode:options('Normal', 'Tank', 'Eva', 'KiteTank')
    state.Weapons:options('Aettir', 'Montante', 'Aettir_Physical', 'Aettir_Magic', 'None')

    state.ExtraDefenseMode = M {
        ['description'] = 'Extra Defense Mode',
        'None',
        'MP'
    }

    gear.enmity_jse_back = {
        name = "Ogma's cape",
        augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity+10', 'Phys. dmg. taken-10%'}
    }
    gear.stp_jse_back = {
        name = "Ogma's cape",
        augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
    }
    gear.da_jse_back = {
        name = "Ogma's cape",
        augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+7', '"Dbl.Atk."+10'}
    }
    gear.wsd_jse_back = {
        name = "Ogma's cape",
        augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%'}
    }

    autows = 'Dimidiation'

    -- Additional local binds
    -- send_command('bind ^` gs c SubJobEnmity')
    send_command('bind ^\' gs c toggle AutoRuneMode')
    send_command('bind !\' gs c cycle RuneElement')
    send_command('bind @\' gs c RuneElement')
    send_command('bind ^delete input /ja "Provoke" <stnpc>')
    send_command('bind !delete input /ma "Cure IV" <stal>')
    send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind ^\\\\ input /ma "Protect IV" <t>')
    send_command('bind @\\\\ input /ma "Shell V" <t>')
    send_command('bind !\\\\ input /ma "Crusade" <me>')
    send_command('bind ^backspace input /ja "Lunge" <t>')
    send_command('bind @backspace input /ja "Gambit" <t>')
    send_command('bind !backspace input /ja "Rayke" <t>')
    send_command('bind @f8 gs c toggle AutoTankMode')
    send_command('bind @f10 gs c toggle TankAutoDefense')
    send_command('bind ^@!` gs c cycle SkillchainMode')
    -- send_command('bind !r gs c weapons Lionheart;gs c update')

    select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {
        ammo = "Aqreqaq Bomblet",
        head = "Rabid Visor",
        body = "Emet Harness +1",
        hands = "Turms Mittens",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1",
        neck = "Futhark Torque +1",
        waist = "Kasiri Belt",
        left_ear = "Cryptic Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Eihwaz Ring",
        right_ring = "Gelatinous Ring +1",
        back = gear.enmity_jse_back
    }

    sets.Enmity.SIRD = {
        ammo = "Staunch Tathlum",
        head = "Meghanada Visor +2",
        neck = "Loricate Torque +1",
        ear1 = "Genmei Earring",
        ear2 = "Trux Earring",
        body = "Emet Harness +1",
        hands = gear.herculean_dt_hands,
        ring1 = "Defending Ring",
        ring2 = "Moonbeam Ring",
        back = gear.enmity_jse_back,
        waist = "Audumbla Sash",
        legs = "Carmine Cuisses +1",
        feet = "Erilaz Greaves +1"
    }

    sets.Enmity.SIRDT = {
        ammo = "Staunch Tathlum",
        head = "Fu. Bandeau",
        neck = "Loricate Torque +1",
        ear1 = "Tuisto Earring",
        ear2 = "Odnowa Earring +1",
        body = "Runeist's Coat +2",
        hands = gear.herculean_dt_hands,
        ring1 = "Gelatinous Ring +1",
        ring2 = "Moonbeam Ring",
        back = gear.enmity_jse_back,
        waist = "Audumbla Sash",
        legs = "Carmine Cuisses +1",
        feet = "Erilaz Greaves +1"
    }

    sets.Enmity.DT = {
        ammo = "Staunch Tathlum",
        head = "Fu. Bandeau",
        neck = "Loricate Torque +1",
        ear1 = "Tuisto Earring",
        ear2 = "Odnowa Earring +1",
        body = "Runeist's Coat +2",
        hands = gear.herculean_dt_hands,
        ring1 = "Gelatinous Ring +1",
        ring2 = "Moonbeam Ring",
        back = gear.enmity_jse_back,
        waist = "Flume Belt +1",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1"
    }

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Item sets.

    -- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {
        body = "Runeist's Coat +2",
        legs = "Futhark Trousers +1"
    })
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {
        feet = "Runeist Boots +3"
    })
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {
        head = "Futhark Bandeau"
    })
    sets.precast.JA['Liement'] = set_combine(sets.Enmity, {
        body = "Futhark Coat +1"
    })
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity, {
        hands = "Runeist Mitons"
    })
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity, {
        feet = "Futhark Boots +1"
    })
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity, {
        body = "Futhark Coat +1"
    })
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity, {
        hands = "Futhark Mitons +1"
    })
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity, {})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT, {
        body = "Runeist's Coat +2",
        legs = "Futhark Trousers"
    })
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT, {
        feet = "Runeist Bottes"
    })
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT, {
        head = "Futhark Bandeau"
    })
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT, {
        body = "Futhark Coat"
    })
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT, {
        hands = "Runeist Mitons"
    })
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT, {
        feet = "Futhark Boots"
    })
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT, {
        body = "Futhark Coat"
    })
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT, {
        hands = "Futhark Mitons"
    })
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {
        ammo = "Seeth. Bomblet +1",
        head = gear.herculean_nuke_head,
        neck = "Baetyl Pendant",
        ear1 = "Friomisi Earring",
        ear2 = "Crematio Earring",
        body = "Samnuha Coat",
        hands = "Carmine Fin. Ga. +1",
        ring1 = "Metamor. Ring +1",
        ring2 = "Shiva Ring",
        back = "Toro Cape",
        waist = "Eschan Stone",
        legs = gear.herculean_nuke_legs,
        feet = gear.herculean_nuke_feet
    }

    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

    -- Gear for specific elemental nukes.
    sets.element.Dark = {
        head = "Pixie Hairpin +1",
        ring2 = "Archon Ring"
    }

    -- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {
        head = "Erilaz Galea +1",
        neck = "Incanter's Torque",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        legs = "Rune. Trousers +3"
    }
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        ammo = "Yamarang",
        head = "Carmine Mask +1",
        neck = "Unmoving Collar +1",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Handler's Earring +1",
        body = gear.herculean_waltz_body,
        hands = gear.herculean_waltz_hands,
        ring1 = "Defending Ring",
        ring2 = "Valseur's Ring",
        back = "Solemnity Cape",
        waist = "Chaac Belt",
        legs = "Dashing Subligar",
        feet = gear.herculean_waltz_feet
    }

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {}

    sets.precast.JA['Violent Flourish'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {
        ammo = "Impatiens",
        head = "Rune. Bandeau +3",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Loquac. Earring",
        body = "Dread Jupon",
        hands = "Leyline Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Kishar Ring",
        back = "Solemnity Cape",
        waist = "Audumbla Sash",
        legs = "Carmine Cuisses +1",
        feet = "Carmine Greaves +1"
    }

    sets.precast.FC.DT = {
        ammo = "Impatiens",
        head = "Rune. Bandeau +3",
        neck = "Loricate Torque +1",
        ear1 = "Tuisto Earring",
        ear2 = "Odnowa Earring +1",
        body = "Runeist's Coat +2",
        hands = "Leyline Gloves",
        ring1 = "Gelatinous Ring +1",
        ring2 = "Moonlight Ring",
        back = "Solemnity Cape",
        waist = "Audumbla Sash",
        legs = "Eri. Leg Guards +1",
        feet = "Carmine Greaves +1"
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist = "Siegel Sash",
        legs = "Futhark Trousers +1"
    })
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        neck = 'Magoraga Beads'
    })
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    -- Weaponskill sets
    sets.precast.WS = {
        ammo = "Seeth. Bomblet +1",
        head = "Adhemar Bonnet",
        body = "Adhemar Jacket +1",
        hands = "Adhemar Wrist. +1",
        legs = "Samnuha Tights",
        feet = gear.herculean_ta_feet,
        neck = "Soil Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Sherida Earring",
        left_ring = "Petrov Ring",
        right_ring = "Ifrit Ring",
        back = gear.da_jse_back
    }

    sets.precast.WS.Acc = sets.precast.WS
    sets.precast.WS.HighAcc = sets.precast.WS
    sets.precast.WS.FullAcc = sets.precast.WS

    sets.precast.WS['Resolution'] = {
        ammo = "Seeth. Bomblet +1",
        head = "Lustratio Cap +1",
        body = "Adhemar Jacket +1",
        hands = "Adhemar Wrist. +1",
        legs = "Lustr. Subligar +1",
        feet = "Lustra. Leggings +1",
        neck = "Light Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Sherida Earring",
        left_ring = "Epona's Ring",
        right_ring = "Petrov Ring",
        back = gear.wsd_jse_back
    }
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})

    sets.precast.WS['Dimidiation'] = {
        ammo = "Aurgelmir Orb",
        head = "Lustratio Cap +1",
        body = "Adhemar Jacket +1",
        hands = "Meg. Gloves +1",
        legs = "Lustr. Subligar +1",
        feet = "Lustra. Leggings +1",
        neck = "Light Gorget",
        waist = "Grunfeld Rope",
        left_ear = "Moonshade Earring",
        right_ear = "Sherida Earring",
        left_ring = "Petrov Ring",
        right_ring = "Ilabrat Ring",
        back = gear.wsd_jse_back
    }

    sets.precast.WS['Dimidiation'].Acc = sets.precast.WS['Dimidiation']
    sets.precast.WS['Dimidiation'].HighAcc = sets.precast.WS['Dimidiation']
    sets.precast.WS['Dimidiation'].FullAcc = sets.precast.WS['Dimidiation']

    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
    sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})

    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        ammo = "Impatiens",
        head = "Carmine Mask +1",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Loquac. Earring",
        body = "Dread Jupon",
        hands = "Leyline Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Kishar Ring",
        back = "Solemnity Cape",
        waist = "Flume Belt +1",
        legs = "Rawhide Trousers",
        feet = "Carmine Greaves +1"
    }

    sets.midcast.FastRecast.DT = {
        ammo = "Staunch Tathlum",
        head = "Fu. Bandeau",
        neck = "Loricate Torque +1",
        ear1 = "Tuisto Earring",
        ear2 = "Odnowa Earring +1",
        body = "Runeist's Coat +2",
        hands = gear.herculean_dt_hands,
        ring1 = "Gelatinous Ring +1",
        ring2 = "Moonlight Ring",
        back = "Solemnity Cape",
        waist = "Flume Belt +1",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1"
    }

    sets.midcast.FastRecast.SIRD = {
        ammo = "Staunch Tathlum",
        head = "Fu. Bandeau",
        neck = "Loricate Torque +1",
        ear1 = "Tuisto Earring",
        ear2 = "Odnowa Earring +1",
        body = "Runeist's Coat +2",
        hands = gear.herculean_dt_hands,
        ring1 = "Gelatinous Ring +1",
        ring2 = "Moonlight Ring",
        back = "Solemnity Cape",
        waist = "Flume Belt +1",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1"
    }

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
        main = "Pukulatmuj +1",
        head = "Erilaz Galea +1",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        ear2 = "Mimir Earring",
        hands = "Runeist Mitons",
        back = "Merciful Cape",
        waist = "Olympus Sash",
        legs = "Carmine Cuisses +1"
    })
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
        main = "Deacon Sword",
        head = "Futhark Bandeau",
        hands = gear.herculean_phalanx_hands,
        legs = "Carmine Cuisses +1",
        feet = gear.herculean_nuke_feet
    })
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Runeist Bandeau",
        neck = "Sacro Gorget"
    })
    sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Erilaz Galea +1"
    })
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        ear2 = "Earthcry Earring",
        waist = "Siegel Sash"
    })
    sets.midcast.Flash = set_combine(sets.Enmity, {})
    sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Foil = set_combine(sets.Enmity, {})
    sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
    sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Jettatura = set_combine(sets.Enmity, {})
    sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
    sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRDT, {})
    sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {
        ammo = "Staunch Tathlum",
        head = "Carmine Mask +1",
        neck = "Sacro Gorget",
        ear1 = "Mendi. Earring",
        ear2 = "Roundel Earring",
        body = "Vrikodara Jupon",
        hands = "Buremte Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Janniston Ring",
        back = "Tempered Cape +1",
        waist = "Luminary Sash",
        legs = "Carmine Cuisses +1",
        feet = "Skaoi Boots"
    }

    sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})

    sets.Self_Healing = {
        hands = "Buremte Gloves",
        ring2 = "Kunaji Ring",
        waist = "Gishdubar Sash"
    }
    sets.Cure_Received = {
        hands = "Buremte Gloves",
        ring2 = "Kunaji Ring",
        waist = "Gishdubar Sash"
    }
    sets.Self_Refresh = {
        waist = "Gishdubar Sash"
    }
    sets.Phalanx_Received = {
        main = "Deacon Sword",
        hands = gear.herculean_phalanx_hands,
        feet = gear.herculean_nuke_feet
    }

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })

    sets.midcast.BarElement = {
        main = "Beneficus",
        sub = "Ammurapi Shield",
        ammo = "Hasty Pinion +1",
        head = "Ebers Cap +1",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        ear2 = "Gifted Earring",
        body = "Ebers Bliaud",
        hands = "Ebers Mitts +1",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Alaunus's Cape",
        waist = "Olympus Sash",
        legs = "Piety Pantaln. +1",
        feet = "Ebers Duckbills +1"
    }

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.resting = {}

    sets.idle = {
        ammo = "Homiliary",
        head = "Turms Cap",
        body = "Runeist's Coat +2",
        hands = "Turms Mittens",
        legs = "Eri. Leg Guards +1",
        feet = "Turms Leggings",
        neck = "Loricate Torque +1",
        waist = "Flume Belt +1",
        left_ear = "Tuisto Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Defending Ring",
        right_ring = "Gelatinous Ring +1",
        back = gear.enmity_jse_back
    }

    sets.idle.Tank = {
        ammo = "Staunch Tathlum",
        head = "Turms Cap",
        body = "Ayanmo Corazza +2",
        hands = "Turms Mittens",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1",
        neck = "Loricate Torque +1",
        waist = "Flume Belt +1",
        left_ear = "Tuisto Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Moonbeam Ring",
        right_ring = "Gelatinous Ring +1",
        back = gear.enmity_jse_back
    }

    sets.idle.Eva = {
        ammo = "Staunch Tathlum",
        head = "Aya. Zucchetto +1",
        body = "Ayanmo Corazza +1",
        hands = "Aya. Manopolas +1",
        legs = "Eri. Leg Guards +1",
        feet = "Aya. Gambieras +1",
        neck = "Loricate Torque +1",
        waist = "Flume Belt +1",
        left_ear = "Tuisto Earring",
        right_ear = "Eabani Earring",
        left_ring = "Defending Ring",
        right_ring = "Gelatinous Ring +1",
        back = gear.enmity_jse_back
    }

    sets.idle.KiteTank = set_combine(sets.idle.Tank, {
        legs = "Carmine Cuisses +1"
    })

    sets.idle.Weak = set_combine(sets.idle.Tank, {})

    sets.Kiting = {
        legs = "Carmine Cuisses +1"
    }

    sets.latent_refresh = {
        waist = "Fucho-no-obi"
    }
    sets.latent_refresh_grip = {
        sub = "Oneiros Grip"
    }
    sets.DayIdle = {}
    sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {
        ear2 = "Ethereal Earring",
        body = "Erilaz Surcoat +1",
        waist = "Flume Belt +1"
    }
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

    -- Weapons sets
    sets.weapons.Aettir = {
        main = "Aettir",
        sub = "Utu Grip"
    }

    sets.weapons.Montante = {
        main = "Montante +1",
        sub = "Utu Grip"
    }

    sets.weapons.Aettir_Physical = {
        main = "Aettir",
        sub = "Refined Grip +1"
    }

    sets.weapons.Aettir_Magic = {
        main = "Aettir",
        sub = "Irenic Strap"
    }

    sets.weapons.Trial = {
        main = "Trial Blade",
        sub = "Utu Grip"
    }

    -- Defense Sets

    sets.defense.PDT = sets.engaged.Tank_Inquartata
    sets.defense.PDT_HP = sets.engaged.Tank_Inquartata
    sets.defense.MDT = sets.engaged.Tank_Magic
    sets.defense.MDT_HP = sets.engaged.Tank_Magic

    sets.defense.BDT = {
        ammo = "Staunch Tathlum",
        head = "Erilaz Galea +1",
        neck = "Warder's Charm +1",
        ear1 = "Tuisto Earring",
        ear2 = "Sanare Earring",
        body = "Runeist's Coat +2",
        hands = gear.herculean_dt_hands,
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = gear.enmity_jse_back,
        waist = "Engraved Belt",
        legs = gear.herculean_dt_legs,
        feet = "Erilaz Greaves +1"
    }
    sets.defense.BDT_HP = {
        ammo = "Staunch Tathlum",
        head = "Erilaz Galea +1",
        neck = "Loricate Torque +1",
        ear1 = "Tuisto Earring",
        ear2 = "Odnowa Earring +1",
        body = "Runeist's Coat +2",
        hands = gear.herculean_dt_hands,
        ring1 = "Gelatinous Ring +1",
        ring2 = "Moonlight Ring",
        back = gear.enmity_jse_back,
        waist = "Engraved Belt",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1"
    }

    sets.defense.MEVA = sets.engaged.Tank_Magic
    sets.defense.MEVA_HP = sets.engaged.Tank_Magic

    sets.defense.Death = {
        ring1 = "Eihwaz Ring"
    }

    sets.defense.DTCharm = sets.engaged.Tank_Magic

    sets.defense.Charm = sets.engaged.Tank_Magic

    -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {
        ear1 = "Brutal Earring"
    }
    sets.AccMaxTP = {
        ear1 = "Telos Earring"
    }

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    sets.engaged = {
        ammo = "Coiste Bodhar",
        head = "Aya. Zucchetto +2",
        body = "Ayanmo Corazza +2",
        hands = "Adhemar Wrist. +1",
        legs = "Meg. Chausses +1",
        feet = gear.herculean_ta_feet,
        neck = "Anu Torque",
        waist = "Ioskeha Belt",
        left_ear = "Brutal Earring",
        right_ear = "Sherida Earring",
        left_ring = "Defending Ring",
        right_ring = "Moonbeam Ring",
        back = gear.stp_jse_back
    }
    sets.engaged.SomeAcc = sets.engaged
    sets.engaged.Acc = sets.engaged
    sets.engaged.HighAcc = sets.engaged
    sets.engaged.FullAcc = sets.engaged

    sets.engaged.Tank_Inquartata = {
        ammo = "Staunch Tathlum",
        head = "Turms Cap",
        body = "Ayanmo Corazza +2",
        hands = "Turms Mittens",
        legs = "Eri. Leg Guards +1",
        feet = "Turms Leggings",
        neck = "Loricate Torque +1",
        waist = "Flume Belt +1",
        left_ear = "Cryptic Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Defending Ring",
        right_ring = "Gelatinous Ring +1",
        back = gear.enmity_jse_back
    }
    sets.engaged.SomeAcc.Tank_Inquartata = sets.engaged.Tank_Inquartata
    sets.engaged.Acc.Tank_Inquartata = sets.engaged.Tank_Inquartata
    sets.engaged.HighAcc.Tank_Inquartata = sets.engaged.Tank_Inquartata
    sets.engaged.FullAcc.Tank_Inquartata = sets.engaged.Tank_Inquartata

    sets.engaged.Tank_Magic = {
        ammo = "Staunch Tathlum",
        head = "Turms Cap",
        body = "Runeist's Coat +2",
        hands = "Turms Mittens",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1",
        neck = "Loricate Torque +1",
        waist = "Engraved Belt",
        left_ear = "Hearty Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Defending Ring",
        right_ring = "Gelatinous Ring +1",
        back = gear.enmity_jse_back
    }

    sets.engaged.SomeAcc.Tank_Magic = sets.engaged.Tank_Magic
    sets.engaged.Acc.Tank_Magic = sets.engaged.Tank_Magic
    sets.engaged.HighAcc.Tank_Magic = sets.engaged.Tank_Magic
    sets.engaged.FullAcc.Tank_Magic = sets.engaged.Tank_Magic

    sets.engaged.TP = {
        ammo = "Coiste Bodhar",
        head = "Adhemar Bonnet",
        body = "Adhemar Jacket +1",
        hands = "Adhemar Wrist. +1",
        legs = "Samnuha Tights",
        feet = "Turms Leggings",
        neck = "Anu Torque",
        waist = "Windbuffet Belt +1",
        left_ear = "Cessance Earring",
        right_ear = "Sherida Earring",
        left_ring = "Epona's Ring",
        right_ring = "Petrov Ring",
        back = gear.da_jse_back
    }
    sets.engaged.SomeAcc.TP = sets.engaged.TP
    sets.engaged.Acc.TP = sets.engaged.TP
    sets.engaged.HighAcc.TP = sets.engaged.TP
    sets.engaged.FullAcc.TP = sets.engaged.TP

    --------------------------------------
    -- Custom buff sets
    --------------------------------------
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Sleep = {
        head = "Frenzy Sallet"
    }
    sets.buff.Battuta = {
        hands = "Turms Mittens"
    }
    sets.buff.Embolden = {
        back = "Evasionist's Cape"
    }

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 2)
    -- if player.sub_job == 'DNC' then
    -- 	set_macro_page(4, 2)
    -- elseif player.sub_job == 'RDM' then
    -- 	set_macro_page(5, 2)
    -- elseif player.sub_job == 'SCH' then
    -- 	set_macro_page(5, 2)
    -- elseif player.sub_job == 'BLU' then
    -- 	set_macro_page(6, 2)
    -- elseif player.sub_job == 'WAR' then
    -- 	set_macro_page(7, 2)
    -- elseif player.sub_job == 'SAM' then
    -- 	set_macro_page(8, 2)
    -- elseif player.sub_job == 'DRK' then
    -- 	set_macro_page(9, 2)
    -- elseif player.sub_job == 'NIN' then
    -- 	set_macro_page(10, 2)
    -- else
    -- 	set_macro_page(5, 2)
    -- end
end

-- Job Specific Trust Overwrite
function check_trust()
    if not moving then
        if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and
            (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
            local party = windower.ffxi.get_party()
            if party.p5 == nil then
                local spell_recasts = windower.ffxi.get_spell_recasts()

                if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
                    windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
                    windower.send_command('input /ma "Koru-Moru" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
                    windower.send_command('input /ma "Selh\'teus" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
                    windower.send_command('input /ma "Qultada" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
                    windower.send_command('input /ma "Ulmia" <me>')
                    tickdelay = os.clock() + 3
                    return true
                else
                    return false
                end
            end
        end
    end
    return false
end

function user_job_lockstyle()
    if state.Weapons.value == 'Lionheart' then
        windower.chat.input('/lockstyleset 034')
    else
        windower.chat.input('/lockstyleset 010')
    end
end
