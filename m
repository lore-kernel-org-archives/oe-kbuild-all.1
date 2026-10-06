Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EDD3E3D80
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791288433; cv=fail; b=DclhQ/ISbJ6gFHjyuoOjQ+PqdRbosgSM1PPBSi7UtnhFwkO+i9A7VSDtqlJepmoRX0HmAE/GjTGOQzH+RXC+w7oUlzXZZTJ+KRP2SBpZQcivQEK+Vl6PEirwImbsXXnlPVEIQ1vaNT8ytqs59S7isQaChCncyUdtUt2OE63cefE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791288433; c=relaxed/simple;
	bh=8lxC+8CvugdmlIJakr0CuZD1+odMy/qBX6vWEW0CgYU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tAwPYeLEqR3VMdojOb7rc0aUUuNpDrLb+Hs5CUV1cPB4Uax3q7t5Bc7BCagdfTwWPuIGuPLatOLqcDM0T/IloJTCqYb9I0n98HX6r1sE1mZK0UjxVDa0oWq9OSQk/RzJOAvr3hb7oapRvgJDQrmVLRwYug0O0xsy8JLHuL8yLzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbcGVUVO; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbcGVUVO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791288433; x=1822824433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8lxC+8CvugdmlIJakr0CuZD1+odMy/qBX6vWEW0CgYU=;
  b=mbcGVUVO2FbhsVHM4+eeCwYfOwP/4OpNoHm2imnybnbFreFyFCLJTyej
   Z5WHuVBdrzn2BqQ9RJIGIzK87xvCaKIJPw/zPinlJzmRA1XwYKk0F2uaY
   D7xuSkJ7lLvxIvxFVCfd8r/BJLuH82UgFMpPz1JzEksalcUlHrxOhW1h1
   k1ITfVAkQnnDsEsHlbjvDVs1mnaKJead0GAE+JKd0TFCOfzeFI/OPHEvt
   jL3zvWTexVvmTy/6mz8khX3Z/yLsUWkihR21DZxA+QM/hDCcs16FFGCqw
   St6SHIN5ISDofnnExRKevC4JjaCgtF3bqTx+wCFThVOCpRmln6Jfx9kfQ
   g==;
X-CSE-ConnectionGUID: LZyBy2zFSWu2/o+Z4uyAow==
X-CSE-MsgGUID: xzMZ3c3iQ3i6ODq0qEAk/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="24776"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="24776"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:07:12 -0700
X-CSE-ConnectionGUID: AKISkvjESu+esbp8B0zabg==
X-CSE-MsgGUID: PJY6T5tfTiqRFh7IXDKDTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280421702"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:07:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:07:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 05:07:11 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:07:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZFgF+S6GwFaCH2O3vT89UcgOkgb0RhHHkgewwNB/1NROFqTgEJ/X/7zV58l1KnogyteXHvAzg9d4PmZhbobDmCtSQIMkZ2ArhmftI/2SORZvWWHb4CuGBQWHagiwNW8DQWnoGN0NrY/p1xn2iAz+J6hVlKCabFBbOCOQ1n2omvWFSN5sRweJqYQtynvmIaoz44EpGflaev52fbs20H4C82Hfdo1DwEIuhQH96gWFPckgt+V+G24VT32MklIvwVJZyGXrKF8sO4j1iHoOQMrca9dQBt4Cu/WgOajRr6SSSEKWtOHza5nnH50UTB1CkaPnW45GlkAod1zyEEXkY6Zog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSNX+nB8bd/P9ULwjFnvKYAlnG5BQ/kR7V5JxvcCMHU=;
 b=d8mM2MeAkGKM5pzKJRFZTJsMDbwfaJD8hSWZD0IJCjIzhx+Fv9e5vJ9g6G83wJ4Ag/3lQvYF1OYpCi2nmG6YONXSO5PpU2mPEyfByqb0DH+VJkdH0ZMxBSTgR6mWha0zjhc8pQB0vTky76fQwenPyPO8LF47SR0NDueE71arLr7TXVv+3VOklaMUPRqJJXkX+8er8amDeCCqAJ+/H448mXX9n8RpDToqTlCJNIuQCdHRCOT+Ogc4nCmz+4HYWdINpapE6WWQPcxRQ4IBEkZYtKtg+7ZNvmIDVNk88WzCg4q0WFKWm6MOxnzqSCfkTNYs6zDYIGS2CX928Mh3tnX1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 6 Oct
 2026 12:07:07 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:07:07 +0000
Date: Tue, 6 Oct 2026 20:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_432' declared with attribute error: BUILD_BUG_ON
 failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
Message-ID: <asTkY0JKiHCQ5lNn@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0007.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::7)
 To DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 73bc5517-6158-48dc-6f1f-08df23a25767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|6133799003|56012099006|260925021911599003|10067099003|260925021311599003|11063799006|260925022911599003;
X-Microsoft-Antispam-Message-Info: tybncvnRfHEQxlCC8kPJGCTyQGYZNLh1rY/o3u0wPXvGu0i78/NB5qP2tVt+i8O02BgMeqZwvT0o/7x9xxsJAQjwfLSchV8XwhdrSP9AItJGukFWA+ksTSgzXRLD8w2Wuz926KDDVRuMoDj1wL8ugOpIhNQWyX8dtgbyrM4+rpP9NpcxpZ5zHlBAk4/Qo8pAnph3i0r2YAt/7gkly9IGXDgDxxfKqhta770DEOz3W6AXq5RK9FmuRY3iHVUudNeE1WetAGhiQxCfNyztXv8U2yL7XX0V3lmyFJpdbtvDaV385hYxIgUkp2qaIucw4UbKznPk+5eVQDM+sM8+a5VNmRz1swRn8oqv6z1yVss4RhizJa1X3lIavRp5LUrU6SYK4Sb4DEJQPEJg3U3vyV6zC21Hos8LbrCogm6FaJYEDEPESWpjBhEglXekosNJODsAn5e2Sb8WaIV7y2n48CvnF1CY/GktWuUTCbK7gyIlbzA5GViVOsKIVs8vA3tNx0rabkbMKkgbVvmQ4A91IPOWXRr+WyMFC4mOpUwnnm3f/ViGryvGWTPdD1VKl02Npc9aL0YGvf7gSIynJrlqJ22ltTOgvC5QeXsqqnPUePy31iHa6BFumEVMcV5ZIBajoGev
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(6133799003)(56012099006)(260925021911599003)(10067099003)(260925021311599003)(11063799006)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m+AWlvaYPJk2NARRLqgJRct+AZzL62F9vkalWJKRgE6o1pEOxpZwUw1i72q0?=
 =?us-ascii?Q?blbCiw4/My8iOnMH/Ip7ZLET/Vofvhklt3bft//4F1XKbp1QDvZvws4vXWnl?=
 =?us-ascii?Q?c2KjICS2G7xH7gwqonQUBMyeOFMxEDM1CQFgJTkSE0NxRIeNswLYWXs6++82?=
 =?us-ascii?Q?q93opeEXGkttaFGiRfarkUaWVA9gxC/xdmx39xUVQSKgbQ7/FPrxhK+xhPX+?=
 =?us-ascii?Q?Zf6Tk55tYJAWOez2djIq83TeJbUV1cNQEKGJCdd6zDPrU0K0BIkDhv+2JdIO?=
 =?us-ascii?Q?2Fwz2hfhHaWEYmMbH7PPmJDHuyrKJ6nI3KTeakO1ULHeN+hvkqnuqpBp1h/y?=
 =?us-ascii?Q?kGhtr4atW6/RGC7+jYz6xQhav92EGsngQUmo8aKYN9DJfFCidIxx92SGj8ly?=
 =?us-ascii?Q?sIjcj4fDV03Tybl/9cLnmuNm01/FpIPSr6ip4z3ysxCCsr+WGYYrzY8JuiHD?=
 =?us-ascii?Q?2qlMQTE/fl8mRmpe0N0kYlU9nKIId1szLXih70QEh/kT2uCTPnxgecJ+z1v5?=
 =?us-ascii?Q?x21stXS3gQR4FZGWNTRqd70vPOb5QzBjjER6HVOzw384RCPYbXVXXu638CD5?=
 =?us-ascii?Q?I+3acDVSsHDtxc1z0qw74aNPHHDJKX8ODIzAOMIYVSyn3Oqb6nDadZqv56XI?=
 =?us-ascii?Q?Y4aRpHwcszqoynpd0l10Cq4cXxoRZ27XH2wCki+P6XbhoJXNY+2iud4qzCN1?=
 =?us-ascii?Q?jrTlQNYXVo+ljrH28miyfM8uCMmHYdgv9OWFHQc8z15BrYPqTb++hF42jFaP?=
 =?us-ascii?Q?89pzf700JXy3pBOwBbaWdAcIsjlV3lIzJOlM/gDN4YsjNUdMw1/s33UbW8xQ?=
 =?us-ascii?Q?jEn/37o3T/WvnfiZIPsIrUxwh/pVqsbrIFVm0soYFaKyeeHXPfm8G9rW9ybn?=
 =?us-ascii?Q?DxOkg7rbmZJW7cHIoLN3FXCctPu1hhVuS5OJz337lbpXh6INenVLecYrqOlG?=
 =?us-ascii?Q?746qpE0xWHXh33qIh2ofg7Gc9mSL/KI2ag+R1jty1hFV/q0At68Gx1BgYfTr?=
 =?us-ascii?Q?xlsI1RqtFN6g/1xUfXYEjqGFzdmcM8RoOthPqUwP7e80InEeb/NnLM8HNF3v?=
 =?us-ascii?Q?gC1GEXcAjTAJ7INVaM2OogMISbG+SgfL7PQ26dPpuMk5TrZocD6/sulwyTBE?=
 =?us-ascii?Q?131iZWLn7jjqvVhmn1gq03mwOvsYUXU5rNSHK3n8rYR269k3czPDzhbtmnIQ?=
 =?us-ascii?Q?QQYQiK3SHAO8szlQtMdJ44Qzeau5WJj4aN0rcIzA84DUZw1JDO1sJ8vPw+d8?=
 =?us-ascii?Q?7Q5Wkb96bpsyUiJBVdnzqS32jK/zBIhmn2xo3HhoL0EhHQhQcdxgSrGD9NFv?=
 =?us-ascii?Q?7fFabmTTM8DkEr9ZqH27vITh8g9UtVCqrOVjmLuUhsEBmKY46HaTYXGtSacT?=
 =?us-ascii?Q?V6rnxrjmgE6UiWZyV4Wo4gMgJpqUWG2Y3ZysaUuGdMOu1sOvSy/tTBA0JaGK?=
 =?us-ascii?Q?lgUd8ItRDeIfGuA1KAQtAUtw6eYguzAWt96vk8YbjehoMYW3cFwZjqTOE7Kh?=
 =?us-ascii?Q?a0g9g/pr/UmxvffuMBqVIXKT6nmODTZsVdG2bJuDRw4J582WYSGWfJzR3wXI?=
 =?us-ascii?Q?4zw7e8wchbTkU8NGYCYjVN3/NzktJWTH0R7T+BUdYhKzCpf8+vDlT3Ty8VpC?=
 =?us-ascii?Q?32uOb6Lt/wMh2UynUpQgo6q8dZ2ey4Lm2CIF2cKLfySSz892sAlD5yTRR/74?=
 =?us-ascii?Q?GDQjJVCqRG9Ogr5tw2VPpQ/t9bUcbLQbELuH0CMzH4w/lIBcx1w2U6nhRnMv?=
 =?us-ascii?Q?fCq63gokHA=3D=3D?=
X-Exchange-RoutingPolicyChecked: gf+2Gz/u9/ZxAHoc3TrDTzdRFBNTs/s7xMPsomp3qpFJ/zQzW89ILVgrsPcQT32kLgfPskiDlKRPuTvYVuH2iPvjzaBWyQVtK32GSYOr+Qe4M6tCMQ4qcj25VExVv9xxsy33NfjN2U9NG18wGbTX4bRqobdw12xl90gooQeJiplCpFLOX82Tt22We8cGNkg+N8VNfeFa3pNqWsRquxOQ2e059L3aeKsXGoDI7/Vd7+r/RcyxJrnC0/JYW7POnNhfvb8JLKTnSLr9iSL3uG66gIxfnq1K6Ceu2sQz5QaH94kTsbBQgh3Je0mY3XLagoZl0n0aqTccAvEmKAwYnjofrw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bc5517-6158-48dc-6f1f-08df23a25767
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:07:07.0273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zf7dRZic12l0MDnFrKMj434KByDrYALc722yfCNOW75bsS4fYXmQ/jHQFASsL9gU14Uqjb0FvkCbwZyW7sY7/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-memcontrol-allow-update-of-LRU-statistic-without-holding-LRU-lock/20261003-205512
head:   fb7e985a90aa08774d1149de30384a36bb55bafb
commit: 1a4c8c8874fb1ac601f32faba8141125425b6f1e mm/mglru: frequency guided workingset promotion (MGLRU-FG)
config: parisc-randconfig-1001-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041125.0hFLPRMR-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041125.0hFLPRMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610041125.0hFLPRMR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'lru_tier_from_refs',
       inlined from 'lru_gen_eviction' at mm/workingset.c:251:13,
       inlined from 'workingset_eviction' at mm/workingset.c:415:10:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_432' declared with attribute error: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/mm_inline.h:149:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
     ^~~~~~~~~~~~
   In function 'lru_tier_from_refs',
       inlined from 'lru_gen_refault' at mm/workingset.c:323:9,
       inlined from 'workingset_refault' at mm/workingset.c:568:3:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_432' declared with attribute error: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/linux/mm_inline.h:149:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
     ^~~~~~~~~~~~


vim +/__compiletime_assert_432 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

