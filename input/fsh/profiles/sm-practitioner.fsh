Profile: SmPractitioner
Parent: Practitioner
Id: sm-Practitioner
Title: "SmPractitioner"
Description: "健康医护服务提供者基本信息"
* . ^short = "对于所提供的健康医护或相关服务负有正式责任的人员"
* id ^short = "不重复的ID用以识别储存在特定FHIR Server中的Practitioner纪录，通常又称为逻辑性ID。"
* id ^definition = "resource的逻辑ID，在resource的URL中使用。一旦指定，这个值永远不会改变。"
* id ^comment = "一个resource使用新增操作（create operation）提交给服务器时，此resource没有id，它的id在resource被创建后由服务器分配/指定。"
* language from CommonLanguages (preferred)
* language ^short = "用以表述Patient Resource内容的语言。"
* language ^example.valueString = "zh-CN"
* identifier MS
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[=].path = "type.coding.code"
* identifier ^slicing.discriminator[+].type = #value
* identifier ^slicing.discriminator[=].path = "type.coding.system"
* identifier ^slicing.rules = #open
* identifier ^short = "此医护服务提供人员的识别码"
* identifier.use from http://hl7.org/fhir/ValueSet/identifier-use|4.0.1 (required)
// * identifier.use ^short = "usual ｜ official ｜ temp ｜ secondary ｜ old （如果知道）"
* identifier.use ^definition = "这个唯一识别码（identifier）的用途, 应用程序可以假定一个识别码是永久的，除非它明确说它是暂时的。"
* identifier.use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* identifier.use ^binding.extension[=].valueString = "IdentifierUse"
* identifier.use ^binding.description = "识别码的型别，用于决定特定目的所适用的识别码；应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* identifier.type only CodeableConcept
* identifier.type from $identifier-type (extensible)
* identifier.type ^short = "医护服务提供人员的识别码（identifier）的型别说明"
* identifier.type ^definition = "识别码的代码型别，用于决定特定目适用的识别码。"
* identifier.type ^comment = "这个资料项目只涉及识别码的一般类别。它 **必须没有（SHALL NOT）** 被用于与Identifier.system 1..1对应的代码。一些识别码可能由于常见的用法而属于多个类别。在系统是已知的情况下，型别是不必要的，因为型别总是系统定义的一部分。然而，系统经常需要处理系统不为人知的识别码。型别和系统之间不是1:1的关系，因为许多不同的系统有相同的型别。"
* identifier.type ^requirements = "允许使用者在不知道识别码系统的情况下利用识别码"
* identifier.type ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* identifier.type ^binding.extension[=].valueString = "IdentifierType"
* identifier.type ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* identifier.type ^binding.extension[=].valueBoolean = true
* identifier.type ^binding.description = "应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* identifier.system ^short = "医护服务提供人员识别码（identifier）的命名空间（namespace）"
* identifier.system ^definition = "建立值的命名空间－即一个描述一组值的唯一URL"
* identifier.system ^comment = "Identifier.system总是区分大小写"
* identifier.system ^requirements = "有许多识别码的集合。为了进行两个识别码的对应，我们需要知道我们处理的是哪一组。系统指明了一个特定的唯一识别码集。"
* identifier.value ^short = "唯一值。\n例如：医护服务提供人员之员工编号为KP00017"
* identifier.value ^definition = "识别码中通常与使用者有关的部分，在编码系统作用域内是唯一的。"
* identifier.value ^comment = "如果此值是一个完整的URI，那么此系统 **必须（SHALL）** 是urn:ietf:rfc:3986。此值的主要目的是为了可运算的对应。因此，为了比较的目的，它可能会被正规化（例如：去除不重要的空白、破折号等）。一个为人显示的格式化的值可以使用[Rendered Value](http://hl7.org/fhir/R4/extension-rendered-value.html)扩充来传达。除非对Identifier.system的了解使处理者确信不区分大小写的处理是安全的，否则Identifier.value应被视为区分大小写。"
* identifier.period ^short = "此身份识别码（identifier）的使用效期"
* identifier.period ^definition = "识别码有效／曾经有效使用的时段或期间"
* identifier.assigner ^short = "签发identifier的机构（可以只是文字表述）"
* identifier.assigner ^definition = "签发／管理识别码的机构"
* identifier.assigner ^comment = "Identifier.assigner可以省略.reference资料项目，只包含一个.display资料项目，反映指定机构的名称或其他文字表述信息。"
* identifier contains
    idCardNumber 0..1 MS and
    passportNumber 0..1 MS and
    residentNumber 0..1 MS
* identifier[idCardNumber] ^short = "适用身分证字号"
* identifier[idCardNumber] ^definition = "适用于身分证字号"
* identifier[idCardNumber] ^requirements = "通常此人员总是被指定一个特定的数值型的唯一识别码（identifier）"
* identifier[idCardNumber].use = #official
* identifier[idCardNumber].use MS
* identifier[idCardNumber].use from http://hl7.org/fhir/ValueSet/identifier-use|4.0.1 (required)
* identifier[idCardNumber].use ^short = "usual ｜ official ｜ temp ｜ secondary ｜ old （如果知道）"
* identifier[idCardNumber].use ^definition = "这个唯一识别码（identifier）的用途"
* identifier[idCardNumber].use ^comment = "应用程序可以假定一个识别码是永久的，除非它明确说它是暂时的。"
* identifier[idCardNumber].use ^requirements = "允许从一组识别码中为特定的使用场景选择适当的识别码"
* identifier[idCardNumber].use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* identifier[idCardNumber].use ^binding.extension[=].valueString = "IdentifierUse"
* identifier[idCardNumber].use ^binding.description = "如果知道，请说明此识别码的目的；应填入所绑定值集中的其中一个代码。"
* identifier[idCardNumber].type 1.. MS
* identifier[idCardNumber].type only CodeableConcept
* identifier[idCardNumber].type from IdentifierType (extensible)
* identifier[idCardNumber].type ^short = "身份识别码（identifier）的型别说明"
* identifier[idCardNumber].type ^definition = "识别码的代码型别，用于决定特定目适用的识别码。"
* identifier[idCardNumber].type ^comment = "这个资料项目只涉及识别码的一般类别。它 **必须没有（SHALL NOT）** 被用于与Identifier.system 1..1对应的代码。一些识别码可能由于常见的用法而属于多个类别。在系统是已知的情况下，型别是不必要的，因为型别总是系统定义的一部分。然而，系统经常需要处理系统不为人知的识别码。型别和系统之间不是1:1的关系，因为许多不同的系统有相同的型别。"
* identifier[idCardNumber].type ^requirements = "允许使用者在不知道识别码系统的情况下利用识别码"
* identifier[idCardNumber].type ^binding.description = "识别码的型别，用于决定特定目的所适用的识别码；应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* identifier[idCardNumber].type.coding 1..
* identifier[idCardNumber].type.coding ^short = "由专门术语系统（terminology system）定义的代码"
* identifier[idCardNumber].type.coding ^definition = "由专门术语系统（terminology system）所定义之代码的参照"
* identifier[idCardNumber].type.coding ^comment = "代码可以在列举清单（enumerations）或代码清单（code lists）中非常随意地定义，直至有非常正式的定义，例如：SNOMED CT—更多信息见HL7 v3核心原则（Core Principles）。编码的排序是未定义的因而 **必须没有（SHALL NOT）** 被用来推断意义。一般来说，最多只有一个编码值（coding values）会被标记为UserSelected = true。"
* identifier[idCardNumber].type.coding ^requirements = "允许编码系统中的替代编码，以及翻译到其他编码系统。"
* identifier[idCardNumber].type.coding.system 1.. MS
* identifier[idCardNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[idCardNumber].type.coding.system ^short = "专门术语系统（terminology system）的识别"
* identifier[idCardNumber].type.coding.system ^definition = "定义代码中符号意义的编码系统识别"
* identifier[idCardNumber].type.coding.system ^comment = "URI可以是一个OID（urn:oid:...）或一个UUID（urn:uuid:...）；OID和UUID **必须（SHALL）** 参照HL7 OID注册中心；否则，URI应该来自HL7的FHIR定义的特殊URI列表，或者它应该参照一些明确建立的系统定义。"
* identifier[idCardNumber].type.coding.system ^requirements = "需要明确说明符号定义的来源"
* identifier[idCardNumber].type.coding.version ^short = "系统的版本—如果相关的话"
* identifier[idCardNumber].type.coding.version ^definition = "选择此代码时使用的编码系统版本；请注意，一个维护良好的编码系统不需要版本报告，因为代码的意义在不同系统版本中是一致的；然而，不能始终保证这点，当不能保证意义一致时， **必须（SHALL）** 将版本信息也一并作交换。"
* identifier[idCardNumber].type.coding.version ^comment = "如果专门术语没有明确定义应该使用什么字串来识别编码系统的版本，建议使用版本正式发布的日期（用FHIR日期格式表示）作为版本日期。"
* identifier[idCardNumber].type.coding.code 1.. MS
* identifier[idCardNumber].type.coding.code = #NNxxx
* identifier[idCardNumber].type.coding.code ^short = "系统定义的语法之符号"
* identifier[idCardNumber].type.coding.code ^definition = "系统定义的语法之符号；符号可能是一个预先定义的代码，也可能是编码系统定义的语法中的表达式（如后组合配对／后组合式）。"
* identifier[idCardNumber].type.coding.code ^requirements = "需要参照系统中的一个特定代码" 
* identifier[idCardNumber].type.coding.display MS
* identifier[idCardNumber].type.coding.display ^short = "由编码系统定义的描述"
* identifier[idCardNumber].type.coding.display ^definition = "遵循系统的规则以呈现代码含义的描述"
* identifier[idCardNumber].type.coding.display ^requirements = "需要能为不了解此系统的读者呈现可读的代码含义"
* identifier[idCardNumber].type.coding.userSelected ^short = "此编码是否由使用者直接选择？"
* identifier[idCardNumber].type.coding.userSelected ^definition = "表明此编码是由使用者直接选择，例如：从可用项目（代码或显示名称）的清单中选择。"
* identifier[idCardNumber].type.coding.userSelected ^comment = "在一系列备选方案中，直接选择的代码是新翻译最合适的起点；关于「直接选择」的确切意义，存在模糊不清之处，可能需要贸易伙伴的同意，以更完整澄清此资料项目的使用及其后果。"
* identifier[idCardNumber].type.coding.userSelected ^requirements = "已被确定为一个临床安全准则—此确切的系统／代码对(code pair)是被明确选择的，而不是由编码系统根据一些规则或是程序语言处理判断。"
* identifier[idCardNumber].type.text MS
* identifier[idCardNumber].type.text ^short = "概念的文字描述"
* identifier[idCardNumber].type.text ^definition = "输入资料的使用者所见／所选／所说的人类可读文字表述，和（或）其代表使用者的预期含义。"
* identifier[idCardNumber].type.text ^comment = "很多时候，此文字表述与其中一个代码的显示名称相同。"
* identifier[idCardNumber].type.text ^requirements = "专门术语中的代码并不总是能捕捉人类使用的细微差别的正确意义，或者根本就没有合适的代码；这些情况下，文字表述被用来捕捉来源的全部意义。"
* identifier[idCardNumber].system 1.. MS
* identifier[idCardNumber].system = "idCardNumber"
* identifier[idCardNumber].system ^short = "身份识别码（identifier）的命名空间（namespace）\n例如：身分证字号='idCardNumber'"
* identifier[idCardNumber].system ^definition = "建立值的命名空间－即一个描述一组值的唯一URL"
* identifier[idCardNumber].system ^comment = "Identifier.system总是区分大小写"
* identifier[idCardNumber].system ^requirements = "有许多识别码的集合。为了进行两个识别码的对应，我们需要知道我们处理的是哪一组。系统指明了一个特定的唯一识别码集。"
* identifier[idCardNumber].value 1.. MS
* identifier[idCardNumber].value ^short = "唯一值。\n例如：身分证字号为430421199304193041"
* identifier[idCardNumber].value ^definition = "识别码中通常与使用者有关的部分，在编码系统作用域内是唯一的。"
* identifier[idCardNumber].value ^comment = "如果此值是一个完整的URI，那么此系统 **必须（SHALL）** 是urn:ietf:rfc:3986。此值的主要目的是为了可运算的对应。因此，为了比较的目的，它可能会被正规化（例如：去除不重要的空白、破折号等）。一个为人显示的格式化的值可以使用[Rendered Value](http://hl7.org/fhir/R4/extension-rendered-value.html)扩充来传达。除非对Identifier.system的了解使处理者确信不区分大小写的处理是安全的，否则Identifier.value应被视为区分大小写。"
* identifier[idCardNumber].period ^short = "此身份识别码（identifier）的使用效期"
* identifier[idCardNumber].period ^definition = "识别码有效／曾经有效使用的时段或期间"
* identifier[idCardNumber].assigner only Reference(SmOrganization)
* identifier[idCardNumber].assigner ^short = "签发identifier的机构（可以只是文字表述）"
* identifier[idCardNumber].assigner ^definition = "签发／管理识别码的机构"
* identifier[idCardNumber].assigner ^comment = "Identifier.assigner可以省略.reference资料项目，只包含一个.display资料项目，反映指定机构的名称或其他文字表述信息。"
* identifier[passportNumber] ^short = "适用护照号码"
* identifier[passportNumber] ^definition = "适用于护照号码"
* identifier[passportNumber] ^requirements = "通常此人员总是被指定一个特定的数值型的唯一识别码（identifier）"
* identifier[passportNumber].use = #official
* identifier[passportNumber].use MS
* identifier[passportNumber].use from http://hl7.org/fhir/ValueSet/identifier-use|4.0.1 (required)
* identifier[passportNumber].use ^short = "usual ｜ official ｜ temp ｜ secondary ｜ old （如果知道）"
* identifier[passportNumber].use ^definition = "这个唯一识别码（identifier）的用途"
* identifier[passportNumber].use ^comment = "应用程序可以假定一个识别码是永久的，除非它明确说它是暂时的。"
* identifier[passportNumber].use ^requirements = "允许从一组识别码中为特定的使用场景选择适当的识别码"
* identifier[passportNumber].use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* identifier[passportNumber].use ^binding.extension[=].valueString = "IdentifierUse"
* identifier[passportNumber].use ^binding.description = "如果知道，请说明此识别码的目的；应填入所绑定值集中的其中一个代码。"
* identifier[passportNumber].type 1.. MS
* identifier[passportNumber].type only CodeableConcept
* identifier[passportNumber].type from IdentifierType (extensible)
* identifier[passportNumber].type ^short = "身份识别码（identifier）的型别说明"
* identifier[passportNumber].type ^definition = "识别码的代码型别，用于决定特定目适用的识别码。"
* identifier[passportNumber].type ^comment = "这个资料项目只涉及识别码的一般类别。它 **必须没有（SHALL NOT）** 被用于与Identifier.system 1..1对应的代码。一些识别码可能由于常见的用法而属于多个类别。在系统是已知的情况下，型别是不必要的，因为型别总是系统定义的一部分。然而，系统经常需要处理系统不为人知的识别码。型别和系统之间不是1:1的关系，因为许多不同的系统有相同的型别。"
* identifier[passportNumber].type ^requirements = "允许使用者在不知道识别码系统的情况下利用识别码"
* identifier[passportNumber].type ^binding.description = "识别码的型别，用于决定特定目的所适用的识别码；应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* identifier[passportNumber].type.coding 1.. MS
* identifier[passportNumber].type.coding ^short = "由专门术语系统（terminology system）定义的代码"
* identifier[passportNumber].type.coding ^definition = "由专门术语系统（terminology system）所定义之代码的参照"
* identifier[passportNumber].type.coding ^comment = "代码可以在列举清单（enumerations）或代码清单（code lists）中非常随意地定义，直至有非常正式的定义，例如：SNOMED CT—更多信息见HL7 v3核心原则（Core Principles）。编码的排序是未定义的因而 **必须没有（SHALL NOT）** 被用来推断意义。一般来说，最多只有一个编码值（coding values）会被标记为UserSelected = true。"
* identifier[passportNumber].type.coding ^requirements = "允许编码系统中的替代编码，以及翻译到其他编码系统。"
* identifier[passportNumber].type.coding.system 1.. MS
* identifier[passportNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[passportNumber].type.coding.system ^short = "专门术语系统（terminology system）的识别"
* identifier[passportNumber].type.coding.system ^definition = "定义代码中符号意义的编码系统识别"
* identifier[passportNumber].type.coding.system ^comment = "URI可以是一个OID（urn:oid:...）或一个UUID（urn:uuid:...）；OID和UUID **必须（SHALL）** 参照HL7 OID注册中心；否则，URI应该来自HL7的FHIR定义的特殊URI列表，或者它应该参照一些明确建立的系统定义。"
* identifier[passportNumber].type.coding.system ^requirements = "需要明确说明符号定义的来源"
* identifier[passportNumber].type.coding.version ^short = "系统的版本—如果相关的话"
* identifier[passportNumber].type.coding.version ^definition = "选择此代码时使用的编码系统版本；请注意，一个维护良好的编码系统不需要版本报告，因为代码的意义在不同系统版本中是一致的；然而，不能始终保证这点，当不能保证意义一致时， **必须（SHALL）** 将版本信息也一并作交换。"
* identifier[passportNumber].type.coding.version ^comment = "如果专门术语没有明确定义应该使用什么字串来识别编码系统的版本，建议使用版本正式发布的日期（用FHIR日期格式表示）作为版本日期。"
* identifier[passportNumber].type.coding.code 1.. MS
* identifier[passportNumber].type.coding.code = #PPN
* identifier[passportNumber].type.coding.code ^short = "系统定义的语法之符号"
* identifier[passportNumber].type.coding.code ^definition = "系统定义的语法之符号；符号可能是一个预先定义的代码，也可能是编码系统定义的语法中的表达式（如后组合配对／后组合式）。"
* identifier[passportNumber].type.coding.code ^requirements = "需要参照系统中的一个特定代码"
* identifier[passportNumber].type.coding.display MS
* identifier[passportNumber].type.coding.display ^short = "由编码系统定义的描述"
* identifier[passportNumber].type.coding.display ^definition = "遵循系统的规则以呈现代码含义的描述"
* identifier[passportNumber].type.coding.display ^requirements = "需要能为不了解此系统的读者呈现可读的代码含义"
* identifier[passportNumber].type.coding.userSelected ^short = "此编码是否由使用者直接选择？"
* identifier[passportNumber].type.coding.userSelected ^definition = "表明此编码是由使用者直接选择，例如：从可用项目（代码或显示名称）的清单中选择。"
* identifier[passportNumber].type.coding.userSelected ^comment = "在一系列备选方案中，直接选择的代码是新翻译最合适的起点；关于「直接选择」的确切意义，存在模糊不清之处，可能需要贸易伙伴的同意，以更完整澄清此资料项目的使用及其后果。"
* identifier[passportNumber].type.coding.userSelected ^requirements = "已被确定为一个临床安全准则—此确切的系统／代码对(code pair)是被明确选择的，而不是由编码系统根据一些规则或是程序语言处理判断。"
* identifier[passportNumber].type.text MS
* identifier[passportNumber].type.text ^short = "概念的文字描述"
* identifier[passportNumber].type.text ^definition = "输入资料的使用者所见／所选／所说的人类可读文字表述，和（或）其代表使用者的预期含义。"
* identifier[passportNumber].type.text ^comment = "很多时候，此文字表述与其中一个代码的显示名称相同。"
* identifier[passportNumber].type.text ^requirements = "专门术语中的代码并不总是能捕捉人类使用的细微差别的正确意义，或者根本就没有合适的代码；这些情况下，文字表述被用来捕捉来源的全部意义。"
* identifier[passportNumber].system 1.. MS
* identifier[passportNumber].system = "passportNumber"
* identifier[passportNumber].system ^short = "身份识别码（identifier）的命名空间（namespace）\n例如：护照号码='passportNumber'"
* identifier[passportNumber].system ^definition = "建立值的命名空间－即一个描述一组值的唯一URL"
* identifier[passportNumber].system ^comment = "Identifier.system总是区分大小写"
* identifier[passportNumber].system ^requirements = "有许多识别码的集合。为了进行两个识别码的对应，我们需要知道我们处理的是哪一组。系统指明了一个特定的唯一识别码集。"
* identifier[passportNumber].value 1.. MS
* identifier[passportNumber].value ^short = "唯一值。 例如：护照号码为888800371"
* identifier[passportNumber].value ^definition = "识别码中通常与使用者有关的部分，在编码系统作用域内是唯一的。"
* identifier[passportNumber].value ^comment = "如果此值是一个完整的URI，那么此系统 **必须（SHALL）** 是urn:ietf:rfc:3986。此值的主要目的是为了可运算的对应。因此，为了比较的目的，它可能会被正规化（例如：去除不重要的空白、破折号等）。一个为人显示的格式化的值可以使用[Rendered Value](http://hl7.org/fhir/R4/extension-rendered-value.html)扩充来传达。除非对Identifier.system的了解使处理者确信不区分大小写的处理是安全的，否则Identifier.value应被视为区分大小写。"
* identifier[passportNumber].period ^short = "此身份识别码（identifier）的使用效期"
* identifier[passportNumber].period ^definition = "识别码有效／曾经有效使用的时段或期间"
* identifier[passportNumber].assigner only Reference(SmOrganization)
* identifier[passportNumber].assigner ^short = "签发identifier的机构（可以只是文字表述）"
* identifier[passportNumber].assigner ^definition = "签发／管理识别码的机构"
* identifier[passportNumber].assigner ^comment = "Identifier.assigner可以省略.reference资料项目，只包含一个.display资料项目，反映指定机构的名称或其他文字表述信息。"
* identifier[residentNumber] ^short = "适用居留证号码"
* identifier[residentNumber] ^definition = "适用于居留证号码"
* identifier[residentNumber] ^requirements = "通常此人员总是被指定一个特定的数值型的唯一识别码（identifier）"
* identifier[residentNumber].use = #official
* identifier[residentNumber].use MS
* identifier[residentNumber].use from http://hl7.org/fhir/ValueSet/identifier-use|4.0.1 (required)
* identifier[residentNumber].use ^short = "usual ｜ official ｜ temp ｜ secondary ｜ old （如果知道）"
* identifier[residentNumber].use ^definition = "这个唯一识别码（identifier）的用途"
* identifier[residentNumber].use ^comment = "应用程序可以假定一个识别码是永久的，除非它明确说它是暂时的。"
* identifier[residentNumber].use ^requirements = "允许从一组识别码中为特定的使用场景选择适当的识别码"
* identifier[residentNumber].use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* identifier[residentNumber].use ^binding.extension[=].valueString = "IdentifierUse"
* identifier[residentNumber].use ^binding.description = "如果知道，请说明此识别码的目的；应填入所绑定值集中的其中一个代码。"
* identifier[residentNumber].type 1.. MS
* identifier[residentNumber].type only CodeableConcept
* identifier[residentNumber].type from IdentifierType (extensible)
* identifier[residentNumber].type ^short = "身份识别码（identifier）的型别说明"
* identifier[residentNumber].type ^definition = "识别码的代码型别，用于决定特定目适用的识别码。"
* identifier[residentNumber].type ^comment = "这个资料项目只涉及识别码的一般类别。它 **必须没有（SHALL NOT）** 被用于与Identifier.system 1..1对应的代码。一些识别码可能由于常见的用法而属于多个类别。在系统是已知的情况下，型别是不必要的，因为型别总是系统定义的一部分。然而，系统经常需要处理系统不为人知的识别码。型别和系统之间不是1:1的关系，因为许多不同的系统有相同的型别。"
* identifier[residentNumber].type ^requirements = "允许使用者在不知道识别码系统的情况下利用识别码"
* identifier[residentNumber].type ^binding.description = "识别码的型别，用于决定特定目的所适用的识别码；应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* identifier[residentNumber].type.coding 1..
* identifier[residentNumber].type.coding ^short = "由专门术语系统（terminology system）定义的代码"
* identifier[residentNumber].type.coding ^definition = "由专门术语系统（terminology system）所定义之代码的参照"
* identifier[residentNumber].type.coding ^comment = "代码可以在列举清单（enumerations）或代码清单（code lists）中非常随意地定义，直至有非常正式的定义，例如：SNOMED CT—更多信息见HL7 v3核心原则（Core Principles）。编码的排序是未定义的因而 **必须没有（SHALL NOT）** 被用来推断意义。一般来说，最多只有一个编码值（coding values）会被标记为UserSelected = true。"
* identifier[residentNumber].type.coding ^requirements = "允许编码系统中的替代编码，以及翻译到其他编码系统。"
* identifier[residentNumber].type.coding.system 1.. MS
* identifier[residentNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[residentNumber].type.coding.system ^short = "专门术语系统（terminology system）的识别"
* identifier[residentNumber].type.coding.system ^definition = "定义代码中符号意义的编码系统识别"
* identifier[residentNumber].type.coding.system ^comment = "URI可以是一个OID（urn:oid:...）或一个UUID（urn:uuid:...）；OID和UUID **必须（SHALL）** 参照HL7 OID注册中心；否则，URI应该来自HL7的FHIR定义的特殊URI列表，或者它应该参照一些明确建立的系统定义。"
* identifier[residentNumber].type.coding.system ^requirements = "需要明确说明符号定义的来源"
* identifier[residentNumber].type.coding.version ^short = "系统的版本—如果相关的话"
* identifier[residentNumber].type.coding.version ^definition = "选择此代码时使用的编码系统版本；请注意，一个维护良好的编码系统不需要版本报告，因为代码的意义在不同系统版本中是一致的；然而，不能始终保证这点，当不能保证意义一致时， **必须（SHALL）** 将版本信息也一并作交换。"
* identifier[residentNumber].type.coding.version ^comment = "如果专门术语没有明确定义应该使用什么字串来识别编码系统的版本，建议使用版本正式发布的日期（用FHIR日期格式表示）作为版本日期。"
* identifier[residentNumber].type.coding.code 1.. MS
* identifier[residentNumber].type.coding.code = #PRC
* identifier[residentNumber].type.coding.code ^short = "系统定义的语法之符号"
* identifier[residentNumber].type.coding.code ^definition = "系统定义的语法之符号；符号可能是一个预先定义的代码，也可能是编码系统定义的语法中的表达式（如后组合配对／后组合式）。"
* identifier[residentNumber].type.coding.code ^requirements = "需要参照系统中的一个特定代码"
* identifier[residentNumber].type.coding.display MS
* identifier[residentNumber].type.coding.display ^short = "由编码系统定义的描述"
* identifier[residentNumber].type.coding.display ^definition = "遵循系统的规则以呈现代码含义的描述"
* identifier[residentNumber].type.coding.display ^requirements = "需要能为不了解此系统的读者呈现可读的代码含义"
* identifier[residentNumber].type.coding.userSelected ^short = "此编码是否由使用者直接选择？"
* identifier[residentNumber].type.coding.userSelected ^definition = "表明此编码是由使用者直接选择，例如：从可用项目（代码或显示名称）的清单中选择。"
* identifier[residentNumber].type.coding.userSelected ^comment = "在一系列备选方案中，直接选择的代码是新翻译最合适的起点；关于「直接选择」的确切意义，存在模糊不清之处，可能需要贸易伙伴的同意，以更完整澄清此资料项目的使用及其后果。"
* identifier[residentNumber].type.coding.userSelected ^requirements = "已被确定为一个临床安全准则—此确切的系统／代码对(code pair)是被明确选择的，而不是由编码系统根据一些规则或是程序语言处理判断。"
* identifier[residentNumber].type.text MS
* identifier[residentNumber].type.text ^short = "概念的文字描述"
* identifier[residentNumber].type.text ^definition = "输入资料的使用者所见／所选／所说的人类可读文字表述，和（或）其代表使用者的预期含义。"
* identifier[residentNumber].type.text ^comment = "很多时候，此文字表述与其中一个代码的显示名称相同。"
* identifier[residentNumber].type.text ^requirements = "专门术语中的代码并不总是能捕捉人类使用的细微差别的正确意义，或者根本就没有合适的代码；这些情况下，文字表述被用来捕捉来源的全部意义。"
* identifier[residentNumber].system 1.. MS
* identifier[residentNumber].system = "residentNumber"
* identifier[residentNumber].system ^short = "身份识别码（identifier）的命名空间（namespace）\n例如：居留证号='residentNumber'。"
* identifier[residentNumber].system ^definition = "建立值的命名空间－即一个描述一组值的唯一URL"
* identifier[residentNumber].system ^comment = "Identifier.system总是区分大小写"
* identifier[residentNumber].system ^requirements = "有许多识别码的集合。为了进行两个识别码的对应，我们需要知道我们处理的是哪一组。系统指明了一个特定的唯一识别码集。"
* identifier[residentNumber].value 1.. MS
* identifier[residentNumber].value ^short = "唯一值。 例如：居留证号码为A912345678"
* identifier[residentNumber].value ^definition = "识别码中通常与使用者有关的部分，在编码系统作用域内是唯一的。"
* identifier[residentNumber].value ^comment = "如果此值是一个完整的URI，那么此系统 **必须（SHALL）** 是urn:ietf:rfc:3986。此值的主要目的是为了可运算的对应。因此，为了比较的目的，它可能会被正规化（例如：去除不重要的空白、破折号等）。一个为人显示的格式化的值可以使用[Rendered Value](http://hl7.org/fhir/R4/extension-rendered-value.html)扩充来传达。除非对Identifier.system的了解使处理者确信不区分大小写的处理是安全的，否则Identifier.value应被视为区分大小写。"
* identifier[residentNumber].period ^short = "此身份识别码（identifier）的使用效期"
* identifier[residentNumber].period ^definition = "识别码有效／曾经有效使用的时段或期间"
* identifier[residentNumber].assigner only Reference(SmOrganization)
* identifier[residentNumber].assigner ^short = "签发identifier的机构（可以只是文字表述）"
* identifier[residentNumber].assigner ^definition = "签发／管理识别码的机构"
* identifier[residentNumber].assigner ^comment = "Identifier.assigner可以省略.reference资料项目，只包含一个.display资料项目，反映指定机构的名称或其他文字表述信息。"
* active MS
* active ^short = "此医护服务提供人员的纪录是否在使用中"
* active ^definition = "此医护服务提供人员的纪录是否在使用中"
* active ^comment = "如果机构未使用此医护服务提供人员纪录，那么应该在PractitonerRole上标注结束日期（即使他们是使用中的），因为他们可能以另一种角色存在。"
* active ^requirements = "由于医护服务提供人员的纪录被错误建立，需能将其纪录标注为非使用中。"
* name 1.. MS
* name obeys rl-patient-name
* name ^short = "医护服务提供人员的姓名"
* name ^definition = "医护服务提供人员的姓名"
* name ^comment = "使用属性的选择应确保有一个指定的常用名称，其他名称应根据需要使用暱称（别名）、旧名或其他值。\n \n一般来说，根据以下条件决定要在ResourceReference.display中使用的值：\n \n1. 有一个以上的名字\n2. Use=usual\n3. Period（使用期间）是目前日期至使用截止日期\n4. Use=official\n5. 其他顺序则由内部业务规则决定"
* name ^requirements = "Practitioner所使用的名称。如果有多个名字，则应使用此健康医护服务提供者常用的名字来显示。"
* name.use = #official
* name.use MS
* name.use from http://hl7.org/fhir/ValueSet/name-use|4.0.1 (required)
* name.use ^definition = "此姓名的用途"
* name.use ^comment = "应用程序可以假定一个姓名是永久的，除非它明确说它是暂时或旧的。"
* name.use ^requirements = "允许从一组姓名中为特定的使用场景选择适当的姓名"
* name.use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* name.use ^binding.extension[=].valueString = "NameUse"
* name.use ^binding.description = "人名的使用情况；应填入所绑定值集中的其中一个代码。"
* name.text MS
* name.text ^short = "完整的中文姓名"
* name.text ^definition = "完整姓名的文字表述。由于世界各地的文化差异，取得资料的系统可能不知道如何正确地呈现姓名；此外，不是所有的名字部分都呈现予姓或名。因此，我们强烈建议创建者透过这个资料项目提供姓名的显示文字。"
* name.text ^comment = "可以同时提供文字表述（text）和部分（part）。更新姓名的应用程序 **必须（SHALL）** 确保当test和lpart都存在时，text中不包含part中没有的内容。"
* name.text ^example.label = "General"
* name.text ^example.valueString = "王依升" 
* name.family MS
* name.family ^short = "英文姓"
* name.family ^definition = "姓名中与族谱相关的部分。在一些文化中（如厄立特里亚），儿子的姓氏是其父亲的名字。"
* name.family ^comment = "姓氏可以使用扩充名（de、nl、es相关文化）分解成具体的部分（part）"
* name.family ^example.label = "General"
* name.family ^example.valueString = "Wang" 
* name.given MS
* name.given ^short = "英文名"
* name.given ^definition = "姓名中的「名」"
* name.given ^comment = "如果只记录首字母，可以用它们来代替完整姓名。首字母可以分为多个名，但由于实际情况的限制，通常不会这样做。这个资料项目不被称为 「first name」，因为「given name」并不总是排在前面。"
* name.given ^example.label = "General"
* name.given ^example.valueString = "Yi Sheng" 
* name.prefix ^short = "姓名前面的头衔\n由于学术，法律，职业或贵族身份等原因而获得头衔，出现在姓名开头。"
* name.prefix ^definition = "由于学术、法规、就业或贵族身份等原因而获得的名，并出现在姓名的开头。"
* name.suffix ^short = "姓名后面的称谓\n由于学术，法律，职业或贵族身份等原因而获得头衔，出现在姓名之后。"
* name.suffix ^definition = "由于学术、法规、就业或贵族身份等原因而获得的名，并出现在姓名的开头。"
* name.period ^short = "此姓名的使用效期"
* name.period ^definition = "表明这个姓名对此病人有效的时间区间或期间"
* name.period ^requirements = "允许多个姓名按其历史场景（效期）储存"
* telecom MS
* telecom ^short = "医护服务提供人员的详细联络方式（适用于所有角色）。"
* telecom ^definition = "医护服务提供人员的详细联络方式，例如：电话号码或电子邮件信箱。"
* telecom ^comment = "个人可能有多种联系方式，有不同的用途或适用期。可能需要有与该人紧急联系的选项，并帮助识别。这些通常会有家用电话号码，或没有特定角色的手机号码。"
* telecom ^requirements = "不论医护服务提供人员的角色是什么，需要知道如何与医护服务提供人员取得联系。"
* telecom.system 1.. MS
* telecom.system from http://hl7.org/fhir/ValueSet/contact-point-system|4.0.1 (required)
* telecom.system ^definition = "联络方式的通讯形式－需要什么通讯系统进行联络"
* telecom.system ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* telecom.system ^binding.extension[=].valueString = "ContactPointSystem"
* telecom.system ^binding.description = "应填入所绑定值集中的其中一个代码。"
* telecom.value 1.. MS
* telecom.value ^short = "实际的联络方式之细节"
* telecom.value ^definition = "实际的联络方式之细节，针对指定的通讯系统提供有意义的形式（电话号码或是电子邮件位址）。"
* telecom.value ^comment = "额外的文字资料，例如电话分机号码、或关于联络人的说明，有时也包括于此值。"
* telecom.value ^requirements = "需支援非严格格式控制之旧有号码"
* telecom.use MS
* telecom.use from http://hl7.org/fhir/ValueSet/contact-point-use|4.0.1 (required)
* telecom.use ^short = "home | work | temp | old | mobile－此联络方式的用途"
* telecom.use ^definition = "确定联络方式的用途"
* telecom.use ^comment = "应用程序可以假定一个联络方法是目前使用中，除非它明确说它是暂时的或旧的。"
* telecom.use ^requirements = "需要追踪此人使用这种联络的方式，使用者可以选择适合他们用途的联络方式。"
* telecom.use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* telecom.use ^binding.extension[=].valueString = "ContactPointUse"
* telecom.use ^binding.description = "应填入所绑定值集中的其中一个代码。"
* telecom.rank ^short = "具体说明偏好的使用顺序（1=最高优先顺序）"
* telecom.rank ^definition = "具体说明使用一组联络方式的优先顺序，较小排名序位的联络方式比较大排名序位的联络方式之序位还要前面。"
* telecom.rank ^comment = "请注意，排名序位没有一定要遵循联络方式在实例中呈现的顺序。"
* telecom.period MS
* telecom.period ^short = "此联络方式的使用效期"
* telecom.period ^definition = "此联络方式的使用效期"
* address only Address
* address MS
* address ^short = "不限特定角色的医护服务提供人员的地址（通常是住家地址）"
* address ^definition = "不限特定角色的健康医护服务提供者的地址（通常是住家地址），工作地址通常不在此属性中输入，因为它们通常取决于此人员的角色。"
* address ^comment = "PractitionerRole上没有address但有location属性（它有一个地址）用于这个目的。"
* address ^requirements = "Administrative Gender为行政管理的及保存纪录目的之健康医护服务提供者性别"
* gender MS
* gender from http://hl7.org/fhir/ValueSet/administrative-gender|4.0.1 (required)
* gender ^short = "male ｜ female ｜ other ｜ unknown"
* gender ^definition = "Administrative Gender为行政管理的及保存纪录目的之健康医护服务提供者性别"
* gender ^requirements = "用以正确称呼健康医护服务提供者"
* gender ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* gender ^binding.extension[=].valueString = "AdministrativeGender"
* gender ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* gender ^binding.extension[=].valueBoolean = true
* gender ^binding.description = "性别；应填入所绑定值集中的其中一个代码。"
* birthDate MS
* birthDate ^short = "医护服务提供人员的出生日期"
* birthDate ^definition = "医护服务提供人员的出生日期"
* birthDate ^requirements = "为了识别身份而需要"
* photo MS
* photo ^short = "人员的影像（照片）"
* photo ^definition = "人员的影像（照片）"
* photo ^requirements = "许多EHR系统有能力取得健康医护服务提供者的影像（照片），这也符合较新的社群媒体的使用。"
* qualification ^short = "与医护服务相关的证书、执照或培训"
* qualification ^definition = "授权或其他与医护服务提供人员提供医护有关的官方证书、执照和培训。例如：由卫生福利部颁发的医师证书。"
* qualification.identifier ^short = "医护服务提供人员的资格证书识别码"
* qualification.identifier ^definition = "此人在此角色的资格证书之识别码"
* qualification.identifier ^requirements = "通常此资格证书会被指定特定识别码"
* qualification.code only CodeableConcept 
* qualification.code ^short = "资格证书的编码描述"
* qualification.code ^definition = "资格证书的编码描述"
* qualification.code ^binding.description = "医护服务提供人员提供服务所具有的具体资格证书；应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* qualification.period ^short = "资格证书的有效期限"
* qualification.period ^definition = "资格证书的有效期限"
* qualification.period ^requirements = "资格证书通常是有期限的，并且可以被撤销。"
* qualification.issuer only Reference(SmOrganization)
* qualification.issuer ^short = "监管和颁发资格证书的机构"
* qualification.issuer ^definition = "监管和颁发资格证书的机构"
* communication only CodeableConcept
* communication from CommonLanguages (preferred)
* communication ^short = "健康医护服务提供者与病人沟通时可使用的语言"
* communication ^definition = "健康医护服务提供者与病人沟通时可使用的语言"
* communication ^comment = "带有这种精确字母大小写的aa-BB结构是最广泛使用的地方性符号之一。但并不是所有的系统都对其进行编码，而是将其作为纯文字表述。因此，data type为CodeableConcept而不是code。"
* communication ^requirements = "知道医护服务提供人员讲哪种语言有助于促进与病人的沟通"
* communication ^example.label = "Value"
* communication ^example.valueString = "zh-TW"
* communication ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-maxValueSet"
* communication ^binding.extension[=].valueCanonical = "http://hl7.org/fhir/ValueSet/all-languages"
* communication ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* communication ^binding.extension[=].valueString = "Language"
* communication ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* communication ^binding.extension[=].valueBoolean = true
* communication ^binding.description = "人类语言；鼓励使用所绑定值集中的代码，但不强制一定要使用此值集，你也可使用其他值集的代码或单纯以文字表示。"