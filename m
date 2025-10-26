Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D426D1527B4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761486301; cv=fail; b=qIDZTogTiygVqNJOuh75hmmOxD0VOJjkbhgE90LKJ4raPoMrgf/yPTT5AXSohSLjOWcv8fp2QR5eTwSTN/0dPMfdxV2XzJ/SdhizLpFd7CGNlB5jfnyxd/Icq9hX6v09WCUw7FLKZTRnN7Tjp4hGIqFOihYHlZfICsp2aoMTyjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761486301; c=relaxed/simple;
	bh=ErUWth3dFSwjKR6SBeIPzrdhOv/uPMg3yD/29flsDWU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gH+N0hMtDDvnAQCfZo3qHpyNaavlneDC7fzHkDiMspr02CH4eeKG15yq7gHBu352RF/nay8kwuVzKRvZ5Mu/D6buEQTAk8D3MUMgHE2wqBx0cmgIHGM0lFTTC0ydXxbNZ805/V5d+m/FN8Zdo7ZjEpTYW2jFXedxhUdMEyQMYJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBXTlcVI; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBXTlcVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761486300; x=1793022300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ErUWth3dFSwjKR6SBeIPzrdhOv/uPMg3yD/29flsDWU=;
  b=TBXTlcVIQOJBOOtHt9/hQiAZmAoXk265yWM00nb402cj3NgoMF4pWwRh
   4EeTu/m35T09XavgaTdkZ9gTLgUso2IUkjhcpuVuYT3Hh+/q5x5Nnu6l2
   VRmE9SSXBszhk+G0LHklAAACtayJVrsk3A5DIsUSK49ZQTUFRSse9PHK3
   dklpLp2y2Cci76cVNRL74zqzHmeKp2FXlcpAkFULPP7oOqmp1ruz422Bx
   E8coaSVUm0IwIF+4QFuSHX9qEn87brIeGTcVX21syAKyPvjvAx84saSxx
   BdvRc4ZvCIlXTRpWCC4j8bfD9LpbTuX18K3mGSVf6BAr2wvdXlqTlGaa9
   g==;
X-CSE-ConnectionGUID: JH2OTZGaQi2OycyNHrBeWw==
X-CSE-MsgGUID: fPyjhWa7RZGZOsehW2hArA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63626862"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="63626862"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 06:45:00 -0700
X-CSE-ConnectionGUID: Wx+PgVLLR9C2w7h7FPwzqA==
X-CSE-MsgGUID: UxKlSjVNRGGm9J2yXtM7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="184724029"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 06:44:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 06:44:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 06:44:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 06:44:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxlJFPqI0P1xQCKn4N8OjkZqQLJew0p/ycvxIlVt2rXCJeZOdth5fxi5yAjvIN+Bb+tM6Qlb7D8MEDg0qg3bCNDP+jFRjHNZABZIy+HGBRa4WRXJBsXHVSeb3uywyic4si93hmTmdBOZNo5dHXScOzCi2IAkZ2KxOBI/CY5nmNxytfs3JyK20JOEkLi5xuIssyRAcJlKNmmFlfGyGzGbYucwXkZv2/8iofbUpgv+mwX+Cinn06zwKEpKQagcL9DaIK/SE5XZ1kZJ3ST7itPEvePacm3zsqDCCutnLvrr4s78vBUxjMuAxvzxEoWzlmt/2i/6Dv5Al10/1gtUdG3vlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAxm0KZP/zoQ6uxoJ54PvKTzvYFIKINqxct71KH9ZJ4=;
 b=EhmYEsutrWdTfi73sPBhY5i3R0d/TwH8nYrHd2c3gVCDgDEjMfE67DhcFxRr7FIyQRmcVYcTbJqeEamxonZjFkLQdJEPjq5wVfafC4uqY7Mu8xYO7w0XH/AyVBfu7+J7iVr6pSsS/LKSdYEza0pIZOBdpJFs8ZgaDLX4ESRmt8o9RlDtb/Y1eGHIPg59m59qsq2CAGVEt/a4CWg6P/i/5o9KBQvj6YWNgG2VKL3k2tMEUv2u+1m0CQa18JtGnjBWzajZinbZQBgQqrR96khrTPoDT40XoIaBJ3OnE2dKXIRqHkbKgR7jcg8YWZ6EsHZM5qtMmTFg14/Ou5cJtEE1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by IA1PR11MB6145.namprd11.prod.outlook.com (2603:10b6:208:3ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Sun, 26 Oct
 2025 13:44:56 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9253.011; Sun, 26 Oct 2025
 13:44:56 +0000
Date: Sun, 26 Oct 2025 21:44:49 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12-kminext 1/1] ncdevmem.c:364:33:
 warning: unused variable 'queues'
Message-ID: <aP4l0UVPnWh44uZ2@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|IA1PR11MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: fc82a955-e5b1-4548-6f9c-08de1495d946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?75ewVYVqAEKrjJv0uikCja3qk/f7v5zTT4rj7Hk/5LbOea7nUR4PoPrYqNaW?=
 =?us-ascii?Q?YvNTGEtMwiCfemQDN76YGbklUBtvISM9g9kJBmd+a91y9fvhK7JuKZT/U1Fs?=
 =?us-ascii?Q?V7RrFChMUYYhRs0agHNVoNNMcurszeHY3dDlslRdX5sgOB4dwzkcZXIXl3gx?=
 =?us-ascii?Q?s9ASFUbZp4wLi/N+MIrIdlj2c2jsqFgScj/v2w96CN9slrhRboJNtfcgieLu?=
 =?us-ascii?Q?qvFP4sjVVrR1/weacoxV8LNMiGacbVLSjauvHO490xQmYqIDHtjy94vL7KzZ?=
 =?us-ascii?Q?4VNsn1y12i5z2Facy7M1kk/Pmdyr2WeKjCwjlMfxbbZB3+1EorvaAt1qkag0?=
 =?us-ascii?Q?wSSR+eqCGlgW6Txtxuaj2NYHZZPMgvV7RNoWUXj5XupWoh+/HYLYPC/o+2H8?=
 =?us-ascii?Q?lgOJTgLeX2YnHTk//mGPCPd0y9gSZp2XiHWTLInERpboaTeEdtTo9b6tNxxN?=
 =?us-ascii?Q?VPni82Hq2IWHB7nMvYx//TxigvE7+AdrLZ65/AVzULguDTzC/8M7VL1KJIho?=
 =?us-ascii?Q?1b29Fbl1IhJIuZ48TOUA1MhS2ME6jTDzmiVYn9aEQf/Vs6YY2U6vwzWeD9gS?=
 =?us-ascii?Q?jJUvyU/dTufVZKOdAOMZwel/on4vLfXDu753NkOzxVL89qovZUOXwcdbOkR2?=
 =?us-ascii?Q?1ADeveJaL1c+4qX0ONhfueIwq86km5MRV1A0Tq8+DcvyIRxP3ufHtrRuNZAY?=
 =?us-ascii?Q?0PPuzJYystDmoK4bwF/ye3ukA38vDqSg09vGRExIwnj7GJMqvXyJSHywgCiz?=
 =?us-ascii?Q?DmJICbQkmwfeVliJm5y9gVmDctZSp1IWQBnudNnGgpvhzmQrydkbNOQGQKzm?=
 =?us-ascii?Q?3HkiKTQHgOMrF4YWVJ0XomOXUIAT0Lfu9piWI70VWydUDHk7nNOWcvKJqKNY?=
 =?us-ascii?Q?dffIdGcaNjwm2VGTz92zB8oaaLgTdAaZQzOkkfrew1MJOF1NafZlVLCx0HVT?=
 =?us-ascii?Q?ivGRuPHyYwrOiTjlLleljGzk3QTNl1NF/dk2yRBy19dVJnQ45ECho9Io8az0?=
 =?us-ascii?Q?IQpw0CRb54QXiosmvJFLltzU509+rF23UaKzxWNLZMkZrVZ8YWfhaibMg3hc?=
 =?us-ascii?Q?I8i6+f3W7gKMnXBOmongvknED5XDt5qCQtNCIfZ/a8FRGBWqvOmxEQUSsCSa?=
 =?us-ascii?Q?uxsVnucIxmhpeqwc3WH8hUJ1pX4mAp5fCdS9E+2eZWhum+5DwGNNYqrYz7dN?=
 =?us-ascii?Q?XV/ouZG7eiE6ze5wjqRtfC+tPhG8NotgoMZFiaf3yCCCAEg98MStcmjQv1WN?=
 =?us-ascii?Q?Cpf8leF6o/vtdGhl51AdK7wYHwjiWRvju0fqjKExTC5Ps0RmRRl67iVkx05m?=
 =?us-ascii?Q?Rm3DO66LjyVPXuoWXZNHNChmZV/PMS4OMIwet2OpE2qwh8NyOKFhjFlwUfdC?=
 =?us-ascii?Q?uzEvm43tb37EqwthI6lfNeNgWzk7LgsH/Vjh3oOyhUWqnEeeKKg4TcHE7PhA?=
 =?us-ascii?Q?df1kjzzfw4g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eN8Cekss1kVz8rnso3YFqfjc6wHvCMbafQRSQR1jn2dPY7ZJ0p6ewZtYUs60?=
 =?us-ascii?Q?/uVxCMeZX3PN9rBP2+MnNRSycp9yElhXJQJmuaifvfwinhX3XiQlpCcXeakL?=
 =?us-ascii?Q?Y0KUSSdrHt95slFDW3Beor9q+6n/5VxwhZbQJSlUy7Jx+cfSVON1rq+bT3Iw?=
 =?us-ascii?Q?8jAXVFH4BPqXzOQkwaO5TDeNYM72bL7Wyzz0qRXEgPplAtA1eCKz8v22hxOU?=
 =?us-ascii?Q?N4kNyom0Xjndsqy5xj9KmJdeZc/AGS+Dkn1p6SW32tnIfdXTkyTJHbvvWSBX?=
 =?us-ascii?Q?BuOltkJYGghfYOC1hOw3kqzhCp9dx3M3+mo4l3Kl+V2o4vMCOYPjdTCIQceZ?=
 =?us-ascii?Q?mcklB8aw7FaRnP6jeyf0j1kfEVA6IOUmieXBIN2d4Yvue2jnJH3fYwTKElVG?=
 =?us-ascii?Q?sQXPHxAYImNdZhV5Hz+LK6qXOAzxZasr56ueFj26cktpFtKHXA15YCthcyMY?=
 =?us-ascii?Q?wegU4JYMTaWGK4JZzdqHTYSkIC1vpIMu53m4Q88m7Pb8FtM1Sv2Bc+cLSIRW?=
 =?us-ascii?Q?dDPgmqMrTpa7LM2EWXg/i9e45vimq8vuhEJhdp3nrV5hfMHxfDaycHQk3GiE?=
 =?us-ascii?Q?oGPlLzVoJQhFQtCQzZZ1VMMdd48JPcBSgvB6HV30cNq1OQq1scWZf64OIl/Y?=
 =?us-ascii?Q?MR2ACBby2w1xxMAtqYdcHMMXaH9X+2vd2Ca+4NXHzPIfZfP9Cbzu2OtLNySq?=
 =?us-ascii?Q?z5FSjpx/nC/IZPY3MGwsOpr+ZYG7B6H11BCkkB3NmgxXxgdtdMOfz2eaNzKo?=
 =?us-ascii?Q?C8SLdVsuvMkjcNO+nQB+3WKny96Y6dYEq4JALTdMyW/5kbCY95oFg5ANqsHh?=
 =?us-ascii?Q?DEMhaWBvDTS+8VfePmxckW9MtzUkmT3zEMHgx14WBNAX0/GHmSvcMkR/V5g7?=
 =?us-ascii?Q?Q93n5Sk7HOeraFQ5wlQ0bjoPyz8ZqVC7L8UbOxTbZiLJOjAT6b3oUVaN+/25?=
 =?us-ascii?Q?p3mtoagoO9w9C4LtGDHxuvEz4IAR0al2/o3MpkGOgXgzclfI9jcIpifK/2/Q?=
 =?us-ascii?Q?40UEV3ohvaWnk5nkMwk2wWclvWd4rNspyHKEwR3Ahj0DMJqPCuavcoRb0bDC?=
 =?us-ascii?Q?oSPqcyIHY9ChFhMEptzCztXkNmExA2ELZ6VkRoAapt6xQnmSg3uJ+eK0w73j?=
 =?us-ascii?Q?OeGYNSkX68TojJVbfR7LXAMW37y+XUzafuqTxUmexz6L/w+odXA3Eg5ovuAF?=
 =?us-ascii?Q?vuy5VRw5w/M/+67nh3AYPE/rQDoxo2xjKLlsbfMp3VDj28zhAYVSD5m28ukF?=
 =?us-ascii?Q?ny+4YDSs94UgZY6KUlFHY88rmhArLC+ORh2SZA2qoulv+mUhSivoOkwvAiq5?=
 =?us-ascii?Q?dyOhSsM717TzPdswa5oUHTmVEaIBlrS9mRt/dt1Gm1jH3AaLG7V3ZE3eyq4M?=
 =?us-ascii?Q?RK6IX5jxSwDSloYDYC9l7Jf/0ZPoUTsePsq8t9tM+aPgvhjG+Ch/INd4K5dv?=
 =?us-ascii?Q?VS8FX1OhdHL/oqFMQwfiqfkt2bLaAWwIEjoS9eGpYP1VwHkBLDqzRQxPpPZa?=
 =?us-ascii?Q?VoeOkokaw6pzM8ahlf4013BfEi0OoxWaEbE9NLut+kpS8F9u6ioXbGAO+3mZ?=
 =?us-ascii?Q?plUsnldXm0EhuPmPh2eAGIrmjIxFIqMTGlFOjzg6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc82a955-e5b1-4548-6f9c-08de1495d946
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 13:44:56.2175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RcgIk/BdVc1nz+KhYazNsAXSoxuJfcCIjspfG4ZKiQ8y+0sdAxKHt0BF3WeObnAtumlbnlSTs7eTBlo4B4sHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6145
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8979fee435bfd762771c71f3cf99f6f279038337
commit: d308312acd0cbbf40b97a018eff5659b09660fae [1/1] tests/ncdevmem: Fix double-free of queue array
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510261913.ZLaXkWh7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261913.ZLaXkWh7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261913.ZLaXkWh7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ncdevmem.c: In function 'do_server':
>> ncdevmem.c:364:33: warning: unused variable 'queues' [-Wunused-variable]
     364 |         struct netdev_queue_id *queues;
         |                                 ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

