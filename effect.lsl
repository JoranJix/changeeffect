list compare;
list compare1;
key owner;
list checkav()
{
    list AttachedNames;
    list AttachedUUIDs = llGetAttachedList(owner);
    integer i;
    while (i < llGetListLength(AttachedUUIDs) )
    {
                    list temp = llGetObjectDetails(llList2Key(AttachedUUIDs,i),[OBJECT_NAME]);
                    //llOwnerSay(llList2String(temp,0) + " " +llList2String(temp,1));
                    AttachedNames += [llList2String(temp,0)];
                    ++i;
    }
    return AttachedNames;
}

default
{
    attach(key user){
        if(user != NULL_KEY){
            owner = llGetOwner();
            compare = checkav();
            llSetTimerEvent(1);
        }
    }
    state_entry()
    {
        owner = llGetOwner();
        compare = checkav();
        llSetTimerEvent(1);
    }
    timer()
    {
        compare1 = checkav();
        if(compare1!=compare){
            //START EFFECT HERE ....
            llSleep(10);
            //END EFFECT HERE ....
            compare = checkav();
        }
    }
}
