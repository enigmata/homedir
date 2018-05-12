#!/bin/bash

#############################################
# Step 0:  Build setup
#############################################

GO_GIT_REPO=https://go.googlesource.com/go
GO_GIT_BRANCH=master
GO_BASE_DIR=${HOME}/src/googlesource.com
GO_SRC_DIR=${GO_BASE_DIR}/go
GO_BLD_DIR=${GO_SRC_DIR}/src
GO_INSTALL_BASE_DIR=${HOME}/cbin/compilers/go

if [[ $# > 0 ]]
then
    GO_GIT_BRANCH=$1
fi

#############################################
# Step 1:  Get source code
#############################################

rm -rf $GO_SRC_DIR
mkdir -p $GO_BASE_DIR
cd $GO_BASE_DIR 
git clone $GO_GIT_REPO

echo Checking out the $GO_GIT_BRANCH branch ...

cd $GO_SRC_DIR
git checkout $GO_GIT_BRANCH

if [[ $? -ne 0 ]]
then
    echo ERROR: ${1} is not a valid go branch
    exit -1
fi

#############################################
# Step 2:  Build go
#############################################

GO_VER=${GO_GIT_BRANCH/go}

echo building go ${GO_VER}

if [[ "$GO_VER" != "master" ]]
then
    GOROOT=${HOME}/cbin/compilers/go/vers/${GO_VER}
    GOROOT_FINAL=${GOROOT}
    GOBIN=${GOROOT}/bin
fi

GOOS=linux
GOARCH=amd64
unset GOPATH

cd $GO_BLD_DIR

./all.bash

if [[ $? -ne 0 ]]
then
    echo ERROR: Build failed! Exiting.
    exit -1
fi

if [[ "$GO_VER" == "master" ]]
then
    echo Build completed successfully \(master is not installed\)
    exit 0
fi

#############################################
# Step 3:  Install go
#############################################

GO_INSTALL_DIR=${GO_INSTALL_BASE_DIR}/vers/${GO_VER}

if [[ ! -d $GO_INSTALL_DIR ]]
then
    mkdir -p $GO_INSTALL_DIR
else
    rm -rf ${GO_INSTALL_DIR}/*
fi

echo installing go into $GO_INSTALL_DIR

cd ${GO_SRC_DIR}
cp -R api bin doc pkg src test VERSION ${GO_INSTALL_DIR}

#############################################
# Step 4:  Install go tools
#############################################

GOPATH=${HOME}
go get golang.org/x/tools/cmd/...

