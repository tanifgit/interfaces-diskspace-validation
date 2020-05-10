/// Used to persist data usage for the Ensemble interface testing. See <class>InterfaceDiskSpace.Main</class> for details and <class>InterfaceDiskSpace.DataLog</class> that uses this one.
Class InterfaceDiskSpace.DataCapture Extends %Persistent
{

/// The time of the capture
Property CaptureTime As %TimeStamp;

/// Database size used
Property DBSize As %Float;

/// Journal file size used
Property JournalSize As %Float;

/// The space used by the Journal records
Property JournalSpaceUsed As %Float;

/// An array detailing the size of each global (the Key in the array is the global name and the value is the size)
Property GlobalSizes As array Of %Float;

/// An array detailing the size each global takes up in the Journal (the Key in the array is the global name and the value is the size)
Property JournalProfileSizes As array Of %Float;

Storage Default
{
<Data name="DataCaptureDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CaptureTime</Value>
</Value>
<Value name="3">
<Value>DBSize</Value>
</Value>
<Value name="4">
<Value>JournalSize</Value>
</Value>
<Value name="5">
<Value>Stage</Value>
</Value>
<Value name="6">
<Value>JournalSpaceUsed</Value>
</Value>
</Data>
<Data name="GlobalSizes">
<Attribute>GlobalSizes</Attribute>
<Structure>subnode</Structure>
<Subscript>"GlobalSizes"</Subscript>
</Data>
<Data name="JournalProfileSizes">
<Attribute>JournalProfileSizes</Attribute>
<Structure>subnode</Structure>
<Subscript>"JournalProfileSizes"</Subscript>
</Data>
<DataLocation>^InterfaceDiskS13C5.DataCaptureD</DataLocation>
<DefaultData>DataCaptureDefaultData</DefaultData>
<IdLocation>^InterfaceDiskS13C5.DataCaptureD</IdLocation>
<IndexLocation>^InterfaceDiskS13C5.DataCaptureI</IndexLocation>
<StreamLocation>^InterfaceDiskS13C5.DataCaptureS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

Property Stage As %String;

}
