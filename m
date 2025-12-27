Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1711C5D44
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 07:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766821666; cv=fail; b=njBFAxOPZdJFz8aWQRMzswKsLNxdndbfmB8rFUC1tfiovmZGTlv92OWm9NE6etFHtmIVIknBAbhuliTblz7cFhsgzGKqm7eOy9rnbVhL4GhNQ+ZulTnjLhAw1mJsshR72XSGeqZzszC/sChtAQ6mJsIe4oNAE8J6K0OPVXo2kp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766821666; c=relaxed/simple;
	bh=EZLwIW7gh2ouV67Vb9TTh05cvhMW/fo/edy/g6C08PI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=lT2siCveYhL44qV3On+5898fbHJHh2erfIrsHsnP34J0A+6Kro1nv4GrOPAkLeX4N0oKB6W1jfEaKMKdAamQg5gNPxDOAsYZy8vcq7HlFXzdfxxfdxki6SYevQ4HagYeGApswZqJoGa9DCk7wugdyICFfn3I5hvpkjdVj/l6c7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rk0Q5ZxG; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rk0Q5ZxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766821665; x=1798357665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZLwIW7gh2ouV67Vb9TTh05cvhMW/fo/edy/g6C08PI=;
  b=Rk0Q5ZxGM6q1gqYb71TC3BzZmx2+cAyzgZVqHfiXroF54TsUdLg6so3t
   A2PIuSM6Xd/z2QaGv1tfQmKy670+jX71RJ43r9VytwTWqUEoX/5s13uKo
   zaacbIKWG1qBup0ACM0zPDHNcIaM1ILmDUZ/nXAplV8NLtJ5SuX4kGSdd
   UBgxWmzibNBzdh1HrFG+MWMgpIWEJSfAvB10UvozkYHmfEFlK/fHBOygK
   /VuQgWVJZssscrKLfGnN9fu+FkE0xbp/+Y3z0ZPPhUXlnSKWqApsl7bj2
   bw5LC5D0pzZCVuwNHVj2VcjyxYLrXMe1iqw51Y7rRIUbg5yz0tS7mEocO
   g==;
X-CSE-ConnectionGUID: W3u5NIXnRUmW6QjoZJu8IQ==
X-CSE-MsgGUID: Q06WQSRWTsyW1feOB1oYFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68577876"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68577876"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 23:47:44 -0800
X-CSE-ConnectionGUID: a67cozg8RCiL0iMekbPclQ==
X-CSE-MsgGUID: IcQjM0HOSU6hDXFNYSjLgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200433120"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 23:47:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Dec 2025 23:47:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 26 Dec 2025 23:47:43 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Dec 2025 23:47:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MO/4IoUHPfNwzYxOt7uZ5HzsMR/YI12X2PTJWIZR/1KP4qJ2BJ5E9ltWavyhRWLGTMeCDNaG4dRjHvSWDjecYK7fAX0Q3Y1l6P9OCdyJCLKIDUjZLXJYQy+0dThdK1ojW/h4067rlJE3DH+U7PKRXPGWTAj1fdrHrhma1g+Aoyx2U3Ous4r2GfxnZfabQgiVVlZIsduxiCmdfO3V6XJUq3rdc7JDhUJwcKIxX4IJxhS1JEWof2E6CkDYKcmxD3RTltZG3n3+MUgqYdf2s60TQKdCjJNKxSOZJg9mIgzpWFUtAxtGp+MZ47AW9RtiXnA1hiHwfUqZKNhLdhP74bEmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/Tv3t+N13LG6Llgkv2Kp4jO7zioRWzTBXfJh5f4Vec=;
 b=hzcw4Tv0ro4aK2fY0H8acRaaXcLYu05emvcbrloFTyM/zqip5u1/CGqZooxf6IrqkaKA0lc48vuWQ60SR3UX2qcjGUcm9EstSjN/0Et+POjEy9rLgb3n0edy8PBarSDPQ/NA7WKIGQ+ZaOC6fB+0nfeHMwzhue1GJlceGGl6I14pc6tE8xN0PfzOhZOnT48+bOr6aSX38SZtjwzJu9QNmWMgXOknnyXaKy6G4SoJMteK6vhjWF+P0aWIRJjo184i4c1kLMlHUkMdn6h94m9xLGU+Ay2oVhoKxXHtIP+xyAcJ849LbqLeH2wLDwsW8tX5RTYL+R7VdLLd3Cn4ye85Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by PH3PPF740777B0C.namprd11.prod.outlook.com (2603:10b6:518:1::d2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.13; Sat, 27 Dec
 2025 07:47:40 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9456.008; Sat, 27 Dec 2025
 07:47:34 +0000
Date: Sat, 27 Dec 2025 15:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chao:feature/lock_trace 11/11] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'to'
Message-ID: <aU+PDz9q2zoNbsng@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|PH3PPF740777B0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 02731a88-fca6-4ae8-e8b4-08de451c3253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1huhUo4pE11QJNxxxPbVhIQ7HW3y20qpYQiL0ofcxQEmtgqcFco1W13mLmoQ?=
 =?us-ascii?Q?KQwfZyeF8OP9UZuOBzp58VbbBY/Nlbes15fotO11v3+bhrf5fhYRQkTnN/Ve?=
 =?us-ascii?Q?ero+cdUYedj86ZJa9Lphc2Ix1QZkRJWjG6UjsFA1Uh3osonR0Zb3HXvuzPra?=
 =?us-ascii?Q?F9RP0D/75aIShvXoafiiSP6DV6Yr7Dc7qjKmg0T7m8SWHhOZNe8W9RyLxj84?=
 =?us-ascii?Q?vg+JIV9hW38VzEdYGbnp/cXWU929kte4aGV08yFzp6jT+yBmpxZUC+KJyJIc?=
 =?us-ascii?Q?NcA+rNZjYGFpH33YTR9ulTON1fxH4sbEqzNqOIbWwVHTGOlEtnr6+EEur9Q3?=
 =?us-ascii?Q?NgmDclxHBWLnAd9XB7WXURvxpNAPGGOZ13gVg5tVIoGdNvPW+1UtRUJLRNHb?=
 =?us-ascii?Q?slGhs4959l4CAS5vdebjGmAFnEev/nZotOhruWSUNdAcqYWYt54f0t9kmiUp?=
 =?us-ascii?Q?8qiKORyJN+UShzEOy6+8ih7sDBsUdR68W8BPgYmuI73gqMjNaOdOr+I6Z9lW?=
 =?us-ascii?Q?2AB7PYPJ48zrdX5SEOQ0MAdDHPTyYCxCwPfOW3xUKF2s6ICk18CeTOc8tB6x?=
 =?us-ascii?Q?wLTODbw/II/j1np+TI0yFd92VWv46jckGKyNm13rJ/MHQx9hn57woa5JvmiJ?=
 =?us-ascii?Q?+636+LPeunPsyNiYC8ij/ckBvlkpvigPn1qX/Bf9EBtrAEwdgR4TQbEcUkHi?=
 =?us-ascii?Q?Ye3Tf43/Xo2cs5nAloD72i/O1+SKvA08cfI5vJIq0GPnT2MmZ8nNZwkVhaKG?=
 =?us-ascii?Q?8M3YTie6TnyreUmczp10mVkMMvObxAbPGowu1o5LAXtGNwGmFTmNYNnr0jK6?=
 =?us-ascii?Q?aCFtE8dE0G9i1xtzbkHSmVm058Us0X58h9w9kfcmtW9kSIc2Rl6R0yvrKr0r?=
 =?us-ascii?Q?lJc7df6mjPNb0e5vDp60XiuofvcXoXKC2TvZ/5J0L7shhQiuLqY9jB2LRTXZ?=
 =?us-ascii?Q?tKg63D+lDg/vUEv7Lvle/ymW/9v7e3ezMHIgnh5FXPzFsUNI1s+V9sw2D4BV?=
 =?us-ascii?Q?riO4eGE61pcrPQxOlkXYrms58jbk8C8ETX6TuUyEMX79Q37EFfCfulaTNMNo?=
 =?us-ascii?Q?S60sysKELx5/uwyS4PwvkaSeDu91k8nI39qnXbvUckY1uLKQBN6tb1vUI5gs?=
 =?us-ascii?Q?kHypA7adeZT7W2zBfeQWaEPrttJG5E7u3BW589jRwazf8crb6ABo9jMObWW2?=
 =?us-ascii?Q?IxGNBhfYNf5FFTf9i6G4rAv5FAV7t++W7S9DbewnrfPOJQFWNJABH9eBMEvS?=
 =?us-ascii?Q?LgiXpCwBNcrclcGZRtlV1hgK7j0ClOxJ4LPtIVpGgWcXImkBoG5eHPTntO5b?=
 =?us-ascii?Q?S9QLgJsz1Aii2EqNagH/rI+AbTm5bW1lE+wzvmXR7sCcrEdsn8Cy7rF/bCIZ?=
 =?us-ascii?Q?8S1QFji+klpJhJlpcrWB3oZ3DBLMZu5F1zw1HdXW0PNqZFLqONV+ezXHBbdD?=
 =?us-ascii?Q?Y8UjTo7WM8S5jb873hWPmXcI9RkQ+wxp8F1Iak7IKuFHIGUk05gWhA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HyGoP3PKYqNVnAod7hzV9J7I4qxXsOST/JYw6gY2MojuLMkhBUe3esI2RZqe?=
 =?us-ascii?Q?2q8klwQ3JdfSkX6fpEV54BanpCIw1YWFXmfYMrN6I7jiAUPqUhQ2OPGUdsCW?=
 =?us-ascii?Q?Ogzx7uJtbXlxVvTjOwbfzkt5yh82wl8vM4SarSUWyQhDNHyjMWOIOX5DNl5F?=
 =?us-ascii?Q?Aqr/g54SHRN24niVwlZjl7Dd0UJZoaQVRUIAY8hjmL9OZMq9mSY0f2e3u+Xq?=
 =?us-ascii?Q?N8N7Phl8RrUH2B2meCg3ZCuTWQTMgT0EXvJ43vwscS7Bn9rQc5M3bKVXgs4r?=
 =?us-ascii?Q?oacdB1NxEqtMqQOoLMxi9nMHl7zGw+6zgWP/ydELx6x6ahW1JYZ9GZDl8G2F?=
 =?us-ascii?Q?Cjp8dRN4Rj4H7ydkQYm8wYhC9vZNbtOfykJr/K2oXpTSpdsCT2f5BWtQxgv5?=
 =?us-ascii?Q?Ap5IMpJoIcXWnT1/v1GS4Qx2iXUIdHQNu9jh+KyyTdkA9BjAlpdo9Nkj84DB?=
 =?us-ascii?Q?S6WH9SUDANKzbvf951mS+Z5XZSwORHaODOOG9OGN+f1j9ljB0fPXh5BqYwt0?=
 =?us-ascii?Q?9giSsa4jJwQC7k11KWwAC5fT2PBJwmFTI1yDbCSNSt0z1q7WCK1ozTEVvh7S?=
 =?us-ascii?Q?hQZR677cXVqEsCmiiJtA6AZcMxZSuWui7MouxcVgKgdMFQ+l+GWXdP6M0xqR?=
 =?us-ascii?Q?s3PsbTlR3+VimHaDxm1G5s6pRO7k+rYUYZIYglQh4lfjMWQfPKmBDQlJaP61?=
 =?us-ascii?Q?MTz+BWiL47fK/QW7D/pWlsQFaS1LAfdEz7qt0bUhFejZU20MZYT3MiymeWxR?=
 =?us-ascii?Q?HMy69bYSS+P25Ky0PPmEAnJ6md/1ePwgJoJ3Pf3t/fBkYb5FZDc5DdxAZGuM?=
 =?us-ascii?Q?ddZAJAXFQ7nYPlymiD4LOkvklrwi5kkFw4r58aS8NnP8hZb5XyjfnQI1uu2I?=
 =?us-ascii?Q?CESo18SzzvEn5KcV7+mrRqjj0NtzAK9o0shJT4t4Awghkmn8IFofeJeRUDZm?=
 =?us-ascii?Q?/sA6jCPDZipK7WZ6kDocCpNFlbtnZTszmax+S4hfqCuR1mW6XT9qlGd/CxTf?=
 =?us-ascii?Q?u07FXVHj4UNjh+WoepI9XTBVGpuJXBTvQiT+K3x9tWqbaMJY0hsf1WUpkIfI?=
 =?us-ascii?Q?y6qrJOLhL3d6w5Nnj2zcaXbEpyVfWZc2Z73Z3uiuURpFaMODmCijSLHeIdAi?=
 =?us-ascii?Q?4eZq8y1cUpC5zdRjaapnuHInUrNXfMhduNt6L+oRUY3CNSOZFVbmJKpnOjD8?=
 =?us-ascii?Q?YbIuZEIG0I9ColJQbOOcw8wVbn+TsF2Wy2VOyM0fjs0r264Wk2y3ncG45zAw?=
 =?us-ascii?Q?wcgABqdzB1XLhfF+yT2TO5/U7qWJvLezuMw1KZa4wWao89OLOpZzX4dCXwM/?=
 =?us-ascii?Q?KkEdf7j1bheYXi6fmoEXikavd6fml4d5PHRO+KGMJ2DeP7XkVhp995FlutBY?=
 =?us-ascii?Q?PUuaRhS72J0XQaainBSZm5QR/iH22LLc/eoYFAumSe9Q2D+NjadsfRCuxgmx?=
 =?us-ascii?Q?QTAgdTYEH7BwqkHETEiqayD3rjJxxQBQq4jRQsYbvFUW9iHcqS8FAkG8VlKR?=
 =?us-ascii?Q?bpA9oqI1MNkPsTzIIxH4IvOlD8nhaVadNoHodDzv1spGiO+MZqWtyQMO32iF?=
 =?us-ascii?Q?l76mC4AjDdJAlWAv6K+ti3nFVJwg1UrU16n557sWaQ79aBeX+u1s5yscA2px?=
 =?us-ascii?Q?RvMI5RUnTlXkoeoa3p/6QDgA27a4zvSOlFAnu14bO3kIHw5vqiXW3PGqEbTj?=
 =?us-ascii?Q?uywbV4LFT4Tq6MQv1bo7dl4KKv5D1uP2VPYOHbdsg04RCU1D6YoJWV+rc3kY?=
 =?us-ascii?Q?e22QENJMSg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02731a88-fca6-4ae8-e8b4-08de451c3253
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 07:47:34.0479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Vz9y40jqUpebA/+n4tntT1mgx84WavXXa2zTZbdEk/8HxYpWFdXWeei1akv93jmby8s8UAHpUmriSBZU9Lb9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   76d9d8ea13699c3b05f129b7bff8b8be75a3ceac
commit: 76d9d8ea13699c3b05f129b7bff8b8be75a3ceac [11/11] f2fs: sysfs: introduce inject_timeout_type
reproduce: (https://download.01.org/0day-ci/archive/20251227/202512270802.7Vt9Ttrj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#8: 
It can be used to to simulate different type of timeout in lock duration.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

