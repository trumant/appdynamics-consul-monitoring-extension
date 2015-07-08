# AppDynamics Consul Monitoring Extension

## Use Case
This monitoring extensions gathers details on the health of a Consul cluster.

This extension works only with the standalone machine agent.

Metrics include:

* Number of servers that are in **alive** state
* Number of servers that are in **left** state
* Number of servers that are in **failed** state

## Installation
1. Download the ConsulMonitor.zip found in the Github releases tab
2. Unzip the archive into `<MACHINE_AGENT_HOME>/monitors/ConsulMonitor`.
3. In the newly created directory "ConsulMonitor", edit the monitor.xml to specify the path to your Consul binary.
4. Restart the machineagent
5. In the AppDynamics Metric Browser, look for: **Application Infrastructure Performance | <Tier\> | Custom Metrics | Consul Cluster**.


## Contributing

Fork and submit a pull request