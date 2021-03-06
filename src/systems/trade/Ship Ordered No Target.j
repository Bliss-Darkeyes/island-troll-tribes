
//===========================================================================
//TESH.scrollpos=1
//TESH.alwaysfold=0
function Trig_Ship_Ordered_No_Target_Conditions takes nothing returns boolean
    return GetOrderedUnit() == udg_ship
endfunction

function shipMove takes nothing returns nothing
local real X = LoadReal(udg_GameHash, StringHash("ship"), StringHash("X"))
local real Y = LoadReal(udg_GameHash, StringHash("ship"), StringHash("Y"))
local timer t = GetExpiredTimer()
if not SHIP_STOPPED then
    call IssuePointOrder( udg_ship, "move", X, Y)
endif
call ReleaseTimer(t)
set t = null
endfunction

function Trig_Ship_Ordered_No_Target_Actions takes nothing returns nothing
local timer t = NewTimer()
    call TimerStart(t,0,false, function shipMove) 
    set t = null
endfunction

//===========================================================================
function InitTrig_Ship_Ordered_No_Target takes nothing returns nothing
    set gg_trg_Ship_Ordered_No_Target = CreateTrigger(  )
    call TriggerRegisterPlayerUnitEvent(gg_trg_Ship_Ordered_No_Target, Player(15), EVENT_PLAYER_UNIT_ISSUED_ORDER, null)
    call TriggerAddCondition( gg_trg_Ship_Ordered_No_Target, Condition( function Trig_Ship_Ordered_No_Target_Conditions ) )
    call TriggerAddAction( gg_trg_Ship_Ordered_No_Target, function Trig_Ship_Ordered_No_Target_Actions )
endfunction

//===========================================================================
