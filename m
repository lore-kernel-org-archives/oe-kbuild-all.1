Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728F136495E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629849; cv=fail; b=BMD+hTSSqkHPRQE3Hn9NDwaHMOKx2IOfLTOLgjF5fofBNAb7RJGkmHfB9a5HlNOrGjNtnHc8ybHuPaLBOpDtO9T7V5ZBdaUY34mbD1C5RcSpziavRjrRVb9EfT1NLSj71IOF2YnPxCtOJJ1mEVdA2Vx5sRJnZZVlEO2EEekirRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629849; c=relaxed/simple;
	bh=jIhTfMV1IhiD75Xl6GIpVFlgi13aad9ehjv0ruuFHD4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nAR8CJjvdCMNfK+uq8netDIV4JDuHlMQJRKCTunStz1hGNQ8YhI/yZKkPuin0+i4p5pzMNLWDsg971Sbd/Tv6ApVQ8Mkhn6OgPVv0Z1NO9zFvwnAOu9MTcC5rq+e7EnxdcJ2xy/Gn9dTmdblx5qYYKRfGMG/RQ/uKIq+Rv25U0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bc9WYEET; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bc9WYEET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775629849; x=1807165849;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=jIhTfMV1IhiD75Xl6GIpVFlgi13aad9ehjv0ruuFHD4=;
  b=bc9WYEETJGuVKyalwSMLkWterdXr08xuTVg/G31AT4xz9/FmYr9s3kUS
   sw1vzgFSAzIwuTYKQO+LqnAoANivLxyddg/+3BFL0E1Q0mJdM0+ps4KZq
   fltn4lpFu8F5oUX5sE15pA60CTZ1+b5xfK3V/FD9U6hW7J1xCAs97sm8Y
   NFODDoBV/X9WqaL3G92entbOOTdEnRDsENJwAVAYrLtvculCl1Gf4EVbw
   RHZhK0mkJNxgOGAjQMf4g2Q04t3OYCqz5wIXyjPZpBr/C0p7JkhMviPcz
   RZtUI3V6OvVADCc4f8OEeSYVU4EFP6P2ZaqrRA0tOdHnrnXEE9R1xqe/I
   A==;
X-CSE-ConnectionGUID: mXkcuSzjR663gwa0GtxA5Q==
X-CSE-MsgGUID: DuVwHO6GRJG+MfxS426m4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76325091"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76325091"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 23:30:48 -0700
X-CSE-ConnectionGUID: RKfMd41gR7+zg6vn5Sehrw==
X-CSE-MsgGUID: 854B36IlR7G21Rl63K1fzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="232427386"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 23:30:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 23:30:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 23:30:47 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 23:30:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqCNCvOJBUR96buqKfyDvT9tIGm4GSWHMZAPw2ECW5uyuEhj+kfvAUeUkGXeO38p1XI6i5gae4dCBWNJOBOfJvifhNeUwIcfrmP4ZiR/hpZKFOBbiK4mG+AcFpQVwchZEbtUuxmg5QnOiEqAf1Prq1h2W6JBTB6dMJ66HLM26Oq8ZoD4z6PnYfbN65YG147UmFDq6vD2aNOndowONiUeK9mf9/xAIUSV7va9NAtH6JoDraiZxtUKLLY0a35uH1eaJYnp8v03mmYm2VkrRqYRG2uim9fy+LIlXk1iztdT7xZiCB6wd9rG/aPN3Bqn57TnHqrVPn7O8Tl7t4VoSE3pjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L84qnISlTiE2Oip2zYdGP8zoxxX6TGBs1e1zLWYbqwI=;
 b=fEBP+d2vsaigF0EcsVaAdjAVGNiCxsxUGwl69WHtWJgOhsivFBNVU0E//F2pPkpA1x2pm/a3f9QrkfOBRAZyEza83UgfRpFOqNLXtVa+vrDqq8a6N3Kn5gGDPDIag/vo+qhH3xW0LfPLR+FfZxXci+5tdYKHIZe8m2VkEgY0Ex3efzeTgs7rjnlHVHZB1E0EHsVJ2tFAb4XdUupO2RqxTQWdW5jKJGEWQa6kD6R+QzPZD3hpMLF6z+yhPAEAt/oCiU0J9APArnbFmZp6dmbW4+1va3Io9VXFPc1LoHYg3b1cDJ6momLZxQDofw2+//seRAtxpxQ21UWYvVPHg8adLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by DS0PR11MB7849.namprd11.prod.outlook.com (2603:10b6:8:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 06:30:37 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 06:30:37 +0000
Date: Wed, 8 Apr 2026 14:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC 2/2] mm: page_alloc: per-cpu pageblock buddy allocator
Message-ID: <adX2BpfDTaCr8xoI@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260403194526.477775-3-hannes@cmpxchg.org>
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|DS0PR11MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1702c5-6a47-4974-7ce2-08de95385884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: Jxx1pFHMFAVK22c5deXc1aIiRGEaiFeTs9DvSlzkrd4Z+OknDIAczL3N7nCKLm1mMntC0r2jDrJbxGjQvk8Zy500oTP1dVFSCXsn+RMCCePjJkLNun5/fJRBfsZ+cQccQMfb1AEGr8uci4ekazSlhkRsSiJ7Bf2UsaJKvD0KHNqJrpLIpR2/GCrDDaaMsh3Rz+DQ2+Vieh9FS6z0niGhB9j1xSSdKKnLC8bzBfwQf4lFy2Vou6gtZ+wZnSL3d5ZfAq337z5FoZ0v0DkQAdI1w8WQ+8yI77/NOGPmoJAPvcjcclXuz4AK6+l2zHGk3Ezo98mY0ALpcMUdBOCB60eBsRX0NxHZy8Dpg2lNkg8cS1ezhQaSqg/wtIkiRVyUnGEwfgy/8yjvjh6i/Zq7PiU9Yb/nrS530EE4IhaV5gM/Bq+R2HNqmKtA2pOEOEvwXaJawarmg0uZlzcKwNVtvid5V/GqeFCxqjK1vZZAKRgfeqjlNOBoF0Z6iUd5bBUQn+sXaPBvoVFvv7aR+CsGUv+Idv0vrKtGf3Bcu3n019tiJJpmUSz13iX+z7x0SH6Oys2GH7cz+eQmoH1vSFs3nP4eNncVIXLTTWFQUiMJkpbR0bUDJQi7FQXTzq+2B5h2v86sHxVBxcn2QrjtsvPaEppNHGy6SLFwmYdLiYQYD0qTSdpvs6+yH9xAySQnR6AqIjcy7GWtFfLJji8i/YCkwDWqEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0c8hsyDYTJgxkzkZtTmXNSxkX8kvNiiG76zKm0bVBeFJU3nwVUyMwr5DWben?=
 =?us-ascii?Q?2FlrCAJY+vKFS8Ut6pcLqarb3FRPKJEOV6JMKHN4xhpAl7xDrXaHkEpV+STt?=
 =?us-ascii?Q?/4jyBuwPQduXs1+RcAfqvHIBMpHSTlR9IoO2NmqBfcIPgGXEOJtLFsweQbLL?=
 =?us-ascii?Q?ovoyyDDAxzbZYlQxGz0yNvAzLU5pMxU6sHEZL2BbGDZsgF7joh2L2TSHZCR3?=
 =?us-ascii?Q?qSSd+hhPL64iqirn+ah6PkwwanSy/uK2G1ukYIp2zMDX8s3OejD/hD8N9JuC?=
 =?us-ascii?Q?jAeLLTYjdAIMIhhI44UHg8rDNIHh4gYyFRgeOOB5JVbECI5y/gjL7by7p/lP?=
 =?us-ascii?Q?jeMhcsYyJeiJh24gwFaTTZ0ndX2IVB282at2v98F1JMOqpOnFZkWiZlK1K6w?=
 =?us-ascii?Q?7pohvqLMqwWp4EpkxpKTIDe64wdQUPDePRcA1hdldZs+8iP8RxvsHXTUK8jI?=
 =?us-ascii?Q?kMwzN22v0sBQ6Vnz8Vh/50/uUJZPyRC37n1UBYH+VsjqqBmGbxZrtac3pkCj?=
 =?us-ascii?Q?lbaO6bD3FTiChaudOyslXLvT1FZ8Z8NxEfup6JCb8RRztQ3oe5J2ealA9rPN?=
 =?us-ascii?Q?vcDACnJJVNkjShxVf+lNfqHKbnbOVbPw1+xmaW5RMvDCfFJ14kKvnLRyaxIt?=
 =?us-ascii?Q?SdS0631msbqPSL8NtnMomHhwAbj5dyD37isXq9dq5h0MsIbfFHf4IwGorOVK?=
 =?us-ascii?Q?5lYmgX+I0yRiLaSXLgKUlVfN7zzTeXcJHHQj2viTnlUhJs0EZAP1BwlJvuSq?=
 =?us-ascii?Q?/nx4kYp8j4uB16kPLXsgYrW5ytwonONkdFGrbEswr6/jGsUu7uJflN0ibBdc?=
 =?us-ascii?Q?Ey4QBO+sDsZAuwxQCPmbc600yOym0SUD6Ij9YzC6skcsDU2+TYbIWWuSlvod?=
 =?us-ascii?Q?jh0kPPmW7YjkYWZGpY6aC9PtNVWwFVZmuY0Qi22v22RgsmonpH14JuzSenyd?=
 =?us-ascii?Q?bci3tfjey83bELbgRmODB5sK6VMOTZLFE36S2YMuWS8Jmcfvr76cI1k+CRfU?=
 =?us-ascii?Q?4SefsFWD8Nje9poA3g6rKzkW0q1XHVoctk/ubD/xlIOi5QUeUeHpnlC5eLBL?=
 =?us-ascii?Q?Pz2xPk+QPnfAEl5SQmqGZcchtjqi17SRPJ5El25EJmEXVAPVze8GeTTkTqBw?=
 =?us-ascii?Q?B2Dqxp9JEak0TFUfhCLK9LQ6xxlRS+MaNAb65cs2DzHqwmkHPod3q/x1cfFT?=
 =?us-ascii?Q?DMGcJrM+0nEbEsBZk0yZzkwslZQIv9L1mlT4ZIcKFyi51O04MS1gQAs7gNBA?=
 =?us-ascii?Q?CQDcZgp4NOJLwl9oA9cVK3wGub8nGwFvUFNSUFMHxhM4wVhjH90Dpq4P0Uxs?=
 =?us-ascii?Q?BhZcwaR155BzwYl/vKh1d/EQ4gX+k2uLGxc4OnjqQzNaIAxOKvG/RIxBLT93?=
 =?us-ascii?Q?KQeZWFKJNgF5cDJv09NOoRJwn7f19qIuEow7QD7vqeljABGXGRO1FK0a0p99?=
 =?us-ascii?Q?BIYDrbXuy6CQXm8sftwc2qSoBsVIjxhPq9KsMfxcqwlfOtobgChBB01uHD1u?=
 =?us-ascii?Q?0JdiMp3ur2H7aUw9uGGYo7xh8d3gAOm6tCF9dx+6ETQsJo/eku6WuJJgJiLf?=
 =?us-ascii?Q?TDYK7nf1fTqfcoQjxbQN/rSGc+U9szO53vUcsw9nmug84yfqlEvBCQxrVPXK?=
 =?us-ascii?Q?o3DULzfGhmhUgQKLXjMKkJ8moblyhYnFRgNXSUXNIvcjg/nWIHNhnmwB2NJ8?=
 =?us-ascii?Q?ZH4WdvSrSQv3vdNCACVHxvFSBMUpo1opUmPIASaFas2sSnWaBcS4caWj4j/z?=
 =?us-ascii?Q?kLdC14VPNg=3D=3D?=
X-Exchange-RoutingPolicyChecked: iCyEB2w5xnQnzmTUBOlvzH7I6JRNJBHCZWHYANYYXoX6MqiFPGGlDWYhyxtfw9pPyfnu0JgFgSSUEWha/yzxTD7vYeHUzwuT1ujCgGutyQXnFtox2JY7DtmTUe8QX3SSuvHDt77h9YXDz3d7VzF9ytcEBR2nWbHZoTvU8ANhZsp+Rc6FOq11K3U6tbVL1cf49GFqnCzKjFaItdztlm3VeT38NwObCLvaIPiJF+Y2f7P3J6FQ2rajJrMidZLUqM75keI7pAbWWjLF3TJf0FAL+lRpcC7hiRsxV62TDDasD0LYoqI38cBaKZ62uzFFzzjFkP4CCoSLGF/twjBvSGCwfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1702c5-6a47-4974-7ce2-08de95385884
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 06:30:37.1020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VqPQU+L6m01WosnOE55Ce91DodAj4LCCk9gTrG0lRFnahOvWJGnRp8Weu0eexIvyYR4YCUVLzVIDaekBnxClQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7849
X-OriginatorOrg: intel.com

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rppt-memblock/for-next]
[also build test ERROR on rppt-memblock/fixes linus/master v7.0-rc7 next-20260407]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Weiner/mm-page_alloc-replace-pageblock_flags-bitmap-with-struct-pageblock_data/20260407-193348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
patch link:    https://lore.kernel.org/r/20260403194526.477775-3-hannes%40cmpxchg.org
patch subject: [RFC 2/2] mm: page_alloc: per-cpu pageblock buddy allocator
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260408/202604080453.g3eQBKxN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080453.g3eQBKxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604080453.g3eQBKxN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:118:
   kernel/../mm/internal.h: In function 'pfn_to_pageblock':
>> kernel/../mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
--
   In file included from mm/filemap.c:54:
   mm/internal.h: In function 'pfn_to_pageblock':
>> mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
--
   In file included from mm/mm_init.c:35:
   mm/internal.h: In function 'pfn_to_pageblock':
>> mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
   mm/mm_init.c: In function 'usemap_size':
>> mm/mm_init.c:1456:39: error: invalid application of 'sizeof' to incomplete type 'struct pageblock_data'
    1456 |         return nr_pageblocks * sizeof(struct pageblock_data);
         |                                       ^~~~~~
>> mm/mm_init.c:1457:1: warning: control reaches end of non-void function [-Wreturn-type]
    1457 | }
         | ^
--
   In file included from mm/page_alloc.c:58:
   mm/internal.h: In function 'pfn_to_pageblock':
>> mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
   mm/page_alloc.c: In function 'get_pfnblock_flags_word':
>> mm/page_alloc.c:363:44: error: invalid use of undefined type 'struct pageblock_data'
     363 |         return &pfn_to_pageblock(page, pfn)->flags;
         |                                            ^~
>> mm/page_alloc.c:364:1: warning: control reaches end of non-void function [-Wreturn-type]
     364 | }
         | ^
--
   In file included from fs/exec.c:82:
   fs/../mm/internal.h: In function 'pfn_to_pageblock':
>> fs/../mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
--
   In file included from lib/vsprintf.c:51:
   lib/../mm/internal.h: In function 'pfn_to_pageblock':
>> lib/../mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^


vim +803 kernel/../mm/internal.h

8170ac4700d26f Zi Yan          2022-04-28  789  
d88d3563065850 Johannes Weiner 2026-04-03  790  static inline struct pageblock_data *pfn_to_pageblock(const struct page *page,
d88d3563065850 Johannes Weiner 2026-04-03  791  						      unsigned long pfn)
d88d3563065850 Johannes Weiner 2026-04-03  792  {
d88d3563065850 Johannes Weiner 2026-04-03  793  #ifdef CONFIG_SPARSEMEM
d88d3563065850 Johannes Weiner 2026-04-03  794  	struct mem_section *ms = __pfn_to_section(pfn);
d88d3563065850 Johannes Weiner 2026-04-03  795  	unsigned long idx = (pfn & (PAGES_PER_SECTION - 1)) >> pageblock_order;
d88d3563065850 Johannes Weiner 2026-04-03  796  
d88d3563065850 Johannes Weiner 2026-04-03  797  	return &section_to_usemap(ms)[idx];
d88d3563065850 Johannes Weiner 2026-04-03  798  #else
d88d3563065850 Johannes Weiner 2026-04-03  799  	struct zone *zone = page_zone(page);
d88d3563065850 Johannes Weiner 2026-04-03  800  	unsigned long idx;
d88d3563065850 Johannes Weiner 2026-04-03  801  
d88d3563065850 Johannes Weiner 2026-04-03  802  	idx = (pfn - pageblock_start_pfn(zone->zone_start_pfn)) >> pageblock_order;
d88d3563065850 Johannes Weiner 2026-04-03 @803  	return &zone->pageblock_data[idx];
d88d3563065850 Johannes Weiner 2026-04-03  804  #endif
d88d3563065850 Johannes Weiner 2026-04-03  805  }
d88d3563065850 Johannes Weiner 2026-04-03  806  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

