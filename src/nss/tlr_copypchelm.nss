//::///////////////////////////////////////////////
//:: Tailoring - Copy the PCs Helmet
//:: tlr_copypchelm.nss
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Stacy L. Ropella
//:: from Mandragon's mil_tailor
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();

    object oSourceHelm = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
    object oHelm = GetItemInSlot(INVENTORY_SLOT_HEAD, OBJECT_SELF);

    int iSourceHelmValue;
    object oCurrentHelm, oNewHelm;

////// Copy Colors
    // Cloth 1
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1);
    oCurrentHelm = oHelm;
    oNewHelm = CopyItemAndModify(oCurrentHelm,ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1, iSourceHelmValue, TRUE);
    DestroyObject(oCurrentHelm);

    // Cloth 2
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2);
    oCurrentHelm = oNewHelm;
    oNewHelm = CopyItemAndModify(oCurrentHelm,ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2, iSourceHelmValue, TRUE);
    DestroyObject(oCurrentHelm);

    // Leather 1
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1);
    oCurrentHelm = oNewHelm;
    oNewHelm = CopyItemAndModify(oCurrentHelm,ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1, iSourceHelmValue, TRUE);
    DestroyObject(oCurrentHelm);

    // Leather 2
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2);
    oCurrentHelm = oNewHelm;
    oNewHelm = CopyItemAndModify(oCurrentHelm,ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2, iSourceHelmValue, TRUE);
    DestroyObject(oCurrentHelm);

    // Metal 1
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1);
    oCurrentHelm = oNewHelm;
    oNewHelm = CopyItemAndModify(oCurrentHelm,ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1, iSourceHelmValue, TRUE);
    DestroyObject(oCurrentHelm);

    // Metal 2
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2);
    oCurrentHelm = oNewHelm;
    oNewHelm = CopyItemAndModify(oCurrentHelm,ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2, iSourceHelmValue, TRUE);
    DestroyObject(oCurrentHelm);


////// Copy Design
    // Helmet
    if(GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC)))
    {
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_MODEL, 0);
    oCurrentHelm = oNewHelm;
    oNewHelm = CopyItemAndModify(oCurrentHelm, ITEM_APPR_TYPE_ARMOR_MODEL, 0, iSourceHelmValue, TRUE);
    DestroyObject(oCurrentHelm);
    }

    // Equip
    if(GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC)))
    {
       DelayCommand(0.5f, AssignCommand(OBJECT_SELF, ActionEquipItem(oNewHelm, INVENTORY_SLOT_HEAD)));
       SetDroppableFlag(oNewHelm,FALSE);
    }
}
