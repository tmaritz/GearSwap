function user_job_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'Acc', 'FullAcc', 'Fodder')
    state.HybridMode:options('Normal', 'TP')
    state.WeaponskillMode:options('Match', 'Normal', 'Acc', 'FullAcc', 'Fodder')
    state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'MDT', 'PDT', 'EvaDT')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
    state.ResistDefenseMode:options('EvaDT')
    state.Weapons:options('NaegThib', 'MaxSak', 'MaxBun', 'None') -- ,'Tizalmace','Sequence','None','Almace','MeleeClubs','MaccWeapons','HybridWeapons')

    state.ExtraMeleeMode = M {
        ['description'] = 'Extra Melee Mode',
        'None',
        'MP',
        'SuppaBrutal',
        'DWEarrings',
        'DWMax'
    }

    gear.dw_jse_back = {
        name = "Rosmerta's Cape",
        augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10'}
    }
    gear.stp_jse_back = {
        name = "Rosmerta's Cape",
        augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10'}
    }
    gear.crit_jse_back = {
        name = "Rosmerta's Cape",
        augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Crit.hit rate+10'}
    }
    gear.wsd_jse_back = {
        name = "Rosmerta's Cape",
        augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
    }
    gear.nuke_jse_back = {
        name = "Rosmerta's Cape",
        augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', '"Mag.Atk.Bns."+10'}
    }

    gear.obi_cure_waist = "Luminary Sash"
    gear.obi_nuke_waist = "Yamabuki-no-Obi"
    gear.obi_cure_back = "Tempered Cape +1"

    autows = 'Savage Blade'
    -- autows = 'Chant du Cygne'

    -- Additional local binds
    send_command('bind ^` input /ja "Chain Affinity" <me>')
    send_command('bind @` input /ja "Efflux" <me>')
    send_command('bind !` input /ja "Burst Affinity" <me>')
    send_command('bind ^@!` gs c cycle SkillchainMode')
    send_command(
        'bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
    send_command(
        'bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
    send_command('bind @backspace input /ja "Convergence" <me>')
    send_command('bind @f10 gs c toggle LearningMode')
    send_command('bind ^@!` gs c cycle MagicBurstMode')
    send_command('bind @f8 gs c toggle AutoNukeMode')
    send_command('bind !@^f7 gs c toggle AutoWSMode')
    -- send_command('bind !b gs c weapons None;gs c update')
    -- send_command('bind @q gs c weapons MaccWeapons;gs c update')
    -- send_command('bind ^q gs c weapons Almace;gs c update')
    -- send_command('bind !q gs c weapons HybridWeapons;gs c update')

    select_default_macro_book()
    user_job_lockstyle()
end

function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.buff['Burst Affinity'] = {
        feet = "Hashishin Basmak"
    }
    sets.buff['Chain Affinity'] = {
        feet = "Assim. Charuqs +2"
    }
    sets.buff.Convergence = {
        head = "Luh. Keffiyeh +1"
    }
    sets.buff.Diffusion = {
        feet = "Luhlaza Charuqs +1"
    }
    sets.buff.Enchainment = {}
    sets.buff.Efflux = {
        back = gear.dw_jse_back,
        legs = "Hashishin Tayt +2"
    }
    sets.buff.Doom = set_combine(sets.buff.Doom, {})

    sets.HPDown = {
        head = "Pixie Hairpin +1",
        neck = "Loricate Torque +1",
        ear1 = "Mendicant's Earring",
        ear2 = "Evans Earring",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Mephitas's Ring",
        back = "Swith Cape +1",
        waist = "Flume Belt +1",
        legs = "Shedir Seraweels",
        feet = "Hashi. Basmak +2"
    }

    -- Precast Sets

    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {
        hands = "Luh. Bazubands +1"
    }

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
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

    sets.Self_Waltz = {
        body = "Passion Jacket",
        ring1 = "Asklepian Ring"
    }

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {
        ammo = "Ginsen",
        head = "Malignance Chapeau",
        neck = "Mirage Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Telos Earring",
        body = "Assim. Jubbah +2",
        hands = "Malignance Gloves",
        ring1 = "Ramuh Ring +1",
        ring2 = "Ramuh Ring +1",
        back = gear.dw_jse_back,
        waist = "Windbuffet Belt +1",
        legs = "Carmine Cuisses +1",
        feet = "Malignance Boots"
    }

    sets.precast.Flourish1 = {
        ammo = "Ginsen",
        head = "Malignance Chapeau",
        neck = "Mirage Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Cornflower Cape",
        waist = "Windbuffet Belt +1",
        legs = "Malignance Tights",
        feet = "Malignance Boots"
    }

    -- Fast cast sets for spells

    sets.precast.FC = {
        main = "Vampirism",
        sub = "Vampirism",
        ammo = "Impatiens",
        head = "Malignance Chapeau",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Loquac. Earring",
        body = "Luhlaza Jubbah +3",
        hands = "Leyline Gloves",
        ring1 = "Kishar Ring",
        ring2 = "Prolix Ring",
        back = "Perimede Cape",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Regal Pumps +1"
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        body = "Passion Jacket"
    })

    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {
        body = "Hashishin Mintan +2"
    })

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo = "Coiste Bodhar",
        head = "Malignance Chapeau",
        neck = "Loricate Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Rufescent Ring",
        ring2 = "Ilabrat Ring",
        back = gear.dw_jse_back,
        waist = "Fotia Belt",
        legs = "Malignance Tights",
        feet = "Malignance Boots"
    }

    sets.precast.WS.Acc = {
        ammo = "Ginsen",
        head = "Malignance Chapeau",
        neck = "Fotia Gorget",
        ear1 = "Mache Earring +1",
        ear2 = "Telos Earring",
        body = "Adhemar Jacket +1",
        hands = "Malignance Gloves",
        ring1 = "Epona's Ring",
        ring2 = "Ilabrat Ring",
        back = gear.dw_jse_back,
        waist = "Fotia Belt",
        legs = "Carmine Cuisses +1",
        feet = "Nyame Sollerets"
    }

    sets.precast.WS.FullAcc = {
        ammo = "Ginsen",
        head = "Malignance Chapeau",
        neck = "Mirage Stole +1",
        ear1 = "Mache Earring +1",
        ear2 = "Odr Earring",
        body = "Adhemar Jacket +1",
        hands = "Malignance Gloves",
        ring1 = "Ramuh Ring +1",
        ring2 = "Ramuh Ring +1",
        back = gear.dw_jse_back,
        waist = "Windbuffet Belt +1",
        legs = "Carmine Cuisses +1",
        feet = "Malignance Boots"
    }

    sets.precast.WS.DT = {
        ammo = "Coiste Bodhar",
        head = "Malignance Chapeau",
        neck = "Loricate Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Defending Ring",
        ring2 = "Ilabrat Ring",
        back = gear.dw_jse_back,
        waist = "Fotia Belt",
        legs = "Malignance Tights",
        feet = "Malignance Boots"
    }

    sets.precast.WS.Fodder = {
        ammo = "Coiste Bodhar",
        head = "Lilitu Headpiece",
        neck = "Fotia Gorget",
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring",
        body = "Adhemar Jacket +1",
        hands = "Jhakri Cuffs +2",
        ring1 = "Epona's Ring",
        ring2 = "Apate Ring",
        back = gear.dw_jse_back,
        waist = "Fotia Belt",
        legs = "Samnuha Tights",
        feet = "Nyame Sollerets"
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
        ammo = "Quartz Tathlum +1",
        head = "Jhakri Coronal +2",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Jhakri Slops +1",
        feet = "Hashi. Basmak +2",
        neck = "Soil Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Brutal Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Epona's Ring"
    })
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {
        ammo = "Quartz Tathlum +1",
        head = "Jhakri Coronal +2",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Jhakri Slops +1",
        feet = "Hashi. Basmak +2",
        neck = "Soil Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Brutal Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Epona's Ring"
    })
    sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Requiescat'].DT = set_combine(sets.precast.WS.DT, {})
    sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

    sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {
        head = "Jhakri Coronal +2",
        ear1 = "Regal Earring",
        body = "Jhakri Robe +2",
        ring1 = "Epona's Ring",
        legs = "Jhakri Slops +1",
        feet = "Hashi. Basmak +2"
    })
    sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {
        head = "Jhakri Coronal +2",
        ear1 = "Regal Earring",
        ear2 = "Telos Earring",
        ring1 = "Epona's Ring",
        legs = "Jhakri Slops +1",
        feet = "Hashi. Basmak +2"
    })
    sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Realmrazer'].DT = set_combine(sets.precast.WS.DT, {})
    sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
        ammo = "Oshasha's Treatise",
        head = "Adhemar Bonnet +1",
        body = "Gleti's Cuirass",
        hands = "Adhemar Wrist. +1",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        neck = "Mirage Stole +1",
        waist = "Fotia Belt",
        left_ear = "Mache Earring +1",
        right_ear = "Cessance Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Epona's Ring",
        back = gear.crit_jse_back
    })
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {
        ammo = "Oshasha's Treatise",
        head = "Adhemar Bonnet +1",
        body = "Gleti's Cuirass",
        hands = "Adhemar Wrist. +1",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        neck = "Mirage Stole +1",
        waist = "Fotia Belt",
        left_ear = "Mache Earring +1",
        right_ear = "Cessance Earring",
        left_ring = "Rufescent Ring",
        right_ring = "Epona's Ring",
        back = gear.crit_jse_back
    })
    sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS.DT, {
        back = gear.crit_jse_back
    })
    sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
        ammo = "Oshasha's Treatise",
        head = "Hashishin Kavuk +2",
        neck = "Mirage Stole +1",
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring2 = "Karieyh Ring +1",
        ring1 = "Epona's Ring",
        back = gear.wsd_jse_back,
        waist = "Sailfi Belt +1",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    })
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {
        ammo = "Oshasha's Treatise",
        head = "Gleti's Mask",
        neck = "Mirage Stole +1",
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        body = "Gleti's Cuirass",
        hands = "Jhakri Cuffs +2",
        ring2 = "Rufescent Ring",
        ring1 = "Epona's Ring",
        back = gear.wsd_jse_back,
        waist = "Sailfi Belt +1",
        legs = "Luhlaza Shalwar +3",
        feet = "Gleti's Boots"
    })
    sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS.DT, {
        back = gear.wsd_jse_back
    })
    sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

    sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
    sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
    sets.precast.WS['Vorpal Blade'].FullAcc = sets.precast.WS['Chant du Cygne'].FullAcc
    sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT
    sets.precast.WS['Vorpal Blade'].Fodder = sets.precast.WS['Chant du Cygne'].Fodder

    sets.precast.WS['Expiacion'] = sets.precast.WS['Savage Blade']
    sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {
        ear1 = "Moonshade Earring",
        body = "Assim. Jubbah +2",
        hands = "Jhakri Cuffs +2",
        back = gear.wsd_jse_back,
        legs = "Carmine Cuisses +1",
        feet = gear.herculean_wsd_feet
    })
    sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, {
        body = "Assim. Jubbah +2",
        hands = "Jhakri Cuffs +2"
    })
    sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS.DT, {
        back = gear.wsd_jse_back
    })
    sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

    sets.precast.WS['Sanguine Blade'] = {
        ammo = "Pemphredo Tathlum",
        head = "Pixie Hairpin +1",
        neck = "Baetyl Pendant",
        ear1 = "Regal Earring",
        ear2 = "Friomisi Earring",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        ring1 = "Metamor. Ring +1",
        ring2 = "Archon Ring",
        back = gear.nuke_jse_back,
        waist = "Yamabuki-no-Obi",
        legs = "Jhakri Slops +1",
        feet = "Hashi. Basmak +2"
    }

    sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {
        back = gear.nuke_jse_back
    })

    sets.precast.WS['Flash Nova'] = {
        ammo = "Pemphredo Tathlum",
        head = "Jhakri Coronal +2",
        neck = "Baetyl Pendant",
        ear1 = "Regal Earring",
        ear2 = "Friomisi Earring",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        ring1 = "Metamor. Ring +1",
        ring2 = "Medada's Ring",
        back = gear.nuke_jse_back,
        waist = "Yamabuki-no-Obi",
        legs = "Jhakri Slops +1",
        feet = "Hashi. Basmak +2"
    }

    sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {
        back = gear.nuke_jse_back
    })

    -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {
        ear1 = "Cessance Earring",
        ear2 = "Brutal Earring"
    }
    sets.AccMaxTP = {
        ear1 = "Regal Earring",
        ear2 = "Telos Earring"
    }

    -- Midcast Sets
    sets.midcast.FastRecast = {
        ammo = "Hasty Pinion +1",
        head = "Malignance Chapeau",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Loquac. Earring",
        body = "Luhlaza Jubbah +3",
        hands = "Leyline Gloves",
        ring1 = "Kishar Ring",
        ring2 = "Prolix Ring",
        back = "Swith Cape +1",
        waist = "Witful Belt",
        legs = "Psycloth Lappas",
        feet = "Regal Pumps +1"
    }

    sets.midcast['Blue Magic'] = {}

    -- Physical Spells --

    sets.midcast['Blue Magic'].Physical = {
        main = "Vampirism",
        sub = "Vampirism",
        ammo = "Mavi Tathlum",
        head = "Lilitu Headpiece",
        neck = "Mirage Stole +1",
        ear1 = "Suppanomimi",
        ear2 = "Telos Earring",
        body = "Jhakri Robe +2",
        hands = "Hashi. Bazu. +2",
        ring1 = "Ifrit Ring",
        ring2 = "Ilabrat Ring",
        back = gear.wsd_jse_back,
        waist = "Grunfeld Rope",
        legs = "Jhakri Slops +1",
        feet = "Jhakri Pigaches +2"
    }

    sets.midcast['Blue Magic'].Physical.Resistant = {
        main = "Sequence",
        sub = gear.nibiru_b_sword,
        ammo = "Ginsen",
        head = "Jhakri Coronal +2",
        neck = "Mirage Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Telos Earring",
        body = "Assim. Jubbah +2",
        hands = "Malignance Gloves",
        ring1 = "Ramuh Ring +1",
        ring2 = "Ramuh Ring +1",
        back = gear.dw_jse_back,
        waist = "Grunfeld Rope",
        legs = "Jhakri Slops +1",
        feet = "Jhakri Pigaches +2"
    }

    sets.midcast['Blue Magic'].Physical.Fodder = {
        main = "Iris",
        sub = "Iris",
        ammo = "Mavi Tathlum",
        head = "Luh. Keffiyeh +1",
        neck = "Mirage Stole +1",
        ear1 = "Suppanomimi",
        ear2 = "Telos Earring",
        body = "Assim. Jubbah +2",
        hands = "Jhakri Cuffs +2",
        ring1 = "Ifrit Ring",
        ring2 = "Ilabrat Ring",
        back = "Cornflower Cape",
        waist = "Grunfeld Rope",
        legs = "Hashishin Tayt +2",
        feet = "Luhlaza Charuqs +1"
    }

    sets.midcast['Blue Magic'].PhysicalAcc = {
        main = "Sequence",
        sub = gear.nibiru_b_sword,
        ammo = "Ginsen",
        head = "Jhakri Coronal +2",
        neck = "Mirage Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Telos Earring",
        body = "Assim. Jubbah +2",
        hands = "Jhakri Cuffs +2",
        ring1 = "Ramuh Ring +1",
        ring2 = "Ilabrat Ring",
        back = gear.dw_jse_back,
        waist = "Grunfeld Rope",
        legs = "Jhakri Slops +1",
        feet = "Malignance Boots"
    }

    sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
    sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

    sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
    sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
    sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
    sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
    sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
    sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
    sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
    sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
    sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

    -- Magical Spells --

    sets.midcast['Blue Magic'].Magical = {
        ammo = "Ghastly Tathlum +1",
        head = "Hashishin Kavuk +2",
        neck = "Sibyl Scarf",
        ear1 = "Hecate's Earring",
        ear2 = "Friomisi Earring",
        body = "Hashishin Mintan +2",
        hands = "Hashi. Bazu. +2",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Eschan Stone",
        legs = "Luhlaza Shalwar +3",
        feet = "Hashi. Basmak +2"
    }

    sets.midcast['Blue Magic'].Magical.Proc = {
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        neck = "Sibyl Scarf",
        ear1 = "Hecate's Earring",
        ear2 = "Friomisi Earring",
        body = "Hashishin Mintan +2",
        hands = "Amalric Gages",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Eschan Stone",
        legs = "Luhlaza Shalwar +3",
        feet = "Amalric Nails"
    }

    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {
        neck = "Sibyl Scarf",
        hands = "Jhakri Cuffs +2",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        waist = "Yamabuki-no-Obi"
    })

    sets.midcast['Blue Magic'].Magical.Fodder = {
        main = "Kaja Rod",
        sub = "Nibiru Cudgel",
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        neck = "Deviant Necklace",
        ear1 = "Hecate's Earring",
        ear2 = "Friomisi Earring",
        body = "Jhakri Robe +2",
        hands = "Amalric Gages",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Eschan Stone",
        legs = "Luhlaza Shalwar +3",
        feet = "Hashi. Basmak +2"
    }

    sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {
        ring2 = "Stikini Ring"
    })
    sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

    sets.midcast['Blue Magic'].MagicAccuracy = {
        ammo = "Ghastly Tathlum +1",
        head = "Hashishin Kavuk +2",
        neck = "Mirage Stole +1",
        ear1 = "Gwati Earring",
        ear2 = "Calamitous Earring",
        body = "Hashishin Mintan +2",
        hands = "Hashi. Bazu. +2",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Eschan Stone",
        legs = "Hashishin Tayt +2",
        feet = "Hashi. Basmak +2"
    }

    sets.midcast['Enfeebling Magic'] = {
        main = "Kaja Rod",
        sub = "Nibiru Cudgel",
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        neck = "Sibyl Scarf",
        ear1 = "Hecate's Earring",
        ear2 = "Friomisi Earring",
        body = "Jhakri Robe +2",
        hands = "Amalric Gages",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Eschan Stone",
        legs = "Luhlaza Shalwar +3",
        feet = "Hashi. Basmak +2"
    }

    sets.midcast['Dark Magic'] = {
        main = "Kaja Rod",
        sub = "Nibiru Cudgel",
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        neck = "Sibyl Scarf",
        ear1 = "Hecate's Earring",
        ear2 = "Friomisi Earring",
        body = "Jhakri Robe +2",
        hands = "Amalric Gages",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Eschan Stone",
        legs = "Luhlaza Shalwar +3",
        feet = "Hashi. Basmak +2"
    }

    sets.midcast['Enhancing Magic'] = {
        main = "Kaja Rod",
        sub = "Nibiru Cudgel",
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        neck = "Sibyl Scarf",
        ear1 = "Hecate's Earring",
        ear2 = "Friomisi Earring",
        body = "Jhakri Robe +2",
        hands = "Amalric Gages",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Eschan Stone",
        legs = "Luhlaza Shalwar +3",
        feet = "Hashi. Basmak +2"
    }

    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
        main = "Pukulatmuj +1",
        sub = "Pukulatmuj",
        head = "Malignance Chapeau",
        ear2 = "Mimir Earring",
        hands = gear.herculean_phalanx_hands,
        legs = "Carmine Cuisses +1",
        feet = gear.herculean_nuke_feet
    })

    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Amalric Coif +1"
    })

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Amalric Coif +1",
        hands = "Regal Cuffs",
        waist = "Emphatikos Rope",
        legs = "Shedir Seraweels"
    })

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        ear2 = "Earthcry Earring",
        waist = "Siegel Sash",
        legs = "Shedir Seraweels"
    })

    sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
        legs = "Shedir Seraweels"
    })

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })
    sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })
    sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })

    sets.midcast['Divine Magic'] = {
        ammo = "Pemphredo Tathlum",
        head = "Jhakri Coronal +2",
        neck = "Incanter's Torque",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        ring1 = "Metamor. Ring +1",
        ring2 = "Stikini Ring",
        back = gear.nuke_jse_back,
        waist = "Luminary Sash",
        legs = "Jhakri Slops +1",
        feet = "Hashi. Basmak +2"
    }

    sets.midcast['Elemental Magic'] = {
        main = "Kaja Rod",
        sub = "Nibiru Cudgel",
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        neck = "Sibyl Scarf",
        ear1 = "Hecate's Earring",
        ear2 = "Friomisi Earring",
        body = "Jhakri Robe +2",
        hands = "Amalric Gages",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Eschan Stone",
        legs = "Luhlaza Shalwar +3",
        feet = "Hashi. Basmak +2"
    }

    sets.midcast['Elemental Magic'].Resistant = {
        main = "Kaja Rod",
        sub = "Nibiru Cudgel",
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        neck = "Sibyl Scarf",
        ear1 = "Hecate's Earring",
        ear2 = "Friomisi Earring",
        body = "Jhakri Robe +2",
        hands = "Amalric Gages",
        ring1 = "Medada's Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.nuke_jse_back,
        waist = "Eschan Stone",
        legs = "Luhlaza Shalwar +3",
        feet = "Hashi. Basmak +2"
    }

    sets.midcast.Helix = sets.midcast['Elemental Magic']
    sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

    sets.element.Dark = {
        head = "Pixie Hairpin +1",
        ring2 = "Archon Ring"
    }
    sets.element.Light = {} -- ring2="Weatherspoon Ring"

    sets.midcast.Cure = {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel",
        ammo = "Pemphredo Tathlum",
        head = "Pinga Crown",
        neck = "Incanter's Torque",
        ear1 = "Etiolation Earring",
        ear2 = "Mendi. Earring",
        body = "Pinga Tunic",
        hands = "Telchine Gloves",
        ring1 = "Janniston Ring",
        ring2 = "Menelaus's Ring",
        back = gear.ElementalCape,
        waist = gear.ElementalObi,
        legs = "Carmine Cuisses +1",
        feet = "Regal Pumps +1"
    }

    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        neck = "Debilis Medallion",
        hands = "Hieros Mittens",
        back = "Oretan. Cape +1",
        ring1 = "Haoma's Ring",
        ring2 = "Menelaus's Ring",
        waist = "Witful Belt"
    })

    -- Breath Spells --

    sets.midcast['Blue Magic'].Breath = {
        ammo = "Mavi Tathlum",
        head = "Luh. Keffiyeh +1",
        neck = "Mirage Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Assim. Jubbah +2",
        hands = "Luh. Bazubands +1",
        ring1 = "Kunaji Ring",
        ring2 = "Meridian Ring",
        back = "Cornflower Cape",
        legs = "Hashishin Tayt +2",
        feet = "Luhlaza Charuqs +1"
    }

    -- Physical Added Effect Spells most notably "Stun" spells --

    sets.midcast['Blue Magic'].Stun = {
        main = "Kaja Rod",
        sub = "Nibiru Cudgel",
        ammo = "Ghastly Tathlum +1",
        head = "Jhakri Coronal +2",
        neck = "Sibyl Scarf",
        ear1 = "Hecate's Earring",
        ear2 = "Friomisi Earring",
        body = "Jhakri Robe +2",
        hands = "Amalric Gages",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = gear.nuke_jse_back,
        waist = "Eschan Stone",
        legs = "Luhlaza Shalwar +3",
        feet = "Hashi. Basmak +2"
    }

    sets.midcast['Blue Magic'].Stun.Resistant = {
        main = "Iris",
        sub = "Iris",
        ammo = "Ginsen",
        head = "Malignance Chapeau",
        neck = "Mirage Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = "Metamor. Ring +1",
        ring2 = "Stikini Ring",
        back = "Cornflower Cape",
        waist = "Windbuffet Belt +1",
        legs = "Malignance Tights",
        feet = "Malignance Boots"
    }

    sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

    -- Other Specific Spells --

    sets.midcast['Blue Magic']['White Wind'] = {
        ammo = "Mavi Tathlum",
        head = "Malignance Chapeau",
        neck = "Phalaina Locket",
        ear1 = "Etiolation Earring",
        ear2 = "Odnowa Earring +1",
        body = "Vrikodara Jupon",
        hands = "Telchine Gloves",
        ring1 = "Janniston Ring",
        ring2 = "Lebeche Ring",
        back = "Solemnity Cape",
        waist = gear.ElementalObi,
        legs = "Gyve Trousers",
        feet = "Medium's Sabots"
    }

    sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

    sets.midcast['Blue Magic'].Healing = {
        main = "Nibiru Cudgel",
        sub = "Nibiru Cudgel",
        ammo = "Mavi Tathlum",
        head = "Malignance Chapeau",
        neck = "Incanter's Torque",
        ear1 = "Etiolation Earring",
        ear2 = "Mendi. Earring",
        body = "Vrikodara Jupon",
        hands = "Telchine Gloves",
        ring1 = "Janniston Ring",
        ring2 = "Menelaus's Ring",
        back = gear.ElementalCape,
        waist = gear.ElementalObi,
        legs = "Carmine Cuisses +1",
        feet = "Medium's Sabots"
    }

    -- Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
    sets.NonElementalCure = {
        back = "Tempered Cape +1",
        waist = "Luminary Sash"
    }

    sets.midcast['Blue Magic'].SkillBasedBuff = {
        main = "Iris",
        sub = "Iris",
        ammo = "Mavi Tathlum",
        head = "Luh. Keffiyeh +1",
        neck = "Mirage Stole +1",
        ear1 = "Gifted Earring",
        ear2 = "Loquac. Earring",
        body = "Assim. Jubbah +2",
        hands = "Rawhide Gloves",
        ring1 = "Stikini Ring",
        ring2 = "Stikini Ring",
        back = "Cornflower Cape",
        waist = "Witful Belt",
        legs = "Hashishin Tayt +2",
        feet = "Luhlaza Charuqs +1"
    }

    sets.midcast['Blue Magic'].Buff = {
        main = "Vampirism",
        sub = "Vampirism",
        ammo = "Mavi Tathlum",
        head = "Luh. Keffiyeh +1",
        neck = "Incanter's Torque",
        ear1 = "Gifted Earring",
        ear2 = "Loquac. Earring",
        body = "Assim. Jubbah +2",
        hands = "Hashi. Bazu. +2",
        ring1 = "Kishar Ring",
        ring2 = "Dark Ring",
        back = "Aurist's Cape +1",
        waist = "Witful Belt",
        legs = "Lengo Pants",
        feet = "Carmine Greaves +1"
    }

    sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {
        head = "Amalric Coif +1",
        back = "Grapevine Cape",
        waist = "Gishdubar Sash"
    })

    sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {
        head = "Amalric Coif +1",
        hands = "Regal Cuffs",
        waist = "Emphatikos Rope",
        legs = "Shedir Seraweels"
    })

    -- Sets to return to when not performing an action.

    sets.latent_refresh = {
        waist = "Fucho-no-obi"
    }
    sets.latent_refresh_grip = {
        sub = "Oneiros Grip"
    }
    sets.DayIdle = {}
    sets.NightIdle = {}

    -- Gear for learning spells: +skill and AF hands.
    sets.Learning = {
        hands = "Magus Bazubands"
    }

    -- Resting sets
    sets.resting = {
        main = "Bolelabunga",
        sub = "Genbu\'s Shield",
        ammo = "Coiste Bodhar",
        head={ name="Herculean Helm", augments={'Rng.Acc.+6 Rng.Atk.+6','Accuracy+13 Attack+13','"Refresh"+2','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
        neck = "Loricate Torque +1",
        ear1 = "Etiolation Earring",
        ear2 = "Ethereal Earring",
        body = "Jhakri Robe +2",
        hands = gear.herculean_refresh_hands,
        ring1 = "Defending Ring",
        ring2 = "Sheltered Ring",
        back = "Bleating Mantle",
        waist = "Flume Belt +1",
        legs = "Carmine Cuisses +1",
        feet = gear.herculean_refresh_feet
    }

    -- Idle sets
    sets.idle = {
        ammo = "Staunch Tathlum +1",
        head={ name="Herculean Helm", augments={'Rng.Acc.+6 Rng.Atk.+6','Accuracy+13 Attack+13','"Refresh"+2','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
        neck = "Sibyl Scarf",
        ear1 = "Infused Earring",
        ear2 = "Eabani Earring",
        body = "Hashishin Mintan +2",
        hands = "Nyame Gauntlets",
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = "Shadow Mantle",
        waist = "Carrier's Sash",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.idle.MDT = {
        ammo = "Vanir Battery",
        head = "Gleti's Mask",
        body = "Gleti's Cuirass",
        hands = "Malignance Gloves",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        neck = "Warder's Charm +1",
        waist = "Carrier Sash",
        left_ear = "Odnowa Earring +1",
        right_ear = "Eabani Earring",
        left_ring = "Defending Ring",
        right_ring = "Shadow Ring",
        back = "Solemnity Cape"
    }

    sets.idle.PDT = {
        ammo = "Staunch Tathlum +1",
        head = "Gleti's Mask",
        body = "Gleti's Cuirass",
        hands = "Gleti's Gauntlets",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        neck = "Loricate Torque +1",
        waist = "Flume Belt +1",
        left_ear = "Infused Earring",
        right_ear = "Eabani Earring",
        left_ring = "Defending Ring",
        right_ring = "Gelatinous Ring +1",
        back = "Shadow Mantle"
    }

    sets.idle.EvaDT = {
        ammo = "Amar Cluster",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Gleti's Breeches",
        feet = "Malignance Boots",
        neck = "Loricate Torque +1",
        waist = "Svelt. Gouriz +1",
        left_ear = "Infused Earring",
        right_ear = "Eabani Earring",
        left_ring = "Defending Ring",
        right_ring = "Gelatinous Ring +1",
        back = "Shadow Mantle"
    }

    -- Defense sets
    sets.defense.DT = sets.idle.DT

    sets.defense.MDT = sets.idle.MDT

    sets.defense.EvaDT = sets.idle.EvaDT

    sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

    sets.Kiting = {
        legs = "Carmine Cuisses +1"
    }

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {
        waist = "Flume Belt +1",
        ear1 = "Suppanomimi",
        ear2 = "Eabani Earring"
    }
    sets.MP_Knockback = {}
    sets.SuppaBrutal = {
        ear1 = "Suppanomimi",
        ear2 = "Brutal Earring"
    }
    sets.DWEarrings = {
        ear1 = "Dudgeon Earring",
        ear2 = "Heartseeker Earring"
    }
    sets.DWMax = {
        ear1 = "Dudgeon Earring",
        ear2 = "Heartseeker Earring",
        body = "Adhemar Jacket +1",
        waist = "Reiki Yotai",
        legs = "Carmine Cuisses +1"
    }
    sets.TreasureHunter = {
        body = "Herculean Vest",
        feet = gear.herculean_th_feet,
        waist = "Chaac Belt",
        ammo = "Per. Lucky Egg"
    }

    -- Weapons sets

    sets.weapons.MaxBun = {
        main = "Maxentius",
        sub = "Bunzi's Rod"
    }
    sets.weapons.NaegThib = {
        main = "Naegling",
        sub = "Thibron"
    }
    sets.weapons.MaxSak = {
        main = "Maxentius",
        sub = "Sakpata's Sword"
    }

    -- Engaged sets

    sets.engaged = {
        ammo = "Aurgelmir Orb",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Mirage Stole +1",
        waist = "Windbuffet Belt +1",
        left_ear = "Suppanomimi",
        right_ear = "Dedition Earring",
        left_ring = "Defending Ring",
        right_ring = "Epona's Ring",
        back = gear.dw_jse_back
    }

    -- sets.engaged.AM = {
    -- }

    sets.engaged.TP = {
        ammo = "Aurgelmir Orb",
        head = "Adhemar Bonnet +1",
        body = "Adhemar Jacket +1",
        hands = "Adhemar Wrist. +1",
        legs = "Samnuha Tights",
        feet = "Maligance Boots",
        neck = "Mirage Stole +1",
        waist = "Windbuffet Belt +1",
        left_ear = "Dedition Earring",
        right_ear = "Suppanomimi",
        left_ring = "Epona's Ring",
        right_ring = "Chirich Ring +1",
        back = gear.dw_jse_back
    }

    -- sets.engaged.Acc.AM = {
    -- }

    sets.engaged.FullAcc = sets.engaged.Acc

    -- sets.engaged.FullAcc.AM = {
    -- }

    sets.engaged.Fodder = sets.engaged

    -- sets.engaged.Fodder.AM = sets.engaged.AM

    sets.Self_Healing = {
        neck = "Phalaina Locket",
        hands = "Buremte Gloves",
        legs = "Gyve Trousers",
        ring2 = "Kunaji Ring",
        waist = "Gishdubar Sash"
    }
    sets.Cure_Received = {
        neck = "Phalaina Locket",
        hands = "Buremte Gloves",
        ring2 = "Kunaji Ring",
        waist = "Gishdubar Sash"
    }
    sets.Self_Refresh = {
        back = "Grapevine Cape",
        waist = "Gishdubar Sash"
    }
    sets.MagicBurst = {
        body = "Samnuha Coat",
        hands = "Amalric Gages",
        ring1 = "Mujin Band",
        ring2 = "Locus Ring"
    }
    sets.Phalanx_Received = {
        hands = gear.herculean_phalanx_hands,
        feet = gear.herculean_phalanx_feet
    }
end

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 004')
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 16)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 16)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 16)
    elseif player.sub_job == 'RUN' then
        set_macro_page(1, 16)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 16)
    elseif player.sub_job == 'RDM' then
        set_macro_page(2, 16)
    else
        set_macro_page(6, 16)
    end
end

-- Job Specific Trust Override
function check_trust()
    if not moving then
        if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and
            (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
            local party = windower.ffxi.get_party()
            if party.p5 == nil then
                local spell_recasts = windower.ffxi.get_spell_recasts()

                if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
                    windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
                    windower.chat.input('/ma "Koru-Moru" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
                    windower.chat.input('/ma "Qultada" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
                    windower.chat.input('/ma "Ulmia" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
                    windower.chat.input('/ma "Selh\'teus" <me>')
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
