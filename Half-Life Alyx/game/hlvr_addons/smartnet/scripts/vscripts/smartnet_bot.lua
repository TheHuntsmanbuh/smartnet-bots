------------------------------------------------------------------------------
--main citizen ai (walking, tasks, interaction ect...)
------------------------------------------------------------------------------
function Activate()
	
	
end
local interactchance = 10000


function Spawn() 
	thisEntity:SetMaxHealth(100)
	thisEntity:SetHealth(100)

	thisEntity:SetContextThink(nil, citizenroam, 0)
	

	-- Registers a function to get called each time the entity updates, or "thinks"
end
--=============================
-- Activate is called by the engine after Spawn() and, if Spawn() occurred 
-- during a map's initial load, after all other entities have been spawned too.  
-- Any setup code that requires interacting with other entities should go here
--=============================
function Activate()
	
	-- Register a function to receive callbacks from the AnimGraph of this entity
	-- when Status Tags are emitted by the graph.  This must be called in Activate
	-- because the AnimGraph has not been loaded yet when Spawn is called
	thisEntity:RegisterAnimTagListener( AnimTagListener )
end
local count = 0
local rds = 256
local flNavGoalTolerance = 32
local bShouldRun = false
-- the closest this npc can get to the goal
local flMinGoalDist = 64
-- the farthest this npc can get to the goal
local flMaxGoalDist = 250

function interactthink()
	local goaltable = Entities:FindAllByNameWithin("snnavinteract", thisEntity:GetForwardVector(), 1000 )
	local whereto = goaltable[math.random(#goaltable)]
	if whereto ~= nil then
		movetogoal(whereto)
		local targetgroup = Entities:FindByNameNearest("interactable", thisEntity:GetForwardVector(), 256 )
		thisEntity:SetGraphLookTarget(targetgroup:GetAbsOrigin())
    	targetgroup:SetParent(self)
	else
		thisEntity:SetContextThink(nil, citizenroam, 0)
	end

end

function panic()
	startrunning()
	local goaltable = Entities:FindAllByNameWithin("snnav", thisEntity:GetForwardVector(), 512 )
	local whereto = goaltable[math.random(#goaltable)]

	if whereto ~= nil then
		if thisEntity:NpcNavGoalActive() then
			return 1
		else
			movetogoal(whereto)
			
		end
       setrandomlooktarget(rds)
	end
	healthcheck()
	
	thisEntity:SetHealth(thisEntity:GetHealth() + 1)
	return 1
end



function citizenroam()
	stoprunning()
	local goaltable = Entities:FindAllByNameWithin("snnav", thisEntity:GetForwardVector(), math.random(128, 1024) )
	print (goaltable)
	local whereto = goaltable[math.random(#goaltable)]
	if whereto ~= nil then
		if thisEntity:NpcNavGoalActive() then
			return math.random(2,4)
		else
			movetogoal(whereto)
			
		end
       setrandomlooktarget(rds)
	end
	personalitycheck()
	return math.random(5,18)
end
-------------------------------------
-- EVERYTHING UNDER THIS LINE IS FUNCTIONS, NOT THINK FUNCTIONS JUST ONES TO BE CALLED BY THE THINK FUNCTIONS
-------------------------------------
---------------------------------------------------------------------------------------------------
-- this is the code that defines the goal to the controlled entity and than forces it to move to it
---------------------------------------------------------------------------------------------------
function movetogoal( whereto ) 

	-- Find the vector from this entity to the player
	local vVecToPlayerNorm = ( whereto:GetAbsOrigin() - thisEntity:GetAbsOrigin() ):Normalized()

	-- Then find the point along that vector that is flMinPlayerDist from the player
	local vGoalPos = whereto:GetAbsOrigin()
	


	-- Create a path to that goal.  This will replace any existing path
	-- The path gets sent to the AnimGraph, and its up to the graph to make the character
	-- walk along the path
	thisEntity:NpcForceGoPosition( vGoalPos, bShouldRun, flNavGoalTolerance )


	flLastPathTime = Time()
end

function playanim( animation )
	thisEntity:SetSequence(idle_subtle)
	return math.random(400,500)
end

function setrandomlooktarget( rds )

	local trgttb = Entities:FindAllInSphere(thisEntity:GetForwardVector(), 512 )
	local trgt = trgttb[math.random(#trgttb)] 
	
	thisEntity:SetGraphLookTarget(trgt:GetAbsOrigin())
end

function startrunning()
	test = thisEntity:GetGraphParameter('running')
	
	thisEntity:SetGraphParameterBool('running', true)
end
function stoprunning()
	test = thisEntity:GetGraphParameter('running')
	
	thisEntity:SetGraphParameterBool('running', false)
end

function healthcheck()
	local maxhealth = thisEntity:GetMaxHealth()
	local health = thisEntity:GetHealth()

	if health >= maxhealth then
		thisEntity:SetContextThink(nil, citizenroam, 0)
	else
		thisEntity:SetContextThink(nil, panic, 0)
	end
end

function personalitycheck()
	local dice = math.random(1,450)
	if dice >= interactchance then
		thisEntity:SetContextThink(nil, interactthink, 0)
	else 

	end
end

function grabobject()

	local targetgroup = Entities:FindByNameNearest("interactable", thisEntity:GetForwardVector(), 256 )
    
    if targetgroup == nil then
    	thisEntity:SetContextThink(nil, citizenroam, 0)
    else
    	print("grabbed")
    	thisEntity:SetGraphLookTarget(targetgroup:GetAbsOrigin())
    	targetgroup:SetParent(self)
    	
    	thisEntity:SetContextThink(nil, citizenroam, 0)
    end
end
function wait( time )
    print(count)
	if count < 1 then 
		count = count + 0.5
		return time / 2
	end
	

	count = 0

end