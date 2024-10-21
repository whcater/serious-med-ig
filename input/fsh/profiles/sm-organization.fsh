Profile: SmOrganization
Parent: Organization
Id: sm-organization
Title: "SmOrganization"
Description: "科室机构基本信息"
* . ^definition = "为实现某种形式的集体行动而形成的正式或非正式认可的一群人或机构的团体。包括公司、机构、企业、部门、社群团体、健康医护实务团体、付款人／保险公司等。"
* id ^short = "不重复的ID用以识别储存在特定FHIR Server中的Organization纪录，通常又称为逻辑性ID。"
* id ^comment = "一个resource使用新增操作（create operation）提交给服务器时，此resource没有id，它的id在resource被创建后由服务器分配/指定。"
* identifier 1.. MS
* identifier ^short = "用于指明跨多个不同系统的机构识别码"
* identifier ^requirements = "Organizations通常有多种识别码。有些机构保有数个，而大多数机构收集识别码用于跟其他机构交流有关此机构的信息。"
* identifier.id ^short = "唯一可识别ID，以供资料项目间相互参照。"
* identifier.id ^definition = "resource中资料项目的唯一ID（用于内部参照）。这可以是任何不含空格的字串。"
* identifier.extension ^short = "扩展字段"
* identifier.extension ^definition = "扩展字段"
* identifier.use MS
* identifier.use from http://hl7.org/fhir/ValueSet/identifier-use|4.0.1 (required)
* identifier.use ^short = "usual ｜ official ｜ temp ｜ secondary ｜ old （如果知道）"
* identifier.use ^definition = "这个唯一识别码（identifier）的用途"
* identifier.use ^comment = "应用程序可以假定一个识别码是永久的，除非它明确说它是暂时的。"
* identifier.use ^requirements = "允许从一组识别码中为特定的使用场景选择适当的识别码"
* identifier.use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* identifier.use ^binding.extension[=].valueString = "IdentifierUse"
* identifier.use ^binding.description = "如果已知，请说明此识别码的目的；应填入所绑定值集中的其中一个代码。"
* identifier.type only CodeableConcept
* identifier.type MS
* identifier.type from IdentifierType (extensible)
* identifier.type ^short = "机构识别码（identifier）的型别说明"
* identifier.type ^definition = "识别码的代码型别，用于决定特定目适用的识别码。"
* identifier.type ^comment = "这个资料项目只涉及识别码的一般类别。它 **必须没有（SHALL NOT）** 被用于与Identifier.system 1..1对应的代码。一些识别码可能由于常见的用法而属于多个类别。在系统是已知的情况下，型别是不必要的，因为型别总是系统定义的一部分。然而，系统经常需要处理系统不为人知的识别码。型别和系统之间不是1:1的关系，因为许多不同的系统有相同的型别。"
* identifier.type ^requirements = "允许使用者在不知道识别码系统的情况下利用识别码"
* identifier.type ^binding.description = "识别码的型别，用于决定特定目的所适用的识别码；应填入所绑定值集中的其中一个代码。"
* identifier.system MS
* identifier.system ^short = "机构识别码（identifier）的命名空间（namespace），可至Terminology Server查询命名系统。"
* identifier.system ^definition = "建立值的命名空间－即一个描述一组值的唯一URL"
* identifier.system ^comment = "Identifier.system总是区分大小写"
* identifier.system ^requirements = "有许多识别码的集合。为了进行两个识别码的对应，我们需要知道我们处理的是哪一组。系统指明了一个特定的唯一识别码集。"
* identifier.value 1.. MS
* identifier.value ^short = "唯一值"
* identifier.value ^definition = "识别码中通常与使用者有关的部分，在编码系统作用域内是唯一的。"
* identifier.value ^comment = "如果此值是一个完整的URI，那么此系统 **必须（SHALL）** 是urn:ietf:rfc:3986。此值的主要目的是为了可运算的对应。因此，为了比较的目的，它可能会被正规化（例如：去除不重要的空白、破折号等）。一个为人显示的格式化的值可以使用[Rendered Value](http://hl7.org/fhir/R4/extension-rendered-value.html)扩充来传达。除非对Identifier.system的了解使处理者确信不区分大小写的处理是安全的，否则Identifier.value应被视为区分大小写。"
* identifier.period ^short = "此机构识别码（identifier）的使用效期"
* identifier.period ^definition = "识别码有效／曾经有效使用的时段或期间"
* identifier.assigner only Reference(Organization)
* identifier.assigner ^short = "签发identifier的机构（可以只是文字表述）"
* identifier.assigner ^definition = "签发／管理识别码的机构"
* identifier.assigner ^comment = "Identifier.assigner可以省略.reference资料项目，只包含一个.display资料项目，反映指定机构的名称或其他文字表述信息。"
* active MS
* active ^short = "此机构的纪录是否仍在使用中"
* active ^definition = "此机构的纪录是否仍在使用中"
* active ^comment = "这个Active标记不是用来标记机构暂时关闭或正在建设中。反而应该是Organization的地点（Location）应该具有暂停状态。如果需要进一步详细说明暂停的原因，那么应该针对这个资料项目的提供一个扩展字段。\n\n这个资料项目被标记为修饰语／修饰用，因为它可用来标记resource是错误建立的。"
* active ^requirements = "需要一个标记表明此记录不再被使用，一般来说应会在使用者界面中隐藏此资料项目。"
* type ..1 MS
* type only CodeableConcept
* type from OrganizationType (example)
* type ^short = "机构的型别"
* type ^definition = "机构的型别"
* type ^comment = "机构可以是公司、病房、科室、临床团队、政府部门等。请注意，代码通常是机构型别的分类；在许多应用程序中，若代码是用来指明一个特定机构（例如：病房），而不是另一个相同型别的机构，那么这些算是识别码代码，而不是型别代码。\n\n当考虑多个型别是否合适时，你应该评估子机构是否是一个更合适的概念使用，因为不同的型别可能在不同子区域的机构。这最有可能用于型别值不相关（orthogonal values）的地方，像是一个宗教的、学术的和医学中心。\n\n我们期望一些行政管辖区设计此资料项目为可选填且基数设定为1。"
* type ^requirements = "需要能够追踪这是哪种机构－不同机构型别有不同的用途。"
* type ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* type ^binding.extension[=].valueString = "OrganizationType"
* type ^binding.description = "用于分类机构；可参考所绑定值集，但此值集只是针对这个栏位的一个可能值的范例，不预期也不鼓励使用者一定要使用此值集的代码。"
* name 1.. MS
* name ^short = "机构的名称"
* name ^definition = "与此机构相关名称"
* name ^comment = "如果一个机构改变名称，可以考虑把旧的名称放在别名（alias）资料项目中，这样仍然可以透过查询找到它。"
* name ^requirements = "需要使用名称作为机构的标签"
* alias ^short = "此机构目前或过去已知的其他（多个）名称"
* alias ^definition = "此机构目前或过去已知的其他（多个）名称"
* alias ^comment = "没有与别名／历史名称相关的日期，因为这不是为了追踪使用名称的时间，而是为了协助查询，以便旧名称仍然可以指明此机构。"
* alias ^requirements = "随著时间的推移，地点和机构经历了许多变化，可能会有不同的名称。\n\n对于查询而言，了解此机构以前的名称是非常有用的。"
* telecom MS
* telecom ^short = "此机构的详细联络方式。\norg-3：一个机构的通讯永远不可能是「家用」，意即不可能使用「home」。"
* telecom ^definition = "此机构的详细联络方式"
* telecom ^comment = "不能使用代码 「home」。请注意，这些联络人不是指受雇于此机构或代表此机构的人的详细联络方式，而是此机构本身的官方联络人。"
* telecom ^requirements = "此机构的联络人"
* telecom.id ^short = "唯一可识别ID，以供资料项目间相互参照。"
* telecom.id ^definition = "resource中资料项目的唯一ID（用于内部参照）。这可以是任何不含空格的字串。"
* telecom.extension ^short = "扩展字段"
* telecom.extension ^definition = "可用于表示不属于此资料项目基本定义的附加信息。为了扩充的使用安全和可管理，对扩充的定义和使用有一套严格的管理。尽管任何实作者都可以定义一个扩充，但作为扩充定义的一部分，有一套要求 **必须（SHALL）** 满足。"
* telecom.system MS
* telecom.system from http://hl7.org/fhir/ValueSet/contact-point-system|4.0.1 (required)
* telecom.system ^definition = "联络方式的通讯形式－需要什么通讯系统进行联络"
* telecom.system ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* telecom.system ^binding.extension[=].valueString = "ContactPointSystem"
* telecom.system ^binding.description = "应填入所绑定值集中的其中一个代码。"
* telecom.value MS
* telecom.value ^short = "实际的联络方式之细节"
* telecom.value ^definition = "实际的联络方式之细节，针对指定的通讯系统提供有意义的形式（电话号码或是电子邮件位址）。"
* telecom.value ^comment = "额外的文字资料，例如电话分机号码、或关于联络人的说明，有时也包括于此值。"
* telecom.value ^requirements = "需支援非严格格式控制之旧有号码"
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
* telecom.period ^short = "此联络方式的使用效期"
* telecom.period ^definition = "此联络方式的使用效期"
* address only Address
* address ^short = "此机构的地址。\norg-2：一个机构的地址永远不可能是「家用」，意即不可能使用「home」。"
* address ^definition = "此机构的地址"
* address ^comment = "机构可能有多个地址，有不同的用途或适用期。不使用代码「home」。"
* address ^requirements = "为了联络、计费或通报要求而可能需要追踪机构的地址"
* partOf only Reference(Organization)
* partOf ^short = "此机构属于哪个更高层次机构的一部分"
* partOf ^definition = "此机构属于哪个更高层次机构的一部分"
* partOf ^requirements = "需要能够追踪一个机构内的机构层次结构"
* partOf ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* partOf ^type.extension.valueBoolean = true
* contact ^short = "某一用途的机构联络方式"
* contact ^definition = "某一用途的机构联络方式"
* contact ^comment = "如果为同一个用途提供多个联络方式，则可有一个扩展字段用以决定哪一个优先联络。"
* contact ^requirements = "需要在更大的机构内追踪用的指定联络方式"
* contact.id ^short = "唯一可识别ID，以供资料项目间相互参照。"
* contact.id ^definition = "resource中资料项目的唯一ID（用于内部参照）。这可以是任何不含空格的字串。"
* contact.extension ^short = "扩展字段"
* contact.extension ^definition = "可用于表示不属于此资料项目基本定义的附加信息。为了扩充的使用安全和可管理，对扩充的定义和使用有一套严格的管理。尽管任何实作者都可以定义一个扩充，但作为扩充定义的一部分，有一套要求 **必须（SHALL）** 满足。"
* contact.extension ^comment = "无论使用或定义扩充的机构或管辖区，任何应用程序、专案或标准使用扩充都不背负任何污名（stigma）。使用扩充是允许FHIR规范为每个人保留一个核心的简易性。"
* contact.modifierExtension ^short = "此扩展字段可能会完全修正或改变其他资料项目的意涵，需特别留意。"
* contact.modifierExtension ^definition = "可以用来表示不属于资料项目的基本定义的附加信息，并且修改对它所内嵌（contained）的资料项目的理解和／或对包含资料项目之后续使用的理解。通常，修饰用的资料项目提供否定或限定。为了使扩充的使用安全和可管理，对扩充的定义和使用有一套严格的管理。尽管任何实作者都可以定义一个扩充，但作为扩充定义的一部分，有一组要求 **必须（SHALL）** 满足。处理resource的应用程序被要求检查修饰用的扩充资料项目。\n\n修饰用的扩充资料项目 **必须没有（SHALL NOT）** 改变resource或DomainResource上任何资料项目的含义（包括不能改变modifierExtension本身的含义）。"
* contact.modifierExtension ^comment = "无论使用或定义扩充的机构或管辖区，任何应用程序、专案或标准使用扩充都不背负任何污名（stigma）。使用扩充是允许FHIR规范为每个人保留一个核心的简易性。"
* contact.modifierExtension ^requirements = "修饰用的资料项目扩充将不能安全地忽略的扩充与绝大多数可以安全地忽略的扩充明确区分开来。透过消除禁止实作者扩充存在的需求来促进可互操作性。更多讯息，请参见修饰用的资料项目扩充之定义。"
* contact.purpose only CodeableConcept
* contact.purpose from ContactEntityType (extensible)
* contact.purpose ^short = "联络的型别"
* contact.purpose ^definition = "表明可联络到此联络人的联络方式之用途"
* contact.purpose ^requirements = "需要对多个联络人进行区分"
* contact.purpose ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* contact.purpose ^binding.extension[=].valueString = "ContactPartyType"
* contact.purpose ^binding.description = "你所联络之联络人的联络方式用途；应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* contact.name ^short = "联络人名字"
* contact.name ^definition = "联络人名字"
* contact.name ^requirements = "需能透过名字来追综此联络人"
* contact.telecom ^short = "联络人的详细联络方式（例如：电话、电子邮件等）。"
* contact.telecom ^definition = "可与此人联络的详细联络方式（如电话或电子邮件地址等）"
* contact.telecom ^requirements = "人们有（主要）方式与他们联络，如电话、电子邮件。"
* contact.address only Address
* contact.address ^short = "联络人的到访或邮政地址"
* contact.address ^definition = "可到访及邮寄联络人的地址"
* contact.address ^requirements = "为了联络、计费或通报要求而可能需要追踪机构的地址"
* endpoint ^short = "存取此Organization的技术服务的终端（endpoints）"
* endpoint ^definition = "存取此Organization的技术服务的终端（endpoints）"
* endpoint ^requirements = "机构有多个提供各种服务的系统，需要能够定义技术连接的细节，如何连接到这些系统，以及为了什么目的。"