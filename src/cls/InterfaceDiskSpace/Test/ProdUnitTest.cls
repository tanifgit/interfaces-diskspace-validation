/// A unit test class to test the test production for testing the InterfaceDiskSpace framework. 
/// <br>See <class>InterfaceDiskSpace.Main</class> for details on the framework and/or <class>InterfaceDiskSpace.Test.Prod.TestProduction</class> about the test production
/// <br>It copies the sample \dev\ensemble\RecordMap\RecordMap_Delimited_Input2.txt file and puts it in the Inbound folder of the BS
Class InterfaceDiskSpace.Test.ProdUnitTest Extends %UnitTest.TestProduction
{

/// Class name of the production.  It must contain the production class name.
Parameter PRODUCTION = "InterfaceDiskSpace.Test.Prod.TestProduction";

Parameter InDir = "C:\Temp\EnsInterfaceDiskSpace\In";

/// Code to run right after the production is started. Used, for example, to call a method that initiates the test.
/// If an error status is returned, the test will be aborted and failed and the production will be stopped.
/// So if a non fatal error occurs, you may invoke ..LogErrors(status,"OnAfterProductionStart()") and return $$$OK.
Method OnAfterProductionStart() As %Status
{
	Set returnCode = ""
	Set from = $system.Util.InstallDirectory()_"\dev\ensemble\RecordMap\RecordMap_Delimited_Input2.txt"
	Set copied = ##class(%File).CopyFile(from,..#InDir,,.returnCode)
	
	If 'copied {
		Quit ..Error("Error copying file from "_from_" to "_..#InDir_" return code: "_returnCode)
	}
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
	Set created = ##class(%File).CreateDirectoryChain(..#InDir,.returnCode)
	
	If 'created {
		Quit ..Error("Error creating directory "_..#InDir_" return code: "_returnCode)
	}
	
	Set status = ..ChangeSetting(..#PRODUCTION,"FromSystemA","FilePath",..#InDir,1)
	
	Quit status
}

}
