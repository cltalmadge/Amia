//::///////////////////////////////////////////////
//:: Tailoring - If Clothing is Allowed
//:: tlr_ifcloth.nss
//:: Copyright (c) 2006 Stacy L. Ropella
//:://////////////////////////////////////////////
/*
    Checks to make sure the PC is allowed to make
    clothing with this model
*/
//:://////////////////////////////////////////////
//:: Created By: Stacy L. Ropella
//:: Created On: May 15, 2006
//:://////////////////////////////////////////////

//void main (){}
int StartingConditional()
{
    /*if(GetLocalInt(OBJECT_SELF, "Cloth_Buy") == 0
       && GetLocalInt(OBJECT_SELF, "Cloth_Copy") == 0)
       return FALSE;*/

    return TRUE;
}
