Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7893C192D67
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724685467; cv=fail; b=XLvQmB05qVlcXu7ow/wNVfFAgjCY8gav3aKwLt8sFjJ4ddbHdyI85NSpJ8VCwaN4tYnrpEN3nqEMt9rBH6vwwRCL2SJLHXL7n8kSml8IJ884B+QmUfhyAXTsVpzhnKCdzdcf/dSYgNRjAF71eq7I/fxfpKXNTZaInwO/vqhTmlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724685467; c=relaxed/simple;
	bh=99E+JfzEaDdahwmpXn02VPo9pbiaqHTCIeDZYyV7L9Y=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tdh8eGfD8i3Xcsb6LS/+FIweZQd/iAU2TM1tGIOYxe8VNtda6hN5KUN/L0/tv5H3LkJVVN0nKEpveVjPoaYscCXqbm3iDVMFLa+S8Stu8d/Hvevh7wE+w+YHjFoMBVXSSD+ywOfBDM66AtrQvuPScQFzYNC2xHiwLUrNDhLJlPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWf5YkoE; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWf5YkoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724685465; x=1756221465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99E+JfzEaDdahwmpXn02VPo9pbiaqHTCIeDZYyV7L9Y=;
  b=jWf5YkoELPc6/q2rTUMbViO1xJNkgFSjY0Xr3x48E20geicbuRxbB8kj
   76GlvUfjX/jOBvyFsqOF0Rtw9OGiyYjh440KoSpA6sY7n16wu1GjC8b0Z
   BJ/X+i1Jbl9LeQiqAniJlfEh0hLDIqgJiH2qDc1In4Q4N0U/lFi1D8aIj
   v87s+sdl5ALlBiBG7FpLaEXJTuW2vH5gMk8r+wF2cP6svx8y8j7nu0iV0
   n/TONiCJD2jRUsR1VDg0sZMvjPOOIZywyNuKHTOeOF611a7O+oHlrNGue
   w/Yc0WcaTT54oHWsc7tW+P0Uv33kTDzVXq0YMmftiPkDIAeUoilTqGDlj
   g==;
X-CSE-ConnectionGUID: ylPutpUgTrmFSjccFD8xdw==
X-CSE-MsgGUID: iUofB4vZRF+LtYfJQkE9Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23002879"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="23002879"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 08:17:44 -0700
X-CSE-ConnectionGUID: xKrEkB4PRxSa9hAXfO8/Nw==
X-CSE-MsgGUID: DMVhlFEPSUqQzahBjQjLnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62700711"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Aug 2024 08:17:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 08:17:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 08:17:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 08:17:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMOWDNrvZSz+sq+4p7MeHrwESvOADd4Xq09xtM6qv/q9h8cMmvDOFX9czMdV5LEHUT3suREBs1ztvNbrTH2tFP3tC/IMfJCYYSYLzPWgiw5EMfJXGSwQ1Ebwbss5c8NdKiClWGjakH1sVxw5uUAIgJp+HErSw7tzDZC9XVCGI+outZOyA5/7RumbB0306guCC5/Au1BQHWvlcAlmt2JqhxYnBYQJY/qPLQrCq9L9djGOkxsf7/D+4M3KVTJf9ywJ9I/O4M2FTItbFhpAiDgBOpS2BGDEmHwiDvDYmjWamSNKxf6eKQzniN6wl5KZJ1EHoAuHEP6uFfUZmF06ouNj7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjWQTWPyqHCLe3xGBU5JadZ/PvoqJ5/MavNDsLIRhHA=;
 b=prQAGjNAJmhkSAk0YMqcXbAVUlgQO4nN95b6d+0YKYUdW0gmjCy8MSs6QElBrE6MUEiIY1GxUNI0L37EXJ0xDz8miA4AU3pR2XkbKooPG9onU3svzB0y3EaxsAJb9GvqcNB/+8omgf5JVb7vuBMNlqtNpAD07uZvehbunY1DSJ0Ajy0N9o2nZdwGlXasrbE0RTnkfbSXTcsoinY07Dh4JIY9MPIe3wBRi8FDcsS4OyfJSdSjGqWGshhRbEjOBrhk0PvsGebFNyiqc9yzboBjLEPQX6QnRj5mZqLMoqk71OF85k7WnwojGKC/Hil6HQeVk3VXN82Mct5gMHinCSM09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA1PR11MB8223.namprd11.prod.outlook.com (2603:10b6:208:450::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 15:17:40 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 15:17:40 +0000
Date: Mon, 26 Aug 2024 23:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [isilence:zcrx/next 28/33] io_uring/zcrx.c: linux/skbuff_ref.h is
 included more than once.
Message-ID: <ZsycjNEIJb3a2aon@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA1PR11MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0038bb-f362-47a2-5ef8-08dcc5e239a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Il94EUcuOfFCZfQiLlIiriW5Tn3yg8pes8bNBfUA+nRGR30f4ZaIPTqzvMLt?=
 =?us-ascii?Q?6YCns9gzvlzmn42LVjy1YsayIxm8bqzTEWHGwWNMk/fJaDdlKlVXU6LL9NSP?=
 =?us-ascii?Q?FzkCzOd5qVQKF7JYZGCKr0XP6ZGTDBJIUnG0O6hcSpPHETr3Qy7PFFjXdNmo?=
 =?us-ascii?Q?f7fRyamFLSr6Ih+his8Y6KIPw2j5uD+d3b1F6Kj398ZP70746vMCDsmg0gXn?=
 =?us-ascii?Q?/L6FsC4cEif8EDC5JH+9LD7P0qMRF76/rkqj1In+Cr0PRG5VW0qVqDmQy8dG?=
 =?us-ascii?Q?seQrJGrk6PETN81V3SQovR5dW87Xqxe0VyXvPqVppfbbt7OojoKK4YNwCalp?=
 =?us-ascii?Q?QArepGKnUp5mZzZgJK+EaC2p/leQlQNLJdIDvN+waLuAHGjIRyF2M8HVPTOG?=
 =?us-ascii?Q?LZQj7LSBhloJXXGF8FZmwydY/LwbKp4IpVO2sLxlVpM8a4B2z03Ihair7hyg?=
 =?us-ascii?Q?ZKc0oThnJ3ReTwyBbBGencFbe1Vkp1OmpfJp7cnG2GDr2/e5OLIerVnBQwfJ?=
 =?us-ascii?Q?Kxs+0nk0aRZrdIgnc4Zv76T2/qzriuAJIkDFdYzCyrTiKJ4hDyraaixyBjcj?=
 =?us-ascii?Q?HiSDyuBjreBA9e2mHrI6uVH7Hz5Vj8LpVbJ9gKBJ7UUIxleB2J6Ugu3mq+R+?=
 =?us-ascii?Q?jDkEdGxrEtex7ZXdMdxmaI+bNGZYeMIcON+aCqOpODA/3e1gjI6pcgbsluot?=
 =?us-ascii?Q?t+fujEM+Qf5kn6cf0KdLhnhSnwVJtbnf0xpmargHhVe+SegunqgB4rvaKRSP?=
 =?us-ascii?Q?tYid+O0t2H85uy8sCaaHymlTayY5Uliwrsh39YGDW7FvSecaCrBTiSxULf1s?=
 =?us-ascii?Q?1miudab+R3VffH0NV3rPKLylZ0HnFCDGC9+zMEZzDIM7gjtK+1q5Y5zzss/r?=
 =?us-ascii?Q?4swJpKfTRn05UzEXxl2RVFdRZJn7cyErM3IVk44ixRiG91xaMtLqdJCEVMCy?=
 =?us-ascii?Q?HOP/Ym+UR6JOYBfSdAxPYC1P3d3C8+YMKc5cAEwVwbD2BGy5G/1pWR8H950h?=
 =?us-ascii?Q?7GkIvgmYEe04l/asihCJnx0vH+KhMkbc/KpqJu+/lsYzfH00cLSxboscrEXW?=
 =?us-ascii?Q?FuB78WAUpevSdH9WQcDYyIgHLPYBHIV2yNe3IWiLcf+8PAsmbiBDH4xTJF0C?=
 =?us-ascii?Q?V9VAaesysgVYWTHmJbzQeUEiZyFe1fhpmZylUdX5KaqlyJaVXrl+S9nselA+?=
 =?us-ascii?Q?Tmxc3k7uSGdw7amvb9Az5PkRNmv2cAEwa4yO0VNiwgM06YkMF0ZFqxwSm5AH?=
 =?us-ascii?Q?vHb+Cr0AFI1HYvOn8L2RGK5Z+BSuKAVu3c5rbLUbPExIa8fmVpzkRY+ANFRM?=
 =?us-ascii?Q?+cg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K/QPA3bfStFzETP9vEYKIEGacNXDaSBFnhxnFSb2byAcMIWpOYNa9+Y0fe4f?=
 =?us-ascii?Q?+/bTklpTnqC8QtiBjUNnUv97+xvV7fXBm7+dLGpS7OWza7yMnk0mvjhXbRQa?=
 =?us-ascii?Q?0t7Fy5w5Kg/h64x0KKZFLso/YuKa7x7zh185dgPfPzh5rkl7vMorzc4/zM2b?=
 =?us-ascii?Q?CUWYo+Rglti3NPBdfNZId4Oes4O+NJQBNndPYG1P1P5EA48wVe9WWjc9Yro+?=
 =?us-ascii?Q?yOerv8ZcikBSjf35V2uTNkcTlNOFABXqqE8Y3ubH6SkMFcTeDYEHFnMwgPpQ?=
 =?us-ascii?Q?/UESmqe7pSEmYrpKg9ov9+rNo+YwHKQjVQA3qah2lA7iG9o3UQOt+LpPRwiX?=
 =?us-ascii?Q?fMxwxctGaml4j8MBQ677X7tCFF4tpzUgfJK5CITjwEqpWp1KAUp8SkTxfeL6?=
 =?us-ascii?Q?HTaV1uDT7OHQZhl30/yIesH/LriIExbUeokklKfgPFxCqfuEEwzeeaat9XaU?=
 =?us-ascii?Q?RsV5a5owNaHkSvzNFR+GCcZdq0htFbrsmhvYoO9/lJLyz+veEy/YM35Zh49c?=
 =?us-ascii?Q?W1O+Rho2LikebZRsK6Uit8HM5EudNi/DF8Ub8TerK1jEQiiSRsSo4gX/R/zp?=
 =?us-ascii?Q?V9nEfAxAzWZj50oIkoa7i7oL/wNVM/905FRz8fpVkb3XbMGy0B6z3KSlTxKV?=
 =?us-ascii?Q?ajWI4+hHNpRdUmJxl0kKWFNYjn19CNhNkk7/FIPdLh828J6zB6YylcLynsGq?=
 =?us-ascii?Q?IUnKvsK1b2FnMkCRqye/USHczzu0Xm7J0MbaoK2gYnLjsoLr5fcYkLoKYe5O?=
 =?us-ascii?Q?3AnQ7Xz31tje6odULTZy68omkT/snP8BFQxO/PKLAoKI5HP/qKN8w6I4OjgQ?=
 =?us-ascii?Q?yIkH4pqkVjR22j95emvLaA1MPxMjBmmNVH0uOaii+nUL0bW1UhVv6Gxvz72P?=
 =?us-ascii?Q?eUHtQL95cUOVfRtEpDDmaSdMDEwp4K8uhFPRsyPadeOX+4FFGDjaHlu+roW5?=
 =?us-ascii?Q?PpnJKePKXXdjiTX+ekWeBelDeyYB1sAbjRBNnriJKtkfq4O5JjRFfEoxllm1?=
 =?us-ascii?Q?AvV4wOjsGC9o5+Cvp+lZ2pbJKbRMJJOM/tKD7trIF4Gn3pUnZOx5xGf9RWwC?=
 =?us-ascii?Q?04qecRGfQQPifrIShJ/Dx5pqcesXXsoq8l65U4GfLsCBMTc9uL6NCth5wDsw?=
 =?us-ascii?Q?oyd6PFZf6TnNn3PaOwsJZQOPRqCyrXiA1pXYyJJTEJP7WuYvVl1nXYhAbHjR?=
 =?us-ascii?Q?y/vhzIFhOhPUl2zpnmPG2QKvYb/GTSsFJpioNV3aBcxPyR2Pf1gkorhscLSD?=
 =?us-ascii?Q?3UuPPv28/NYinUxbkLlQtnPdxs2e56YNQrAac8dIjbGLzd2S1o7bk8RkPwBz?=
 =?us-ascii?Q?slnihAZSYmmrBN6jDD2YB15yXgODCYskiE+iaccDrdv3Jwwu9EGEHBlzemX8?=
 =?us-ascii?Q?soS9U2OSAHh2h/3evoZfu3gw6fYMznnDE99TRytcH/ffbS1qzn72lZN+5oAt?=
 =?us-ascii?Q?FX54SC9cMo5sglRqBKP5kVWl4O2hEyXmrS2g8UcftVmjDduTe2BYV1sAHVr6?=
 =?us-ascii?Q?iTQnnFhZGXVKgYImWl0RSKqh6n91KM8ij9gZgI0iC7bmHE4CK5ksn+nOtFUT?=
 =?us-ascii?Q?RU/DcAUgeoEta/wFxwBaSaFMzrPYKXEoRBz9elpUOWLwMDSEO3wyMgHswwDW?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0038bb-f362-47a2-5ef8-08dcc5e239a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 15:17:40.4025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bThYGQxc2v5tOt8i+rdM3E5YLM3hGxi7nrAQOmya3BB9LnxX6Ifyz1jMhTvQf99FkX/V3ND4shI4/jcBT8A9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8223
X-OriginatorOrg: intel.com

tree:   https://github.com/isilence/linux zcrx/next
head:   773c9084da07208b3562aaaa2253288cde569c8a
commit: 9c54a5b0b91b9441e14e18af2cde93830b87a3a8 [28/33] io_uring/zcrx: setup ZC for an Rx queue when registering an ifq
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408262156.PMUbu4mD-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> io_uring/zcrx.c: linux/skbuff_ref.h is included more than once.

vim +8 io_uring/zcrx.c

   > 8	#include <linux/skbuff_ref.h>
     9	#include <linux/io_uring/net.h>
    10	#include <net/netdev_rx_queue.h>
    11	#include <net/busy_poll.h>
    12	#include <net/tcp.h>
    13	#include <net/rps.h>
    14	#include <net/page_pool/helpers.h>
    15	
    16	#include <trace/events/page_pool.h>
  > 17	#include <linux/skbuff_ref.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

