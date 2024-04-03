Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E1F17BC2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712127880; cv=fail; b=Ir6KeYr76YMcvJbA2HFx9WBVs/2XiAeAaIEjDIQhPyjRhCM1dB3OpZucmi+NwwlNTQzF13jImgBRT4I6s4fEEOiWYcCg4spJSmtKdJSCDBBxia9StgFpYLTBKB2Egr7MUhOUET3tMPuwUHpbT9LfG5IWQCgyrr0E8t1w9Iv1tZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712127880; c=relaxed/simple;
	bh=b++JpqWmxIUemTRrtf5P8Oi5k7TK4pZ6tqef7bMVW3Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qtzcLwiD6z5BRx/bA84+1uDLDOxAXDCay56HWWlSqH1H+T95O47Qs+anjsCjpUr+mmOcgaSk1Z/YmZpLLp82JGWzTLszYNd3JfF7XBy8+d/ZizE3l6hGc1eJcWbqn0hHOjc+SrmhDnODwGlVby7V4q2VL6CiiwYwcxO7XxsOu+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIPNRcsz; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIPNRcsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712127878; x=1743663878;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=b++JpqWmxIUemTRrtf5P8Oi5k7TK4pZ6tqef7bMVW3Y=;
  b=HIPNRcszLnaw3cqbTx89YMMr8FE4ZeNiL6WH0CXxtAGwivPqZsyPhTAN
   0ZgNL5oSwXM/bzb4acyBOG/HuEmXjBsdfd164VL40qZ1Tv8Ctp87WxdeJ
   wbzaMnAYgsaSkcjcxfe5ukKcBPgVr/3TeW4KB/w/YxuQEO4IN3zDUfssr
   T4yJCx0Y6u3RElaCnmUDhWB8y6Nu1kLkPEtY23rHKtHS3GjZFNdxtkDMn
   SEcYtd+wpEe3HTo/DHj278Kb1Gt+ZFKCl+EnTmPcMzNvUZfPdXDLfWj+d
   83MGaYC47mL4iQ8004mvJENxdWKd++RiT2KtcaeSbWKJPBAJHjAa6BTj1
   g==;
X-CSE-ConnectionGUID: +DojGmtOTLWf6v8PBbrDIw==
X-CSE-MsgGUID: x7Y6zRWeSlmsGUsN7B8+Mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7464107"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7464107"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 00:04:37 -0700
X-CSE-ConnectionGUID: me4udLsoQ6iuoiRxaFyGnw==
X-CSE-MsgGUID: zCDjs4nsTxywGfWcmMONag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="23039717"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Apr 2024 00:04:38 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 00:04:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 00:04:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 00:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsyrkOkEiu7FL1SOxFQL6cobwEIVrNj1zdZzxSwFqu8VsoEKdrU9mTn9skda9H/qRYQ9aDE2cia5NOLcm9MHbF72XFEdkE8fF6Ui2MNJybix23ve7AAX9FqHcg5wMzIldai3aKHbD81ms1sM+8cd6/7OsNWe04dK7G6E9L9zALA/laGddiQd+NWGVnE/UJ9D4EFwInE4iHys+YrKn4jPBj2K4zu97GiOoSI3V3ZCZDPT4v/wLnnSNVEgo/5GygW/Wq1ZClpxUdxmTQaYKaq/QGc1MZetsZA85TNLVkY5fCvBcW4RVVt0qsnH2oGNhZ16VSfItZFd0lNwAwQ6ntXQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7gFrSP6TmsTx2W9Nb2IO3wLjlhlvOtzmP+Xy/Kqc9c=;
 b=P4Geuk64K4eYOXPaRPLbqQy8+CuSu6mkP2hnC/l9CMPi9nf9GMwLSyM2igSeqdhz4hZ8jkN+ftdshO8793+1xqbJLCKR7P/Hor8ZUorV1Nc6Uo/ehliyWpd0o0Vmij7VU9k3WqMKO/DM7lC1nJhovCIbK6aeGzQgwtfJpQykjHuSuZlSg711GJOumXgEKNH02tRrxL24zBvBvfIsfL579J2+6z+QJP9NOzYL84Su21NyU4A0dVz0+t+f3ebo4cUPT/xKy+wVHGLBF46BfsHZi1rA3RrfO2THyRb8ZinKE9mkavWC35tyTh9VuiQI+DpPmXQBqOHm83o9ErFBc9cazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH8PR11MB6975.namprd11.prod.outlook.com (2603:10b6:510:224::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 07:04:34 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%6]) with mapi id 15.20.7452.017; Wed, 3 Apr 2024
 07:04:34 +0000
Date: Wed, 3 Apr 2024 14:57:54 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2559/3220]
 arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct
 tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from
 integer without a cast
Message-ID: <Zgz98szFLLjTIZSO@yujie-X299>
References: <202404021504.YTP51bL3-lkp@intel.com>
 <55cfb596-8b21-4177-ab4c-0d531fb74c86@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <55cfb596-8b21-4177-ab4c-0d531fb74c86@paulmck-laptop>
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH8PR11MB6975:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: buEWRY1dGXJDxDGCVRi1zH4KKa+2coc4FkAr+R5fyQR3h5n9eacW/bz768wdJrSA7XAi6n0OVxiKT+2wCus1NKUb8F1NwYKGJ8RpEXLDyB+vbctOUJyxW4AWoPpJZ8lb2002XZcT2Zp5afpYLzQENaUuuKs33WIBlnclIBysieTWXKaaYn2gdFcSAEV+C+E5vV4BUCjd8nzQu2Iv48N9vVx5K0//kXGAKvTK7Ir0Urbm4M2khtFdU5+B8Xyrcr7CrnDwTUPw8PATnVj8ewT6ZW/wIED5CLyiMA9lofn6OM11X8fJsf4dwS+td01sBueOQqC6wPNSuTgzVxKuIwRZRpu84wOXz/A3mWGUHsedU3OYzGtyfKD1bdR4gAOSBNkGq2djyai6yd4JMDS5F9kBZbivexzAOQJ7mH7lVxuLhLxd5aKVZrlqJkChKpfyQMGOrgUmpMyNtHdu3Qf5hd5gKBTik4G7OEBDFBK6a4ScJt4NqnmG1eJNTBGIGOLzkM5mTdc0E0RBvxPyF05MoO240hYFb1PPR3fPqe6rBshvT0IdZPfzNzZcVsllVKIW358EHNtfNjBLf4G/W/7cWJsjqY1MbRr5k2Sx/2a7x3hQDApMBJS+YWjTWzy3Xl8j2BW7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NBS7KxZZClmcECH8gy3Bj+eFLRFWFpcHc8Z3lA1StFH4fHFPxMkGVckTnOi5?=
 =?us-ascii?Q?gy9CkV9zhkkCW8ZcPK/88vmC2QbULn7RSXYQk9ibexaEzzbqnSt4LSpasqUc?=
 =?us-ascii?Q?Dt7Va8PnVWG5q20aQ8W8ZETOVnFU5sgOdL9c7Bj77NPRfkjPs9CHLyUyGqPT?=
 =?us-ascii?Q?dcv5bA+dmvIMOU777ZaxOBX8Hoq75pAjP2VnGFf1vVHGNauvGFylS2wJlV2R?=
 =?us-ascii?Q?B1Io0ZipTixLoFccS8xo9c88Ev7UVdpnGNruYlHwNnkveq3w5ctcCFbCefal?=
 =?us-ascii?Q?px7wZyO7RwR9irLoDOcAWHoOMdnZIbxLssRWzSlJcCOjQjX5Ql1NNNqOaSHI?=
 =?us-ascii?Q?+jlWU2gh+Mw30PrYV8FzRzBAolYRyYXEYa8ll5mkRNHT9ZlIT1w/NUgYCzvb?=
 =?us-ascii?Q?Mxb3/0hkVrgtwy7VVCzEKYfe5nr/6CNk5A3FkZscdXjYLbWLBrowJZqBqsZ6?=
 =?us-ascii?Q?Ph1CM6Ln843vqkAYT162tdAGWKyF0vnHNsRF1Lrn4dp1lleBZgCVoJKgbS/2?=
 =?us-ascii?Q?fhqUDn6XQ9v7BvHjD8PO/xbbH+ux/c2Ng42D2sTiZlgTrYfZtVeRl0mxMnva?=
 =?us-ascii?Q?AjCqITz1NQWJXaim4dVCynG4lO0NwMeChJhw/cfrQ1kbSeUE5q4kwppx8hWF?=
 =?us-ascii?Q?1XVAVE/Y5Gz9TIv/qqoOZvpfa1a4SfX3NHVsWDBn1ZbdSDjYMRdFLd4apNNR?=
 =?us-ascii?Q?1D+pailu7gSMI7FNji17i5NlOe3Lhx0Jgv5XsPJdpRJiMJE6ZGR8gjgjJiqg?=
 =?us-ascii?Q?jdTQjoZJwzm+E+/GNwef9Lui+GUDyS4lXkvbEeYREPy5wP5nc2yIocnmW9D8?=
 =?us-ascii?Q?5NOWQPzudeTsM++iWV8N6Wtp7vq3qq+zsXadEZbOz57dg03uxr8RBTikjY2A?=
 =?us-ascii?Q?+XXDBy7T9pUPKOHSibpraA+XkrlYVkUDOH1FCERAGjQ6+99foIWg4CH0XDUM?=
 =?us-ascii?Q?Sqb7dXEpfiUhbXbnDKK1qYVcG4q++25DtsL2JtEXyDKf7ny8D+mQkGecSnfa?=
 =?us-ascii?Q?RuEd3fu6s8Gdhw5OzKqp10qj+yAOsl0Ewy/KNQjvCbVFAQxrByvkMV1My4JB?=
 =?us-ascii?Q?RwS3aAiLvi6GLjB7dNK61uymSIu1bT0miVsVW3bOcYXxfjz7pxEKACOWW2ij?=
 =?us-ascii?Q?UY8g63Uv3ilq+df6BlYQ+Mojs8e2mlxu+o/lHTzKNK7h0Py794e+vgOEm1Tl?=
 =?us-ascii?Q?VFG93pKWc75bh/jBrduzNUzGUiZMI2K5SUvdmU3D61dAmqmCIeGKa+jpsFId?=
 =?us-ascii?Q?P8ifraNFNV8J7KX5FZW7jGQalg9y9LlpZp40DyLrLHke7SY9yvJsl04qTJnq?=
 =?us-ascii?Q?EUPGKIPYAydt800hInNm+eevqHeVupXyhjFwnQB95iJkQTuFWhYEcp5/wCgj?=
 =?us-ascii?Q?AS51R/9ZW/ZKwaohpHfrkUch6JjRUfcsqSGJSk0kQvnRs1CW+3Mro25CjcXj?=
 =?us-ascii?Q?UR6S33EG0Hzbx9hTcAGvhBgGbqGX+NDADQDV5X3MP6auYQIZhIM6d1OY93WH?=
 =?us-ascii?Q?IJcojEJgVsGrzQU3mK/xd1SufPQUeM9G5B6h3vz8dkBbsoznwCS0O2xxyfKM?=
 =?us-ascii?Q?G8vYoFlqn3//qNYV0/y73XQWgGAV1hJpo0H7Z3//?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f5358f-540f-4fba-f81f-08dc53ac50dd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 07:04:33.9820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpObZ4uzKRXtF6fe/KlPJCxNqxflk1o9VbrQfyTVtSBMXGYgvkdvPSIyvcOLG5o3WCtOOF/RtW4qYGhbpTJcrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6975
X-OriginatorOrg: intel.com

Hi Paul,

On Tue, Apr 02, 2024 at 10:20:59AM -0700, Paul E. McKenney wrote:
> On Tue, Apr 02, 2024 at 03:08:07PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   c0b832517f627ead3388c6f0c74e8ac10ad5774b
> > commit: df35ee400e06b23ecd44fdb66451a5343932f834 [2559/3220] riscv: Emulate one-byte and two-byte cmpxchg
> > config: riscv-randconfig-r061-20240402 (https://download.01.org/0day-ci/archive/20240402/202404021504.YTP51bL3-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021504.YTP51bL3-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202404021504.YTP51bL3-lkp@intel.com/
> 
> One fix leads to another.  ;-)
> 
> Does the patch at the end of this email clear things up?

Please kindly see the inline comments.

> 
> 							Thanx, Paul
> 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from arch/riscv/include/asm/atomic.h:19,
> >                     from include/linux/atomic.h:7,
> >                     from include/linux/cpumask.h:14,
> >                     from include/linux/smp.h:13,
> >                     from include/linux/lockdep.h:14,
> >                     from include/linux/spinlock.h:63,
> >                     from include/linux/mmzone.h:8,
> >                     from include/linux/gfp.h:7,
> >                     from include/linux/slab.h:16,
> >                     from drivers/accessibility/speakup/selection.c:2:
> >    drivers/accessibility/speakup/selection.c: In function 'speakup_set_selection':
> >    arch/riscv/include/asm/cmpxchg.h:329:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
> >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> >          |                                                              ^~~~~
> >          |                                                              |
> >          |                                                              struct tty_struct *

This warning is fixed after adding uintptr_t cast for __old and __new.

> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    In file included from arch/riscv/include/asm/cmpxchg.h:12:
> >    include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> >       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> >          |                                          ~~~~~~~~~~^~~
> >    arch/riscv/include/asm/cmpxchg.h:329:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
> >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> >          |                                                                     ^~~~~
> >          |                                                                     |
> >          |                                                                     struct tty_struct *

So is this one.

> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> >       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> >          |                                                         ~~~~~~~~~~^~~
> > >> arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
> >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> >          |                       ^

This warning still exists.

Seems it needs another cast like below to fix this warning:

   __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new);

> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    arch/riscv/include/asm/cmpxchg.h:333:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
> >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >          |                                                                ^~~~~
> >          |                                                                |
> >          |                                                                struct tty_struct *
> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> >       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
> >          |                                            ~~~~~~~~~~^~~
> >    arch/riscv/include/asm/cmpxchg.h:333:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
> >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >          |                                                                       ^~~~~
> >          |                                                                       |
> >          |                                                                       struct tty_struct *
> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> >       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
> >          |                                                           ~~~~~~~~~~^~~
> >    arch/riscv/include/asm/cmpxchg.h:333:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
> >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >          |                       ^
> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    drivers/accessibility/speakup/selection.c: In function 'speakup_paste_selection':
> >    arch/riscv/include/asm/cmpxchg.h:329:62: warning: passing argument 2 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
> >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> >          |                                                              ^~~~~
> >          |                                                              |
> >          |                                                              struct tty_struct *
> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    include/linux/cmpxchg-emu.h:13:52: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> >       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> >          |                                          ~~~~~~~~~~^~~
> >    arch/riscv/include/asm/cmpxchg.h:329:69: warning: passing argument 3 of 'cmpxchg_emu_u8' makes integer from pointer without a cast [-Wint-conversion]
> >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> >          |                                                                     ^~~~~
> >          |                                                                     |
> >          |                                                                     struct tty_struct *
> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    include/linux/cmpxchg-emu.h:13:67: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> >       13 | uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> >          |                                                         ~~~~~~~~~~^~~
> > >> arch/riscv/include/asm/cmpxchg.h:329:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
> >      329 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> >          |                       ^
> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    arch/riscv/include/asm/cmpxchg.h:333:64: warning: passing argument 2 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
> >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >          |                                                                ^~~~~
> >          |                                                                |
> >          |                                                                struct tty_struct *
> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    include/linux/cmpxchg-emu.h:14:54: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> >       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
> >          |                                            ~~~~~~~~~~^~~
> >    arch/riscv/include/asm/cmpxchg.h:333:71: warning: passing argument 3 of 'cmpxchg_emu_u16' makes integer from pointer without a cast [-Wint-conversion]
> >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >          |                                                                       ^~~~~
> >          |                                                                       |
> >          |                                                                       struct tty_struct *
> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    include/linux/cmpxchg-emu.h:14:69: note: expected 'uintptr_t' {aka 'long unsigned int'} but argument is of type 'struct tty_struct *'
> >       14 | uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);
> >          |                                                           ~~~~~~~~~~^~~
> >    arch/riscv/include/asm/cmpxchg.h:333:23: warning: assignment to 'struct tty_struct *' from 'uintptr_t' {aka 'long unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
> >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >          |                       ^
> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:124:13: note: in expansion of macro 'cmpxchg'
> >      124 |         if (cmpxchg(&speakup_paste_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    drivers/accessibility/speakup/selection.c: In function 'speakup_set_selection':
> >    arch/riscv/include/asm/cmpxchg.h:333:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
> >      333 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >          |                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here is a fallthrough warning. Looks like a copy-paste typo. The "break"
line and the "__ret = ..." line need to be swapped.

> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> >    arch/riscv/include/asm/cmpxchg.h:334:9: note: here
> >      334 |         case 4:                                                         \
> >          |         ^~~~
> >    arch/riscv/include/asm/cmpxchg.h:368:30: note: in expansion of macro '__cmpxchg'
> >      368 |         (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
> >          |                              ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-instrumented.h:4788:9: note: in expansion of macro 'raw_cmpxchg'
> >     4788 |         raw_cmpxchg(__ai_ptr, __VA_ARGS__); \
> >          |         ^~~~~~~~~~~
> >    drivers/accessibility/speakup/selection.c:71:13: note: in expansion of macro 'cmpxchg'
> >       71 |         if (cmpxchg(&speakup_sel_work.tty, NULL, tty)) {
> >          |             ^~~~~~~
> > 
> > 
> > vim +329 arch/riscv/include/asm/cmpxchg.h
> > 
> >    319	
> >    320	#define __cmpxchg(ptr, old, new, size)					\
> >    321	({									\
> >    322		__typeof__(ptr) __ptr = (ptr);					\
> >    323		__typeof__(*(ptr)) __old = (old);				\
> >    324		__typeof__(*(ptr)) __new = (new);				\
> >    325		__typeof__(*(ptr)) __ret;					\
> >    326		register unsigned int __rc;					\
> >    327		switch (size) {							\
> >    328		case 1:								\
> >  > 329			__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> >    330			break;							\
> >    331		case 2:								\
> >    332			break;							\
> >    333			__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \

Seems "break" is supposed to come after the assignment of __ret.

> >    334		case 4:								\
> >    335			__asm__ __volatile__ (					\
> >    336				"0:	lr.w %0, %2\n"				\
> >    337				"	bne  %0, %z3, 1f\n"			\
> >    338				"	sc.w.rl %1, %z4, %2\n"			\
> >    339				"	bnez %1, 0b\n"				\
> >    340				RISCV_FULL_BARRIER				\
> >    341				"1:\n"						\
> >    342				: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
> >    343				: "rJ" ((long)__old), "rJ" (__new)		\
> >    344				: "memory");					\
> >    345			break;							\
> >    346		case 8:								\
> >    347			__asm__ __volatile__ (					\
> >    348				"0:	lr.d %0, %2\n"				\
> >    349				"	bne %0, %z3, 1f\n"			\
> >    350				"	sc.d.rl %1, %z4, %2\n"			\
> >    351				"	bnez %1, 0b\n"				\
> >    352				RISCV_FULL_BARRIER				\
> >    353				"1:\n"						\
> >    354				: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
> >    355				: "rJ" (__old), "rJ" (__new)			\
> >    356				: "memory");					\
> >    357			break;							\
> >    358		default:							\
> >    359			BUILD_BUG();						\
> >    360		}								\
> >    361		__ret;								\
> >    362	})
> >    363	
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> ------------------------------------------------------------------------
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index a5b377481785c..fb1ac86ac2bf6 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -172,11 +172,11 @@
>  	register unsigned int __rc;					\
>  	switch (size) {							\
>  	case 1:								\
> -		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;							\
>  	case 2:								\
>  		break;							\
> -		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  	case 4:								\
>  		__asm__ __volatile__ (					\
>  			"0:	lr.w %0, %2\n"				\

I drafted an extended fix patch as below. Could you help review? Not
sure if similar fixes should also be applied to the patches for other
architectures in the series?

Thanks,
Yujie

-------------------------------------------------------------------------

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index a5b377481785c..4d5c281b1aced 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -172,11 +172,11 @@
        register unsigned int __rc;                                     \
        switch (size) {                                                 \
        case 1:                                                         \
-               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                                  \
        case 2:                                                         \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                                  \
-               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
        case 4:                                                         \
                __asm__ __volatile__ (                                  \
                        "0:     lr.w %0, %2\n"                          \
@@ -222,11 +222,11 @@
        register unsigned int __rc;                                     \
        switch (size) {                                                 \
        case 1:                                                         \
-               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                                  \
        case 2:                                                         \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                                  \
-               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
        case 4:                                                         \
                __asm__ __volatile__ (                                  \
                        "0:     lr.w %0, %2\n"                          \
@@ -274,11 +274,11 @@
        register unsigned int __rc;                                     \
        switch (size) {                                                 \
        case 1:                                                         \
-               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                                  \
        case 2:                                                         \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                                  \
-               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
        case 4:                                                         \
                __asm__ __volatile__ (                                  \
                        RISCV_RELEASE_BARRIER                           \
@@ -326,11 +326,11 @@
        register unsigned int __rc;                                     \
        switch (size) {                                                 \
        case 1:                                                         \
-               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                                  \
        case 2:                                                         \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                                  \
-               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
        case 4:                                                         \
                __asm__ __volatile__ (                                  \
                        "0:     lr.w %0, %2\n"                          \

