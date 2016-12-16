# Blue Green Deployment

Part of continuous delivery is the ability to bring in changes to the live environment in an automated and controlled manner.  We want reduce the time taken to make the change, but keep risk manageable.  Allowing multiple similar versions of a serive to be live, while directing flow during a transition, allows for a change to me mad, testd out on a subset of the cunsumer apps, and then released to all.

Messaging routing provides the patform to achieve this thorough the use of topic subscriptions.  We can manage which service consumers use, either at the  

By collapsing the Gateway and app server onto the data movement platform, multiple llayers can be controlld via a single point.

Routing can be effected either at the whole system level or down to a component levvbel.  Want to trial a change with a small set of users, and facilitate migration of remaining service consumers

Number of systems involved in the path, and the need to keep these systems all up to date can cause 

Need to have infrastructure that can run continuously without outages (even during patching) and have minimal dependencies on other components to avoid outages while share d infratructure is patched / upgraded.


For a primer on blue green deployments, check out : http://martinfowler.com/bliki/BlueGreenDeployment.html
