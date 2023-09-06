:<<BLOCK
Get frida-tools version shell script v1.0

AUTHOR: westinyang

USAGE:
    curl -sL https://gitee.com/westinyang/codelabs/raw/master/get-frida-tools-version.sh | bash -s <frida-version> # default: main
    curl -sL https://raw.githubusercontent.com/westinyang/codelabs/master/get-frida-tools-version.sh | bash -s <frida-version> # default: main
    curl -sL https://gist.githubusercontent.com/westinyang/9815e4b94361a2ad9169650f89f31efc/raw/0b0c805b2b5e0455fc4afe9620669fbe7b7cdbb6/get-frida-tools-version.sh | bash -s <frida-version> # default: main
BLOCK

# echo https://raw.githubusercontent.com/frida/frida-tools/$(curl -s https://github.com/frida/frida/tree/${1:-main} | grep -o '"/frida/frida-tools/tree/.*"' | sed 's/"//g' | xargs basename)/setup.py | xargs curl -s | grep "version=" | awk -F '"' '{print $2}'

frida_version=${1:-main}
commit_id=$(curl -sL https://github.com/frida/frida/tree/${frida_version} | grep -o '"/frida/frida-tools/tree/.*"' | sed 's/"//g' | xargs basename)
version=$(curl -sL https://raw.githubusercontent.com/frida/frida-tools/${commit_id}/setup.py | grep "version=" | awk -F '"' '{print $2}')
echo $version