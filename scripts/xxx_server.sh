#!/bin/bash
start() {
echo "Starting vnc server with $resolution on Display $display"
#your execute command here mine is below
#vncserver :$display -geometry $resolution
}

stop() {
echo "Killing vncserver on display $display"
#vncserver -kill :$display
}

#########################
# The command line help #
#########################
display_help() {
    echo "Usage: $0 [option...] {start|stop|restart}" >&2
    echo
    echo "   -r, --resolution           run with the given resolution WxH"
    echo "   -d, --display              Set on which display to host on "
    echo
    # echo some stuff here for the -a or --add-options 
    exit 1
}

################################
# Check if parameters options  #
# are given on the commandline #
################################
while :
do
    case "$1" in
      -r | --resolution)
          if [ $# -ne 0 ]; then
            resolution="$2"   # You may want to check validity of $2
          fi
          shift 2
          ;;
      -h | --help)
          display_help  # Call your function
          exit 0
          ;;
      -d | --display)
          display="$2"
           shift 2
           ;;

      -a | --add-options)
          # do something here call function
          # and write it in your help function display_help()
           shift 2
           ;;

      --) # End of all options
          shift
          break
          ;;
      -*)
          echo "Error: Unknown option: $1" >&2
          ## or call function display_help
          exit 1 
          ;;
      *)  # No more options
          break
          ;;
    esac
done

###################### 
# Check if parameter #
# is set too execute #
######################
case "$1" in
  start)
    start # calling function start()
    ;;
  stop)
    stop # calling function stop()
    ;;
  restart)
    stop  # calling function stop()
    start # calling function start()
    ;;
  *)
#    echo "Usage: $0 {start|stop|restart}" >&2
     display_help

exit 1
;;