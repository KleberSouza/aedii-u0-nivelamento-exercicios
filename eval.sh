#!/bin/bash
echo "Running tests..."

# EXECUTA TESTES EM TODOS OS EXERCICIOS
result=0
for name in *; do 
  if [ -d "$name" ] && [ ! -L "$name" ]; then
    bash test.sh $name > /dev/null

    if [ $? -eq 0 ]; 
    then 
        echo "Test $name executed with success" 
    else 
        echo "Test $name executed with error" 
        result=1
    fi
  fi 
done

exit $result
