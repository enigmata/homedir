#!/bin/bash

#############################################
# Step 0:  Build setup
#############################################

GCC_GIT_REPO=git://gcc.gnu.org/git/gcc.git
GCC_GIT_BRANCH=master
GCC_BASE_DIR=${HOME}/src/gcc.gnu.org
GCC_SRC_DIR=${GCC_BASE_DIR}/gcc
GCC_BLD_DIR=${GCC_BASE_DIR}/gcc-bld
GCC_INSTALL_BASE_DIR=${HOME}/cbin/compilers/gcc

if [[ $# > 0 ]]
then
    GCC_GIT_BRANCH=$1
fi

if [[ ! -d $GCC_SRC_DIR ]]
then
    mkdir -p $GCC_BASE_DIR
    cd $GCC_BASE_DIR 
    git clone $GCC_GIT_REPO
fi

echo Checking out the $GCC_GIT_BRANCH branch ...

cd $GCC_SRC_DIR
git checkout $GCC_GIT_BRANCH

if [[ $? -ne 0 ]]
then
    echo ERROR: ${1} is not a valid gcc branch
    exit -1
fi

git pull

GCC_VER=`cat gcc/BASE-VER`

#############################################
# Step 1:  Build configuration
#############################################

echo configuring gcc $GCC_VER

if [[ ! -d $GCC_BLD_DIR ]]
then
    mkdir -p $GCC_BLD_DIR
else
    rm -rf $GCC_BLD_DIR/*
fi

cd $GCC_BLD_DIR 

GCC_INSTALL_DIR=${GCC_INSTALL_BASE_DIR}/vers/${GCC_VER}

${GCC_SRC_DIR}/configure --prefix=${GCC_INSTALL_DIR} --disable-multilib --enable-threads --enable-languages=c,c++

if [[ $? -ne 0 ]]
then
    echo ERROR: Configure failed! Exiting.
    exit -1
fi

#############################################
# Step 2:  Build gcc
#############################################

echo building gcc $GCC_VER

make -j 4

if [[ $? -ne 0 ]]
then
    echo ERROR: Build failed! Exiting.
    exit -1
fi

#############################################
# Step 3:  Install gcc
#############################################

if [[ ! -d $GCC_INSTALL_DIR ]]
then
    mkdir -p $GCC_INSTALL_DIR
fi

echo installing gcc into $GCC_INSTALL_DIR

make install

