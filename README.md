# Azure IoT Stream Analytics

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Azure Developer CLI](https://learn.microsoft.com/ja-jp/azure/developer/azure-developer-cli/install-azd?tabs=localinstall%2Cwindows%2Cbrew)

## Get Started

```shell
# create resources
azd up --environment iot-stream-analytics

# delete resources
azd down --force
```

## References

- [Azure Developer CLIの azure.yaml スキーマ](https://learn.microsoft.com/ja-jp/azure/developer/azure-developer-cli/azd-schema)
- [Azure Developer CLI リファレンス (プレビュー)](https://learn.microsoft.com/ja-jp/azure/developer/azure-developer-cli/reference)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)
