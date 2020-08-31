#!/bin/bash
time for i in `seq 1 1000`; do
    dd bs=4k if=/dev/sda count=1 skip=$(( $RANDOM * 128 )) >/dev/null 2>&1;
done
