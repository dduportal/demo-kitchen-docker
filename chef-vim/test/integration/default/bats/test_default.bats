#!/usr/bin/env bats

@test "vim help works" {
  vim --help
}

@test "vim -v works" { 
  run vim --version
  [ "$status" -eq 0 ]
  [ "${lines[0]:0:17}" = "VIM - Vi IMproved" ]
}