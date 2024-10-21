Profile: SmPatient
Parent: Patient
Id: sm-patient
Title: "SmPatient"
Description: "病人（Patient) Profile说明本IG如何进一步定义FHIR的Patient Resource以呈现基本资料"
* . ^short = "接受健康医护服务的个人信息"
* . ^definition = "关于接受医护或其他健康相关服务的个人的人口统计学和其他行政信息。"
* id ^short = "不重复的ID用以识别储存在特定FHIR Server中的Patient纪录，通常又称为逻辑性ID。"
* id ^comment = "一个resource使用新增操作（create operation）提交给伺服器时，此resource没有id，它的id在resource被创建后由服务器分配/指定。"
* language from CommonLanguages (preferred)
* language ^short = "用以表述Patient Resource内容的语言。"
* language ^example.valueString = "zh-cn"
* text ^short = "Patient Resource之内容摘要以供人阅读"
* text ^definition = "人可读的叙述，包含resource的摘要，可用于向人表述resource的内容。叙述不需要对所有的结构化资料进行编码，但需要包含足够的细节使人在阅读叙述时理解「临床安全性」。resource定义有哪些内容应该在叙述中表示，以确保临床安全。"
* extension ^comment = "任何应用程序、专案或标准使用扩充时，都不应该带有任何负面的联想。使用扩充是允许FHIR规范为每个人保留一个核心的简易性。"
* extension contains
    ExtPersonAge named age 0..1 MS and
    $patient-nationality named nationality 0..1 MS
* extension[nationality] ^short = "病人所属国籍"
* identifier 1.. MS
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[=].path = "type.coding.code"
* identifier ^slicing.discriminator[+].type = #value
* identifier ^slicing.discriminator[=].path = "type.coding.system"
* identifier ^slicing.rules = #open
* identifier ^short = "病人的身份识别码（identifier），通常为业务目的所使用的识别码，例如病历号。"
* identifier ^definition = "病人的唯一识别码（identifier）"
* identifier ^requirements = "病人几乎总是被指定一个特定的数值型的唯一识别码（identifier）"
* identifier contains
    idCardNumber 0..1 MS and
    passportNumber 0..1 MS and
    residentNumber 0..1 MS and
    medicalRecord 0..1 MS
* identifier[idCardNumber] ^short = "适用身分证字号"
* identifier[idCardNumber] ^definition = "适用于身分证字号"
* identifier[idCardNumber] ^requirements = "病人几乎总是被指定一个特定的数值型的唯一识别码（identifier）"
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
// * identifier[idCardNumber].type.coding.code.extension contains IdentifierSuffix named identifier-suffix 0..1 MS
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
* identifier[idCardNumber].system = "IdCardNumber"
* identifier[idCardNumber].system ^short = "身份识别码（identifier）的命名空间（namespace）"
* identifier[idCardNumber].system ^definition = "建立值的命名空间－即一个描述一组值的唯一URL"
* identifier[idCardNumber].system ^comment = "Identifier.system总是区分大小写"
* identifier[idCardNumber].system ^requirements = "有许多识别码的集合。为了进行两个识别码的对应，我们需要知道我们处理的是哪一组。系统指明了一个特定的唯一识别码集。"
* identifier[idCardNumber].value 1.. MS
* identifier[idCardNumber].value ^short = "唯一值。\n例如：身分证字号为A123456789"
* identifier[idCardNumber].value ^definition = "识别码中通常与使用者有关的部分，在编码系统作用域内是唯一的。"
* identifier[idCardNumber].period ^short = "此身份识别码（identifier）的使用效期"
* identifier[idCardNumber].period ^definition = "识别码有效／曾经有效使用的时段或期间"
* identifier[idCardNumber].assigner only Reference(Organization)
* identifier[idCardNumber].assigner ^short = "签发identifier的机构（可以只是文字表述）"
* identifier[idCardNumber].assigner ^definition = "签发／管理识别码的机构"
* identifier[idCardNumber].assigner ^comment = "Identifier.assigner可以省略.reference资料项目，只包含一个.display资料项目，反映指定机构的名称或其他文字表述信息。"
* identifier[passportNumber] ^short = "适用护照号码"
* identifier[passportNumber] ^definition = "适用于护照号码"
* identifier[passportNumber] ^requirements = "病人几乎总是被指定一个特定的数值型的唯一识别码（identifier）"
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
* identifier[passportNumber].system = "PassportNumber"
* identifier[passportNumber].system ^short = "身份识别码（identifier）的命名空间（namespace ）"
* identifier[passportNumber].system ^definition = "建立值的命名空间－即一个描述一组值的唯一URL"
* identifier[passportNumber].system ^comment = "Identifier.system总是区分大小写"
* identifier[passportNumber].system ^requirements = "有许多识别码的集合。为了进行两个识别码的对应，我们需要知道我们处理的是哪一组。系统指明了一个特定的唯一识别码集。"
* identifier[passportNumber].value 1.. MS
* identifier[passportNumber].value ^short = "唯一值。 例如：护照号码为888800371"
* identifier[passportNumber].value ^definition = "识别码中通常与使用者有关的部分，在编码系统作用域内是唯一的。"
* identifier[passportNumber].value ^comment = "如果此值是一个完整的URI，那么此系统 **必须（SHALL）** 是urn:ietf:rfc:3986。此值的主要目的是为了可运算的对应。因此，为了比较的目的，它可能会被正规化（例如：去除不重要的空白、破折号等）。一个为人显示的格式化的值可以使用[Rendered Value](http://hl7.org/fhir/R4/extension-rendered-value.html)扩充来传达。除非对Identifier.system的了解使处理者确信不区分大小写的处理是安全的，否则Identifier.value应被视为区分大小写。"
* identifier[passportNumber].period ^short = "此身份识别码（identifier）的使用效期"
* identifier[passportNumber].period ^definition = "识别码有效／曾经有效使用的时段或期间"
* identifier[passportNumber].assigner only Reference(Organization)
* identifier[passportNumber].assigner ^short = "签发identifier的机构（可以只是文字表述）"
* identifier[passportNumber].assigner ^definition = "签发／管理识别码的机构"
* identifier[passportNumber].assigner ^comment = "Identifier.assigner可以省略.reference资料项目，只包含一个.display资料项目，反映指定机构的名称或其他文字表述信息。"
* identifier[residentNumber] ^short = "适用居住证号码"
* identifier[residentNumber] ^definition = "适用于居住证号码"
* identifier[residentNumber] ^requirements = "病人几乎总是被指定一个特定的数值型的唯一识别码（identifier）"
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
* identifier[residentNumber].system = "ResidentNumber"
* identifier[residentNumber].system ^short = "身份识别码（identifier）的命名空间（namespace）"
* identifier[residentNumber].system ^definition = "建立值的命名空间－即一个描述一组值的唯一URL"
* identifier[residentNumber].system ^comment = "Identifier.system总是区分大小写"
* identifier[residentNumber].system ^requirements = "有许多识别码的集合。为了进行两个识别码的对应，我们需要知道我们处理的是哪一组。系统指明了一个特定的唯一识别码集。"
* identifier[residentNumber].value 1.. MS
* identifier[residentNumber].value ^short = "唯一值。 例如：居住证号码为A912345678"
* identifier[residentNumber].value ^definition = "识别码中通常与使用者有关的部分，在编码系统作用域内是唯一的。"
* identifier[residentNumber].value ^comment = "如果此值是一个完整的URI，那么此系统 **必须（SHALL）** 是urn:ietf:rfc:3986。此值的主要目的是为了可运算的对应。因此，为了比较的目的，它可能会被正规化（例如：去除不重要的空白、破折号等）。一个为人显示的格式化的值可以使用[Rendered Value](http://hl7.org/fhir/R4/extension-rendered-value.html)扩充来传达。除非对Identifier.system的了解使处理者确信不区分大小写的处理是安全的，否则Identifier.value应被视为区分大小写。"
* identifier[residentNumber].period ^short = "此身份识别码（identifier）的使用效期"
* identifier[residentNumber].period ^definition = "识别码有效／曾经有效使用的时段或期间"
* identifier[residentNumber].assigner only Reference(Organization)
* identifier[residentNumber].assigner ^short = "签发identifier的机构（可以只是文字表述）"
* identifier[residentNumber].assigner ^definition = "签发／管理识别码的机构"
* identifier[residentNumber].assigner ^comment = "Identifier.assigner可以省略.reference资料项目，只包含一个.display资料项目，反映指定机构的名称或其他文字表述信息。"
* identifier[medicalRecord] ^short = "适用病历号"
* identifier[medicalRecord] ^definition = "适用于病历号"
* identifier[medicalRecord] ^requirements = "病人几乎总是被指定一个特定的数值型的唯一识别码（identifier）"
* identifier[medicalRecord].use = #official
* identifier[medicalRecord].use MS
* identifier[medicalRecord].use from http://hl7.org/fhir/ValueSet/identifier-use|4.0.1 (required)
* identifier[medicalRecord].use ^short = "usual ｜ official ｜ temp ｜ secondary ｜ old （如果知道）"
* identifier[medicalRecord].use ^definition = "这个唯一识别码（identifier）的用途"
* identifier[medicalRecord].use ^comment = "应用程序可以假定一个识别码是永久的，除非它明确说它是暂时的。"
* identifier[medicalRecord].use ^requirements = "允许从一组识别码中为特定的使用场景选择适当的识别码"
* identifier[medicalRecord].use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* identifier[medicalRecord].use ^binding.extension[=].valueString = "IdentifierUse"
* identifier[medicalRecord].use ^binding.description = "如果知道，请说明此识别码的目的；应填入所绑定值集中的其中一个代码。"
* identifier[medicalRecord].type 1.. MS
* identifier[medicalRecord].type only CodeableConcept
* identifier[medicalRecord].type from IdentifierType (extensible)
* identifier[medicalRecord].type ^short = "身份识别码（identifier）的型别说明"
* identifier[medicalRecord].type ^definition = "识别码的代码型别，用于决定特定目适用的识别码。"
* identifier[medicalRecord].type ^comment = "这个资料项目只涉及识别码的一般类别。它 **必须没有（SHALL NOT）** 被用于与Identifier.system 1..1对应的代码。一些识别码可能由于常见的用法而属于多个类别。在系统是已知的情况下，型别是不必要的，因为型别总是系统定义的一部分。然而，系统经常需要处理系统不为人知的识别码。型别和系统之间不是1:1的关系，因为许多不同的系统有相同的型别。"
* identifier[medicalRecord].type ^requirements = "允许使用者在不知道识别码系统的情况下利用识别码"
* identifier[medicalRecord].type ^binding.description = "识别码的型别，用于决定特定目的所适用的识别码；应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* identifier[medicalRecord].type.coding 1..
* identifier[medicalRecord].type.coding ^short = "由专门术语系统（terminology system）定义的代码"
* identifier[medicalRecord].type.coding ^comment = "代码可以在列举清单（enumerations）或代码清单（code lists）中非常随意地定义，直至有非常正式的定义，例如：SNOMED CT—更多信息见HL7 v3核心原则（Core Principles）。编码的排序是未定义的因而 **必须没有（SHALL NOT）** 被用来推断意义。一般来说，最多只有一个编码值（coding values）会被标记为UserSelected = true。"
* identifier[medicalRecord].type.coding ^requirements = "允许编码系统中的替代编码，以及翻译到其他编码系统。"
* identifier[medicalRecord].type.coding.system 1.. MS
* identifier[medicalRecord].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[medicalRecord].type.coding.system ^short = "专门术语系统（terminology system）的识别"
* identifier[medicalRecord].type.coding.system ^definition = "定义代码中符号意义的编码系统识别"
* identifier[medicalRecord].type.coding.system ^comment = "URI可以是一个OID（urn:oid:...）或一个UUID（urn:uuid:...）；OID和UUID **必须（SHALL）** 参照HL7 OID注册中心；否则，URI应该来自HL7的FHIR定义的特殊URI列表，或者它应该参照一些明确建立的系统定义。"
* identifier[medicalRecord].type.coding.system ^requirements = "需要明确说明符号定义的来源"
* identifier[medicalRecord].type.coding.version ^short = "系统的版本—如果相关的话"
* identifier[medicalRecord].type.coding.version ^definition = "选择此代码时使用的编码系统版本；请注意，一个维护良好的编码系统不需要版本报告，因为代码的意义在不同系统版本中是一致的；然而，不能始终保证这点，当不能保证意义一致时， **必须（SHALL）** 将版本信息也一并作交换。"
* identifier[medicalRecord].type.coding.version ^comment = "如果专门术语没有明确定义应该使用什么字串来识别编码系统的版本，建议使用版本正式发布的日期（用FHIR日期格式表示）作为版本日期。"
* identifier[medicalRecord].type.coding.code 1.. MS
* identifier[medicalRecord].type.coding.code = #MR
* identifier[medicalRecord].type.coding.code ^short = "系统定义的语法之符号"
* identifier[medicalRecord].type.coding.code ^definition = "系统定义的语法之符号；符号可能是一个预先定义的代码，也可能是编码系统定义的语法中的表达式（如后组合配对／后组合式）。"
* identifier[medicalRecord].type.coding.code ^requirements = "需要参照系统中的一个特定代码"
* identifier[medicalRecord].type.coding.display MS
* identifier[medicalRecord].type.coding.display ^short = "由编码系统定义的描述"
* identifier[medicalRecord].type.coding.display ^definition = "遵循系统的规则以呈现代码含义的描述"
* identifier[medicalRecord].type.coding.display ^requirements = "需要能为不了解此系统的读者呈现可读的代码含义"
* identifier[medicalRecord].type.coding.userSelected ^short = "此编码是否由使用者直接选择？"
* identifier[medicalRecord].type.coding.userSelected ^definition = "表明此编码是由使用者直接选择，例如：从可用项目（代码或显示名称）的清单中选择。"
* identifier[medicalRecord].type.coding.userSelected ^comment = "在一系列备选方案中，直接选择的代码是新翻译最合适的起点；关于「直接选择」的确切意义，存在模糊不清之处，可能需要贸易伙伴的同意，以更完整澄清此资料项目的使用及其后果。"
* identifier[medicalRecord].type.coding.userSelected ^requirements = "已被确定为一个临床安全准则—此确切的系统／代码对(code pair)是被明确选择的，而不是由编码系统根据一些规则或是程序语言处理判断。"
* identifier[medicalRecord].type.text MS
* identifier[medicalRecord].type.text ^short = "概念的文字描述"
* identifier[medicalRecord].type.text ^definition = "输入资料的使用者所见／所选／所说的人类可读文字表述，和（或）其代表使用者的预期含义。"
* identifier[medicalRecord].type.text ^comment = "很多时候，此文字表述与其中一个代码的显示名称相同。"
* identifier[medicalRecord].type.text ^requirements = "专门术语中的代码并不总是能捕捉人类使用的细微差别的正确意义，或者根本就没有合适的代码；这些情况下，文字表述被用来捕捉来源的全部意义。"
* identifier[medicalRecord].system 1.. MS
* identifier[medicalRecord].system ^short = "身份识别码（identifier）的命名空间（namespace），可至[twTerminology](https://.mohw.gov.tw/ts/namingsystem.jsp?status=active&amp;type=0)申请或查询命名系统。"
* identifier[medicalRecord].system ^definition = "建立值的命名空间－即一个描述一组值的唯一URL"
* identifier[medicalRecord].system ^comment = "Identifier.system总是区分大小写"
* identifier[medicalRecord].system ^requirements = "有许多识别码的集合。为了进行两个识别码的对应，我们需要知道我们处理的是哪一组。系统指明了一个特定的唯一识别码集。"
* identifier[medicalRecord].value 1.. MS
* identifier[medicalRecord].value ^short = "唯一值。\n例如：病历号为8862168"
* identifier[medicalRecord].value ^definition = "识别码中通常与使用者有关的部分，在编码系统作用域内是唯一的。"
* identifier[medicalRecord].value ^comment = "如果此值是一个完整的URI，那么此系统 **必须（SHALL）** 是urn:ietf:rfc:3986。此值的主要目的是为了可运算的对应。因此，为了比较的目的，它可能会被正规化（例如：去除不重要的空白、破折号等）。一个为人显示的格式化的值可以使用[Rendered Value](http://hl7.org/fhir/R4/extension-rendered-value.html)扩充来传达。除非对Identifier.system的了解使处理者确信不区分大小写的处理是安全的，否则Identifier.value应被视为区分大小写。"
* identifier[medicalRecord].period ^short = "此身份识别码（identifier）的使用效期"
* identifier[medicalRecord].period ^definition = "识别码有效／曾经有效使用的时段或期间"
* identifier[medicalRecord].assigner only Reference(Organization)
* identifier[medicalRecord].assigner ^short = "签发identifier的机构（可以只是文字表述）"
* identifier[medicalRecord].assigner ^definition = "签发／管理识别码的机构"
* identifier[medicalRecord].assigner ^comment = "Identifier.assigner可以省略.reference资料项目，只包含一个.display资料项目，反映指定机构的名称或其他文字表述信息。"
* active MS
* active ^short = "病人的纪录是否「使用中（true）」"
* active ^definition = "这位病人的纪录是否在使用中（active）。许多系统使用这个属性来标记为非现有（non-current）病人，例如那些根据机构的业务规则在一段时间内没有被看到的病人。\n\n它经常被用来过滤病人清单以排除inactive的病人\n\n已过世的病人也可能因为同样的原因被标记为inactive，但在过世后的一段时间内可能是active。"
* active ^comment = "如果一笔病人纪录没有在使用，但与另一笔使用中的病人纪录相连结，那么未来的病人／纪录更新应该发生在另一笔病人纪录。"
* active ^requirements = "若纪录因为错误而创建，需要能够将这位病人纪录标记为不使用"
* name ^slicing.discriminator[0].type = #pattern
* name ^slicing.discriminator[=].path = "use"
* name ^slicing.rules = #open
* name ^short = "病人的姓名"
* name ^definition = "个人名字"
* name ^comment = "一位病人可能有多个姓名，有不同的用途或适用期。对于动物来说，这个姓名是一个「HumanName」，它是人类指定和使用的，具有相同的模式。"
* name ^requirements = "需要能够追踪病人的多个姓名。例如：正式姓名及配偶姓名。 **必须（SHALL）** 总是提供姓名的完整拼法。"
* name.use from http://hl7.org/fhir/ValueSet/name-use|4.0.1 (required)
* name.use ^definition = "此姓名的用途"
* name.use ^requirements = "允许从一组姓名中为特定的使用场景选择适当的姓名"
* name.use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* name.use ^binding.extension[=].valueString = "NameUse"
* name.use ^binding.description = "人名的使用情况；应填入所绑定值集中的其中一个代码。"
* name contains
    official 0..1 MS and
    usual 0..1 MS and
    temp 0..1 MS and
    anonymous 0..1 MS
* name[official] obeys rl-patient-name
* name[official] ^short = "病人的护照姓名"
* name[official].use 1.. MS
* name[official].use = #official
* name[official].text MS
* name[official].text ^short = "完整的护照姓名"
* name[official].text ^definition = "完整姓名的文字表述。由于世界各地的文化差异，取得资料的系统可能不知道如何正确地呈现姓名；此外，不是所有的名字部分都呈现予姓或名。因此，我们强烈建议创建者透过这个资料项目提供姓名的显示文字。"
* name[official].text ^comment = "可以同时提供文字表述（text）和部分（part）。更新姓名的应用程序 **必须（SHALL）** 确保当test和lpart都存在时，text中不包含part中没有的内容。"
* name[official].text ^requirements = "一个可呈现的、未编码的形式。"
* name[official].text ^example.label = "General"
* name[official].text ^example.valueString = "Chia-Lin Chan"
* name[official].text ^condition = "rl-patient-name"
* name[official].family MS
* name[official].family ^short = "护照中的姓"
* name[official].family ^definition = "姓名中与族谱相关的部分。在一些文化中（如厄立特里亚），儿子的姓氏是其父亲的名字。"
* name[official].family ^comment = "姓氏可以使用扩充名（de、nl、es相关文化）分解成具体的部分（part）"
* name[official].family ^example.label = "General"
* name[official].family ^example.valueString = "Chen"
* name[official].family ^condition = "rl-patient-name"
* name[official].given MS
* name[official].given ^short = "护照中的名"
* name[official].given ^definition = "姓名中的「名」"
* name[official].given ^comment = "如果只记录首字母，可以用它们来代替完整姓名。首字母可以分为多个名，但由于实际情况的限制，通常不会这样做。这个资料项目不被称为 「first name」，因为「given name」并不总是排在前面。"
* name[official].given ^example.label = "General"
* name[official].given ^example.valueString = "Chia-Lin"
* name[official].given ^condition = "rl-patient-name"
* name[official].prefix ^short = "姓名前面的头衔\n由于学术，法律，职业或贵族身份等原因而获得头衔，出现在姓名开头。"
* name[official].prefix ^definition = "由于学术、法规、就业或贵族身份等原因而获得的名，并出现在姓名的开头。"
* name[official].suffix ^short = "姓名后面的称谓\n由于学术，法律，职业或贵族身份等原因而获得头衔，出现在姓名之后。"
* name[official].suffix ^definition = "由于学术、法规、就业或贵族身份等原因而获得的名，并出现在姓名的开头。"
* name[official].period ^short = "此姓名的使用效期"
* name[official].period ^definition = "表明这个姓名对此病人有效的时间区间或期间"
* name[official].period ^requirements = "允许多个姓名按其历史场景（效期）储存"
* name[usual] obeys rl-patient-name
* name[usual] ^short = "病人所属国籍的真实姓名"
* name[usual] ^definition = "个人名字"
* name[usual] ^comment = "一位病人可能有多个姓名，有不同的用途或适用期。对于动物来说，这个姓名是一个「HumanName」，它是人类指定和使用的，具有相同的模式。"
* name[usual] ^requirements = "需要能够追踪病人的多个姓名。例如：正式姓名及配偶姓名。 **必须（SHALL）** 总是提供姓名的完整拼法。"
* name[usual].use 1.. MS
* name[usual].use = #usual
* name[usual].text MS
* name[usual].text ^short = "完整的中文姓名"
* name[usual].text ^definition = "完整姓名的文字表述。由于世界各地的文化差异，取得资料的系统可能不知道如何正确地呈现姓名；此外，不是所有的名字部分都呈现予姓或名。因此，我们强烈建议创建者透过这个资料项目提供姓名的显示文字。"
* name[usual].text ^comment = "可以同时提供文字表述（text）和部分（part）。更新姓名的应用程序 **必须（SHALL）** 确保当test和lpart都存在时，text中不包含part中没有的内容。"
* name[usual].text ^requirements = "一个可呈现的、未编码的形式。"
* name[usual].text ^example.label = "General"
* name[usual].text ^example.valueString = "陈加玲"
* name[usual].text ^condition = "rl-patient-name"
* name[usual].family MS
* name[usual].family ^short = "若所属国籍可区分family及given，填入所属国籍之姓（family）"
* name[usual].family ^definition = "姓名中与族谱相关的部分。在一些文化中（如厄立特里亚），儿子的姓氏是其父亲的名字。"
* name[usual].family ^comment = "姓氏可以使用扩充名（de、nl、es相关文化）分解成具体的部分（part）"
* name[usual].family ^example.label = "General"
* name[usual].family ^example.valueString = "陈"
* name[usual].family ^condition = "rl-patient-name"
* name[usual].given MS
* name[usual].given ^short = "若所属国籍可区分family及given，填入所属国籍之名（given）"
* name[usual].given ^definition = "姓名中的「名」"
* name[usual].given ^comment = "如果只记录首字母，可以用它们来代替完整姓名。首字母可以分为多个名，但由于实际情况的限制，通常不会这样做。这个资料项目不被称为 「first name」，因为「given name」并不总是排在前面。"
* name[usual].given ^example.label = "General"
* name[usual].given ^example.valueString = "加玲"
* name[usual].given ^condition = "rl-patient-name"
* name[usual].prefix ^short = "姓名前面的头衔\n由于学术，法律，职业或贵族身份等原因而获得头衔，出现在姓名开头。"
* name[usual].prefix ^definition = "由于学术、法规、就业或贵族身份等原因而获得的名，并出现在姓名的开头。"
* name[usual].suffix ^short = "姓名后面的称谓\n由于学术，法律，职业或贵族身份等原因而获得头衔，出现在姓名之后。"
* name[usual].suffix ^definition = "由于学术、法规、就业或贵族身份等原因而获得的名，并出现在姓名的开头。"
* name[usual].period ^short = "此姓名的使用效期"
* name[usual].period ^definition = "表明这个姓名对此病人有效的时间区间或期间"
* name[usual].period ^requirements = "允许多个姓名按其历史场景（效期）储存"
* name[temp] ^short = "新生儿姓名，紧急救护未知病人姓名时亦可用。"
* name[temp] ^definition = "个人名字"
* name[temp] ^comment = "一位病人可能有多个姓名，有不同的用途或适用期。对于动物来说，这个姓名是一个「HumanName」，它是人类指定和使用的，具有相同的模式。"
* name[temp] ^requirements = "需要能够追踪病人的多个姓名。"
* name[temp].use 1.. MS
* name[temp].use = #temp
* name[temp].text 1.. MS
* name[temp].text ^short = "完整的中文姓名"
* name[temp].text ^definition = "完整姓名的文字表述。由于世界各地的文化差异，取得资料的系统可能不知道如何正确地呈现姓名；此外，不是所有的名字部分都呈现予姓或名。因此，我们强烈建议创建者透过这个资料项目提供姓名的显示文字。"
* name[temp].text ^comment = "可以同时提供文字表述（text）和部分（part）。更新姓名的应用程序 **必须（SHALL）** 确保当test和lpart都存在时，text中不包含part中没有的内容。"
* name[temp].text ^requirements = "一个可呈现的、未编码的形式。"
* name[temp].family ..0
* name[temp].given ..0
* name[temp].prefix ..0
* name[temp].suffix ..0
* name[temp].period ^short = "此姓名的使用效期"
* name[temp].period ^definition = "表明这个姓名对此病人有效的时间区间或期间"
* name[temp].period ^requirements = "允许多个姓名按其历史场景（效期）储存"
* name[anonymous] ^short = "匿名供研究使用"
* name[anonymous] ^definition = "个人名字"
* name[anonymous] ^comment = "一位病人可能有多个姓名，有不同的用途或适用期。对于动物来说，这个姓名是一个「HumanName」，它是人类指定和使用的，具有相同的模式。"
* name[anonymous] ^requirements = "需要能够追踪病人的多个姓名。"
* name[anonymous].use 1.. MS
* name[anonymous].use = #anonymous
* name[anonymous].text 1.. MS
* name[anonymous].text ^short = "完整的中文姓名"
* name[anonymous].text ^definition = "完整姓名的文字表述。由于世界各地的文化差异，取得资料的系统可能不知道如何正确地呈现姓名；此外，不是所有的名字部分都呈现予姓或名。因此，我们强烈建议创建者透过这个资料项目提供姓名的显示文字。"
* name[anonymous].text ^comment = "可以同时提供文字表述（text）和部分（part）。更新姓名的应用程序 **必须（SHALL）** 确保当test和lpart都存在时，text中不包含part中没有的内容。"
* name[anonymous].text ^requirements = "一个可呈现的、未编码的形式。"
* name[anonymous].family ..0
* name[anonymous].given ..0
* name[anonymous].prefix ..0
* name[anonymous].suffix ..0
* name[anonymous].period ^short = "此姓名的使用效期"
* name[anonymous].period ^definition = "表明这个姓名对此病人有效的时间区间或期间"
* name[anonymous].period ^requirements = "允许多个姓名按其历史场景（效期）储存"
* telecom MS
* telecom ^short = "病人的联络信息（例如：电话、电子邮件等）"
* telecom ^definition = "可与此人联络的详细联络方式（如电话或电子邮件地址等）"
* telecom ^comment = "一位病人可能有多种联络方式，有不同的用途或适用期。可能需要有紧急联络此人的选项，也需要帮忙识别身份。地址可能不会直接联络到此人，但可能到透过他人代为联络（意即家中的电话）。"
* telecom ^requirements = "人们有（主要）方式与他们联络，如电话、电子邮件。"
* telecom.system 1.. MS
* telecom.system from http://hl7.org/fhir/ValueSet/contact-point-system|4.0.1 (required)
* telecom.system ^definition = "联络方式的通讯形式－需要什么通讯系统进行联络"
* telecom.system ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* telecom.system ^binding.extension[=].valueString = "ContactPointSystem"
* telecom.system ^binding.description = "应填入所绑定值集中的其中一个代码。"
* telecom.value 1.. MS
* telecom.value ^short = "实际的联络方式之细节"
* telecom.value ^definition = "实际的联络方式之细节，针对指定的通讯系统提供有意义的形式（电话号码或是电子邮件位址）"
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
* telecom.rank ^definition = "具体说明使用一组联系方式的优先顺序，较小排名序位的联络方式比较大排名序位的联络方式之序位还要前面。"
* telecom.rank ^comment = "请注意，排名序位没有一定要遵循联络方式在实例中呈现的顺序。"
* telecom.period MS
* telecom.period ^short = "此联络方式的使用效期"
* telecom.period ^definition = "此联络方式的使用效期"
* gender 1.. MS
* gender from http://hl7.org/fhir/ValueSet/administrative-gender|4.0.1 (required)
* gender ^short = "male ｜ female ｜ other ｜ unknown"
* gender ^definition = "Administrative Gender 为行政管理及保存纪录目的之病人性别"
* gender ^comment = "行政管理用之性别可能不符合由遗传学或个人偏好的识别所决定的生物性别。请注意，对于人类，特别是动物，除了男性和女性，还有其他合法归类的可能性，尽管绝大多数系统和场景只支持男性和女性。提供决策支援或执行业务规则的系统最好以检验检查（Observation）呈现特定性别或感兴趣的性别（解剖学、染色体、社会等）。然而，由于这些检验检验不常被记录，预设为行政管理用之性别是常见的做法。在这种预设的情况下，规则的执行应该允许行政管理用和生物、染色体和其他性别方面的差异。例如：关于男性子宫切除的警讯应该作为警告或可推翻的错误来处理，而不是 「硬（hard） 」错误。关于沟通病人性别的更多信息，请参阅Patient Gender及Sex的部分。"
* gender ^requirements = "性别用于结合（至少）姓名和出生日期以识别个人身份"
* gender ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* gender ^binding.extension[=].valueString = "AdministrativeGender"
* gender ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* gender ^binding.extension[=].valueBoolean = true
* gender ^binding.description = "病人性别；应填入所绑定值集中的其中一个代码。"
* birthDate 1.. MS
* birthDate ^short = "病人出生日期"
* birthDate ^definition = "个人的出生日期"
* birthDate ^comment = "如果真实的出生日期未知，至少应该提供一个估计的出生年份作为猜测。有一个标准的扩充 「patient-birthTime」，应该于需要出生时间（Time）信息时使用（例如：在产科／新生儿医护系统中）。"
* birthDate ^requirements = "个人的年龄驱动著许多临床过程／进程"
* deceased[x] ^short = "病人是否过世"
* deceased[x] ^definition = "表示此人是否过世"
* deceased[x] ^comment = "如果实例中没有值，就意味著没有关于此人是否过世的声明。大多数系统会把没有数值解释为这个人还活著的标志。"
* deceased[x] ^requirements = "病人已经过世的事实影响了临床过程／进度。另外，在人际沟通和关系管理中，有必要知道这个人是否活著。"
* address only Address
* address MS
* address ^short = "病人联络地址\npat-cnt-2or3-char：如果有国家名，则必须（SHALL）从[ISO Country Alpha-2](http://hl7.org/fhir/valueset/iso3166-1-2)找出相对代码作呈现。 如果未在ISO Country Alpha-2 中找到此一国家的代码，则可能可以（MAY）从[ISO Country Alpha-3](http://hl7.org/fhir/valueset/iso3166-1-3)找出相对代码作呈现。"
* address ^definition = "此人的地址"
* address ^comment = "病人可能有多个地址，有不同的用途或适用期。"
* address ^requirements = "可能需要记录病人的地址，以便联系、结算或报告的要求，也有助于识别身份。"
* maritalStatus only CodeableConcept
* maritalStatus MS
* maritalStatus from $marital-status (extensible)
* maritalStatus ^short = "病人的婚姻状态"
* maritalStatus ^definition = "这个栏位包含病人的目前婚姻（民事）状态"
* maritalStatus ^requirements = "如果不是所有的系统都能取得此信息"
* maritalStatus ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* maritalStatus ^binding.extension[=].valueString = "MaritalStatus"
* maritalStatus ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* maritalStatus ^binding.extension[=].valueBoolean = true
* maritalStatus ^binding.description = "病人的婚姻状态；应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* multipleBirth[x] ^short = "病人是否为多胞胎；或多胞胎出生顺序。"
* multipleBirth[x] ^definition = "表示病人是否是为多胞胎（布尔值）或表示实际的出生顺序（整数值）"
* multipleBirth[x] ^comment = "在提供valueInteger的情况下，这个数字是序列中的出生序。例如：三胞胎中的中间胎儿是valueInteger=2，第三胎儿是valueInteger=3，如果是为三胞胎提供布尔值，那么所有3位病人的纪录都是valueBoolean=true（没有指明出生序）。"
* multipleBirth[x] ^requirements = "用于消除多胎孩童的歧义，特别是在医护人员没有见到病人的情况下，例如：在实验室。"
* photo MS
* photo ^short = "病人的影像（照片）"
* photo ^definition = "病人的影像（照片）"
* photo ^comment = "指引：\n使用个人影像，而不是临床影像。\n限制尺寸为缩图。\n保持低位元组小档案以便更新resource。"
* photo ^requirements = "许多EHR系统有能力取得病人的影像，这也符合较新的社群媒体的使用。"
* contact MS
* contact ^short = "病人的联络人，例如：监护人、伴侣、朋友等。"
* contact ^definition = "病人的联络人（如监护人、伴侣、朋友）。"
* contact ^comment = "联络涵盖所有种类的联络人：家人、业务联络、监护人、照顾者。不适用于登记血统和家庭关系，因这超出联络的目的。"
* contact ^requirements = "需能联络到的病人的人。"
* contact.relationship only CodeableConcept
* contact.relationship MS
* contact.relationship from PatientRelationshipType (required)
* contact.relationship ^short = "概念（Concept）－参照一个专门术语或只是文字表述"
* contact.relationship ^definition = "可以透过正式参照一个专门术语或知识本体来定义一个概念，或者也可以文字表述此概念。"
* contact.relationship ^requirements = "根据情况决定哪位联络人最有关联以作联系"
* contact.relationship ^binding.description = "应填入所绑定值集中的其中一个代码。"
* contact.name MS
* contact.name ^short = "联络人姓名"
* contact.name ^definition = "与联络人有关的姓名"
* contact.name ^requirements = "联络人需要以姓名来识别，但通常不需要此联络人的其他姓名的细节。"
* contact.name.use MS
* contact.name.use from http://hl7.org/fhir/ValueSet/name-use|4.0.1 (required)
* contact.name.use ^definition = "此姓名的用途"
* contact.name.use ^comment = "应用程序可以假定一个姓名是永久的，除非它明确说它是暂时或旧的。"
* contact.name.use ^requirements = "允许从一组姓名中为特定的使用场景选择适当的姓名"
* contact.name.use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* contact.name.use ^binding.extension[=].valueString = "NameUse"
* contact.name.use ^binding.description = "人名的使用情况；应填入所绑定值集中的其中一个代码。"
* contact.name.text MS
* contact.name.text ^short = "完整的中文姓名"
* contact.name.text ^definition = "完整姓名的文字表述。由于世界各地的文化差异，取得资料的系统可能不知道如何正确地呈现姓名；此外，不是所有的名字部分都呈现予姓或名。因此，我们强烈建议创建者透过这个资料项目提供姓名的显示文字。"
* contact.name.text ^comment = "可以同时提供文字表述（text）和部分（part）。更新姓名的应用程序  **必须（SHALL）**  确保当test和lpart都存在时，text中不包含part中没有的内容。"
* contact.name.text ^requirements = "一个可呈现的、未编码的形式。"
* contact.name.family MS
* contact.name.family ^short = "英文姓"
* contact.name.family ^definition = "姓名中与族谱相关的部分。在一些文化中（如厄立特里亚），儿子的姓氏是其父亲的名字。"
* contact.name.family ^comment = "姓氏可以使用扩充名（de、nl、es相关文化）分解成具体的部分（part）"
* contact.name.given MS
* contact.name.given ^short = "英文名"
* contact.name.given ^definition = "姓名中的「名」"
* contact.name.given ^comment = "如果只记录首字母，可以用它们来代替完整姓名。首字母可以分为多个名，但由于实际情况的限制，通常不会这样做。这个资料项目不被称为 「first name」，因为「given name」并不总是排在前面。"
* contact.name.prefix ^short = "姓名前面的头衔\n由于学术，法律，职业或贵族身份等原因而获得头衔，出现在姓名开头。"
* contact.name.prefix ^definition = "由于学术、法规、就业或贵族身份等原因而获得的名，并出现在姓名的开头。"
* contact.name.suffix ^short = "姓名后面的称谓\n由于学术，法律，职业或贵族身份等原因而获得头衔，出现在姓名之后。"
* contact.name.suffix ^definition = "由于学术、法规、就业或贵族身份等原因而获得的名，并出现在姓名的开头。"
* contact.name.period ^short = "此姓名的使用效期"
* contact.name.period ^definition = "表明这个姓名对此病人有效的时间区间或期间"
* contact.name.period ^requirements = "允许多个姓名按其历史场景（效期）储存"
* contact.telecom MS
* contact.telecom ^short = "联络人的详细联络信息"
* contact.telecom ^definition = "此人的详细联络方式，例如：电话号码或电子邮件地址。"
* contact.telecom ^comment = "联络人可能有多种联络方式，有不同的用途或适用期。可能需要有紧急联络此人的选项，及需要帮忙身份识别。"
* contact.telecom ^requirements = "人们可透过（主要）方式与他们联络，例如电话、电子邮件。"
* contact.telecom.system 1.. MS
* contact.telecom.system from http://hl7.org/fhir/ValueSet/contact-point-system|4.0.1 (required)
* contact.telecom.system ^definition = "联络方式的通讯形式－需要什么通讯系统进行联络"
* contact.telecom.system ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* contact.telecom.system ^binding.extension[=].valueString = "ContactPointSystem"
* contact.telecom.system ^binding.description = "应填入所绑定值集中的其中一个代码。"
* contact.telecom.value 1.. MS
* contact.telecom.value ^short = "实际的联络方式之细节"
* contact.telecom.value ^definition = "实际的联络方式之细节，针对指定的通讯系统提供有意义的形式（电话号码或是电子邮件位址）。"
* contact.telecom.value ^comment = "额外的文字资料，例如电话分机号码、或关于联络人的说明，有时也包括于此值。"
* contact.telecom.value ^requirements = "需支援非严格格式控制之旧有号码"
* contact.telecom.use MS
* contact.telecom.use from http://hl7.org/fhir/ValueSet/contact-point-use|4.0.1 (required)
* contact.telecom.use ^short = "home | work | temp | old | mobile－此联络方式的用途"
* contact.telecom.use ^definition = "确定联络方式的用途"
* contact.telecom.use ^comment = "应用程序可以假定一个联络方法是目前使用中，除非它明确说它是暂时的或旧的。"
* contact.telecom.use ^requirements = "需要追踪此人使用这种联络的方式，使用者可以选择适合他们用途的联络方式。"
* contact.telecom.use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* contact.telecom.use ^binding.extension[=].valueString = "ContactPointUse"
* contact.telecom.use ^binding.description = "应填入所绑定值集中的其中一个代码。"
* contact.telecom.rank ^short = "具体说明偏好的使用顺序（1=最高优先顺序）"
* contact.telecom.rank ^definition = "具体说明使用一组联系方式的优先顺序，较小排名序位的联络方式比较大排名序位的联络方式之序位还要前面。"
* contact.telecom.rank ^comment = "请注意，排名序位没有一定要遵循联络方式在实例中呈现的顺序。"
* contact.telecom.period ^short = "此联络方式的使用效期"
* contact.telecom.period ^definition = "此联络方式的使用效期"
* contact.address only Address
* contact.address ^short = "联络人的地址"
* contact.address ^definition = "联络人的地址"
* contact.address ^requirements = "需要纪录用以联络联络人的邮件地址或到访地址"
* contact.gender from http://hl7.org/fhir/ValueSet/administrative-gender|4.0.1 (required)
* contact.gender ^short = "male ｜ female ｜ other ｜ unknown"
* contact.gender ^definition = "Administrative Gender为行政管理的及保存纪录目的之联络人性别"
* contact.gender ^requirements = "用以正确称呼联络人"
* contact.gender ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* contact.gender ^binding.extension[=].valueString = "AdministrativeGender"
* contact.gender ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* contact.gender ^binding.extension[=].valueBoolean = true
* contact.gender ^binding.description = "联络人的性别；应填入所绑定值集中的其中一个代码。"
* contact.organization only Reference(Organization)
* contact.organization ^short = "可联络到联络人的机构"
* contact.organization ^definition = "联络人为机构或联络人为其工作的机构"
* contact.organization ^requirements = "监护人或与业务相关联络与此机构有关"
* contact.period MS
* contact.period ^short = "联络人或其可联络机构之可联络期（时间区间）"
* contact.period ^definition = "与此病人有关的联络人或机构的有效联络期"
* communication MS
* communication ^short = "向病人说明健康状态时所使用的语言"
* communication ^definition = "可用于与病人沟通其健康状况的语言。"
* communication ^comment = "如果没有指定语言，这意味著预设使用当地语言。如果你需要多种模式的熟练程度，那么你需要多个Patient.Communication关联。对于动物来说，语言不是相关的栏位，应该不存在于实例中。如果病人不讲预设的当地语言，那么可以使用 「（Interpreter Required Standard）需要口译员」来明确声明需要口译员。"
* communication ^requirements = "如果病人不会说当地语言，可能需要翻译，因此，对于病人和其他相关人员来说，所讲的语言和熟练程度都是需要记录的重要内容。"
* communication.language only CodeableConcept
* communication.language MS
* communication.language from CommonLanguages (preferred)
* communication.language ^short = "向病人说明健康状况时所使用的语言"
* communication.language ^definition = "小写的ISO-639-1字母两个代码表示的语言，后面可以有连字符号，大写的ISO-3166-1字母两个代码表示使用此语言的地区；例如「en 」代表英语，或者 「en-US 」代表美国英语，而 「en-EN 」代表英国英语。"
* communication.language ^comment = "带有这种精确字母大小写的aa-BB结构是最广泛使用的地方性符号之一。但并不是所有的系统都对其进行编码，而是将其作为纯文字表述。因此，data type为CodeableConcept而不是code。"
* communication.language ^requirements = "在多语言国家的大多数系统都会想要沟通语言。并非所有的系统实际上都需要区域方言。"
* communication.language ^example.label = "Value"
* communication.language ^example.valueString = "zh-cn"
* communication.language ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-maxValueSet"
* communication.language ^binding.extension[=].valueCanonical = "http://hl7.org/fhir/ValueSet/all-languages"
* communication.language ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* communication.language ^binding.extension[=].valueString = "Language"
* communication.language ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* communication.language ^binding.extension[=].valueBoolean = true
* communication.language ^binding.description = "应填入所绑定值集中的其中一个代码。"
* communication.preferred ^short = "病人是否偏好使用此语言"
* communication.preferred ^definition = "表示病人是否偏好此语言（相对于其他它已掌握到一定水平的语言）"
* communication.preferred ^comment = "此语言专门用以沟通健康医护信息"
* communication.preferred ^requirements = "掌握多种语言达到一定水平的人可能更偏好一种或多种语言，也就是说，在用某一种语言沟通时感到更有信心，使其他语言成为一种备用语言。"
* generalPractitioner only Reference(Organization or Practitioner or PractitionerRole)
* generalPractitioner ^short = "医护此病人的机构、医护服务提供者、或健康医护服务提供者的角色"
* generalPractitioner ^definition = "病人指定的医护服务提供者"
* generalPractitioner ^comment = "这可能是基层健康医护提供者（在一般科医生的场景下），也可能是在社区／失能环境中由病人提名的医护管理者，甚至是提供人力来履行医护提供者角色的机构。它不能用来记录Care Teams，这些团队应该在CareTeams resource中，可以连接到CarePlan或EpisodeOfCare。由于各种原因，病人可能会被记录有多个一般科医生，例如：一位学生在学校学期期间将他的家庭医生与大学的医生一起列出，或者一位至偏远地区「飞进／飞出 」的工作者会有当地的医师及其家庭医生，以保持对医疗问题的了解。  \n如果需要，各行政管辖区可决定将其规范为只有1位，或每种型别1位。"
* managingOrganization only Reference(Organization)
* managingOrganization MS
* managingOrganization ^short = "此纪录的保管机构"
* managingOrganization ^definition = "病人纪录的保管机构"
* managingOrganization ^comment = "仅有一个管理特定病人纪录的机构。其他机构将拥有自己的「病人」纪录，并可透过使用「Link」属性将纪录结合在一起（或可以包含关联可信的「Person」resource）。"
* managingOrganization ^requirements = "需要知道谁识别、管理和更新这位病人的纪录"
* link ^short = "连结至此病人的其他Patient Resource"
* link ^definition = "连结到另一个涉及同一实际病人的Patient resource。"
* link ^comment = "不存在连结的病人纪录有相互连结的假设"
* link ^requirements = "有多种使用案例：  \n由于难以一致地指明与人相关的文件而错误地重复制作病人纪录，并在多个服务器上发布病人的信息。"
* link.other only Reference(SmPatient or RelatedPerson)
* link.other ^short = "连结至其他Patient或RelatedPerson Resource"
* link.other ^definition = "此连超所参照的另一个Patient resource"
* link.other ^comment = "在这里参照一个RelatedPerson，就不需要另外使用Person来将Patient及RelatedPerson作为同一个人关联起来。"
* link.other ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* link.other ^type.extension.valueBoolean = false
* link.type from http://hl7.org/fhir/ValueSet/link-type|4.0.1 (required)
* link.type ^short = "replaced-by ｜ replaces ｜ refer ｜ seealso"
* link.type ^definition = "这个Patient resource与另一个Patient resource之间的连结型别"
* link.type ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* link.type ^binding.extension[=].valueString = "LinkType"
* link.type ^binding.description = "连结的型别；应填入所绑定值集中的其中一个代码。"

 