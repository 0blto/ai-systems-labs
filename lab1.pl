/*Игровые механики Dota 2 (упрощенная система сборки предметов) (идеальная пивная сборка на баратрума)*/

/*invisibility(Arg). - Arg дает невидимость*/
invisibility(shadow_amulet).

/*move_speed(Arg). - Arg дает скорость*/
move_speed(boots_of_speed).
move_speed(silver_edge).
move_speed(shadow_blade).
move_speed(solar_crest).
move_speed(force_boots).
move_speed(dispercer).
move_speed(swift_blink).
move_speed(yasha).
move_speed(wind_lace).

/*control(Arg). - Arg дает разного рода контроль над соперниками*/
control(wind_waker).
control(eul_scepter).
control(gleipnir).
control(disperser).
control(heavens_halberd).

/*armor(Arg). - Arg дает броню */
armor(solar_crest).
armor(medalion_of_courage).
armor(blade_mail).
armor(assault_cuiras).

/*power(Arg) - Arg дает силу*/
power(sange).
power(reaver).
power(drum_of_endurance).

/*intelligent(Arg). - Arg дает интеллект*/
intelligent(kaya).
intelligent(eul_scepter).
intelligent(power_treads).
intelligent(mystic_staff).
intelligent(drum_of_endurance).

/*agility(Arg). - Arg дает ловкость*/
agility(yasha).
agility(power_treads).
agility(eaglesong).

/*fast_movement(Arg). - Arg дает быстрое перемещение в другую точку*/
fast_movement(blink).
fast_movement(swift_blink).

/*hp(Arg). - Arg дает хп или хил*/
hp(vitality_booster).
hp(force_boots).
hp(point_booster).
hp(mechasm).

/*mana(Arg). - Arg дает ману или ее восстановление*/
mana(energy_booster).
mana(point_booster).

/*magic_resist(Arg). - защита от магии*/
magic_resist(kaya).

/*magic_damage(Arg). - доп урон от магии*/
magic_damage(kaya).
magic_damage(kaya_sange).
magic_damage(kaya_yasha).



/*needs(Arg1, Arg2). - Arg2 требует Arg1 для сборки*/
needs(shadow_amulet, shadow_blade).
needs(shadow_amulet, glimmers_cape).
needs(shadow_blade, silver_edge).
needs(vitality_booster, heart_of_tarrasque).
needs(reaver, owerhelming_blink).
needs(reaver, heart_of_tarrasque).
needs(blink, owerhelming_blink).
needs(blink, arcane_blink).
needs(blink, swift_blink).
needs(mystic_staff, arcane_blink).
needs(eaglesong, swift_blink).
needs(kaya, kaya_sange).
needs(kaya, kaya_yasha).
needs(sange, kaya_sange).
needs(sange, sange_yasha).
needs(yasha, kaya_yasha).
needs(yasha, sange_yasha).
needs(energy_booster, arcane_boots).
needs(boots_of_speed, arcane_boots).
needs(arcane_boots, guardian_greaves).
needs(mechasm, guardian_greaves).
needs(boots_of_speed, boots_of_travel).
needs(boots_of_travel, boots_of_travel_2).
needs(boots_of_speed, tranquil_boots).
needs(tranquil_boots, boots_of_bearing).
needs(boots_of_speed, power_treads).
needs(boots_of_speed, phase_boots).
needs(wind_lace, eul_scepter).
needs(eul_scepter, wind_waker).
needs(wind_lace, drum_of_endurance).
needs(wind_lace, tranquil_boots).
needs(drum_of_endurance, boots_of_bearing).



move_speed(Arg) :- needs(wind_lace, Arg); needs(boots_of_speed, Arg); needs(yasha, Arg); (needs(boots_of_speed, X), needs(X, Arg); needs(wind_lace, X), needs(X, Arg)).
fast_movement(Arg) :- needs(blink, Arg).
magic_resist(Arg) :- needs(kaya).
invisibility(Arg) :- needs(shadow_amulet, Arg); (needs(shadow_amulet, X), needs(X, Arg)).
mana(Arg) :- needs(energy_booster, Arg); needs(mystic_staff, Arg); needs(point_booster, Arg), needs(kaya, Arg).
hp(Arg) :- needs(reaver, Arg); needs(vitality_booster, Arg); needs(point_booster, Arg); needs(tranquil_boots, Arg); needs(mechasm, Arg); needs(sange, Arg).
power(Arg) :- needs(reaver, Arg); needs(sange, Arg).
intelligent(Arg) :- needs(mystic_staff, Arg); needs(kaya, Arg); needs(drum_of_endurance, Arg), needs(eul_scepter, Arg).
agility(Arg) :- needs(eaglesong, Arg); needs(yasha, Arg).
/*
agility(Arg) :- agility(X), needs(X, Arg).
*/