HEADING()
{
  echo -e "\e[36m$*\e[0m"
}


STAT()
{
  if [ $? -eq 0 ];then
    echo SUCCESS
  else
    echo FAILURE
    exit 2
  fi
}