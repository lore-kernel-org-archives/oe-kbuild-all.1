Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C1E78F39
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 02:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768702660; cv=fail; b=n0R9h9NHNmgxi9UWtJYo0nTVyc6B6mN3vt8jNlGf3xnzpABgehH69AU/+W3HPQHuAPdiEoz3j8XqlwyJpOKZ4NiYcuWgc+oUbP9BxMiS5gQQ15HX2PBLCePMKXxt+5I5dhcyKrIlbyL2xM104GEKwso7PnSVI2jjzWVUVVhNbSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768702660; c=relaxed/simple;
	bh=tgkHKyd+8mi+2wl/TsPdCqk47w7L8U7bpvDGU1g6vE8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rWEoaVnK/i9chMtM9UJJz5lTVlDTU/mO/KwCCkGhUVVxTxaHeAqKeJJstoCLwUoKqJAXt3MiaObwOGjRLkIh/470UUDFfMz4bPEy+tAChis4+MyRsX9M3NKKkvXGaBfdRr9qNpmPbpUcNNrCwmZw3pQQsHPfXRA7osRjVvWVS24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFouTafH; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFouTafH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768702658; x=1800238658;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=tgkHKyd+8mi+2wl/TsPdCqk47w7L8U7bpvDGU1g6vE8=;
  b=WFouTafHKISkj4OP5tSTUKVXHPD2MBxcTyZhwYjG3wpC7O30QBqL/GFT
   7HHoaBn13lPoBQXxMicSJkF79wEvJU7s4GphSjy5pXK5Q0DiCaILnhxV5
   50J4nS1xDkc1Hdxi8Bab0IzXv+rM94Tt3U11Nc72oGtDRLQvrciozJBCb
   PkCnRaXth2aDFShVq2Clkjqz2frGoexY7ckxSSQ3CfLaqrteiQhtTFToC
   CYxPujYzMTOgFZH0uHZeWPqTZMBrgltNjCrXyo5v9iiPAU51OkhIXWLVs
   RpR8a4DDXGlEmYw3s729HN4ArdTUuFLo7I+m7TwD7fYQj6xeROhzzFXjt
   A==;
X-CSE-ConnectionGUID: W0wpY2w8RG20vZt/K45BSA==
X-CSE-MsgGUID: CNU8HOykQRKIVr/msn9u2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="72551564"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="72551564"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 18:17:37 -0800
X-CSE-ConnectionGUID: 22Vcivq6QmO6mZsgdLhA+A==
X-CSE-MsgGUID: v/x6lbqHTNuXueR0AGxAVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205981485"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 18:17:36 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 17 Jan 2026 18:17:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 17 Jan 2026 18:17:34 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 17 Jan 2026 18:17:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyjOsEHgAu8617EYkATtNqRPKkj2oiWpbyF8gGQVz4IfCQ+BMJ5HwqeGc9IhFUGGNXnnkKomVHXIc8yZdvhZ86hWwqLsVrAh00pSt2CxJvv94FWtxEQ24Xos0bGPUuQqmVgJBhK3goCdg7Hg/4zakmiPRvn4isPrMIUeJ+y/M44B9bdZx1L5RGbzWGopu0lwG4Zh4pp7UzvVF7pvyxoBpiGgGxJFqZy1N6YXgxLAvtdIGNv+oB4uJqDGDE5n8DsL1p1DZQUG6b4wEB/kEmwTtzmqCgqdz9+KKEC4t5aTsL95E9M4jpOQrhy5ZTJu/PJgzl1juD209pO++iE4N8TLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpY4fxPMX6165NCd8RrCf4ykbZ28jYZ7r8fgTclC7JE=;
 b=WCvagyndqwGpmhqyg1OTuz76YuBpxoHh/HGeQhVaeZGpgjrTJ1PIoPjsa7q5wytyHvzjUJH8diHFb3wRfE0G8s8QShkPM0dd3DHv5Fe++9/0yurFY/GGiPmpGJK+iBlgwOdSfGAHFHkC8WVeCtaSvvz1pTSAXwXGIsjSKWbeHAPW81rkW6BEVfl9xWNyRuOpvFSdMwSD+qqt305wnN2CQyfi2Vv234eZR9fkaPwBm8O/kdd15tKkQ45vra5BdapSmzubDSLgOdMVEB1Bv1GekX/+X3ktChIcPEKTGNwPX7ZO22mgZV5sVlp/fhf0TpXOTavYWzba9gsLXjlRyR5a/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 02:17:31 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9520.009; Sun, 18 Jan 2026
 02:17:31 +0000
Date: Sun, 18 Jan 2026 10:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, "H. Peter Anvin" <hpa@zytor.com>,
	<x86@kernel.org>, Chris Mason <chris.mason@fusionio.com>, Thorsten Leemhuis
	<linux@leemhuis.info>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] x86/entry/vdso: fix filtering of vdso compiler
 flags
Message-ID: <aWxCsCrTfItJ/WUw@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260116204057.386268-3-hpa@zytor.com>
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DM4PR11MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 14967565-9920-4247-9789-08de5637bc10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K5hFT6VPOVVugyn1fD++t551w63J1z6uVXqgiGBimkBrpK33t1XGHhEXX72m?=
 =?us-ascii?Q?AXkizwnnXafH5zk/x5ka3Yy/kCWmcovSdef/zb0Ta1r7zL9D9/1NVEQXKOqi?=
 =?us-ascii?Q?wW/DhzphrMQtK7np2MtACTKdiosCp4flSX6DGo6inHtIx6ZMUXNmLknagF2K?=
 =?us-ascii?Q?27SdG4qm/DguaohkpPMf04Wq2YotF92PL6XFhCDUJ+wQ387bcXppK0kfdlye?=
 =?us-ascii?Q?RbqW9YA0f4nWSgkuSkZRG29csWacNkl5Ok4aX4WKzBeRAGt3cwJfj9qommlW?=
 =?us-ascii?Q?u0RhKPJHGkBOlIyJ5m+Pcwfjxv0sHqiAWQ0J/MdiD6fCEh4rpIjnF2alndR8?=
 =?us-ascii?Q?BrKpNlphf/ZiiYHR0lvovi98egsWe9eu3bYGefZ8NKbB3rk1aS7dftTDsFSl?=
 =?us-ascii?Q?KvXZWD6Nbs+9m0xsl3r/c02rNy7fJijoBtGDEzs9IE/TnV9K27RtRk0skmtM?=
 =?us-ascii?Q?zNWJ7/CAIpkmfeTxetWNnCnXZzjXKJateETIuwNwiGY/KgsQWwFxxVJEY4sb?=
 =?us-ascii?Q?lygKHOjNoBy5UCyY8IlkGWZGrfs+1JHSiHdJ64z+MHdUybxrEmtkrhjGhBHn?=
 =?us-ascii?Q?qKqtJx295As/nTo9SCHrfCm/f8bbewZZtm3b7AAupTqYcmRBWLcwYPMFUFul?=
 =?us-ascii?Q?WGjaCYH2/3P0i5rAJJm0246V1wv/fCVf/DxK65GfU5fVHI2h0sWnpu5Muqwf?=
 =?us-ascii?Q?jeI2VLAb7pIn1XBhrRqwXDl1yl6IYuj2bEJxcms37TkCe1EacbkaV/681f86?=
 =?us-ascii?Q?/fUvD/n5enX1x1ZPfZvL/eDnqVNnFXdCSRIOH4Rr9XHw8UxJPQIRqXVg5RgH?=
 =?us-ascii?Q?0/3xSuzasyz/K4c9Qdi/vFMUdoXgKpBtw1l9A73Dcfr8m1OyqnQxYPrbjBlu?=
 =?us-ascii?Q?yYv+tK2PpMUwRdbmAThcjQk/c6xUO/xmEeqSo+wRjjIHLAfq/NaWfo6EN21k?=
 =?us-ascii?Q?UuQtjNNWTDAP4e6OAkLZP9XejpO1L/Tw+WewZp7m1AS5Kkl9ghNByRgPqAnu?=
 =?us-ascii?Q?uUW0VvLSl/VcEYoW5kZgJbdubKJzZebeaNhSSXmrfRr951Su1Zj5vEsRRpwC?=
 =?us-ascii?Q?vWiUggKDTJrTAsJQomS7H1bm7Qnof5RbY87xhjq6XpSmIILuiWjjMef1Xv6D?=
 =?us-ascii?Q?ugVJSR/F9xTqvfNdhyz1QzBe/Ix/CmTZgUJt1vgVQrZ9cmho/WGO7eq6medF?=
 =?us-ascii?Q?EgQ6Rs00aRL6wcm49JOT0eIi8asW1O2Zqdt1ohjyKFvN411m181NwfDUFj8F?=
 =?us-ascii?Q?CcE4YQj4zI5ThSNsjtJd8QRmoyu5eLvjLbOmSa9WAtyzGk8sAKhVR5MZN3yg?=
 =?us-ascii?Q?0iYNpfMmTdw66fA+JINbnL/3u7cLF7TN0r6qJq1oWBfu14k+KA/5lmHLwcTo?=
 =?us-ascii?Q?CNPpBDDdidzwRqWe4hBQkjk7tZbFTyLByGb6a8Xa2/9ikc0UZzuMFwyANxNH?=
 =?us-ascii?Q?JYrFs6rfWKz9hNrworsLqK9h9T4UVQFLv9SHGHSp/gWO91f91meVYSwrEd5r?=
 =?us-ascii?Q?KkIKMT+5Btc6XmyKzb0TwEwBy70W7lfdAnjgJGHJx5xsa6Q/cpOhkslHlYV0?=
 =?us-ascii?Q?5VZGAWhQIY3lexjhHtcW0GMnL/3uKMCoPGtcC5bK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PWfPRXOfIRqr3N/AnkAfHTCBGj6yNT9t3LTHlOHtt0nhE4m1hkxezclWkiXx?=
 =?us-ascii?Q?8JVtaVuXFbXIuoq6X+KgNtCsUiPF8/y5oavH7UZ8l7rOycZsh0EfabyOmVdL?=
 =?us-ascii?Q?cgzXE9ZHvAYYHcuFqlFuqWGpYQFl02rqR7tW16vipxMrlCk9i4ipUeAWPR3g?=
 =?us-ascii?Q?C1UQClimn3ST/nP9kMzDmjefTbJFX43LfswLD7yMrSrxvwGEY4Fr57ZSE9Kh?=
 =?us-ascii?Q?tJ3FgwEXp+ZnWHDzBh1g8r02CLMZ/0oKsvrXeRi1r6fNrFux66sRicRCXuka?=
 =?us-ascii?Q?xrrzniEQwPo7gkd+I8NA2GFKiHwCbwJVkM/HfE/z1dooTMu/g2VwBCszNvWk?=
 =?us-ascii?Q?9/iDm/5aNc8VibLIJE2S2tPhvg98MyKVBe/Wbld7fpps/XZMRIH6pDKvU0pQ?=
 =?us-ascii?Q?SG/2qhAwAyb7ivSElRS7EUedAiMm8A+WW+at78cC/Z4A+ixsGnF5n3gQKJuU?=
 =?us-ascii?Q?nQeQArFnOVkhhJn7KB8EhLf4asyFDutvwVmY8LSn2YWGkukvlZkClIR5Vli+?=
 =?us-ascii?Q?WFjEMrJt/BnP8ZDR5YFIaRmrPAensbMkvpX674jOBpCRRakLW0WJnQXgjAgj?=
 =?us-ascii?Q?xU/8zXUJ5753km/aJ/ntxry3DrldWh3cYyzSj00e1ELDKIFnAElSaKGkMgZK?=
 =?us-ascii?Q?kDIIcJZIXT94ab4C4VSsnITdrLQYGJ4cqCs7IBpTLPI7j0FnzKqIoCBN34za?=
 =?us-ascii?Q?57l1/LWM19WWM58Sxyu2+/0GTI4z5XAq7BRa+kx8zqTWLZr2pWhwhIMa/iFi?=
 =?us-ascii?Q?TGCt+MNUlCuUL3nAfhycQaeQcBsxStIvNxnswdH7gBiQDnVYZHe8TRuuhA8v?=
 =?us-ascii?Q?uyI1mx+YPsgaN1PkeNjEY3ashDK91fQU4c0Dt8H71yjaxWhUO7s3pf/dqMPB?=
 =?us-ascii?Q?aZ8LshwoQA1l5V1ODXgCdRhUwsCORZbKwbEEziP0Xtot7XFfhP+ZZLFW4zAg?=
 =?us-ascii?Q?AjEN6mOD1d5tNTABnfLubYgc3i9vo4XITly+MFIpLGgj7jfhizYtwT1BHEBp?=
 =?us-ascii?Q?+eoYM3Ld4m15v2GdH2+T9OvwIPS86sM/j2UHkBwm9Z+KAWPvw99cRq0nZbNg?=
 =?us-ascii?Q?z3KAoG45o6s6VFIZ0hKA38ZSmpzGGW1NF89YOxbzWSgtXoT1/mVWLA8lvm7Q?=
 =?us-ascii?Q?2AHqvLW1HtEG5zvVzu2+OhF6Tqn7kLQtZCmTj7CKhaAxuWEXVJCbLw25XCDQ?=
 =?us-ascii?Q?06MWWEp/TFGAGOOjg8NXuEdePMVfNkCwM7sIQw5d/3jdpSnqpJQC7r+0Ynww?=
 =?us-ascii?Q?J96XYLrkjwZD7EJA9O1vGlPlDyufLHv4I8slX13zgX9rSZG5WuUUVALewKt7?=
 =?us-ascii?Q?k0Qau9JpndenmAqaeSH0y+K/m+U1hhBv9aS6EgcfD2FUSssIRFaUL9VNP688?=
 =?us-ascii?Q?+bDE9y3z6WfwmY0YHTpVf1Mpe+JZInLAgUzQTJF3EmuWmfzixIgWibtXVgzV?=
 =?us-ascii?Q?xxJSjlLsJ0W450qYdKSZ1W9x0ySrhkvTdIdvOaya1yWvAue5Sa8FNEMRYCNg?=
 =?us-ascii?Q?KOqfnoFzDhz/xaJEGb6OZZVjCmDQq8uM7bdi3T19numZikaFNKFwJpbfj3qh?=
 =?us-ascii?Q?NqFhva5IeLqSh2xUXgbmrfBQbEONmuWbiyhWLUixrBmqrLocLGw5Z/ncmnDp?=
 =?us-ascii?Q?EdHb4juWGTnPI3cxiao8McWcRWahRkYulDVlivNoHPvkjXKn826tYHnUaumO?=
 =?us-ascii?Q?fcAiN+l/m5Cb8UDvjO9WITAwNr1XH+ZH3h80dkAfLYI1G8785GP+owPA8ILb?=
 =?us-ascii?Q?wT9rqV8ABg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14967565-9920-4247-9789-08de5637bc10
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 02:17:31.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKWdHf8/mG88ic3tyCvIqD/0LPze35V7I6H4DXcOP+5H14umBoRiSWFAobxpLcCq2sDaFx4njBZZ8thcQuEBhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
X-OriginatorOrg: intel.com

Hi Peter,

First bad commit (maybe != root cause):

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on next-20260116]
[cannot apply to tip/auto-latest linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/H-Peter-Anvin/x86-entry-vdso-update-the-object-paths-for-make-vdso_install/20260117-044522
base:   tip/master
patch link:    https://lore.kernel.org/r/20260116204057.386268-3-hpa%40zytor.com
patch subject: [PATCH v2 2/3] x86/entry/vdso: fix filtering of vdso compiler flags
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20260118/202601180025.lLCHWiad-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180025.lLCHWiad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601180025.lLCHWiad-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:44,
                    from <command-line>:
   include/linux/compiler-context-analysis.h: In function '_context_unsafe_alias':
>> include/linux/compiler-context-analysis.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     237 | static inline void _context_unsafe_alias(void **p) { }
         | ^~~~~~
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from arch/x86/entry/vdso/vdso64/../common/vclock_gettime.c:11,
                    from arch/x86/entry/vdso/vdso64/vclock_gettime.c:1:
   include/linux/compiler.h: In function 'offset_to_ptr':
   include/linux/compiler.h:272:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     272 | {
         | ^
   In file included from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382:
   include/linux/kasan-checks.h: In function 'kasan_check_read':
   include/linux/kasan-checks.h:41:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
      41 | {
         | ^
   include/linux/kasan-checks.h: In function 'kasan_check_write':
   include/linux/kasan-checks.h:45:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
      45 | {
         | ^
   In file included from include/asm-generic/rwonce.h:27:
   include/linux/kcsan-checks.h: In function '__kcsan_check_access':
   include/linux/kcsan-checks.h:190:41: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     190 |                                         int type) { }
         |                                         ^~~
   include/linux/kcsan-checks.h: In function '__kcsan_mb':
   include/linux/kcsan-checks.h:192:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     192 | static inline void __kcsan_mb(void)                     { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function '__kcsan_wmb':
   include/linux/kcsan-checks.h:193:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     193 | static inline void __kcsan_wmb(void)                    { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function '__kcsan_rmb':
   include/linux/kcsan-checks.h:194:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     194 | static inline void __kcsan_rmb(void)                    { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function '__kcsan_release':
   include/linux/kcsan-checks.h:195:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     195 | static inline void __kcsan_release(void)                { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_disable_current':
   include/linux/kcsan-checks.h:196:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     196 | static inline void kcsan_disable_current(void)          { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_enable_current':
   include/linux/kcsan-checks.h:197:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     197 | static inline void kcsan_enable_current(void)           { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_enable_current_nowarn':
   include/linux/kcsan-checks.h:198:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     198 | static inline void kcsan_enable_current_nowarn(void)    { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_nestable_atomic_begin':
   include/linux/kcsan-checks.h:199:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     199 | static inline void kcsan_nestable_atomic_begin(void)    { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_nestable_atomic_end':
   include/linux/kcsan-checks.h:200:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     200 | static inline void kcsan_nestable_atomic_end(void)      { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_flat_atomic_begin':
   include/linux/kcsan-checks.h:201:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     201 | static inline void kcsan_flat_atomic_begin(void)        { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_flat_atomic_end':
   include/linux/kcsan-checks.h:202:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     202 | static inline void kcsan_flat_atomic_end(void)          { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_atomic_next':
   include/linux/kcsan-checks.h:203:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     203 | static inline void kcsan_atomic_next(int n)             { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_set_access_mask':
   include/linux/kcsan-checks.h:204:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     204 | static inline void kcsan_set_access_mask(unsigned long mask) { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_begin_scoped_access':
   include/linux/kcsan-checks.h:210:34: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     210 |                           struct kcsan_scoped_access *sa) { return sa; }
         |                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_end_scoped_access':
   include/linux/kcsan-checks.h:211:51: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     211 | static inline void kcsan_end_scoped_access(struct kcsan_scoped_access *sa) { }
         |                                                   ^~~~~~~~~~~~~~~~~~~
   include/linux/kcsan-checks.h: In function 'kcsan_check_access':
   include/linux/kcsan-checks.h:230:39: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     230 |                                       int type) { }
         |                                       ^~~
   include/linux/kcsan-checks.h: In function '__kcsan_enable_current':
   include/linux/kcsan-checks.h:231:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     231 | static inline void __kcsan_enable_current(void)  { }
         | ^~~~~~
   include/linux/kcsan-checks.h: In function '__kcsan_disable_current':
   include/linux/kcsan-checks.h:232:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
--
   include/linux/find.h: In function 'find_first_bit':
   include/linux/find.h:207:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     207 | {
         | ^
   include/linux/find.h: In function 'find_nth_bit':
   include/linux/find.h:233:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     233 | {
         | ^
   include/linux/find.h: In function 'find_nth_and_bit':
   include/linux/find.h:259:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     259 | {
         | ^
   include/linux/find.h: In function 'find_nth_and_andnot_bit':
   include/linux/find.h:289:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     289 | {
         | ^
   include/linux/find.h: In function 'find_first_and_bit':
   include/linux/find.h:316:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     316 | {
         | ^
   include/linux/find.h: In function 'find_first_andnot_bit':
   include/linux/find.h:340:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     340 | {
         | ^
   include/linux/find.h: In function 'find_first_and_and_bit':
   include/linux/find.h:365:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     365 | {
         | ^
   include/linux/find.h: In function 'find_first_zero_bit':
   include/linux/find.h:386:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     386 | {
         | ^
   include/linux/find.h: In function 'find_last_bit':
   include/linux/find.h:407:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     407 | {
         | ^
   include/linux/find.h: In function 'find_next_and_bit_wrap':
   include/linux/find.h:432:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     432 | {
         | ^
   include/linux/find.h: In function 'find_next_bit_wrap':
   include/linux/find.h:454:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     454 | {
         | ^
   include/linux/find.h: In function '__for_each_wrap':
   include/linux/find.h:471:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     471 | {
         | ^
   include/linux/find.h: In function 'find_next_zero_bit_le':
   include/linux/find.h:511:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     511 | {
         | ^
   include/linux/find.h: In function 'find_next_bit_le':
   include/linux/find.h:517:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     517 | {
         | ^
   include/linux/find.h: In function 'find_first_zero_bit_le':
   include/linux/find.h:523:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     523 | {
         | ^
   In file included from include/linux/bitmap.h:13:
   include/linux/string.h: In function 'memdup_array_user':
   include/linux/string.h:33:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
      33 | {
         | ^
   include/linux/string.h: In function 'vmemdup_array_user':
   include/linux/string.h:53:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
      53 | {
         | ^
   include/linux/string.h: In function 'strstrip':
   include/linux/string.h:190:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     190 | {
         | ^
   include/linux/string.h: In function 'memset_l':
   include/linux/string.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     237 | {
         | ^
   include/linux/string.h: In function 'memset_p':
   include/linux/string.h:245:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     245 | {
         | ^
   include/linux/string.h: In function 'mem_is_zero':
   include/linux/string.h:295:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     295 | {
         | ^
   include/linux/string.h: In function '__free_argv_free':
   include/linux/string.h:316:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     316 | DEFINE_FREE(argv_free, char **, if (!IS_ERR_OR_NULL(_T)) argv_free(_T))
         | ^~~~~~~~~~~
   include/linux/string.h: In function 'memzero_explicit':
   include/linux/string.h:365:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     365 | {
         | ^
   include/linux/string.h: In function 'kbasename':
   include/linux/string.h:380:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     380 | {
         | ^
   In file included from include/linux/fortify-string.h:5,
                    from include/linux/string.h:386:
   include/linux/bitfield.h: In function 'field_multiplier':
>> include/linux/bitfield.h:202:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     202 | {
         | ^
   include/linux/bitfield.h: In function 'field_mask':
   include/linux/bitfield.h:208:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     208 | {
         | ^
   include/linux/bitfield.h: In function 'u8_encode_bits':
   include/linux/bitfield.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     237 | ____MAKE_OP(u8,u8,,)
         | ^~~~~~~~~~~
   include/linux/bitfield.h: In function 'u8_replace_bits':
   include/linux/bitfield.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u8p_replace_bits':
   include/linux/bitfield.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u8_get_bits':
   include/linux/bitfield.h:237:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le16_encode_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     238 | __MAKE_OP(16)
         | ^~~~~~~~~
   include/linux/bitfield.h: In function 'le16_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le16p_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le16_get_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be16_encode_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be16_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be16p_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be16_get_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u16_encode_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u16_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u16p_replace_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u16_get_bits':
   include/linux/bitfield.h:238:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le32_encode_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     239 | __MAKE_OP(32)
         | ^~~~~~~~~
   include/linux/bitfield.h: In function 'le32_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le32p_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le32_get_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be32_encode_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be32_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be32p_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be32_get_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u32_encode_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u32_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u32p_replace_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u32_get_bits':
   include/linux/bitfield.h:239:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le64_encode_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     240 | __MAKE_OP(64)
         | ^~~~~~~~~
   include/linux/bitfield.h: In function 'le64_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le64p_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'le64_get_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be64_encode_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be64_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be64p_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'be64_get_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u64_encode_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u64_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u64p_replace_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/bitfield.h: In function 'u64_get_bits':
   include/linux/bitfield.h:240:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
   include/linux/fortify-string.h: In function 'strncpy':
   include/linux/fortify-string.h:198:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
     198 | {
         | ^
   include/linux/fortify-string.h: In function 'strnlen':
   include/linux/fortify-string.h:220:1: error: '-mindirect-branch' and '-fcf-protection' are not compatible
..


vim +237 include/linux/compiler-context-analysis.h

3269701cb25662 Marco Elver 2025-12-19  221  
3269701cb25662 Marco Elver 2025-12-19  222  /**
3269701cb25662 Marco Elver 2025-12-19  223   * context_unsafe_alias() - helper to insert a context lock "alias barrier"
3269701cb25662 Marco Elver 2025-12-19  224   * @p: pointer aliasing a context lock or object containing context locks
3269701cb25662 Marco Elver 2025-12-19  225   *
3269701cb25662 Marco Elver 2025-12-19  226   * No-op function that acts as a "context lock alias barrier", where the
3269701cb25662 Marco Elver 2025-12-19  227   * analysis rightfully detects that we're switching aliases, but the switch is
3269701cb25662 Marco Elver 2025-12-19  228   * considered safe but beyond the analysis reasoning abilities.
3269701cb25662 Marco Elver 2025-12-19  229   *
3269701cb25662 Marco Elver 2025-12-19  230   * This should be inserted before the first use of such an alias.
3269701cb25662 Marco Elver 2025-12-19  231   *
3269701cb25662 Marco Elver 2025-12-19  232   * Implementation Note: The compiler ignores aliases that may be reassigned but
3269701cb25662 Marco Elver 2025-12-19  233   * their value cannot be determined (e.g. when passing a non-const pointer to an
3269701cb25662 Marco Elver 2025-12-19  234   * alias as a function argument).
3269701cb25662 Marco Elver 2025-12-19  235   */
3269701cb25662 Marco Elver 2025-12-19  236  #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
3269701cb25662 Marco Elver 2025-12-19 @237  static inline void _context_unsafe_alias(void **p) { }
3269701cb25662 Marco Elver 2025-12-19  238  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

