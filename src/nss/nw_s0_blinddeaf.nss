//::///////////////////////////////////////////////
//:: Blindness and Deafness
//:: [NW_S0_BlindDead.nss]
//:: Copyright (c) 2000 Bioware Corp.
//:://////////////////////////////////////////////
//:: Causes the target creature to make a Fort
//:: save or be blinded and deafened.
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 12, 2001
//:://////////////////////////////////////////////
// 7/19/2016   msheeler   changed duration to 2 rnds + 1 for epic focus, adde AoE for greater focus

#include "NW_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{

/*
  Spellcast Hook Code
  Added 2003-06-23 by GeorgZ
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook


    //Declare major varibles
    object oTarget = GetSpellTargetObject();
    int nMetaMagic = GetMetaMagicFeat();
    int nDuration = 2;
    if (GetHasFeat (FEAT_EPIC_SPELL_FOCUS_ENCHANTMENT, OBJECT_SELF))
    {
       nDuration = 3;
    }
    effect eBlind =  EffectBlindness();
    effect eDeaf = EffectDeaf();
    effect eVis = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);

    effect eLink = EffectLinkEffects(eBlind, eDeaf);
    eLink = EffectLinkEffects(eLink, eDur);

    if (GetHasFeat (FEAT_GREATER_SPELL_FOCUS_ENCHANTMENT, OBJECT_SELF))
    {
       object oCritter = GetFirstObjectInShape (SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetSpellTargetLocation());
       while (GetIsObjectValid (oCritter))
       {
          if(!GetIsReactionTypeFriendly(oTarget))
          {
              //Fire cast spell at event
              SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_BLINDNESS_AND_DEAFNESS));
              //Do SR check
              if (!MyResistSpell(OBJECT_SELF, oTarget))
              {
                  // Make Fortitude save to negate
                  if (!/*Fort Save*/ MySavingThrow(SAVING_THROW_FORT, oTarget, GetSpellSaveDC()))
                  {
                      //Metamagic check for duration
                      if (nMetaMagic == METAMAGIC_EXTEND)
                      {
                          nDuration = nDuration * 2;
                      }
                      //Apply visual and effects
                      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
                      ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
                  }
              }
          }
          //get the next creature in range
          oCritter = GetNextObjectInShape (SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetSpellTargetLocation());
       }
    }

    else
    {
       if(!GetIsReactionTypeFriendly(oTarget))
       {
           //Fire cast spell at event
           SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_BLINDNESS_AND_DEAFNESS));
           //Do SR check
           if (!MyResistSpell(OBJECT_SELF, oTarget))
           {
               // Make Fortitude save to negate
               if (!/*Fort Save*/ MySavingThrow(SAVING_THROW_FORT, oTarget, GetSpellSaveDC()))
               {
                   //Metamagic check for duration
                   if (nMetaMagic == METAMAGIC_EXTEND)
                   {
                       nDuration = nDuration * 2;
                   }
                   //Apply visual and effects
                   ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
                   ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
               }
           }
       }
   }
}
