dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
pid=$dir/screen_pidfile
log=$dir/screen_log.out
program=$dir/screen.sh

function start {
        nohup $program 1>> $log 2>&1 &
        echo $!>$pid
        echo Started $program.
}
function stop {
        pkill -P $(cat $pid)
        echo Stopped $program.
}
function status {
        kill -0 $(cat $pid) 1>> $log 2>&1
        if [ $? == 0 ]; then
                echo $program running.
        else
                echo $program not running.
        fi
}
function restart {
        stop
        start
}

case $1 in
        start)
                start;;
        stop)
                stop;;
        status)
                status;;
        restart)
                restart;;
        *)
                echo "Usage: $0 start | stop | status | restart";;
esac
