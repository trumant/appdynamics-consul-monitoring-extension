#!/bin/sh

CONSUL_BIN="${1}/consul"

$CONSUL_BIN members | awk '
BEGIN {
  split("failed left alive", statii)
  for (i in statii) count[statii[i]]=0
}
$4=="server" { count[$3]++ }
END {
  for (i in statii) print "name=Custom Metrics|Consul Cluster|" statii[i] ",value=" count[statii[i]] ",aggregator=OBSERVATION,time-rollup=CURRENT,cluster-rollup=INDIVIDUAL"
}'