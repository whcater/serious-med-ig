Extension: ExtPersonAge
Id: ext-person-age
Title: "PersonAge"
Description: "年龄"
Context: Patient 
* ^date = "2024-10-17"
* . ^short = "年龄"
* . ^definition = "年龄"
* id ^short = "唯一可识别ID，以供资料项目间相互参照。"
* id ^definition = "resource中资料项目的唯一ID（用于内部参照）。这可以是任何不含空格的字串。"
* url ^short = "扩展字段名称"
* url ^definition = "扩展字段之定义连结—一个逻辑名称或URL"
* url ^comment = "此定义可直接指向可计算的或人类可读的扩充资料项目的定义，也可以是其他规范中声明的逻辑URI。此定义**必须（SHALL）** 定义扩充的结构定义的URI。"
* value[x] only Age
* value[x] ^short = "扩展字段的内容值"
* value[x] ^definition = "扩展字段的内容值—必须是一组受限制的data type中的一个（清单请见[Extensibility](http://hl7.org/fhir/2021Mar/extensibility.html)）"