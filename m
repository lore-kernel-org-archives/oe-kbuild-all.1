Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA73B2877DE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 01:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781313423; cv=fail; b=a33QkYVTV+GE7JoBiA24DC8uyjX7D2RVQPnMEUA/RsX6xmmcgT7pEtkbhmx5hhYT2vYctVIeWhfRkEZELq+doBJcA9grxMaPTie2MTvbn4GIqgyeHSTIwjP9J5b46pOFWjhwkowKZNBUZo9Hrsqkw3KgVfRRkR8aVrCxJRfWzN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781313423; c=relaxed/simple;
	bh=3JeH2AZBTu1kZ4TrN9ihIU0bOgjNqBZyWsQlXyErwYk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hwWBlef7TLlJsl3y9adaZqBPcm8fHIXKwNMiADw3sgS1G5VMeU5QmxvuJxHCfmuKFo6/YPSTnO1ml+MSS3Lv5ypJ/K1jZ3BwBgj7ZXeoVDRqRqm9TvVSRmmB+bcppvkaSuoTrf9UPziJXpiNnphrqrnaiN2X1Q1AgyPZfQ3nd5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyuvvwdE; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyuvvwdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781313410; x=1812849410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3JeH2AZBTu1kZ4TrN9ihIU0bOgjNqBZyWsQlXyErwYk=;
  b=kyuvvwdEpDx8SHraIm65esuDytu+4CnBZLJ2NYwl6HtlzWFZdlOK8EFE
   nJ8xEuC4qELDEakJIUEbjyTzGAIkUIJzEm7OVeEfDm7tGGi+amBZ6Kxhg
   zlvTpf3qGzHR3hVOOP8+AVrZCyPcIIW34ftczRk6+Da9LU9KVbNGMhFZb
   Amz8iQfL7SZGtrS0fYayKytbCsjh8EWkO38j8Q54BtKIr/xuFc7jzPyW1
   SxV8P2bsb66fJJzkY9rXoUjUdlucSLgIGhgvKdRrtXdvvpB2SwrLOQBuq
   1FmaNmCdFyQOdCTOz+SuTLhmnnODs+fwRRZcEdaeGBPvJ35g2TwdhkSjT
   g==;
X-CSE-ConnectionGUID: HEBGKP1RR8Sir1rxRYw8Dg==
X-CSE-MsgGUID: 5DyTImLzQfGx1Wm0bfwm+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85996535"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="85996535"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 18:16:50 -0700
X-CSE-ConnectionGUID: gmfE9WrhRSSU/XWfMv90cw==
X-CSE-MsgGUID: n6GfHjX2TvCd4bw910l9Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="270633392"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 18:16:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 18:16:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 18:16:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 18:16:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiyRON6jQSQgmKikjGgBP+FklAXhP67TCxVGv0ewGAHcvWrRnA9M5v2ygOfyahk6b7rVre7qo41AwCDWOY5V/sOapdCB0rcGEKs0/o3Wmkaj8/iThLGvZaP/FjtTyG5kkUyhxlV5FbgaLZ9Fow25YMqcRE6hUXMjlOJxaj9qXYmYx8Ouv6UEPNXXU5vn/WYpraoX4vUeV6B90iZDa3uiiNELgTzAe26aNfeI0pBMnIZR9kUEVTcmpqHfvAjbEz2YVTOHb/y3rKMhgNB4qLAObDI1IDQHHD3CuncEe10vXro9nGn1rLuIUSu1G2TwSJLel5tI6DcSTawNeRoMeTi2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0luNcXS2Cblt6VWpYbuul8wCEHYocrC1TCFdbFYrArE=;
 b=whFUPCmKpAAMKoQODb7H1x4f2vrFAMp+4rYYFZhS7NGAxEUFoSxH85nJE2rY/m6WOLfdpb1KWSTaDPjBUJM/zUGqv3/mZumwViZnibMhWk4Vm+pInnPCHzysHR4GDKo40WrakPl7zClHurjrTcWoXRCwlVtmkLFv885vh4ZHeixN2Xx1a0XibSbgguahViDuUVZW/FSaiyG25WUW4pTicfw8QueQYtPFTpnjx8pLA42MojvorVfJ8LCJaGTnGr4NmkGlDbM6tktNGRDP4DuupHF/ZCkdAwZcbgNawPRkaAilgk3jNafE3806S7pSNwiiMngV88SCek//m/mvZO2sUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3493.namprd11.prod.outlook.com (2603:10b6:a03:81::16)
 by CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Sat, 13 Jun
 2026 01:16:46 +0000
Received: from BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259]) by BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259%5]) with mapi id 15.21.0092.011; Sat, 13 Jun 2026
 01:16:45 +0000
Date: Sat, 13 Jun 2026 09:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Moelius <sam.moelius@trailofbits.com>
CC: <oe-kbuild-all@lists.linux.dev>, Andrew Morton
	<akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [linux-next:master 12966/13336]
 ../../../lib/interval_tree_test.c:315:17: error: implicit declaration of
 function 'pr_warn'
Message-ID: <aiyvdAugnSzVlm+6@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0085.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::25) To BYAPR11MB3493.namprd11.prod.outlook.com
 (2603:10b6:a03:81::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3493:EE_|CH3PR11MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2bd48a-9919-474e-b86a-08dec8e96f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|3023799007|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: JozIwoHIwpQeXh4cOY7kuxxQImjN3Z7vJEgoe8vwl7xYtAm9jI3Hep3RGK4UYTzewRIJ1XdCZoY3mn8l+QicdovQHa5mvBLEYJj3wT4V2/jLPq2j0Yky9uaJXkIosFIbmqol3U7Lh+LbSvR1/TfNbT1d7Ne8szAvCs037Oyw6+zcPDiCccZKqGbfpi3tA1fhMwgvAL9oiMv+Q5Xb0ep0wu1KZMq0lQuZgZvCvqiD6QeEelRaAAIrUMCmZB01si3430W6+I68KJqk/6FKmH1R/AUNMxHBvGu1JPOd+IpD6y2ROAXh21THwdklYfzcMbx44Tc7vDUQ8yg10sqD6WJNWJ53EElWlZuz0IrBOk7N3rk2lX9cxOATrdsF/sZ2IXzozEXrgpZ1nrRVIgr7qC31PKxLqzrOlIVv2KanLJR2Z43yePD8Zw4VvNqRbDG5vVG//tHFMYfWKvFWDwEd58Fem3bWmottxyyP269428dUcz1SHZhABsOfXFzBtCRCrmHNYENJzKIMIp/NfAneKU4LJZcHyboCkMACJQE+JjWJN2dwTqKattuaDcZS5WoFlE0p/3bTSAdRZZLQMzPh/zmZL47DMgLIb2gCvd/NWc5294Pg8EaoK3XqvbfnayC+2vwvSSJG7Ow9HJFOaBtveTa/n2NELT7yHwAxVNjQcg+E4TmUYR+8YvZyWWEXO6a2P9r9E6cVH94oF2KdR77ZdETlGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3493.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p96iFZxJ8v30OTP4gfaPLNPSozcECYKWZBsYqSr00ny7qW5WA40nQYpMuM1L?=
 =?us-ascii?Q?5h6KSapoS2ysJeqb+xHgOutEj+iU8bT40BR78Ez/xnp2cptEEH80yHVWx69n?=
 =?us-ascii?Q?2Czha5RE4X85UYYQz/Xe7u3MpKuRBRbA0QhQuSKtdnnUP7AyZEkTiIkz4Cw4?=
 =?us-ascii?Q?dnOArqksMN8T5eF68GMpkxftP5ssn8RJthUGaDK63+QoEKZZdeWa17pVjHJ2?=
 =?us-ascii?Q?WSUneDz5wO65cwMZNJpwBO/U40dBawNSP6QOsHo4qO4XYlqHsDBdED206lI/?=
 =?us-ascii?Q?d4Fv/HgWzieTiq7SwYreXMcckc7RRvynhglLK0stPXAZR+llTgc6ZjfQNbbq?=
 =?us-ascii?Q?2xjQ8F3pUFeNiXWwGCUU/EDvvxQrpAi4puyNqQqGbONnCO92rK9UXLvUPpiW?=
 =?us-ascii?Q?MG+Xia8VlznsaDXzyAxaOu8/SAABbFufkkMwCoH9/kEcxSDRb+RY3+oDWgJm?=
 =?us-ascii?Q?J/amnN/5GOVwyzfs+MGFfdKAbZvYhbzvMW9FW68dXCI1UaYMnh7U9Mr64inz?=
 =?us-ascii?Q?oQ7irIin5gDG/vK4jyI6KsaNtj1CcvdVXRnxlXtFiiXljO1Vl6EofEk2RgBT?=
 =?us-ascii?Q?O3JwMHULTphB0M3PIAGZ0mCR9I4ej7XaVk95tWYECVAsMySbg4OQj3UYUxpc?=
 =?us-ascii?Q?7ToUN8AkhBMMzx4Xudx63qu+DX6wgJgoaT4xhNXnWlWksRF3CMMZK0nqVBwe?=
 =?us-ascii?Q?bI55QCRfQ9ghjQCPOuYxLzHnWf/lfVDOjgr3T+TJFncYsT3T/DygdX4N28qR?=
 =?us-ascii?Q?MTjZonGM80Jq9fypHkTp6YoVuIq9x7Jhcm2/PHdmaRQbYInAV/y7WiFE9zWK?=
 =?us-ascii?Q?1kUr9CmDLUjiDZyiBKiES6aCJFsap50S/5KHBh9W7y8FS03sc7WVHq/kH7bM?=
 =?us-ascii?Q?EtRrTVLktLBZoyYNnO3TdhNhdvKfsm/hN244rXfcCT0O/rTHyyaUAP+Pwusw?=
 =?us-ascii?Q?/zCnV96vf3dXX5ohyUulADH4ZTKCxEGDT3jSgqBaGIJoIT0WL/Vt1ieldyzD?=
 =?us-ascii?Q?nNa60Qt09WRzC0na6MqVL6uJ9xYCPCsyuSXF5QD+yMvQU8Rg5CllTONC0osP?=
 =?us-ascii?Q?9k74HmwEZ2vo7HNuSAFkyvlKl5w3WAC48RmOd+OzYNswcQIW7AEd4RIJRiOP?=
 =?us-ascii?Q?JIEUbzYsDzbN3M2QYuw1P8rXTQUlbzl0AyqLXdGeHLmkmKHfmIliWegsW0iW?=
 =?us-ascii?Q?lizlef9b0St+8vTp0Wprci2GOGRzGLsVumk9VEs7U/jjFTrjZdpKP01BNq1q?=
 =?us-ascii?Q?RDSPM5taYmXZTqhoIKX4qmG2CVgcf0ZPD4F2UgdosVt3mCXw+g6yLi2jJpCz?=
 =?us-ascii?Q?7v+nuXJ2lzCaa9aeXzW770RxcUWEXns0h11VEMPmxVk3Q1FI6/3acJdwLwIC?=
 =?us-ascii?Q?cxzLnhNDLHa45MlHxWCjSTfMNYmAyEuxsSfoVcevtst8+hCmyYdfG+kgfhO3?=
 =?us-ascii?Q?XcQ+ElK8pgj9GQvNUm9ub3xchmNVlNpC81B3q/gBeTtoavCnykNgzs96gBih?=
 =?us-ascii?Q?nvPnZtn4RkzUsHgmUxFf7CXzhZfi4hmOuRSW5Lo9s3nGrXRxBX/bK4Sy/xem?=
 =?us-ascii?Q?R/tVXSAIpHQHSes2y2OrKbHpX4gwJ68bGS8pn5lvKQLPlZhUVYxWbivNOqsn?=
 =?us-ascii?Q?HE0iu3RvwdVTsCEcFyqm9dDQVM7oksuO5XQs8mP0AH/uId5wuc1rqaDn/2Fu?=
 =?us-ascii?Q?mcPLYpMvkpSJkM9ImwhbuZHIC42AsG2U5oj7q9BLNW7fh/+TohMsj7U5rCJ1?=
 =?us-ascii?Q?/qVMsX4BoA=3D=3D?=
X-Exchange-RoutingPolicyChecked: TiHzsAh+rgekT1RFPB9UpHRnz3xFfj7FcTEJVRY/JWS6Xs2jCJWlzoMvn4DU+YEwE8VNCb+IhjKWhFJ3+mA0nq/M1KAIOWmDx2Murg2mHkdpF7dLmlyB/ZmUTIF3i972Pp49OxDKwDk/IM1cwsShQFmqypNMPjHt1gt8j5XqyT0ecblgCD33ltYavo8dxxzZ0mbnzLx0hLSq+5Dsvo6+eGvYV9YmxxXzwiDLdbilEqKhkzcFWH2y2kyjcCfkMoIVP0nvOpDyUQN39ELEyzMlYx6hf8ujtzI0bjdqfOscmXpvTYMNIPAWcaYWNNXHyiHn02yG2B6lfzKqnQXS93FPDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2bd48a-9919-474e-b86a-08dec8e96f26
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3493.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 01:16:45.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFNZGn97YWfK3Cmqm4B6e+SkpwJK42NImEleBowriLR/GFViAatjOhqfNgJt372W1BsmG7/iXKVJ8+kUyJXjkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: da58d4edb02fe347b676a3be230fd16da68c4fc8 [12966/13336] lib: interval_tree_test: validate benchmark parameters
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260612/202606122249.neYsYssG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122249.neYsYssG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606122249.neYsYssG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from interval_tree_test.c:11:
   ../../../lib/interval_tree_test.c: In function 'interval_tree_test_init':
>> ../../../lib/interval_tree_test.c:315:17: error: implicit declaration of function 'pr_warn' [-Wimplicit-function-declaration]
     315 |                 pr_warn("nnodes must be positive\n");
         |                 ^~~~~~~
   ../../../lib/interval_tree_test.c:335:17: error: implicit declaration of function 'kmalloc_objs'; did you mean 'kzalloc_obj'? [-Wimplicit-function-declaration]
     335 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
         |                 ^~~~~~~~~~~~
         |                 kzalloc_obj
   ../../../lib/interval_tree_test.c:335:30: error: expected expression before 'struct'
     335 |         nodes = kmalloc_objs(struct interval_tree_node, nnodes);
         |                              ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

