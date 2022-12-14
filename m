Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5239619C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Dec 2022 06:30:43 +0000 (UTC)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2109.outbound.protection.outlook.com [104.47.22.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-ky29hdLoOLORFCPk8XsM5w-2; Wed, 14 Dec 2022 07:30:40 +0100
X-MC-Unique: ky29hdLoOLORFCPk8XsM5w-2
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 ZRAP278MB0770.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Wed, 14 Dec 2022 06:30:37 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ace5:84e5:2754:a1fa]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ace5:84e5:2754:a1fa%2]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 06:30:37 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "hongxing.zhu@nxp.com" <hongxing.zhu@nxp.com>,
	"lkp@intel.com" <lkp@intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-imx@nxp.com"
	<linux-imx@nxp.com>, "richard.leitner@linux.dev" <richard.leitner@linux.dev>,
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
	"patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>,
	"tharvey@gateworks.com" <tharvey@gateworks.com>, "marex@denx.de"
	<marex@denx.de>, "lukas@mntre.com" <lukas@mntre.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/4] soc: imx: imx8mp-blk-ctrl: expose high performance
 PLL clock
Thread-Topic: [PATCH 4/4] soc: imx: imx8mp-blk-ctrl: expose high performance
 PLL clock
Thread-Index: AQHZDwwownO18Vw0QEyqFlBFYeyeZ65sSCcAgACk5oA=
Date: Wed, 14 Dec 2022 06:30:37 +0000
Message-ID: <7718c3085c88d366c102450698cc54b319fe24d2.camel@toradex.com>
References: <20221213160112.1900410-4-l.stach@pengutronix.de>
	 <202212140421.k5Qj6UGm-lkp@intel.com>
In-Reply-To: <202212140421.k5Qj6UGm-lkp@intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0683:EE_|ZRAP278MB0770:EE_
x-ms-office365-filtering-correlation-id: 6c0275e3-3284-4066-39a3-08dadd9cb6bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: +gvVNUPRZHDHK9rbuA7znJevI61crlzIv4eDYBwnqPGp2YVbhooJg5fnVqVAt9RLznLVd+c9o4yA6wSnSft74HtH8+5hmAeyfXjcsBYWgPECfRUQQCRJHC7OKRMBFg1BpxeOAaHbPNHFtyBJhmlFnKg9ddzcndYlOx5nIJ/nxLDij/7+U8+jIM0h+TIL96GVYN2NKmvXGRGiqJmo7ftjQu8zRmyCp2RvR8AhIzIaMw0IqfBGuzalTl1n4Q7zcLwZbEiePu7UaEGyQHj/iRqSkXWR6SbJk5XcSaLH2ym/GsIhFvEpR+VM04mwbJ6cmA2Ir7ym9d/6SbOLgIre0LUbgc46jiRsO90BUMSXJ/SkNlBOQ69IMOM3CMxiI3cZaGgAabh1xBTBMwfHH9VZwea0NJX7DcD+hJoqC6UoaTKMMsVyoNsBsMKhaUKGY1eKhnPsavSPgmmSIUm7FPiqfYgGTCVSNQJqaKPOvz2TGNu3UfHLYTVE8yBvtSefy6DA+mdS/+VAlpUr8C85MPIyuaX8N9w/aq4JKeeuwYzQDMzzhnTvs5glPEUmYkMyTg6lo+79Vz4IH+yeB0T9K1QDD2X9plM0Qn1zAWZmYC4+N5oK3gwhwcmXeP5cQK37xACwmSacBk8WJf5gA7ZC8xjbjfP/EY8TI8xigRrprXeW40qzAtQHXFUuNtc3/lYOaYO8MofSP/j9Gi1BFj//ndGRhYb/R7kp6UOJMKX1+cHfGVrOH3vX0wJLvoHYZUYZhrmjIPlo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(136003)(346002)(396003)(366004)(451199015)(186003)(38100700002)(478600001)(26005)(8936002)(76116006)(83380400001)(966005)(86362001)(6512007)(36756003)(66556008)(4326008)(6486002)(91956017)(44832011)(2616005)(6506007)(41300700001)(66446008)(64756008)(38070700005)(5660300002)(66476007)(7416002)(71200400001)(66946007)(110136005)(122000001)(54906003)(2906002)(8676002)(316002)(4001150100001)(32563001);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWNxOHZ6aDcrenduSnliMWM3TE4yWjlVd1doWWcrY3ZMVjRxY05aRFdxaElZ?=
 =?utf-8?B?U2JvS3VTdmorQzgydGJEbVRFak9TSjJOUFljVVBSOFdHZzNWODNWSUxCSDds?=
 =?utf-8?B?aUNjMW9iUXZocGNmTURuUlJjejBZUkVZMnVqVGE5ZHN5WFBBY09Ea2EyT2FR?=
 =?utf-8?B?Q2hpWkdQcDVXL2JRUXJxSUk0b1RnVkpFa1I4VlhLMXMvalZKVWZaWEtRaDEr?=
 =?utf-8?B?Sk1uZkgrclBFelNkS3ZLTm8rVGF5WXVJWGY0N3drTzFUQlh5eVQ2KzhmWHdt?=
 =?utf-8?B?em5XbVJHVzBLV1UzNk4vTDVwUlo0ZnJvOGZsTVhkZVEwRFczT1MyVnNUaWtm?=
 =?utf-8?B?TFBOVW9oTVZzOVR6NmxWV0pURWtiMTBmdkdCT0Zmd3Jza24xVG80eUtkcHY0?=
 =?utf-8?B?Z0EwSDNXaUhra0JFN2h5SExXSUxCZGFEbWJvb0JldWhUVExpOXhMSXpqZE9q?=
 =?utf-8?B?L3o0MFRMajNaYjJDVmYxTWI1N0FlM253NXowUlNYOGkvTkR2RHgzS0x4SkdR?=
 =?utf-8?B?ZWxKTUx3ejNFeUVtZDJtV0l3WUFqdnBvTmZvVXk0RTFtOHY1MDJMR1J1WXhR?=
 =?utf-8?B?V09LQVE5SDFTbjVXajFTYnpIcjJIVU9UUWtydjNkYjhLYjZSTUZDVDkzRjI5?=
 =?utf-8?B?aVR0SGtaaHNyajhnMGhUTWc1cHhmcGgwZCtOb2dQbWJUVWJ4ZDFkQjNPRVZz?=
 =?utf-8?B?REVCVzdCdGg3TW1vcGpDVDBiUzNXWHVYck9jRjFveXZURitWOGx6dlRwbytZ?=
 =?utf-8?B?NFA4c3NHRW5PaDB3R1ZyekJUMGQ3ellzT05JRXRhZ3ZsSXFCRitibDAySWpj?=
 =?utf-8?B?cDRmMW1ING9HdzMwZE56aFdvbjJXdzZNeHNRbmVHUDhnZHhHR2ozMm02TC9h?=
 =?utf-8?B?TGtXUVpINkVrNDNCaVhzQzlnWm1WWFZzZVgwKy9acGplNE4vUU5FVTdkK2or?=
 =?utf-8?B?TU9ieG9ueHpkR05Ra1l0WjluUTl0K2JNc1RjbVEzSUpLblh0TS9sK0pwY2Nr?=
 =?utf-8?B?TFVKeGg4cFdyZkdsZ3MrbENtRElhckw0QnZOM0EwZHhsRVNSQzl0U2gvTXVJ?=
 =?utf-8?B?em50ZFBvMDE3VENqYmlYSXhoMGp4djJMd1l6QjU0U3B4cEtuRGQ0cEwrVGtC?=
 =?utf-8?B?QmdheHYwVktma2JRN3ZKdktOeHJ0L2o2NVpaU1JMNGM5T2FScEhtU1N3Y1Ir?=
 =?utf-8?B?c1QyZmxIdGQwOVJpcFZoelJzWjdWLzZjdDVha2FqYlNHdkFBSVluM2s0alkv?=
 =?utf-8?B?MHhKanViNWloRGFENS9rKzVJS3pCMlEyeWZ3TGw2ZE12N0NNckRSaVZWdHdB?=
 =?utf-8?B?MTRWdWp5M1l5OUY1cC9oV0llNmdMY0QvT1NvSkhYQlFRcmJIdmdPR3FQa3Rz?=
 =?utf-8?B?c1J0NExZVWV3TWtRNmV5ZHljeG95WlhhaWZNS25LUG85ZVo2Q3BWaTVxNGQw?=
 =?utf-8?B?K0NadmgrNmJESzU4d2tpU3B3Si9xc2p2U2FKUHQ5TUlLUmxDY1pDMmFWV1VE?=
 =?utf-8?B?ck9KVU1LUUNQbEswNmpPZmxLYXA3MThMVVBhd1B5TVFOMWZDdmdFajhDdmlj?=
 =?utf-8?B?TDFLQU5hbUVrODg3Y09KWjNUUkVaekxTL1JWdzVjNXlyRElqWDlEWU5PZktI?=
 =?utf-8?B?OTN2ZGJRVHowa0NLWENwMkQ4bEd2dm1zYVVBUzR4UTZicXRZb2VIbldWK3lx?=
 =?utf-8?B?QmpvQXpsS2RmVThBbTNuZ3NDc1l6aElSZFpjZERLWGtZODZYZlorQVNybEgz?=
 =?utf-8?B?ZEtzVUkzU1Z0cWt3RDkwRUVEeXFSTDc5QVpzdmhvY3BlNlp2WDh0SjNNUU1s?=
 =?utf-8?B?bUl1Y0ZxbVphZy8rdlRxMEs0eTBDbTRUWkppU3UxUVZqckxWQVB1RUtjSGNz?=
 =?utf-8?B?RVRjY2VPWVdFTXFJNldpMnoreEgyL2RUL1RETjhDM2NCRzQ0S0tFeDZSeDE0?=
 =?utf-8?B?eDBzS3BxT2huZnBvQ3JsV0xYbXdEWTdTVVI0ckRtNm5ydG40VVdVc3RVS2Zm?=
 =?utf-8?B?MkcrcElPUjhXNGsvaENrbnlDVm8rK0hDMU9xRDlHbVVjTDBhYVE2ZHhFdnVB?=
 =?utf-8?B?c3BkQU1WeVMzSFJnNEEySEprZmlrc0JDREtaN0czZlo1VE1CTVFtUXdlalRL?=
 =?utf-8?B?TTdvcnhqS1pRSkx5SzhhaWZQQU5PUWlhK0RVcFpsbUN2eXAyMmg1U3VscTBX?=
 =?utf-8?Q?GvMcg6nU1O+exZB3wwksYII=3D?=
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0275e3-3284-4066-39a3-08dadd9cb6bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 06:30:37.6500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MiY7a4eofTZjJl986iATn+AFS5UAVgQGHt4TpP3tOO4qC92T8RMLRW2jHaePHLqMHbG/0uFzA3iSupeGvJ8Kn3FNLO7vz2QfQJiMxhTaeTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0770
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-ID: <D41423596B25B74EBB4BCA6D0DDD9706@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIyLTEyLTE0IGF0IDA0OjQwICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToKPiBIaSBMdWNhcywKPiAKPiBJIGxvdmUgeW91ciBwYXRjaCEgUGVyaGFwcyBzb21ldGhpbmcg
dG8gaW1wcm92ZToKPiAKPiBbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gcm9iaC9mb3ItbmV4
dF0KPiBbYWxzbyBidWlsZCB0ZXN0IFdBUk5JTkcgb24gc2hhd25ndW8vZm9yLW5leHQga3J6ay9m
b3ItbmV4dCBrcnprLWR0L2Zvci1uZXh0IGxpbnVzL21hc3RlciB2Ni4xIG5leHQtMjAyMjEyMTNd
Cj4gW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIGtpbmRs
eSBkcm9wIHVzIGEgbm90ZS4KPiBBbmQgd2hlbiBzdWJtaXR0aW5nIHBhdGNoLCB3ZSBzdWdnZXN0
IHRvIHVzZSAnLS1iYXNlJyBhcyBkb2N1bWVudGVkIGluCj4gaHR0cHM6Ly9naXQtc2NtLmNvbS9k
b2NzL2dpdC1mb3JtYXQtcGF0Y2gjX2Jhc2VfdHJlZV9pbmZvcm1hdGlvbl0KPiAKPiB1cmw6wqDC
oMKgCj4gaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgvY29tbWl0cy9MdWNh
cy1TdGFjaC9kdC1iaW5kaW5ncy1zb2MtaW14OG1wLWhzaW8tYmxrLWN0cmwtYWRkLWNsb2NrLWNl
bGxzLzIwMjIxMjE0LTAwMDI0NQo+IGJhc2U6wqDCoCBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9yb2JoL2xpbnV4LmdpdMKgZm9yLW5leHQKPiBwYXRjaCBs
aW5rOsKgwqDCoCBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjIxMjEzMTYwMTEyLjE5MDA0
MTAtNC1sLnN0YWNoJTQwcGVuZ3V0cm9uaXguZGUKPiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0ggNC80
XSBzb2M6IGlteDogaW14OG1wLWJsay1jdHJsOiBleHBvc2UgaGlnaCBwZXJmb3JtYW5jZSBQTEwg
Y2xvY2sKPiBjb25maWc6IG02OGstYWxseWVzY29uZmlnCgpZZWFoLCBvdXIgR2l0bGFiIENJIGdh
dmUgbWUgdGhlIHNhbWUgZXZlbiBmb3IgZS5nLiBpbXhfdjZfdjdfZGVmY29uZmlnOgoKZHJpdmVy
cy9zb2MvaW14L2lteDhtcC1ibGstY3RybC5jOiBJbiBmdW5jdGlvbiAnY2xrX2hzaW9fcGxsX3By
ZXBhcmUnOgoxNzY1ZHJpdmVycy9zb2MvaW14L2lteDhtcC1ibGstY3RybC5jOjEwNTo3OiBlcnJv
cjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ0ZJRUxEX1BSRVAnIFstCldlcnJv
cj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KMTc2NiAgMTA1IHwgICAgICAgRklFTERf
UFJFUChQX1BMTF9NQVNLLCAxMikgfAoxNzY3ICAgICAgfCAgICAgICBefn5+fn5+fn5+Cgo+IGNv
bXBpbGVyOiBtNjhrLWxpbnV4LWdjYyAoR0NDKSAxMi4xLjAKPiByZXByb2R1Y2UgKHRoaXMgaXMg
YSBXPTEgYnVpbGQpOgo+IMKgwqDCoMKgwqDCoMKgIHdnZXQgaHR0cHM6Ly9yYXcuZ2l0aHVidXNl
cmNvbnRlbnQuY29tL2ludGVsL2xrcC10ZXN0cy9tYXN0ZXIvc2Jpbi9tYWtlLmNyb3NzwqAtTyB+
L2Jpbi9tYWtlLmNyb3NzCj4gwqDCoMKgwqDCoMKgwqAgY2htb2QgK3ggfi9iaW4vbWFrZS5jcm9z
cwo+IMKgwqDCoMKgwqDCoMKgICMgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGlu
dXgvY29tbWl0LzUwNDY3NzRjMDNhMzQ5NmMxOTA2OWI5MjM3ZmVlODUyNzNjMjE1YWEKPiDCoMKg
wqDCoMKgwqDCoCBnaXQgcmVtb3RlIGFkZCBsaW51eC1yZXZpZXcgaHR0cHM6Ly9naXRodWIuY29t
L2ludGVsLWxhYi1sa3AvbGludXgKPiDCoMKgwqDCoMKgwqDCoCBnaXQgZmV0Y2ggLS1uby10YWdz
IGxpbnV4LXJldmlldyBMdWNhcy1TdGFjaC9kdC1iaW5kaW5ncy1zb2MtaW14OG1wLWhzaW8tYmxr
LWN0cmwtYWRkLWNsb2NrLQo+IGNlbGxzLzIwMjIxMjE0LTAwMDI0NQo+IMKgwqDCoMKgwqDCoMKg
IGdpdCBjaGVja291dCA1MDQ2Nzc0YzAzYTM0OTZjMTkwNjliOTIzN2ZlZTg1MjczYzIxNWFhCj4g
wqDCoMKgwqDCoMKgwqAgIyBzYXZlIHRoZSBjb25maWcgZmlsZQo+IMKgwqDCoMKgwqDCoMKgIG1r
ZGlyIGJ1aWxkX2RpciAmJiBjcCBjb25maWcgYnVpbGRfZGlyLy5jb25maWcKPiDCoMKgwqDCoMKg
wqDCoCBDT01QSUxFUl9JTlNUQUxMX1BBVEg9JEhPTUUvMGRheSBDT01QSUxFUj1nY2MtMTIuMS4w
IG1ha2UuY3Jvc3MgVz0xIE89YnVpbGRfZGlyIEFSQ0g9bTY4awo+IFNIRUxMPS9iaW4vYmFzaCBk
cml2ZXJzL3NvYy8KPiAKPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dp
bmcgdGFnIHdoZXJlIGFwcGxpY2FibGUKPiA+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4KPiAKPiBBbGwgd2FybmluZ3MgKG5ldyBvbmVzIHByZWZpeGVkIGJ5
ID4+KToKPiAKPiDCoMKgIGRyaXZlcnMvc29jL2lteC9pbXg4bXAtYmxrLWN0cmwuYzogSW4gZnVu
Y3Rpb24gJ2Nsa19oc2lvX3BsbF9wcmVwYXJlJzoKPiDCoMKgIGRyaXZlcnMvc29jL2lteC9pbXg4
bXAtYmxrLWN0cmwuYzoxMDU6Mjg6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbiAnRklFTERfUFJFUCcgWy0KPiBXZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dCj4gwqDCoMKgwqAgMTA1IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgRklFTERfUFJFUChQX1BMTF9NQVNLLCAxMikgfAo+IMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBefn5+fn5+fn5+Cj4gwqDCoCBkcml2ZXJzL3NvYy9pbXgvaW14OG1wLWJsay1jdHJs
LmM6IEF0IHRvcCBsZXZlbDoKPiA+ID4gZHJpdmVycy9zb2MvaW14L2lteDhtcC1ibGstY3RybC5j
OjE0Njo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yICdpbXg4bXBfaHNpb19i
bGtfY3RybF9wcm9iZScKPiA+ID4gWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+IMKgwqDCoMKgIDE0
NiB8IGludCBpbXg4bXBfaHNpb19ibGtfY3RybF9wcm9iZShzdHJ1Y3QgaW14OG1wX2Jsa19jdHJs
ICpiYykKPiDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgo+IMKgwqAgY2MxOiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4g
Cj4gCj4gdmltICsvaW14OG1wX2hzaW9fYmxrX2N0cmxfcHJvYmUgKzE0NiBkcml2ZXJzL3NvYy9p
bXgvaW14OG1wLWJsay1jdHJsLmMKPiAKPiDCoMKgIDE0NcKgwqAKPiDCoD4gMTQ2wqDCoGludCBp
bXg4bXBfaHNpb19ibGtfY3RybF9wcm9iZShzdHJ1Y3QgaW14OG1wX2Jsa19jdHJsICpiYykKPiDC
oMKgIDE0N8KgwqB7Cj4gwqDCoCAxNDjCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBjbGtfaHNp
b19wbGwgKmNsa19oc2lvX3BsbDsKPiDCoMKgIDE0OcKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IGNsa19odyAqaHc7Cj4gwqDCoCAxNTDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBjbGtfaW5p
dF9kYXRhIGluaXQgPSB7fTsKPiDCoMKgIDE1McKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsK
PiDCoMKgIDE1MsKgwqAKPiDCoMKgIDE1M8KgwqDCoMKgwqDCoMKgwqDCoMKgcHJpbnRrKCIlc1xu
IiwgX19mdW5jX18pOwo+IMKgwqAgMTU0wqDCoAo+IMKgwqAgMTU1wqDCoMKgwqDCoMKgwqDCoMKg
wqBjbGtfaHNpb19wbGwgPSBkZXZtX2t6YWxsb2MoYmMtPmRldiwgc2l6ZW9mKCpjbGtfaHNpb19w
bGwpLCBHRlBfS0VSTkVMKTsKPiDCoMKgIDE1NsKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFjbGtf
aHNpb19wbGwpCj4gwqDCoCAxNTfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gLUVOT01FTTsKPiDCoMKgIDE1OMKgwqAKPiDCoMKgIDE1OcKgwqDCoMKgwqDCoMKgwqDC
oMKgaW5pdC5uYW1lID0gImhzaW9fcGxsIjsKPiDCoMKgIDE2MMKgwqDCoMKgwqDCoMKgwqDCoMKg
aW5pdC5vcHMgPSAmY2xrX2hzaW9fcGxsX29wczsKPiDCoMKgIDE2McKgwqDCoMKgwqDCoMKgwqDC
oMKgaW5pdC5wYXJlbnRfbmFtZXMgPSAoY29uc3QgY2hhciAqW10peyJvc2NfMjRtIn07Cj4gwqDC
oCAxNjLCoMKgwqDCoMKgwqDCoMKgwqDCoGluaXQubnVtX3BhcmVudHMgPSAxOwo+IMKgwqAgMTYz
wqDCoAo+IMKgwqAgMTY0wqDCoMKgwqDCoMKgwqDCoMKgwqBjbGtfaHNpb19wbGwtPnJlZ21hcCA9
IGJjLT5yZWdtYXA7Cj4gwqDCoCAxNjXCoMKgwqDCoMKgwqDCoMKgwqDCoGNsa19oc2lvX3BsbC0+
aHcuaW5pdCA9ICZpbml0Owo+IMKgwqAgMTY2wqDCoAo+IMKgwqAgMTY3wqDCoMKgwqDCoMKgwqDC
oMKgwqBodyA9ICZjbGtfaHNpb19wbGwtPmh3Owo+IMKgwqAgMTY4wqDCoMKgwqDCoMKgwqDCoMKg
wqByZXQgPSBkZXZtX2Nsa19od19yZWdpc3RlcihiYy0+ZGV2LCBodyk7Cj4gwqDCoCAxNjnCoMKg
wqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gwqDCoCAxNzDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+IMKgwqAgMTcxwqDCoAo+IMKgwqAgMTcywqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gZGV2bV9vZl9jbGtfYWRkX2h3X3Byb3ZpZGVyKGJjLT5kZXYs
IG9mX2Nsa19od19zaW1wbGVfZ2V0LCBodyk7Cj4gwqDCoCAxNzPCoMKgfQo+IMKgwqAgMTc0wqDC
oAo=

