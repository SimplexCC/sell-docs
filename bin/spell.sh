#!/bin/bash

SPELL_BASE_DIR=bin/spell
SRC_BASE_DIR=source/includes

files_to_check=$(comm -23 <(cd ${SRC_BASE_DIR} ; find . -name \*.md | sort) <(cat ${SPELL_BASE_DIR}/spell.ignore.files | sort))

for f in ${files_to_check}
do
	echo "${f}"

	f_norm=$(echo "${f}" | cut -c3- | sed 's|/|__|g')
	ign_file=${SPELL_BASE_DIR}/spell.ignore.in-file.${f_norm}
	if [[ ! -e ${ign_file} ]]
	then
		touch ${ign_file}
	fi

	cat $SRC_BASE_DIR/${f} |\
		## html entities
		perl -pe 's/&emsp;//g' |\
		## api keys
		perl -pe 's/8d20e7bd89064cd4a9c379d66c53efc8//g' |\
		## crypto addresses
		perl -pe 's/1EmXYy57z71H8J5jrxXsdjuJXZnPZgHnjh//g' |\
		perl -pe 's/1GzW2M6L54DGMUUv2DTrdPTt8PX6ck5SYp//g' |\
		## quote_id's
		perl -pe 's/4c52ecda-e40e-4f94-89da-adc4e2e78b45//g' |\
		perl -pe 's/bb4fbdef-9abc-41c1-94d9-a670413c4d02//g' |\
		## txn_id's
		perl -pe 's/af492cb2-5b07-4318-8ece-be34f479e23b//g' |\
		## uaid's
		perl -pe 's/VHJhY2tpbmdDb29raWU//g' |\
		## account_id's
		perl -pe 's/39cb996a-6cc8-43b9-ad37-1102a958ff38//g' |\
		## vim mode line
		grep -v '\bmodeline\b.*vim:' |\
		aspell --lang=en list |\
		## global ignore word list
		grep -v -F -f ${SPELL_BASE_DIR}/spell.ignore.global |\
		## per-file ignore word list
		grep -v -F -f ${ign_file} |\
		## print
		sort | uniq -c | sort -nr

	echo
done
