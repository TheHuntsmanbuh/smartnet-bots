using Sandbox;
using System.Linq;
using System;

namespace thought;
//everything in "public static class Thoughts" is pureley for storing data and settings for every other bot component to reference \\
public static class Thoughts : component
{
	//DEV CODE\\
	[property] public static bool DevMode { get; set; }
	[property] public static bool FollowPlayer { get; set; }
	//DEV CODE\\

	//null codes for different types of variables\\
	public const string BNULL = ("nobody"); // basically if there is nothing found when trying to find a bot than "nothing" will be returned to avoid an error
	public const string ENULL = ("neutrall"); //emotionall NULL state
	//^^!everything above this line is dedicated to NULL classifications for types of variables!^^\\

	//constantly updated variables go here eg: nearby bots or current health\\
	public static int NearbyFriends = 0; public static int NearbyEnimies = 0;
	public static int CurrentHealth = 0;

	//bot related variables eg:"closest friend" or "closest enemy"\\
	public static string LastPersonToHurtMe = BNULL; public static int DistantToDamage = 0;
	public static string ClosestFriend = BNULL; public static string ClosestEnemy = BNULL;

	//feelings and emotions\\
	public static string CurrentEmotion = ENULL; public static int CurrentEmotionLevel = 0;
	public static bool Panicked = false; // if set to true the ai will go into a custom panicked script
	[Property] public static bool AgressiveMode { get; set; }

	//movement states and variables eg: "IsAnimating" or "InFreefall"\\
	public static bool IsAnimating = false; // if the bot is in a custom animation this will set to TRUE 
	public static bool InFreefall = false; // if the bot is falling this will be set to true so no other actions are performed midair
	
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






