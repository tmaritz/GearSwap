function user_job_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal', 'OccultAcumen')
    state.IdleMode:options('Normal', 'DT', 'DTMeva')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
    state.MagicalDefenseMode:options('MDT', 'NukeLock')
    state.ResistDefenseMode:options('MEVA')
    state.Weapons:options('None', 'Idris', 'Hammertime', 'Max')

    gear.nuke_jse_back = {
        name = "Nantosuelta's Cape",
        augments = { 'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', '"Mag.Atk.Bns."+10' }
    }
    gear.idle_jse_back = {
        name = "Nantosuelta's Cape",
        augments = { 'Eva.+20 /Mag. Eva.+20', 'Pet: "Regen"+10', 'Pet: "Regen"+5', }
    }

    gear.obi_cure_back = "Tempered Cape +1"
    gear.obi_cure_waist = "Korin Obi"

    gear.obi_low_nuke_back = gear.nuke_jse_back
    gear.obi_low_nuke_waist = "Sekhmet Corset"

    gear.obi_high_nuke_back = gear.nuke_jse_back
    gear.obi_high_nuke_waist = "Acuity Belt +1"

    gear.telchine_legs_pet = {
        name = "Telchine Braconi",
        augments = { 'Mag. Evasion+23', 'Pet: "Regen"+3', 'Pet: Damage taken -3%' }
    }

    -- autoindi = "Precision"
    -- autogeo = "Torpor"
    autoindi = "Fury"
    autogeo = "Frailty"
    -- autoindi = "Acumen"
    -- autogeo = "Malaise"
    autoentrust = 'Precision'
    autoentrustee = '<p1>'

    -- Additional local binds

    send_command('bind ^\' gs c cycle MagicBurstMode')
    send_command('bind !\' gs c cycle ElementalMode')
    send_command('bind @\' gs c elemental weather')

    indi_duration = 290

    select_default_macro_book()
    user_job_lockstyle()
end

function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {
        body = "Bagua Tunic +1"
    }
    sets.precast.JA['Life Cycle'] = {
        body = "Geo. Tunic +1",
        back = gear.idle_jse_back
    }
    sets.precast.JA['Radial Arcana'] = {
        feet = "Bagua Sandals +3"
    }
    sets.precast.JA['Mending Halation'] = {
        legs = "Bagua Pants +1"
    }
    sets.precast.JA['Full Circle'] = {
        head = "Azimuth Hood +3",
        hands = "Bagua Mitaines +1"
    }

    -- Indi Duration in slots that would normally have skill here to make entrust more efficient.
    sets.buff.Entrust = {
        main = "Solstice"
    }

    -- Relic hat for Blaze of Glory HP increase.
    sets.buff['Blaze of Glory'] = {
        head = "Bagua Galero +3"
    }

    -- Fast cast sets for spells

    sets.precast.FC = {
        main = "C. Palug Hammer",
        sub = "Culminus",
        ammo = "Impatiens",
        head = gear.merlinic_fc_head,
        body = "Agwu's Robe",
        hands = "Geo. Mitaines +3",
        legs = "Geo. Pants +1",
        feet = "Amalric Nails",
        neck = "Voltsurge Torque",
        waist = "Witful Belt",
        left_ear = "Loquac. Earring",
        right_ear = "Malignance Earring",
        ring1 = "Medada's Ring",
        ring2 = "Lebeche Ring",
        back = gear.idle_jse_back
    }

    sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {
        range = "Dunna",
        ammo = empty
    })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        ear2 = "Malignance Earring",
        hands = "Bagua Mitaines +1"
    })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        feet = gear.vanya_cure_feet
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.Self_Healing = {
        neck = "Phalaina Locket",
        ring1 = "Kunaji Ring",
        ring2 = "Asklepian Ring",
        waist = "Gishdubar Sash"
    }
    sets.Cure_Received = {
        neck = "Phalaina Locket",
        hands = "Agwu's Gages",
        ring1 = "Kunaji Ring",
        ring2 = "Asklepian Ring",
        waist = "Gishdubar Sash"
    }
    sets.Self_Refresh = {
        back = "Grapevine Cape",
        waist = "Gishdubar Sash",
        feet = "Inspirited Boots"
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist = "Siegel Sash"
    })

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC.Impact = {
        ammo = "Impatiens",
        head = empty,
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Malignance Earring",
        body = "Twilight Cloak",
        hands = "Volte Gloves",
        ring1 = "Kishar Ring",
        ring2 = "Lebeche Ring",
        back = "Lifestream Cape",
        waist = "Witful Belt",
        legs = "Geo. Pants +1",
        feet = "Regal Pumps +1"
    }

    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
        main = "Daybreak",
        sub = "Genbu\'s Shield"
    })

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo = "Oshasha's Treatise",
        head = "Nyame Helm",
        neck = "Rep. Plat. Medal",
        ear1 = "Moonshade Earring",
        ear2 = "Telos Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Metamor. Ring +1",
        ring2 = "Karieyh Ring +1",
        back = "Aurist's Cape +1",
        waist = "Grunfeld Rope",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.precast.WS['Judgement'] = {
        ammo = "Oshasha's Treatise",
        head = "Nyame Helm",
        neck = "Rep. Plat. Medal",
        ear1 = "Moonshade Earring",
        ear2 = "Telos Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Metamor. Ring +1",
        ring2 = "Karieyh Ring +1",
        back = "Aurist's Cape +1",
        waist = "Grunfeld Rope",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        main = "Solstice",
        sub = "Culminus",
        ammo = "Impatiens",
        head = gear.merlinic_fc_head,
        body = "Agwu's Robe",
        hands = "Geo. Mitaines +3",
        legs = "Geo. Pants +1",
        feet = "Amalric Nails",
        neck = "Voltsurge Torque",
        waist = "Witful Belt",
        left_ear = "Loquac. Earring",
        right_ear = "Malignance Earring",
        left_ring = "Defending Ring",
        right_ring = "Prolix Ring",
        back = gear.idle_jse_back
    }

    sets.midcast.Geomancy = {
        main = "Idris",
        sub = "Culminus",
        range = "Dunna",
        ammo = empty,
        head = "Bagua Galero +3",
        body = "Agwu's Robe",
        hands = "Geo. Mitaines +3",
        legs = "Geo. Pants +1",
        feet = "Regal Pumps +1",
        neck = "Bagua Charm +1",
        waist = "Austerity Belt",
        left_ear = "Mendi. Earring",
        right_ear = "Gna Earring",
        left_ring = "Stikini Ring",
        right_ring = "Prolix Ring",
        back = gear.idle_jse_back
    }

    -- Extra Indi duration as long as you can keep your 900 skill cap.
    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        legs = "Bagua Pants +1",
        feet = "Azimuth Gaiters +3",
        back = "Lifestream Cape"
    })

    sets.midcast.Cure = {
        main = "Chatoyant Staff",
        sub = "Irenic Strap",
        ammo = "Impatiens",
        head = gear.vanya_healskill_head,
        body = "Vanya Robe",
        hands = "Geo. Mitaines +3",
        legs = "Agwu's Slops",
        feet = gear.vanya_cure_feet,
        neck = "Incanter's Torque",
        waist = "Witful Belt",
        left_ear = "Loquac. Earring",
        right_ear = "Mendi. Earring",
        left_ring = "Lebeche Ring",
        right_ring = "Prolix Ring",
        back = "Fi Follet Cape +1"
    }

    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {
        waist = gear.obi_cure_waist
    })

    -- Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {
        waist = gear.obi_cure_waist
    })

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        main = "Daybreak",
        sub = "Sors Shield"
    })

    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        neck = "Debilis Medallion",
        hands = "Hieros Mittens",
        back = "Oretan. Cape +1",
        ring1 = "Haoma's Ring",
        ring2 = "Menelaus's Ring",
        waist = "Witful Belt",
        feet = gear.vanya_healskill_feet
    })

    sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {
        main = gear.grioavolr_fc_staff,
        sub = "Clemency Grip"
    })

    -- Gear for Magic Burst mode.
    sets.MagicBurst = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Azimuth Hood +3",
        body = "Azimuth Coat +3",
        hands = "Azimuth Gloves +3",
        legs = "Azimuth Tights +3",
        feet = "Azimuth Gaiters +3",
        neck = "Mizu. Kubikazari",
        waist = "Acuity Belt +1",
        left_ear = "Friomisi Earring",
        right_ear = "Malignance Earring",
        left_ring = "Medada's Ring",
        right_ring = "Mujin Band",
        back = "Aurist's Cape +1"
    }

    sets.midcast['Elemental Magic'] = {
        main = "Marin Staff +1",
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        head = "Azimuth Hood +3",
        body = "Azimuth Coat +3",
        hands = "Azimuth Gloves +3",
        legs = "Azimuth Tights +3",
        feet = "Azimuth Gaiters +3",
        neck = "Sibyl Scarf",
        waist = "Acuity Belt +1",
        left_ear = "Friomisi Earring",
        right_ear = "Malignance Earring",
        left_ring = "Medada's Ring",
        right_ring = "Metamor. Ring +1",
        back = "Aurist's Cape +1"
    }

    sets.midcast['Elemental Magic'].OccultAcumen = {
        ammo = "Seraphic Ampulla",
        head = "Mall. Chapeau +2",
        body = gear.merlinic_occult_body, -- Shango Robe?
        hands = gear.merlinic_occult_hands,
        legs = "Perdition Slops",
        feet = gear.merlinic_occult_feet,
        neck = "Asperity Necklace", -- Lissome/Combatants better
        waist = "Oneiros Rope",
        left_ear = "Dedition Earring",
        right_ear = "Telos Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Crepuscular Ring",
        back = "Aurist's Cape +1",
    }


    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast['Dark Magic'] = set_combine(sets.midcast['Elemental Magic'], {})

    sets.midcast.Drain = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Plumose Sachet",
        head = "Bagua Galero +3",
        body = "Azimuth Coat +3",
        hands = gear.merlinic_aspir_hands,
        legs = gear.merlinic_aspir_legs,
        feet = gear.merlinic_aspir_feet,
        neck = "Erra Pendant",
        waist = "Fucho-no-Obi",
        left_ear = "Hirudinea Earring",
        right_ear = "Malignance Earring",
        left_ring = "Medada's Ring",
        right_ring = "Evanescence Ring",
        back = "Aurist's Cape +1",
    }

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {
        main = "Chatoyant Staff",
        sub = "Clerisy Strap",
        ammo = "Hasty Pinion +1",
        head = "Amalric Coif +1",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Malignance Earring",
        body = "Zendik Robe",
        hands = "Volte Gloves",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = "Lifestream Cape",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Regal Pumps +1"
    }

    sets.midcast.Impact = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Floestone",
        head = empty,
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Twilight Cloak",
        hands = "Regal Cuffs",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Acuity Belt +1",
        legs = "Merlinic Shalwar",
        feet = gear.merlinic_nuke_feet
    }

    sets.midcast.Dispel = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Floestone",
        head = "Amalric Coif +1",
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Zendik Robe",
        hands = "Amalric Gages",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Acuity Belt +1",
        legs = "Merlinic Shalwar",
        feet = gear.merlinic_aspir_feet
    }

    sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {
        main = "Daybreak",
        sub = "Ammurapi Shield"
    })

    sets.midcast['Enfeebling Magic'] = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Floestone",
        head = "Agwu's Cap",
        neck = "Erra Pendant",
        ear1 = "Barkarole Earring",
        ear2 = "Malignance Earring",
        body = "Agwu's Robe",
        hands = "Geo. Mitaines +3",
        ring1 = "Medada's Ring",
        ring2 = "Stikini Ring",
        back = gear.nuke_jse_back,
        waist = "Luminary Sash",
        legs = "Agwu's Slops",
        feet = "Agwo's Pigaches"
    }

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
        head = "Amalric Coif +1",
        ear2 = "Malignance Earring",
        waist = "Acuity Belt +1"
    })

    sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
        head = "Amalric Coif +1",
        ear2 = "Malignance Earring",
        waist = "Acuity Belt +1"
    })

    sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {

    })

    sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {
    })

    sets.midcast['Enhancing Magic'] = {
        main = gear.gada_enhancing_club,
        sub = "Ammurapi Shield",
        ammo = "Hasty Pinion +1",
        head = "Telchine Cap",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        ear2 = "Gifted Earring",
        body = "Telchine Chas.",
        hands = "Telchine Gloves",
        ring1 = "Kishar Ring",
        ring2 = "Stikini Ring",
        back = "Perimede Cape",
        waist = "Embla Sash",
        legs = gear.telchine_legs_pet,
        feet = "Telchine Pigaches"
    }

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        neck = "Nodens Gorget",
        ear2 = "Earthcry Earring",
        waist = "Siegel Sash",
        legs = "Shedir Seraweels"
    })

    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Amalric Coif +1"
    })

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        main = "Vadose Rod",
        sub = "Genbu\'s Shield",
        head = "Amalric Coif +1",
        hands = "Regal Cuffs",
        waist = "Emphatikos Rope",
        legs = "Shedir Seraweels"
    })

    sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
        legs = "Shedir Seraweels"
    })

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring",
        ear1 = "Gifted Earring",
        ear2 = "Malignance Earring",
        waist = "Sekhmet Corset"
    })
    sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring",
        ear1 = "Gifted Earring",
        ear2 = "Malignance Earring",
        waist = "Sekhmet Corset"
    })
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring",
        ear1 = "Gifted Earring",
        ear2 = "Malignance Earring",
        waist = "Sekhmet Corset"
    })
    sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring",
        ear1 = "Gifted Earring",
        ear2 = "Malignance Earring",
        waist = "Sekhmet Corset"
    })

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
        main = "Chatoyant Staff",
        sub = "Oneiros Grip",
        head = "Befouled Crown",
        neck = "Chrys. Torque",
        ear1 = "Etiolation Earring",
        ear2 = "Ethereal Earring",
        body = "Agwu's Robe",
        hands = gear.merlinic_refresh_hands,
        ring1 = "Defending Ring",
        ring2 = "Dark Ring",
        back = "Umbra Cape",
        legs = "Assid. Pants +1",
        feet = gear.merlinic_refresh_feet
    }

    -- Idle sets

    sets.idle = {
        main = "Mpaca's Staff",
        sub = "Oneiros Grip",
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        body = "Azimuth Coat +3",
        hands = "Nyame Gauntlets",
        legs = "Assid. Pants +1",
        feet = "Azimuth Gaiters +3",
        neck = "Loricate Torque +1",
        waist = "Slipor Sash",
        left_ear = "Eabani Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Defending Ring",
        right_ring = "Shadow Ring",
        back = "Solemnity Cape"
    }

    sets.idle.DT = {
        main = "Malignance Pole",
        sub = "Irenic Strap",
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Azimuth Gaiters +3",
        neck = "Loricate Torque +1",
        waist = "Carrier's Sash",
        left_ear = "Lugalbanda Earring",
        right_ear = "Eabani Earring",
        left_ring = "Defending Ring",
        right_ring = "Shadow Ring",
        back = "Solemnity Cape"
    }

    sets.idle.DTMeva = {
        main = "Malignance Pole",
        sub = "Irenic Strap",
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        body = "Agwu's Robe",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Azimuth Gaiters +3s",
        neck = "Loricate Torque +1",
        waist = "Carrier's Sash",
        left_ear = "Lugalbanda Earring",
        right_ear = "Eabani Earring",
        left_ring = "Defending Ring",
        right_ring = "Shadow Ring",
        back = "Solemnity Cape"
    }

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = {
        main = "Idris",
        sub = "Genbu's Shield",
        range = "Dunna",
        head = "Azimuth Hood +3",
        body = "Azimuth Coat +3",
        hands = "Geo. Mitaines +3",
        legs = "Nyame Flanchard",
        feet = "Bagua Sandals +3",
        neck = "Bagua Charm +1",
        waist = "Isa Belt",
        left_ear = "Lugalbanda Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Defending Ring",
        right_ring = "Shadow Ring",
        back = gear.idle_jse_back
    }

    sets.idle.DT.Pet = {
        main = "Idris",
        sub = "Genbu's Shield",
        range = "Dunna",
        head = "Nyame Helm",
        body = "Azimuth Coat +3",
        hands = "Geo. Mitaines +3",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Bagua Charm +1",
        waist = "Carrier's Sash",
        left_ear = "Lugalbanda Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Defending Ring",
        right_ring = "Shadow Ring",
        back = gear.idle_jse_back
    }

    sets.idle.DTMeva.Pet = {
        main = "Idris",
        sub = "Genbu's Shield",
        range = "Dunna",
        head = "Nyame Helm",
        body = "Agwu's Robe",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Bagua Charm +1",
        waist = "Carrier's Sash",
        left_ear = "Lugalbanda Earring",
        right_ear = "Odnowa Earring +1",
        left_ring = "Defending Ring",
        right_ring = "Shadow Ring",
        back = gear.idle_jse_back
    }

    sets.idle.Town = {
        main = "Idris",
        sub = "Ammurapi Shield",
        ammo = "Ghastly Tathlum +1",
        head = "Azimuth Hood +3",
        body = "Azimuth Coat +3",
        hands = "Azimuth Gloves +3",
        legs = "Azimuth Tights +3",
        feet = "Azimuth Gaiters +3",
        neck = "Loricate Torque +1",
        waist = "Acuity Belt +1",
        left_ear = "Malignance Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Defending Ring",
        right_ring = "Shadow Ring",
        back = "Shadow Mantle"
    }

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {})
    sets.idle.DT.Indi = set_combine(sets.idle.DT, {})
    sets.idle.DT.Pet.Indi = set_combine(sets.idle.DT.Pet, {})
    sets.idle.DTMeva.Indi = set_combine(sets.idle.DTMeva, {})
    sets.idle.DTMeva.Pet.Indi = set_combine(sets.idle.DTMeva.Pet, {})

    sets.idle.Weak = {
        main = "Malignance Pole",
        sub = "Irenic Strap",
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        body = "Agwu's Robe",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Bagua Charm +1",
        waist = "Carrier's Sash",
        left_ear = "Eabani Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Defending Ring",
        right_ring = "Shadow Ring",
        back = gear.idle_jse_back
    }

    -- Defense sets

    sets.defense.PDT = sets.idle.DT

    sets.defense.MDT = sets.idle.DTMeva

    sets.defense.MEVA = sets.idle.DTMeva

    sets.defense.PetPDT = sets.idle.DT.Pet

    sets.defense.NukeLock = sets.midcast['Elemental Magic']

    sets.defense.GeoLock = sets.midcast.Geomancy.Indi

    sets.Kiting = {
        feet = "Geo. Sandals +3"
    }
    sets.Kiting.Pet = {
        feet = "Bagua Sandals +3"
    }
    sets.latent_refresh = {
        waist = "Fucho-no-obi"
    }
    sets.latent_refresh_grip = {
        sub = "Oneiros Grip"
    }
    sets.TPEat = {
        neck = "Chrys. Torque"
    }
    sets.DayIdle = {}
    sets.NightIdle = {}
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {
        feet = gear.merlinic_treasure_feet
    })

    sets.HPDown = {
        head = "Pixie Hairpin +1",
        ear1 = "Mendicant's Earring",
        ear2 = "Evans Earring",
        body = "Agwu's Robe",
        hands = "Jhakri Cuffs +2",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Mephitas's Ring",
        back = "Swith Cape +1",
        legs = "Shedir Seraweels",
        feet = "Jhakri Pigaches +1"
    }

    sets.buff.Doom = set_combine(sets.buff.Doom, {})

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        main = "C. Palug Hammer",
        sub = 'Genbu\'s Shield',
        ammo = "Vanir Battery",
        head = "Nyame Helm",
        neck = "Asperity Necklace",
        ear1 = "Cessance Earring",
        ear2 = "Telos Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Chirich Ring +1",
        ring2 = "Petrov Ring",
        back = gear.idle_jse_back,
        waist = "Cornelia's Belt",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.engaged.DW = {
        ammo = "Vanir Battery",
        head = "Nyame Helm",
        neck = "Asperity Necklace",
        ear1 = "Cessance Earring",
        ear2 = "Telos Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Chirich Ring +1",
        ring2 = "Petrov Ring",
        back = gear.idle_jse_back,
        waist = "Cornelia's Belt",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    -- Gear that converts elemental damage done to recover MP.	
    sets.RecoverMP = {
        body = "Seidr Cotehardie"
    }

    sets.buff.Sublimation = {
        waist = "Embla Sash"
    }
    sets.buff.DTSublimation = {
        waist = "Embla Sash"
    }

    -- Weapons sets

    sets.weapons.Hammertime = {
        main = "C. Palug Hammer",
        sub = 'Genbu\'s Shield'
    }

    sets.weapons.Max = {
        main = 'Maxentius',
        sub = 'Genbu\'s Shield'
    }
    sets.weapons.Idris = {
        main = 'Idris',
        sub = 'Genbu\'s Shield'
    }
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 21)
end

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 005')
end

-- Don't auto dismiss
function job_filter_precast(spell, spellMap, eventArgs)
    -- if spell.english:startswith('Geo-') and pet.isvalid then
    -- 	eventArgs.cancel = true
    -- 	windower.chat.input('/ja "Full Circle" <me>')
    -- 	windower.chat.input:schedule(1.3,'/ma "'..spell.english..'" '..spell.target.raw..'')
    -- end
end

-- Don't switch to kiting if luopan is out
function apply_kiting(baseSet)
    if sets.Kiting and (state.Kiting.value or (player.status == 'Idle' and moving and state.DefenseMode.value == 'None')) and not pet.isvalid then
        baseSet = set_combine(baseSet, sets.Kiting)
    end

    if user_customize_kiting_set then
        baseSet = user_customize_kiting_set(baseSet)
    end

    if job_customize_kiting_set then
        baseSet = job_customize_kiting_set(baseSet)
    end

    if user_job_customize_kiting_set then
        baseSet = user_job_customize_kiting_set(baseSet)
    end

    return baseSet
end
