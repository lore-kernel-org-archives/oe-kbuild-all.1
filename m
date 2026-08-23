Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B41338F926
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487322; cv=fail; b=uPcRIMFeux63+spdZMa+AViDwNMmaEDrh8aPu7TLeGBd/G/dCnk96rundeKt3sk65aZPnGV6CPhkonF9BEVZSt1NjnGDWQ8yE07KQhfFxGj1ytDUFWFft+57D6U1sRtIQFvf3v2iKWLzHwQgAF5XYkvlNJo87q1tzd0cU1s+0iQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487322; c=relaxed/simple;
	bh=TILuoWzEfSj0uRXttSsbxO2ijkd1YKqv9iwH7LZvWdg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Lg2RrgDaqeAVnu+PzbJDYrR60ILEhkeZOoAEiFseuQ1Ug8UQcgf3fqUrqMM8/7jYhekOeDBBVAMpz1SyMPfBA8WQhuMyYnLm0PLdfaG7o2mHrYXyxWPmUA7S5iB0sS1mTAsa7uEmQwi+1Yom8wDX0TZuVWqo6CKeZe/sNSGzbRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJdX/N1K; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJdX/N1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487320; x=1819023320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TILuoWzEfSj0uRXttSsbxO2ijkd1YKqv9iwH7LZvWdg=;
  b=EJdX/N1KyBl8iMR0cIaJZBKhsmgsK/iKwmsW78Y7xapbqqXAguUHj3sq
   Xq15jzecvbsTT6BvuLRHq02bkCdGglwFmO4iwtvb0GyG9LNcf6/5O5+Oy
   lCWta4T2yBhLxPhsF3I8Dt8TL61/QyNM3HCgMJYdNv/eFpWaN5fgini7v
   RyG57vlTh2C52m3f5woVpL9BQPSB8unwU+GMMLVrXhTZncmH2KonDaLIf
   OWCtfgCWJgQnTq8blmq4cjh8LnAoupFqsJqkZC0MGVZ4xMUWRrkO+GUo7
   knZWbdA671gbPHzFhvyF+GRlsxQbTbvR+JX+J/2WGFNj1Fp4E/xEi69Mt
   g==;
X-CSE-ConnectionGUID: Il7Da4PbTB629tbeSRkD9Q==
X-CSE-MsgGUID: aLAS/d08Ryqc5JKtSANiLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88088965"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88088965"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:15:20 -0700
X-CSE-ConnectionGUID: zY9SlOUmQXiKOv6W7BMQMA==
X-CSE-MsgGUID: 1y1QzQT5SHO/OOLd7im4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264991620"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:15:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:15:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:15:19 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByEQJpj5PPaUJi/swWxVvn0Lc16IH7GcQtO+kvEU0Gkn86j+4wdnA2qn+dOF5UBnJ6em9Fy6utiq9LnBUB7dCkkc5r/EfY+Q1qkMqdcwBKcIv6cVfEMfeIAYWDr+z79nOmu13UNEMl8oMbQkvWx/X/s62dpZTQFgjMLW9ZRi+iHjE0JOSJtyVxNdpek+JB95t2vhtZ1AjCDRnxICt3fPTok5PWDczrUhaaDFneoASjG1sn1sPfLZjnFZceh5+FwHD1pFCIQEsPIHZwPmpfdDdEBs6tE0WXZBi3rne8zwzkeGejHR3xqCwQJiTcfpZevHLPmTf5t80c7fqhgMVmcNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PofR6/huccqEl6shovRjHgk61wBqJvb3TuOi/yT80x8=;
 b=IohCSOQjTj2hd+BY3Dw2qh6wGmImHJSYfwPHLi067Cd95A5dO9iDrcwP1A0rBPqgxEQdCXnjzd61K6Yt+bs95LDKDmKk6cSFDQtUVeT0amjhAT5tKL0wyBE5ZwTFbiSxJh95fEJG8baO6+2mXr4Qx2ZTV5ZIX069Phpr7s0yW9XlCCQYm+DWeWtNpV1/bYK0/200XEFMQkHPDO/JyldwkXVoa0W4GWcpE18qSSwsK4RUf37/jyDbOGS2fVEBp5lPanBJvL+wq6UEvi19KxTk2ZvPIpzBg88+EqqP6hBbPcBTmqJlHz+p+8F1AJ8WDb3bAcSz7fFReCpCzgbm1kOT4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:15:17 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:15:17 +0000
Date: Sun, 23 Aug 2026 20:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Lee Jones
	<lee@kernel.org>, Chong Qiao <qiaochong@loongson.cn>, Huacai Chen
	<chenhuacai@loongson.cn>
Subject: drivers/mfd/ls2k-bmc-core.c:108:14: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202608230816.ifMzE0No-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0026.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::20) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff26565-32e7-4520-fd22-08df01103163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 6uS+0ffJIYhKUNvFVGitThxdDwvjrLAeCGeJ+u+OFHY3D8cOzlJ0qkxQigM2aoAbvHOJsiGLb3ZfSO68eollWvbnNyHbvNCK5COErjqJNffVxtTQ8osCdFiTvzNCEALnoHU5nDvAIebor9yJM3gAeoUzTVI+cuidESpn9+s3HCekbo1IT89AhFWmSuJYI3zbMI5LSsTOb8H695U2Yv0oz3eY1NITDRrrznMBhl6pD/SGvRigTnigr79DwoVG3QGfyNx16kVVEDvVY6PXeH48qcyA595F2ghInmgBsKdcTtfpcyOCwH9Tomvg00fkJLpaZ7/+bBEKjJgzhsp+Hog0doHo+wSJkenyriBHyW7BVM0zEiRqEEVGz+WAFO9hA2/gl04qTQNU5omGtj/ph8TC+F47QOE1m6bO+0Wv8FmKcar8JI7JQgqnt4wDEHBlq64nx9zf5/H/kRUyTescSAHCQEF6u08Diu+nYk8hcNL2SZ7fabh/Nyk0+dMosrdgxbdSwgKbqEwro2Jutf1oojKDpvKyGwe8so3E+4t3h5fiQeZf49atP/cUis5I/hWVKpyyVI6Hz0jcXClu7hfXEUHBzzite5RHxG7+GqMRkq79Bds8ydZDGmrfGTdvQd+LutW45g+l4AM6OfCvx81s8NNzlMZCHg1VOjEHEu93KXSOo5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?71mzBgcO3+w4jg4YSF8hOlbdLttblNjzXUwslRG6zs831Y6hL7HkV259rn9M?=
 =?us-ascii?Q?Y5Sg6Qa6T+VWBVSGMRyY5A4tMV1xVzUCUzpsdkTAApG5Rm3XN5NdWrUMnDiV?=
 =?us-ascii?Q?bysWSa2y0TH7oHuc0iYXFfbqzDkuR0Ub9LHgnSQFeNVsqZp+KodZjDBy/XAd?=
 =?us-ascii?Q?Z6YbAtlFcANcZSrtMzWIHFivHOBH1EtRsjSR+TlqR/z726spQijCWm0S9wnX?=
 =?us-ascii?Q?I38lZ/EBQufCkHUnom3IoKGl9Xptke35W/HzCSCOY1fIupTm0itY298orm/Y?=
 =?us-ascii?Q?kKYjyUAMOT5KuGyeA1oVUGivu37TQgtC9haUKfxT7eIrYY3k7MGkvp5DLmov?=
 =?us-ascii?Q?D8vZO4TQa/6KpbD82ZzRh8/3lp8Y5YP81ngoINr50c3N6xsVdjdbkITiIOPQ?=
 =?us-ascii?Q?Q11u7TKWu/qIgc49QUzyEU9pK3dmYpY4Neb1uxmpKCM+PqDjHQ37w+Q6zFyr?=
 =?us-ascii?Q?/RXLoGhPZEQI+R+sVz5gHMsEDXPTvM2b6w8aAq+L331gEOPoOappBCHcSdTu?=
 =?us-ascii?Q?6RWU4F17HJQwaQZvgphmS/tvONe3dlixXpb9twe0qVkb7p0XVsma57Sv9Tyo?=
 =?us-ascii?Q?SF058w2f1oWbdN6Kh+qwxrwYGPZj1ea/+C7+MemvR0MosjrS9BDjzTfVwisP?=
 =?us-ascii?Q?upHGmG3zw7gNEnmC5HNJMha6fH24AWGysSUkeKYS5EHkc0qKJf752ye1lmi3?=
 =?us-ascii?Q?IQ7TdzOCRfI3pV84Q/XJ81TmDT69Ejpkv+iE1T48ZdVvjNuIUvt4KVXlS1Ei?=
 =?us-ascii?Q?BAHQFBnA3Sds3MjpSNw56o9Hy7JiVfMakP26IrjEPAFvbXOfWbMlMgLXVYVn?=
 =?us-ascii?Q?VPccwQLmdTT+pup86H++fRJNWPwJhVtwdB3z47IR8SugQ25njVXlYIId5jR3?=
 =?us-ascii?Q?F3nmHRGZr8lewnlC++f971/kdWu5HAt3q8ciLJ1GHxUN7E2JFSeC3xgUhTSr?=
 =?us-ascii?Q?SJS7FjtWv3B7pBbvKeh9EfkygQF4NOttUAIYHgqDQFPaj27HkP+JpdAjoF6k?=
 =?us-ascii?Q?pGZ5nQMvZU3YyvjYJLI7mZyRyo1pynq3AaIY6GEicQ6ktMLqsy3JekkKQnQR?=
 =?us-ascii?Q?wLHMgaSgtP8SyQKj3wio89Telr6avDcbvnMjiJwCxTQXhERbptdWLUQntSiS?=
 =?us-ascii?Q?nmxFqd9flUUdki9ioTZoGS3vSavt5tc+X1shmdeCMzZslKfiprOvoMCsR1uh?=
 =?us-ascii?Q?PB/ncLu2HtR8Y0c96Jen7lZtf3n3OIRShJWcuSSFloVLeWpRaETFPEtdw8sc?=
 =?us-ascii?Q?Splp9a/ZDYHZqQN35Hnd2mYL2gkcj7ddrnIeYYzxF9atkLBVNvnNLV3lYpg3?=
 =?us-ascii?Q?q3PKT9ZMKFn/6eJIQNtW/yGMQ73jDkgQkWoxOFozvQDt0TOkISELY1S/LlVM?=
 =?us-ascii?Q?DWCcQQLckbcZYQww0w6IP9mZAyi2SuDIYVcfRyqwo0gvHKgpE8U0E63Kc38/?=
 =?us-ascii?Q?pILQwuzhaGLnTCe7I0fg/5eWCoWPQ6Fdjocavu71UOGmi0xUV7LWBX+YKt9x?=
 =?us-ascii?Q?rWg4COVH70glX22wjHnaI3rdymNP8mEMr8mEBvsfGcxy8FKIrxz8rx1n4lLa?=
 =?us-ascii?Q?9ghetHq50BjAIHxjjaq3gJp5F6sR5VEyVvnw3349YQfmbqUZDLMeH7P8aXnJ?=
 =?us-ascii?Q?ZD4gK4m36fznxwB4ELAIls7rTQBDDXzyuoPDNpeymYdayJ+MQoicmyHDHkJZ?=
 =?us-ascii?Q?QPxCeK39Fkr5ZQFgKwZaAZU6BAjru1eGrwvOHZ0/97BWZam1i33CRqC24Qty?=
 =?us-ascii?Q?HmDCBKLb8A=3D=3D?=
X-Exchange-RoutingPolicyChecked: A2qd1SvOpf1rjLW9f4l60zMMV3ozo1iVG5Gtet0KyITKgv0aCcelDiJDGBKuMYfXwMbxg/+0zy1djY7hFiAV3IX05/EFCwfkVCDfgoEtY8rTbRq59drrqowt9sd7r6BlSPWlgoEfh/gwv2iSc1HPosbX3u4Dr9CkieGygX0gT65zCLgnNiavEXspYwV71+CqwNtfWE78MvgkTV3lMhsT+oDAnPDJaf/izU4rP+3bnryaMalxE6a/5uTPCXgT+5hhiaEJ2m95Axgy3d9zfPHzG8Hzs7yspk3dn1R7mX/L5YAeOqSlKxrv+oLwaVwtXdXQ+OSa0KspcZAEmSkyCrJ+6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff26565-32e7-4520-fd22-08df01103163
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:15:17.1593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROZ1rKtJNeMPNeWBEGvyaq2sgu3giiQdSnhWYQoEOMa75lM5v1PNFRO0SylzdRuXMz3BwRy4Lad13TeRQpsh0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26260251022fbc2f248a3d747a9b2b961b18d2d8
commit: 0d64f6d1ffe96f59145481f7413344b1fa3ad1ce mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
date:   11 months ago
config: loongarch-randconfig-r122-20260822 (https://download.01.org/0day-ci/archive/20260823/202608230816.ifMzE0No-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230816.ifMzE0No-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230816.ifMzE0No-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/ls2k-bmc-core.c:108:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *mode @@     got void [noderef] __iomem * @@
   drivers/mfd/ls2k-bmc-core.c:108:14: sparse:     expected char *mode
   drivers/mfd/ls2k-bmc-core.c:108:14: sparse:     got void [noderef] __iomem *

vim +108 drivers/mfd/ls2k-bmc-core.c

    97	
    98	/*
    99	 * Currently the Loongson-2K BMC hardware does not have an I2C interface to adapt to the
   100	 * resolution. We set the resolution by presetting "video=1280x1024-16@2M" to the BMC memory.
   101	 */
   102	static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_data *pd)
   103	{
   104		char *mode;
   105		int depth, ret;
   106	
   107		/* The last 16M of PCI BAR0 is used to store the resolution string. */
 > 108		mode = devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M, SZ_16M);
   109		if (!mode)
   110			return -ENOMEM;
   111	
   112		/* The resolution field starts with the flag "video=". */
   113		if (!strncmp(mode, "video=", 6))
   114			mode = mode + 6;
   115	
   116		ret = kstrtoint(strsep(&mode, "x"), 10, &pd->width);
   117		if (ret)
   118			return ret;
   119	
   120		ret = kstrtoint(strsep(&mode, "-"), 10, &pd->height);
   121		if (ret)
   122			return ret;
   123	
   124		ret = kstrtoint(strsep(&mode, "@"), 10, &depth);
   125		if (ret)
   126			return ret;
   127	
   128		pd->stride = pd->width * depth / 8;
   129		pd->format = depth == 32 ? "a8r8g8b8" : "r5g6b5";
   130	
   131		return 0;
   132	}
   133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
