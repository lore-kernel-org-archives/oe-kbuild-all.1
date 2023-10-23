Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969EF637
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 02:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLLqpoFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698029024; x=1729565024;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YZAv3GStLtlWksXvM3K1u3RLTNUfUogAtBEYyJ5Hxo8=;
  b=VLLqpoFhjh5XIZQhpF7NvB5aFfIUpyiSp+0x3LcLnloPbWyEsTJ4Hocs
   uRIp+ybZtC0CNIrq4bligzVjD7OsdFcnnTVaP1KXx18B06GeyVPiWg3da
   Qb6CDlJA5r3KdQnelL846fU9AmhvM4z6BsJduXp0i/T+8AkLCd2ZuXOWQ
   kxGMUvSxQjGI4v9OXQob9CF5S/HjTnHK3trVGGAWHFfPPIiIIHuLxlKha
   FVFDblNVpx3oRUnsIciavdGncUb8fK11HYn4llfiKXwuhlJ0fpoH9aq65
   exhrSe4S+jSYSdSyP2HWmvjdg2FmYVJRmrbYcLAU5K9SqRS/+7wh6tSFl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="383954640"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="383954640"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 19:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="881610260"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="881610260"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Oct 2023 19:43:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 22 Oct 2023 19:43:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 22 Oct 2023 19:43:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 22 Oct 2023 19:43:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCmuc+NISveS+3dmMxNd8rrs1LgNoEMdsNqofpruoFRxCmciprMlvtsAlexaEVlgWbHHaGwZFjcOtMHhM9jCSiFpcUVsFGAzqrX9Zqr9hzbpd69WZt++o/9V13n8HNLyMyPleu+owH2Advpz/mzn72nDgE1g60vINePd10sm9vhx7xfJnbR2ysh4R6n+Zewmyu0MsxzpL2yMSGl4+NANjkzhI+Df0ItM/OmhX+IQf74Eo7OHxwS2SwfzlVMyBF4JzV7iedKKP6QjJ+5o1wuON+HFlvgJqncGTAG9uov8Olmwq3L75mpxOdjSkZChFgx1xA8+sSpsZi523kQzrstVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZAv3GStLtlWksXvM3K1u3RLTNUfUogAtBEYyJ5Hxo8=;
 b=UUgC9Xc/JM62QuvsT4GtRWOHCrOIBKc3hUUR8hRAIG71EoJdu6Ej7fAeG3GuujALpo3IHmJUfI732cjPZ2NZwvLSM8W3fOhGLnPkNfeGmXq4wswPQaM3tIEjgE3IjyZEAtWyuNcfl/PFhs8KeTCMMqyTqNvhHCRIjiiQY1kyuXSVUtMzLWRTt78SmRiTDoGenw+XoQ1UA0L1+2doeTNLj5Mzs0tYm5QFVr5Un/ineYlAvZ0cveYI45r3gn5Fa6DnNzE09ZnbU4/Y/yu1MEVJz6uCQioU+FbnjDtRfPeVi+Y06lN7RqjU55hPIgwJYRxfw3XsAFc/ag0b3Kpr1AfbEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 SN7PR11MB6947.namprd11.prod.outlook.com (2603:10b6:806:2aa::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Mon, 23 Oct 2023 02:43:40 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::3a0b:e3e7:ea60:1e3c]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::3a0b:e3e7:ea60:1e3c%3]) with mapi id 15.20.6907.025; Mon, 23 Oct 2023
 02:43:40 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: "chuck.lever@oracle.com" <chuck.lever@oracle.com>
CC: "cel@kernel.org" <cel@kernel.org>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, lkp <lkp@intel.com>
Subject: Re: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for mapping
 bio_vec arrays
Thread-Topic: [PATCH RFC 3/9] dma-debug: Add dma_debug_ helpers for mapping
 bio_vec arrays
Thread-Index: AQHaAtTI7RcMWld5wE+d00DCkE0j4LBRwFgAgATuIoA=
Date: Mon, 23 Oct 2023 02:43:39 +0000
Message-ID: <4a2b50ebbe3704f20c516248806453f919726349.camel@intel.com>
References: <169772915215.5232.10127407258544978465.stgit@klimt.1015granger.net>
	 <202310200545.ScAzFYdK-lkp@intel.com>
	 <D61BB9F1-C4AC-4654-9F0D-8FB4F3A737ED@oracle.com>
In-Reply-To: <D61BB9F1-C4AC-4654-9F0D-8FB4F3A737ED@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6397:EE_|SN7PR11MB6947:EE_
x-ms-office365-filtering-correlation-id: 5fc033cc-6f35-472d-7e9f-08dbd371dd19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LYxNnYkQpEImDrHO2z1Mjo+Jz6MHa+HF8swLTw5Ey6WVosZjWExq9d2b0Xxr/aZ2tO32fsiFlqFOGQm6NYAGi0qMBtFLTvOByMMZOCLA2jhvc+p6OPFmiirdCzLets4NFUvmhcnHObI5RceNO8FGBNqofzNSPwut+mkf6bYia1zWJWmW8bkRe4we7KU3vn+tF2neBBYRWGdGemlc7MA48G46f2cNSmI0XOELN7dNj6i+ywiorNW3MdpG8g4RNjILA0JT9hHFMNzsYvQ4hyLBgo8l9m5eFc/27QrtmbgiaGLA6L++ZbQ7Z4hRpCsDwgNpT5XrEGmNAVMSxQXUb86LAmN35SXqBFeSIeo5NiPVikED2EPBFxYtU1Yfc3pyGiFwgV6K6Qccca7LAfzKiKeVeILjby92DzqOedlu1kxGyln8gZoSHH/lvY4lD+AmCdr3V3H1Tu1YOmQZo2ER4cuqJgjceRmawP3wXgVp9jd96w2jVm4QsXc8OUU+N0mgigAjIwUZBVR6L6jlZ5rabsVb1UouSljSfzQ8WaFPUHIBd7/g5K0osY6WpU33p6nPpG/QUhFtWs4zdUXPU0dlv40jHG3eKHeIdNUmwCZd0HZkMXR2JEcS65TndAI6gXiwQ6l7G/ksfshfKvgK3BrbDWvYhw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(366004)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(4001150100001)(2906002)(41300700001)(107886003)(26005)(2616005)(36756003)(122000001)(86362001)(82960400001)(38100700002)(83380400001)(5660300002)(6512007)(6506007)(53546011)(54906003)(66476007)(66446008)(64756008)(6916009)(316002)(478600001)(66556008)(91956017)(76116006)(66946007)(966005)(6486002)(71200400001)(38070700009)(4326008)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzVMbWxpUmsxbGEyNm5RSkQrQWV0ZGMyVmNLMXBOUkNSOVBiSjBjZXZFbmJD?=
 =?utf-8?B?V3BnWlpyODJ0YTdTNGQ2dmIzTzFvQmY1clF0QmpoRk5LaWN1N0FwR0JMQVdO?=
 =?utf-8?B?MDlGdmJVNVpQSW5lYVhicHlqbFpJYXovQ2xyUlRzOFhxRzZJOVhwU3Zmdmtm?=
 =?utf-8?B?ckV4NEJ1M1FpZG85eGZLWHMxUHRVeWFudk51bWExc2ZMeGdRbzVJTTBZc0pu?=
 =?utf-8?B?ZU5MQUJFc2NZNUVlbmtvZEJudG5lQmp4dDJ0ZCtwOWlUb3Z3bUF0ekpDNXkv?=
 =?utf-8?B?MlVKVGFqakNqSlNxN21rbGg4QmtWeWlTajNySTQ5WkVHaWhYdTkxYlNVM2F4?=
 =?utf-8?B?c2NpbC9OOEVHVU9YV0JSbURsWGhzaU9vUE5TZm1wdmc0T3dVc01sQmN3OTU4?=
 =?utf-8?B?aUhjTDhBdVQ0dk5Dek1FeDIrSjlSZDZtZVY3WDBnT3M3enR0eDFqbTdwb1o1?=
 =?utf-8?B?Ty9mRXJhMXVWTGhSakVrOSsxck1WR1NxVERUSDQxM2NVQkF3OXMvMzB5NXZi?=
 =?utf-8?B?TVJmOVh1TldkMzNJMlp4RW1QS2RjWlVGa3pMYjRGbHFKZTBjRktiUURsSm9j?=
 =?utf-8?B?WTU1V3VEWENUak1RK3lmUVN4ZE1udHRjRTJJQ3RPR0tEZG54L0dlL3lqM1Yy?=
 =?utf-8?B?SEw3ZE9vZFVUb1p6UHpZSG8yK1MxZXR1L3U5TVl1WG1RbWh6ZjAwTGRBZUNs?=
 =?utf-8?B?T1FROW42aHRsNGtGVysxTjVGRzFsTWs1SkJRNU5BODNGbWZCOTZvK3BzdnFU?=
 =?utf-8?B?SUNJQUNOb0Vjck5zN0cwbXl6STM4NmYrQy8yZXptTFFVRHN5UnVNR0JZejVU?=
 =?utf-8?B?cFNldlliTkhSUm1NQU5XbSs3WVB4TE9MNW96amlRZG9kbzRZbElUQzZ0WjFK?=
 =?utf-8?B?K2dPa0NkUDIvZ1VvSHkwZ2MzUVdteU45SFFpMmJXYTYvMWRFV1gyMEpJZ243?=
 =?utf-8?B?eUZnVE1uL2VodVdXQldTUmVqYnJadFVncmdLYkRrNmZCMUZWSkF3YXJLbHhI?=
 =?utf-8?B?T3dGTlFFK2Jja2NPQW1uRlpiWHZJYy96K29JOCtCMlVaK3J2bTBHMDU3N2JC?=
 =?utf-8?B?b1FpQ0pkUkhjYVlseU13WnFrUHdsV2ptc0ZxUHJHdDNCSmxoMWZUbGRHeUpQ?=
 =?utf-8?B?NitFRGtGbkd3bFRGUDhtQ2ZoSkJxbTFnRzBiSUdWUlV0dWhhdldSS3R5Wmk4?=
 =?utf-8?B?cG02VmZ3WndXZTB6RUpyQWQ2SnIzYnQrS2x2M3hucTBMbERWcDFEWXVPUHQw?=
 =?utf-8?B?RHpwY09RbkhSYUhkUkwrWWM2RmVuTFNsdCthMjUxU2MyaTRFeEhLMG4wS1F6?=
 =?utf-8?B?ZUJPWmtKbjlsZWk3cVk5eGxTVEZWc3VMYTZ5N0VTeG5Hdlg5QVdwTXRmTkp5?=
 =?utf-8?B?eVVQZ2xQODNCdFJkU1FvS1ZhS25EZEhIS0VON0d1YXpjOU5kWDNxdDIrNEN6?=
 =?utf-8?B?YStKOE1jYisvY2U1czFFYUZwTjk1TFdDa2Z5YWk1bEx0Y3ZZMXNMVGJ2ZW5O?=
 =?utf-8?B?V05xNlQ5b3psMjZoSUY1aUxHVlNVdmtKanNPVUJwWlRCb3I0alZKeHp6Z2Zt?=
 =?utf-8?B?REpuUzQ3WW8ydU5PRWtMM01VVSt6K3p0aGVhcXQwS2ZQY0xST1d1cE1zQjNI?=
 =?utf-8?B?bUFWY0VxaTZxbEdhQ0VYTWtrYTFQK2RkK0p4cW5uT0doOTFLZ09KQkozWlZX?=
 =?utf-8?B?S2NpMm1yZ0xlbG0rZTdHNWV1bXNYTDJnU2RLL0JLMFZlTUVaeFlpMk9MRjZy?=
 =?utf-8?B?U1NFcjB3S0lVdkJEU1E1V0pWLzc0L2U2YlJiNStQc2RNN2U0MTFYdDZLOVE4?=
 =?utf-8?B?RWRidHg1a0d4Wm53SWVZejZiWVY1Sk9zajJ5VG95VSs4MVd5UDNua0NESDVG?=
 =?utf-8?B?Rm11cWlxdm5SVEltQkV1MFk1WjlkNyttT1QxQTdiZXBkTVdUWFlZSXU4dlNJ?=
 =?utf-8?B?WTZENitSRjF6WXF5VHlXRWNXSjQ5RFFJTjhRcU4ybGJQcVJmSUpacDBJeU1s?=
 =?utf-8?B?V005bDRMM2JXWkZHVEFkcUh5ZjNQSHA0aE1iWEUvWVFVd3JIaDhZYkppZVVJ?=
 =?utf-8?B?TWRiS0xpN09vNVNNRFFTeFJNZXNhYk5UVE1YZmUwdFNUUGEvT3BidVBPWGNW?=
 =?utf-8?B?Sjc4TXlJNTZKaVZOQnllWDF0YWN1U1N0ZzlOS05hbXVmQTdxeTduTUl4N3My?=
 =?utf-8?B?Z0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5ED1C226107F4B448F9FBA47BF165D7B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc033cc-6f35-472d-7e9f-08dbd371dd19
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 02:43:39.6993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 06DlCNKCj4IeVVX0bfzHD0TIcHSP1ULN89CcXh4ELjniVbZcbFyOiHLMjIbvq90zpTAugaCFgNjl2A291FdXXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6947
X-OriginatorOrg: intel.com

SGkgQ2h1Y2ssDQoNCk9uIFRodSwgMjAyMy0xMC0xOSBhdCAyMzoyMSArMDAwMCwgQ2h1Y2sgTGV2
ZXIgSUlJIHdyb3RlOg0KPiANCj4gDQo+ID4gT24gT2N0IDE5LCAyMDIzLCBhdCA1OjM4IFBNLCBr
ZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gSGkgQ2h1
Y2ssDQo+ID4gDQo+ID4gW1RoaXMgaXMgYSBwcml2YXRlIHRlc3QgcmVwb3J0IGZvciB5b3VyIFJG
QyBwYXRjaC5dDQo+ID4ga2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1
aWxkIHdhcm5pbmdzOg0KPiA+IA0KPiA+IFthdXRvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiBha3Bt
LW1tL21tLWV2ZXJ5dGhpbmddDQo+ID4gW2Fsc28gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIHJkbWEv
Zm9yLW5leHQgbGludXMvbWFzdGVyIHY2LjYtcmM2IG5leHQtMjAyMzEwMTldDQo+ID4gW2Nhbm5v
dCBhcHBseSB0byBqb3JvLWlvbW11L25leHRdDQo+ID4gW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGll
ZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS4NCj4gPiBBbmQg
d2hlbiBzdWJtaXR0aW5nIHBhdGNoLCB3ZSBzdWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBhcyBkb2N1
bWVudGVkIGluDQo+ID4gaHR0cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2gj
X2Jhc2VfdHJlZV9pbmZvcm1hdGlvbl0NCj4gPiANCj4gPiB1cmw6wqDCoMKgIGh0dHBzOi8vZ2l0
aHViLmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4L2NvbW1pdHMvQ2h1Y2stTGV2ZXIvZG1hLWRlYnVn
LUZpeC1hLXR5cG8taW4tYS1kZWJ1Z2dpbmctZXllLWNhdGNoZXIvMjAyMzEwMjAtMDMyODU5DQo+
ID4gYmFzZTrCoMKgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2FrcG0vbW0uZ2l0wqBtbS1ldmVyeXRoaW5nDQo+ID4gcGF0Y2ggbGluazrCoMKgwqAgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNjk3NzI5MTUyMTUuNTIzMi4xMDEyNzQwNzI1ODU0NDk3
ODQ2NS5zdGdpdCU0MGtsaW10LjEwMTVncmFuZ2VyLm5ldA0KPiA+IHBhdGNoIHN1YmplY3Q6IFtQ
QVRDSCBSRkMgMy85XSBkbWEtZGVidWc6IEFkZCBkbWFfZGVidWdfIGhlbHBlcnMgZm9yIG1hcHBp
bmcgYmlvX3ZlYyBhcnJheXMNCj4gPiBjb25maWc6IG02OGstYWxseWVzY29uZmlnIChodHRwczov
L2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyMzEwMjAvMjAyMzEwMjAwNTQ1LlNj
QXpGWWRLLWxrcEBpbnRlbC5jb20vY29uZmlnKQ0KPiA+IGNvbXBpbGVyOiBtNjhrLWxpbnV4LWdj
YyAoR0NDKSAxMy4yLjANCj4gPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0
cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjMxMDIwLzIwMjMxMDIwMDU0
NS5TY0F6RllkSy1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZSkNCj4gPiANCj4gPiBJZiB5b3UgZml4
IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5l
dyB2ZXJzaW9uIG9mDQo+ID4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBmb2xs
b3dpbmcgdGFncw0KPiA+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPg0KPiA+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQt
YWxsLzIwMjMxMDIwMDU0NS5TY0F6RllkSy1sa3BAaW50ZWwuY29tLw0KPiANCj4gRndpdywgdGhp
cyB3YXMgYW4gUkZDIHNlcmllcy4gUmV2aWV3ZXJzIGhhdmUgYWxyZWFkeSByZWplY3RlZA0KPiB0
aGlzIGFwcHJvYWNoLCBzbyBJIHdvbid0IGJlIHBvc3RpbmcgYW5vdGhlciB2ZXJzaW9uIG9mIHRo
aXMuDQo+IA0KPiBJcyB0aGVyZSBhIHdheSB0byBmbHVzaCBvdXQgdGhlIHRlc3QgcGlwZWxpbmUg
c28gbm8gbW9yZSB0ZXN0cw0KPiBhcmUgcnVuIG9uIHRoZSBzZXJpZXM/DQoNClNvcnJ5IHdlIGFy
ZSBub3QgYWJsZSB0byBmbHVzaCBvdXQgdGhpcyBwYXRjaCBzZXJpZXMgZnJvbSB0aGUgYm90IGFm
dGVyDQp0aGUgdGVzdCB3YXMgdHJpZ2dlcmVkLiBXZSBhcmUgbm90IHN1cmUgaWYgdGhlcmUgd2ls
bCBiZSBmb2xsb3ctdXANCnJlcG9ydHMgZm9yIHRoaXMgc2VyaWVzLCBidXQgdGhlIHJlcG9ydHMg
Zm9yIFJGQyBwYXRjaGVzIGFyZSBzZW50IHRvDQp5b3UgcHJpdmF0ZWx5IGFuZCB3b24ndCBnbyB0
byB0aGUgbWFpbGluZyBsaXN0LiBQbGVhc2Uga2luZGx5IGlnbm9yZQ0KdGhlbSBpZiB0aGUgc2Vy
aWVzIGlzIG9ic29sZXRlLiBTb3JyeSBmb3IgYW55IGluY29udmVuaWVuY2UuDQoNCkJlc3QgUmVn
YXJkcywNCll1amllDQo=
