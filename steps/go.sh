SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT_DIR=$SCRIPT_DIR/..

CURRENT_STEP=$1
re='^[0-9]+$'
if ! [[ $CURRENT_STEP =~ $re ]]
then
    # Not a number
    echo "Getting step number from section name $CURRENT_STEP"
    CURRENT_STEP=`echo $1 | sed "s/.*(//" | sed "s/\/.*//"`
fi

if [[ $CURRENT_STEP = "0" ]]
then
    echo "Step is 0, reset"
    $SCRIPT_DIR/reset.sh
else
    CURRENT_FILE=$SCRIPT_DIR/current.txt

    echo "$CURRENT_STEP" > $CURRENT_FILE
    CURRENT_DIR="$SCRIPT_DIR/step-$CURRENT_STEP"
    echo "step $CURRENT_STEP, DIR $CURRENT_DIR"

    if [[ -d "$CURRENT_DIR" ]]
    then
        echo "step exists"
        cp "$CURRENT_DIR"/* "$ROOT_DIR"
    else
        echo "no more steps"
    fi
fi