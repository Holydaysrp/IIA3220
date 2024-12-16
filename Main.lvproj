<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="24008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">24.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="VIs" Type="Folder">
			<Item Name="Controls" Type="Folder">
				<Item Name="CaseControl.ctl" Type="VI" URL="../VIs/Controls/CaseControl.ctl"/>
				<Item Name="PayloadCluster.ctl" Type="VI" URL="../VIs/Controls/PayloadCluster.ctl"/>
				<Item Name="SensorDataCluster.ctl" Type="VI" URL="../VIs/Controls/SensorDataCluster.ctl"/>
			</Item>
			<Item Name="HTTPSMQTT.vi" Type="VI" URL="../VIs/HTTPSMQTT.vi"/>
			<Item Name="PayloadData_ToCluster.vi" Type="VI" URL="../VIs/PayloadData_ToCluster.vi"/>
			<Item Name="PayloadToJSON.vi" Type="VI" URL="../VIs/PayloadToJSON.vi"/>
			<Item Name="PID.vi" Type="VI" URL="../VIs/PID.vi"/>
			<Item Name="Test_Connection.vi" Type="VI" URL="../VIs/Test_Connection.vi"/>
			<Item Name="Test_Connection_2.vi" Type="VI" URL="../VIs/Test_Connection_2.vi"/>
			<Item Name="TestConnection_3.vi" Type="VI" URL="../VIs/TestConnection_3.vi"/>
			<Item Name="UploadKVPair.vi" Type="VI" URL="../VIs/UploadKVPair.vi"/>
		</Item>
		<Item Name="Arduino" Type="Folder">
			<Item Name="Main_V2.ino" Type="Document" URL="../Arduino/Main_V2/Main_V2.ino"/>
		</Item>
		<Item Name="Icon" Type="Folder">
			<Item Name="ProgramIcon.ico" Type="Document" URL="../Icon/ProgramIcon.ico"/>
		</Item>
		<Item Name="ControlApplication.vi" Type="VI" URL="../VIs/ControlApplication.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Acquire Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Acquire Semaphore.vi"/>
				<Item Name="AddNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/AddNamedSemaphorePrefix.vi"/>
				<Item Name="Assert Array Dimension Sizes.vim" Type="VI" URL="/&lt;vilib&gt;/Utility/TypeAssert/Assert Array Dimension Sizes.vim"/>
				<Item Name="CircularBuffer.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/Advanced Structures/Circular Buffers/CircularBuffer.lvlib"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Connection.TCP-TLS.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/MQTT Secured TCP Connection/Connection.SecuredTCP/Connection.TCP-TLS.lvclass"/>
				<Item Name="Connection_GOSPL.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/Connection/Connection/Connection_GOSPL.lvlib"/>
				<Item Name="Default MQTT Packet (Empty).vi" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/MQTT Control Packets/Control Packets/ControlPacket/Default MQTT Packet (Empty).vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Get Local UTC Offset.vi" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/Epoch Date &amp; Time/Get Local UTC Offset.vi"/>
				<Item Name="Get Semaphore Status.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Get Semaphore Status.vi"/>
				<Item Name="GetNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/GetNamedSemaphorePrefix.vi"/>
				<Item Name="LVDateTimeRec.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVDateTimeRec.ctl"/>
				<Item Name="MD5Checksum core.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum core.vi"/>
				<Item Name="MD5Checksum format message-digest.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum format message-digest.vi"/>
				<Item Name="MD5Checksum pad.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum pad.vi"/>
				<Item Name="MD5Checksum string.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/MD5Checksum.llb/MD5Checksum string.vi"/>
				<Item Name="MQTT Base.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/MQTT Connection/MQTT_Base/MQTT Base.lvlib"/>
				<Item Name="MQTT Client.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/MQTT Client/MQTT Client.lvlib"/>
				<Item Name="MQTT_Connection.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/MQTT Connection/MQTT_Connection/MQTT_Connection.lvlib"/>
				<Item Name="MQTT_Control_Packets.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/MQTT Control Packets/Control Packets/MQTT_Control_Packets.lvlib"/>
				<Item Name="MQTT_TCP.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/MQTT TCP Connection/MQTT_TCP/MQTT_TCP.lvlib"/>
				<Item Name="Not A Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Not A Semaphore.vi"/>
				<Item Name="Obtain Semaphore Reference.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Obtain Semaphore Reference.vi"/>
				<Item Name="OpenDescriptor.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/Data Manipulation/TypeDescriptor/OpenDescriptor.lvlib"/>
				<Item Name="OpenSerializer.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/OpenSerializer/OpenSerializer.lvlib"/>
				<Item Name="OpenVariant.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/Data Manipulation/Variant/OpenVariant.lvlib"/>
				<Item Name="Release Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Release Semaphore.vi"/>
				<Item Name="RemoveNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/RemoveNamedSemaphorePrefix.vi"/>
				<Item Name="Semaphore RefNum" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Semaphore RefNum"/>
				<Item Name="Semaphore Refnum Core.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Semaphore Refnum Core.ctl"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="Timestamp to ISO8601 UTC DateTime.vi" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/Epoch Date &amp; Time/formatter.iso8601/Timestamp to ISO8601 UTC DateTime.vi"/>
				<Item Name="Trim Whitespace One-Sided.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace One-Sided.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="UTC Offsets -- enum.ctl" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/Epoch Date &amp; Time/UTC Offsets -- enum.ctl"/>
				<Item Name="Validate Semaphore Size.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Validate Semaphore Size.vi"/>
				<Item Name="VariantType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/VariantDataType/VariantType.lvlib"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Path To Command Line String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Path To Command Line String.vi"/>
				<Item Name="LabVIEWHTTPClient.lvlib" Type="Library" URL="/&lt;vilib&gt;/httpClient/LabVIEWHTTPClient.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="PathToUNIXPathString.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/CFURL.llb/PathToUNIXPathString.vi"/>
				<Item Name="Connection.TCP_GOSPL.lvlib" Type="Library" URL="/&lt;vilib&gt;/LabVIEW Open Source Project/Connection/Connection.TCP/Connection.TCP_GOSPL.lvlib"/>
				<Item Name="MQTT Server.lvlib" Type="Library" URL="/&lt;vilib&gt;/G Open Source Project for LabVIEW/MQTT Broker/MQTT Server.lvlib"/>
				<Item Name="NI_PID_pid.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/control/pid/NI_PID_pid.lvlib"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Control Application" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{D00444E7-D41E-4175-AD68-2F2D85FFC69B}</Property>
				<Property Name="App_INI_GUID" Type="Str">{EF79FA09-AB77-47EB-A490-A0270DA421D5}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="App_serverType" Type="Int">0</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{38032EA7-CA11-46DC-BE81-A42DC813F1E8}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Control Application</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Control Application</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{05A83446-BFC7-4C99-9F26-A5F240A39B20}</Property>
				<Property Name="Bld_version.build" Type="Int">4</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">CustomerAdmin_Application.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Control Application/CustomerAdmin_Application.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Control Application/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Exe_iconItemID" Type="Ref">/My Computer/Icon/ProgramIcon.ico</Property>
				<Property Name="Source[0].itemID" Type="Str">{9A0FD012-B960-4254-8608-397493910F97}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/ControlApplication.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[2].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/VIs</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">Container</Property>
				<Property Name="Source[3].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/Icon/ProgramIcon.ico</Property>
				<Property Name="Source[3].sourceInclusion" Type="Str">Include</Property>
				<Property Name="SourceCount" Type="Int">4</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Control Application</Property>
				<Property Name="TgtF_internalName" Type="Str">Control Application</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2024 </Property>
				<Property Name="TgtF_productName" Type="Str">Control Application</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{D59FF423-CC95-425C-9642-D547E1F82183}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">CustomerAdmin_Application.exe</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
