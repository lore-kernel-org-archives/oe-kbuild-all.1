Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3856914885D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731313087; cv=fail; b=Ee8SCf80ErhILeHWL93uqazfci7zeYzAERY7O89DD3MHZoZc2P7PvVb+wpq3VB2sJq6mgBXJbim+oHm2DqHjy027LnNKbnLbJFLRuqkLZONisFO5yvPGuScYn68bf9/IVPa1UyB5BrlMdZ5kwLnr7gxWlJBkadLE7pgenaKstK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731313087; c=relaxed/simple;
	bh=4h09+gYVU35ChktXbd14lmLY66eUvSW3NNUIhmaw5F8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=X0jwChj4omJAplz2qE54Nu4wPoaqIt3mq7rCOoMwnOeV/BB771ee/UWEj+C3k0XjulV0xEBNer0SFnoO6zxUFgrGgBLo+Yu44s14txKo+08tdEYknekxjL0CcFXHQrs9CcU9rmg3wCnb/OjEVIXh6OHDE3c5/SU9TEXCk0jQh2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCCGD7ZB; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCCGD7ZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731313086; x=1762849086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4h09+gYVU35ChktXbd14lmLY66eUvSW3NNUIhmaw5F8=;
  b=WCCGD7ZBcxObqkcPenfIncrrwVCuY02GVB3k08lrn39jddzGmD3cn2y+
   7zO2S3OMWf9v2ph8286A65cHE6U3gPTnGJxxiB106mLT6NUnyRpAPRWzM
   ljZ2cUiV3XHKRyCoqFRUoygXK2SMUiDszWOiBTtEfPZNMWnsN1ljd7Xg5
   4biRJzXxuk8D5cqszBffw9tT0lmBK+xFZiMgPwKpGfll4kN443JVUgDx5
   yPIKkwMVOG9MeXTIWKP+rohlfs1jDCchNXwKNuxHwG7hzqQVjsPow7Nn1
   a4BtG1PlNGNl0wo8MlBW3fGbfPfXFBGV945WS9oCUisIRgcqqAjLbF5A0
   w==;
X-CSE-ConnectionGUID: EZsJ9RdfQ5a5WH5TgRRVyg==
X-CSE-MsgGUID: rp/W9SBPSO6uoGGigWeMcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="30524263"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="30524263"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:18:06 -0800
X-CSE-ConnectionGUID: +whYzzpCQEG/tYdYuInP8g==
X-CSE-MsgGUID: TXUme63lRei+k1ls3A+Zjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="90784596"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Nov 2024 00:18:06 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 00:18:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 00:18:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 00:18:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idLVV6ucp7P9Qk0XwpeLqVYo5XIafVVXXWYxPo831cyk81LQSTA5U6AkQMF4gD9Ayz1hKmJbFcunVBNjwoxTC8RN0JvJin/U/zpMUjRNcACzjj0Jp/cypDqCZMQCGQu5KBlcBhv6XzUieDO52oevOX+RRJxoqos9uFMkhB9XbvheTPw93/ISnTs37uZaigHhiFr8bWokoEOmU7Qk5he2AZ14GDlp5/eEDMPL3MrINe3nitMZTcgTr+hTOO1CV95gQKfwbnqD9KRZm5hwnPfN0KosgPTOEzXTE8eu5ZGrEfAzAONOIn1uIUiAKLgeAzpV1rgMdWHW6NPyC3qy3bIJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7o6cSzG12tR1dAxazUPifVKrKiqLg08E0ONJL1vSzh0=;
 b=qUWvxWZuP607jFxNxOFkgBAzLmd/SN2ir9DqLi6kTB1/ewmqVJunU4y9HFBET2d3TsD1LAimQ/QcHARk9DAbCpEZWzixJx6miFGckjqcOPqNSIVJSiqdEH1UN9/S7Ct6dsuyzfzcOkmIbna67sNf20sxvfXyI0PV2+La7RBemUB7RfcaU760m7INO66ojl7RUeZGMfesFUDMV+VCL78JlWzhEAA2+qSW11FAbKuR/rYbmznJSaS38YJlCsVkwqCgz+sAp189xk3+BbDb3AVsYrvQkGMmlU/ToLGaeD9fzuUr2q6M9v+RyNcE7FD0TFKCKrdchu8RNzMJT4bciqSIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA1PR11MB8801.namprd11.prod.outlook.com (2603:10b6:208:599::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 08:18:02 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8137.019; Mon, 11 Nov 2024
 08:18:02 +0000
Date: Mon, 11 Nov 2024 16:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-partner_predev 81/81]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated
 properties are not allowed ('phy-handle', 'phy-mode', 'power-domains',
 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config',
 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', ...
Message-ID: <ZzG9so+wcfKv3BKC@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA1PR11MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: a6accdd0-3270-4028-f725-08dd02295c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h1fyeFOVNSMtOoUTr5IZpAXxe65UNaPEUWgO4OcdX5UMpDAq16y0t1beppTh?=
 =?us-ascii?Q?PQ5cTnR2INHz3hAqpWmNoFpF8jWLvVKFjr4TSk/JVTHPP+I3187Bi4kU/zwX?=
 =?us-ascii?Q?ZIilKGxrv/YxrmDo5OVH6SDt3cxT4M0o8XV+ecaJJ/HRL401gPh/j0k6uPRJ?=
 =?us-ascii?Q?4RpEg/B8dZ2sYrNg6dDOmh9R2OzxMxrxyDrRURK/6sqwadffgLvCa/ZkTVQN?=
 =?us-ascii?Q?syoXGHt1MV0HgX1Cg5YwD3Hxl04NuZvRrEGa6YRI0oAtLDleqifQOz6wqSbU?=
 =?us-ascii?Q?9y8JEdgMfsllc+MJUYmFPPvOtix9QghTH27F/U+LkgwBf/e3AGu0uKargPPl?=
 =?us-ascii?Q?oT1I51MJJOrxeVER4RngSVjMBBjY+/Rg/bdDM0iFiaNzcvGtSFq2ZIsGPLmN?=
 =?us-ascii?Q?d/TqdOarD31iTf4o60ZPHncZyZ9b3WQjMgUwhpDAYPhjCDKU8mmx2JERc5ve?=
 =?us-ascii?Q?gwkWHXzdsOjddYrl6WoQ6VM3fP/AQU0OXg18bCj8pyXDwi0seksuliOAtiGK?=
 =?us-ascii?Q?jwILaSQJ7Juxo5B3OZmuOfibL/azdJ7A022rRJKzzOzQDMaD5xWLPWU+Z/8X?=
 =?us-ascii?Q?AjTsN2uDfB3+L0LiRx0xeZNadEk5IV91nw1Img3DuajXqpN9rjlyq//pTGGZ?=
 =?us-ascii?Q?Ss/9ySvGW7iW2i8nXYj6Dshd9PyJob9Gri2NvCkuP/2793tfvsUq9OQgjUT8?=
 =?us-ascii?Q?wp0kCh146iKJ1YHq+m6N8oOckDzqV3t1wN/BqG3+iPCbRUNURglhk3+4iA+o?=
 =?us-ascii?Q?pZBto7XZjcLytZaSdVJnEP7et0XFpidlQaYKQbZvLHzE0NxpWUFa86hfxAUr?=
 =?us-ascii?Q?ZA9pba7yQVUUSHFDix/K6PNV4uvleh5phZ78ZelbJFyA5RgGDAt5u0m3pEH3?=
 =?us-ascii?Q?Z5XX+xI+HXT33CRg7GqhlWwfmPWHl1KiB5J5Uy6GiqO4E8nY/i4V1yLZGVbK?=
 =?us-ascii?Q?5dEYdcN5SfEBBxzN3eVNDRrF/8wtB4FZIiKVWaplGmjUfFret39hFxUWZ8S1?=
 =?us-ascii?Q?773aFrBpMUYUVWHSFk6kMaIZJ2sokqUpKcaviJ/D6OZheDW0btLtb8A6swFR?=
 =?us-ascii?Q?zG4pkdgR/INI8cHK59uGVtX02VCXAqq2dgdF2MsV4FdabyMP5uqIP44GO+va?=
 =?us-ascii?Q?kJNn5+BEXgcqT9jB0GIL08ULYq/Rj/2IJPD/uQMbnb4nPDOxVCd4bXYkuL02?=
 =?us-ascii?Q?ZSaCVpVuOSlZLQQFgv2vPgOvfPBsFxk9E2wUyW5AzWfPp/2u0NbW/xkSdI+P?=
 =?us-ascii?Q?HtpUjNZJcRLSwsXAPWh1fJx/ewQfmPXnxwfJVPXBjvA6167hrPchlIkBSF84?=
 =?us-ascii?Q?M8zozxxWoqR5riAKS8xzkRaK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IPsxaVd1C6/DVNUFNZlWufT1PVJwMTpy1AKCUU7+ePlzK+E/gGef586mLO/+?=
 =?us-ascii?Q?N8VkgNHeb8UXe6EE4ZP/jRxKo/9ImVaJ98/EEStri/UEpzdjL4+XHBMLNRPl?=
 =?us-ascii?Q?ecuYq09nt5VI/UmzxNwf456RnKerQx/DWHYQAFu58iulpzM1Cws/nkvDk7uk?=
 =?us-ascii?Q?2MffXP5NV1ZGhDv73mpBp7dit9265uwQanKQzJ6oRbsJJ/svZ13G0vGjpVXx?=
 =?us-ascii?Q?x2J1kdemiGBNRfHTy740RACexrJ1qOJfm3fZq+JmrFjXDlVuTeliN17yz+4I?=
 =?us-ascii?Q?4cpTB9kQVQulWKuQj9KdMz+K4Lo+RtLZy2eDGFJ+/FypCNGE2/KrXR8DVDY2?=
 =?us-ascii?Q?rTTLAcN7fAoJhJvzax5FKNwQI5/tgeYWK0SYArtr/ykf5e70DDUfalQXcm64?=
 =?us-ascii?Q?2UCeS4Mdgt5d3wdLMcaL30lOR/vjz5q2xkRX340Ky06kGMdbcCnIw2Lqj4LB?=
 =?us-ascii?Q?hZa62oq5c3+VCz3pmMKu3bUB8TRuvblNnSkQwRlo/pnugWKrYHkRXwfJDDa4?=
 =?us-ascii?Q?JyM8VDnXkxnEzlReWBgT0NL28x5bK5/2sDjrKD1qKBybZVgrUvdBVnGO4kJM?=
 =?us-ascii?Q?hPblpHVoFuKVF21DUEmsEuPAROlH4sdIj1akRWyEZmeINzWJOLaS7woCVXa8?=
 =?us-ascii?Q?j+FFuPXYe+ErgVsg44wvrcNx1qvOy5aYWDbNOUcGGLUFGnjjBu8Zi9t/2fdj?=
 =?us-ascii?Q?AmhzIJKvJDNtVzFbCH91rH05M3W6lu8V4kVrUsTZeMoU2wQ9Z4kgphXd141D?=
 =?us-ascii?Q?YFjxv53qhVxe4tayBpHU9mH62jUqbhS7jKckUvivythnHNhfgaOjTVwsOf0T?=
 =?us-ascii?Q?ddXJPnIpsn0aX9W8ql1okZpw0G63AUuDpa7mcukh6U2sd0i6SQEjtRqUO0Xi?=
 =?us-ascii?Q?7G44aj6gUzK5ePdCssZnHYC0+fwjCRaivEwJRHiPUEQV69F3nmsEyzRE4tei?=
 =?us-ascii?Q?U4ZcXhWd88Pz/msdJULsISdTeExpo0NpJIVmCU5Fm9zmLHvHp4hde1Bt+iU1?=
 =?us-ascii?Q?SuTHSNdGPHJ9TgfyGC1L+jgd5Apaf0DvwX+k2mpNMLWSGd1S1AHdtZfUvzwV?=
 =?us-ascii?Q?2M+FuiEFXFYnn6Dclg4U1V2Ts5RiuMpSwOWet3PYrsBNHXpLxjHcnbfKfobt?=
 =?us-ascii?Q?Yh/xpSIkvFEDLyPiJ/iFWuyslOCqtQhWTysCKFCwYvUbvVrkEoz6KaZi2n9l?=
 =?us-ascii?Q?QkQ9bq0JfIQ05Kj3QdsxFMkLa5tMv1vaN7AWazRDTTgdmEXPRDivAqYYFA9T?=
 =?us-ascii?Q?ldKXHFqw1K8cbAgQAia4wqFvnC6Gc4m1tB62GOCYsNxR0fULcMpLw3+yvZYb?=
 =?us-ascii?Q?i2tE82xx4VTxGT+XQPwKGfOGaLHmPzsWTjZck1QljfdoajID3v3S6c2/Zvl/?=
 =?us-ascii?Q?k8lGWbOrYc8YoyxA6oyW+0Wko1nVm6dZQTrrZaU5EmjjVIKhnM330wcjirD/?=
 =?us-ascii?Q?XMqpeZckSZl4GQeuRQ8QT37EDOiSCpVDN0GJMO9dFvqt92vM3kfCEVsEag3h?=
 =?us-ascii?Q?oeRLVIo/5zUrOU3GYYCetIIs1nTffqtJEZ8H+ixuUujOIpU4RQEEDg/QZdFC?=
 =?us-ascii?Q?rcowLwZQ9P+zsryate7ak+Kul6tB2VPnWa8yewXR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6accdd0-3270-4028-f725-08dd02295c06
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 08:18:02.2424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTmLZ56hvPgY2S7PQ7kWatqSzOhsgdeOrRJyXQPMZMnFulet0Cvmn2ctj7UMyjMmG3F54GQ6+YEKkWximn+3nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8801
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   4f78c3d7bcf25a6712f168ec3e669c779412364f
commit: 27eb552ef585c9852d1d04afde9fde34f8b69dc2 [81/81] arm64: dts: qcom: sa8775p-ride: enable EMAC1
:::::: branch date: 8 days ago
:::::: commit date: 1 year, 3 months ago
config: arm64-randconfig-051-20241031 (https://download.01.org/0day-ci/archive/20241108/202411080838.HeNl2WKe-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080838.HeNl2WKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411080838.HeNl2WKe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue0:snps,priority: [1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: rx-queues-config:queue3:snps,priority: [12] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

