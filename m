Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C126D4C3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787491469; cv=fail; b=JfoQcMNIW41Fk4UE2gQAfj8y6EeiPMLitTnMNIc2XXPWr00/428Z1AG54caYKhsE2BJF2dX2GxCw1ZOn/9pBAiqxWNyfXOvGrqP2XZdBymMTgIjmTHHjbaZn8IXfPfENGD4t97K2mwzl81uP6yAwh+fHIl2g4Fvd0VFIqZCKaPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787491469; c=relaxed/simple;
	bh=Q3UTb36eXpxOzK4xf9qE5C7X//J0+nhLumEJS6WoRAE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CCGM3rTtCETLeZyd4GX99E1c/OQRbELhn0NfaWSnZignHNSl9PrHtR4fjX0Mtvaxlu26TtfgMuEltrQqVgeeKeE5QwWGAu/mdyP92FjZ5AaUW0r7VYDHSP6dnsDgrKDrMwnubABVslWtsH/cGjwsjd6hvUV9XWeov71oMdAfzdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0cgxIjL; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0cgxIjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787491468; x=1819027468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q3UTb36eXpxOzK4xf9qE5C7X//J0+nhLumEJS6WoRAE=;
  b=H0cgxIjLZ8TL1UuOxOstccEY4/srZtf+9dkV1y8MBaf+r2jNPSmQzvPk
   cIrCsiZKkSbcyZt8EqKFuW/BGZzKgz35nGY3WUmKscxhXX9uOo3xu5nke
   NsFdPPqL7On9D+NbcPJLeNsSaV+Fa4XElpG50o3GPWxZwhCEXz7wBEWNx
   1r4EeJiGkJv8rqgb7IYA9EtzjNBJVrT3aEC4vmlE5OgFT4DgQokvfhUaT
   k5UkdJ46nqEp0PUTBCUq9zBSx5smZLMz96ysHTubCdSSB9MTKWeyxXotc
   yLrtgwh0rD0wkW4PKTJ5iWnEsvo1WUWgUEkkjX7yf439OIVZ3/XsbYb82
   Q==;
X-CSE-ConnectionGUID: uZnEmFTCS9KldSoYBaQo9Q==
X-CSE-MsgGUID: ggcb1sy6Qk+b6zf9yjwt5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88021353"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88021353"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:24:28 -0700
X-CSE-ConnectionGUID: sEWI3B99S1K4bbAhkcoYvQ==
X-CSE-MsgGUID: PBRcbHWaTmq260uHnJvhRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="266246529"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:24:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:24:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 06:24:27 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.48)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:24:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eq8JuAWjTGr5JFDUxHJUby4feL/b6lKrwfZuC6+TVxSZj8b/6FgxXMNXPUnmz9FPlFEO8Yjqz4Qj9AG/DEIspybC5bT0p7ZY79aPBFBJkpijYs9CYwT+l3zmHlQjsnc8mxOGgL7xtqwl0hxOUC/nHEpXx0pS4ATK8o1RSUmwhVSoz+nz9N3ljpUWFeE71DBHQiZXsiCltj/ni4Ta5XOgXMIU6dAlpHBje4oevS6Vp09u5+9/CKgl5JWjtu4kxR45JIYgsAACovTjqYJ3UmNZy3USaF52pPL3INYLHNLfmIxt51DEpOfNjiPuhECmfkrl0gHh68vmY9VBL8W2aBgWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hn7QLoFDXMJAqFW4RusmPD7+WJfbw5UcUnt0C3OToow=;
 b=DluNRYg2eb9Un+D8L1XdeWSGEVCLIhlBwF/R9sogPrJP8AJHH+FMI+F7if5Fv0tF49sTrLhtid9+7F3mXIuosltReCAr2ecDTui6NV2HTzzoBUedUT1DdK0D4N2xbHnYRusstD9pFaF9gT+sXccKcvJPZ/bpcU5JaJnCLpD3ouFXeOnh1ZR6HZUAPz74FCzhKPihx6iBjDKfvi5mGksF9ojCq72SaRxhv4J4aIcSVbUh0awdsE8H9U4eMXW+gKSzNMYpgSH8sfNnSfwETKcOe/8howEdBOV0t8Q/mOT7cxoCHHu9w0WAuhCaoYr76nUNQpVm/2Abymwvyr9Xpo2DGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by CO1PR11MB4993.namprd11.prod.outlook.com (2603:10b6:303:6c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 13:24:19 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 13:24:19 +0000
Date: Sun, 23 Aug 2026 21:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: <steven@liquorix.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [zen:7.1/prjc 2/68] kernel/sched/alt_core.c:3782:9: error: too few
 arguments to function 'blk_plug_invalidate_ts'; expected 1, have 0
Message-ID: <202608231924.V54oUz3S-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0011.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::17) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|CO1PR11MB4993:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b57f3f-152a-412a-f83e-08df0119d65b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|6133799003|18002099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: P2Tujq7SJVFZdoGk7t9JYUE3zm6soVqKw9k58SkKuzZ2l0Dp7RO5xsh2MZv7Y589YXCUfrUsKjj2pA15UTmO+cQk7P75q04WLaXz2ArNGNxc2kFxeTfk50TVnLYoud8zYUs10dCUyjrL4xXrhPg2bup/7i4PSI/Je/5MibHi9RzicuSWVoLvDImbfUbcva6oMkcRNPzqMZ/kWec7s4myIEza6GhiS4PfWzO0V9o9ogoBtFjH3jKndOXufNLjWX73IKrMq+2XlKAXvYvD//OSAm0ac/zP5B5uyNS2EhFP+gBd6pMJ6XLPRNbj6LDd+ogmR+E/cdK60i6LcCUQDLKfMKHoEwK6fwxnu0a7S18Bh2v9nchqruOzmFM3A/4i31e73W9M0CssFbNPtQ9Xld7ddz8cVm+VO12xKVxEQuO6V+Gr06uMFdKvp+3jFa3vSc3egiizUTFRAV6tQZF3DbI2ac5UX3eY5CkuDgw3YMKh2ztvDbTPDEB0/FKjT7uOImea8ctABX59b5oqyfOmB077nwJZIXWZsiVYMNewQ08KH91dV9izvGmTYxjAPlC++5bVCclN1P9eRNeLpS+58KC8hN12WS7nH7hOkL2ybcvvGizTUMb5t0mjdTRrUU6n1hGG60DL2us4G8795LdQNUj768Z9lRAuGiCYwAacb8VLC1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ri5JymFU6hivO9bjGlZFqI5Lb9fFIN6PqzKHtRcaun+CAWNCgMXHQ7nzTYV6?=
 =?us-ascii?Q?PKjJg7lMtxN85gfknnnRfh78lbXElKLPoWC6TzmSVC0F/kl0qUbCSQBuBysi?=
 =?us-ascii?Q?SPrUt76wXjnGQzWm89TgmnZzVYl611fF6KQTFQoCEDiYG6d3uMwI0dkepaQw?=
 =?us-ascii?Q?op3BhDEm+5kR2C6PWuIn35GeWiJN4ORZOslRSKCt0AVeAScCCtK36HV+rDCn?=
 =?us-ascii?Q?fb8M3nQAiRex/k2Wm9Z3bVAx+aQVvWgyzGffOxdF4Qxd77HxfIIekO8vA2Hz?=
 =?us-ascii?Q?r1AETo9BTXFsC6XEEbJStQVERFP6LwhEhreAfUpzHMNoSwHE7Vor8fdvkgdx?=
 =?us-ascii?Q?Yjz3rIhoL9xUqyBJh13zlaHv04sbOxhefnWymtrBAZNVSMFHJEmYbvkGtbRV?=
 =?us-ascii?Q?uBxJN5qXlcH8IbMT4eoEZxued2d63xHcc99p+xJEu0zbO7L6tlG4r4qANRGc?=
 =?us-ascii?Q?NI35LOGXTLS6fg/1XgNtOqCovt6E2hlNKlZPpJSnWt2xs8SGn2UIuZgc6VuD?=
 =?us-ascii?Q?mDxZJ+n3qweFFVKNKttf6vtu3aty0mKvkZLX2ns0DeZwkpC0dqGimAFW/mBd?=
 =?us-ascii?Q?RbLLjloydYez4E3iiOFj8X4q9yg4GgemEkkui56QYaR4G8EKJy5BhPZGkMrh?=
 =?us-ascii?Q?5b61tIX40dSEPQRsrQWmj8Ko3l0zDIOfzAXQ3ozl0Nt5pwt4Ib2ynBqI7CqT?=
 =?us-ascii?Q?YaiC0dj7cssihlNL71Ue4YIdBrpB/4urEkibDkYqfWtlENXLkFU9jVegD7Vj?=
 =?us-ascii?Q?MwkGX0m8QF29i9G6iU0MwLq5S+vu0GdMWxWfBrtt68JAR1I/5W8GL5oZfFj7?=
 =?us-ascii?Q?WrCxYBhrzJgRLEZNO46eWICAJEViiCG2gzLj8SeaP6hSE7YPR0wBDVUmpSnH?=
 =?us-ascii?Q?gidLhtw7mUNfhEQRaXTxeYz2Cra4o9fWso09V7OwPEpj75JYJPdH5t6MO+pf?=
 =?us-ascii?Q?X5goCHl0hYAf2zEYMcIdTkAGQ6JmJFaimuDOnJ9vmJzi7KaVMbueHywTmITB?=
 =?us-ascii?Q?8cFHDMWl57WDVngeV83NhwzaFaZsxV/a8Rpr+2J1t9XqY6IAwNveBPgKYrAL?=
 =?us-ascii?Q?xtlTrK1i3+hbass5IFEkkwnIXeBIcxnQW8Wtba3VXJ4TfoAuNSFWPpBolg9i?=
 =?us-ascii?Q?TjbJTQHF8FOkdiOwjjFBpjh5jHwfEYZQ/icl6LkRlmRckbM8vvNUwOcE2qS4?=
 =?us-ascii?Q?GOr6zpv93yyOoso7Ac4fPBsjjd9BE6OzOIb6tevl/ohk6USrG8kFlTpCJe8o?=
 =?us-ascii?Q?rTp5izoGPcWMRLTG8qJyrjHeyEYKybf7Q1nJWDfL1Mgt1DDrAucwoKlic32K?=
 =?us-ascii?Q?cBz+HB3OycZISbEdJyjIyRQ8cXuYfTlIhdExQhxyHBl0qnqVWIapAj1Hst2Z?=
 =?us-ascii?Q?FuPG0kewWtcx2yvQBtvQHo8DgT3iWpGp+lZZ7MJOu+XCQJXq/YJDzn3eRDjU?=
 =?us-ascii?Q?JYuSZrYIQho+x+hfqiIBeBa41rR7lBmTT+K8VGAdM6hRRMte3FrK1OkbS7k3?=
 =?us-ascii?Q?S7FWjRU/okXflAgfSIbpdd2G7jEDEqqhkylJb6rwbMn7sN3wjUu30g0ymnar?=
 =?us-ascii?Q?Hdjly8MsJ15FJrxqcvKyKb3MtDejfd/HeDrIMPX8Z6LmpzEVcLVsSfStLULH?=
 =?us-ascii?Q?vu0/rCc33G1Y1Lj6t1MKa2vKUaNZheneUL7vHvuRWLUJYnv5kTe1ZDK8EwPX?=
 =?us-ascii?Q?6f1zxqGDta9/OPY6ERmpZ2M4VWnj836Fk3MDlRqrOKN62Xv1F/DNOf1YMsx1?=
 =?us-ascii?Q?L09ji6ckqA=3D=3D?=
X-Exchange-RoutingPolicyChecked: flw8BqK1cZvNCF3ZTTkNKVsl97Sk39AJBOptBMNagIzGSjWdMpazPy0lJGU5Kf81b7hZoePrllG9PbrN1YfXYPy5VuvpuEbLp7OvdA7BWdTLwuCqnApafS4tpXTm59zLmfF8+wH0H/fdqI/VfZSb25xGJL7OUsSEd8XGAD7dlLGtvvFG4/xL9C2BTWSEgs+PEEiylhpdQyn0GalwkLhhawKcSV7Zg/OO/9z6pEHr4TbDpiQYFIjAuN8/IsI3eOZkqvqXaxBjk5UlW68LJ0LxeK/f2/K5Ns7VE7QKGyuysKHroPMe7w8nx7yf772NICRnHnKySVPZQI35oJ2bMnd8ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b57f3f-152a-412a-f83e-08df0119d65b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 13:24:19.2857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVfhfbfiQD8bv03AcXhe9i4/EgxjakfuFlKAupM9ubK7yRj3nSiVondi27OtVwTyS/FcMtVa1aUQCd7VhRieSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4993
X-OriginatorOrg: intel.com

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   959d287ea3d63009b51942f6045355c82b18590e
commit: f3e8d2abb7fb9e5202ac3cb9991bd7aad83c9aee [2/68] sched/alt: [Sync] dcb7416212e6 block: invalidate cached plug timestamp after task switch
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260823/202608231924.V54oUz3S-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231924.V54oUz3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608231924.V54oUz3S-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c: In function 'finish_task_switch':
>> kernel/sched/alt_core.c:3782:9: error: too few arguments to function 'blk_plug_invalidate_ts'; expected 1, have 0
    3782 |         blk_plug_invalidate_ts();
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:28:
   include/linux/blkdev.h:1220:20: note: declared here
    1220 | static inline void blk_plug_invalidate_ts(struct task_struct *tsk)
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/blk_plug_invalidate_ts +3782 kernel/sched/alt_core.c

  3704	
  3705	/**
  3706	 * finish_task_switch - clean up after a task-switch
  3707	 * @rq: runqueue associated with task-switch
  3708	 * @prev: the thread we just switched away from.
  3709	 *
  3710	 * finish_task_switch must be called after the context switch, paired
  3711	 * with a prepare_task_switch call before the context switch.
  3712	 * finish_task_switch will reconcile locking set up by prepare_task_switch,
  3713	 * and do any other architecture-specific cleanup actions.
  3714	 *
  3715	 * Note that we may have delayed dropping an mm in context_switch(). If
  3716	 * so, we finish that here outside of the runqueue lock.  (Doing it
  3717	 * with the lock held can cause deadlocks; see schedule() for
  3718	 * details.)
  3719	 *
  3720	 * The context switch have flipped the stack from under us and restored the
  3721	 * local variables which were saved when this task called schedule() in the
  3722	 * past. 'prev == current' is still correct but we need to recalculate this_rq
  3723	 * because prev may have moved to another CPU.
  3724	 */
  3725	static __always_inline struct rq *finish_task_switch(struct task_struct *prev)
  3726		__releases(rq->lock)
  3727	{
  3728		struct rq *rq = this_rq();
  3729		struct mm_struct *mm = rq->prev_mm;
  3730		unsigned int prev_state;
  3731	
  3732		/*
  3733		 * The previous task will have left us with a preempt_count of 2
  3734		 * because it left us after:
  3735		 *
  3736		 *	schedule()
  3737		 *	  preempt_disable();			// 1
  3738		 *	  __schedule()
  3739		 *	    raw_spin_lock_irq(&rq->lock)	// 2
  3740		 *
  3741		 * Also, see FORK_PREEMPT_COUNT.
  3742		 */
  3743		if (WARN_ONCE(preempt_count() != 2*PREEMPT_DISABLE_OFFSET,
  3744			      "corrupted preempt_count: %s/%d/0x%x\n",
  3745			      current->comm, current->pid, preempt_count()))
  3746			preempt_count_set(FORK_PREEMPT_COUNT);
  3747	
  3748		rq->prev_mm = NULL;
  3749	
  3750		/*
  3751		 * A task struct has one reference for the use as "current".
  3752		 * If a task dies, then it sets TASK_DEAD in tsk->state and calls
  3753		 * schedule one last time. The schedule call will never return, and
  3754		 * the scheduled task must drop that reference.
  3755		 *
  3756		 * We must observe prev->state before clearing prev->on_cpu (in
  3757		 * finish_task), otherwise a concurrent wakeup can get prev
  3758		 * running on another CPU and we could rave with its RUNNING -> DEAD
  3759		 * transition, resulting in a double drop.
  3760		 */
  3761		prev_state = READ_ONCE(prev->__state);
  3762		vtime_task_switch(prev);
  3763		perf_event_task_sched_in(prev, current);
  3764		finish_task(prev);
  3765		tick_nohz_task_switch();
  3766		finish_lock_switch(rq);
  3767		finish_arch_post_lock_switch();
  3768		kcov_finish_switch(current);
  3769		/*
  3770		 * kmap_local_sched_out() is invoked with rq::lock held and
  3771		 * interrupts disabled. There is no requirement for that, but the
  3772		 * sched out code does not have an interrupt enabled section.
  3773		 * Restoring the maps on sched in does not require interrupts being
  3774		 * disabled either.
  3775		 */
  3776		kmap_local_sched_in();
  3777	
  3778		/*
  3779		 * Any cached block-layer timestamp (plug->cur_ktime) is stale now,
  3780		 * invalidate it.
  3781		 */
> 3782		blk_plug_invalidate_ts();
  3783	
  3784		fire_sched_in_preempt_notifiers(current);
  3785		/*
  3786		 * When switching through a kernel thread, the loop in
  3787		 * membarrier_{private,global}_expedited() may have observed that
  3788		 * kernel thread and not issued an IPI. It is therefore possible to
  3789		 * schedule between user->kernel->user threads without passing though
  3790		 * switch_mm(). Membarrier requires a barrier after storing to
  3791		 * rq->curr, before returning to userspace, so provide them here:
  3792		 *
  3793		 * - a full memory barrier for {PRIVATE,GLOBAL}_EXPEDITED, implicitly
  3794		 *   provided by mmdrop_lazy_tlb(),
  3795		 * - a sync_core for SYNC_CORE.
  3796		 */
  3797		if (mm) {
  3798			membarrier_mm_sync_core_before_usermode(mm);
  3799			mmdrop_lazy_tlb_sched(mm);
  3800		}
  3801		if (unlikely(prev_state == TASK_DEAD)) {
  3802			cgroup_task_dead(prev);
  3803	
  3804			/* Task is done with its stack. */
  3805			put_task_stack(prev);
  3806	
  3807			put_task_struct_rcu_user(prev);
  3808		}
  3809	
  3810		return rq;
  3811	}
  3812	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
