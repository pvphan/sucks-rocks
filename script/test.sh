#!/bin/bash

set -e

need_rails=1

if [ $# -gt 0 ]; then # we have args
    filename=$1
    # Remove trailing line numbers from filename, e.g. spec/my_spec.rb:33
    grep_filename=`echo $1 | sed 's/:.*$//g'`

    (set +e; grep -r 'spec_helper' $grep_filename) > /dev/null
    if [ $? -eq 1 ]; then # no match; we have a stand-alone spec
        need_rails=''
    fi
else # we have no args
    filename='spec'
fi

command='rspec'

if [ $need_rails ]; then
    command="ruby -S bundle exec $command --drb"
fi

RAILS_ENV=test $command $filename
