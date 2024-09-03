using Sandbox;
using System.Linq;
using System;

namespace thought;

public static class Thoughts
{
	//null codes for different types of variables\\
	public const string BNULL = ("nobody"); // basically if there is nothing found when trying to find a bot than "nothing" will be returned to avoid an error
	public const string ENULL = ("neutrall"); //emotionall NULL state
	//^^!everything above this line is dedicated to NULL classifications for types of variables!^^\\

	//idealy a seperate component should update these variables every tick :)\\
	public static int NearbyFriends = 0; public static int NearbyEnimies = 0;
	public static int CurrentHealth = 0;

	//bot related variables eg:"closest friend" or "closest enemy"\\
	public static string LastPersonToHurtMe = BNULL; public static int DistantToDamage = 0;
	public static string ClosestFriend = BNULL; public static string ClosestEnemy = BNULL;

	//feelings and emotions\\
	public static string CurrentEmotion = ENULL; public static int CurrentEmotionLevel = 0;

}
public sealed class Think : Component
{

	[Property] public NavMeshAgent Agent { get; set; }



	protected override void OnUpdate()
	{
		Log.Info( $"friends {Thoughts.NearbyFriends}" );
		Log.Info( $"enemys {Thoughts.NearbyEnimies}" );


	}
}






