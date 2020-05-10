/// A unit test class to test the test production for testing the InterfaceDiskSpace framework. 
/// <br>See <class>InterfaceDiskSpace.Main</class> for details on the framework and/or <class>InterfaceDiskSpace.Test.Prod.TestProduction</class> about the test production
/// <br>It copies the sample \dev\ensemble\RecordMap\RecordMap_Delimited_Input2.txt file and puts it in the Inbound folder of the BS
Class InterfaceDiskSpace.Test.ProdUnitTest Extends %UnitTest.TestProduction
{

/// Class name of the production.  It must contain the production class name.
Parameter PRODUCTION = "InterfaceDiskSpace.Test.Prod.TestProduction";

Parameter InDir = "test_data_in";

/// Code to run right after the production is started. Used, for example, to call a method that initiates the test.
/// If an error status is returned, the test will be aborted and failed and the production will be stopped.
/// So if a non fatal error occurs, you may invoke ..LogErrors(status,"OnAfterProductionStart()") and return $$$OK.
Method OnAfterProductionStart() As %Status
{
	Set returnCode = ""

	set xdata = ##class(%Dictionary.XDataDefinition).%OpenId(..%ClassName(1)_"||SampleData")

	set file = ##class(%Stream.FileCharacter).%New()
	set filename = ..#InDir_"/RecordMap_Delimited_Input.txt"
	
	set file.filename = filename

	do file.CopyFrom(xdata)

	set status = file.%Save()

	Quit $$$OK
}

/// Code to run right before the production is started.  This is useful to:<br>
/// <ul><li>Adjust settings - see method <method>ChangeSetting</method>.</li>
/// <li>Create directories - see method <method>CreateMainDirTree</method>.</li>
/// <li>Copy files - see method <method>CopyFile</method>.</li>
/// <li>Create credentials required by the production - see method <method>CreateCredentials</method>.</li>
/// <li>etc.</li></ul>
/// If an error status is returned, the test will be aborted and failed.
/// So if a non fatal error occurs, you may invoke ..LogErrors(status,"OnBeforeProductionStart()") and return $$$OK.
Method OnBeforeProductionStart() As %Status
{
	Set returnCode = ""
	Set created = ##class(%File).CreateDirectory(..#InDir,.returnCode)
	
	If 'created {
		Quit ..Error("Error creating directory "_..#InDir_" return code: "_returnCode)
	}
	
	Set status = ..ChangeSetting(..#PRODUCTION,"FromSystemA","FilePath",..#InDir,1)
	
	Quit status
}

XData SampleData
{
1;83;06/05/1926;Black;Schaefer,Joe R.;489-45-2355;Hialeah;CT;5162 Second Blvd;13993;Newton;ND;683 Madison Blvd;72995
2;10;08/27/1999;Red;King,Janice F.;666-19-4636;Bensonhurst;NV;8189 Clinton Place;43325;Albany;TX;6342 Washington Place;59439
3;44;02/26/1966;Yellow;Bachman,Juanita K.;859-55-1247;Hialeah;WI;5986 Maple Drive;59144;Pueblo;WV;9605 Main Place;63682
4;74;05/31/1935;Blue;Ott,Tara E.;602-19-1138;Queensbury;IA;7584 Elm Drive;64538;Oak Creek;MI;2820 Washington Avenue;41416
5;48;04/23/1962;;Ingleman,George P.;194-12-8888;Gansevoort;NY;7873 Elm Court;87774;Youngstown;CA;2315 Washington Drive;72281
6;31;09/01/1978;Black;Hills,Maureen W.;562-22-8380;Larchmont;SD;6293 Franklin Blvd;26493;Larchmont;ID;245 Ash Court;45746
7;12;01/13/1998;Yellow;Hammel,Angelo K.;855-36-7306;Fargo;LA;3282 Clinton Street;85268;Zanesville;AL;6420 Washington Court;24738
8;0;11/30/2009;;Vonnegut,Quentin L.;685-19-6558;Newton;MS;8078 Oak Blvd;65764;Jackson;ME;4574 Washington Court;78364
9;65;03/12/1945;Black;Presley,Thelma J.;740-41-9621;Ukiah;SC;905 Oak Drive;10824;Washington;MN;3991 Oak Place;42256
10;44;01/09/1966;Yellow;Xerxes,Robert L.;815-19-8707;Fargo;MT;5027 Ash Street;11528;Washington;NE;6117 Second Blvd;79763
}

}
