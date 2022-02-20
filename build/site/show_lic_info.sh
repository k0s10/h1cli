#!/bin/ash
lics_folder=/h1cli/uploads/

cd /opt/1C/1CE/components/1c-enterprise-ring-*
lics=$(./ring license list --path $lics_folder | grep -oE "^[0-9]+\-[0-9]+")

for lic in $lics ; do
        echo "Текущий пинкод $(echo "$lic" | grep -oE "^[0-9]+")"
        printf "\n" 
        echo "$(./ring license info --name "$lic" --path "$lics_folder" --send-statistics false)"
        printf "\n"
done

rm -rf $lics_folder
