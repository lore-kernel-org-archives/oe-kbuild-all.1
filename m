Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D82928EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 09:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/4VZVXQS1shpFMlasza5zaQ8vpCI6jp8hImZe82eI9W8SFnkeNsCVmbBOMsMDXFuLQ1BxmqQQzKBubkFQ13/GAW1vrlNBGyVDJDw1QNf1r4uBb6hcfvnSLNl73DSSBg9LFatJzKIealvh9D3HE0fDzWw3rVmekmf9PWaFPIJiZMtd97tI/B7ZIGluyUSDIKHRwvETcXQnW97kzOtu7Qpzne6FF+bm52g9zyA6TFbjViJs/8byJRzptdzuY+E9hp2odoXToxo/LCWWuvUm6DbxrxXWe/JhNinwboC+kwu694Kd8qsRGKVTL41tFZ7mAAMfGfEF9N7ZtZQ1wNjcHoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQwKehqVbjnJZ+3ogCLa9qs/bLDvtpMNGeQ5VSQrv94=;
 b=UPjYB/1fRH79aESrjnYIP9bVmfrjiJWw28O1/Aa+Tf9S6HyaRxiaQmmeTFNW4XxhyqHbzD+hZt48dM5GqDMR4kiz/z7K7VWI3YngkeGrLoy/NBzGXU4MEMhyctMOD0wIdosCQ46zQrcplGdxt87Hovr/dACqPGySbjfe2kHUIu7pcO8PeeUSDO5UWhwfXaAtbu80XwZ73T9ryh3IwRohW3V2AWwPt+om/pob9L+6HU0ekQmEK4+sjrWEeTUOyizKI6ETjKx2n6kbVyJQppXDiwrosex4SlaV/V6Mq56z1dU9UGzbJwYnJtVpms0Hayi9zUEpVic2/dTGF8FJp4d71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQwKehqVbjnJZ+3ogCLa9qs/bLDvtpMNGeQ5VSQrv94=;
 b=CX/64TQugEiqdWXXfDxqZK3mEkFZQe7gw1NsT/VPlgQnbXqIk8cAR3yf4vSzDEpPOrDNh/9rpEQ/4CowreBhxvLL1/9O5xEEnfHPBmiEqjB/6YPLiKnHbcewjBIvtkJDX/AwoCaza8ilazpxjOv0XU6eHtOh8eNSI23mgtSmDQw=
Received: from DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22)
 by DM8PR12MB5479.namprd12.prod.outlook.com (2603:10b6:8:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 09:43:08 +0000
Received: from DM6PR12MB4202.namprd12.prod.outlook.com
 ([fe80::33a7:54d4:2de0:3939]) by DM6PR12MB4202.namprd12.prod.outlook.com
 ([fe80::33a7:54d4:2de0:3939%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 09:43:08 +0000
From: "Lucero Palau, Alejandro" <alejandro.lucero-palau@amd.com>
To: Paolo Abeni <pabeni@redhat.com>, "Lucero Palau, Alejandro"
	<alejandro.lucero-palau@amd.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Ammar
 Faizi <ammarfaizi2@gnuweeb.org>, GNU/Weeb Mailing List
	<gwml@vger.gnuweeb.org>, Jiri Pirko <jiri@nvidia.com>, kernel test robot
	<lkp@intel.com>
Subject: Re: [ammarfaizi2-block:netdev/net-next/master 27/39]
 drivers/net/ethernet/sfc/efx_devlink.c:185:58: error: expected ')' before
 'build_id'
Thread-Topic: [ammarfaizi2-block:netdev/net-next/master 27/39]
 drivers/net/ethernet/sfc/efx_devlink.c:185:58: error: expected ')' before
 'build_id'
Thread-Index: AQHZQiP0xHLkxVXOCE+e6FoqAr4h8K7R1ZEAgAEOY4A=
Date: Fri, 17 Feb 2023 09:43:08 +0000
Message-ID:
 <DM6PR12MB4202B75672209F40CE72589EC1A19@DM6PR12MB4202.namprd12.prod.outlook.com>
References: <202302170047.EjCPizu3-lkp@intel.com>
 <ea3b86d9f06af4a9261d7c698c7b9a4e1ca35ccd.camel@redhat.com>
In-Reply-To: <ea3b86d9f06af4a9261d7c698c7b9a4e1ca35ccd.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
x-ms-exchange-imapappendstamp: DM6PR12MB4401.namprd12.prod.outlook.com
 (15.20.6086.011)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4202:EE_|DM8PR12MB5479:EE_
x-ms-office365-filtering-correlation-id: 1942fa23-a311-4b30-28e8-08db10cb6078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5oKw/HtENYbeL5FdIet2vDmfWU0AFPuFiBwPB6/qdhNpyh5DiA9pAEwsJDyuUdFmNDWmfisTiYCy9NId9HmO6ZPCvxUB5HlFYgsHk6aHUFIjPLH8Ly5yOcdWmd8XZebCAgvjFoZecEBUBP/NlinSaQ4zD1SPxqRCtNYly0cYIOVDTetwJA5XpyOW7PIy1uPLAF3O9WudoL9m8JL9XgPfFhu4p0nO5bmsLO8Xesc1fTMX82VBwaif/ncqpIsnSrERLOOnR9ZACeDM9a4qNkeMxIpLmKLWIb2+NiFebpymziUM32z69UopLba/4AVmqRZoabaNakcbxYGbOl/M19hK/Z+OIOlYoMMBLhyvpgzECIAJ5EF2gzGGVzaTONPbYPZX4Y+PI82jsYKp/Xu2ROZdLRMnRFIRpqeNXwhJiw8dCFdFGG0XpIO7mSuuwPhz9KJR8VxdJ2MjRrFoIBWUDc6q925BY+Ak2oP/I/nkO9aP5ytk/rSPpAD6X77zWmpiBt7NEvyVSgzZdJqjxviH5Oj/g6QCQlY9KkXsuPkakK5FkjX7UHo2aJWnat0q7he8bOpWizaWZksM2sJmeMAkrk7TulSZLv+31LKuZlJGFAHjMlOyN30FwTYhp9Sh9p/js31yNquGTaLnDV5NlLmpbiLUW6/XKZ7aGhkabN0Xmc5Klw387rfXH3/63++nIxbacSItksa1f5wsfR+1JauzKF5B47zYw0BfCvrH98TyymSUIlsevRAtLO1TmQp3+OK4hZQo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4202.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199018)(2906002)(8936002)(38070700005)(33656002)(52536014)(5660300002)(122000001)(38100700002)(7696005)(110136005)(71200400001)(4326008)(66556008)(64756008)(66946007)(6636002)(66476007)(66446008)(8676002)(966005)(54906003)(41300700001)(9686003)(26005)(186003)(53546011)(6506007)(478600001)(55016003)(76116006)(316002)(65966003)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEs3Zy9FbmIzcGYxVis5emVoQktBM0xRUmZiUUp4ZGd2MVRucUVGZVlkQ09N?=
 =?utf-8?B?WnFTN0VVWDNiWjJGSnk4OXdIdUN4eFNxUHJkTXB2MENuTlQ0M0RvVWdUSTFl?=
 =?utf-8?B?V1VmdkdVbG9wZnJ4UVE3NkxhbDhVL3BXUkZldkx6WWhEaEJnZ0RDOEo4em9w?=
 =?utf-8?B?Nnl6QnlMa3lBMlB1MHNLbFI4NG5CR3hjL3U2VVdabzF3dTJKaGZZQ0xxVXZN?=
 =?utf-8?B?dGxCSXRXRWJkalFwVkdGVFNHZWhQRm9DdVhHUFl0bENzUFg3SS9xQ3FsRnpv?=
 =?utf-8?B?RW9WdXdIWmFDN3E5dFNHTFVrN3lwQktYbnJhRUZsQUNjZFFEblBFOEdyLzMx?=
 =?utf-8?B?bnNnNTdvdnlZVXJjU0xUUmEvdHRFbkxSa0phTllsZlZVNWlscFliR3YrQ2VW?=
 =?utf-8?B?SEVQMEVHWFpGUUQrTEVjeU5tcVNVMmwxRElwVXgwRDRva3A0cUhMaDRuR3lM?=
 =?utf-8?B?ZUZuSTRPZjFYL2ZYMVdpa28zQ2k2YlJHK1Q4TlBXM29yUjhucStGNURHVFVL?=
 =?utf-8?B?Ry9tcXFlczRqUGhISTgvTW1xRzhLWEdPMXQxQjhXcXBON2hvK0FpMDJJb00z?=
 =?utf-8?B?TmNIOFpPZDRrQmdiT2VwR0wrTnFCdTQvVzl3TGxvd1VmclhNZFNqdERBWHl0?=
 =?utf-8?B?TVI1bVVZWlBrdTNPbUFRTlZZLzl3UDBENHFkUTZNVFdSVlJwWWxyblJOc216?=
 =?utf-8?B?UlFSZEdFSWVpSGFuM3V4WjQxb0hJYlYyTU5VVWEyZGc1Zjh6WDVPQTZzWEpv?=
 =?utf-8?B?WkhldGNzWFpKRkY5djBlai9KNFQxNnhwWVZoMUFNZ1ErR1FDMDVEU2hsT0VW?=
 =?utf-8?B?cjNIMHkxRm9SK0VTOGh1MTlCQmJMSlgxeERCckpRZTdFMzc1SUlXUTdJUGFl?=
 =?utf-8?B?K0l6RVluaEEzUGM3SkxDSTNKbVA4aEpTZExoTnZjWlZobStuM2t4N3RqdU8z?=
 =?utf-8?B?bWlJczNjNENYMW1rd0pWK0hoZVRIanB1WUJIZzVnaWtYZDh4Wm1Wa1pxU3dB?=
 =?utf-8?B?MVVPT1R1U2oyWUtyT2RQUlFaeTFZMytKL3VOWmI2dGZDL2tTMWxNaERxbnhu?=
 =?utf-8?B?dElFeStDS0F0N1BJRGF2L3R6Z2FVcktPK3RtaS9yUjl0aUJKa1F2d0FkR2Zm?=
 =?utf-8?B?S1A4RHVQMmxTZWgwWFBjdDNRenM1alY1VVRIcEtDREJ3UGN2T0UwZWVkbjd3?=
 =?utf-8?B?NEdTS2NFR2JCUnJMbFR6cjdUR1RYWjA0ZmdOUlNyaGQ4MU9nTDRoMzZCSVg5?=
 =?utf-8?B?TzZVSTZQZWZSQ3lGbktqK2dKczlURXZZTkF2SjI5eldGd2hvVHdqVk5iaVEv?=
 =?utf-8?B?S1RyeTRtcy9QNHZ0UGpXRmZoYjdvSFprQW9xRzc4Y2hwbEhHdjJhcWNoVkpO?=
 =?utf-8?B?NHRTc2tPM2tBdmdFY2VHVUE2UGpHL2dQcDVVSUg3dzl0S0NJcEdSd2xrbG5Y?=
 =?utf-8?B?cStkQ1djekx5V1pqZ01zWUVBd1FxdDkxUFprazdaVVV1ZWwzVTJyYzlXVVAv?=
 =?utf-8?B?UHhHSlhuRDZONEREVS9hS0VPTldjZGgxcWJvZGtaa1JhK1N4TVdzaVdMS3Z4?=
 =?utf-8?B?a2JMR0JUTDcwM1o2YS9VMkU5a3BNbkI5bm9UM0RnK2xzMmQ3aHVLb1AzMjkr?=
 =?utf-8?B?bkJLL2d2VWo3UWtTRCtHMU9pdDRXVkZVcEluZGRJQzVvZWF0OWMrZ2hzUFJk?=
 =?utf-8?B?TXBDWFBkSlpkeDNJdXJvNWhVS1RVMnp1RnI3dU9EU1lxT1UwK1RWM1B6VHYy?=
 =?utf-8?B?Q2dLMXp4RUsya1RmRDUzQWo3aHQ5eTFBK0NMUlREeHprVTNmK0l4VzRHYUlI?=
 =?utf-8?B?QXJnWVQ5WXpxT3l2ZzlCRDB0NHNJMDdlci9YeVd2RStna0g4WFM1UVdhWll0?=
 =?utf-8?B?S1l3eHE5K2p1SDRJRldOKzIrYWd6d0ltM0VCbzI0TzgyT2ttV3dtNm52WjhP?=
 =?utf-8?B?SkVYM2JRcmwwSi82YU5nYkljMzFDVHVvTTIyenFvcHZmYWpqRVM1Y0U1TWZv?=
 =?utf-8?B?U050QnBxMUptWVJJNWN4elNBSkdHdHJzSTQ3UFlSbmtPRW1INXlhZi85dVdo?=
 =?utf-8?B?TzVlNkN4a29EcE4yUjhkdVUyTVJLZWl5K05BZFhrTlQyVFZUTTF0YUVlZ3dT?=
 =?utf-8?Q?0Xts=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C445F2029CFBB44841E8BD6669DE4C0@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4202.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1942fa23-a311-4b30-28e8-08db10cb6078
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 09:43:08.5637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iL6bzKtVGXqc5ZMN4cfjaWHKAaRVoF4c59oZbOg5cK5kdbd/qkswcjmuttuwm/9ob63ZcTdHHQ77WV2QPtRc1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5479

DQpPbiAyLzE2LzIzIDE3OjM0LCBQYW9sbyBBYmVuaSB3cm90ZToNCj4gT24gRnJpLCAyMDIzLTAy
LTE3IGF0IDAwOjEyICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90ZToNCj4+IElmIHlvdSBm
aXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcgd2hlcmUgYXBwbGljYWJsZQ0K
Pj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4+PiBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMwMjE3MDA0Ny5F
akNQaXp1My1sa3BAaW50ZWwuY29tLw0KPj4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQg
YnkgPj4pOg0KPj4NCj4+ICAgICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zZmMvZWZ4X2Rldmxpbmsu
YzogSW4gZnVuY3Rpb24gJ2VmeF9kZXZsaW5rX2luZm9fcnVubmluZ192Mic6DQo+Pj4+IGRyaXZl
cnMvbmV0L2V0aGVybmV0L3NmYy9lZnhfZGV2bGluay5jOjE4NTo1ODogZXJyb3I6IGV4cGVjdGVk
ICcpJyBiZWZvcmUgJ2J1aWxkX2lkJw0KPj4gICAgICAgMTg1IHwgICAgICAgICAgICAgICAgIG1l
bXNldCgmYnVpbGRfZGF0ZSwgMCwgc2l6ZW9mKGJ1aWxkX2RhdGUpDQo+PiAgICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgfiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
DQo+PiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICApDQo+PiAgICAgICAxODYgfCAjZW5kaWYNCj4+ICAgICAgIDE4NyB8
ICAgICAgICAgICAgICAgICBidWlsZF9pZCA9IE1DRElfRFdPUkQob3V0YnVmLCBHRVRfVkVSU0lP
Tl9WMl9PVVRfU1VDRldfQ0hJUF9JRCk7DQo+PiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
fn5+fn5+fn4NCj4+Pj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvc2ZjL2VmeF9kZXZsaW5rLmM6MTk3
OjU1OiBlcnJvcjogZXhwZWN0ZWQgJzsnIGJlZm9yZSAnfScgdG9rZW4NCj4+ICAgICAgIDE5NyB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBidWYpOw0K
Pj4gICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXg0KPj4gICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgOw0KPj4gICAgICAgMTk4IHwgICAgICAgICB9DQo+
PiAgICAgICAgICAgfCAgICAgICAgIH4NCj4gQWxlamFuZHJvLCB0aGUgYm90dG9tIGxpbmUgaXMg
dGhhdCB5b3VyIHNlcmllcyBuZWVkIGEgZm9sbG93LXVwIGFzIGl0DQo+IGJyZWFrcyB0aGUgYnVp
bGQgd2hlbiBDT05GSUdfUlRDX0xJQiBpcyBub3QgZGVmaW5lZC4gSSBtaXNzZWQgdGhhdCBhdA0K
PiBjb2RlIHJldmlldyB0aW1lLg0KPg0KPiBDb3VsZCB5b3UgcGxlYXNlIHNlbnQgYSBmaXggKGZv
ciBuZXQtbmV4dD8pDQoNCg0KT2gsIHdoYXQgYSBzaGFtZSENCg0KSSdsbCBkbyBpdCByaWdodCBu
b3cuDQoNClRoYW5rcw0KDQo+DQo+IFRoYW5rcyENCj4NCj4gUGFvbG8NCj4NCg==
