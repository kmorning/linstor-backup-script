echo
echo "# Resource Groups"
fields=$(linstor -m resource-group list | jq -r '.[][] | "\(.name) \(.select_filter.place_count) \(.select_filter.storage_pool) \(try .select_filter.layer_stack | join(","))"')

while read -r name place_count storage_pool layer_stack; do
  echo "linstor resource-group create $name --storage-pool $storage_pool --place-count $place_count --layer-list $layer_stack"
  linstor -m resource-group list-properties $name | jq -jr '.[][] | .key, " ", .value, "\n"' |
    while read key value; do
      echo "  linstor resource-group set-property $name $key $value"
    done
done <<< "$fields"
