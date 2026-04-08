Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2295A35CB8B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629821; cv=fail; b=LErEK87xlJoDhbc5bWEX7lM4/9ZBouJxFGNCRYzN7aiLbSpEQDTM85fFIGEcf/PcCAoUJ9BE5vSmh/EGv1KR3bCWfPDeqw6UzBvQqRWjsmWKnoiuY9nA+ioOF+I4bS7TxTfFr7MdQqKh2B3yBxQ9YCn1bQzHmU7c4cZjg0ESp1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629821; c=relaxed/simple;
	bh=2ZopTU87/8w6HJY3zyKnAj2j6jZws8LFCfzAwoYQfbk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jEirQ+yP62ZFIii/0QrQ1q+SKpc4qDPYrXYqsRWXuhePUlfbvyPusyXYMk2QY4QBK/8rEyBUDWUTOSoofsjgRmIbz8rXfQit0SyC/9cyi+yUDmv54/dqVJE/lsJaOLruOhJbRJQAh5rVXbL0nn0IimpQy6Fg2lftBqCq8v6xbtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpXCrvlj; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpXCrvlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775629819; x=1807165819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZopTU87/8w6HJY3zyKnAj2j6jZws8LFCfzAwoYQfbk=;
  b=WpXCrvljSjGYvMahDsJqOIsoUGg8aS/U8DNCgLVhECGAyX5CUziki5T4
   5vsqsiuy3dbEI6Y0czxnoOK0vtdgVodrfPoQ27P1hqWrLhFbTtAm8+4bq
   QvzXQ+0aN6gmbWXqLWulnZy0vrBBaimEPF+x/fY9FZscVTToG658HY0MT
   6VEm7WdowIqOQGjs/A3M0I/UQcdRt9nY4iG7URh8DcadaCoMtUyy8gihw
   dhTgPcLZ6ssGD9xAuWXcJwhkIlQBLFm+96KsJKqRvdeqSztVT1YQks+6l
   o0qqRjHBSlv1BDZbxDavxvX1Vs7J4vEhV7vlEfu4yBXNf8GmND94unRwW
   w==;
X-CSE-ConnectionGUID: ME4EydYpS5mTjsS+RM7uVQ==
X-CSE-MsgGUID: 3CmYmp38RA2wsPDqXQZ5gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76325056"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76325056"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 23:30:19 -0700
X-CSE-ConnectionGUID: jDcNJYj3TgCJxC+aPYG3cA==
X-CSE-MsgGUID: ajrjAJcBSTiZiZWuV+gdag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="232427320"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 23:30:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 23:30:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 23:30:18 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 23:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gC6o0zGN1us7RrxgzOjFe2E2y8kkbQiWAzwxneOcQu+Hm8aTtJEmoS4Y3h+AfFeRBrL5EfN0EoM/EJvWM8vBKKyuDU5vn7KahTdb7muyTUvCu7QBb0BgyEOCYuIp7zXdvEKWT+E5LCW+Mqy4XYn9Sgkd7/wKjjI6AVl7gQXL1XlGWgdwv2wFtw5iB2e0njLMuqqqwxEBq1+J2TSp4dVVM8DuUOv+6hAzXEzR0qaeK1VkD5aqO6q+3TRxAiOvvGxqS+pk5jRbAds3zZ3/3stJsoCQjPLN9g9r261RXKxIiuT8l9fwpZD1RTAms9ye86UulUceKvOBoy09Y+TBmvrugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnM4ihsQAX4yIJOoXVn8rQWhib33308qbQw91Z1O+D0=;
 b=JWG3sYo+WvAwodwhMvzV0KU/faBgNtLfc8Vj34BBrHdb5Yik869mn/I76vCeRmMrJORfWM5QE476vYPY5W3E3aS4y20InIMSzjhhE4iYWSEA4ZHlkmYx8e1rF6vfeJ2LQhucVT+abvyLx0kb4YlDFNbse2ehp4JFVYxpPVaZA7kID9nMZE+rtHIn/AYRJ9D6Be+z60rWCmcIlI12cvA87OpcoZ2aExDrIRSUkNA9RC/sRnC+YnqHkctXGJQkjX3bnZnEtNeqnv5D1ipHShkKl5vL0g2BNbXiZMnMYnXUhQRIG+1tGefUc5M+veBAVkd1EO1s807Paq9TMlo0L02asQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by MN6PR11MB8193.namprd11.prod.outlook.com (2603:10b6:208:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 06:30:09 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 06:30:08 +0000
Date: Wed, 8 Apr 2026 14:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: mm/page_alloc.c:414:44: error: invalid use of undefined type 'const
 struct pageblock_data'
Message-ID: <adX16aXroc9pSHTj@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|MN6PR11MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: c240ae50-a847-4f90-5966-08de953847ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: uIA9Qplpi+3O0Efhe8IDqU88RwlMpwBZs+/Piq9NBGLTie0z0teDTIyNmVlqS5qqcTIZzS4usU1TFX5Sz2wS/BF4s6zmRq7tx9iTujeMID3/5aWD828rzl5O6W7kOnwT8/Jg08HkvIkgYc7nx7mzuezke6ukELa0LNPBEvMFJ9KC6HDw7Ir0jhkFaXoQHQ4D5g/8U4MJOViKBMeUdUZnknvNqXoxCPJKQAEqBDyKoWkZ9gvQ4FYJpm0yumFI5rWy1tPLAhSwqYLE9I0c8K2JpVXbqJZ1PxsjsBr7uGC6gkUqy9+wcmZE5P4MfJXOD5oBcFy/09cOMnwV7bqvtYYP8Y+JGn+fEVg858fv55GaCx85GmrYltCCWuQ6cekPsYlhuDwXtWdQk+z4y0WBL3D4e+sqyyL0fBDNJWNkUWFw8igWkH5NTKNdEwfQvyMWESKHmC5t+BeF/KTLMuc6TsRethJkMRbkkJnQoK2h2MGdzdnWTYO5+AG3RRuvXlOQOD1mbG/4msgKrOePhfL7NS/A1SfFl042wtodjF1//g4pktHEs+XLoFv6RMVxH6ZvkLx5Lyo2IHKOLjA1tI0ZrcW4cMHL17F61NqmkQDpveXiTu+qLFErHQK3vtHlNXtQ7+mSGEUsqwSv3CupjUcgnY9+YzzGHHOZQLVFJRmIlBrb4kMYkbkfjH7isTt4jNsUyKao
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g7JYmFWK89ZIAcCOwpwPtcFni6uT2iJmI6IYpTsq8EulpBjIP6UtmgcTg75I?=
 =?us-ascii?Q?pBnM/IBHzqfVKlFhxwgSWpASHgrB5g8ljmGOJaS2yfBO5+QkRdz7trplrsc5?=
 =?us-ascii?Q?zV1ZxyxVl3rbcF70/OtR5b8Ya1CjqLW0xh4rG6CjFMPH7LSuRSDwneNABRQM?=
 =?us-ascii?Q?kgDNscRdTBFALHkGdsnKZTHlR19AlYIlt96NthSkU/O5+sO/Upxn84ix38ys?=
 =?us-ascii?Q?63aj+nJvbIgPaiEHAaD0DDbH0WKEx5Ee5/F7auK5lOGceZYT0NOhvzZNgDdf?=
 =?us-ascii?Q?LIK8VIyOSs8B8m5UJe9485C3o6nulY0mlsaPkWbUFMmBMhi/wNKyPQdgbwUs?=
 =?us-ascii?Q?Gpf+tgZhItCrrvarijBWHhiAOIfmtl2Gaw7Pi65MzGJ4rx8Vz0lcooln6yHs?=
 =?us-ascii?Q?aKLXyXFjAcjjt6NHk/naXeqs4GGanXA0A4lhHjBKATrPEW2SugajR4Rr6T2U?=
 =?us-ascii?Q?GbiUu2vSktO264tDO/hArvdmP+ucLxMiusDei5h9NenQoS73Pzv1w//PQPK7?=
 =?us-ascii?Q?QNhIDyHNspKzA7phnaOyfPCUQBVPDT0A1u7jC5pN6Z0KMqFfau0D1bZScerf?=
 =?us-ascii?Q?3Qf5u4oh5sy/qN3A7LTD1bD12G9rqFwmpAs10oy5KdoINGth/hjUs6d+MilU?=
 =?us-ascii?Q?jsfWnPy1C7M7zmPH5KjToRD0Pdzy2Dpf5/7BkHLv+7Xb8cpd4GwzTgC5D9Nw?=
 =?us-ascii?Q?akaW0NC0NOlTWNyrf+Hxt0RKfhii37dXhkf5DOjR/JU5og4/D/mXirxDVfQg?=
 =?us-ascii?Q?XHRdz1VboB6HVKDrkky8AK4b9+QXWOQOE2HX4xkkcqZvb5yicagCqHZLgy6H?=
 =?us-ascii?Q?g+Y3uBwB8tdKbgNeV/QF96Rn1m01Qk+cT4s3q3oTpkb8Atuw5BfJ4AMYZNRO?=
 =?us-ascii?Q?OiwqyqqSAs94G9d4Swqn6sRCv0Ldx2UzvybK1ANoIqzwy1BIaBQsCjozPEE6?=
 =?us-ascii?Q?6i5n2cmaitKCWR0NRWzRvUbUYPJp+j6z8JyNVZUB8OMRU9yV3l+6S06+D666?=
 =?us-ascii?Q?eYamCqKMSvT1czMByTiOR60omMO/Hc5iiOWf5n0n+p5sgIV7y1ISN6TElIr7?=
 =?us-ascii?Q?KCG3LzD/70zmvi69YbM/7sLyqoxysr1j/VunRKFbKVOcwROoO6TUlld0nFYy?=
 =?us-ascii?Q?RRI3cy243MJ/ADW0DEOJqal8pxpm2NSmqEuAVrTD/bj1Fnhy5aUp0Qd/sOCE?=
 =?us-ascii?Q?qIhg7u1D0sBj0l4WQ9jz7bglCWooAzZ2a+3ip/nobAWwf8GameKOKk/qsMpf?=
 =?us-ascii?Q?vL3yOLLIEfUf+IUcJkaMlLRu3R7neotybqq+8gWvfAEackDY3Y9cEHGEThzQ?=
 =?us-ascii?Q?XIRQlaqUN2zumP2my/nk8muJxm+oEvAgyQTO1C7l2azJprxy/qjumX7ifopn?=
 =?us-ascii?Q?Vw10jWKEcZlaalWs/ryFFcmBbSqcoXbGlspd0FkSVklf0Tba2YgDrUG3LXAQ?=
 =?us-ascii?Q?DJeuPJqyFgiwr1LUOe3Ya0K5ZujVbaGQeYLWRt478xPQG/zmbtTVxYiASRVx?=
 =?us-ascii?Q?6i6m4zwJK+h+xkRgehPqb6BYucOLwIUwfVV+iCcDnQaA6FNrBLkCtzQfK01L?=
 =?us-ascii?Q?IVsB7KehFY+DQYrxV3cLzvFJ+mRsiEM5994QaUphYYJ91cprzUlAucCvphWp?=
 =?us-ascii?Q?H7xPYBfGAHP8QTsoZ/A+8vSsNF3vMR0gECHJuXrP2G1sz4TCHPXGUP/PYNtE?=
 =?us-ascii?Q?TmsAd04LHb/eVff0MxpYtBZVmWNvncX+G1pBu9ZTjPOkvoDg9CnBS+hZqvyn?=
 =?us-ascii?Q?RP3sLFdpkw=3D=3D?=
X-Exchange-RoutingPolicyChecked: b222R0f8OMP7apu+GKfTwnbHHL6dhXS8ElR9fPzZzuQV2dPcGGuh9vp9nHll0AVyF6VOBXR89rtkKywg/EBOqeq5TMLOBwN9xsMs+LqeIakL3TBcZELd8f1UNm45TuYE9kqtdQuANFm7wYZzx1Y/YRvTnY2I606HVDMyWBjpxQkjVJadwiZN/b1H8TF+LPrpRMUJXZ8nr6RwTWd+zl5IHhFApEaeYEes2gkVAWXL+7GilbyRUDPdrK+WO/ic7CK/cPH1cA+kRkG2m5X3I4TsQG7qAvHiYsTVBoQo0TfRGFaFUFRoOPZYNmePjVEBG44kuf6pKw8zNT5T0UsV8Rn7jw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c240ae50-a847-4f90-5966-08de953847ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 06:30:08.9345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4ttt+uYP29U2zKNrJ8biyWOlpJsdSTBTcu7lV8r12M6tKUA6lmW4J5boo73dvL6Rldt2EcYfcrtqQ1+Mi0dRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8193
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Johannes-Weiner/mm-page_alloc-replace-pageblock_flags-bitmap-with-struct-pageblock_data/20260407-193348
head:   fed3344e092819bacd3a25de239265aa067bd4e7
commit: fed3344e092819bacd3a25de239265aa067bd4e7 mm: page_alloc: per-cpu pageblock buddy allocator
date:   17 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260408/202604080625.I1FdysJj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080625.I1FdysJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604080625.I1FdysJj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_alloc.c:58:
   mm/internal.h: In function 'pfn_to_pageblock':
   mm/internal.h:803:37: error: invalid use of undefined type 'struct pageblock_data'
     803 |         return &zone->pageblock_data[idx];
         |                                     ^
   mm/page_alloc.c: In function 'get_pfnblock_flags_word':
   mm/page_alloc.c:363:44: error: invalid use of undefined type 'struct pageblock_data'
     363 |         return &pfn_to_pageblock(page, pfn)->flags;
         |                                            ^~
   In file included from <command-line>:
   mm/page_alloc.c: In function 'pbd_migratetype':
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:686:23: note: in definition of macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ././include/linux/compiler_types.h:642:53: note: in definition of macro '__unqual_scalar_typeof'
     642 | #define __unqual_scalar_typeof(x) __typeof_unqual__(x)
         |                                                     ^
   ./include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from ./include/linux/compiler.h:372,
                    from ./include/asm-generic/bug.h:5,
                    from ./arch/x86/include/asm/bug.h:193,
                    from ./include/linux/bug.h:5,
                    from ./include/linux/mmdebug.h:5,
                    from ./include/linux/mm.h:7,
                    from mm/page_alloc.c:18:
>> mm/page_alloc.c:414:44: error: invalid use of undefined type 'const struct pageblock_data'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                                            ^~
   ./include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   mm/page_alloc.c:414:31: note: in expansion of macro 'READ_ONCE'
     414 |         unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
         |                               ^~~~~~~~~
   mm/page_alloc.c: In function 'init_pageblock_migratetype':
   mm/page_alloc.c:542:12: error: invalid use of undefined type 'struct pageblock_data'
     542 |         pbd->block_pfn = pfn;
         |            ^~
   mm/page_alloc.c:543:28: error: invalid use of undefined type 'struct pageblock_data'
     543 |         INIT_LIST_HEAD(&pbd->cpu_node);
         |                            ^~
   mm/page_alloc.c: In function 'clear_pcpblock_owner':
   mm/page_alloc.c:712:12: error: invalid use of undefined type 'struct pageblock_data'
     712 |         pbd->cpu = 0;
         |            ^~
   mm/page_alloc.c:713:27: error: invalid use of undefined type 'struct pageblock_data'
     713 |         list_del_init(&pbd->cpu_node);
         |                           ^~
   mm/page_alloc.c: In function 'set_pcpblock_owner':
   mm/page_alloc.c:718:50: error: invalid use of undefined type 'struct pageblock_data'
     718 |         pfn_to_pageblock(page, page_to_pfn(page))->cpu = cpu + 1;
         |                                                  ^~
   mm/page_alloc.c: In function 'get_pcpblock_owner':
   mm/page_alloc.c:723:57: error: invalid use of undefined type 'struct pageblock_data'
     723 |         return pfn_to_pageblock(page, page_to_pfn(page))->cpu - 1;
         |                                                         ^~
   mm/page_alloc.c: In function 'free_pcppages_bulk':
   mm/page_alloc.c:1603:52: error: invalid use of undefined type 'struct pageblock_data'
    1603 |                                 if (list_empty(&pbd->cpu_node))
         |                                                    ^~
   mm/page_alloc.c:1604:54: error: invalid use of undefined type 'struct pageblock_data'
    1604 |                                         list_add(&pbd->cpu_node, &pcp->owned_blocks);
         |                                                      ^~
   In file included from ./include/linux/init.h:5,
                    from ./include/linux/printk.h:6,
                    from ./include/asm-generic/bug.h:31:
   mm/page_alloc.c: In function 'rmqueue_bulk':
>> ./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct pageblock_data'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ././include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/page_alloc.c:17:
>> ./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct pageblock_data'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from ./include/linux/list.h:5,
                    from ./include/linux/smp.h:12,
                    from ./include/linux/lockdep.h:14,
                    from ./include/linux/spinlock.h:63,
                    from ./include/linux/mmzone.h:8,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/mm.h:8:
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct pageblock_data'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ././include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct pageblock_data'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/list.h:869:64: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                                                ^
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/list.h:773:26: error: invalid use of undefined type 'struct pageblock_data'
     773 |         list_is_head(&pos->member, (head))
         |                          ^~
   ./include/linux/list.h:871:15: note: in expansion of macro 'list_entry_is_head'
     871 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct pageblock_data'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/list.h:667:25: error: invalid use of undefined type 'struct pageblock_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ././include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> ./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct pageblock_data'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   ./include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   ./include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   ./include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:2718:9: note: in expansion of macro 'list_for_each_entry_safe'
    2718 |         list_for_each_entry_safe(pbd, tmp, &pcp->owned_blocks, cpu_node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:2722:31: error: invalid use of undefined type 'struct pageblock_data'
    2722 |                 base_pfn = pbd->block_pfn;
         |                               ^~
   mm/page_alloc.c:2743:35: error: invalid use of undefined type 'struct pageblock_data'
    2743 |                 list_del_init(&pbd->cpu_node);
         |                                   ^~
   mm/page_alloc.c: In function '__free_frozen_pages':
   mm/page_alloc.c:3248:24: error: invalid use of undefined type 'struct pageblock_data'
    3248 |         owner_cpu = pbd->cpu - 1;
         |                        ^~
   mm/page_alloc.c: In function 'free_unref_folios':
   mm/page_alloc.c:3333:32: error: invalid use of undefined type 'struct pageblock_data'
    3333 |                 owner_cpu = pbd->cpu - 1;
         |                                ^~
   mm/page_alloc.c: In function 'get_pfnblock_flags_word':
   mm/page_alloc.c:364:1: warning: control reaches end of non-void function [-Wreturn-type]
     364 | }
         | ^


vim +414 mm/page_alloc.c

0b423ca22f95a8 Mel Gorman      2016-05-19  406  
fed3344e092819 Johannes Weiner 2026-04-03  407  /*
fed3344e092819 Johannes Weiner 2026-04-03  408   * Extract migratetype from a pageblock_data pointer. Callers that
fed3344e092819 Johannes Weiner 2026-04-03  409   * already have the pbd can avoid a redundant pfn_to_pageblock().
fed3344e092819 Johannes Weiner 2026-04-03  410   */
fed3344e092819 Johannes Weiner 2026-04-03  411  static __always_inline enum migratetype
fed3344e092819 Johannes Weiner 2026-04-03  412  pbd_migratetype(const struct pageblock_data *pbd)
fed3344e092819 Johannes Weiner 2026-04-03  413  {
fed3344e092819 Johannes Weiner 2026-04-03 @414  	unsigned long flags = READ_ONCE(pbd->flags) & MIGRATETYPE_AND_ISO_MASK;
fed3344e092819 Johannes Weiner 2026-04-03  415  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

