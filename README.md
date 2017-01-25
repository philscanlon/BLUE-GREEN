# Let solace help you manage your service version cutovers in production

In a comprehensive IT landscape typical in a bank, there are multiple layers involved in a solution such as firewalls, an API Gateway, and Web Server.

Highly available apps that require near 100% uptime without planned outages mean that we need to have infrastructure that can run continuously without outages (even during patching) and have minimal dependencies on other components to avoid outages while shared infrastructure is patched / upgraded.

# Blue Green Deployment

Part of continuous delivery is the ability to bring in changes to the live environment in an automated and controlled manner.  We want reduce the time taken to make the change, but keep risk manageable.  Allowing multiple similar versions of a service to be live, while directing flow during a transition, allows for a change to be made, tested out on a subset of the consumer apps, and then released to all.  If there are issues with the tests, we want to be able to quickly back out the change to revert to the original service.

# How can we solve this

Message routing allows us to achieve this through the use of subscriptions.  We can manage which service consumers use, and use topic hierarchies to cleanly manage this across a wide array of services.

# What are the advantages of this approach

Solace allows for continuous operation of a business service during maintainence (hardware patching, upgrades, service routing) meaning the end SLA provided to the customer can be outage free.

By collapsing the Gateway and app server onto the data movement platform, we gain a number of benefits:

multiple layers can be controlled via a single point, reducing the amount of co-ordination for a change.

Routing can be effected either at the whole system level or down to a component level.  Want to trial a change with a small set of users, and facilitate migration of remaining service consumers

Number of systems involved in the path, and the need to keep these systems all up to date can cause




For a primer on blue green deployments, check out : http://martinfowler.com/bliki/BlueGreenDeployment.html
