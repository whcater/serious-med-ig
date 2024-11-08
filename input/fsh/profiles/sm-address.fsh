Profile: SmAddress
Parent: Address
Id: sm-address
Title: "SmAddress"
Description: """地址（Address) 若有详细地址信息需求，可依情况填选；若无需区分详细地址信息，可使用原生栏位`text`、`line`、`district`呈现。"""
* . ^short = "使用邮政规范表达的地址（相对于GPS或其他位置定义格式）"
* . ^definition = "使用邮政规范表达的地址（相对于GPS或其他位置定义格式）。这种data type可用于传达投递邮件的位址，以及用于访问可能对邮件投递无效的位置，这世界定义了各种邮政地址格式。"
* . ^comment = "注意：地址的目的是描述用于管理目的之邮政地址，而不是描述绝对的地理座标。邮政地址经常被用作实体位置的代表（亦可见[Location](http://hl7.org/fhir/R4/location.html#)resource）。"
* id ^short = "唯一可识别ID，以供资料项目间相互参照。"
* id ^definition = "resource中资料项目的唯一ID（用于内部参照）。这可以是任何不含空格的字串。"
* use MS
* use from http://hl7.org/fhir/ValueSet/address-use|4.0.1 (required)
* use ^short = "home ｜ work ｜ temp ｜ old ｜ billing － 此地址的用途"
* use ^definition = "此地址的用途"
* use ^comment = "应用程序可假定一个地址是目前使用中，除非它明确说它是暂时的或旧的。"
* use ^requirements = "允许从清单中挑选适当的地址用途"
* use ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* use ^binding.extension.valueString = "AddressUse"
* use ^binding.description = "应填入AddressUse值集中的其中一个代码"
* type MS
* type from http://hl7.org/fhir/ValueSet/address-type|4.0.1 (required)
* type ^short = "postal ｜ physical ｜ both"
* type ^definition = "区分实际地址（你可以拜访的地址）和邮寄地址（如邮政信箱和转递地址），大多数地址都是这两种。"
* type ^comment = "地址的定义指出「地址旨在描述邮政地址，而不是实体位置」。但许多应用程序追踪一个地址是否具有双重目的，既是一个可以拜访的地点，亦是一个有效的投递目的地，邮政地址经常被用作实体位置的代表（亦可见[Location](http://hl7.org/fhir/R4/location.html#)resource）。"
* type ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* type ^binding.extension.valueString = "AddressType"
* type ^binding.description = "应填入AddressType值集中的其中一个代码"
* text ^short = "地址的文字表述"
* text ^definition = "具体说明整个地址，因为它应该显示在邮政标签上，这可替代或与特定的部分一起提供。"
* text ^comment = "可以同时提供文字表述和各部分的地址资料项目内容。更新地址的应用程序 **必须（SHALL）** 确保当文字表述和各部分的地址资料项目内容都存在时，文字表述不包括各部分的地址资料项目内容中没有的内容，意即两者内容会一致。"
* text ^requirements = "一个可呈现的、未编码的形式。"
* line ..1 MS
* line ^short = "路/街"
* line ^definition = "此部分包含门牌号码、公寓号码、街道名称、街道方向、邮政信箱号码、送货提示以及类似的地址信息。"
* line ^alias[0] = "路"
* line ^alias[+] = "街"
* city MS
* city ^short = "乡/镇/市/区"
* city ^definition = "市、乡、镇、村或其他社区或配送中心的名称。"
* city ^alias[0] = "乡"
* city ^alias[+] = "镇"
* city ^alias[+] = "市"
* city ^alias[+] = "区"
* district MS
* district ^short = "县/市"
* district ^definition = "行政区域（县）的名称"
* district ^comment = "区（district）有时被称为县（country），但在一些区域（regions），「县（country）」被用来代替市（直辖市），所以县名应该用市名来代替传达。"
* district ^alias[0] = "市"
* state ^short = "国家的子单位（缩写也可以）"
* state ^definition = "一个国家的子单位，在联邦组织的国家中拥有有限的主权。如果代码被普遍使用，可使用代码（例如：美国2个字母的州代码）。"
* postalCode MS
* postalCode ^short = "邮递区号"
* postalCode ^definition = "指定一个由邮政服务定义的区域之邮递区号"
* postalCode.id ^short = "xml：id（或JSON格式）。"
* postalCode.id ^definition = "resource中资料项目的唯一ID（用于内部参照）。这可以是任何不含空格的字串。"
* postalCode.value ^short = "邮递区号"
* postalCode.value ^definition = "实际值"
* country MS
* country ^short = "国家（例如：ISO 3166的2个或3个字母代码）。"
* country ^definition = "国家—通常被理解为或普遍被接受的一个国家。"
* country ^comment = "可用ISO 3166的3个字母代码来代替人类可读的国家名"
* period ^short = "此地址曾经／正在使用的时间区间"
* period ^definition = "此地址曾经／正在使用的时间区间"
* period ^requirements = "允许将地址依时间排放"