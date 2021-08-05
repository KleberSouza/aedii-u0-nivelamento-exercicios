#!/bin/bash

# RECEBE E VAI DIRETORIO PARA EXECUTAR O TESTE
DIR=$1
pushd $DIR > /dev/null
# COMPILA O CODIGO
make > /dev/null
echo "Running tests... `basename $DIR`"

# CRIA O DIRETORIO PARA OS RESULTADOS
mkdir -p ./results

# EXECUTA TODOS OS TESTES PARA CADA ENTRADA
for input in inputs/* ; do
  ./main < $input > ./results/`basename $input` 2>&1
done

# VALIDA AS SAIDAS DO PROGRAMA
for input in inputs/* ; do
  input=`basename $input`
  LEFT="outputs/$input"
  RIGHT="results/$input"
  diff -wB "$LEFT" "$RIGHT" > results/$input.diff 2>&1
  
  echo "$value"
done

# COMPARA OS RESULTADOS DOS TESTES
for input in inputs/* ; do
  
  input=`basename $input`
  result=`cat results/$input.diff`
  
  if [ "$result" == "" ] ; then
    echo "Test: $input - Pass"
  else
    echo "Test: $input - Fail"
    exit 1
  fi
done

echo
echo "All tests passed."
popd > /dev/null

exit 0

