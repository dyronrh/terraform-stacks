# create_app_registrations.sh

tenantId=$(az account show --query tenantId -o tsv)

declare -A subscriptionIds=( ["dev"]="283b7b64-24dd-481d-98bf-a117f9168256" )
declare -A clientIds

for env in dev stg prd; do
  appName="terraform-stacks-app-$env"
  subscriptionId=${subscriptionIds[$env]}
  echo "Creating app registration for $env..."
  appId=$(az ad app create --display-name $appName --query appId -o tsv)
  echo "Creating service principal for $env..."
  az ad sp create --id $appId > /dev/null
  echo "Assigning role for $env..."
  az role assignment create --assignee $appId --role Owner --scope /subscriptions/$subscriptionId > /dev/null
  for operation in plan apply; do
    echo "Creating federated credential for $env $operation..."
    az ad app federated-credential create --id $appId --parameters "{
      \"name\": \"terraformstackscredential-$env-$operation\",
      \"issuer\": \"https://app.terraform.io\",
      \"subject\": \"organization:tothemoon:project:Youtube Courses:stack:terraform-stacks:deployment:$env:operation:$operation\",
      \"audiences\": [\"api://AzureADTokenExchange\"]
    }" > /dev/null
  done
  clientIds[$env]=$appId
done

for env in dev stg prd; do
  echo "$env client_id: ${clientIds[$env]}"
done
