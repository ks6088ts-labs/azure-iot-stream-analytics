[![infra](https://github.com/ks6088ts-labs/azure-iot-stream-analytics/workflows/infra/badge.svg)](https://github.com/ks6088ts-labs/azure-iot-stream-analytics/actions/workflows/infra.yml)

# Azure IoT Stream Analytics

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Azure Developer CLI](https://learn.microsoft.com/ja-jp/azure/developer/azure-developer-cli/install-azd?tabs=localinstall%2Cwindows%2Cbrew)
- [GitHub CLI](https://cli.github.com/manual/installation)

## Get Started

```shell
# create resources
azd up --environment iot-stream-analytics

# delete resources
azd down --force
```

## CI/CD

- [GitHub Actions を使用して Azure に接続する / サービス プリンシパル シークレットで Azure ログイン アクションを使用する](https://learn.microsoft.com/ja-jp/azure/developer/github/connect-from-azure?tabs=azure-portal%2Clinux#use-the-azure-login-action-with-a-service-principal-secret)

```shell
SUBSCRIPTION_ID="$(az account list --query "[?isDefault].id" -o tsv)"

az ad sp create-for-rbac \
    --name "iot-stream-analytics" \
    --role contributor \
    --scopes /subscriptions/f7b447fb-636e-49c2-ae1c-81120dc5e304/resourceGroups/rg-iot-stream-analytics \
    --sdk-auth > .azure/credentials.json

gh secret set AZURE_CREDENTIALS < .azure/credentials.json
```

## References

- [Azure Developer CLIの azure.yaml スキーマ](https://learn.microsoft.com/ja-jp/azure/developer/azure-developer-cli/azd-schema)
- [Azure Developer CLI リファレンス (プレビュー)](https://learn.microsoft.com/ja-jp/azure/developer/azure-developer-cli/reference)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)
- [Azure CLI で Azure サービス プリンシパルを作成する / パスワードベースの認証](https://learn.microsoft.com/ja-jp/cli/azure/create-an-azure-service-principal-azure-cli#password-based-authentication)
- [gh secret set](https://cli.github.com/manual/gh_secret_set)
