Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36DF3FFD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 03:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764040242; cv=fail; b=NUurD5NPh7IcwjwTlu9eW3dBNuv7g4sgGS5LHP9j+qd2VPIOjBp8o5XKJi4sZD//JNURd16cS3+MAiGjj4tGdimDl+CUW737PFGRnR5BMvV51eJsKbkIAdWAP0YVPtzd8pk9df8KidYlTdum6HtjyTod/MWOPjYd1UVBwz6MrrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764040242; c=relaxed/simple;
	bh=7KJmfmZTQxCIsD5i4/nGAvB2sW0taOn6ceoXW+DVFk8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=cvv5EvGExnq5zbjtnYfWYVY4VhjzkLTfEUD80wYQEMWK1zaYDr6+Sfqgrw8Umy6gEa3iuJGliNcSLsXMXs4yrhHTrg9oWlGhakJ+4YyHNVyOgTSkdD3ktttEN76faIMCIWUpqiDQByphnSRnnMyH0U9ne63x1sT9xEW/pksxB1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vfngb6ZI; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vfngb6ZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764040241; x=1795576241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7KJmfmZTQxCIsD5i4/nGAvB2sW0taOn6ceoXW+DVFk8=;
  b=Vfngb6ZIWYPyjUhoW3qF5XFK08F7Y2D49fWP1I5BsuMcMrAl4m9ZO5aC
   thAwCHiRGftTlfisjceyK84PSgdRYIzk+rUvKMifptIq8oQa9JQxVkypY
   abNFHjp9p9nyy8nH24P7HiI+SNzmyXAqCztPADFHTqphm0DQmPfMeFEVI
   7ax2+Gl8+wNzP1ISMwjVWFf8eawyCVCbze8s7odpMTox0P5kwtqnFqlj0
   wagry9azzD3tW4hKx5XaImpjCmSeUk5BWeW0CyXnpIFhEXc/LXDAEHIY7
   VW5TaElhyyRZ/jG5UyKzP9T+TgymhdCDCR1jQKr/o7kyuQ3ai8LccsGIu
   g==;
X-CSE-ConnectionGUID: ttLTZ48+QTyt44Qr/en7iw==
X-CSE-MsgGUID: b8ko0TGoSz6J+1GjF3AJPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83444519"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="83444519"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 19:10:40 -0800
X-CSE-ConnectionGUID: AAR01ZSHSZmi6SyRB449QA==
X-CSE-MsgGUID: k2aeDKd3QAO7NR+C06ahPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192161630"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 19:10:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 19:10:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 19:10:39 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 19:10:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNahFS3/iFvZN+TdXnOk7Wbsi4B8WPrR0JwqujNPtYcb7D5Q/VMLPWOcMwcTctbU3By/CSh7kpO68RaA+dQt02tOx9S44WwnXEGvI+xRMTbFxOjV7Q8WbkqMxPasCc+rLElCrhGJrTH2ckSuuuxF8lH2cuyY61Has/ecKBD8kCaou2uKXLcuXLs/KDSubFYkhn2RLqJ/3sryX9jCutbhRA89Wd3eKTL2JizFe+ijYzOmcSiROy/kNlnpj8sYoE6c5fOlMwc7VleKVgdIGBlOGvkfIigwNDcmc8zWH37unxiTfu9n8yQpoHt7/ziglkRcd1oIM4YKdXbIVjbZLfY5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37d0nluuKwd32QOBhK/zw4fYQ3ixqmatoXQ8mwez7Ew=;
 b=iKUlya+r8E0bHJeu5MT1E+9KB11c8VE60On7ztA4kcSPoW5b1lg1fq+u0JfT6huaEesiRxsEvHTwwDoOP7NBpEyEKE/rogj7/x6iZHRSHh4PmBGYSL1jOCNtqIGDewgOSSqWe0W8kSYMlQL4i2z7ydBetK7hGKQdWVPlgK4C0swCQwobnJV9BgSb0ctoTVEuDKMUU9g2bTUxMysoKW+bT+6B3BBvGxTQHDcwrJAxPRXTolgDmOUSFM9zsDvvvK5BGvI32mNbj4bv0c9R+XIFZNbhug5lyp2jtHo9toowyID/gvyO2fCz9rQZ8gwEBF3kNfW7gMLvCAcSMevTtwpl1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB7895.namprd11.prod.outlook.com (2603:10b6:610:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 02:26:34 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 02:26:34 +0000
Date: Tue, 25 Nov 2025 10:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android12-5.4 5/5] mm/memory.c:1807:22: warning:
 variable 'mapped_pte' set but not used
Message-ID: <aSUT0pNEdzYlL6FX@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CH3PR11MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a178e1-1fba-43a3-81b5-08de2bca0d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kNRoYsWUshob01ugfT3dvNM+KU62NVH2l9Bb3U/Lc0fE6cKF61g+trgoEWla?=
 =?us-ascii?Q?3vPZEobKXKAJbkwecgSf8444gi7yMefzHMce0isyaLGOzrcYq08vlsW4W9Yy?=
 =?us-ascii?Q?aWeYa+wBvI4o5LvlOj5h0W+n0Wog1IkKcH1FIOO691kOQBEqKOfM64N3GLWM?=
 =?us-ascii?Q?OB3SdFGxKzRvaMDVJiPloH9F5z30gtoG1M0rH4Gi9CZrCs2wXBhYwcLQj6Qn?=
 =?us-ascii?Q?QxyvAYW9wQIduRSuOUpzutZhkRQmPrUcewqFYJQHf+NRjDkErCYmpDXdfZLP?=
 =?us-ascii?Q?+5obxki16yEr0mEIO2AXCzrOJdbnfZEgdL8+bA+yDUX4ZGZdAQHHxBNUFU5q?=
 =?us-ascii?Q?clQfXc9n/UQUti85JfIuXJk3QBonJQA8I22tyZK5P++MsosCl56mo5vVn/dt?=
 =?us-ascii?Q?Y6ZCKtK/x3paOWjqKFZgRqewmHhvzu0rqTtif2oFhqutj2s9iVOmEdpwjory?=
 =?us-ascii?Q?NBCzZSvkF3SEAPYD4wl6ceswNxnPRn2pBOfqd9LGYRMDKlm01FH0YTp5IRmB?=
 =?us-ascii?Q?0k6qYwPGTKU1ZF80JBBJO6FtnJ7PVXYxpnmto4XjWhYnhAfggletxmCpnP6M?=
 =?us-ascii?Q?NR7YkY6mU2jer/TQhneiywu3htSxvZz2qYj0l2E40xCXHIkX0VPLNe/pa5y4?=
 =?us-ascii?Q?irgTYRpyNqiaGZkDmkTzxRXdL4PzpjPhCvzxHIacRLk5NIdxVDgIGnvRuFFM?=
 =?us-ascii?Q?sI286FeYq+oovQOc/2F/YBhasZ0d0WHQtp3TVE3VMpZz8wASVsNjEgygAwqn?=
 =?us-ascii?Q?yE3JNms8pdIOYeVbtNRzw4VCO2L2GYQMV8REwIFgyccHM6GyTpjaxgdyVBdz?=
 =?us-ascii?Q?qkAF17R1v++Sx9IuWQxa3CLeLL2HJaWnjwlQjq3qrePI8RgrE/bC2dwJSYBV?=
 =?us-ascii?Q?hr93V829EahuTyDQ49m7ee0/hfQeU1uV6PVmuc44Hipd8uLTf3nEa71nZgzy?=
 =?us-ascii?Q?aUfWn7TOyXZPGu+0+JUVuEX5o6DzISROgGZn4dfA6Oyg8cRHR2tBrHU4NZbL?=
 =?us-ascii?Q?XhUOLemXiuVqQUR8ZUE+rJVeN3l4JtmIykXmAMD+Vr3tR0nGr8cml4iBTjUS?=
 =?us-ascii?Q?dz8AbMGH3et1o2zyzzRjl6++6Sd2tJ0BQmxJUU44iqRMbd6co+Ii6hwW96Z2?=
 =?us-ascii?Q?rGVqvSNtRQeePorhaECzBHhLdeV4QqKNNr3eVH/DuglEf2ttcMXQjY5L+tsq?=
 =?us-ascii?Q?GlUvzKwzJSbWgejmlJIOA9lrOpnpDHqnYuLfpkvAtoh+gijjRjtMowbIr2NS?=
 =?us-ascii?Q?MubM+mCgHM2N4u7HGdaILCHSaF3KWM+0HRvxNo6ZbU0CXm9srr8FRqKpaQUh?=
 =?us-ascii?Q?G83OC/xZvRwRGXzcbdETKMSL+CyieNS03NJ2eYjz2dvMnMgVethOnS9cIvVP?=
 =?us-ascii?Q?ifr/OwkOn7f+tAVCIaeDvaMZPdHvnyaga4C/azu/L5Yplmg37BdazqpZpM4+?=
 =?us-ascii?Q?9DADq0IJteqKgEgRoU7foiGRM5P/Bw98YYA0HfUZ7kSH6oPvL2tF+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OodgF1LrBytX8lNt5NUoFFEoB1dhE/iNL8ATvXlJgRfxN6/CvNSLTsYaTndG?=
 =?us-ascii?Q?aqtcQG2T4+BCeCLiyMCnsVP3sJUPLy8ynHfojOM78LI5HliuTwpKxp88bHzB?=
 =?us-ascii?Q?0ecA8go8bZRNSCtZvcrwwIwaAckHBwjRjhLwTTC+W9dnzOTbUuCtAFUu15UK?=
 =?us-ascii?Q?i7MtUes5siAEyXyx3h1UKX/F2pMqVnF+/JiZpDFUBBkRiReIZj3IfFnTNBiK?=
 =?us-ascii?Q?PqP7r9z52+cpsa/9lvmqGwTOHk87mpeSn2FkQyr0q2Dqan29or/2X5OyXAoy?=
 =?us-ascii?Q?kJrU8Ze4No4hLZxAfaBd3P1g0nakyr2gH5pPkrR4xQacrxWgKNHT+1n7O+YX?=
 =?us-ascii?Q?hd2AxCpXnMMU9ZophX0ZuwJtUR6oUzqJtiLfJmokeZ54sgR7NLUqB7vRBQ3g?=
 =?us-ascii?Q?7jU1BFABOoHBgcsirXd7hBV/3b69+wGBE/dWJ2s13Q88ARDvCYAL+hPaEdo7?=
 =?us-ascii?Q?kHnNMovr0sy15hra2XNb9Hen81LKTXnL3AeopflkPNmvYX4Rt7jFjFChtKsL?=
 =?us-ascii?Q?ctmI/OImRRN0xUsnzNzt3a3tlL/b+2wkKrpEGInWW6FTO86cqSvGvbuinlYF?=
 =?us-ascii?Q?PQbedGzfjS8Z1oHVywcZ8fNp+UlNZUaYsgVsguQOKaUGayMIx8ArGV2uD8A/?=
 =?us-ascii?Q?ilPVIC9htK4nEWvXVmxu1q4dhRtXF4ziBMHSdw+Z0/aDTbCmSdOWJxucW2Qk?=
 =?us-ascii?Q?wqyegI2ps3f6fU2PfsR63iZxcnUCa6hZPUCm8FH0hIQlCaIU9T86F3/1McFY?=
 =?us-ascii?Q?IPQO019l0tVJT3Zl0V9HpmKoFD3s17Xtza9F5YNV4gvPjjsyNRYXJaroVYi4?=
 =?us-ascii?Q?gEi1XcOvVV3jANWstTYpjmi0YYFrvNuu7Jb0H8Pk/ZZSs0qihtxfAEuogwcD?=
 =?us-ascii?Q?ObinUGGwnu5YDpi8kOQezDwNbPNh0SQhkKC1XkeTaCDpOviMEeMEf6QsYlQM?=
 =?us-ascii?Q?EasF+FUlGmx3DEW/J9GGi0zKkvjN/fGTVq/THvgHYhXLahM1aTSVOrf/OMVL?=
 =?us-ascii?Q?lKOBDbGSebR6Qjo+WPyQIIGOAaisBzj7Xl0BfkI3JnWD7mC/NDWH2PWz1w9n?=
 =?us-ascii?Q?jemI1hMK0hw6mYeRMexvESTxIeh7lYk194csKRJjJbnaEaq6firWkCag/uQe?=
 =?us-ascii?Q?hwsDyKPozSHCQXbQNAB52Ax6Y9pqKthsmL6wxAHabr5f58DeSkMndg5qD/St?=
 =?us-ascii?Q?zAIStDUBggyQ2FBNf7HLQ6gPVmBCG7ELOPmAdRjGMcNlsJArH8T7Ttet2UlL?=
 =?us-ascii?Q?LviJ+VKA19LBOwGiGA3Xvbt/z01GHYTv56Pmd1I9bogf5Kdxih4yoofhPkIi?=
 =?us-ascii?Q?sJR2gT/N3pnZJnaAeFjIaAR4UhvYz0dzsBmqEhFebD+j5p8aBCGqM3CLKMm6?=
 =?us-ascii?Q?jX+Oq3WDIHISz+3tjtpvc1qjD8XknnohomQuxwbqgD1NLq9bp78tX47gxrux?=
 =?us-ascii?Q?+fFCWJRCN52PnKPmeirzmZtr+I/YRoANc73phkUdCwuoGli43TKr3JsyKcDj?=
 =?us-ascii?Q?OUQRVvKx4DEIIkmmS7BxtLzDiBIWHdRAFgNmZ01QIf1vaRnlUikvUtJgpyb4?=
 =?us-ascii?Q?omxAUzpixHOZcgv3sreegsecZnQFyS/GhJ/Friab?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a178e1-1fba-43a3-81b5-08de2bca0d90
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 02:26:34.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDg0NlrYXhMIEwB1J+EBIsjiBmuwYEtCdCUYOMkEFrBEK/l3E5lgQuHuYjGFxDylIheyA8gBZdLbCwqVybmpsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7895
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: 67a982ee20d20e112f15eff98592a718de7c652e [5/5] mm/memory.c: fix potential pte_unmap_unlock pte error
:::::: branch date: 14 hours ago
:::::: commit date: 4 years, 9 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251125/202511250100.9VNeAX9M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250100.9VNeAX9M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511250100.9VNeAX9M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'copy_pte_range':
   mm/memory.c:800:31: warning: variable 'orig_dst_pte' set but not used [-Wunused-but-set-variable]
     800 |         pte_t *orig_src_pte, *orig_dst_pte;
         |                               ^~~~~~~~~~~~
   mm/memory.c:800:16: warning: variable 'orig_src_pte' set but not used [-Wunused-but-set-variable]
     800 |         pte_t *orig_src_pte, *orig_dst_pte;
         |                ^~~~~~~~~~~~
   mm/memory.c: In function 'remap_pte_range':
>> mm/memory.c:1807:22: warning: variable 'mapped_pte' set but not used [-Wunused-but-set-variable]
    1807 |         pte_t *pte, *mapped_pte;
         |                      ^~~~~~~~~~


vim +/mapped_pte +1807 mm/memory.c

b2770da6425406 Ross Zwisler   2017-09-06  1797  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1798  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  1799   * maps a range of physical memory into the requested pages. the old
^1da177e4c3f41 Linus Torvalds 2005-04-16  1800   * mappings are removed. any references to nonexistent pages results
^1da177e4c3f41 Linus Torvalds 2005-04-16  1801   * in null mappings (currently treated as "copy-on-access")
^1da177e4c3f41 Linus Torvalds 2005-04-16  1802   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1803  static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
^1da177e4c3f41 Linus Torvalds 2005-04-16  1804  			unsigned long addr, unsigned long end,
^1da177e4c3f41 Linus Torvalds 2005-04-16  1805  			unsigned long pfn, pgprot_t prot)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1806  {
67a982ee20d20e Miaohe Lin     2021-02-24 @1807  	pte_t *pte, *mapped_pte;
c74df32c724a16 Hugh Dickins   2005-10-29  1808  	spinlock_t *ptl;
42e4089c789072 Andi Kleen     2018-06-13  1809  	int err = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1810  
67a982ee20d20e Miaohe Lin     2021-02-24  1811  	mapped_pte = pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1812  	if (!pte)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1813  		return -ENOMEM;
6606c3e0da5360 Zachary Amsden 2006-09-30  1814  	arch_enter_lazy_mmu_mode();
^1da177e4c3f41 Linus Torvalds 2005-04-16  1815  	do {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1816  		BUG_ON(!pte_none(*pte));
42e4089c789072 Andi Kleen     2018-06-13  1817  		if (!pfn_modify_allowed(pfn, prot)) {
42e4089c789072 Andi Kleen     2018-06-13  1818  			err = -EACCES;
42e4089c789072 Andi Kleen     2018-06-13  1819  			break;
42e4089c789072 Andi Kleen     2018-06-13  1820  		}
7e675137a8e1a4 Nick Piggin    2008-04-28  1821  		set_pte_at(mm, addr, pte, pte_mkspecial(pfn_pte(pfn, prot)));
^1da177e4c3f41 Linus Torvalds 2005-04-16  1822  		pfn++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1823  	} while (pte++, addr += PAGE_SIZE, addr != end);
6606c3e0da5360 Zachary Amsden 2006-09-30  1824  	arch_leave_lazy_mmu_mode();
67a982ee20d20e Miaohe Lin     2021-02-24  1825  	pte_unmap_unlock(mapped_pte, ptl);
42e4089c789072 Andi Kleen     2018-06-13  1826  	return err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1827  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1828  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

