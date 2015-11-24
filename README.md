# AppDynamics Consul Monitoring Extension

## Use Case
This monitoring extension gathers details on the health of a Consul cluster. Metrics are gathered by parsing the output of `consul members` and `consul info`.

This extension works only with the standalone machine agent and is expected to be used to monitor a Consul server agent.

## Metric Names

### consul members

 * servers-failed
 * clients-failed
 * servers-left
 * clients-left
 * servers-alive
 * clients-alive

### consul info

 * agent_check_monitors
 * agent_check_ttls
 * agent_checks
 * agent_services
 * consul_bootstrap
 * consul_known_datacenters
 * consul_leader
 * consul_server
 * raft_applied_index
 * raft_commit_index
 * raft_fsm_pending
 * raft_last_contact
 * raft_last_log_index
 * raft_last_log_term
 * raft_last_snapshot_index
 * raft_last_snapshot_term
 * raft_num_peers
 * raft_term
 * serf_lan_encrypted
 * serf_lan_event_queue
 * serf_lan_event_time
 * serf_lan_failed
 * serf_lan_intent_queue
 * serf_lan_left
 * serf_lan_member_time
 * serf_lan_members
 * serf_lan_query_queue
 * serf_lan_query_time
 * serf_wan_encrypted
 * serf_wan_event_queue
 * serf_wan_event_time
 * serf_wan_failed
 * serf_wan_intent_queue
 * serf_wan_left
 * serf_wan_member_time
 * serf_wan_members
 * serf_wan_query_queue
 * serf_wan_query_time

## Installation
1. Download the ConsulMonitor.zip found in the Github releases tab
2. Unzip the archive into `<MACHINE_AGENT_HOME>/monitors/ConsulMonitor`.
3. In the newly created directory "ConsulMonitor", edit the monitor.xml to specify the path to your Consul binary.
4. Restart the machineagent
5. In the AppDynamics Metric Browser, look for: **Application Infrastructure Performance | <Tier\> | Custom Metrics | Consul Cluster**.


## Contributing

Fork and submit a pull request