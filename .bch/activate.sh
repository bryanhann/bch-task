#!/usr/bin/env bash

r=$(dirname $(dirname ${BASH_SOURCE[0]}))

export BCH_TASK__root=${r}
export BCH_TASK__init=${r}/.bch/activate.sh
export BCH_TASK__lbin=${r}/.bch/lbin
export BCH_TASK__bin=${r}/.bch/bin
export BCH_TASK__lib=${r}/.bch/lib

for s in $(ls ${r}/.bch/lbin/bch*); do
     d=${HOME}/.local/bin/$(basename $s)
     [ ! -f ${d} ] && echo "[cookiecutter.dotted] linking ${s}"
     [ ! -f ${d} ] && ln -s ${s} ${d}
done

d=${r}/.bch/bin
[[ ":$PATH:" == *":${d}:"* ]] || echo "[cookiecutter.dotted] appending ${d}"
[[ ":$PATH:" == *":${d}:"* ]] || export PATH=${PATH}:${d}

source ${r}/.bch/init/init.sh

unset r
unset s
unset d
