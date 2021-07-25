SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT_DIR=$SCRIPT_DIR/..

CURRENT_FILE=$SCRIPT_DIR/current.txt
if [[ -f $CURRENT_FILE ]]
then
    rm $CURRENT_FILE
fi

cp "$SCRIPT_DIR/reset"/* "$ROOT_DIR"