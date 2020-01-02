#!/bin/bash

bash ./operator-mono-lig/build.sh

./nerd-fonts/font-patcher --complete "$OUTPUT"/OperatorMonoLig-Book.otf
