<!---

	Filemanager Coldfusion connector
	
	init.cfm
	
	@license MIT License
	@author James Gibson <james.gibson (at) liquifusion (dot) com>
	@copyright Author

--->
<cffunction name="init" access="public" output="false" returntype="any">
	<cfargument name="config" type="struct" required="true" />
	<cfscript>
		var loc = {};
		variables.class = {};
		
		variables.class.root = REReplaceNoCase(GetBaseTemplatePath(), "[/\\]connectors[/\\]cfm[/\\]filemanager.cfm", "", "all");
		
		variables.class.config = arguments.config;
		variables.class.language = $loadLanguage(language=arguments.config.language);
		variables.class.properties = {
			  "Date Created" = JavaCast("null", 0)
			, "Date Modified" = JavaCast("null", 0)
			, "Height" = JavaCast("null", 0)
			, "Width" = JavaCast("null", 0)
			, "Size" = JavaCast("null", 0)
		};
		
		variables.class.plugins = [];
		
		for (loc.i = 1; loc.i lte ArrayLen(arguments.config.plugins); loc.i++)
			variables.class.plugins[loc.i] = $createObjectFromRoot("plugins",  arguments.config.plugins[loc.i], "init");
	</cfscript>
	<cfreturn this />
</cffunction>