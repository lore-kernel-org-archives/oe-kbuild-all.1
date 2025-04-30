Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E67617CA17
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028575; cv=fail; b=CFgPIVLcL2V8uIcVGNSNKJT5FkxLkGycQOLxavLU5X1qLZMCKCclJTX1YTOzXyeIIYuR1TzuJeDsjGSLA5v0p1vrOBEDNtopKi8la4FmqWxG4Y2saMfXIcX0IKhBqrf6gtc/A7PjRHQrt6CaUExsylfhk6RVM01IEoOJXSv/aVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028575; c=relaxed/simple;
	bh=BxBHi55rD1UDnTsoPLc5JBoHQVRhc9cOk2ZMPbNdQog=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OBf9D6CSA3ha4K0ioJpWLlE1okbQxxf37NEWxWAbyagYZ//j6pFRy1aiZoG8ShdvUPUS3zGOl17kXqPB90E3+fMQIrhHTMOsOUiYSuaR5mEXzAY8VvHALTA+7eIsxelGEh7RZ7KADsUXmKOrykYA73ZbHALVzD6TmGi2dHPz+9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J8VtF2oH; arc=fail smtp.client-ip=40.107.223.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J8VtF2oH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fe8o+EPaONsg4PRDwcOcMo0vHcH4105N9yhB671RpsCGlD8uLX6j4DPvfkWVbqAsOF9kpbwWZmuAb0Vt+rVwGcloMOcUDK2kTHp8R4mD9tNMhLtcqPqSlewxfM4FirZKBjt911JZlkrUjaDA7t0k7FX1r5z+Ng8hM671+3mv3cgzLYTMdVhXKsicmkvzolZz+mAseuPpze4tFSAYLMYoRXC3aj8fKUuJQlfqEKheTYA4Ft+Jm4rG5NY4WeL5gIthrTOMteqF9p7dtcGRG7Iz80xxKaWa/CRTxXteRRZo18yyhnxxXm+nwalQwz5LFw2Rimq97m+MNx/T7x7RKssBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxBHi55rD1UDnTsoPLc5JBoHQVRhc9cOk2ZMPbNdQog=;
 b=yW1P1HoXr0fDM9q7kVD49JKqj0lKrqqzE6kOspC0K1V5YjRK6IFgViF4RGVHQ2Rv98dqlt6xwCbwM4jDXFWxxTdMjfaTIM9kAvv5C6m4WBAVRPaz9zGMWrCxG+Z00mKHaOeU9jIQLr6wiDRCQMqdLtDIfEpNgZ1T0tuMzDaGFUJbmgf57uOWyDORT/OL8YdhfuBnx2ZmDUIbZM9OQddxQWg1/sn2TaOS+pxS8zaO35Wb1P21aNa77ISRPGP3wGxNdMeHk+TRGZEhvdaANoWVfJhqfdY1DreHh2mkyepEd8hV1YQwQsMn06kMkiFhAItm9EywavVTDPPoPAI92onuag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxBHi55rD1UDnTsoPLc5JBoHQVRhc9cOk2ZMPbNdQog=;
 b=J8VtF2oHjEjC32yCUEPr13FoSM1DNDvVJ+Wr3ZwP7UrLGDdYOS65CQo8C7XHNty8WgXe+7ATlqsZddM17xx2ifOfpcmS8PyIPO2rWaq6SnS6xiqLFvytlzDPhH5X8VnULfE8bqqu5RFB4rVbSft+CfIu68KZLuhWhswumDNVkEKmi5FciI+zSUPr8ylcUAjTrLQkjacbqblbSvosJ2udkK/1WvVHKUHKGoH0LKbIaGhvBhxDG9/rgQbJMc5kb9nTSBia6iaiJqk2U9oxaRZ+2Wo64/zfBEPQRCif+wpb436XtfmPOQfpTXUmaXvmZ+OxrA7v7LNwvXgyosbpX1wTlw==
Received: from PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 by DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.31; Wed, 30 Apr 2025 15:56:07 +0000
Received: from PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6]) by PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6%5]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 15:56:07 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>, kernel
 test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede
	<hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>
Subject: RE: [pdx86-platform-drivers-x86:review-ilpo-next 59/60]
 drivers/platform/mellanox/nvsw-sn2201.c:1303:14: warning: argument 1 null
 where non-null expected
Thread-Topic: [pdx86-platform-drivers-x86:review-ilpo-next 59/60]
 drivers/platform/mellanox/nvsw-sn2201.c:1303:14: warning: argument 1 null
 where non-null expected
Thread-Index: AQHbuKloAvX0C+tjZ0+luTWyz1z+QrO6VNsAgAIKEUA=
Date: Wed, 30 Apr 2025 15:56:07 +0000
Message-ID:
 <PH7PR12MB6668F5C045FE55E86742FB91AF832@PH7PR12MB6668.namprd12.prod.outlook.com>
References: <202504290944.hOoFRFoq-lkp@intel.com>
 <6533a563-0d8f-9703-3887-24d28d889652@linux.intel.com>
In-Reply-To: <6533a563-0d8f-9703-3887-24d28d889652@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6668:EE_|DM3PR12MB9416:EE_
x-ms-office365-filtering-correlation-id: b5270cfc-4503-4f9d-388c-08dd87ff8518
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TFVlbDE1NjhBV2tkeldwWWRkNVU0VFJ2WnBpMUhtQi9ZZWhpQ3hqN212TTYw?=
 =?utf-8?B?QWk3bzFyN3pKQk9qdHljOHMwd1VwRHlDYkI2ZVZXNldpUGdBU1NPdmxZN1ZU?=
 =?utf-8?B?U3Jyc0NMRkpVSXFlaG82aEg2akpxWExQcllOc1ljeVNGWXlRZ2NyMCs5b2Y5?=
 =?utf-8?B?WDZmbUJtYjBKR0ZCdEI4QzdLRTlJKzVnd1dHNWk1aUkvRmliYmRIZTMvdnhE?=
 =?utf-8?B?L0lUK1BkcGU2NCt2VDJjY0lmR3BieHB6R2VmM3c5eDNoWnlSdnZTOVVZcitD?=
 =?utf-8?B?M1pIVUU4UHhJZmZKTVc2cFZSVFN2UHdzT1lpTzlpNXNXLzloanJlM2lHYWJm?=
 =?utf-8?B?SFJTOEQxdUdlMCtpVnRvb1ZoNWtkRXRmaXNNQkwrUkZOMElDQlo3UG44M0R0?=
 =?utf-8?B?LzFBL2lOYjByMWpXb2U2MEg4ZHJkNFBBVnNTYlV2bjRYYmdkaUdrby92cGZt?=
 =?utf-8?B?WlBrZUMzK01QSHA0Uy82bFR3RjBIZkJzYk9jUTd4bzVhajM1TlVnSklWOE9z?=
 =?utf-8?B?blRzd2YxQ2FIY0tDUEVOdjJwSkNyby8wdGNOMXk0K093bGw1L0txd20yNTB2?=
 =?utf-8?B?WWN0UTZKYzF1RU5icGRSbHBnWnRKekN2QkpuZzBlTEEyS09mNDBHT0VRUVpG?=
 =?utf-8?B?dnorVFVrcmp6bmZPa25Xc1ZPeTVTWVg3Qm85MXR3M0tmMmlUQ3lidWc1bXh3?=
 =?utf-8?B?SWFCU1NZZ2xKMTVXUWRqUzdsd2pPQVZiSitTRXlhK3BZWTkxU3BtdFVSaVZL?=
 =?utf-8?B?ZUV2ZXZhVjMwNDdKUHVKRS9PdzZ4V0hEMExlYlh5a2lQeTdJZWVXVkxreFRN?=
 =?utf-8?B?N01JRGYzQ056YmhTZmRIUXdpalZld2NLaWI1TllVY20rUmpjOVdNUllEUzBY?=
 =?utf-8?B?M0F1cW9uayt0T1pZSEYxMXFTZE5rSHdVSExENGptUzI3Q29tRWQ0am41b2FI?=
 =?utf-8?B?UmM3RnZDODdzTWtSVEsyQXpCSXhmRkpES0JZU0F0SGV1WUNyWm9DZG9vek4v?=
 =?utf-8?B?SnBTTis3b0x6MVQwMHRnZklEN24zVEZZeUF1VFNQazZ0OFEyQjZObEpFZEhY?=
 =?utf-8?B?WU9uUGN3WmxOUk8yWDF5UldndDFON0VSNm12aWxZa2c3ellUUE9xSC9sU0Jp?=
 =?utf-8?B?dCtCa3VxcTNvcVhRRllKQThVcXZGdkNGZ3BITFhac2xvOERPVlJzd1N0OFpl?=
 =?utf-8?B?Y2paNUhoSTlMeXFtWmREZW9mNm53MTlDZklKOUdmS1YxWlhBWXd0dUZvWnBh?=
 =?utf-8?B?OE4zVUxubUxYVlJsNzNQNVJvRlBjYUVzUWF2cnVMZHF2dW9uZUFRZGJDQWtG?=
 =?utf-8?B?SklsTmU0YW9yeUVjUTJETjlkUDkzTndqS043MVBYVjF3YktIbUxGV291bHRa?=
 =?utf-8?B?K0EveCtDRTFVRTR2bTRrR0w0RURIVW5Hei9rYlFkZ1VkdThOdDR1empkbWlJ?=
 =?utf-8?B?bS9IaW8vWk1SY3lDNTBMMlhpcnRuM2FDbzNSdFRxYmx3VHN5M2loZGJPanFp?=
 =?utf-8?B?MjcraDBJQ09kTXZTVVIvRXRxVUVnRlg4ZzFsUmMzWExwaWkrUllLMlNMOWxC?=
 =?utf-8?B?QUpPKzhvK1IxSDI5eWl0Uys3WGFpRGlYdFF6VTJib3RONzNYb204NW0yc29x?=
 =?utf-8?B?K0RMa1MyMXk0Ykw2TDQxbEJWY0RIR0wrdlcvbGVQZzA5QWNzbTVjc3gyS1FS?=
 =?utf-8?B?dENScXhTU0tMZnRYUDdmMGxDN0J2WUYwWTlTak9pdDRDdThnaG1nS21TekxJ?=
 =?utf-8?B?YkczeGRXeWYybDYxY3NYelkzV0NycC91Uy92S1lsTmhReTV3Y29UTk9YRVBs?=
 =?utf-8?B?a3Z0T1pqTnBVZHpQVnd0YnhHVXNEY212c3lDVHdEU1Z3TFRWR2tOWjFDdmlD?=
 =?utf-8?B?YnFJYmd1RmdhL3BJYUplTGJSZjdxS1Ryd0Zib2h6a2EraUZWS1o0N0F6WG9r?=
 =?utf-8?Q?doVQr6eNZwA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajZNTXcxNXJmWEdxMmhSRWFWMVk0WXlRc1J1N204VnlsNWVUUkllc0hxUVZu?=
 =?utf-8?B?blVKVnV0cnk4WG40WWM3S1BNanhrMjc4alJUdU5tcHNyL3NubUFUaUVWVjdj?=
 =?utf-8?B?N0hKM0g4UkY1WktWbUtYd3pRYWdRZHBtM0Y0WmhFU2d0aGJDM0xRQlI3d0JL?=
 =?utf-8?B?ZnNobVA1cWh0a2I5d3RyZnZ5OUprM3NYS3BpelY2QldkcnFraVoyUTh2bmpi?=
 =?utf-8?B?OUQ5ZmhkWXk0NGc2UlI1RS9RMDllMjdVTjl6cUVFNGwxUWpNdVJRWEM3QTNs?=
 =?utf-8?B?emIxYlBRNEZEeVZCL3I4enJyOUlPYWZiK2o5b1NPM216dm80MlZiZ2RJWDhS?=
 =?utf-8?B?MDFFY0lUS3BRcTluVmxPSzFuc0hVZHY2RHNsSUtuVnZIVXphVEs2QzVBVDN1?=
 =?utf-8?B?a0I3RC9rVWVkeWlkSlN3Y2VHOTFDMnhmTjcvWDhjMFBzSWdQc2hZamQ0TVBt?=
 =?utf-8?B?WFp5Skt3ams1bmpxYmxwSTJiaFk3YnFTZHNQUFRxTzYvcU5pMTM5UkZmZTZt?=
 =?utf-8?B?Y3ZQTlJmQ3Q0aGxiVUxWWm9jbWVIMjEyZkQyQUNUS0RYSnU5Qk45MXhSdHoy?=
 =?utf-8?B?TDRBSll0Znp5Q05JTjNyVFlwc28yS2ZpSDNXQlphYTl6SXhZK1U4a011NEVF?=
 =?utf-8?B?emdXU0l4d0F6R2FFRFNpTGJXWTRiVFg3SEVzaldFQklWT2pSaW1PYnFBSHFF?=
 =?utf-8?B?VnVvS0pWM1U1V3g1TEpIN1lhbDNQRDdVUzdyZDNxc2VwdjN5dnk1Z3JaYmVZ?=
 =?utf-8?B?YlRCVEtyYWw0azFhTUFMd2UwTFcxMVRxU1RZVTJ5Z2tSZGc3OHUrV0dNdFRm?=
 =?utf-8?B?TTgwd0M0ZE9XZjRtTWNnTzZUakdWbXRpOUFCck1rK0F0bzZ6SXZUNzBjRFhl?=
 =?utf-8?B?N1pqZDBUbkhmR3FJSE1zaUYvM2VRaXM1bkRDbDhZNFpJc3Zyc2tMMFdGbU9C?=
 =?utf-8?B?cUVuM2txaDJhdjJuaVlWL2RyMGhMR2ViVnJBaGMrNHBqaTg2NTBzYzZEbHJz?=
 =?utf-8?B?T2tBQWFsODlENkw5azBrcVcweUIvTDNKRXl5cDNuOEwvTnpiNTBabGI4S29E?=
 =?utf-8?B?UUR3Q0U4UXBHdTY5ZDFXUDZabUY4QXZhRVVCMjc1T0FGRmRsYVgzdVFEUDZk?=
 =?utf-8?B?REMvUGxvV3JOM2V1MXdsSGNEL3Z4UDhMVHNvNWt5NjQrUzNVcVNhbFJIY2hW?=
 =?utf-8?B?aGJDMTBxeWEwdGsyV2kyRTlsV2t6NWJkWUZzc0FueWZKOXpYQmVXRkdZQ1pv?=
 =?utf-8?B?ckZsYytDczRQbDY3NHNraC9ZT3FnMDdVYkpCSCtwR2NLUlhVSWp2Zk1uR3V0?=
 =?utf-8?B?eDQ5UEw0YUZqWXB5Wm5idGp3L0JRcW9JKzlIazk1UXpJbVR5c3ZLSFloS0N6?=
 =?utf-8?B?OGZKNk9raExublNEbDlqbm91OHVQN2V1eW5WYzBaSk40MkFVYldiK0ZoVEF2?=
 =?utf-8?B?TXlsOWZ4Qy9Xc1hlNDJ4dzJQYVJ5Z1pvVWt5R1FWQ3dzRy90RU1EQ1lYc0hB?=
 =?utf-8?B?UTA0ZWNIaDV4M1pSWXVDaU90SHNYUDFNdmgySENyNHo3TFM2T1dGT2hQcWpn?=
 =?utf-8?B?bTJhTjdYUWFrZ1NEckFrNGxMd3JmVkFkSzByWGZ0MEg3RFIzUWluc2ZrdXJQ?=
 =?utf-8?B?MUlXYmlGd1NSSFVCaG9zVUJQQkFjbUMvN1BRb09aaE41WnJxUTZPRmh2UXB6?=
 =?utf-8?B?VGxVV0NIRllSTUlxb04ySmhYVlNuSFFJYmhzUllVTzNJNkpvZk1ZRlZkanhI?=
 =?utf-8?B?UTA0QWNja3pYc05sZ0M5TzhDTGNsTmN0K1REdk5QRnRBajlyZVJLSFE0SjZl?=
 =?utf-8?B?MGlsTGpUcVhiQ0R6NUlnMm13RXo3RGZ6RVBJWThLZHByQ0xlMkxUd0dCRjZU?=
 =?utf-8?B?UlNVZDdLRTRPZnBIc2V5emJBd01rVldpYWFkZXN1RGV1YWRxL0IwUTkxNnhx?=
 =?utf-8?B?aGZtWjNzUWU3SlEzYUY5R2R3eTk3NlRBSnk5bUtmYUpEQzJvbjJTUzdrVEg2?=
 =?utf-8?B?eGx2aHBmRlRvblpJRWFmR1ZFTVZFUXFEdGROd0FDaTh3MmdWWTI3c2hTTU5Y?=
 =?utf-8?B?cGoreWNUYzFXamZGMFdraDdTSWluV0EveHBhUjd4T216UFdDcVltSEhIWTJj?=
 =?utf-8?Q?XV+s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5270cfc-4503-4f9d-388c-08dd87ff8518
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 15:56:07.5719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sr31RzeSh9q6WDTlmrft86xISRuLrmhFF0NTO+H920UO+xbDAucSdTuj+dqlJ9MOLWH9qAggG3c6vYFS/TKEjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9416

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWxwbyBKw6RydmluZW4g
PGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCAyOSBBcHJp
bCAyMDI1IDExOjQ2DQo+IFRvOiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT47IFZh
ZGltIFBhc3Rlcm5hayA8dmFkaW1wQG52aWRpYS5jb20+DQo+IENjOiBvZS1rYnVpbGQtYWxsQGxp
c3RzLmxpbnV4LmRldjsgQW5keSBTaGV2Y2hlbmtvDQo+IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51
eC5pbnRlbC5jb20+OyBIYW5zIGRlIEdvZWRlDQo+IDxoZGVnb2VkZUByZWRoYXQuY29tPjsgTWlj
aGFlbCBTaHljaCA8bWljaGFlbHNoQG52aWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbcGR4ODYt
cGxhdGZvcm0tZHJpdmVycy14ODY6cmV2aWV3LWlscG8tbmV4dCA1OS82MF0NCj4gZHJpdmVycy9w
bGF0Zm9ybS9tZWxsYW5veC9udnN3LXNuMjIwMS5jOjEzMDM6MTQ6IHdhcm5pbmc6IGFyZ3VtZW50
IDEgbnVsbA0KPiB3aGVyZSBub24tbnVsbCBleHBlY3RlZA0KPiANCj4gT24gVHVlLCAyOSBBcHIg
MjAyNSwga2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6DQo+IA0KPiA+IHRyZWU6ICAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGR4ODYvcGxhdGZvcm0tZHJp
dmVycy0NCj4geDg2LmdpdCByZXZpZXctaWxwby1uZXh0DQo+ID4gaGVhZDogICA0ZDE3ZjIyYmM2
ZTlmNmE5ZDk0ZWU0MzEzZjZiZjNjZmExOTQ3MjZjDQo+ID4gY29tbWl0OiBiZjE4MGQ0NGM2NDE2
ZjhlNjhjOWExZmEzNDliZTAwOGNjZWRkNzk3IFs1OS82MF0gcGxhdGZvcm06DQo+ID4gbWVsbGFu
b3g6IG52c3ctc24yMjAwOiBBZGQgc3VwcG9ydCBmb3IgbmV3IHN5c3RlbSBmbGF2b3VyDQo+ID4g
Y29uZmlnOiB4ODZfNjQtYnVpbGRvbmx5LXJhbmRjb25maWctMDA0LTIwMjUwNDI5DQo+ID4gKGh0
dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktDQo+IGNpL2FyY2hpdmUvMjAyNTA0MjkvMjAyNTA0
MjkwOTQ0LmhPb0ZSRm8NCj4gPiBxLWxrcEBpbnRlbC5jb20vY29uZmlnKQ0KPiA+IGNvbXBpbGVy
OiBnY2MtMTIgKERlYmlhbiAxMi4yLjAtMTQpIDEyLjIuMCByZXByb2R1Y2UgKHRoaXMgaXMgYSBX
PTENCj4gPiBidWlsZCk6DQo+ID4gKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktDQo+IGNp
L2FyY2hpdmUvMjAyNTA0MjkvMjAyNTA0MjkwOTQ0LmhPb0ZSRm8NCj4gPiBxLWxrcEBpbnRlbC5j
b20vcmVwcm9kdWNlKQ0KPiA+DQo+ID4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0
ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcNCj4gPiB2ZXJzaW9uIG9mIHRoZSBz
YW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MNCj4gPiB8IFJlcG9y
dGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gPiB8IENsb3NlczoN
Cj4gPiB8IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTA0MjkwOTQ0
LmhPb0ZSRm9xLWxrcEBpbnRlDQo+ID4gfCBsLmNvbS8NCj4gPg0KPiA+IEFsbCB3YXJuaW5ncyAo
bmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOg0KPiA+DQo+ID4gICAgZHJpdmVycy9wbGF0Zm9ybS9t
ZWxsYW5veC9udnN3LXNuMjIwMS5jOiBJbiBmdW5jdGlvbg0KPiAnbnZzd19zbjIyMDFfcHJvYmUn
Og0KPiA+ID4+IGRyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbnZzdy1zbjIyMDEuYzoxMzAzOjE0
OiB3YXJuaW5nOiBhcmd1bWVudA0KPiA+ID4+IDEgbnVsbCB3aGVyZSBub24tbnVsbCBleHBlY3Rl
ZCBbLVdub25udWxsXQ0KPiA+ICAgICAxMzAzIHwgICAgICAgICBpZiAoIXN0cmNtcChza3UsICJI
STE2OCIpKQ0KPiA+ICAgICAgICAgIHwgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+
DQo+ID4gICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvbGludXgvYml0bWFwLmg6MTMs
DQo+ID4gICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvY3B1bWFzay5oOjEy
LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgZnJvbSBhcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJi
YXRjaC5oOjUsDQo+ID4gICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvbW1f
dHlwZXNfdGFzay5oOjE3LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xp
bnV4L3NjaGVkLmg6MzgsDQo+ID4gICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGlu
dXgvcmF0ZWxpbWl0Lmg6NiwNCj4gPiAgICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9s
aW51eC9kZXZfcHJpbnRrLmg6MTYsDQo+ID4gICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1
ZGUvbGludXgvZGV2aWNlLmg6MTUsDQo+ID4gICAgICAgICAgICAgICAgICAgICBmcm9tIGRyaXZl
cnMvcGxhdGZvcm0vbWVsbGFub3gvbnZzdy1zbjIyMDEuYzo4Og0KPiA+ICAgIGluY2x1ZGUvbGlu
dXgvc3RyaW5nLmg6MTYxOjEyOiBub3RlOiBpbiBhIGNhbGwgdG8gZnVuY3Rpb24gJ3N0cmNtcCcg
ZGVjbGFyZWQNCj4gJ25vbm51bGwnDQo+ID4gICAgICAxNjEgfCBleHRlcm4gaW50IHN0cmNtcChj
b25zdCBjaGFyICosY29uc3QgY2hhciAqKTsNCj4gPiAgICAgICAgICB8ICAgICAgICAgICAgXn5+
fn5+DQo+ID4NCj4gPg0KPiA+IHZpbSArMTMwMyBkcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L252
c3ctc24yMjAxLmMNCj4gPg0KPiA+ICAgMTI5MA0KPiA+ICAgMTI5MQlzdGF0aWMgaW50IG52c3df
c24yMjAxX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAxMjkyCXsN
Cj4gPiAgIDEyOTMJCXN0cnVjdCBudnN3X3NuMjIwMSAqbnZzd19zbjIyMDE7DQo+ID4gICAxMjk0
CQljb25zdCBjaGFyICpza3U7DQo+ID4gICAxMjk1CQlpbnQgcmV0Ow0KPiA+ICAgMTI5Ng0KPiA+
ICAgMTI5NwkJbnZzd19zbjIyMDEgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwNCj4gc2l6ZW9m
KCpudnN3X3NuMjIwMSksIEdGUF9LRVJORUwpOw0KPiA+ICAgMTI5OAkJaWYgKCFudnN3X3NuMjIw
MSkNCj4gPiAgIDEyOTkJCQlyZXR1cm4gLUVOT01FTTsNCj4gPiAgIDEzMDANCj4gPiAgIDEzMDEJ
CS8qIFZhbGlkYXRlIHN5c3RlbSBwb3dlcmluZyB0eXBlIC0gb25seSBISTE2OCBTS1UNCj4gc3Vw
cG9ydHMgZXh0cmVuYWwgcG93ZXIuICovDQo+ID4gICAxMzAyCQlza3UgPSBkbWlfZ2V0X3N5c3Rl
bV9pbmZvKERNSV9QUk9EVUNUX1NLVSk7DQo+ID4gPiAxMzAzCQlpZiAoIXN0cmNtcChza3UsICJI
STE2OCIpKQ0KPiA+ICAgMTMwNAkJCW52c3dfc24yMjAxLT5leHRfcHdyX3NvdXJjZSA9IHRydWU7
DQo+ID4gICAxMzA1DQo+ID4gICAxMzA2CQludnN3X3NuMjIwMS0+ZGV2ID0gJnBkZXYtPmRldjsN
Cj4gPiAgIDEzMDcJCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIG52c3dfc24yMjAxKTsNCj4g
PiAgIDEzMDgJCXJldCA9IHBsYXRmb3JtX2RldmljZV9hZGRfcmVzb3VyY2VzKHBkZXYsDQo+IG52
c3dfc24yMjAxX2xwY19pb19yZXNvdXJjZXMsDQo+ID4gICAxMzA5DQo+IEFSUkFZX1NJWkUobnZz
d19zbjIyMDFfbHBjX2lvX3Jlc291cmNlcykpOw0KPiA+ICAgMTMxMAkJaWYgKHJldCkNCj4gPiAg
IDEzMTEJCQlyZXR1cm4gcmV0Ow0KPiA+ICAgMTMxMg0KPiA+ICAgMTMxMwkJbnZzd19zbjIyMDEt
Pm1haW5fbXV4X2RlZmVycmVkX25yID0NCj4gTlZTV19TTjIyMDFfTUFJTl9NVVhfREVGRVJfTlI7
DQo+ID4gICAxMzE0CQludnN3X3NuMjIwMS0+bWFpbl9tdXhfZGV2cyA9DQo+IG52c3dfc24yMjAx
X21haW5fbXV4X2JyZGluZm87DQo+ID4gICAxMzE1CQludnN3X3NuMjIwMS0+Y3BsZF9kZXZzID0N
Cj4gbnZzd19zbjIyMDFfY3BsZF9icmRpbmZvOw0KPiA+ICAgMTMxNgkJaWYgKG52c3dfc24yMjAx
LT5leHRfcHdyX3NvdXJjZSkgew0KPiA+ICAgMTMxNwkJCW52c3dfc24yMjAxLT5zbjIyMDFfZGV2
cyA9DQo+IG52c3dfc24yMjAxX2J1c2Jhcl9zdGF0aWNfYnJkaW5mbzsNCj4gPiAgIDEzMTgJCQlu
dnN3X3NuMjIwMS0+c24yMjAxX2RldnNfbnVtID0NCj4gQVJSQVlfU0laRShudnN3X3NuMjIwMV9i
dXNiYXJfc3RhdGljX2JyZGluZm8pOw0KPiA+ICAgMTMxOQkJfSBlbHNlIHsNCj4gPiAgIDEzMjAJ
CQludnN3X3NuMjIwMS0+c24yMjAxX2RldnMgPQ0KPiBudnN3X3NuMjIwMV9zdGF0aWNfYnJkaW5m
bzsNCj4gPiAgIDEzMjEJCQludnN3X3NuMjIwMS0+c24yMjAxX2RldnNfbnVtID0NCj4gQVJSQVlf
U0laRShudnN3X3NuMjIwMV9zdGF0aWNfYnJkaW5mbyk7DQo+ID4gICAxMzIyCQl9DQo+ID4gICAx
MzIzDQo+ID4gICAxMzI0CQlyZXR1cm4gbnZzd19zbjIyMDFfY29uZmlnX3ByZV9pbml0KG52c3df
c24yMjAxKTsNCj4gPiAgIDEzMjUJfQ0KPiA+ICAgMTMyNg0KPiA+DQo+ID4NCj4gDQo+IEhpIFZh
ZGltLA0KPiANCj4gQXMgdGhpcyBjaGFuZ2UgaXMgb25seSBpbiB0aGUgcmV2aWV3LWlscG8tbmV4
dCBicmFuY2guIEkgZHJvcCBpdCBhbmQgdGhlDQo+IERvY3VtZW50YXRpb24gY2hhbmdlLCBwbGVh
c2UgZml4IHRoaXMgd2FybmluZyBhbmQgcmVzdWJtaXQgdGhlIGxhc3QgdHdvDQo+IHBhdGNoZXMs
IHRoYW5rIHlvdS4NCj4gDQoNCkhpIElscG8sDQoNClN1cmUuIERvaW5nIGl0Lg0KSSBzYXcgeW91
IGFscmVhZHkgZml4ZWQgYW5vdGhlciB3YXJuaW5nIGluIEtjb25maWcgLSB0aGFuayB5b3UgdmVy
eSBtdWNoLg0KDQpUaGFua3MsDQpWYWRpbS4NCg0KDQo+IC0tDQo+ICBpLg0KDQo=
