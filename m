Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1853D1ABA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487981; cv=fail; b=i4H/e6kxIigCykC+CE/BmXE89vEaDIr7H5SV3rcQVV+BPa4SuihMitxmSAoIUbtUEzU6HXPR2K0c04MUuThR/9VRSqr70s9YTA0NdLd3uZUwbgObmT98/pd+x0i0tr/qN8y5aeRUEqZb8q32xz9XPMVs6AlIdRHlFd1G5iJ8D+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487981; c=relaxed/simple;
	bh=ydWKdAzXCwagEdHN28Solvru2Lo0pPVf9FHCnEMYYoE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=byQXHLO034o0V0BWcwAmnM0+EKvMUMOTI2NAIkQBDzJprpGIc453mFJAU/yyPL+zmuJNM3UYKj/yEtj4arXEsdn+3BdTx7YP62dby3JaWa2qb6POR0hFUeDfc4jUW7GBE80dD9k96iBjQl4v+tvwOdm9LbtPACw2AMt2HyXbNKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyAhteU4; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyAhteU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487980; x=1819023980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ydWKdAzXCwagEdHN28Solvru2Lo0pPVf9FHCnEMYYoE=;
  b=RyAhteU4iKSPqxPKsR3Bahs9CxIYwgnN7J1UoS0pDJ0shYFwG87HK9bZ
   4g2QMMO+gSdYMU1MB40ZUcTXUeuMg/OZ++mXs3XIwlHtl42NPoobNOMZa
   8w0rKJpgiL3xuuaVIE8UBUByQVcD+3Abm2XCozF6IXzU8V9ngUvHnLpeZ
   28ZbsvXJdDY5oy0aM2BAwpF1G+1W/5x0N3fprybCgQQbFg0wiIUamoc2s
   iWCYnprliM/dkhuxBHhfP5XL60y77M/aVLJLNZGCEC3kfzqvw4ccTCN1b
   G2irE2E080XZ4mSI/QXoO/Gyo/6Bn3QtGZhIvQjQUJ3TltLpCOLfGkYGc
   g==;
X-CSE-ConnectionGUID: cmMQqSC+QyeUFk0EDpnodQ==
X-CSE-MsgGUID: mlXdaorvScGOl1L1QwqcNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87981801"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87981801"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:26:20 -0700
X-CSE-ConnectionGUID: yy6zYB/bQRSbXuI+RI9+jg==
X-CSE-MsgGUID: HDdiV5DIQ2u4HzIGjAiaRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="304954562"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:26:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:26:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:26:19 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:26:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzpnHaHsebZa8RQHYwTryAO08NNw6RMHlnqIi1EORTGaHSexnawTMwJqkW+5kCeSUnm6muC63JgxpsX4QQZykvrRQDao41BXDClRpYFzdSyIt68OEtynVvpGH8Ke8kV5qggLgMVaVvJcVjIw0fDDSFivBw1k+Tb0I94OuEpUd3MzwQ8MtdkW3BDIFttW/8TUpQ42gy1RXWY3pJ8fLukKoEnPBHfrAG+CNpk0lzNwkGY+G8VZ73wi1zvuyOb9mkMdNa+9gm01bWezCyMxdcLGWw1UeEaNYoHlY4LRsaRynPJa+bgKV7GEN+fdSZGFqsFRGFs8qLQU5GN4nQnyFoshHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qg6+qvLG0v2jGt+WoZA9TzlONKJt7BV7C3UqQrUuyyo=;
 b=tVC45q7up40IaIYldjB30gU3y6KI43do4gvR53E0pUSAIMgmzbjnf9aRhnV3GZ/N/8cYDxFQZOziv8M1nNciica6ELOI7wzmjvE6xiOm/lZzsRUIvEEPwB7i+VvAvvtKAEzC8NK63veRfzmYqFMHLvD3i5dX1ROdDCEXDbkl+sp1MiV5PXzmAr+SIvW3kF3SYXvlvFunCEcLg1339bvRhM3gF+qTk9VnzsWlhdfheUAWcj3PWSLHpD8DqW0VLodTJZMQgObwbTwkk55FEMvQXoKOpAY5OQrVA8PJkl6BVMBn6nUKKqIUG8x3FnZH7OgQVZ+bvnBHc/Bi7xTibmuUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by IA4PR11MB9324.namprd11.prod.outlook.com (2603:10b6:208:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 12:26:17 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:26:17 +0000
Date: Sun, 23 Aug 2026 20:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12-2026-03 1/1]
 include/trace/hooks/wqlockup.h:17:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202608230104.3ZYEoTuW-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|IA4PR11MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2db324-35be-4d89-2aaa-08df0111babe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 5aH+pSNpNgdpe+YBXLrxnxCepvykE6+8lp/Ht7gfoHBFQc526u/j0fLQVuABhFtlc3nVTQrS/jm+dygsMEzGUXw4XHPfP/xLt5N3Bcz5Gz/5IjPjJaKOTh2KnVwFtbke4KCziObzX8KYrvgteUbrSbLyYQdpDNb1HQx5xZUwEw0o6EMO+Enj6NYvR5t+TJm09rXTA1HjJ75vRslRyWBwAolJXOf6vdRhVIk4PmzOuUqo/4TQywvZfukhk+WXJ8dXVtmebjCLc5yQ6bco+eerYNG94NCiHWnB3azYftSxNrNV3hcWRMy5+AsUUAa8cwryiwWStC+Gra1ZJo/3yF7Sw9+pS+bgzzKweB1Y9TEs8LM5X+BeFsIVYxYsv749bOHpn1tY9lgw/B2L70JAs/6GXpvnRMflTSikHzTvl6rGBf9lcJc1YWBUDETikQGKgSrVWo/4jd4M/YPGmpKMnBtZ2evga4fbJPlQ0H95lyYizJnfFogdTeHCWSMtIflYYRLAay66QPw88BpHZxInOz26OvAQvvJOxPtVaM/L/SzKZWffSX3YgTvhedHBsi+PMUoD8tZGMcVhaMxqgEAfqNwL7EOGn+Sh22d7kFd9J743uSrEg/lz/x+HRvO95NeKcsSdYMUkxnOEy8rDNVxJ/ZfCDT1IPotbOXPex9FHzxcfP4Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bDbgihK+Sc+cYJJvLp+pgzMfnKnRS+Wz9xGJlKtKmOU9F5lkmmG0Q56Gp2Kp?=
 =?us-ascii?Q?3RcjWEAgDaEjqPTvYt+QAPc8+AjKh28+Xx+/DMZANlQZ52gad5/Epa18LKRI?=
 =?us-ascii?Q?3mSCrEX/qlJ9VDOUIZTW5jLLgQ0jD9Dp6/NSTwPDjp1b8d3sWCLAyW2J8fbR?=
 =?us-ascii?Q?PF/dPsoiQh/nt9ckuxT9tE7S27I+hfpvEFZl63BBW/5meLQXfzXM64nugZvK?=
 =?us-ascii?Q?OIKduIOd8ofMHLH45ydnCNeztbDMpUwJEJWZVSXZ/ftqT5NjfC8pV/YSqXAj?=
 =?us-ascii?Q?JKGU/dSPIWDCbY4spNY/v7Jit159d+zkkVwgrsb7k8ceV+QQjPh7wcKUQw2c?=
 =?us-ascii?Q?KL5ZrxAg4iF61t2BEfkH1QXgKSkh2RCa9uLxUUDiQtfNu+VlTv1Vi3Xxsleu?=
 =?us-ascii?Q?fgbo8xsORvkKxBUW/Uou1ExY5S49R8FxR0V5RDJP5igsvG+3WiUzDJH80/Xr?=
 =?us-ascii?Q?l1/rGvPiwNRCJVfb35PySgkgcQJU+ryEXy1kpNyBkhDMxwKFdRsTPNRIt3tb?=
 =?us-ascii?Q?Mp1ml0ZqVtWz/LU45wpE0ZAfGShE1CAVzj6/hFsWFrjYhA6SOov4vgDAMIXz?=
 =?us-ascii?Q?zqaKjyB30xVaXHdt9rgsolxEJTf9PmsTQveXNmz2dasyqqTOLUJ8UcQRQU/7?=
 =?us-ascii?Q?qScfSXOCID9H701n4aIeT72hOaxfwlHM31bYBt8CiGpselw04PALwPGXLGpe?=
 =?us-ascii?Q?RzS6lzOWJTW9xK7K4Nq7DgV8m6hsGQ32akfNeAdXYBbcT1QNG/5XAH4IwaRh?=
 =?us-ascii?Q?9k+MfdkTe0T8bNmBWQfd9OQWg9BJ2Bfc3/XbcsmqYmTAGEmMuLwWlS4RoB/b?=
 =?us-ascii?Q?P3XO/F7Jj78nqr9/zm0qoT+Yo7Dxss+1XaQplXS89SHgyjlDK098a8ITlYFW?=
 =?us-ascii?Q?ddchYGrQ0wcouG/CA2l0gbLneH/WTjaGF2xMLbk0c6gb/nBQbVu45kFVI2FO?=
 =?us-ascii?Q?roZQiuSFH5N5i/MICgh2hc2/wMygwFyfqifARjmRnCNaIbn1w96hMn8vxskl?=
 =?us-ascii?Q?lrBsJLe/Txg+GCYVe8Sg8wpC7B3vlpcslqd5X4eooDILX6BJUHJ/dPsp4oiP?=
 =?us-ascii?Q?WH7dIN52vF/qfTsYHxvXVbd4M9eG2orPweNwuo3lvPjrjak28m5ow6AsXmV2?=
 =?us-ascii?Q?gTvcqcdvO+h/Tcmqwik1y/sbKkpRIlxU1AzALHXMv4jdy1f5MydJpc+cfzoF?=
 =?us-ascii?Q?70Wz4Hkw8KYv5QgTq36Jqrj618q5EaAGKSsFGfJLBB9xJNzDsa7DA5LxPgjB?=
 =?us-ascii?Q?9nwdWkHVR/sH6B+fVhn5jZfSkAJGFAJmG0emLqMZXh50J6m57ukSk/2PwYCr?=
 =?us-ascii?Q?ALTT77iei7NI4KT7Nadt3m5fUXnVsWeIXG4irQseE+kApBoKmTYoKzL0hPCY?=
 =?us-ascii?Q?aAsz2guLOIrIu2K232IrkGYe0EL+U3IGn3rs0USpXyEmH0F4Og2qtD1yPtZl?=
 =?us-ascii?Q?DyTBaguN6RbZTOUvHCWuQLAx/enhJIb9+u9p+YvHHS2+2l7FUnlQMI1TA0pf?=
 =?us-ascii?Q?iJqkT3DT2BvUvr6FxmXRR01gh7uZtEvuTXsihc8eo2cDIRXGTszQ7i3QFGXE?=
 =?us-ascii?Q?AOO4K1Kk3v6zNohvN0Ak//Jg0vFo4VNs0TvdjG4Rk9RCaQ3PfvwTg69x18LY?=
 =?us-ascii?Q?6Y6/BErG/E7kRME8jXpJ7he9Qfi1+tmX8D5pia/SwJPutga+TNvkL9aU1OAk?=
 =?us-ascii?Q?kG57ZMqOrW1vlH9ZNeSdDsayX8i8Dy16Cyh/h9zEGGnupW+ZXtUcteDrHJNS?=
 =?us-ascii?Q?NZmrsIigKw=3D=3D?=
X-Exchange-RoutingPolicyChecked: SA7DPYHNMjTUZv4uzRsXNyRPDu8v0PnpuM6DgQX4kX4F6EWxvI9PHpbihF8NR4EHPfrR2Dy5ecLG20qBg4bA6pAABpqw45VPTZzXxGfIyLvm7kyGMdaiUs8foX6/fMUoIrIT3gufZUFlEtCAano/k/4OlvjZN3Im1jJHY6yx9xaeZ6ILql6/3bUGlXE8W/s/AgSOi1BhfpIjUvWtXMhM+n4YIFjkHN3WZppzBnd8jIDmplX/dL3oBppdbdJ5P/hMBFJJQ8fMwMXtpqCauJwOaS5S2zsXgAClWefxvs6ItGwPLkzCmJXcXDVHW0xTCTGedhmjz/cjkX9jWofHioYxKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2db324-35be-4d89-2aaa-08df0111babe
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:26:17.1306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvEaNtJlx60Dd4kjiSwI8pixkheMSjzJgztUL1apw0Nr5oo/bSZSrzMc9l1DWPu4i6UHw4p8HZuJ+r7pts9VVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9324
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   625bef5cf43deeb3fca2e75202bcf958b6b976e5
commit: f642834be6e3df571934572011919cc18224202a [1/1] ANDROID: vendor_hooks: add hook in alloc_and_link_pwqs()
config: i386-randconfig-r132-20260822 (https://download.01.org/0day-ci/archive/20260823/202608230104.3ZYEoTuW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230104.3ZYEoTuW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230104.3ZYEoTuW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/workqueue.c:5468:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct pool_workqueue [noderef] __rcu *[noderef] __percpu *cpu_pwq @@     got struct pool_workqueue *[noderef] __percpu * @@
   kernel/workqueue.c:5468:21: sparse:     expected struct pool_workqueue [noderef] __rcu *[noderef] __percpu *cpu_pwq
   kernel/workqueue.c:5468:21: sparse:     got struct pool_workqueue *[noderef] __percpu *
   kernel/workqueue.c:5485:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct pool_workqueue **pwq_p @@     got struct pool_workqueue [noderef] __rcu ** @@
   kernel/workqueue.c:5485:31: sparse:     expected struct pool_workqueue **pwq_p
   kernel/workqueue.c:5485:31: sparse:     got struct pool_workqueue [noderef] __rcu **
   kernel/workqueue.c:5524:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct pool_workqueue *pwq @@     got struct pool_workqueue [noderef] __rcu * @@
   kernel/workqueue.c:5524:54: sparse:     expected struct pool_workqueue *pwq
   kernel/workqueue.c:5524:54: sparse:     got struct pool_workqueue [noderef] __rcu *
   kernel/workqueue.c:6039:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct pool_workqueue *pwq @@     got struct pool_workqueue [noderef] __rcu * @@
   kernel/workqueue.c:6039:13: sparse:     expected struct pool_workqueue *pwq
   kernel/workqueue.c:6039:13: sparse:     got struct pool_workqueue [noderef] __rcu *
   kernel/workqueue.c: note: in included file:
>> include/trace/hooks/wqlockup.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/wqlockup.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/wqlockup.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +17 include/trace/hooks/wqlockup.h

     5	
     6	#if !defined(_TRACE_HOOK_WQLOCKUP_H) || defined(TRACE_HEADER_MULTI_READ)
     7	#define _TRACE_HOOK_WQLOCKUP_H
     8	#include <trace/hooks/vendor_hooks.h>
     9	/*
    10	 * Following tracepoints are not exported in tracefs and provide a
    11	 * mechanism for vendor modules to hook and extend functionality
    12	 */
    13	DECLARE_HOOK(android_vh_wq_lockup_pool,
    14		TP_PROTO(int cpu, unsigned long pool_ts),
    15		TP_ARGS(cpu, pool_ts));
    16	
  > 17	DECLARE_RESTRICTED_HOOK(android_rvh_alloc_and_link_pwqs,
    18		TP_PROTO(struct workqueue_struct *wq, int *ret, bool *skip),
    19		TP_ARGS(wq, ret, skip), 1);
    20	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
