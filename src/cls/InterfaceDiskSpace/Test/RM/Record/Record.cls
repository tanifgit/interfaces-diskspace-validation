/// RECORDMAP: Generated from RecordMap 'InterfaceDiskSpace.Test.RM.Record'
/// on 2016-01-24 at 14:10:26.854 [2016-01-24 12:10:26.854 UTC]
/// by user _SYSTEM
Class InterfaceDiskSpace.Test.RM.Record.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property ID As %String;

Property Age As %String;

Property DOB As %Date;

Property Color As %String;

Property Name As %String;

Property SSN As %String;

Property HomeCity As %String;

Property HomeState As %String;

Property HomeStreet As %String;

Property HomeZipCode As %String;

Property WorkCity As %String;

Property WorkState As %String;

Property WorkStreet As %String;

Property WorkZipCode As %String;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ID</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>DOB</Value>
</Value>
<Value name="5">
<Value>Color</Value>
</Value>
<Value name="6">
<Value>Name</Value>
</Value>
<Value name="7">
<Value>SSN</Value>
</Value>
<Value name="8">
<Value>HomeCity</Value>
</Value>
<Value name="9">
<Value>HomeState</Value>
</Value>
<Value name="10">
<Value>HomeStreet</Value>
</Value>
<Value name="11">
<Value>HomeZipCode</Value>
</Value>
<Value name="12">
<Value>WorkCity</Value>
</Value>
<Value name="13">
<Value>WorkState</Value>
</Value>
<Value name="14">
<Value>WorkStreet</Value>
</Value>
<Value name="15">
<Value>WorkZipCode</Value>
</Value>
<Value name="16">
<Value>Age</Value>
</Value>
</Data>
<DataLocation>^InterfaceDiskSpaceD85F.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^InterfaceDiskSpaceD85F.RecordD</IdLocation>
<IndexLocation>^InterfaceDiskSpaceD85F.RecordI</IndexLocation>
<StreamLocation>^InterfaceDiskSpaceD85F.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
