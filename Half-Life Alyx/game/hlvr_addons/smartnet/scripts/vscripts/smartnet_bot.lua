------------------------------------------------------------------------------
--main citizen ai (walking, tasks, interaction ect...)
------------------------------------------------------------------------------
function Activate()
	thisEntity:SetMaxHealth(400)
	thisEntity:SetHealth(100)
end
function Spawn() 
	-- Registers a function to get called each time the entity updates, or "thinks"

	thisEntity:SetContextThink(nil, citizenroam, 0)
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


local rds = 256
local flNavGoalTolerance = 32
local bShouldRun = true
local bShouldberunning = true
-- the closest this npc can get to the goal
local flMinGoalDist = 64
-- the farthest this npc can get to the goal
local flMaxGoalDist = 250
-------------------------------------
-- put all the main npc stuff in here 
-------------------------------------
function citizenroam()
	local goaltable = Entities:FindAllByNameWithin("snnav", thisEntity:GetForwardVector(), 512 )
	print (goaltable)
	local whereto = goaltable[math.random(#goaltable)]
	setrandomlooktarget(rds)

	if whereto ~= nil then
		if thisEntity:NpcNavGoalActive() then
			return 4
		else
			movetogoal(whereto)
			
		end
		
		
			
		

		


		

       setrandomlooktarget(rds)
	end
	return math.random(2,30)
end
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