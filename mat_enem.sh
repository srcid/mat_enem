#!/bin/bash -xv

if ! [ -d ./matematica ]; then
  mkdir ./matematica
fi 

for file in ./cadernos/*.pdf; do
  mat_line=$(pdfgrep -n 'Questões de 136 a 180' $file | cut -d ':' -f 1)
  echo $file
  echo $mat_line

  pdftk $file cat ${mat_line}-31 output ./matematica/$(basename $file)
done

