Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33293368D67
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487269; cv=fail; b=YZHpg6sj43XLvTS4nB/X8E4kCfMV7v74F2RCdtpcx31tiH3V+Xd+ArimlQpp2l4wTYPUXvUeUkSbylwXWpu5IiGfTeaHFoXI8DNwENlIGBls+9pUQrJ5CiTX4Av4PXakd0JkYtlhiRRwb4NVr3UIOw7yLs6M7/9CWGarn/8j9DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487269; c=relaxed/simple;
	bh=mbXGQMMBVD0m1echtyWuZ27w1mas5bi2uKnlS6CHH/0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LBB6//z4cI/a131r4Dp2gITAJBzujvER3MvK7827bYIDWFzPH+E6HOSVjEx3y6VkMF6muMsb6icvfDkOVWzBaRot/V2xh75H5mClw9p+k9U18yLU5bLc51ERqPZ98E+/vrFV3dkVQMHsc3gttyOoVol5wtzub5DvhRX7xc8phSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZvFPdBn; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZvFPdBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487268; x=1819023268;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=mbXGQMMBVD0m1echtyWuZ27w1mas5bi2uKnlS6CHH/0=;
  b=aZvFPdBnLsfvHudNSpSMwoii1HEW4bIGw8AMR8Gd1XzY+n8Yx5hJUOPY
   KLR/Pwc/BEUafCymAH/ZZRX1iL7AJNXPO6XkAWQhv5USAOklLKRB6a6hk
   p8l1W+fjT/DQYcaSOto8vfua+N2v6XAWUCo6L9AQi2sB6rXl4SEMXLrsA
   kAqQgxrllAkmDPlI2v9VcczPfZOqroQWxoOHi4EU9iwSu3zcR+PgqIU1w
   ArpwkI5D8I5lVgZhsumG2docE6W/zdpTTzrLHFJ9Y7p3g9wX/N3ddBB1N
   cXeP9hzBEhRGQRY1FTmSHcUw/z0p3HK8jyp2DavECoJzaAo3KkswkrdX6
   A==;
X-CSE-ConnectionGUID: txtjHH2KTPyJYZkWB9FyLA==
X-CSE-MsgGUID: rfIkJ1EXRhO77tgKk8EOnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88088885"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88088885"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:14:28 -0700
X-CSE-ConnectionGUID: oZoDpNcdQFumRUhuJQ3wwQ==
X-CSE-MsgGUID: kwP9ZLlpSJ2yealLuGWzBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="260603105"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:14:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:14:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:14:27 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gG6QwldGaaRjbDouXf6R/r0pfMSZOm8IpGIhJGMhhagf3DMCZ1X3s4FNflLLeFFrKSTJFHbFX5Rov3nEkHn/Coi2/9bUz93tvNGNGG+2C3aoNU5e3vnUAiIy+n2htRlULfZdj/EPOJsVLlVWTtqz0FVTPy6uXWIjPfV88JZRGatU21pe0ck6vGoZoMRcWwBlRWXMhOi3hfOD9ZS8Q4rpNu8y6Lh9fB+uNx7li1HcXz4hE33WT7P8iGJQmhrETpbsq3RI/X0D8S9xPNkDYoEIIIQFksl4V05c1AYDSJ2GC42vhQCf5upfzYy2AwTNA/JHXl+BJcQ+agegQhESf2E33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFsLwbAMvlk7T3VsAbaypJmecjvt3xgCM/mHCdnVWOQ=;
 b=k0wS+P3ewK8FH8l7xcNcZlfhMKUmEd80SQzsuOOH/TBacakx5af04itVKXH16KiGsTI8Z9L22su/KlhU+O3sIoSz679vnudj1TikswJMNOhz8OZYvGQxtuExWubQXzL1CjUYOSKKXKmRXPPg3nnLrcKBanB7nFklDkdEvxRBuEmDvaxrdDgUO26lhhCAlFa9eOzTOiYUBOpAoYM4DghF7YSlC3ZFKgDiIk93XlLMHOdyVazIgGZYqIgTR1HizYr1dD9X/vRvhWdNjax24nYlkaHR9NXZJ60RdV2q5l7xi1IlFNmHubciAGkP0Aw98P7QEHJKpR/kFsAA0pqvKmYMAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:14:25 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:14:25 +0000
Date: Sun, 23 Aug 2026 20:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Meijing Zhao <zhaomeijing100@gmail.com>, Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Wandun Chen
	<chenwandun@lixiang.com>, Meijing Zhao <zhaomeijing@lixiang.com>
Subject: Re: [PATCH 2/2] mm: memblock: show all region flags in debugfs
Message-ID: <202608230255.AL6UNOZq-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260819075422.2387980-3-zhaomeijing100@gmail.com>
X-ClientProxiedBy: TPYP295CA0016.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::8)
 To SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 37733273-2360-449b-5a83-08df01101262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 5L/VOoRCeqLKzxM522IO2ll4lavRrC9m/k3yfH47D817uqXriUSxkM9/sdlYNQPn4l4IG5dmJqtpYNeni42u5L7AOqU4aZ+casfPBGK8GbqhgN9hCTlKKFfNQMZS242z2APLSgqdAmRoZD3O+TM9D0A22AYFj82xpxEiXIQ5tQWgOXO81ycffTswvZTkv5pGBX18mbc/hg/j5y1ZskwS0BpIqweXfCfJzNDdJFhm0Ul+Gd1xR98KlWuGn5CXwdEPrVJQZrdQiaxeK7B14YUXfxRC6cD+9aCvvVQfqPiQ9IxrMF8WorqNGUuZ9B+VPl/6/nmNPKuX1TWK2yypD4cmsho+YI6nbGzA2bc2/hKDVVJCKFfIs8DnBv05hTZVCvWM1Rx98IBuTIUSuZoveDO2zQcVf3FC1o9c9GU4kt1SF51a9nHdWh4EpLfHnffZoClnfEZHvDpaTZgEU9Wy3iRxNxXhGFiGg/Bsfj5W+drlTA8/SKDBNo/gzP1mFNhvRXJb2hiH1JFQjPnoogOoln5JZrUvtf8KshXcN21TAPkXCwA5TZGrCWqpRsLnELrYpSQ+Nm494dNmLiPxLhuPMjO9PcbjVDaTwKydnds0qDIcgQGYZYY+mSZ8dMHxP/Hz/oym
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iaaQW8l526GvEda7BWYSX34HrcKFnMUiAm/q0vdWWEwZPlILIz1u6sqtNCgE?=
 =?us-ascii?Q?8jeuVN8XSA8+N9PAZLemhRHgLBkChVYHrV5bHsb/27LhyNB+yuwhKBFSVaqb?=
 =?us-ascii?Q?2vyofAyHW+cHgNd7EKtVt3cSAbe5SX2yXNWnR/MZFQPz/KX1g2g5kTJkxv/W?=
 =?us-ascii?Q?ufk6nnC/MTIOQ+dXF4fvBjj3qUuFZ4Hmt7nC0B+nBnEBRBIAFRi4a0BUth5+?=
 =?us-ascii?Q?KLGPgXbRlWDe+AeKsqJe1cT5PA00HhbQ0xihlyOmdq7/u7Bvsl5F5NbnacCj?=
 =?us-ascii?Q?GHfXCdtyagqjC+0zibekjOZ6Zprkkj8o68maGlyIVx2lJjPiwOZ3fLOYv1Xp?=
 =?us-ascii?Q?f9WCHcMe2uvumXeSWK0Tu0/wPd4cdY/F6n2RKYVDJh+JteI8e/Gplleozcyl?=
 =?us-ascii?Q?OmucRdQ0k1govIuHUoyS3RA85iiRBy57c/QWVYOQ1tngEh8x9/E3bHVbWU4n?=
 =?us-ascii?Q?dCVIvQRRl/KJNzXxwRzP7g+fLD5uADsvyyjcguE8VifR7cupCJWhuJ2Z7fUd?=
 =?us-ascii?Q?aGuhDNxu8mJWELZuyUvuH/Gfkn9h/dTPLrw/q4/sXYFP52M6tdVLpfaMhNor?=
 =?us-ascii?Q?xa2dFVf/t4ay3LS8q56ivi6Q8Ctw+AHL7YoE34vc8Y8c8UFsrRZP24vAohkP?=
 =?us-ascii?Q?lSfS6j0dsVw3qYN1P9ZY/HXJq+Dx+rqUM6N65YsiYsQ4TO1T3K16QpdqF9Ag?=
 =?us-ascii?Q?NOYTLKZ9OrJXyYVyMiJ32rHE3+Cg12C5XcI5wBsEf6zAxhrb+ouMmgvuHNhV?=
 =?us-ascii?Q?0mBAMbdCNu3n+WU5GdMjLYaCLcq/V1ssTI7syWx0ZDLwGzwDko1zRajVfpLw?=
 =?us-ascii?Q?6GXlkMKwr/f+/mRjdxbVxYQLUuit+EhPSDSZtZGMZaxyr90S94qj/Q9RVvBI?=
 =?us-ascii?Q?jXnDw4VoizaRJpCwlKZHk9eIThCk0Q3A1L0b7w2Kww9AxtKJBDTPwp7ywhzT?=
 =?us-ascii?Q?4BacVJ7bZHOjQAyKcS/bh4OvgB2wVOuRqsfQYfwdSMnSyNtO/S75SlPQ4Xg5?=
 =?us-ascii?Q?FoE8UBOe0djvFqYQCFSpab7WqgQxjjdy0JZ9yX3CFq5mR0qWF8tRVkwv3OT8?=
 =?us-ascii?Q?jojDeDJXrEteyl0kblcfGIje8EUepaoqbpXLykurvOUuXE2mj518vZnamrLu?=
 =?us-ascii?Q?QTEA6Jucdp5l2wRwjx0txepRL92GNKv+xHaz3YVKOvYYDhEfVWaqjp6FywHm?=
 =?us-ascii?Q?3moke1nkKaldEhNc98NoQGdf5uO32HqdNLkd4MXDG43PQtCrZP4gc3yQ6Y7r?=
 =?us-ascii?Q?C5QnHd5Ri66wkFaQ1MP6LAwbHyIKAonyGBi8A9JmuR20Y4eBiT0NJ28YNPz+?=
 =?us-ascii?Q?w86QsqVXtvjJ3lGQr+lNxjbc7yQiZGHoGF/GdtOz/GSlVG4A/7nIs+rmJCVz?=
 =?us-ascii?Q?dxSgt1/2XYRDDEewguReE05g0HJxDpEhJEcWiHjL7Tpz7EhXWJ50jlO68p82?=
 =?us-ascii?Q?kYJ6goUXl77Larj01cOnPIVYK5YdpIMvAnhFaEbSj0Xn7HluOc7/cjpeNA68?=
 =?us-ascii?Q?aI6FqPQJdVto5Xv7+WbnWQewsA7jt4s2MU9tT03BQ77o3PjoXDtYDa7sns3D?=
 =?us-ascii?Q?KW9tYZgc7cf6DSIv9AWQFQ0Kh4vPQhHdrUEoLw48WWiftuAGshV9XfEqSsRE?=
 =?us-ascii?Q?RUirJT7ga/Oe8O1u3239Vi83OUDGfViBlmmNI5V89HXdYYpe4SjO9EY9eW5O?=
 =?us-ascii?Q?QBrW0zglHAhNdOxYr0g0P00r8g2kBeB2L0D2hbIkpnQh77nUrKs3jEY1jxlm?=
 =?us-ascii?Q?8YadV35wdA=3D=3D?=
X-Exchange-RoutingPolicyChecked: OAm3ulL0cBQiO2L+0VJC5Pbt8rS29t+kSLjW1RRHV+9r8aUyAIky+8z1KvqyfOxABclNQ5FnSGvqczBLE+yHBi/2eGEAEClnyOrlpMo3h5lnK+6SggrG2pMMOXzdoLAH916CDAoSaV4ZsIX53lMGsc518Zh3T9sbSXpuVy8ig8A4iAQsMxAYgkGYG5+FBUjWjDcyZ1MJBozwNMLyHajRapa5qC7hbkdM8gH36xhyYToDqGzz23ZwwesJEP6Ge5mOVFw+QLynmv3tldPKxIwkiBg358Nz9gpgRNx3b1kiW5qY+VGmdbeG4PDtbhNx2lpeg7xcIA+t1cqfB5B5w0BR0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37733273-2360-449b-5a83-08df01101262
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:14:25.1584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wap+MIvImXNG9NxbAQksaJeOlhleoLKhEjBtLAa9hDCeMLwb2HWzSweqGM6kQ7M6ifGQUrmLemHRRBIrculefQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

Hi Meijing,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Meijing-Zhao/mm-memblock-add-missing-HugeTLB-flag-name/20260819-155421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260819075422.2387980-3-zhaomeijing100%40gmail.com
patch subject: [PATCH 2/2] mm: memblock: show all region flags in debugfs
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260823/202608230255.AL6UNOZq-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230255.AL6UNOZq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230255.AL6UNOZq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:25,
                    from mm/memblock.c:9:
>> mm/memblock.c:2805:16: error: 'MEMBLOCK_RSRV_HUGETLB' undeclared here (not in a function); did you mean 'MEMBLOCK_RSRV_KERN'?
    2805 |         [ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
         |                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:158:30: note: in definition of macro 'ilog2'
     158 |         __builtin_constant_p(n) ?       \
         |                              ^
>> include/linux/log2.h:157:1: error: array index in initializer not of integer type
     157 | ( \
         | ^
   mm/memblock.c:2805:10: note: in expansion of macro 'ilog2'
    2805 |         [ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
         |          ^~~~~
   include/linux/log2.h:157:1: note: (near initialization for 'flagname')
   mm/memblock.c:2805:10: note: in expansion of macro 'ilog2'
    2805 |         [ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
         |          ^~~~~


vim +2805 mm/memblock.c

  2794	
  2795	#ifdef CONFIG_DEBUG_FS
  2796	#ifdef CONFIG_ARCH_KEEP_MEMBLOCK
  2797	static const char * const flagname[] = {
  2798		[ilog2(MEMBLOCK_HOTPLUG)] = "HOTPLUG",
  2799		[ilog2(MEMBLOCK_MIRROR)] = "MIRROR",
  2800		[ilog2(MEMBLOCK_NOMAP)] = "NOMAP",
  2801		[ilog2(MEMBLOCK_DRIVER_MANAGED)] = "DRV_MNG",
  2802		[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
  2803		[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
  2804		[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
> 2805		[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
  2806	};
  2807	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
