Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ABD30ACEE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038167; cv=fail; b=aCQzhmUSA99qDqFLkM+wppUdAQhPB85hKN6R9nMbjs+c6midBvIOHy1YFlva0Vxs0UaKNVCzfhnY2YUU8gu3dNMFFcNjYi+BlInb8r8xfKvr2VTZhMx70LhTNWFETkDi6ocqLFCcmwLfojPAg8yLwaRdkjccgP/I/dRrhzZqAns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038167; c=relaxed/simple;
	bh=NUvcDEvaT+YiHQ33vbVn3wpxw8HPgjASIJPn1pZGJ80=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lfpQIHbYzjombG7/aqP+FMKxBVGMhkvXJ8cK7YNXNBFFjE8cZBub9iPvWrHkST46VEh7Z4t8mBXinhqJKeLMDKEjI3aY3MTBYsK3c0b8TI3Ybfhgrs8Avh5LEfNcHO0XuSp1dlSPGhXVlnr8nDKSQd1EPEtwMze5u/l5pWawZ9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4p0PVV0; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4p0PVV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038166; x=1822574166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUvcDEvaT+YiHQ33vbVn3wpxw8HPgjASIJPn1pZGJ80=;
  b=Y4p0PVV0B55ievCO5kodPcyM4eXZKMOJ9s7P8yVZ6MVzhhphygPjlv/V
   hyFh5I8mB1YV9n2XyzQ/fOoCS5rh0qaXZE8QwA4VOJOVOYJVO/Frz6nfP
   gTBaY0s1OTtT/+1gQvMqVehA+foebBpkqJ1Ooe1mbA0TYfIEQiqJ+kGDM
   mAyAdv7zr/6EhY6Wrgu9/9mno+D4Tdg27oEIj0w5nrk58dniow6VB7D8Q
   jdcXCiRH1nt8zjK/S7GPn367n4x7YJRvc1NsGFOGwctvhYJoF5yaAfc4h
   leTkKURhdciYVjT8WZYWTuFYO0nZbzTHbCOLZsaFJ97s6a8gNvx+FxYha
   Q==;
X-CSE-ConnectionGUID: WaNbICo5RA2M75KKWpxDmA==
X-CSE-MsgGUID: BTSIqP2/TnKZeMXOX92g5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="109264682"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="109264682"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:36:06 -0700
X-CSE-ConnectionGUID: hwtzg/52Q/ON/k9kgWmF4Q==
X-CSE-MsgGUID: X7ECbF4IQDOB/Mws5mrgng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="279707706"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:36:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:36:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:36:05 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:36:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAYWZ55UuRwKswEfGGQdMts7LVAkoBzrjp49oX6V25F9GtyZgJ0ePHBQwJKYB44Jjeos8FTgFLiaOOmsxFhrAubxUglc5koLeMUJ334qdDVtR+Bzx+1l9qCQpswYGaZDr5o8MtXaQErZEmyWMEXeZMfBw8siBSiVFe0hR8O2Y7IOq05q6IFBlLptW24Ii8hrz+Y0qlf22cNoTTrv1XszVQQKplpoXtLG4oeZokcJLhHHnKCw6udtWyHFBnkm0+jDBQMl4OBsrEinTYPuBxcI0rebylQEjUhhaiif7LmOZGH/yYRaMqKTktwz+3aSocLURB3Wo+i26mRn0hKewB7/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHL03nbw/mTUschj4kGUrAflqX0Qxk2tMCQkKPL+uDQ=;
 b=riKqLCzvTsG1D/FOu67zJnxK/0PZwWQQXhPX+0lSrPJik4VgVkLqFuM3tHVaXml+w71UxZ+6+IaLKVrwZ9+IgvBqtF8jqY4/yynQoyxyPhZ00TTHDtlK14ik8m9eWnp7p7+d+6kAJ/f4Cw5Mz0IHL5JV7tfX4it4NlZtH3MjC9vCTIgIMDYYlwdOqKCZTUkPBBl7xyJE/4Uq4TLddfyJoIa6MXisX3/cWZRGUBmfmlLZ5D0dNOmJpaxl88uM0hq1j67yTmoc+dAoPnLtHEkZd7YUuvkBSt5beQpFtllXR+VOeiPjl52O72TpF+02IBBXvluBpTkjxymcj9BzwLRBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Sat, 3 Oct
 2026 14:36:03 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:36:03 +0000
Date: Sat, 3 Oct 2026 22:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: "T.J. Mercier" <tjmercier@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: arch/sparc/include/asm/string.h:15:25: warning: '__builtin_memcpy'
 forming offset [5, 8] is out of the bounds [0, 4] of object 'k' with type
 'long unsigned int'
Message-ID: <asESzOshc/s773vK@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: PH8P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::11) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 772868e7-01eb-4880-eb81-08df215ba677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: mvjR/W0BUHUPJFhFJqnYkJ/Rt4njf3ZUcQG3DN4rRN1w3wA+bE4AoS+VJNztC6XFdteV9iwPY0fUOlGHZA7jB2C3kE7ierdYw8rzylr3i0D9sBh3jl63AmZQe2kRl9AiddMxPJZlFLEnJ8vDmXzYOVliXW6twvqFmsTjh5RB8xF1Z4hkaBJ/tCgFMcnWLTdUtdH2lzYcibeC8ZpryymFjayCz17PeBEb/U+vqPyDJK8vNtzPS16zkFB1XkHJiDfs1atVeG2jTQ/vH2+TNJnZPg9M3iTdHihY3o3nixWiohM9OROEYIck8sqVAc2gCea1AYe44bRQiG+ogiWhYgcNvbpvJW9eVsn0DYecZy5SPzulgs0ATZrpriqGRYbvRfOsKoLpSs8g1/o3Zjo5ddfSrK+72g6dpdDhQSrbnD7Nh+nCm+Gazv9VJRKKkMDrhRWdpxb4KxQs7inWdUtkGjeXwii4eAPdEyrrYpu9WNRvmXEf9SZyTe2JRU4wUly+4kjygxTZWI33w4PuefzNPfz6OVAyk1SpTzRcYBkJZF75EYqfdAIVQE1PIDbJnqMVh/jsWhMvYzfxJ5ZMJlderKWPkli2fxF/VP9N/PsqRKGv4Z6TdXlaFHHZSQVc1+tzqAyu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LHqFKSmZpjCJ7Yl0fW3OeSOW5mcgWUbFKNRVqg5fIPxO4MStZulqXl/rlUfs?=
 =?us-ascii?Q?sF/si/drBi8rbzLAxgsW2Fyr2cVJK2xGTY2Fvzco0tf8lr7u3yHqQFvtVB2q?=
 =?us-ascii?Q?ySgBe5BTMXqKOCYtFfIzIqIoxRFngId9OQvF7PI/N2f7+ZwpPf7GB24vkLs/?=
 =?us-ascii?Q?BnCwfAXGPncytAJokZQm6pu/2BuZO0X11cfTCHLDlUtoc1GiaBMDu4TB/Xb9?=
 =?us-ascii?Q?qr98gk61KDmVkL8WVYtjJvpn85JyexYGHglQjbgyqGV7emuB3kcjbxVdKPZ4?=
 =?us-ascii?Q?25nzz5rzHB3YHHDX+wNK45eW9DQE5BwHwnZKSQ34I1J7QQx1sWqrQHNgOQew?=
 =?us-ascii?Q?RchmCrMorATmaxicp1Z7lWJKLjxiSACxwuP/6HuRseSPH4UJBp1QYmvXD5yB?=
 =?us-ascii?Q?5vpSQ0uhZiy/kEYnsJXdFKT3d+oApUzoUiMeRPtngAD4cXCWE3dMtKOCVM3k?=
 =?us-ascii?Q?U6jLEOYh1PoP7DET4/Zdt8w3bh+VC4w4ZApffZSTlQPFRP7S0z/CvLQ0N6dP?=
 =?us-ascii?Q?7iuiM/I7Jjp+7yqNS9XNDraKOgXU0QqQnsvbse/oRFppMdBvyXGjv139jYTk?=
 =?us-ascii?Q?cQCLrqn9oiaylrtZ1KrFtYi6UjlntbmjHwCsdkU1lMWmcsoRXozojngk2J8D?=
 =?us-ascii?Q?gHjyLQZqk3O3QEvNbnvB6oYE1ojpR8cooHSZ9ac/OAXGyrgLrBPVmO1pXNNn?=
 =?us-ascii?Q?vmjoXPY7Qdtm33L7iZ5vQGVJ5tAJ12ayaASAvHWEAfmC0xjeMEuoAjrpokxH?=
 =?us-ascii?Q?iS4CFfaybUBa0CRMhbKvQCejyLM6oCvavOM4h0l7Lzq/C1LCMS9OdJE4E7m+?=
 =?us-ascii?Q?zFhAyeqrSdD4uhB42VadFCIUQjXVcpbDa9HJqptWkDA35RJur0tZ+XzVXYgm?=
 =?us-ascii?Q?cPeQhHB2G2prybtsqeXFVbDYMv+YFMCujurWamlNtz1dRHDIbMAHNj+j/eyI?=
 =?us-ascii?Q?C0V2lI8W9rEnbYH58djabPnxtGlT85SHC/YLUxN3pp4H9w9hq0NQIByDm0PU?=
 =?us-ascii?Q?FQW7YauUMtXeJ+blJySIHMw/nIKnecHiIQM+ENu5Dg3xhrNCdH1DaXTI6JwU?=
 =?us-ascii?Q?/mDC7VdMXr8S/LT1HhT+JMGxSacyAP7KQrNYnpzJ1x9cSXizhupk3wO8NJcU?=
 =?us-ascii?Q?cqoCsnISdlxNNHhGIQyW5VRgS/QdDwaJYQ8unwpw5C7R5B03hYFxoVy1FH6V?=
 =?us-ascii?Q?Fi3n9Pe7OxnRNdN47hWs7X5WbFFMAjwX3GbBNeCiTeNvg4eXD0N1kh7GWJRX?=
 =?us-ascii?Q?xqNS7om8+uJJu1S2jpRN1LwXrOiYo+9eEx9O0RTfihAlr6Mfp9HcHAhyq8aN?=
 =?us-ascii?Q?ZXsDc2bmZiHV6MWghEkOxZSkPdhsUZW0FngrEx67P+H8i+orTUkBirkygeUh?=
 =?us-ascii?Q?G/9py5zXkt9wjDqvfkPZu6ClimiU5ke6AURawrHygnnqLJaRIhFy6BhtcT8M?=
 =?us-ascii?Q?kmt9QDOkf7nVFxL0Sz75yGRH1XG553RRorAHVF6z2omRTO2def1BaN6wGx0K?=
 =?us-ascii?Q?+YAIDqYESTN/B2Om7OAly7O8MyR4prp4aq+3Jub+ySL9ULv50o2dc3HBBQSf?=
 =?us-ascii?Q?O+K0qHtsm5bznIf2vVc6wmNEIMw1EmAz3hDM33FsTZQPvWQVRtnB9FQXaLoG?=
 =?us-ascii?Q?AbbkMGhMNl2P2xU0hvA/cWBtrzorzcmu9k2D00TxqcWpZ0Cb0W/r0loUqT/D?=
 =?us-ascii?Q?M9DueJXxJ3AFC/1a5lovN1j1gezROlDDB9fcsTfBNa5nciAD6NkK3m1ratyU?=
 =?us-ascii?Q?0dpXBeJX1A=3D=3D?=
X-Exchange-RoutingPolicyChecked: VJDZ7jym5AJPNdaAcK3UttOjIyxkhtwy1MvCAqzbUCm/wj+S0rxQsddnkD4QM4N3WjSqrd+IYEC2qsNIelWQk2oem62bJiRh93BCYm1goyL6a4s9k3rC2UPrpXl1k0hBuMOy9ihDfW+TF7kvhGFptV/on9pFzajD4y7CQr62nUcm0k2JHYjDsIeQxdX1MOc4sEU32WBZGLNIUAa6lBzyfcnc7FQ7KV2agGy3w0lSxhhLdh1YoG3IMAKGlJZu/Kc3l4ZwIb0hVVEqHWhGtrjUa2Fz2pXd+MnTp6tdy5q5RhKL6H5GrTQprnkKnRzbSv1gz+iVfx/q3gLxU1re0Z2T9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 772868e7-01eb-4880-eb81-08df215ba677
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:36:02.9523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksQ1YEYGT/VY3t8uVbJlVNcEyTiSmz65bDAhLZ1yV5N1F0h6x6/FkiHuZTPPkEqmlcB30MoTmkRQSusIhQi+Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/T-J-Mercier/bpf-htab-Split-htab_elem_lru-and-htab_elem_pcpu-off-of-htab_elem/20261002-091734
head:   ff6cf05dbbb8d27bf0e53e860d6320dd75ab8f78
commit: ff6cf05dbbb8d27bf0e53e860d6320dd75ab8f78 bpf: htab: Reduce elem_size by 8 bytes for small key sizes
config: sparc-randconfig-1000-20261003 (https://download.01.org/0day-ci/archive/20261003/202610031215.ybqsLvSp-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031215.ybqsLvSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610031215.ybqsLvSp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:107,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:12,
                    from kernel/bpf/hashtab.c:5:
   In function '__lookup_elem_raw',
       inlined from 'lookup_nulls_elem_raw' at kernel/bpf/hashtab.c:843:6,
       inlined from '__htab_lookup' at kernel/bpf/hashtab.c:866:6,
       inlined from '__htab_map_lookup_elem_u64' at kernel/bpf/hashtab.c:890:9:
>> arch/sparc/include/asm/string.h:15:25: warning: '__builtin_memcpy' forming offset [5, 8] is out of the bounds [0, 4] of object 'k' with type 'long unsigned int' [-Warray-bounds]
    #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/hashtab.c:812:3: note: in expansion of macro 'memcpy'
      memcpy(&k, key, key_size);
      ^~~~~~
   kernel/bpf/hashtab.c: In function '__htab_map_lookup_elem_u64':
   kernel/bpf/hashtab.c:810:17: note: 'k' declared here
      unsigned long k = 0;
                    ^


vim +15 arch/sparc/include/asm/string.h

70a6fcf3283a0a Al Viro 2016-01-17  13  
70a6fcf3283a0a Al Viro 2016-01-17  14  #define __HAVE_ARCH_MEMCPY
70a6fcf3283a0a Al Viro 2016-01-17 @15  #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
70a6fcf3283a0a Al Viro 2016-01-17  16  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

