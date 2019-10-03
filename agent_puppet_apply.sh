# Vagrant reported that puppet command was not found when used in the agent_bootstrap.sh
# command works fine when used from this file or used after instances are provisioned
puppet resource service puppet ensure=running enable=true
