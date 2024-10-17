Profile: SmPatientBase
Parent: Patient
Id: sm-patient
Title: "SmPatient Base"
Description: "病人（Serious Medical Patient) Profile说明本IG如何进一步定义FHIR的Patient Resource以呈现基本资料"
* . ^short = "接受健康医护服务的个人信息"
* . ^definition = "关于接受医护或其他健康相关服务的个人的人口统计学和其他行政信息。"
* id ^short = "不重复的ID用以识别储存在特定FHIR Server中的Patient纪录，通常又称为逻辑性ID。"
* id ^comment = "一个resource使用新增操作（create operation）提交给伺服器时，此resource没有id，它的id在resource被创建后由伺器分配/指定。"
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
* identifier[idCardNumber].type.coding ^definition = "由专门术语系统（terminology system）所定义之代码的参照"
* identifier[idCardNumber].type.coding ^comment = "代码可以在列举清单（enumerations）或代码清单（code lists）中非常随意地定义，直至有非常正式的定义，例如：SNOMED CT—更多信息见HL7 v3核心原则（Core Principles）。编码的排序是未定义的因而 **必须没有（SHALL NOT）** 被用来推断意义。一般来说，最多只有一个编码值（coding values）会被标记为UserSelected = true。"
* identifier[idCardNumber].type.coding ^requirements = "允许代码系统中的替代编码，以及翻译到其他编码系统。"
* identifier[idCardNumber].type.coding.system 1.. MS
* identifier[idCardNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[idCardNumber].type.coding.system ^short = "专门术语系统（terminology system）的识别"
* identifier[idCardNumber].type.coding.system ^definition = "定义代码中符号意义的代码系统识别"
* identifier[idCardNumber].type.coding.system ^comment = "URI可以是一个OID（urn:oid:...）或一个UUID（urn:uuid:...）；OID和UUID **必须（SHALL）** 参照HL7 OID注册中心；否则，URI应该来自HL7的FHIR定义的特殊URI列表，或者它应该参照一些明确建立的系统定义。"
* identifier[idCardNumber].type.coding.system ^requirements = "需要明确说明符号定义的来源"
* identifier[idCardNumber].type.coding.version ^short = "系统的版本—如果相关的话"
* identifier[idCardNumber].type.coding.version ^definition = "选择此代码时使用的代码系统版本；请注意，一个维护良好的代码系统不需要版本报告，因为代码的意义在不同系统版本中是一致的；然而，不能始终保证这点，当不能保证意义一致时， **必须（SHALL）** 将版本信息也一并作交换。"
* identifier[idCardNumber].type.coding.version ^comment = "如果专门术语没有明确定义应该使用什么字串来识别代码系统的版本，建议使用版本正式发布的日期（用FHIR日期格式表示）作为版本日期。"
* identifier[idCardNumber].type.coding.code 1.. MS
* identifier[idCardNumber].type.coding.code = #NNxxx
* identifier[idCardNumber].type.coding.code ^short = "系统定义的语法之符号"
* identifier[idCardNumber].type.coding.code ^definition = "系统定义的语法之符号；符号可能是一个预先定义的代码，也可能是代码系统定义的语法中的表达式（如后组合配对／后组合式）。"
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
* identifier[passportNumber].type.coding ^definition = "由专门术语系统（terminology system）所定义之代码的参照"
* identifier[passportNumber].type.coding ^comment = "代码可以在列举清单（enumerations）或代码清单（code lists）中非常随意地定义，直至有非常正式的定义，例如：SNOMED CT—更多信息见HL7 v3核心原则（Core Principles）。编码的排序是未定义的因而 **必须没有（SHALL NOT）** 被用来推断意义。一般来说，最多只有一个编码值（coding values）会被标记为UserSelected = true。"
* identifier[passportNumber].type.coding ^requirements = "允许代码系统中的替代编码，以及翻译到其他编码系统。"
* identifier[passportNumber].type.coding.system 1.. MS
* identifier[passportNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[passportNumber].type.coding.system ^short = "专门术语系统（terminology system）的识别"
* identifier[passportNumber].type.coding.system ^definition = "定义代码中符号意义的代码系统识别"
* identifier[passportNumber].type.coding.system ^comment = "URI可以是一个OID（urn:oid:...）或一个UUID（urn:uuid:...）；OID和UUID **必须（SHALL）** 参照HL7 OID注册中心；否则，URI应该来自HL7的FHIR定义的特殊URI列表，或者它应该参照一些明确建立的系统定义。"
* identifier[passportNumber].type.coding.system ^requirements = "需要明确说明符号定义的来源"
* identifier[passportNumber].type.coding.version ^short = "系统的版本—如果相关的话"
* identifier[passportNumber].type.coding.version ^definition = "选择此代码时使用的代码系统版本；请注意，一个维护良好的代码系统不需要版本报告，因为代码的意义在不同系统版本中是一致的；然而，不能始终保证这点，当不能保证意义一致时， **必须（SHALL）** 将版本信息也一并作交换。"
* identifier[passportNumber].type.coding.version ^comment = "如果专门术语没有明确定义应该使用什么字串来识别代码系统的版本，建议使用版本正式发布的日期（用FHIR日期格式表示）作为版本日期。"
* identifier[passportNumber].type.coding.code 1.. MS
* identifier[passportNumber].type.coding.code = #PPN
* identifier[passportNumber].type.coding.code ^short = "系统定义的语法之符号"
* identifier[passportNumber].type.coding.code ^definition = "系统定义的语法之符号；符号可能是一个预先定义的代码，也可能是代码系统定义的语法中的表达式（如后组合配对／后组合式）。"
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
* identifier[residentNumber].type.coding ^definition = "由专门术语系统（terminology system）所定义之代码的参照"
* identifier[residentNumber].type.coding ^comment = "代码可以在列举清单（enumerations）或代码清单（code lists）中非常随意地定义，直至有非常正式的定义，例如：SNOMED CT—更多信息见HL7 v3核心原则（Core Principles）。编码的排序是未定义的因而 **必须没有（SHALL NOT）** 被用来推断意义。一般来说，最多只有一个编码值（coding values）会被标记为UserSelected = true。"
* identifier[residentNumber].type.coding ^requirements = "允许代码系统中的替代编码，以及翻译到其他编码系统。"
* identifier[residentNumber].type.coding.system 1.. MS
* identifier[residentNumber].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[residentNumber].type.coding.system ^short = "专门术语系统（terminology system）的识别"
* identifier[residentNumber].type.coding.system ^definition = "定义代码中符号意义的代码系统识别"
* identifier[residentNumber].type.coding.system ^comment = "URI可以是一个OID（urn:oid:...）或一个UUID（urn:uuid:...）；OID和UUID **必须（SHALL）** 参照HL7 OID注册中心；否则，URI应该来自HL7的FHIR定义的特殊URI列表，或者它应该参照一些明确建立的系统定义。"
* identifier[residentNumber].type.coding.system ^requirements = "需要明确说明符号定义的来源"
* identifier[residentNumber].type.coding.version ^short = "系统的版本—如果相关的话"
* identifier[residentNumber].type.coding.version ^definition = "选择此代码时使用的代码系统版本；请注意，一个维护良好的代码系统不需要版本报告，因为代码的意义在不同系统版本中是一致的；然而，不能始终保证这点，当不能保证意义一致时， **必须（SHALL）** 将版本信息也一并作交换。"
* identifier[residentNumber].type.coding.version ^comment = "如果专门术语没有明确定义应该使用什么字串来识别代码系统的版本，建议使用版本正式发布的日期（用FHIR日期格式表示）作为版本日期。"
* identifier[residentNumber].type.coding.code 1.. MS
* identifier[residentNumber].type.coding.code = #PRC
* identifier[residentNumber].type.coding.code ^short = "系统定义的语法之符号"
* identifier[residentNumber].type.coding.code ^definition = "系统定义的语法之符号；符号可能是一个预先定义的代码，也可能是代码系统定义的语法中的表达式（如后组合配对／后组合式）。"
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
* identifier[medicalRecord].type.coding ^definition = "由专门术语系统（terminology system）所定义之代码的参照"
* identifier[medicalRecord].type.coding ^comment = "代码可以在列举清单（enumerations）或代码清单（code lists）中非常随意地定义，直至有非常正式的定义，例如：SNOMED CT—更多信息见HL7 v3核心原则（Core Principles）。编码的排序是未定义的因而 **必须没有（SHALL NOT）** 被用来推断意义。一般来说，最多只有一个编码值（coding values）会被标记为UserSelected = true。"
* identifier[medicalRecord].type.coding ^requirements = "允许代码系统中的替代编码，以及翻译到其他编码系统。"
* identifier[medicalRecord].type.coding.system 1.. MS
* identifier[medicalRecord].type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier[medicalRecord].type.coding.system ^short = "专门术语系统（terminology system）的识别"
* identifier[medicalRecord].type.coding.system ^definition = "定义代码中符号意义的代码系统识别"
* identifier[medicalRecord].type.coding.system ^comment = "URI可以是一个OID（urn:oid:...）或一个UUID（urn:uuid:...）；OID和UUID **必须（SHALL）** 参照HL7 OID注册中心；否则，URI应该来自HL7的FHIR定义的特殊URI列表，或者它应该参照一些明确建立的系统定义。"
* identifier[medicalRecord].type.coding.system ^requirements = "需要明确说明符号定义的来源"
* identifier[medicalRecord].type.coding.version ^short = "系统的版本—如果相关的话"
* identifier[medicalRecord].type.coding.version ^definition = "选择此代码时使用的代码系统版本；请注意，一个维护良好的代码系统不需要版本报告，因为代码的意义在不同系统版本中是一致的；然而，不能始终保证这点，当不能保证意义一致时， **必须（SHALL）** 将版本信息也一并作交换。"
* identifier[medicalRecord].type.coding.version ^comment = "如果专门术语没有明确定义应该使用什么字串来识别代码系统的版本，建议使用版本正式发布的日期（用FHIR日期格式表示）作为版本日期。"
* identifier[medicalRecord].type.coding.code 1.. MS
* identifier[medicalRecord].type.coding.code = #MR
* identifier[medicalRecord].type.coding.code ^short = "系统定义的语法之符号"
* identifier[medicalRecord].type.coding.code ^definition = "系统定义的语法之符号；符号可能是一个预先定义的代码，也可能是代码系统定义的语法中的表达式（如后组合配对／后组合式）。"
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
* identifier[medicalRecord].system ^short = "身份识别码（identifier）的命名空间（namespace），可至[twTerminology](https://twcore.mohw.gov.tw/ts/namingsystem.jsp?status=active&amp;type=0)申请或查询命名系统。"
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
// * name ^slicing.discriminator[0].type = #pattern
// * name ^slicing.discriminator[=].path = "use"
// * name ^slicing.rules = #open
* name ^short = "病人的姓名"
* name ^definition = "个人名字"
* name ^comment = "一位病人可能有多个姓名，有不同的用途或适用期。对于动物来说，这个姓名是一个「HumanName」，它是人类指定和使用的，具有相同的模式。"
* name ^requirements = "需要能够追踪病人的多个姓名。例如：正式姓名及配偶姓名。 **必须（SHALL）** 总是提供姓名的完整拼法。"
* name 1..* MS 
* name.text 1..1 MS
* name.text ^short = "English full name, Patient’s full name in English" 
* name.text ^min = 0
* name.text ^maxLength = 100
* name.family 0..1 MS
* name.family ^short = "English surname, Patient's surname in English"
* name.family ^maxLength = 40
* name.given MS
* name.given ^min = 0
* name.given ^short = "English given name, Patient's given name in English"
* name.given ^maxLength = 40
* telecom MS
* gender 1..1 MS
* gender ^short = "Sex"
* birthDate 1.. MS
* birthDate ^short = "Date of Birth, The patient's date of birth"
* birthDate ^maxLength = 10 

 