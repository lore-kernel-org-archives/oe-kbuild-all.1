Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787041FA0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 03:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692068995; x=1723604995;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4TNoO9gYwOHC14GjTEbPOsqque1x5vvqz+Cqp2wbbdU=;
  b=FAjJe9HyFszzP/3cAbnLbG6cuzHltG6G0sEDPuMRkRHYF0F1qOBxrmT6
   PyHEWNG3icA7hlsScfJ1uf9mvyXYWkuVX3zdPSmHl9NDG7aURPrd+gdCP
   wB3yTiAowGpGYsa+j5elKOEZ3Z/oYE59bAS5fT3hXGi5R4Yy8mkiLaxiD
   6hmYj4OysVabaLiIqdf6kiZ2Ju+i7fGZjx9T8DCFD8Zl4mZslvX/d4qJv
   s1QDxXz3FZwAwxOyiPsblq+cz3cG3LVfuwU0rIoelOrm2Zxgo/e3PID0J
   zqb5J4F6hd1hUE8YWuhL7pcj4rPH788AkTvi5hBNxTQRw9DW88QIkcy3K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="458548597"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="458548597"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 20:09:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="763137314"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="763137314"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP; 14 Aug 2023 20:09:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 20:09:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 20:09:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 20:09:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShwtGQdTr00d10EPYi6m3Wm0HNG5XxEgToz0O4vXXAueBVLf5Zn7Z3TESn9NDpWatQLmvo6f4XSgJAbydy1nTJbbqdTXGsriBoSiH0MxQ4DRLfbt/PPfxo5+GG8Hr8MrXDQsgQRr+Bd2M21QS6nf1Au+QMuJiXsQUWq4GFEryNw5zUsAtwmBWu4b6ODbYizKzCq75S/KP/yifgT8OegfLjqTbKRpHzpq3diJDz11iC5E3VwLPowpaPqRvyjfX+BFz9zrb6jc2xSHxiIArzqNf9L6xJxyUtB7m80L6Cd6Doa47B6BX0gKv+nvdesVbRlQiep22BRLn0vIe8ZS/83noA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TNoO9gYwOHC14GjTEbPOsqque1x5vvqz+Cqp2wbbdU=;
 b=QPzR1B8XnpPON7M/U69xTfHQCRT+DMufsPW2bKwgQk4O0XQ5F4tZ5o/8yfnyaF6402dTIxEjFJYjvE+aWYvkgqfv/n50K7DvT17EDTfuSqYFjkaW1ecXS45B68epnmVZW4odniG7BodWDU+gGoufrOXGO5WKqOhHtd4F50D1BevPzcymQIqvK/mzdCa648vNSAOZ3mFE/LPoTJ0blJMzfOVXkxSQM6dIOc4yQI6y5GwxjuK+qZJ1+fFwYwxXscQW+HOgOQRQcXrR0wg9oWBfq7l0bxAsYdQwCn40XFKP7YH4CZ4Tz7Vg2iuBi1GA+AnTiJYf7YQazfBfNs83ZtD4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MN0PR11MB5986.namprd11.prod.outlook.com (2603:10b6:208:371::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Tue, 15 Aug
 2023 03:09:51 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 03:09:51 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: "willy@infradead.org" <willy@infradead.org>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>, lkp <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 8002/8441]
 include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_324' declared with attribute error: BUILD_BUG_ON
 failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
Thread-Topic: [linux-next:master 8002/8441]
 include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_324' declared with attribute error: BUILD_BUG_ON
 failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
Thread-Index: AQHZzxpNWHuHMGcZ/EWW9W1CiMXLJK/qorYAgAAJqAA=
Date: Tue, 15 Aug 2023 03:09:51 +0000
Message-ID: <52e67066267c94503833d2523e3df4643b226d6d.camel@intel.com>
References: <202308150902.iqtQSoIb-lkp@intel.com>
	 <ZNrjRmlEbseKFdIq@casper.infradead.org>
In-Reply-To: <ZNrjRmlEbseKFdIq@casper.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|MN0PR11MB5986:EE_
x-ms-office365-filtering-correlation-id: a45c4132-f144-4366-a20c-08db9d3d17a3
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Ggkg5UHOdt8c9InJspSzvwfzgNQOA1xbMPk4jDqn+mviKEzWQwEn7HCgh5Hmxq2wFt/znm9uS3rkOM85JZwmUtrM1u6x1yEIn76yxapcVLyKPtiD1FRrzoQRa7RWCKTTvyZjh7HhtPkr2wK0me2T8CkPIVKBZ3Dx0MOCcuRtwxLMKStPcC9XurFe3dCuVJ5lmtEpY4EDDyXdbzeJZm4+0TOT6YW0R6oh2gQSYTgwfmbXC0ZRGoywI0mrNKMLfy8vl3TYpIfDtCCOANIPm9895NU2zaOY9JRbyUvUb93sPJz+gNnSdLSPTy0o7jeYTfKHZvRv8r1/ofSC1Pbx9AX2LLHy9bnVt8cTW4cbnnSkL7H+yz0zAOJI8f/3q3PU0Ki5GKX70B2uU8v9OAn9G96RCywpZYTXUH+BPz1vJ7wyLECkjZUZvDtrbSIu6A9jwe0xBZL5Dv918hq2n2JeuQq18xekZdAEBALCLVMSMHi9iPiSXEEtPcOs/C2cHhyp+v0NcsoHMedq2eSB5OjgBI5vidqxH2qEsA79vJ0uBGqAEsXAm3wgYe6zGYIUWqgLWfbpnk92+2kXuX1Lxk2+2+UMMmjxlVZnnBe+G6lzKbJUkOWGBoTHh4nrS7mFNjfrhhUeKSvmjNKxD08CoUAcZqcfA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(1800799006)(186006)(451199021)(82960400001)(966005)(478600001)(122000001)(8676002)(71200400001)(8936002)(4326008)(6916009)(64756008)(41300700001)(316002)(66446008)(54906003)(38070700005)(38100700002)(91956017)(66476007)(66946007)(76116006)(66556008)(83380400001)(6506007)(6486002)(2616005)(26005)(6512007)(86362001)(2906002)(5660300002)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGRlVWhSQnVQRTl1RmhaOW1TSGZaK0RVck9PSVJpancwdnRzd1BPNTJsQlBo?=
 =?utf-8?B?L3d2bldvVFdPbUpLQm42NFRPS0QvTFlVZGtIR01UbjZvWGIyMDJWNk1NRlIz?=
 =?utf-8?B?V3RPZmk4YU5DOGR4eFBKVVlVb1JSOStDN0NuOVVpZW9yMHZuVmRmZHAxVzBy?=
 =?utf-8?B?TWpQSmxubFAzM1R4WVRwcThwNWZOOHBFa0pNb0p0cHFkb2RmVDVaaE5vaHdn?=
 =?utf-8?B?RGdpamI5d2RVc2IvK2I4VnRMQzB4OTJnUGdpWGZGbnEyaXRTTnlWOXVNRWdm?=
 =?utf-8?B?VC84T3p0NjJpWGtGZ2ZpTzFOQnZ3cS9qTmFoRjVkUitmNW9wTmlwejYvMkxw?=
 =?utf-8?B?cXd5cWo4SVc3dG5TbXNMVlM4SGlJeFZ4cDFZTzJJSk44dmZxUmN6bEEvZW9q?=
 =?utf-8?B?WTQvN1hscURNSVNlV0VLTVBqUTZrcGp3ZS9YK2lnUS9uSVkyMzlJZlFYbzAz?=
 =?utf-8?B?QWF2RDZUbDI1Rk9XMWllRUU0Nk8zSU1xMHNraWFwZkIrdEhYRHluUGI4Wktq?=
 =?utf-8?B?ZWdSNW43eHB0RFVKOFI1ZkFJbHdOd1F2VHcxSlkvOU85S0d2Vk0wOUxoOEkr?=
 =?utf-8?B?cUFFWXFpbFJoa0Yrb1J0eFpvSVdTQVZMVTJYTUJIRFUwcnk1NTdFcElVTTl2?=
 =?utf-8?B?L2UrMFRUNlhBWmMvWDE5VmpIbUVERENxWjBFK2EwUUZMWWRJMDZhTHFmMTZ5?=
 =?utf-8?B?d1NpV0sycTBmN3FpWW1vWEt2L0w5NzVZOEFIREx1Nld2bFNXTElQSDNTNVZD?=
 =?utf-8?B?SXJPTWxkaUxPSU9zQnRGZ0YvajJTZVY4c3pkR2U2VDZIKzNTdVM2MHFDMkZZ?=
 =?utf-8?B?YUpJM3lMZkVXWFdHdjBNR1Z5U0xaT0Q4UjdRZENhajM3bDBlRDRxaVJpSndJ?=
 =?utf-8?B?QXRFMTZycE5UeTZSR0RQSjFhNDFVazl4dlIxZHd3MUtIV2dabWVKK0VpV01i?=
 =?utf-8?B?SG56N3dhSGx6TjJzblk1MitCa0ptZU9YcXZZVnlIYngwbjRVTnhUTzd1M09i?=
 =?utf-8?B?cXB4TURGNExadGNiR2JJOVZqTFArQkFLWjZOWmNRc2hVSjBlN3ozZnBVMTVm?=
 =?utf-8?B?MGQ0ZzRVdUx1NTlQdld5dGhHWUZlaFlSVDRLUy9RZGpUL0VEZVcrWHcrM0kv?=
 =?utf-8?B?Y2JJbDI5emVndUFJWjhiN2cyRHVNd0h1N3JKT2ErQm42VW1XcHZPNE1tV0NN?=
 =?utf-8?B?NXRYOGZRN2p6SnUwUnNtaXI2QnBXb2RUQlI1L3o1eXRlOGtYNG9JSW9paXMx?=
 =?utf-8?B?bHlaQ0wzdlpqWkJ4eUQ4STR6SHpQMmV3eStNVGdLRVJWSG5qa2RFSVNCQmR3?=
 =?utf-8?B?QWRqR1BPYVdRR1ozbzcvMmFjYU03M1Z1Q0QySXRZMU5pRjNFOEFmMlpZQlBJ?=
 =?utf-8?B?K1gvWmluZVJhdW9xaGYwVVpJWHRHUlJ1ek41UVBRVnpheFhkMVB4aFd0Uzkz?=
 =?utf-8?B?cjgwZFdWcGJFbEh6L1hPNjZhYTdNWUtWdHFyN3VMVzJrL0hNS1ZxN0ZTKzRn?=
 =?utf-8?B?WW56aEVQTGllUUhFclZIQVdjcFMwU0lmMHk1T01EQUNXczRaVU96c0RpWFZO?=
 =?utf-8?B?SFR5OEx0Z0tYQTM1bmdURDM4N25rK3NWNE9yUVFKcys2S1l6R2I0TGRZT3lF?=
 =?utf-8?B?R0ttMHhIcXN3Z1p2anhBSTBJVituU1NzaTNsZktsckh1NjlNUHhFT0ROcU5x?=
 =?utf-8?B?RmNCYzFWcm96OWNndkdhRWd0YTVNamp4NkZPYjNzTVpkNmhHK1M2Yjc1ZUJp?=
 =?utf-8?B?bGdXNlpoeEJ0dE9qa0FrWDkrdmlSWjBKNHcvL2FjQTZVSUFFNE9EUWV5RTZL?=
 =?utf-8?B?UnNpS2FTYmV5UGsyNk1POWxwK2hRd3hxb2NFcDZ5Mm5leHlRMkVBNWQ0Uzk3?=
 =?utf-8?B?R1BuUWZwN0xrZUJDOUg0Z0ZlalhMdUJEKzQ3SXVpUDN1Nk5RY05RRkNlcVdK?=
 =?utf-8?B?YkR4M3FZUGFVWm0wTTJBKythajg0OXdDQzkzVHdBV2E3STNta096Z2xnUm1P?=
 =?utf-8?B?TjJQMDZ6SEpHcVBRWkpqNGIwellramhmZ0tPV3BGR2FqcElibTFXcE9leVVI?=
 =?utf-8?B?U3RVcG5Ed1hBRmV4Y2pxdjlXMy8xUktReWt5U3NhbENTR2p3aWZ1S2kvY3ZH?=
 =?utf-8?B?NmJmc0N5cHVjaGVrUnIraGt0eC8wSFhxMkVOeDRoZGxLbFlyT1NrMDhBcThO?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C856B25B3B6D56469D8C73C30953F542@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45c4132-f144-4366-a20c-08db9d3d17a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 03:09:51.7947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dmf4TYRD1xvHGJBt3JlUfU+gflLSxXHGaZJ6/+gxyf7hru5ITixuOp8T4Towoe+f3WOz6uqSwGrAwVKvC1Qa1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5986
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDIzLTA4LTE1IGF0IDAzOjMwICswMTAwLCBNYXR0aGV3IFdpbGNveCB3cm90ZToN
Cj4gT24gVHVlLCBBdWcgMTUsIDIwMjMgYXQgMDk6NDQ6MDJBTSArMDgwMCwga2VybmVsIHRlc3Qg
cm9ib3Qgd3JvdGU6DQo+ID4gdHJlZTrCoMKgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXTCoG1hc3Rlcg0KPiA+IGhlYWQ6
wqDCoCAyMWVmN2IxZTE3ZDAzOTA1M2VkYWVhZjQxMTQyNDIzODEwNTcyNzQxDQo+ID4gY29tbWl0
OiA4ZDY3MGNmYmYzYmU5NWJiZjJjYjdlY2RkOGY0NDlhYWJkZThjMTgyIFs4MDAyLzg0NDFdIG1p
cHM6IGltcGxlbWVudCB0aGUgbmV3IHBhZ2UgdGFibGUgcmFuZ2UgQVBJDQo+ID4gY29uZmlnOiBt
aXBzLXJhbmRjb25maWctcjAwMi0yMDIzMDgxNSAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRh
eS1jaS9hcmNoaXZlLzIwMjMwODE1LzIwMjMwODE1MDkwMi5pcXRRU29JYi1sa3BAaW50ZWwuY29t
L2NvbmZpZykNCj4gPiBjb21waWxlcjogbWlwc2VsLWxpbnV4LWdjYyAoR0NDKSAxMi4zLjANCj4g
PiByZXByb2R1Y2U6IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAy
MzA4MTUvMjAyMzA4MTUwOTAyLmlxdFFTb0liLWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQ0KPiA+
IA0KPiA+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChp
LmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YNCj4gPiB0aGUgc2FtZSBwYXRjaC9jb21taXQp
LCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+ID4gPiBSZXBvcnRlZC1ieToga2VybmVsIHRl
c3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+ID4gPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA4MTUwOTAyLmlxdFFTb0liLWxrcEBpbnRlbC5jb20v
DQo+IA0KPiBIb3cgZG8gSSBnZXQgeW91IHRvIHN0b3AgcmVwb3J0aW5nIHRoaXM/wqAgQXMgSSd2
ZSBzYWlkIHR3aWNlIGJlZm9yZSBub3csDQo+IEkgZGlkIG5vdCBjcmVhdGUgdGhpcyB3YXJuaW5n
LCBJIHNpbXBseSBjaGFuZ2VkIHNvbWUgdGhpbmdzIHdoaWNoIGNhdXNlZA0KPiB0aGUgd2Fybmlu
ZyB0byBjaGFuZ2UuDQoNClNvcnJ5IGZvciBib3RoZXJpbmcgeW91IHdpdGggZHVwbGljYXRlIHJl
cG9ydHMuIFdlJ3ZlIGNvbmZpZ3VyZWQgdGhlDQpib3QgdG8gZmlsdGVyIG91dCB0aGlzIGNhc2Uu
DQoNCi0tDQpCZXN0IFJlZ2FyZHMsDQpZdWppZQ0K
