CodeSystem: IdentifierType_V20203
Id: v2-0203
Title: "识别码类型"
Description: """识别码类型""" 
* ^status = #active
* ^experimental = false
* ^date = "2024-10-17"
* ^caseSensitive = true
* ^content = #complete
* ^count = 2
* ^property[0].code = #updateDate
* ^property[=].description = "更新日期"
* ^property[=].type = #string
* ^property[+].code = #event
* ^property[=].description = "更新方式"
* ^property[=].type = #string
* #GOI "Government Organization Identifier" "Government Organization Identifier number"
* #GOI ^designation.language = #zh-cn
* #GOI ^designation.value = "政府机构识别码"
* #GOI ^property[0].code = #updateDate
* #GOI ^property[=].valueString = "2024-10-17"
* #GOI ^property[+].code = #event
* #GOI ^property[=].valueString = "新增"
* #UBN "Unified Business number" "Unified Business number"
* #UBN ^designation.language = #zh-cn
* #UBN ^designation.value = "公司或企业识别码"
* #UBN ^property[0].code = #updateDate
* #UBN ^property[=].valueString = "2024-10-17"
* #UBN ^property[+].code = #event
* #UBN ^property[=].valueString = "新增"


ValueSet: IdentifierType
Id: identifier-type
Title: "IdentifierType - 识别码类型值集"
Description: "IdentifierType - 识别码类型值集"
* ^status = #active
* ^date = "2024-10-17"
* include codes from system $v2-0203
* IdentifierType_V20203#GOI "Government Organization Identifier"
* IdentifierType_V20203#UBN "Unified Business number"