Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162DF72627
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 02:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763863517; cv=fail; b=Wiv7xTPlPJZzhSkYX+F+NYhEA+kl3p6JWVw5yAAuDVTEnXEiK2730T4UL5ChaO39db0SMiHTPujPoVtXE1wu8kRKSj5Mw5pdN/7E1vX4Of6Apq66fOQ0AMc8onZn0euCPbYuQXWm0+oMIGRhDHOvyyFdhnCBxJ05sj5SPoabgAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763863517; c=relaxed/simple;
	bh=MrO49hdNSfAu88uDYz/1SAWdVSDZa0+23foo9MlnHhA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=URc7rWuf8SekuG05laYg6eS00Dr6BYsz3tSU3WLOogF2ZpQok+aqYWD8Y/S0Mo8s1X7OTIjUM3Vn2wJAtgl8wpTa+aQkUdq0VjbjHu/T9eZqKjysFQc3p7zS8RcSYHPRu0+jZvMVfKgVjft/f7//eXHiid2ZQChr8tdPJitfgKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/8zj3Ng; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/8zj3Ng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763863516; x=1795399516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MrO49hdNSfAu88uDYz/1SAWdVSDZa0+23foo9MlnHhA=;
  b=Z/8zj3NgatkR4zuZMqIZBD/jdFxmJfFc0hIYPj91p7cvb3ktGQKDT8d9
   e15JDxutoZMIs3kL2U/sWbM1PsWMRVh2PrMj9QJe2Zutg2SyW9PY5i/2D
   q/gX3vAWwRYh+GWuaDIgAn+9/ZkgobH5UcZgyElTO+s2Lo6uvoI3tBUFP
   GcFFdJ69ZfybjeQ+ll7toVtr+hpTOfzZx1RGQk6r5UJn6yI7LRaEANiRB
   v1QgYyp/UP4RA5A9pqkvTMetnxjQx9K3bO1WUHvI74vPmj/hLqfaeFgkc
   zuVF4dXzaFcmRtyXgPnFbYnwhQCoMQI1kJAwyw3wvfmZq6xHDLyTPKE7q
   w==;
X-CSE-ConnectionGUID: HNdGHO3XSYeFB5qd9Q3wtQ==
X-CSE-MsgGUID: RW96YiP5RvaIw/6pBKYwEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65951777"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65951777"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 17:59:42 -0800
X-CSE-ConnectionGUID: JrX4VJ4WQ6KfpkUqNay7TQ==
X-CSE-MsgGUID: feIeFo+fRku7QtbfgrlFSA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 17:59:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 17:59:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 17:59:42 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 17:59:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBluULOWdZbPazKk1u1KjZI6LLmJG/837fUevGO0P2eYxkXLiZF+oenaiXo0wAaX+mHrWdkrDZg7nCgR1yXRh7w/cg4NUphtRuNTyWxz3Bn6Pf5U9O6O6sXH5iL7GDU0JWTxAF/oJEmhdUyFhM+VfNEsN66k8Vf/Sm4Kusf1pXnQMJnn1csxG5qL7OMifPmLxeE6Ro2WUQhipy+XGAeC5xnhVlXh7EuvaXdg3E2rQ85K6Z9IX6hBQlQjlk88CATXg2h5XY/pPhY9DBJhGqHu4EZBt83fXh8jFri7gPDdOc+sKJLF/d37ktaO1c2oh2Ov2X64tkKebzRfJkCCb1Z1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pq79QKw8naPKnZy04tULmSsq/FvLs21NGJxDhFeswLs=;
 b=YeitRQfJL76EgIxeIIm37mjRfYZV1K3qPFCbaGqjnls5Sg34RJAjNqBW2XB7r2RyvQoSDEUoW02/x83G2w4OJnCM1raM23+L2RmrnL+3sNzadR6lutr5VHdjZXoXp6xd6n+JsYsX70CSNG1lvZFT5MDRvM+Eu9MNhgtdhB5CGB3K0H6WkaWNkFMGho1KqqBGxrKK21uv4CM/gcLvPKa9j55SbDavZgoQdXOFXAR4+bxTOsnyShmuImsovEffDqTNt3bAyw+qhNiBjS/Cztkb08FWc4QKf0qaZDEHbGDDPG8oahAfJVJR17VX5Sq+1CFrdn89JK8t6IB6dwDJ2XgKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 01:59:35 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.011; Sun, 23 Nov 2025
 01:59:34 +0000
Date: Sun, 23 Nov 2025 09:59:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jimc:must-be-lval 546/16507] arm64/arch_timer_edge_cases.c:1041:10:
 warning: comparison of distinct pointer types ('typeof (width) *' (aka
 'unsigned long *') and 'typeof (56) *' (aka 'int *'))
Message-ID: <aSJqfpxkO9EeaSTo@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc7375e-1f5d-4c01-b187-08de2a33f33e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GXLJQuVM9oLi9qm5FzBQuobIWM160sVwmsbXYDrJ4XeYFqmlgWwMjVgPSQ2H?=
 =?us-ascii?Q?nV30MpAwAGVUKBMgVlyfefS6f/L4QqNFtj5WzUR8K6ngx/MiSSc8DJIap9UO?=
 =?us-ascii?Q?s64fsoPjJdA/0YhXCotJxl4CjoYgp03e/Bx58OZNINcce8gEq1IlzPMg7hTo?=
 =?us-ascii?Q?o3omPjhZF9YfNlCzQGBf6RgyP7q17OnZYjgPgCQBKQlQr1a5Dfe9m7yG0nCL?=
 =?us-ascii?Q?Nw97tgK6fkLAOU6NQBxUrh6S/rXZM2DgClIzwSmMGvnPCaVNrbl19oRbkmS1?=
 =?us-ascii?Q?Xb4kEG7yVtrh2K1Yv0ApReFGwydyGuAhy2PiC7AoUtQ1smtNdzIcnvYvQiEM?=
 =?us-ascii?Q?46rW4+0f/JSxJXdrytF5jxJndpdDs3PB/tr4jsq78F7eAvuRkQCrGDGOyHhe?=
 =?us-ascii?Q?RF36jYi3MpGRWIQG6yQiWCXqOnVhEeJOqApNC5WvGoBp+Zri41Li9jTUMyZY?=
 =?us-ascii?Q?65YMphkIDSV5H8hlzwrvGkA1yeIV8a+gzMLBbLIJAOSAE+OARN35M+x2rLmZ?=
 =?us-ascii?Q?oz2m/A+6KNZa5GQB8LmeXWWmT2VNhqo4YPu20a+b6lqKQjC0eJqAhInRQLuW?=
 =?us-ascii?Q?kYB+DgVt8Ppu+TDjdHyQfWp/yPuVkRyANrtpImTNNWNzugLuKYB7F0JgXOQv?=
 =?us-ascii?Q?gOaeZc4h6N2qGBZ02fWdIn0D8KaSwlEiH7xe7tn/R5WFhhNVOCOeXOG/0Iv6?=
 =?us-ascii?Q?f0Hakyv2+lGh1pASlERy2dF8bjdh5x4DxqF4R19QMYd8MmMglurgClhMS5kQ?=
 =?us-ascii?Q?jXo7pBUQ0rSA+5KJNMZ0dj7wGNDWSJ1AVS8VtXql0yqsI/l6yUIvpXpuM5xj?=
 =?us-ascii?Q?sYThf+t+BbnSx8lsu9EgtiG5MQQmvZjB3eNS2bDma8P7dwS70TdR2EF+Lt/F?=
 =?us-ascii?Q?vEBovqVB+PbhGcLdRAwUEZ3hVjh+H4H4IhhzNx9KBnKSnCnpSrnaBDmzZv6V?=
 =?us-ascii?Q?OPyzaxj6dq+WLIFswB2rwBNFVJc5+CzQk1KW/ucP0iHhJVL2HiqTT6q4aY5x?=
 =?us-ascii?Q?VPjt1cjSro23u3i6eXccVED09w0uGWMGeoGR8SNnvtfI9thttEaOwqU7nKg5?=
 =?us-ascii?Q?hbL3DW/tSQhBi9PVKiizS+4aDfAVROxfFMa0pn8q7ei6eMHhpZcb9VKxePue?=
 =?us-ascii?Q?6BczJUCrP5MHygGVVAP8gdHjI64RZPON1wfKIVBeWjPh4527myTVmaEiLN9f?=
 =?us-ascii?Q?l/VIXqgHvaICLJ8tlJFumtnKse+mkv+ErMrt22KfWalrv7bfCoH7scg/BBL8?=
 =?us-ascii?Q?pLY0oudKy8YmgcrSwc5BTcf0Rf9CWqtrmunZkNq3zS1woO5XJo5j8+smnoL9?=
 =?us-ascii?Q?3ukucXJ4lNPoq4FKgkRAPiXJR08gHMf4ilev3aTLujcby3kA2Ls4enaa7LKG?=
 =?us-ascii?Q?hC85MkaggvrPkP5BzCY1PeOxpzKogGKKP8nuYROMO4asJe27QaHozsSfLuns?=
 =?us-ascii?Q?iDeuOQYOJJIXUJ5sJa97aRQ2JcfI0A4d2a5T8hIs4LxTFgVwLT6WfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GLpTbticYwPYEy/XGS3nOwzPnbxkMyBZDuciRdhRSgxlL40YtXO+Twwr7RHW?=
 =?us-ascii?Q?Bm1KR3gbB+5ytuGnRe3llhIqcW1Me9OthqCRLbG3qjwq8luOQgH1QWjmMer3?=
 =?us-ascii?Q?mxGNiYPL5BrPSR5aE8cb62ZWQScdLmCyy6l3dlM8OYFmKH+L9OWFYZVqH3Iu?=
 =?us-ascii?Q?mWaUle1bQoJSPgShM9l0M3683bgjfcLI8hkTHo5OqzMbH/uv/QtMwuT7zbzl?=
 =?us-ascii?Q?G6UlwArSBjYlwiALS+5kKgg6YLTBdeW3CnFkeGjS9albJd/t4WhVgbKdPXBT?=
 =?us-ascii?Q?03qHD+fxpK/cZWAb7htB5R+iyjqGG1prR4iFbv+Qe++1ADYcw+Al9J3827MK?=
 =?us-ascii?Q?bGP8IiUsYfJm/ejCx6zk1CYtFN99wcxVY4sNQ0IY8oOCTk/mSXZItLXbSDcA?=
 =?us-ascii?Q?LxerS8DY/vHywVvPq7vTvYLsRdhUM82sPN2O7ABnoRMKf+ILVVZpmtQOW4lA?=
 =?us-ascii?Q?GgyCC0KovGwUqxQoQS7PhWr3QscMZRM/V54NORV0bASB75HadmublCDpxslY?=
 =?us-ascii?Q?1mbogxbJaGBwM0u45n3GAa+3HrruDeOqlL5ApYD426XK2gduBsUSondYAD8g?=
 =?us-ascii?Q?oKXYDSwKro2YD58fbAHxCMKcyHakyqaugeuxgWz20rU6OoI8jdCgA+CO34QN?=
 =?us-ascii?Q?f7rbFg+7yJxsXgXtMEKyw62kg1HVyjsDP2hZU6INy1MiTpDCQbqqBfck8/HS?=
 =?us-ascii?Q?my3D3bxyVq4RD1ygW3V6OiYEOsy1thGVOg5UizjcdG/oEHmN00JFUlvEoydu?=
 =?us-ascii?Q?RBv7vkWLY9qhpv6NwZ9qj7lvltR6+llttF4ldZecBe+5wNqkeZcaynAvYIA9?=
 =?us-ascii?Q?t5wP++kzKm7HHpgWRK+XwTQoOzsZjJ1gHZQFzmZNzQlY8nBSwD7xiDH2KVZy?=
 =?us-ascii?Q?tANEFUgNx7AwyxgPoRdZtADW6yz8WGlpTHqqHF3R6oCrrN/oeZ8YH3rQaIyI?=
 =?us-ascii?Q?VeN87ygxaz1nefeMe+ldSZ21sVmz6u2MOPuOXSJjr+Bn97wTISo+ZSoC+us9?=
 =?us-ascii?Q?BpbsS1KOd6MCYtrJIbShbb/g+3Z2wJuwjcuerBbxg+tnliGGGDAyD1KSOxwv?=
 =?us-ascii?Q?mhxAaRPq5BjlvmaIle0hDbkclEZYemAPgrPT1kGPapqDjAv29TMlNDv90cwE?=
 =?us-ascii?Q?X/LcF5g4q9f95FHFkPV3m43bIhjWACTNJ2Zj4ZxWXEyZ+DkF2w82Pq8oFwFD?=
 =?us-ascii?Q?ciJCSkHyaIhOnM9GM0lIeRz361rx53mgNVOrTh41tjZ0HXPtKe8RglVvznWt?=
 =?us-ascii?Q?NcDMDyz7eNB/t/OFM7YFsFy9kD41UCsupo+eNZ2zXtLWBP2SGXbaOfdtmYYw?=
 =?us-ascii?Q?7UaC+TdAQ0gY+rXaRoLpJAjq6vxGUoJoPOkZbhIHP9Z5Ba6j54bTPI9jCG/U?=
 =?us-ascii?Q?YGU8ik6GGJkH69fhCzvSkio+v2LEdla9Y0r99/CazeGA03dOhkVCw1CXv2C7?=
 =?us-ascii?Q?7JbDefUA8VaJZ7xieYF/L39drNpM+86JyutMsGKsxwCdXrQTr+3UenazkNhB?=
 =?us-ascii?Q?EYpepv9KsSMW4/AjASZIl8KmyxIZRID+NPuVhgog0zKgUx4ld0q60QEMh7I5?=
 =?us-ascii?Q?fYvX4PeM/tjprjQEk9wvHbwLAYpoiQcB2nOggVHbdbZros3243YTZ9b73mMm?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc7375e-1f5d-4c01-b187-08de2a33f33e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 01:59:34.8760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyWlsTGL/5cOQVvnTMzXpQaSatKCU0DeCul7cjYWj84k7ZMs1NmVmjIkdUihh1rkAFV+K0UMo8atESGlxPs41g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
X-OriginatorOrg: intel.com

tree:   https://github.com/jimc/linux.git must-be-lval
head:   ddd6ff4d1945e2040067848741c3e94855fd43c7
commit: fad4cf944839da7f5c3376243aa353295c88f588 [546/16507] KVM: arm64: selftests: Determine effective counter width in arch_timer_edge_cases
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221704.N7A7zwVw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 20c323aa0e5dea6f3d340c721c5cee30801db850)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221704.N7A7zwVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221704.N7A7zwVw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arm64/arch_timer_edge_cases.c:1041:10: warning: comparison of distinct pointer types ('typeof (width) *' (aka 'unsigned long *') and 'typeof (56) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
    1041 |         width = clamp(width, 56, 64);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:47:45: note: expanded from macro 'clamp'
      47 | #define clamp(val, lo, hi)      min((typeof(val))max(val, lo), hi)
         |                                                  ^~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:33:17: note: expanded from macro 'max'
      33 |         (void) (&_max1 == &_max2);              \
         |                 ~~~~~~ ^  ~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:39:9: note: expanded from macro 'min'
      39 |         typeof(x) _min1 = (x);                  \
         |                ^
>> arm64/arch_timer_edge_cases.c:1041:10: warning: comparison of distinct pointer types ('typeof (width) *' (aka 'unsigned long *') and 'typeof (56) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
    1041 |         width = clamp(width, 56, 64);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:47:45: note: expanded from macro 'clamp'
      47 | #define clamp(val, lo, hi)      min((typeof(val))max(val, lo), hi)
         |                                                  ^~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:33:17: note: expanded from macro 'max'
      33 |         (void) (&_max1 == &_max2);              \
         |                 ~~~~~~ ^  ~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:39:21: note: expanded from macro 'min'
      39 |         typeof(x) _min1 = (x);                  \
         |                            ^
>> arm64/arch_timer_edge_cases.c:1041:10: warning: comparison of distinct pointer types ('typeof ((typeof (width))({
       typeof (width) _max1 = (width);
       typeof (56) _max2 = (56);
       (void)(&_max1 == &_max2);
       _max1 > _max2 ? _max1 : _max2;
   })) *' (aka 'unsigned long *') and 'typeof (64) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
    1041 |         width = clamp(width, 56, 64);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:47:28: note: expanded from macro 'clamp'
      47 | #define clamp(val, lo, hi)      min((typeof(val))max(val, lo), hi)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:41:17: note: expanded from macro 'min'
      41 |         (void) (&_min1 == &_min2);              \
         |                 ~~~~~~ ^  ~~~~~~
   3 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

