
//::///////////////////////////////////////////////////
//:: X0_TRAPSTR_FBALL
//:: OnTriggered script for a projectile trap
//:: Spell fired: SPELL_FIREBALL
//:: Spell caster level: 8
//::
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 11/17/2002
//:: Altered by msheeler for seige effect
//::///////////////////////////////////////////////////

#include "x0_i0_projtrap"

void main()
{
    TriggerProjectileTrap(SPELL_FIREBALL, GetWaypointByTag("fb_seige_trap"), 8);
}

