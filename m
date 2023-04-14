Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5C87491
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 23:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681515701; x=1713051701;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4s0cn5iO9/1/jbPWTmbOIS9nenMAvfSHVOtfSXGFkp0=;
  b=HmQsAnSp8+vnETyUt0utl7qj2MIAcQk/u2EPx1thG+LZ1MaTsDWDZ7cf
   PalcLZ12ohQCygjHzRLcgjWsyKpFXjjysWo1kYXjObw42TxTMEszjd0cE
   T6Sk+3+SVP37xbRPdmRXKHkfgkokP5c+XrvoGDBzkQ+JoKh88aMz7X6pr
   r3R4vainDRaByu07UFaZCcsmhcmjWE8AzdbZOHR8rPsKLFWj986sY7PiA
   f/AOyB1thfR/izBrctwqe3rgvoDy+ea1/bcTFU+8yzhQr4L/gthasOh3A
   dp0C2FNAsXnr37H1pYA9mqKarzW0ni5malBdAr2421pIzzetVmz/VHDTI
   g==;
X-IronPort-AV: E=Sophos;i="5.99,198,1677567600"; 
   d="scan'208";a="206610413"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Apr 2023 16:41:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 14 Apr 2023 16:41:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 14 Apr 2023 16:41:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUGGC123GBSdI20ivg9SdxtzjPwYfeAEzQi3i/yr8FjUO1n/x7RWerHyQVD3mqcA9Sh8048Wf94V26eUsBPtO68U22eWV18TE9fETDzyhuZIVd07B2cAfvyGOzIGtWz8ZDPqPZy4lB0tUcWQ80uWDggKzxpk8cvGXi7iQzL2rfk2dUY+t/uXi1hQlRgxIwiI/23QXbk0tn22bNAmF3TTrV2Z+yOV8cdepqiZ/1NsN6jbCVjONy6WHaw+fsbcgJl3BY0/+reAJ736JIDFgPcwVdOJr/jJuXdZ7NBJh/dbm9JfmOwhXcX7mODpc7eZ9dFhBFEH94Y1QXLwhiGBXpUdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4s0cn5iO9/1/jbPWTmbOIS9nenMAvfSHVOtfSXGFkp0=;
 b=BoosrNAC4oxxN/lkmZ2vD3qIoZa4RmGa23KLVgbvM6vtxIuvY7Pw2DFn8IiHQEB9ZKNB/Cnz3E4R0euLzRKddt74xKAV8KrXnnKL5lCLgh9WMGMhWjmPjCcq9CKDlm1D6xFfgpiA4KcKV8KV74hvn4rh4qUp/tX5ompVk5/tfQ2nC4UVPDIjdlPEnGRZB7tiZxIdCWTg1RqytknwvPfe6Hp2seTsINXIot4hdw7uV30bRAlwtXJ07FjhqRsySsIjldXNzCbxaFBgXRgWHFANEPHjrrTfS6ZgTnfeyIWncgDRnX8486mRgieBkpxyCNAUDTqtKuMBJr2Z6iw5LJ1zGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4s0cn5iO9/1/jbPWTmbOIS9nenMAvfSHVOtfSXGFkp0=;
 b=bUHawwWPYuHVUhrRcS/q1JIy+W0ZtbVI1Zvj7f0Y1iJr1C5z0IbW0D8JsWHwvLKURAvVqEwj3IVIDu3Lg2pRZTRqyyw1PaseuNogDF6RCQZxzxoQh+eTKmyDe2axPwidAmaPd28vkxJthYUSOIpFGTmzXihRKTK/hh4UuoT6A80=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 23:41:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1374:62eb:6071:86]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1374:62eb:6071:86%6]) with mapi id 15.20.6298.028; Fri, 14 Apr 2023
 23:41:10 +0000
From: <Conor.Dooley@microchip.com>
To: <hal.feng@starfivetech.com>, <lkp@intel.com>
CC: <paul@pgazz.com>, <fazilyildiran@gmail.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-mm@kvack.org>,
	<emil.renner.berthing@canonical.com>
Subject: Re: [linux-next:master 8653/11447] kismet: WARNING: unmet direct
 dependencies detected for RESET_STARFIVE_JH7110 when selected by
 CLK_STARFIVE_JH7110_SYS
Thread-Topic: [linux-next:master 8653/11447] kismet: WARNING: unmet direct
 dependencies detected for RESET_STARFIVE_JH7110 when selected by
 CLK_STARFIVE_JH7110_SYS
Thread-Index: AQHZbmONNdBMw05nx0iJciHnaxisHq8rd8q7gAAAnIA=
Date: Fri, 14 Apr 2023 23:41:10 +0000
Message-ID: <d7969bc5-d72c-3425-1510-57b8fe7e0f6b@microchip.com>
References: <202304140706.aOBNhUj2-lkp@intel.com>
 <20230414-spiritism-nape-b5c340dfb4e7@wendy>
 <d5d7ec22-dcba-7289-d572-39eaad8b0c83@starfivetech.com>
In-Reply-To: <d5d7ec22-dcba-7289-d572-39eaad8b0c83@starfivetech.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SJ0PR11MB5167:EE_
x-ms-office365-filtering-correlation-id: 96fb5d84-eff8-4d25-3bf2-08db3d41b9e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I3LTSNeiZFASXoC5gMqkkinwCGX4BXoN+fOrocaJdSsrkoe8lAGBFhSE43V+KKuTJhDMGee0/doYaC+eL8bX1rq+zM50a08yz/qdyFqKCanl+S33fCrW1F5ttP9pWaN/Q8XmR+EtId2UFdIfSbdR+JmciXRLWWlBU/jQLxobBbTxQuTe4G0FyrT87VYDG6xzvURBMmtDMS7AsHpdeNprGzOf9PKYeI8ENhvJSxyAuo0inRG2a/IeAjhDhmEJ7y9RhBeSTdms1k6ugRJd0Ks9WD8BtVWDPKRROTYj6Nn4+Rrz/jKd3fpPkL2cTUbUQ3AIOChefpthEvBuKBDpbsS/jjnMfbXs+nJGwoSVYbOJCt8GhgwdQGBiXEzLH+YsxOTWHbSl1Rohh83LpWPr6nCV+l9/nBdwEd20zLeZvZcZb+qD669buKZrxkj8ONhz1E7qf8HXRYJKFRd/sz3xp52dwzJVSlQystbYkkAXvG0iiZgXCV9YQwwNb0GwVW3z3IEjKp9+a2bdsLkkcDzABq4XJwIg2PyAQSrP3v3RMCaZgqPp9u9l/iTUiFSt4BZtycYgbXM3hV8gWqzzPJfkRKKkJ5jLnk0EsCXFPnlkkL4cxwlBJ0SsdJpdWttP3pIQnjPznqX8qQLXEK2rAs7jpZiiS1+uZMsDxgC6o9xJYHKEXsZ+dYqqwQoYV2/7zbC0Mmk5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(110136005)(53546011)(31686004)(6512007)(6506007)(26005)(54906003)(186003)(2616005)(71200400001)(6486002)(5660300002)(41300700001)(316002)(8936002)(8676002)(38100700002)(478600001)(38070700005)(86362001)(122000001)(31696002)(4326008)(66946007)(64756008)(91956017)(36756003)(66446008)(76116006)(66556008)(66476007)(2906002)(558084003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cExSQUNwYVUvSGFSL0JCbWdiOGpKc25Fb1doanprYVpndmQvTFhuMHJYZDEz?=
 =?utf-8?B?ZU9yNXNxTklicmo1V3ZLT3UrUG42czVnaWZOaXp2U3hjbFAwYXM2RDR5Q1U5?=
 =?utf-8?B?TEc3TFhyQURtdS9UR0ZuMWZiNzQ0cml6VFhLdDBmZlFLeGpUVWlxcEp1UHhZ?=
 =?utf-8?B?WE8rMVB2cXM1RGFUUklUSDRqTkgwNGhPbUpjSTVLcktRNnNTMlRWTXRidGE0?=
 =?utf-8?B?czlGS21OelNoNVJmZEV1M3JGQ2RYRXhROUpwNmgwZ3AzRWpwYVFYWVNPalVy?=
 =?utf-8?B?Q3Q5TnFHb2lrV1JqU0pHWmN0RytuQXNTbWY3dVNsRDVUR3hSYVFCNEp5TWpq?=
 =?utf-8?B?OTVhNlk5Y0l2YzRiQWFFK3dNQWdHdjFtbW1KOTRMMzBEQThTaEt5VHhBQ0I0?=
 =?utf-8?B?NWI0S0Z4djkrMlE3YjRTRysvVWZRUlVqK0V0REdnSUhlbVNPd2RPVkNOYWxp?=
 =?utf-8?B?Q1VEZm9KbUNuMjZmYVNoeWRzamlyQnZxZmgxVndmMW9NL2JDTFNmRGhqcDZk?=
 =?utf-8?B?ekMwb2UwVFI2MFovZy9yV1BadTV1a0pWbkc4VGVwdldiQkY5dU51blFBVmpJ?=
 =?utf-8?B?c21LakVKb3RpWXdick1DQXFuTFRZVFV4dWpXWnZzbjdGaHNLYUhHSmYwN29O?=
 =?utf-8?B?RTVDcVhhSXhWejlTNzVDZVh4VDRsNFJ1K05yWEYwanV6clh0eTAxRTRsdEph?=
 =?utf-8?B?TndRL215elgya2dtMFVFVXpVa29KM2VwMnZFSHRzY3ZJS2p0MzNZZjdzdEty?=
 =?utf-8?B?bndaeWRtSng4LzBYWmlJdzlHMENldStFdHVFQ1VnSVlYZmlRMHVMSUtyNHJC?=
 =?utf-8?B?bXJScGJEUGdBTXpkK1J3T0RVMkJEY0ljNzdYZnlZc09NM2tucGpsWDMrdmhD?=
 =?utf-8?B?T2E0RitUekVXL252STloamg3eUhEWStMbjExUllnRFdFOUk1bUYyQXkzYmNw?=
 =?utf-8?B?S1lsS1ZqRzRmWjJuL3ZrUEhPNFo5bFJFdnFQSmtLRitRRUFxamZFc2N6UW9a?=
 =?utf-8?B?VzlPN0ZUOGRyTEFPRkNRcUx5MGluaW80TExRS1JmRkFQbjBGTG9TRUZlcnZ6?=
 =?utf-8?B?U3I2RnFCUW9Kek54ck5GQzVoM0gxYjFVOGEvRzMzZFh4SjVrZ3NvU3VlTGxD?=
 =?utf-8?B?bGJVWTZtS25WUldkdkRKck1zMkJVZGRNbnYvbXRGbjJnRlZ1b3FlYUdxQ0Ry?=
 =?utf-8?B?UTFxTkdpQ3QzbUd2N2xEZVRWekJaUFlBTzRwdmNyTVV1ZFl2MUNpamdGSUJq?=
 =?utf-8?B?M29jV1YveXZ1Vlg1M1lrak54ZVd0Z1ZnMmg4aWphRm9JNUNyeGZBTnYzZmh2?=
 =?utf-8?B?a2ozS1NjaXdkN1JEcFZ5dStyc0tMSHduSEp6L29nWS9ndzZKbDdNT0w1SS9z?=
 =?utf-8?B?MGo1UklhTzV6NXNwWUNCaE50MTlEcFRYeVpHUEdrNUNySDU5V0h4K2ZicDAy?=
 =?utf-8?B?M1Zkb0gyM2lWeVRna2h6b0txNElrc2ZNL01QcnVaTUpGVEZ0OVlzN0lRWEsw?=
 =?utf-8?B?TDcza01mUFFmTzA5ZzdFMzI1a09wSEhSSEtVaFMrTGpESkg5RW5rMlBGeDZX?=
 =?utf-8?B?bTV5S2kvYXAxODVVM0hsMkJ5ZS9DajlJQTkwUW9BTkFySHJhb1d0cnVxYVlN?=
 =?utf-8?B?ZGJkdS8rMVRCbnBhNDJNMk1kRVhsSm1pNW91UEo3TEhDTDIvLzI0L2dBZTNv?=
 =?utf-8?B?Y2JhcFlMNmhBa3VmemdZdmRCSjBjb0IweVBvbzNoRHB1azlWbzdINXAvOCsv?=
 =?utf-8?B?b01haVZmam91ZFg4MERxMHJ4cE5QdU9DVWlDMXYydkxac1hSOHpOaEdyWHh3?=
 =?utf-8?B?VHlCTGZEb2ZmZnE1V0pmOVJ1cEN6dTRWNGIzQU1BQnlCTFZMd1hrWm8xRnQ1?=
 =?utf-8?B?UjRlalAvOEV0VWtianBBTDJySzBjaTNYdHhuL1IwV0JOaDF6b1dmbFZPWTFT?=
 =?utf-8?B?WVRnazlLcDhiTWlLb1VpN0VoZ3RyTkhBZVB6d0htTGNwbCtkUzU2dEpDalNN?=
 =?utf-8?B?d3haY1dhQndsb2x4ZCtRVzVUa0krTlRSU2h0UXYyQXlSeE00Y085UXM3THAy?=
 =?utf-8?B?WHpUSFp1SXgvbEpMRVUvcDdvVlNveGtRUDRicUxEd3FXZTNHSEUrK2g2WGNy?=
 =?utf-8?Q?A6PH7CZP8MMns4c5v8iU1rqTi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12386624EF6A7E4C9820D28161445A0D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fb5d84-eff8-4d25-3bf2-08db3d41b9e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 23:41:10.3540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhugKd6GKrN3X/KyY2zAu2dn8pN4eEU0fEYIfrNn3rUeROUAoUdO6BWlgGMbu3WUXtsjRG3H1Qouo5v5eK+7fq0lfGI8WF4qDLoXZfNQvQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167

T24gMTUvMDQvMjAyMyAwMDozOCwgSGFsIEZlbmcgd3JvdGU6DQoNCj4gT24gRnJpLCAxNCBBcHIg
MjAyMyAwNzoyMjo0OSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KDQo+PiBDb3VsZCB5b3Ug
cGxlYXNlIHN1Ym1pdCBhIGZpeCBmb3IgdGhpcz8NCg0KPiBObyBwcm9ibGVtLiBDYW4gSSBzdWJt
aXQgaXQgYXJvdW5kIHRvbW9ycm93IGV2ZW5pbmc/DQoNCk9mIGNvdXJzZSENCg0K
