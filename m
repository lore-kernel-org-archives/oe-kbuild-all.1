Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A488B525C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 23:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690586761; x=1722122761;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2W6OEq8WInLr+MMp7BrvZvj21L8nvZ0tJmzCKUyhbBc=;
  b=aNMMazPWpCJQFWmkthfrJQ734QSw4YIJHP7BCzeq1CwaAmuG90uYqweO
   VVf6rWGYHGVWYTP1IPQRahCWUMJusFGJisJfjlvJlhOS9jk3POd6xGc/U
   71ZZ9gfrPGbGLUAMNA6G+jWyhgW1a7qKGniKiNoOHHo1EPwlaFHzi8zK6
   4qUHaM8DGZtyj2WrOAzbTirUCicJHKg/tXVbSb2VZppIfzcz/SVdDWWHs
   KPr5UfrYEdKvOX5R4npRmF/Kg13IRDlNmMT/Z5KAWdfbXOqCongtep0pJ
   JtsUBYkmR898doC2vp9h7N40jr4B4/gX2316+0boTZbW3rIjSBsl61FCG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="348308671"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="348308671"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 16:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="704742781"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="704742781"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2023 16:25:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 16:25:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 16:25:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 16:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENAUw9fIns2AcNmzs5Z1ZQmKnVAT/cs8cCkj+VaUbIchcCby8LqQtoDwBOLs8owUI3UEz/J83xGeT9ALlYySAKQNRcmRLpKJssq8SiH2znJrYdqgaHbZaY4MYtNWY6o7OX8k85CoGed0McF6C7qaWBkP7CcX5p2EeEsofZ05aP1N313snl31v+GoT49oiQnm5J2MtxYTTpMNE+hN07OvPzm3XnUm0zJJyXzgkETUJORG7/VNiJrDmMpazA4k1GRP12yiS94bEIIpGB97irjUU8FHKMLIhcT0mIEXdSkPsNT0av1ZNKRNYIyFgcYkxt1iHjCDM3QRGYjY/ZIlfV1C9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2W6OEq8WInLr+MMp7BrvZvj21L8nvZ0tJmzCKUyhbBc=;
 b=boH3rlBr9Z8IuUCitEWnTAA1p5VS8eM+UiqH/M1oezIl88jzUswN8fqnSW+LTQn8z/cLRO5feVo5IaFwc17vKvYrEKF3pbGC65Ab6qZr9ohzLZ0hEGeD1ii4XiarZLHAcOnWXAdE6pxwCt9eeWmoyxixGbDZtmYJdP1zj0qF8UPrjAtxnu7sEvfw/GsRwbGVJxDs9kpCZpysK/WMPoCeTJEeLoLQllwH9yRwB5pwEUhNTmmplIWXRU+7kbjf63un9tksUwoHRLCrOe6nYJqWLjaZqETC6XB89ryK13VJhy7IG+HK0JZWf+9wlB9OU9xmIWjbApEZdwWPBzeJhgqQ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DS0PR11MB7532.namprd11.prod.outlook.com (2603:10b6:8:147::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 23:25:51 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::abd2:f781:1433:259]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::abd2:f781:1433:259%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 23:25:51 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: lkp <lkp@intel.com>
CC: "Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"keescook@chromium.org" <keescook@chromium.org>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [tip:x86/shstk 6/42] htmldocs: Warning: arch/x86/Kconfig
 references a file that doesn't exist: Documentation/x86/shstk.rst
Thread-Topic: [tip:x86/shstk 6/42] htmldocs: Warning: arch/x86/Kconfig
 references a file that doesn't exist: Documentation/x86/shstk.rst
Thread-Index: AQHZwIFY2Gh/GaL4JU66etO9o2WNT6/P1K0A
Date: Fri, 28 Jul 2023 23:25:51 +0000
Message-ID: <4bb0b480c0bc514dd9e6472ab420b3da51011beb.camel@intel.com>
References: <202307271956.IxoG9X0c-lkp@intel.com>
In-Reply-To: <202307271956.IxoG9X0c-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DS0PR11MB7532:EE_
x-ms-office365-filtering-correlation-id: 507e2d78-9322-426d-cbea-08db8fc1fba1
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MHxEWtgseko40h4oXk00BQpRcRo2HYm0rvqiTHCvQp46TwsqniNoo9YReZbFwmaVkO0pCTMaBBFtU+vkgt0Z79UyBti5/LShVDQDGjwYQWSy+P9O2wvNp4mskBP98TobQtNLkD2s36sQDpMapoHPFol0r+KRa1qhmKJdWA8LQ7ywfS4IXgiGSCAYecgWmxHwWicyhhrQJ/OgbFCTwbu3tLTOyo9mSwkl625+AhEYYx+W71/kJzTtivNaaSknjJaw0Pz7P0X8JH+zvOB38Y7ScssmtB2l7TMLiyCVsr5Fce+gSHOCKrak2YmTvEpcLegs8DLYp7tGF04gQ/JPCYZ7o01KUQWuyS60bamI+uW1YEv5n2eADjwIIbZ4MBq5h6OvtCV8ySZGPdIuj6vivPqDa8Oqhpq5myBCKdGfpHMMl2sl5KzkKSfuEIicCxBiZ7jLeY1wtLljPRkgdGTC7u2FVhlUfA+T1fE2I4WX79jlYTI9hFX21rsBS4ZablESS1bctu85fPE8oMSkftBdCeC+89DJetFOZq3wnkWTJd3h2G2HTQ1FTW3eoTSjKUgVFbOvmeRDcZcLQXfThkyfxcRiuo4XIyYJcgy06+vxqtdodlSkuhTuBCBEDJjkHq/IZQq63z9Vpw6d6POLBOIOcT+Otg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199021)(966005)(37006003)(54906003)(478600001)(6486002)(6512007)(83380400001)(38070700005)(86362001)(36756003)(6636002)(2906002)(6862004)(66476007)(2616005)(66556008)(186003)(71200400001)(6506007)(26005)(82960400001)(66446008)(66946007)(38100700002)(122000001)(316002)(41300700001)(5660300002)(8676002)(76116006)(91956017)(64756008)(8936002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTFCZ0FtZk0wK1MySXZJUFdvcDJlWE1QMnVKRjNaY2Nrc212RElic2szbVdK?=
 =?utf-8?B?NGEzbHpTQXZKRkdXVjVCUDhMeTMxYXl3d0FKSXdjMVNFUTJwbjVpS2pUdEVQ?=
 =?utf-8?B?RE5RVm9zdmJNVW1vcXpJa1JTS0lVb0E1QkdyczN4TVBkZFhiY1oyZXR5VnZT?=
 =?utf-8?B?VitPUnZSb09BdmpLdnl4cjdmam5JZlZDc3VHd1gvYnFxVnlxa3h5RkV2OCt5?=
 =?utf-8?B?ZnRFSmIwRTZzdzBsa1B1Y3kwSjR6NUphTVYzZWZSdnhQVEhHT3dYUjQ4WGZk?=
 =?utf-8?B?ZU5kTy92dTl0aktKMUpXaCtnRnhBV01oaUt3L3lNYjAvMWRZOGtzaVhLTXFI?=
 =?utf-8?B?MStiWGEwZXdpZkhBeG04R05rNUlxK1p6RGlmdlpmUTg2YWVmajM0dSs1TzVY?=
 =?utf-8?B?dWVyU3BHYnNDVlhaRk1yVTB0K2NsVkdVN2JIZDYySWMwM2Rtb0JWYWVYcWhW?=
 =?utf-8?B?dlA4YjFMaVFNRDN3Y3RMcmU0bHAvOEFraXd4aEI0bDQ4V052dEpXZlIvdUth?=
 =?utf-8?B?NkdxS2R3RjZRRFMvcDlvanRRNWdsREZDdVRhZGJRNFh2eGZMOUdSK3F2TVQv?=
 =?utf-8?B?M2tsZVkzQ2Jpb1J0SzRvQzAzUmxRQTNzcDc5Z3UwcjREa3ByWkNIeE9mY0NV?=
 =?utf-8?B?S1h0Um9lWWkvTUkwUzkwd3Y5QXplTmJPTStPN0dzc1NoRzRsVGRZVXdRc3d6?=
 =?utf-8?B?YnZvWEVyekYvbk5QU1MzOFlvS0pTL082d3QvMVJYNithWEp5Z2VTUkROMVlO?=
 =?utf-8?B?WlJpcEU1NkI5QmREK3N5Q0V2ZXAxQk00eTFPdy9sVzY5enpUR3hZR0MzanNo?=
 =?utf-8?B?aUJCVG5DU0pIWSs1WE8ySW5JTkg3NEFMSE4zYnJjY0dkcGhXRFo1L09ObFM5?=
 =?utf-8?B?enBIWXZqRllqeERoOUF4NWdkbGswc09WcnUxNnNkZG9RQWUxVGRvNCtpQ2Ji?=
 =?utf-8?B?ZUhXS3BaeVdHZ0tVR1d4NFJ1RDU3Vk44dEVoejVvRkJWWHlOSEExR2kwalBB?=
 =?utf-8?B?Y0VQdE5QZnRZTW1tL0xZV0JETkl0VHUvRjJReGtMZUN4cGNnaEFjdmZseVRI?=
 =?utf-8?B?Wk5BMHJsTXQySElyYkNQRGdrR05hZ3dXQ2tyTm43RzU3aWJvc05pcmsvUWc3?=
 =?utf-8?B?WkRoZVIzWTN1Q0NGR2ZyZ0FZYkdJM1dUTGhOb1Q3ckh0L0xDK20rNHZIdDhQ?=
 =?utf-8?B?ZnVnSUFXRDRLamdkczlOWUlhck5LK0dmUGdlZXJieXFpa1pJYW44KzBOZHM0?=
 =?utf-8?B?NENOVGZEaFZIUE9LU3hoUklDRWUxT3RRK0VhNXdqZk9kOU1lNTRieDZBYXZB?=
 =?utf-8?B?akg4a2VGamR2RGhnK0d1U2dqYmNqNkxHVHprQVdibGMzS1RLVWNvTHo5VUE2?=
 =?utf-8?B?dDNoOHhYNmtBbkRwVjA2L3p2WjhDbERIdVVlTTdZUWh2TUZlRkRJNkNBWnZ4?=
 =?utf-8?B?WVUrVnV0S2RPeVo2cnlmN1Z6R0JzVHhBMmNtVld2R29jMU43VHlNTGdZM1Bx?=
 =?utf-8?B?ZWgyTkFKMEJUT1UrZUErRGRjb0N5Uy9xSnpITUtqRzc5RzVFMUp2MUtJcFpI?=
 =?utf-8?B?QXFMcGtXd2tKQ2JTRk9Mb0VpZEN5TlcxVTdtbzQvaXY1a2dUNXZ5dEJwdSs2?=
 =?utf-8?B?NUpMdklubVkrR0hYb0FCend2Y0JUUSsvTTBSOCtPYllXZ0kyU1M0d2tRZ3ZD?=
 =?utf-8?B?QmNMU2gzdmFqM0Q2eWRWb3dneFRITFkxbStjdUl6ellLcVNoN0I5bFhQMFow?=
 =?utf-8?B?SXhvRHdZRVhGQW9CSG4yUkRjSitiQTN0REdtbVdXVWMwaFFJSEM5MUliMUF5?=
 =?utf-8?B?MklRTEE0WEQ3SmpYOWt3MGxLSU81a3czczVmbDloc3lmUktHYVpXajg4cElH?=
 =?utf-8?B?RzEwVlk3RjdHNlkrRVZoWXNqRUFuL0dHeHN2YnAyZm1ndmRSVXRjRkg0OU1U?=
 =?utf-8?B?R2hxYkZQVjQ3NzR6UEVSeWdzUFcwZmE4VUQ0WitoYmNZcHh2VHlWUFJ0eEQv?=
 =?utf-8?B?ZUlkQUFsTE8yT0l5Z3FvL1dKT0ZIaVVMN0pnU0M0b0N1eFJKVW9UNkVodHBY?=
 =?utf-8?B?NXVWQ1hSUTJqQzZxc3J5cW52UlFHc1dNblRrVHlDZzViZXgrdmUrTEN0K20w?=
 =?utf-8?B?aG5OTzFVcWhEYzUxNlVsRGpVZTJDS3p0emdCREpsLzhrdVBnWVF1aTlObEJ0?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <595662E308827D48B92ABA8582FA8774@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507e2d78-9322-426d-cbea-08db8fc1fba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 23:25:51.5713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qiAuLHIEn7EeA6QlcKV9DKof5p1k3D56GfcI02R2gCr3dPj/E4RcGNVQf1/1BBj7TNrCVSnXT0aRdfv4lukREkvS0qJK5bq+vsNS78oR/sQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7532
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDIzLTA3LTI3IGF0IDE5OjU1ICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToNCj4gdHJlZTrCoMKgDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RpcC90aXAuZ2l0wqB4ODYvc2hzdGsNCj4gaGVhZDrCoMKgIGMxOWExNTNjYzBi
MTcyYzhlMTg2OWQ2ZGVlNTJmNmFhZGQ3M2QzYzQNCj4gY29tbWl0OiAxOGU2NmI2OTVlNzg3Mzc0
Y2E3NjJlY2RlYWExYWI1ZTM3NzJhZjk0IFs2LzQyXSB4ODYvc2hzdGs6DQo+IEFkZCBLY29uZmln
IG9wdGlvbiBmb3Igc2hhZG93IHN0YWNrDQo+IHJlcHJvZHVjZToNCj4gKGh0dHBzOi8vZG93bmxv
YWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIzMDcyNy8yMDIzMDcyNzE5NTYuSXhvRzlYDQo+
IDBjLWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQ0KPiANCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUg
aW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcNCj4gdmVyc2lv
biBvZg0KPiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdz
DQo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiA+
IENsb3NlczoNCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMw
NzI3MTk1Ni5JeG9HOVgwYy1sa3BAaW50ZWwuY29tLw0KPiANCj4gQWxsIHdhcm5pbmdzIChuZXcg
b25lcyBwcmVmaXhlZCBieSA+Pik6DQo+IA0KPiA+ID4gV2FybmluZzogYXJjaC94ODYvS2NvbmZp
ZyByZWZlcmVuY2VzIGEgZmlsZSB0aGF0IGRvZXNuJ3QgZXhpc3Q6DQo+ID4gPiBEb2N1bWVudGF0
aW9uL3g4Ni9zaHN0ay5yc3QNCg0KTG9va3MgbGlrZSB0aGUgeDg2IGRvY3VtZW50YXRpb24gbW92
ZWQsIGFuZCBpdCBqdXN0IG5lZWRzIHRoaXM6DQoNCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9LY29u
ZmlnIGIvYXJjaC94ODYvS2NvbmZpZw0KaW5kZXggZTg2MGY4MDUxOTlmLi45OWU3NTUyZmZmNGYg
MTAwNjQ0DQotLS0gYS9hcmNoL3g4Ni9LY29uZmlnDQorKysgYi9hcmNoL3g4Ni9LY29uZmlnDQpA
QCAtMTk2OSw3ICsxOTY5LDcgQEAgY29uZmlnIFg4Nl9VU0VSX1NIQURPV19TVEFDSw0KIA0KICAg
ICAgICAgIENQVXMgc3VwcG9ydGluZyBzaGFkb3cgc3RhY2tzIHdlcmUgZmlyc3QgcmVsZWFzZWQg
aW4gMjAyMC4NCiANCi0gICAgICAgICBTZWUgRG9jdW1lbnRhdGlvbi94ODYvc2hzdGsucnN0IGZv
ciBtb3JlIGluZm9ybWF0aW9uLg0KKyAgICAgICAgIFNlZSBEb2N1bWVudGF0aW9uL2FyY2gveDg2
L3Noc3RrLnJzdCBmb3IgbW9yZSBpbmZvcm1hdGlvbi4NCiANCiAgICAgICAgICBJZiB1bnN1cmUs
IHNheSBOLg0KIA0KDQpEYXZlLCB3b3VsZCB5b3UgbGlrZSBhIHByb3BlciBwYXRjaCBmb3IgaXQ/
DQo=
