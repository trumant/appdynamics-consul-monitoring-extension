#!/bin/sh

CONSUL_BIN="${1}/consul"

$CONSUL_BIN members | awk '
BEGIN {
  split("failed left alive", statii)
  for (i in statii) countserver[statii[i]]=0
  for (i in statii) countclient[statii[i]]=0
}
$4=="server" { countserver[$3]++ }
$4=="client" { countclient[$3]++ }
END {
  for (i in statii) print "name=Custom Metrics|Consul Cluster|servers-" statii[i] ",value=" countserver[statii[i]] ",aggregator=OBSERVATION,time-rollup=CURRENT,cluster-rollup=INDIVIDUAL\nname=Custom Metrics|Consul Cluster|clients-" statii[i] ",value=" countclient[statii[i]] ",aggregator=OBSERVATION,time-rollup=CURRENT,cluster-rollup=INDIVIDUAL"
}'

$CONSUL_BIN info | awk -F ' *= *' '{ if ($1 ~ /:$/) section=$1; else if ($1 !~ /^$|state|WARNING/ && section !~ /build|runtime/) print "name=Custom Metrics|Consul Cluster|" section "_" $1 ",value=" $2 ",aggregator=OBSERVATION,time-rollup=CURRENT,cluster-rollup=INDIVIDUAL" }' | sed 's/:_\s/_/g' | sed 's/true/1/g' | sed 's/false/0/g'