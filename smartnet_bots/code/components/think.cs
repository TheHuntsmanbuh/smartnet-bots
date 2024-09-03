using Sandbox;
using System.Linq;

namespace thought
{
	//null codes for different types of variables\\
	public string BNULL = ("nobody"); // basically if there is nothing found when trying to find a bot than "nothing" will be returned to avoid an error
	public string ENULL = ("neutrall") //emotionall NULL state
	//^^!everything above this line is dedicated to NULL classifications for types of variables!^^\\

	//idealy a seperate component should update these variables every tick :)\\
	public int NearbyFriends = 0; public int NearbyEnimies = 0;
	public int CurrentHealth = 0; 

	//bot related variables eg:"closest friend" or "closest enemy"\\
    public string LastPersonToHurtMe = BNULL; public int DistantToDamage = 0;
	public string ClosestFriend = BNULL; public string ClosestEnemy = BNULL;

	//feelings and emotions\\
	public string CurrentEmotion = ENULL; public int CurrentEmotionLevel = 0;

}



