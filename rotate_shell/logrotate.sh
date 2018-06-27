<< COMMENTOUT
author: hiyo
descriptions: moving files to lotate directory
             and adding date to filename
examples: lotate.sh ../logs/ ../logs/old
COMMENTOUT

from_directoryname=$1;
to_directoryname=$2;
command_date=`date "+%Y/%m/%d-%H:%M:%S"`;
add_date=`date '+%Y%m%d'`


if [ ! "$#" -eq 2 ] ; then
    echo "$command_date: [ERROR]引数に過不足があります。";
    exit 1;
fi

files=`ls -F $from_directoryname|grep -v /`;

# Check direcotyr and file command
if [ "$?" -eq 1 ] ; then
    echo "$command_date: [ERROR]ローテート対象のディレクトリもしくはファイルが見つかりません。";
    exit 1;
fi

#move command
while read line
do
    #echo "FROM $from_directoryname$line";
    #echo "TO $to_directoryname$line.$date";
    mv $from_directoryname$line $to_directoryname$line.$add_date;
    if [ "$?" -eq 1 ] ; then
        echo "$command_date: [WARN]MVコマンドでエラーが発生しました。$from_directory/$line";
    fi
done <<LIST
$files
LIST