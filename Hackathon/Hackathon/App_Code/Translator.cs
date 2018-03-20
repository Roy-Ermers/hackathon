using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Json;
using System.IO;

public enum Language
{
	Dutch = 0,
	English = 1
}
/// <summary>
/// Summary description for Translator
/// </summary>
public static class Translator
{
	private static JsonValue Data = JsonObject.Parse(File.ReadAllText(HttpContext.Current.Server.MapPath("~") + @"/App_Code/Languages/translation.json"));
	public static string Translate(string name, Language language)
	{
		string lang = language == Language.Dutch ? "dutch" : "english";
		try
		{
			return Data[lang][name].ReadAs<string>();
		}
		catch
		{
			return "<h1 style='color: red; font-size: 48px;'>LANG_ERROR</h1>";
		}
	}
}