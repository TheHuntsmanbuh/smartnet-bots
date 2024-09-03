using Sandbox;
using System.Threading;
public sealed class Human : Component
{
	
	[Property] public NavMeshAgent Agent { get; set; }
	


	public void OnUpdate()
	{
		Vector3? randompoint = Scene.NavMesh.GetRandomPoint( GameObject.Transform.Position, 500f );
		
		if ( randompoint.HasValue )
		{
			Agent.MoveTo(randompoint.Value);
		}
		

	}
}
