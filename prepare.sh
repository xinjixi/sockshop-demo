#! /bin/bash
set -x

apiregistryctl service uploadspec v0.0-rev1/catalogue.json -s catalogue --version 0.0 --revision 1 --debug
apiregistryctl service uploadspec v0.0-rev2/catalogue.json -s catalogue --version 0.0 --revision 2 --debug
