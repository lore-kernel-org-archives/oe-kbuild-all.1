Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293637EC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709385252; cv=fail; b=UInUEhV4KZuPiGIsYd1jICT3ZXnLXJiNj0o9qHzpLyPJ8X6wCQogGp5/vlXTeR4nrDvpgZ7gH+dDydwYimGBK2yJrfSqO1gyIoHa2oUm32UbR97IuXZOYi2LjBii2zFQUSXNfNFzuxiuOpOxUDGHFU9zCVjrH75fpKB6l6UE2rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709385252; c=relaxed/simple;
	bh=vjJat66o0YOE62PckDqcnvPjP16yQYcegqjY2jXdNn8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RvgJx+lHOkrBdCewCOetOBQQM2vJVwMe5CvrD+vEg6rWvjdbl8rtQqjZUc7e3g0q2dXXaPrcZ5n5wWruWFP8tMLKoBQhjNzSvq6co18GgS5Js1IPPq44TjeWyStoi68uguFjU78tGml+G+oaGBOVvGWxjL/OUziQUbAWh9CJ9ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+DUmhYq; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+DUmhYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709385250; x=1740921250;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vjJat66o0YOE62PckDqcnvPjP16yQYcegqjY2jXdNn8=;
  b=l+DUmhYqU1dxlHAlV31CqCyPiCDz9+dRKFNwrcyE1SVZafWHfjc0sdJp
   Ch79C/T15ZoHO9i9H5l2x4jsc/1EfFKUIY+4jZk3NN/BI++ANKJcYnUyY
   UCDmfJJb53P0bjPe1LKYY5avNxWNBUWLxHyKGxhQZxceI8gm5awFk42no
   yNnOOU4ExuVy149QTomgbRos5Ec4+iOCoBBa1En3rYnH0Y5lnwin/Ie+r
   ARexo1linmdYc5hdv0Bm4iOFFCJ5a30U9M3uOY8ds5FVFUSynuB+xxMM5
   rg/fEuZLZLJdi4bxVbqvQQOoymw/DMXWKERZjdEPYKT6cWYQ6yH1CqYHc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3777913"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="3777913"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 05:14:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="13188979"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Mar 2024 05:14:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 2 Mar 2024 05:14:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 2 Mar 2024 05:14:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 2 Mar 2024 05:14:08 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 2 Mar 2024 05:14:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6j3SGjDYB0D2C085QG6Zh0UKxeAT0WjEIl5hfdXKedNx1w5kyy1C1cS75pWjTJ0345kGikKk/5GqEC0C2bEEyp6Op22OxV3KbkxJfeH1CDZIFLRAsZDEFSOP76l5yWMAe13TF8iJFk3MGa9a/kNPsvBMwVkt74OXGsSYEp54CMopYtLK3hYLTltxvxb0wfksO66h+Cilo5q8L2hj/UvGFAxZPNiXLpy9d+LoRWiLbJXTir7PK7MSdsmOHT5nDSvn3P6QwhwgEvenwtFudQ84IXxFTyNsDczsyVyBAlAcPNDz21QruUXCDvP9fMIclw19HYd/WA4L7j5RD3dsi5QjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GotvNV5XEABigcwZbJN4nTRzvA0PIjjcBg2MY6wambA=;
 b=GkkrerjeubOWXZESnz5n13YOJnkHmnn4tevs2l0+yvJmH2d0wA2m3jD1hYHorz+wK5VhA96YQgytZWzxfo59Bcnx9WiUWp5iN3JH34xChT1JGrKvTM8BQNq6OeaJkvSN+AcpCeYpFtk0rwSSVTfk3oCdPHHCuDZ8sT0PQQWFR1Y8TFakLPLi0UBWC/8t7qjwalTvnKXXdoihLsk0GSjH6etmgV2K7gCLGz7DHlRkxtPIyWwecFGjVZNsfQGgl92J+87ztxm78UVJM5qxwFMFQQF0Gw9uh6LFUAtRY2lXMs7PzThGAk1tW8jD7TiZUQK7Yr8l2FU6x4Ipw7hGmpiltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY8PR11MB7242.namprd11.prod.outlook.com (2603:10b6:930:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Sat, 2 Mar
 2024 13:14:06 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%5]) with mapi id 15.20.7362.015; Sat, 2 Mar 2024
 13:14:06 +0000
Date: Sat, 2 Mar 2024 21:07:17 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: kernel test robot <lkp@intel.com>
CC: <cros-kernel-buildreports@googlegroups.com>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [android-common:android14-6.1 1338/19018]
 kernel/sched/core.c:190:22: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <ZeMkhRYTvz9H6c4H@yujie-X299>
References: <202403021241.WnfpzlvR-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202403021241.WnfpzlvR-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0197.apcprd04.prod.outlook.com
 (2603:1096:4:14::35) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CY8PR11MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c0d62a-3c89-466e-5d5c-08dc3abaa355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NLhsOeHpZ5YFASBSdjVpKNHQQcLAc/RN2q0ZKA2AOFEyWljd64Y6o7XWr3CaZcCe9jw1i28+3hon9sMV56CnGW5t5knowWOGI2sFKlF9+MgZTjEQmaf0Te4nieUEAmyE0IVX3MU/cjGgUVmlnktXQuuLmZOHtrjiJjgxNNhW9OS8bFuZOLg82TrW6BGWkhMVv1UrQ9P/EAhqMsQxFMq06EdkztdSFE11ezLiLOrOmf2DB8elVI7WHhxdX0QNOK0buB6cMNteellUZynp/7fm4WQg5El8uqjXPCildc3sBlGtS99uY0g0qz4wirVNmSBwTDM6mWJQhgsVXdfpmPPzIw9sHdWMFhYGP0UI/3dn4UK8IygHqhdxaaAiimxdOqUVtOahm51W2hNezwEUgU/3XdcMYP+xYuNkm1x/LqWnBihgBzNhSZMRbm2Ygl2d7JXdAPoDAtx+yoqWRulhU/DAzVXjOdXKdLHazlGx0j1ngEMr06DuJs5v3Qos1ruxEwysaRKgvP0uQJLqDfc18KdNSR2skFy1b3dAmZwfP9HNsmE0emz0iCFBf+Q0g4OdW4LdwB/Ki3nYBBD4Mtufsgka5En1o/28eaTLBj1mo8zG+JC/58YX9eEcyGbGZqlVsj1t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JMP/6PO2MknLuW9erl/zlqtXdjqTtMZFhTaOYht0McZCS6QGEPAIq/B2ll8P?=
 =?us-ascii?Q?ZS3Sx9tLTpNjH4NLNvQKXncIVu6Z75b858KUilZhy3qT+bXcXscwOEKdYL5c?=
 =?us-ascii?Q?ice4XODCXn92TNQR3Z6EE8Et9UxbouzEY+zPCGrqHMtIOTvjwjT+9cALq2JV?=
 =?us-ascii?Q?u0bdNU7B8rCDjFJhqiplQyttJ3N04oK8WJ3nsv3sLUaqX4A8tTegDCDmVAr0?=
 =?us-ascii?Q?Z4qcMeq3UzXjjjjsIuPY07C+aZFlgJKCTIsQkSQ5jaPNW8gYSRXwH7wwzKi0?=
 =?us-ascii?Q?Q+h01QbGgtPzv9lPVpFgWcY37WJdcyjG0u0mhsw/Fb012L5JzK/iAT8pDKJ2?=
 =?us-ascii?Q?0RPR+ykwJ8NWTa3ImbawPhlSPip2okAAuOQCreLvy9p5e8+nEH0dMzusGEM9?=
 =?us-ascii?Q?0K2rTzJBbWdJl1qrb5/u8Y3j9Ftwpm9DXqWCNs4ttiNmpQ5AWKsyWOG5Yxyv?=
 =?us-ascii?Q?Vuk6RH1qamaPylhd0EF07xNi2LYF8GTaad3kfPoKfWNA3XRWti47hZ9tXNoL?=
 =?us-ascii?Q?PDwUQCQIGvWybhCSqg91bUDIXQwBNwf88zlnNdn10DnXN0ePmez5Q3phDYMo?=
 =?us-ascii?Q?7dOd8tm1Ub8htEjZRdMkekVGieYnrpqPPVVzh6kH3c/JF0nzLwFuVz/cfzUT?=
 =?us-ascii?Q?Hl9gx7xLIu+yVp+TaeLNL67PPAaxxdeJUtxQY2BGU9CzlXfXtp0Ma32YMc9s?=
 =?us-ascii?Q?nJZK/P02mq6sSprCsDEiTVEGykBjegDWRL0qmFJ+v11NaXp0ztdn6AeNAMZS?=
 =?us-ascii?Q?NBPqS2YLtanruA9T3PfbtZ62ZK43+2TBLpUyWybcauvt20om3IAXfuj4A/hL?=
 =?us-ascii?Q?6Ekwo3F7xxBO/2lWvbKnFcytBye7Eoauk39PUpsOZbt4DGkuy5GNgL6snvdf?=
 =?us-ascii?Q?oOYogY9y9D//OMqbYyqaWsmE2GRVKSgeZ5ysARrbuOP7PvmD6DVsudxSJH9l?=
 =?us-ascii?Q?of5K17vR3dpfkNRhXIySP7ePyqw1iXGL/bZpQtCyFR7C0ynJv7w3H/M5tOtd?=
 =?us-ascii?Q?hne+zesok291gEBa2799+tc1ufEVPqKbPxlEfHd4cR/0Qv3sxckzIyGcxDNT?=
 =?us-ascii?Q?h5tLmbjJfWKf3yfJ1VVVU+2kBwnreYa4vqQlQvNfg4BhVyGedhQo5ykRXsC1?=
 =?us-ascii?Q?lVMw8H5xlBX2yGh2TAadNUsN4flAg3/eeasuWKk1vh4DUCJqau+If2bjhvAe?=
 =?us-ascii?Q?bIelmOBTApCEaiL+4x5cIloebzZbwMrb/0999I947tIi3TPW72KYz6RMH1VX?=
 =?us-ascii?Q?q9rK3F3nFPvd53mScfgttGIVj7jzoWkg/JVYN5Brj+Oxao9AWpLEmN0bObLK?=
 =?us-ascii?Q?ZW9L1VstuoKRsvJ/4og12Eu24+GLJkhGHuy0gVhxNSuHpHz55y9sN7Y4WMoe?=
 =?us-ascii?Q?O1IufcIaOBySXp9em7OBW0EXczjm2NtxDs44/7FRpbHdfls6lIAymYi0mTgu?=
 =?us-ascii?Q?BwW0IjTI30rnArvgY2L1lpkNCCc47o4c8MGG7CdpnivrgeEDQaCkqkzEQo6o?=
 =?us-ascii?Q?p40weeu+OOZxNbPKrUd7Mttafvo8VfqJyvFaNaUEE4WIeTnX1qzLK4Rk3dHd?=
 =?us-ascii?Q?BL6RR64na9r53qkxBJdty+UAqnJfqatQgDPlKA1i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c0d62a-3c89-466e-5d5c-08dc3abaa355
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2024 13:14:06.1136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syccdDYJ+4zl8xGvJqbxQAbsWdZPk25TjQVkrI91e42iCgv4wQN0i9PvkrVS00wzRMpf5ZQ6eXhM2C3PhM108w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7242
X-OriginatorOrg: intel.com

On Sat, Mar 02, 2024 at 12:28:55PM +0800, kernel test robot wrote:
> tree:   https://android.googlesource.com/kernel/common android14-6.1
> head:   09ca5740fbbe445af407b1db7ceb5c53c191fe74
> commit: 6b0a9dc6df8d8be21c8d178a01e0711b0fe6ce73 [1338/19018] ANDROID: GKI: core: Export for runqueues
> config: x86_64-randconfig-121-20240301 (https://download.01.org/0day-ci/archive/20240302/202403021241.WnfpzlvR-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021241.WnfpzlvR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403021241.WnfpzlvR-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)

Sorry for the empty warning here. The actual sparse warning is:

kernel/sched/core.c:190:22: sparse: sparse: incorrect type in initializer (different address spaces)
kernel/sched/core.c:190:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
kernel/sched/core.c:190:22: sparse:     got struct rq *

> 
> 
> vim +190 kernel/sched/core.c
> 
> fa85ae2418e684 kernel/sched.c      Peter Zijlstra 2008-01-25   84  
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   85  
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   86  /*
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   87   * Serialization rules:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   88   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   89   * Lock order:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   90   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   91   *   p->pi_lock
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   92   *     rq->lock
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   93   *       hrtimer_cpu_base->lock (hrtimer_start() for bandwidth controls)
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   94   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   95   *  rq1->lock
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   96   *    rq2->lock  where: rq1 < rq2
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   97   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   98   * Regular state:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02   99   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  100   * Normal scheduling state is serialized by rq->lock. __schedule() takes the
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  101   * local CPU's rq->lock, it optionally removes the task from the runqueue and
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  102   * always looks at the local rq data structures to find the most elegible task
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  103   * to run next.
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  104   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  105   * Task enqueue is also under rq->lock, possibly taken from another CPU.
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  106   * Wakeups from another LLC domain might use an IPI to transfer the enqueue to
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  107   * the local CPU to avoid bouncing the runqueue state around [ see
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  108   * ttwu_queue_wakelist() ]
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  109   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  110   * Task wakeup, specifically wakeups that involve migration, are horribly
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  111   * complicated to avoid having to take two rq->locks.
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  112   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  113   * Special state:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  114   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  115   * System-calls and anything external will use task_rq_lock() which acquires
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  116   * both p->pi_lock and rq->lock. As a consequence the state they change is
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  117   * stable while holding either lock:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  118   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  119   *  - sched_setaffinity()/
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  120   *    set_cpus_allowed_ptr():	p->cpus_ptr, p->nr_cpus_allowed
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  121   *  - set_user_nice():		p->se.load, p->*prio
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  122   *  - __sched_setscheduler():	p->sched_class, p->policy, p->*prio,
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  123   *				p->se.load, p->rt_priority,
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  124   *				p->dl.dl_{runtime, deadline, period, flags, bw, density}
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  125   *  - sched_setnuma():		p->numa_preferred_nid
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  126   *  - sched_move_task()/
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  127   *    cpu_cgroup_fork():	p->sched_task_group
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  128   *  - uclamp_update_active()	p->uclamp*
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  129   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  130   * p->state <- TASK_*:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  131   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  132   *   is changed locklessly using set_current_state(), __set_current_state() or
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  133   *   set_special_state(), see their respective comments, or by
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  134   *   try_to_wake_up(). This latter uses p->pi_lock to serialize against
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  135   *   concurrent self.
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  136   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  137   * p->on_rq <- { 0, 1 = TASK_ON_RQ_QUEUED, 2 = TASK_ON_RQ_MIGRATING }:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  138   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  139   *   is set by activate_task() and cleared by deactivate_task(), under
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  140   *   rq->lock. Non-zero indicates the task is runnable, the special
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  141   *   ON_RQ_MIGRATING state is used for migration without holding both
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  142   *   rq->locks. It indicates task_cpu() is not stable, see task_rq_lock().
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  143   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  144   * p->on_cpu <- { 0, 1 }:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  145   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  146   *   is set by prepare_task() and cleared by finish_task() such that it will be
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  147   *   set before p is scheduled-in and cleared after p is scheduled-out, both
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  148   *   under rq->lock. Non-zero indicates the task is running on its CPU.
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  149   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  150   *   [ The astute reader will observe that it is possible for two tasks on one
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  151   *     CPU to have ->on_cpu = 1 at the same time. ]
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  152   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  153   * task_cpu(p): is changed by set_task_cpu(), the rules are:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  154   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  155   *  - Don't call set_task_cpu() on a blocked task:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  156   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  157   *    We don't care what CPU we're not running on, this simplifies hotplug,
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  158   *    the CPU assignment of blocked tasks isn't required to be valid.
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  159   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  160   *  - for try_to_wake_up(), called under p->pi_lock:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  161   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  162   *    This allows try_to_wake_up() to only take one rq->lock, see its comment.
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  163   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  164   *  - for migration called under rq->lock:
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  165   *    [ see task_on_rq_migrating() in task_rq_lock() ]
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  166   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  167   *    o move_queued_task()
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  168   *    o detach_task()
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  169   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  170   *  - for migration called under double_rq_lock():
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  171   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  172   *    o __migrate_swap_task()
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  173   *    o push_rt_task() / pull_rt_task()
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  174   *    o push_dl_task() / pull_dl_task()
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  175   *    o dl_task_offline_migration()
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  176   *
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  177   */
> 58877d347b58c9 kernel/sched/core.c Peter Zijlstra 2020-07-02  178  
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  179  /*
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  180   * __task_rq_lock - lock the rq @p resides on.
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  181   */
> eb58075149b7f0 kernel/sched/core.c Peter Zijlstra 2015-07-31  182  struct rq *__task_rq_lock(struct task_struct *p, struct rq_flags *rf)
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  183  	__acquires(rq->lock)
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  184  {
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  185  	struct rq *rq;
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  186  
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  187  	lockdep_assert_held(&p->pi_lock);
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  188  
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  189  	for (;;) {
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28 @190  		rq = task_rq(p);
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  191  		raw_spin_lock(&rq->lock);
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  192  		if (likely(rq == task_rq(p) && !task_on_rq_migrating(p))) {
> d8ac897137a230 kernel/sched/core.c Matt Fleming   2016-09-21  193  			rq_pin_lock(rq, rf);
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  194  			return rq;
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  195  		}
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  196  		raw_spin_unlock(&rq->lock);
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  197  
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  198  		while (unlikely(task_on_rq_migrating(p)))
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  199  			cpu_relax();
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  200  	}
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  201  }
> 3e71a462dd483c kernel/sched/core.c Peter Zijlstra 2016-04-28  202  
> 
> :::::: The code at line 190 was first introduced by commit
> :::::: 3e71a462dd483ce508a723356b293731e7d788ea sched/core: Move task_rq_lock() out of line
> 
> :::::: TO: Peter Zijlstra <peterz@infradead.org>
> :::::: CC: Ingo Molnar <mingo@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
