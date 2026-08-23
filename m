Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A403F36923F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787489693; cv=fail; b=KePvWV/E5+Ot5WGXb49Uk5H6n9y9q7f9HYn3CSni4uk+dPb1vSYBj6X+S5NQmoezuj3mvxs0PrE/FcGmKcaEfizhAi63DUA/rUVfOZ4a36+32Ctj4xoe9auBrECb79UsGUipeDah3vU1n+1prAgLlECZhpMxRV9IFWAizPKinGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787489693; c=relaxed/simple;
	bh=IrBwYWJEvUNVkOJ3lW9Ob6w8VnT5trRgbEw+vqvDZs8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=TI8dUcCf/AfrPA8YwR7OS/Rl9/tpAs+DkzfX5ZCEETh2DmyWQHz6ZRwhejZpWZtQ1IbDBGnvQxxStRDDhv5mnDnPXy9QXS1AN8uaO5v/MjuAgOzqtdRBQT+72V0EJ/tjngHWepN+RgOGODZiwCRz9n78FMXYxzKmvEfdJHG/+sI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpSx4+D2; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpSx4+D2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787489691; x=1819025691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IrBwYWJEvUNVkOJ3lW9Ob6w8VnT5trRgbEw+vqvDZs8=;
  b=OpSx4+D2rEQg4EY9noFj8/waYbalsUMWLdhwpqphmd89B0myR1xeH+x5
   k+x+iZJk/hqVex9rn06kDVBb4AWvnzMs1UmTFyIPs2HBXnO9idWklSZ65
   JpN1FyDo4tQBJLpEX7w+SY2HG41hi+UrTl52vfGhik/j/YrC4k8Pbh9BE
   FZF3jWRbqqHDT/fGaIZT14ThxWXMFxl1zGulLmKiZwn1BhJRllF3RFohA
   bwLJfK19dxMAFlG/HdHoUl4mgPYbFM3XzjYD40wTeHS1NW+FYI5vvV5DE
   u6vDUfJsvMYqtYeLvSTa5qrt21IGWVnGk+vkTj8NF6opF/TSIwo47GCBE
   Q==;
X-CSE-ConnectionGUID: x4jA7eC9RpWBzWR5JnFg+A==
X-CSE-MsgGUID: vprZQSnCRM2mcJA2HEcoRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="98634226"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="98634226"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:54:50 -0700
X-CSE-ConnectionGUID: vwCBtZ76To2p+scOo5kP7w==
X-CSE-MsgGUID: /7yYRr2nRyqFFTo4Sp4D+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="266810153"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:54:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:54:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:54:49 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:54:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kxw3SE0fDMAGPX9ZwaEspjcQpCavGFe+w4wldyB3Yav6KqwBqQCNqzc7gmt63dYnw8CAyIr9I3jhap8fkDEGAMJHq7ijCewm3tKfrbw1LGdlHiAO9sFGZqrDF5C5PDav51xhek9bMvcGJidQMq543Twf4KOjTZftV21YZiUR5I4ReoQz1iEgZzIwczxXHl/5bgMfED2omlRlctru0AIrnTo7NTZfXW4SbmYtATmiGYPzaHw8YyTFlujiSDStuAX5lHAKWpqe8l2x7vfH3ewR0NKmp81ZE/O7UwvfgyDdnA8O2Qf3fSBGNHnXsA09cWW0zQiQ0rTJDnzfrwKCkgzc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LExNRhfpcBbiBn0gQGrud4afZh0/VIxUPbeNYqHhTHQ=;
 b=tAW8g9uw92sLa2wN+TSsN/fDvq/YlzDNEFuSiuTflzZKAHjV/jw6WdHpJ55Ngq8jWZ5SjW78lCkalW8NAMBB1kLXMuJqE/5kltdrxFU+20kpQTHtZ2GXnQ0fWnqfO4ZNgEKSiJivkJfhodQD0nSbAlfGYHaRGy/CxKeSKuTE0hEV6YCvMPDrexO+IO5GM/56aUZirfzqov+QoBbpppUcFidZpYceecH+LiEpVVzM5Q4c0iOuDocziMzp06JiscNCDrxnqRWBdqs2GY68p8pqO7wjLvIAVZc/Q+7wZVGekXLUgWxKPZ6/+N3w7Bkgypf+96xr8Mf3YiJu9QhOlArxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:54:46 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:54:46 +0000
Date: Sun, 23 Aug 2026 20:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android-mainline-desktop 1/1]
 arch/arm64/include/asm/barrier.h:133:20: warning: passing argument 1 of
 '__kasan_check_write' makes pointer from integer without a cast
Message-ID: <202608221630.BE4lPUFQ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0010.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::19) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|SJ0PR11MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 6896daee-5572-47ec-56e3-08df0115b5bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: z9peHFHksQtW+n/MN6dyn6U/iBHAgNgnGdpTUnbYRgQEKgEKsTlnCYqjP1zp5uLmEEwDslJ6xr2tzptwK9p6y1KwsdOUF/tlO8s5F/6NZgrT8pIzCtt9op1GiYIVYJhcMafI/FF4iFned09iXkReqrIZQNGrj8C7ZSwFaiHTupnhTm6rIt8vOSB7MDNA9kJA6qgcyrx6uIUOoFZkHQ/gJg/Nd/7eRWASTfChEBG6iSJnaYjWsnWdnCrEDpCEC1VMb3al+Tr80mFaJWH7vK3aZiqi+cKlV5l7VfwIKM13C6NqaYUVvz13mls8yScUXdHBwYqt3C9a28UItqiFRs9Pkac/JfMXm/TiagWvlWNrs3ejYYGYnFZeKAkFeKkhL4mYgCjcO3BPTK+oAKRFhekOszouhN13wycABXXsrFTj9HyalHenFjwxfP454ToKwStzA4bKe9nzRag+MGhuLNEFzQtcQDjAL2MgLj3ZLfgE/PTWUNC8BHRTUqNzLy23mcKXkhEwfH/5mSgMQgouJpMXelEdqqnDJsss1+OeMwSAGcny6YjvQl9KVgot81qMiG7J39UZTL2+9qLVT0QlJm10OD7sD6J4Z8iErtSf8udBjuL5HJK4fsobcUy2IkVxzEN3ZAxjNHWdBG1LgwjQH3zAFAMZ8a1IaETeBub8Onekvec=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NQzLmseZp4QfPWdIGAujgqhVmHT6bSqeE7NAW3b9ZJTiGxTWD8B6MjncEpN2?=
 =?us-ascii?Q?WxfFDs6dTeI0TH7OG/DSbkiWt0yn+BCOH2mnuwzbHqL458FuGKoBTZKW30mK?=
 =?us-ascii?Q?nG6Pg8X9rQ/Temxt2bJOp2XkKzLCQB/U5dJSjuvoUe/m4D0nd3lX9e2Hg+2G?=
 =?us-ascii?Q?HkPCo6EiS5T5geEkteaYUzwSpAm86odfrEV1JIypkEtWAAC9VwJpQ7sIRfu4?=
 =?us-ascii?Q?Twx8n9lNl/V/Ip0EUhJMNcvlkS2G6ryLddIZZ28pCCkOlLwp5i1xrtXKV0MP?=
 =?us-ascii?Q?yxduQe+0KP5BKUOu/ECKOlNEN7kT3K5G1QvWJcYtD28mAW1YVfGl2SDZtKAQ?=
 =?us-ascii?Q?7OxaG65iixK7Me3xG4w++FUI/96tbzzr/Erjfi62CFAXHlqSQiRDT0U3RDkl?=
 =?us-ascii?Q?TSmWSznS5hyNCxooA7ofYd6GHHMN/vFJg2CC/I2WQ7kRpLmSHrGT7/3TSRDJ?=
 =?us-ascii?Q?HBywNfYRyRimmwSwk7LtI/0N9+IQSvsovdiwvgYZ36ElyZB5Cdx0vo2psghV?=
 =?us-ascii?Q?Q+LnFYq5tZZpx4MMVIe6W6Ey0rbUlNF2uLOYePvTvpiLJZo3kPJVQrIy1WFX?=
 =?us-ascii?Q?BijCD4cq7cZFaktJskbtKRcnXEEcjJM3FGvDfXbY+NNG4e/IShWHWk4khmAu?=
 =?us-ascii?Q?d1dXzsKNAUV88MvqmlG49rvDsEy0FPlzQWJdztE+9/0z+kyd72w7451+zaK5?=
 =?us-ascii?Q?jhvE0pS71nikyk/lscXPAhdgUmg/mpi3DAO6O/KMcWpHFTQYO/6danb+Uh4O?=
 =?us-ascii?Q?MaTgH+VPHfljEiH/9VuYT2iDXTJtu/Zso/E2AMviBNB8LaOprmfR76iP2O2a?=
 =?us-ascii?Q?RcGGxi7ZsJ6c0WjD4IRYOpoGCs2bSMMdvMamCyWyWDnxQTUt3yLIzMJEhNzW?=
 =?us-ascii?Q?u1XfMscbuTGTn1ehHdnDl6JE6BV85N1BPreswM6Zg6LLx5BBDeyqsR0rrwAo?=
 =?us-ascii?Q?nO3DCu6gde81rzs0No+dE9+WTsmBpEIgkXbuNFDT2dAZ6WZ0foFTuYADdNRL?=
 =?us-ascii?Q?zSjgmICP8vh5iuB1uqcM4TMuJVP/jCMxM+EAKOMgDt7oIkQz4Q0Iq2Xd9baz?=
 =?us-ascii?Q?SMgZcGplxTNfLAv3O7BmUZJqv8R88TwD8McYDtMTUmLgczVzKTaENWlpg2mn?=
 =?us-ascii?Q?OFbyWkmDrQmDXvDDJpFd4fx/ejxt6GVMJouPZ2R6U2TBhGSZoYVnjKOKmYFa?=
 =?us-ascii?Q?rpEbt7WvZY50Tkg0dHDzs4fYXZVVtvmnnBISnPFDCgisaizVJWtj8KQaFtpU?=
 =?us-ascii?Q?x5nepQjMNy5hh/UN5mXeqCYIRvYmcelsskfKPfWgqvnc8zu06SBCQbTeCx6c?=
 =?us-ascii?Q?nkyGZdK5wVOy5Yb8v4SlY8Ay74eohfK4ebuwT5IWzyRlRRaCD0dPVeF8hRxe?=
 =?us-ascii?Q?qkVjdQJ+QHJ/gC4jEhxLEbL18RDwpHFcfH78t/Ojnw6O1EJve1WMUhIBIGND?=
 =?us-ascii?Q?jVTo7GUaj69ffjk6z/ZO6rTul/+XEvwsM0134ckplLDFgHcEvssjepBfowKM?=
 =?us-ascii?Q?5me3AB/BOh+grrq1NctZvr1CMRVFQwAb8Gj4HMcFVDXIefCIRnRgQpAGDNMK?=
 =?us-ascii?Q?+VFpIf+0xZHo5MLwvzWyLTD2XzNnppVWxuSw+TZ4vnqM0AW6XYijg8K01boB?=
 =?us-ascii?Q?tHe4TQasAJVfXSKjA3R8l0o6ofKMZ1jF2C+NJpA7CRTpUUE4apNjks2uUkpg?=
 =?us-ascii?Q?fkzmbl24LsIxvNEXZkn4DHGyMV4OQJaLofWDpICu0OqNozlv9ieYjt3GMWrq?=
 =?us-ascii?Q?GJ5YLY5BtQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: eVi6x1Qax1NXtdI+INKHtAdPKg3DQcLI3uHTeKZP+1eiZzKaElUrYfK20radwyXfZIF9kx/t0++02gMXx4rgTRB4FNdXwDCT4g6qnT0yD/xH54QlUfUkBptPiEVtxSSI11fW46u0YdzyOLIo82nbL6kNx8rD1jltoEdu6Ddpkr+4fw/w3NteCz0KJu3NOvb9Dc8yFCJ/Dk30CZc0UgGCD3I+aqBrwoddInj6Co6VIXe/MjT5qA4GvZ8IpU9Dt/Bx2k9+AGiCupBIcP9BOrxgSLkWs2nZTYKyLFiIRetiexfYJ+GJj6Iaq8o1ha+VGZ6Aw34ULOv6KUkEwxd+iWr8Mg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6896daee-5572-47ec-56e3-08df0115b5bf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:54:46.7118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2Hnj7pqjiyFc6IF24jJQWShg6KdPZ8JGIHddTttM4UD6i7UmoGccZgVwT3rnUXLPvrOYXAr9e3cIX27Z9dDiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
X-OriginatorOrg: intel.com

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   32fbb9061c7aac9d3b2343d85e199cedf31e1f67
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: arm64-randconfig-r121-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221630.BE4lPUFQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221630.BE4lPUFQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221630.BE4lPUFQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/include/asm/barrier.h:132:2: note: in expansion of macro 'compiletime_assert_atomic_type'
     compiletime_assert_atomic_type(*p);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t),    \
     ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t),    \
                        ^~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:132:2: note: in expansion of macro 'compiletime_assert_atomic_type'
     compiletime_assert_atomic_type(*p);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t),    \
     ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t),    \
                        ^~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:132:2: note: in expansion of macro 'compiletime_assert_atomic_type'
     compiletime_assert_atomic_type(*p);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:2: note: in expansion of macro 'compiletime_assert'
     compiletime_assert(__native_word(t),    \
     ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:21: note: in expansion of macro '__native_word'
     compiletime_assert(__native_word(t),    \
                        ^~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:132:2: note: in expansion of macro 'compiletime_assert_atomic_type'
     compiletime_assert_atomic_type(*p);    \
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from arch/arm64/include/asm/cache.h:40,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/arm64/include/asm/processor.h:29,
                    from include/linux/sched.h:13,
                    from arch/arm64/include/asm/mmu_context.h:14,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   arch/arm64/include/asm/barrier.h:133:33: note: in definition of macro '__smp_store_release'
     kasan_check_write(__p, sizeof(*p));    \
                                    ^
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/barrier.h:133:20: warning: passing argument 1 of '__kasan_check_write' makes pointer from integer without a cast [-Wint-conversion]
     kasan_check_write(__p, sizeof(*p));    \
                       ^~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/rwonce.h:26,
                    from arch/arm64/include/asm/rwonce.h:67,
                    from include/linux/compiler.h:390,
                    from arch/arm64/include/asm/mmu_context.h:13,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   include/linux/kasan-checks.h:20:47: note: expected 'const volatile void *' but argument is of type 'int'
    bool __kasan_check_write(const volatile void *p, unsigned int size);
                             ~~~~~~~~~~~~~~~~~~~~~^
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from arch/arm64/include/asm/cache.h:40,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/arm64/include/asm/processor.h:29,
                    from include/linux/sched.h:13,
                    from arch/arm64/include/asm/mmu_context.h:14,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c:51:25: error: 'struct mm_struct' has no member named 'iommu_mm'; did you mean 'mm_mt'?
     smp_store_release(&mm->iommu_mm, iommu_mm);
                            ^~~~~~~~
   arch/arm64/include/asm/barrier.h:134:18: note: in definition of macro '__smp_store_release'
     switch (sizeof(*p)) {      \
                     ^
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:137:13: error: invalid type argument of unary '*' (have 'int')
        : "=Q" (*__p)    \
                ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:143:13: error: invalid type argument of unary '*' (have 'int')
        : "=Q" (*__p)    \
                ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:149:13: error: invalid type argument of unary '*' (have 'int')
        : "=Q" (*__p)    \
                ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/barrier.h:155:13: error: invalid type argument of unary '*' (have 'int')
        : "=Q" (*__p)    \
                ^~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
    #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                          ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:51:2: note: in expansion of macro 'smp_store_release'
     smp_store_release(&mm->iommu_mm, iommu_mm);
     ^~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c: At top level:
   drivers/iommu/iommu-sva.c:68:19: error: redefinition of 'iommu_sva_bind_device'
    struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
                      ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/iommu-sva.c:8:
   include/linux/iommu.h:1576:1: note: previous definition of 'iommu_sva_bind_device' was here
    iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/processor.h:28,
                    from include/linux/sched.h:13,
                    from arch/arm64/include/asm/mmu_context.h:14,
                    from include/linux/mmu_context.h:5,
                    from drivers/iommu/iommu-sva.c:5:
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_bind_device':
   include/linux/container_of.h:20:28: error: dereferencing pointer to incomplete type 'struct iommu_attach_handle'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                               ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   drivers/iommu/iommu-sva.c:92:12: note: in expansion of macro 'container_of'
      handle = container_of(attach_handle, struct iommu_sva, handle);

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/__kasan_check_write +133 arch/arm64/include/asm/barrier.h

47933ad41a86a4 Peter Zijlstra     2013-11-06  126  
fd072df850e536 Michael S. Tsirkin 2015-12-27  127  #define __smp_store_release(p, v)					\
47933ad41a86a4 Peter Zijlstra     2013-11-06  128  do {									\
131e135f7fd14b Mark Rutland       2019-04-09  129  	typeof(p) __p = (p);						\
10223c5286f738 Will Deacon        2019-12-19  130  	union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u =	\
10223c5286f738 Will Deacon        2019-12-19  131  		{ .__val = (__force __unqual_scalar_typeof(*p)) (v) };	\
47933ad41a86a4 Peter Zijlstra     2013-11-06  132  	compiletime_assert_atomic_type(*p);				\
131e135f7fd14b Mark Rutland       2019-04-09 @133  	kasan_check_write(__p, sizeof(*p));				\
47933ad41a86a4 Peter Zijlstra     2013-11-06  134  	switch (sizeof(*p)) {						\
878a84d5a8a18a Andre Przywara     2015-04-20  135  	case 1:								\
878a84d5a8a18a Andre Przywara     2015-04-20  136  		asm volatile ("stlrb %w1, %0"				\
131e135f7fd14b Mark Rutland       2019-04-09  137  				: "=Q" (*__p)				\
39c8275de81cf7 Mark Rutland       2023-03-14  138  				: "rZ" (*(__u8 *)__u.__c)		\
994870bead4ab1 Mark Rutland       2017-05-03  139  				: "memory");				\
878a84d5a8a18a Andre Przywara     2015-04-20  140  		break;							\
878a84d5a8a18a Andre Przywara     2015-04-20  141  	case 2:								\
878a84d5a8a18a Andre Przywara     2015-04-20  142  		asm volatile ("stlrh %w1, %0"				\
131e135f7fd14b Mark Rutland       2019-04-09  143  				: "=Q" (*__p)				\
39c8275de81cf7 Mark Rutland       2023-03-14  144  				: "rZ" (*(__u16 *)__u.__c)		\
994870bead4ab1 Mark Rutland       2017-05-03  145  				: "memory");				\
878a84d5a8a18a Andre Przywara     2015-04-20  146  		break;							\
47933ad41a86a4 Peter Zijlstra     2013-11-06  147  	case 4:								\
47933ad41a86a4 Peter Zijlstra     2013-11-06  148  		asm volatile ("stlr %w1, %0"				\
131e135f7fd14b Mark Rutland       2019-04-09  149  				: "=Q" (*__p)				\
39c8275de81cf7 Mark Rutland       2023-03-14  150  				: "rZ" (*(__u32 *)__u.__c)		\
994870bead4ab1 Mark Rutland       2017-05-03  151  				: "memory");				\
47933ad41a86a4 Peter Zijlstra     2013-11-06  152  		break;							\
47933ad41a86a4 Peter Zijlstra     2013-11-06  153  	case 8:								\
39c8275de81cf7 Mark Rutland       2023-03-14  154  		asm volatile ("stlr %x1, %0"				\
131e135f7fd14b Mark Rutland       2019-04-09  155  				: "=Q" (*__p)				\
39c8275de81cf7 Mark Rutland       2023-03-14  156  				: "rZ" (*(__u64 *)__u.__c)		\
994870bead4ab1 Mark Rutland       2017-05-03  157  				: "memory");				\
47933ad41a86a4 Peter Zijlstra     2013-11-06  158  		break;							\
47933ad41a86a4 Peter Zijlstra     2013-11-06  159  	}								\
47933ad41a86a4 Peter Zijlstra     2013-11-06  160  } while (0)
47933ad41a86a4 Peter Zijlstra     2013-11-06  161  

:::::: The code at line 133 was first introduced by commit
:::::: 131e135f7fd14b1de7a5eb26631076705c18073f arm64: instrument smp_{load_acquire,store_release}

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
