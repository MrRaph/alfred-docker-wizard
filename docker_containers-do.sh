#!/usr/bin/env bash
PATH="$PATH:/usr/local/bin"
TYPE="$1"
COMMAND="$2"
MACHINE="$3"
ID="$4"

date
echo "Type: $TYPE"
echo "Command: $COMMAND"
echo "Machine: $MACHINE"
echo "ID: $ID"

if [ "$TYPE" = "machine" -a "$COMMAND" = "ip" ];
then
  docker-machine ip "$MACHINE" | pbcopy
  exit $?
fi

if [ "$TYPE" = "machine" ]
then
  docker-machine "$COMMAND" "$MACHINE"
  exit $?
fi

if [ "$TYPE" = "container" ]
then
  docker "$COMMAND" "$ID"
  exit $?
fi
