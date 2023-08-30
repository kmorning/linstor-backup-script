echo
echo "# Resource Definitions"
linstor -m --output-version v1 resource-definition list | jq -r '.[][] | "\(.name) \(.layer_data[0].data.port) \(.resource_group_name)"' |
  while read name port resource_group; do
    echo "linstor resource-definition create -p $port --resource-group $resource_group $name"
    linstor -m resource-definition list-properties $name | jq -jr '.[][] | .key, " ", .value, "\n"' |
      while read key value; do
        echo "  linstor resource-definition set-property $name $key $value"
      done
  done