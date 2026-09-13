Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA221FF29
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 05:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789276721; cv=fail; b=qJraJGAyQQCx84KwAajptHP18MQWEZUE/dXtIVTzsy5hNvrLnx/UM7VmnLeaB0ieyhgdlMRhwAUTOjGiK+yra3oGFnzDdtb62KrrnyR/rl6tIEn99qyl1FV4XfTMmSOydBlerJie48LX/PkxL1RPsrjBFsAibktujJRm9YyCU/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789276721; c=relaxed/simple;
	bh=6Px2n9gTdIDN/yujCr7sLLKXBmhEEJ0aok8g3FM+PkA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pfpMMCoLnGnJmYyabscCp3/0eN6UpdknQDWx8xujlF4y1RwA1fXG0ER6rrGrEFtePwhymRsftxPyfT00ngI6Fa1qCCb4Wns0VPn0PKMflDbb8VLsL29PhPi8sGqyF1PXuOqw7Ssxryr1RHd731AZqaAWJDXz2Io/0MKUm1EGfSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=doJo0h3W; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="doJo0h3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789276719; x=1820812719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Px2n9gTdIDN/yujCr7sLLKXBmhEEJ0aok8g3FM+PkA=;
  b=doJo0h3WroRT0CcFCQcxYIHF2v8buasCBC049VKisQEu3sqH32R3mofd
   u2yQEkVneYMz6dPJD/MT3GzNKYGKS89dGQMNu7UbuemyMFyRJhUeAM1+c
   az5FQ4+qXUv7J545N0hGPJZnYloDkEpaRLQZqMm84spsI9OfjaJilKEvY
   BmSa3dCZp0dawbazcTspOKmINK2LnGRlfMLrblPY3lUI5MU+MQisc0H7C
   cRd6akPNeWuyYXCUPbL2q++sA/sDZSItr0jYSI2g6A4RuaQPAvYO173EK
   Mf8eLTg+1Igdz2mqx9ddSxqH6T+S38N1nNSh5hFYELzq9NVk5KJgDZH1E
   A==;
X-CSE-ConnectionGUID: wF9DpgsEROGFKujh+gkVDg==
X-CSE-MsgGUID: U3P9Sl9qSCOSbHZ5vxteUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="93377649"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="93377649"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 22:18:39 -0700
X-CSE-ConnectionGUID: ljAxI/k7R/e1ssjwId2pEA==
X-CSE-MsgGUID: uGhY4nZXSx++U4mPGpF2IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="272827876"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 22:18:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 12 Sep 2026 22:18:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 12 Sep 2026 22:18:38 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 12 Sep 2026 22:18:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJtWaI2ENgo5Qhiv8+lH7IVME7pAoYwRcM2unoN8iDO6FaDA57hoxg2B+WAeLVAp9u5JgQ7JuLof0hMKxeATuVEWUG8FZ46/pMNUaX/dtztCoJDbW6JWfb5iIODn6m/OeUvk043t1XBG/J85z4TzUk0PAIlkB5eGx5QLmDTir/j+ZE6/MXTtl82m2jBaj6pD8kgDI2nUO2w6FrCiZuT0130RICZJMlhJmqm7gdwJ1BYXKeXQau4p9/vcGiuF7DUSzmKJKa27567PmB3PVWU7X6gtDTD0r3blyjZ+llP8u4xL80jgqVaJknbt5w4dIT/56u5LKsPSUh12wf5vrKvZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFQX7weRfMATxwR67036FjFcsfeAXCFwfQibBEokDcc=;
 b=MbEi9UTrB1P0xUyO+zWgUAR0h9EBoqlPhtWeZrsKpyrP/n6nE4DH6gNr+0xVQxyNtv4o8g8mln/ToXeQWYmfZcF1zHHLtWVLFvNPd+fnj0wkRQ0aCFNWnRjQnc4E50hPv/bH+mJ7lNDiipE+IinyIjKBXcxap/ItQup+Tn9sfTEzTvqeYtGe022eIeF8Ccxctj6faPA2Yfs/e+s4z12u3BlHDcRhLILodwXJarUO3ZOvpuYWs9m+mdntYhockKB1RdVVk8sZg0y/nQv/9nNR0Eq1mbrS6hrJ3rcNg7VQM68OVW6kbnK668E+LDWXZwBNsdtBJsEMbu7k3FqKTW5R5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by MN6PR11MB8103.namprd11.prod.outlook.com
 (2603:10b6:208:473::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 05:18:35 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 05:18:28 +0000
Date: Sun, 13 Sep 2026 13:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer
 operation overflow
Message-ID: <aqYx+Kr1ZDVe4RBI@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0013.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::7)
 To PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b3ec82-7624-462c-f8db-08df11566f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: uKvtEcNbwdGkCTNe5VDuK5deE1fDyRt2xtIJVXk6M4vmbmv8qHGPEW3PcHp4s1dkQiTqDi8mNqHEhtARSh5UGvmPUvYjhI8vw1ac6jk4nDXgh7+bA1U9+OLqw1/mjz1AZSsoj6K+VAnRoxByg2Lv5DQBJC/L6+2guFYbFjYkrtkvVRX9MoK2SUjLW3um/JqSTH3queeMX6XT5dXzkV5mEhfMMCX7ta4QDoVLFakNn7B9H6t7F8lVTrny0MajOoMnyFUYF8HkWeMHYsc3bY0IbcI903mdwMUKVc6wYk23JOSKO9fFisDiZLyOG/fjXz5at+NWIFfybe5Jj6LZ5w9uqwSOYN8+M6wME5cOynDjgCQtu9746oMvOTPUEATj0jO0lxRoegpSKMlBjJ2bCB/BWoJxGgduXZ273UCvIE4gMN+bWz4gI4vCBnp9o6LsVUCWIQs+az9db9Z22QoHry9mNLBPDwREU+lMMtJF5e/C1b7KrzHNx8kZ7KC/68q+QCxDN0rrrFJlynu6qM446uOOZqbqaTYvlziP+pyr4ymeNowx3ronCTryfcRrzVz6LOQSZCGN6ZqZzBA+z86izTGn3wEAZLK5Iwg4axFBhEY4q2hZViqIvqP2lif05jU0R+2q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2dnJTK2bzRzYA7CgQy+dJXtphlciUvRoQi9f3FdGfuR3zq/pJ6tAXH4q45ip?=
 =?us-ascii?Q?4gkwBDYOPxuz4JS7Pd0rb30wyQlGUpxDEcTK2zYrCgWYYUSHRKyaO1Nm2w8g?=
 =?us-ascii?Q?4XusGzPFW/hlvk3mNdRY8NWOXmY+dxODHXDcYTznARCqUOUD1Jztu7PUM0N8?=
 =?us-ascii?Q?lo7zyl4yKCKSm0fUzL4t9/KXNOLzBejEGB/qfVvKA04x6lTxPuPgbHiunSy0?=
 =?us-ascii?Q?8euK/9Us3uZw1XqK7pN06gKxCtT7wey+dNYw0RlOOUVBiQe+3KP2zsohPRZb?=
 =?us-ascii?Q?zJhvP9B9USyNtvP5Diovw0CjqSkEx9cHPmqGEQTL7IAbrazyvjiEJUcbCBPg?=
 =?us-ascii?Q?YxAOBQ2yDiuM63jaIx2KGMIkiqgXiAUmz10t2ihcHxo6VkwNOmfQ2Z74zer6?=
 =?us-ascii?Q?xNiOeJMYvzoV9/VHXgSYxPN3L2Dt01zWCPStBUeMytxf6BHyCfCd/he4SRfe?=
 =?us-ascii?Q?J2wV3ebWFZTHqFqo9XeWLABneRGHyu1YATrIEWLV7d8iA25dlDvU4a8LC/GR?=
 =?us-ascii?Q?e9pD92iHevBnE2HTW7nyQ7LcBIaKH8qU0uNPZHgDR/P5+KbybNtLQtem54Yv?=
 =?us-ascii?Q?GUhM1OId//mxrSHVV9ObPPCb739RApfzNAzyshy5dYYpyVFu29TDI8WLOpep?=
 =?us-ascii?Q?TLLLsKlojKTzMx0lMhR+D/ugyTRyfQGxcGTagblEvA+swj4Nx8Yq4iU+oRnb?=
 =?us-ascii?Q?18SalhyB+EYYBPMzsWVbl4+h7SYpx0LH/mB5fCq5gxWOn8VvveT6dgjaAq4k?=
 =?us-ascii?Q?d7zTGMznfya94cSwr1+NvblAzTWl8QpZfJKiNKbNMTMoVFqn7tPtUak0ivkC?=
 =?us-ascii?Q?7zLMpeC0kBGPmgdWmLbz5C9tn4ufPw5u0I2srmsj0GKpyDMKyWUxLQh1R+9E?=
 =?us-ascii?Q?rbZ1dRhyaQBTJZ0vxE+DMbXYqzqWo4vwUsKjQkqmhII/gPrz2/1Bz5/4JIMI?=
 =?us-ascii?Q?P66ile580LRW7esM1ZBREFBKN9rfjBjgKp+jKJirjreOQe8nxXxihm3zNa6q?=
 =?us-ascii?Q?O297mNMYLBwiX3t4/WLKKUwQzwsrvrQlA31TFie18NuBFd028UhXdmoyGJtZ?=
 =?us-ascii?Q?n2hAso7wGyh4NuDSj8HiglEZqZZzSeNfxpdW6qfrpbT0WjcoGwC9cMC6WAmT?=
 =?us-ascii?Q?KlbjAyYjrqmbxIeZaLWxB9eIv2lXz0aVUbPcXsfZccCsVx7uJw5BPrX368xF?=
 =?us-ascii?Q?Ov1SxrzEDaCkX/NzDzrHzush/oXPAmSNVMsG3saTJYYpvCbTYz5ncNmfbXSN?=
 =?us-ascii?Q?STwE/YsrnKj4zwLjaMVAQxRTOUWVlmBqjdrfdf4bvUDr8cLE6GnF4+OdkgMZ?=
 =?us-ascii?Q?sBPJT8iqrW0gRuRUhH0bbUwM2Jpu8m8UzcKoLDZpIhfFl/3HU6xkMoKgtVr5?=
 =?us-ascii?Q?ZnxG5u31ZVwKG0pwN5Vm1BRu+vQj+Pc8Pl5mYBHbRLPuOFQtagoNJOi0eaaF?=
 =?us-ascii?Q?EqiGidPct9NMOaZ9x6cSZ7CNfz3uSbFOUhkdDs7DG3/gO+PHFJ5fdARbAf+F?=
 =?us-ascii?Q?vC9P9ZQzh/QkQQTcUM3hM/rRuRnlYxG7dTGzazj5OvD1WuQ306xMo8CG8U5X?=
 =?us-ascii?Q?ppwH3u6h2+YB8jJE4G1b8FPXw/VZLEDlJ+EgVAn4+xj9pDTp9nAX9u1pzfHs?=
 =?us-ascii?Q?D3ny1F2QnCBi4SCdTBf7G07DnXNOHOYukBJw6PI/sypz4QkiHkkf0/oyaAIf?=
 =?us-ascii?Q?YFXvEs+JqPvY8VkdcFELfzHTKGOmlpBiZpnYe2s+C9FpkJMHD58wNoG07Iud?=
 =?us-ascii?Q?bvoDA3BN4A=3D=3D?=
X-Exchange-RoutingPolicyChecked: EJuw9+I6KZgxCdUV6YQkNOsNNPgMfqA2KK9Kejt24LxwMTIeMf6IR7520QhxwgUffDZZtmherQ/U9bUrjtVX5+pMi+uM1wxZcfgcedxViNiDnIPXgNGufLqrJEUuVOz6tE1u4EKQtqm0n1S6eCCMSR+bOKDUnuoVV7HuFatFzkNdoDVjQ0jE6v05VTnokm3fJKSRcPJMH7xj6KUyHN2Ge12NkL4ZYgzZ7S5BabIYwFdg05kieC7uOgqDfdUjgJAe+CMU3+m0pxerKROPFZAa0FNIzlIt8YfTunIwJFGSfgk7zUQIXQIzGWffiGw9M7EYrcSPCxbYAIu840RIMPNR9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b3ec82-7624-462c-f8db-08df11566f3b
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 05:18:28.2053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UecV++FFI/lkePH3krgTfIphxAcheCrll+BrkEnXruOkM6rd6tyzQLPVpAEGlqi/PixS5uO0wFviDKUA1RZgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7542d32487b53ed1a59d02f013a6e6b66804c874
commit: d8fccd9ca5f905533dc6c26cfd1f91beb8691c95 [1/1] arm64: Allow to enable PREEMPT_RT.
:::::: branch date: 3 days ago
:::::: commit date: 2 years ago
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260912/202609121755.OxG6ug0n-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121755.OxG6ug0n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d8fccd9ca5f9 ("arm64: Allow to enable PREEMPT_RT.")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609121755.OxG6ug0n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/spinlock_rt.c: note: in included file:
   kernel/locking/rtmutex.c:1835:17: sparse: sparse: context imbalance in 'rtlock_slowlock_locked' - unexpected unlock
   kernel/locking/spinlock_rt.c:40:9: sparse: sparse: context imbalance in 'rt_spin_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:40:9: sparse: sparse: context imbalance in 'rt_spin_lock_nested' - wrong count at exit
   kernel/locking/spinlock_rt.c:40:9: sparse: sparse: context imbalance in 'rt_spin_lock_nest_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:78:14: sparse: sparse: context imbalance in 'rt_spin_unlock' - unexpected unlock
   kernel/locking/spinlock_rt.c:113:9: sparse: sparse: context imbalance in 'rt_spin_trylock' - wrong count at exit
   kernel/locking/spinlock_rt.c:130:9: sparse: sparse: context imbalance in 'rt_spin_trylock_bh' - wrong count at exit
   kernel/locking/spinlock_rt.c: note: in included file (through arch/arm64/include/asm/lse.h, arch/arm64/include/asm/cmpxchg.h, arch/arm64/include/asm/atomic.h, include/linux/atomic.h, ...):
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:210:9: sparse: sparse: context imbalance in 'rt_read_trylock' - wrong count at exit
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
   kernel/locking/spinlock_rt.c:224:9: sparse: sparse: context imbalance in 'rt_write_trylock' - wrong count at exit
   kernel/locking/spinlock_rt.c: note: in included file:
   kernel/locking/rwbase_rt.c:133:28: sparse: sparse: context imbalance in 'rt_read_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:238:14: sparse: sparse: context imbalance in 'rt_write_lock' - wrong count at exit
   kernel/locking/spinlock_rt.c:249:14: sparse: sparse: context imbalance in 'rt_write_lock_nested' - wrong count at exit
   kernel/locking/spinlock_rt.c:260:14: sparse: sparse: context imbalance in 'rt_read_unlock' - unexpected unlock
   kernel/locking/spinlock_rt.c:269:14: sparse: sparse: context imbalance in 'rt_write_unlock' - unexpected unlock
--
   kernel/locking/rwsem.c: note: in included file:
   kernel/locking/rtmutex.c:1633:17: sparse: sparse: context imbalance in 'rt_mutex_slowlock_block' - unexpected unlock
   kernel/locking/rtmutex.c:1660:9: sparse: sparse: context imbalance in 'rt_mutex_handle_deadlock' - unexpected unlock
   kernel/locking/rwsem.c: note: in included file (through arch/arm64/include/asm/lse.h, arch/arm64/include/asm/cmpxchg.h, arch/arm64/include/asm/atomic.h, include/linux/atomic.h, ...):
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow
>> arch/arm64/include/asm/atomic_lse.h:31:26: sparse: sparse: constant integer operation overflow

vim +31 arch/arm64/include/asm/atomic_lse.h

c09d6a04d17d73 Will Deacon  2015-02-03  28  
78f6f5c994ed22 Mark Rutland 2022-08-17  29  static __always_inline void __lse_atomic_sub(int i, atomic_t *v)
ef53245060989d Mark Rutland 2021-12-10  30  {
ef53245060989d Mark Rutland 2021-12-10 @31  	__lse_atomic_add(-i, v);
ef53245060989d Mark Rutland 2021-12-10  32  }
ef53245060989d Mark Rutland 2021-12-10  33  

:::::: The code at line 31 was first introduced by commit
:::::: ef53245060989d1cbe4b72ba56e94f217f4fd1ee arm64: atomics lse: define SUBs in terms of ADDs

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

