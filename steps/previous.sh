SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT_DIR=$SCRIPT_DIR/..

CURRENT_FILE=$SCRIPT_DIR/current.txt

if [[ -f $CURRENT_FILE ]]
then
    CURRENT_STEP=`cat $CURRENT_FILE`
    CURRENT_STEP=$((CURRENT_STEP-1))
    CURRENT_DIR="$SCRIPT_DIR/step-$CURRENT_STEP"
    echo $CURRENT_STEP > $CURRENT_FILE
    echo "step $CURRENT_STEP, DIR $CURRENT_DIR"

    if [[ -d "$CURRENT_DIR" ]]
    then
        echo "step exists"
        cp "$CURRENT_DIR"/* "$ROOT_DIR"
    else
        echo "no more steps"
    fi
fi