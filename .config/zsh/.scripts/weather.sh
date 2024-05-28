#!/bin/zsh

# Function to get weather based on the argument passed using curl wttr.in
get_weather() {
  local option=$1
  local default_option="%c%C%t%h%p%u%s"
  local location=${2:-$LOCATION}  # Use $LOCATION if no location is provided
  local url="https://wttr.in"

  case $option in
    f)
        curl "${url}/${location}"
        ;;
    s)
        curl "${url}/${location}?format=2"
        ;;
    h)
        curl "${url}/${location}?format=%H:%M:%S+%c"
        ;;
    w)
        curl "${url}/${location}?format=%w"
        ;;
    *)
        curl "${url}/${location}?format=${default_option}"
        ;;
  esac
}

# Call the function with the provided arguments
get_weather "$@"
