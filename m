Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498BBEC5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727445634; cv=fail; b=qC1wBC5ciFSlaCp9gY9gSwq3xM/8FRqmzeJbLMrrxW2bI3fvPdzzf0iDprjW9Bxd/4EJE2/m4OMq454+OEMjIT3ZdXDGYxjLePbygA06EMVhtW3a11UJqnhqDnTaIxWnAcHkB6UykDwiZXRBQ9xjYV5LYUu1rfNueCOPycRrLWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727445634; c=relaxed/simple;
	bh=2vRr17W89pm7SF5msPSDaMCMCL5auJA93Cg6jEl3F1U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hiYjQ4ydD4kXYa3WR4DPj46YYEwkW5ZmQWVATZkALNIqu4062LEAjgiAGuy0UpNh+essonB/9PBmnXPMhpP3jvWdUlXu9XqjRD4/p7BeJao2yiWAhrUga/JyD9mUIeS/oMWAMBUmKqdwgKICs4FIWCrzTB3oPlP1GyTjkFCzXAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUNz5tdp; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUNz5tdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727445633; x=1758981633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2vRr17W89pm7SF5msPSDaMCMCL5auJA93Cg6jEl3F1U=;
  b=fUNz5tdptOGcti/URbF9NNy6ZT17xG82UhkCt8Za4u+g3vDV5EaKeMhH
   9UcYlDGmFw1C35cnGZ1y3kM3/7jp/y2OqTXtsuKnNT0MrjhsLQTnWkw41
   mIogt49tERFXEjcMewLIxOwihFsT5Nw9ls1cyEuBogsL0RQURIGJGy4Zt
   ll53osjz850Qzk0A/Ikbo7qRxKReb3Z3JJFAFqPDhi+QUUsHDDKVeWrFz
   tMuMlehfb7GBOt2LQyOMKWFrA0T8TOlgW78DGMkcEHXi9xAdC11S9wpPY
   QANiNljTuJxulRJtRJeIChikse81ODLiNQEU0VAPOQf8CpLwdq87XOD3l
   Q==;
X-CSE-ConnectionGUID: BEHttzBlQMCHFWrR+lAVTA==
X-CSE-MsgGUID: 820YSXk1QEymXE3c/fvGbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="29470978"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="29470978"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:00:33 -0700
X-CSE-ConnectionGUID: +Wa0g8wKR3KBk857xnHhFg==
X-CSE-MsgGUID: ILtQkmCLQPuyucdGQ7+S7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72623090"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 07:00:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:00:32 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:00:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 07:00:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 07:00:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHqFhFZRZxGufV8SCBZe5oFIMKpw0jv8hFBm+zkjOuJZwnKI9FA7oKtJ/8WG/Fw5o0RjNOBlU3pzcd3qTkTs5NCNldkNsMYai1XRxaz3SyYGJFQ7AioYnrxQoXrZCmb4Clgef44q2P8ONAwks03jv6pmx1qJLgCweEukQkpyFUC9zBudugfMGfmPG6x3OFObUA3ozMFpJ1/6gjN3vEBMuZR2SFlIQesYO2mno2t0wSRhylpmtf4ipHuWkg1nH1JpDMiuwpBrqq8L1OBSL92XmbCwZ1g53lwIy8eu6WZqUwIPJWblt9UAVIG6cX9dXvZQbbJiGmPOuNY1sYOR36mRRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ftH+gAvVbIJHjTodGMTj2uW0tEwDm5BaRXCFXr6D+s=;
 b=w20UgPQzMnli2E3euzE+ObGxx0na9OMtobNiTXNtOMtN7X2XY02EQPuvEONl1hCbsJzLVJkzZew2zfjTI3c3sGz/vqkrBwW8/2nhV+Hk036RzMzK+Q7s+hg63tL/6QfL2JPtJ6+kvcN4sxf94QgDYkeG6tZ7AulfClbHz3D3p6FFGhRge9I/EnMzNAckPQH57YUvWq6t8XUqc6KseNfJ/QvHAuSkFrilqTrbfFAQkle9+d/ZSsd1FzPb87KPpJRqnDJh90d0z95ApF1yBCHnGRMzuwTL4yJyRcEZVyM0YFGKieTWvj3uJd2zqP8ppxLCBZOYxIOoSctyFppvxpkqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB7075.namprd11.prod.outlook.com (2603:10b6:510:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.32; Fri, 27 Sep
 2024 14:00:25 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 14:00:25 +0000
Date: Fri, 27 Sep 2024 22:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-4.19.y-cip-rt 155/30000] lib/radix-tree.c:90:30: warning:
 'radix_tree_preloads_lock' defined but not used
Message-ID: <Zva6cRMNfWdSBIX9@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: ede0dae9-4f47-4e7e-fcb8-08dcdefcbbfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nms7QvaqjO6Gqi4TdDiTLdhCu2M9a1m5JoX/+5R5ylEJ4SeXDNQ9tl2XJqC9?=
 =?us-ascii?Q?NIKtirHLTCbXjswQKnWk1NyosKuVCkyxYmNo/EE+BYDh5xQSIsmvRmNmRsdR?=
 =?us-ascii?Q?r99gK3ZQxvFe4Ri/dTXNbblS+OubJ8svO3pLnBsehgDIOT6RDjku/DC6pnaP?=
 =?us-ascii?Q?6blTwQl1HUsWNgRAZPnvlrBJB6LNdJ4xX0DPwkeFOmI7RkfJ1h6Wbx8hrMXP?=
 =?us-ascii?Q?3r7i8R232IqK04jvh+zDPKMDGo9F92K6CECo0Oec4K7gMXYPBxpeCJCeQMEm?=
 =?us-ascii?Q?UEcVVnV8ryGByjA8I4Nf+MRiLhkhj4ze1I5ClGthLv7OZbtXgz4XHjKrLjHE?=
 =?us-ascii?Q?usYr5b2nd98TDRzTPEshbJbs4APsj850JvsJtnBxZbE0wAhgBn/+XpKlXXHS?=
 =?us-ascii?Q?u80dBsVSgUR7PPGBQis2MIbWp1H+F0Wj7LjqkbayV5TqP5MzmO2p8vxpU3YY?=
 =?us-ascii?Q?BRP49XvWL0ahAbcDR3yclxxaBsuXP8/l+QN0B1NCIlkKVKtZo3eYL7+HkTan?=
 =?us-ascii?Q?2ZteHcucoHtra/e5TLOsuZ38VhDYA/D97IQPnyU9/5TBvRqcs4NropMhkJni?=
 =?us-ascii?Q?hCAlFYPxBVUz2tnIGPqWWTqpPbUOCTCFhhB3JsSEggyLLObQyCLlMiXyQNA/?=
 =?us-ascii?Q?Kbp7JUcKpdnhiLo4kt828SoW7qjpa3bzOeiiyK6t/8yYmiTQj1bzEkGSqGQB?=
 =?us-ascii?Q?5JfE3RDKNd+tMIgOCDJnDpa4yFkZP4MwMGM7/0NZmThCIbsw6lrvpegaw2MC?=
 =?us-ascii?Q?zmFrojtvgt/YwFSmZOMyZQgOHQT3SDpLSmBavSmaB+pQrpZCm6k/uSLpOBZU?=
 =?us-ascii?Q?TaVe7poFfBi0zpX2i1WFE6DbQDwxmSUSESmjn1fX/Q7eOoMvUEBNdd/1vXZM?=
 =?us-ascii?Q?lCg85/FJGFBjllLv/7wXqAfI1RPohY05gGCfuX19J/9AMrg/1t+fynX/C+Bn?=
 =?us-ascii?Q?a1t1Ug3bQNW17C6oisOVgmKmkH0Gr7hyCtD5Jb2olu9tTircWLbdr4JYHckc?=
 =?us-ascii?Q?KWQ+/SF5lH0rm4Uhk/quiSANIUe2CKtlitz1x7nFtaW5aNyT5qFwH/C3iu6W?=
 =?us-ascii?Q?DXX/xwGEbnUlFGYM5qxzOHeF+/DAmCOrq6ogDAYe8ojz/T/n3AiTett+UBfm?=
 =?us-ascii?Q?xs6z07Zx2u5SJKbzShDwaV1RfQJhQ+3NQeYiTTFISAPHrvbggAAEp5tk2F3K?=
 =?us-ascii?Q?79OhV8v3AoxIaEOSRlZUFFjRmq8Y+NwsPwABKfF8SjZwrUAqGySLbYlV+dUx?=
 =?us-ascii?Q?CW2TPD9uo16dPYTUq0D5W4KEKH5rO9LVtwUfA42EFcZDsLCFdm6KycrOwqdX?=
 =?us-ascii?Q?tzjVrGiJy8/2CTEVvUgE0pvS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h369IciTlICxREWWm9zFBs1xeuRM/ksbGqk1zrbQnrrHgfAUkL7vR7sRVCEN?=
 =?us-ascii?Q?Fhu1AH60T7wYVNWRgtksioqC6waHpnunC69Jii9mfdgUeVEHGRwVAyumH1jA?=
 =?us-ascii?Q?BEXEYS31OchXbCa7qew8GHOGSpFu5JzHPKXRddnQDwyuUsZq6ZygXqV9Twg+?=
 =?us-ascii?Q?GWypwT6YOxm4PR/tXZY1CZG5nJCdCugzBjB/ClwJcjmD/ZJwXMNRZSLeLNoU?=
 =?us-ascii?Q?vBJk+dfB+quHR7lh+BHLVoW5KEj4RwmZSKU7qfaGqH+asIDjaQc73rB+uetK?=
 =?us-ascii?Q?ov/l991occJ43qeQPb/nhezh4leWjPBx78UqaNQKxK5poIoTvk6mX4DJz/I+?=
 =?us-ascii?Q?uFgxQObaXahisjvWO7cCWndjH8cu5zWhN4nT4vVK5OZdAp17wKoYnKsPLrI/?=
 =?us-ascii?Q?rf0pd0lmtw1bw3kjSE8WmujyBDqc6uH1H3ode/R689cMllK1V4vJcqQ6myRx?=
 =?us-ascii?Q?aZQPpNbxYnwTB24OZpRWjzGgxL716sGqHGQ2t+hHEDDY63iRdzAarKlmm0lR?=
 =?us-ascii?Q?fUo8QmPWLpThaz2WBNUeXixIdo6fcPnDCz6J2+dFWmb37abzimJl7bHFuwXL?=
 =?us-ascii?Q?InLzMjDeUfpm6fIFvbJLU5LXWGjBu4KE+Hi3zzAbNUs3IaVTVF9y/w2bKYBz?=
 =?us-ascii?Q?NMl1ikNg60+6YdDbsHMCtUBEc+xUpRPigtZukuvhBPYxgPEkhKMub9Ii5k+8?=
 =?us-ascii?Q?VyuCSw+17M6OOXAzKc+zBn+Gw9ogZZNXIA6+eB1I6pKE6zvpqub1v88sHjDy?=
 =?us-ascii?Q?DL0LhoUihLYqcoBqyvJZGE0/i3jQzveC5it4P6M8l3gSrblpWFaIo6yqcXa5?=
 =?us-ascii?Q?TftlB19/BvJb/MGsZPJ16DulCIyGHuwT0/UnxRn33dVc7PFnUWN89JWGIJyi?=
 =?us-ascii?Q?KXrFaZwNNH9CXqWmIhAXvqRFSR6ekGmo1oj44FQS8OoHYAiJebgFndgvx3Lo?=
 =?us-ascii?Q?vlCzGqQe63whvPNWn5D/PopUzwXXBwHiJMKpTA0YKH1GTkFdJ09o8dC/eCax?=
 =?us-ascii?Q?/GovK4mYlWK+m5JG+uUpTNEUJgW54JyVfDQebrcwSsSm46uIk4ie0BIJlnwR?=
 =?us-ascii?Q?A0TGqn7VS77p3x8tSbIJUGKc3Z3DbjfyorKjuzWQFkjfUhxQh3LTW5pgpTJp?=
 =?us-ascii?Q?X01/kvQwIAyazffQxt2tlOpECaWs4HxbWR3uFAM3YnmWbrfvOl4mia0bOTb5?=
 =?us-ascii?Q?TvmjxTmPJ8MAyBvDqITrilRK8mX1JxsX8uUAtT8Owt0kuZt3dHWC/Jj9U8QO?=
 =?us-ascii?Q?bHbxaZKGBjKmysfwgbK5WXPpGjoBTndiM9vRCsL8XfDvQGQZBhhwPwtS9iB7?=
 =?us-ascii?Q?a+iGFo7Ay/kkQH0LVKRO6Wjk42ZO4WKI1aPznwTJmGneKsRQFPVALsXydjPf?=
 =?us-ascii?Q?7xoHZYJnb1Mm9BYANxrYF/NAYAYedTLqSBUXcTTWfU6mS+FFBHmhC7Vt0iiq?=
 =?us-ascii?Q?TMW9b9EsN7juQZC8uwvCj+bgpMUyYuAwJyKHaVH4iAdbQAtsx/hu12OH5TDX?=
 =?us-ascii?Q?hyntFl6YS/mOKDH4tfAqySJeAtOTAi/7YUMxiOjB6YUsEZmayq3G3J9gV7lN?=
 =?us-ascii?Q?IsNxV0Dtq88V1OU49r0siDlVPlX3peA5A/z+gJTP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ede0dae9-4f47-4e7e-fcb8-08dcdefcbbfb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 14:00:24.9598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBSSN0oWJKHzHBQKciZbF5GD4xbdCScQeOpNOFL3tn9Ks6Al3dlfUJ5d88TiaLnN3VOrj+VeowGtZzjYkJOCUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7075
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   f0b0dc3daffc9639872f52dc74ce62bd887d3088
commit: 0d33988d0368969323bff070ed0f3331e23a6abb [155/30000] radix-tree: use local locks
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240926/202409261948.3CQPO8jC-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261948.3CQPO8jC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409261948.3CQPO8jC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/radix-tree.c: In function 'set_iter_tags':
   lib/radix-tree.c:1609:22: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
    1609 |         if (tag_long < RADIX_TREE_TAG_LONGS - 1) {
         |                      ^
   In file included from lib/radix-tree.c:41:
   lib/radix-tree.c: At top level:
>> lib/radix-tree.c:90:30: warning: 'radix_tree_preloads_lock' defined but not used [-Wunused-const-variable=]
      90 | static DEFINE_LOCAL_IRQ_LOCK(radix_tree_preloads_lock);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~
   lib/radix-tree.c:235: warning: Function parameter or member 'node' not described in 'radix_tree_find_next_bit'
   lib/radix-tree.c:235: warning: Function parameter or member 'tag' not described in 'radix_tree_find_next_bit'
   lib/radix-tree.c:235: warning: Excess function parameter 'addr' description in 'radix_tree_find_next_bit'
   lib/radix-tree.c:235: warning: Excess function parameter 'size' description in 'radix_tree_find_next_bit'
   lib/radix-tree.c:690: warning: Function parameter or member 'root' not described in 'radix_tree_shrink'
   lib/radix-tree.c:690: warning: Function parameter or member 'update_node' not described in 'radix_tree_shrink'
   lib/radix-tree.c:1251: warning: Function parameter or member 'iter' not described in 'radix_tree_iter_replace'


vim +/radix_tree_preloads_lock +90 lib/radix-tree.c

7ad3d4d85c7af9 Matthew Wilcox            2016-12-16  80  
^1da177e4c3f41 Linus Torvalds            2005-04-16  81  /*
^1da177e4c3f41 Linus Torvalds            2005-04-16  82   * Per-cpu pool of preloaded nodes
^1da177e4c3f41 Linus Torvalds            2005-04-16  83   */
^1da177e4c3f41 Linus Torvalds            2005-04-16  84  struct radix_tree_preload {
2fcd9005cc03ab Matthew Wilcox            2016-05-20  85  	unsigned nr;
1293d5c5f54d51 Matthew Wilcox            2017-01-16  86  	/* nodes->parent points to next preallocated node */
9d2a8da006fcbf Kirill A. Shutemov        2015-06-25  87  	struct radix_tree_node *nodes;
^1da177e4c3f41 Linus Torvalds            2005-04-16  88  };
8cef7d57a4a47e Harvey Harrison           2009-01-06  89  static DEFINE_PER_CPU(struct radix_tree_preload, radix_tree_preloads) = { 0, };
0d33988d036896 Sebastian Andrzej Siewior 2017-01-25 @90  static DEFINE_LOCAL_IRQ_LOCK(radix_tree_preloads_lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  91  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

