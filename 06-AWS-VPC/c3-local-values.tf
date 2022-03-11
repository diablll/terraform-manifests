#Define Local Values InTerraform
locals {
    owners = var.business_division
    environment = var.environment
    name = "${var.business_division}-${var.environment}"
    #name = "${loacl.owners}-${local.environment}"
    common_tags = (
        owners = local.owners
        environment = Local.environment
    )
}