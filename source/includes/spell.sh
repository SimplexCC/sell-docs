#!/bin/bash

files_to_check=$(comm -23 <(ls *.md | sort) <(cat spell/spell.ignore.files | sort))

for f in ${files_to_check}
do
	echo "===== ${f}"

	ign_file=spell/spell.ignore.in-file.${f}
	if [[ ! -e ${ign_file} ]]
	then
		touch ${ign_file}
	fi

	cat ${f} |\
		## html entities
		perl -pe 's/&emsp;//g' |\
		## crypto addresses
		perl -pe 's/1EmXYy57z71H8J5jrxXsdjuJXZnPZgHnjh//g' |\
		perl -pe 's/1GzW2M6L54DGMUUv2DTrdPTt8PX6ck5SYp//g' |\
		## a quote_id
		perl -pe 's/4c52ecda-e40e-4f94-89da-adc4e2e78b45//g' |\
		## a txn_id
		perl -pe 's/af492cb2-5b07-4318-8ece-be34f479e23b//g' |\
		## a uaid value
		perl -pe 's/VHJhY2tpbmdDb29raWU//g' |\
		## account_id
		perl -pe 's/39cb996a-6cc8-43b9-ad37-1102a958ff38//g' |\
		## vim mode line
		grep -v '\bmodeline\b.*vim:' |\
		aspell --lang=en list |\
		## global ignore word list
		grep -v -F -f spell/spell.ignore.global |\
		## per-file ignore word list
		grep -v -F -f ${ign_file} |\
		## print
		sort | uniq -c | sort -nr

	echo
done


#perl -pe 's/[[:xdigit:]]{8}-[[:xdigit:]]{4}-[[:xdigit:]]{4}-[[:xdigit:]]{4}-[[:xdigit:]]{12}//g' |\
