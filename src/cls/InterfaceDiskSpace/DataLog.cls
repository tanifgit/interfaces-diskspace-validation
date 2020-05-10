/// Used to persist data usage for the Ensemble interface testing. See <class>InterfaceDiskSpace.Main</class> for details.
Class InterfaceDiskSpace.DataLog Extends %Persistent
{

/// Data captured before the test run in order to compare later
Property BeforeRunData As InterfaceDiskSpace.DataCapture;

/// Data captured after the test run to calculate the sizing used for the test
Property AfterRunData As InterfaceDiskSpace.DataCapture;

/// Data captured after purge in order to verify everything was purged
Property AfterPurgeData As InterfaceDiskSpace.DataCapture;

Storage Default
{
<Data name="DataLogDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>BeforeRunData</Value>
</Value>
<Value name="3">
<Value>AfterRunData</Value>
</Value>
<Value name="4">
<Value>AfterPurgeData</Value>
</Value>
</Data>
<DataLocation>^InterfaceDiskSpace.DataLogD</DataLocation>
<DefaultData>DataLogDefaultData</DefaultData>
<IdLocation>^InterfaceDiskSpace.DataLogD</IdLocation>
<IndexLocation>^InterfaceDiskSpace.DataLogI</IndexLocation>
<StreamLocation>^InterfaceDiskSpace.DataLogS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
