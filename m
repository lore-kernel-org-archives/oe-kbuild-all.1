Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B77195
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 00:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735606094; cv=fail; b=mUsaBOwqCmntTBeU6mrwIRDOVYkHZJZgymTMH/w3UENKgqy+rnY/BIBrBflvlhhp251uRH5qzbRdxmoOjXoIvA+Zo/k2ccrKw31CHpxDBGb5lHNelOCAAoyX5JGauf6vhm284PxMVwgB8ZgSyQR6ZasyFx6IFBmnj9j9/O29lbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735606094; c=relaxed/simple;
	bh=4+UBh7EhoXBDPrtAcQZTeyNycWQuck9jMUtYs1A+PaM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jFvYKySq83Av2KDvfh5z9nXxdCqoo57V5qU+x8gGQJWJw9BnJn/P9UTcZY90GT11+bybKXU0HDDb5AZUyeHxMIcgZlNUVeSBsN48TcF/avv9sNWvHisb4MTi9D6ygW4c4cZS8BMG9+yYShXBYLAs0XzIAwhtr3EaApjoTgpNgtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpMBzkD4; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpMBzkD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735606091; x=1767142091;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4+UBh7EhoXBDPrtAcQZTeyNycWQuck9jMUtYs1A+PaM=;
  b=hpMBzkD4AAGGrdcRpvRzyymKcbnEgFdJuZqITAmrJyEDcrIqM957WK+i
   JgnzWYWK7yagXBXnXsSRu5woMMioFL8bXNygygUMcHD2zzVU1uP54mHe6
   iJd1oO75KvH0MVfjVqLp6CEnaROL2JGF7+tmWOypvrqOdV4sK42XnlBr2
   Vw+7m+bs3mqhfuawSNsE76vu2ObWrZUZaGwxVn01I19xsWmh0HQsv7a3o
   q/U1Uz/PKZFm8WQlvBqQ7bTHd323ZCuDhjFT/9XuzHomk36q84Gbww6b5
   RNxLxtFnOpOz71l+uIqV6kZ2W2/dARyoCDyHBnD+kSUBL9puR+MOr8KgG
   Q==;
X-CSE-ConnectionGUID: g+FSav8ERbOafllccgzvZQ==
X-CSE-MsgGUID: ukm+tIrPQ8KTR4bBXJCodA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="47311328"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="47311328"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:48:10 -0800
X-CSE-ConnectionGUID: mUqPrt8OS3iO2O911xtFSQ==
X-CSE-MsgGUID: bB79yVNEQ6i8OaHondNtNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="101041554"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Dec 2024 16:48:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 30 Dec 2024 16:48:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 30 Dec 2024 16:48:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 30 Dec 2024 16:48:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwLUxJQrTNpfBmMUJ0odsGcqfWhSzOjsfc7kJsJXzotD7gLkrClOJYLJyO/OoT/4iHLS18wYi/YuOvx5PHRM9UnrBgrUkdtLRB0VnxYcALUXdXwMDID+brXk0CaHIk5J3mYA/mruyBy0oxwQ7o5sERAreOaDKHUHwMvHflGPsTe2N2PekbBqhzunVDjn8xsGXxmQU4Lpip2iZdxTqTIsCll3p1PAPqg/8Kr0YHNV3zTEAoDDhQqyKjJziElkY7n9x1xa95Xr2AS0UfaSihW5oyWh6s4c3YPcEiA059ua4sf4vNIVj4hZ3/7w3dEBQjyp9+5cWzDU745oNV+qOo0YRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HGJgpEDwobSJgyXwFUkbOPwJoS8he/18U/LUmDpDI8=;
 b=L+ggO+92sL2bKxjqtxBjBD8DeGWxsqTglrnWQYkukS9QM68Zkuu+hXUUFfopH+P6dIgtG3P9w8F3o7UKtPT9G4LvFDB1nU0E4OZJiyfB9Gagxraz9IZ2geYutToGx3HpuCqDLV2lfhXuAJ/jYkn5YCDbwhGkRthk2/d/qnkwVYHxnQPkA0nr8eeyGFRRkClOtbp/ZGZWAPh5ScmxqkhcrnBEACfardFmR0V5WI+PgtPj5IjSY89y85bUatV1rjOPjms1Biqy+fyZEz0eZDQTHKKUtUaU0iZdq12DoOPz2Q3KgJaJOXBbpOY+qmilPVp5aViqayIYwAwEEnUqGSZMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Tue, 31 Dec
 2024 00:47:48 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 00:47:48 +0000
Date: Tue, 31 Dec 2024 08:47:40 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>
Subject: Re: arch/powerpc/platforms/44x/gpio.c:63:28: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <Z3M/LINJXuENMTq3@rli9-mobl>
References: <202412302306.wrnx9lgU-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202412302306.wrnx9lgU-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CY8PR11MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8e6b44-6047-40f9-ea43-08dd2934bf77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1VUmTePzS/pK2svtQahYkcNKaKvXLoQLC24lrkb/Shpu8rYHWzkz9Ju4Jft7?=
 =?us-ascii?Q?NVpYqQxnmbYuuMOP32FUn6u7kTyGquqnU21cuaK4mv53NgGDOfQwFwWaHbUj?=
 =?us-ascii?Q?QXRusCVqRapQL0XlJPVUqqArVzjdaMaIn/r9RQv4uPIeX7ZLs7grPjpWeBz0?=
 =?us-ascii?Q?MmGmNwijRmWsrEGbR+6O83/944YIuARUn4Df8bUZlLspu45RFpHI0lQRd0zl?=
 =?us-ascii?Q?lPB6E0swJo4nc9uJ31erIHye+rgR/3uX4YI7sBGWncs8QKfPahSrKTFWIXM5?=
 =?us-ascii?Q?gcKK7Z8ceG3m/T+GcfAmHBWH473f3RRJEFbbl0URWMjWJb/fcZIVRcCfxHG2?=
 =?us-ascii?Q?xkHKI+V8U+ey/ATBEbWestzu90uspUiSKiK6hy/+rn+YRh26KDFhCeyj+Otq?=
 =?us-ascii?Q?2XaH52+vQ48S1GfM7w9YmkdMQf7vtLWEtHKg/BZRItFwJBBqQ3S/WDKwiIwU?=
 =?us-ascii?Q?MFfmuQO+1aK8bJqvXOWXiaTD8rla7obxB952KBBwlA8+cIm/xxCWTT5p7m+a?=
 =?us-ascii?Q?KfIax+0jLNuvH18JSm78b6YTHyuM1AQ9tVvdiJOAy7HlV+wma3UZrA4kGv9r?=
 =?us-ascii?Q?sHNyl2K7V2qn8wNdWPm9VSq0RaLpweHuJ+MzRCdvEent2QeR9go/4bgpDosB?=
 =?us-ascii?Q?ie/RZPSKYPos+GFYnTe8Qd2u61mDMIusrqTyA7bqRIhcuDQ0RuKhJszTab9P?=
 =?us-ascii?Q?0KQ4NgRcmovnMylYnassweO0IIWQoiLdb5KJMJdOiyWYP/8kFRJrKqyrAVK6?=
 =?us-ascii?Q?BzfnoqhflgoR7eVcO3AgVdPkiWANT61MN7tzESeZioULs7fJfGWsj/ZuKM1g?=
 =?us-ascii?Q?OUQxo6ZGYGE8h3cQ6A2gy9nv04TQ01uXcfBA63cfyhFMW2MNhpFdZ7V2RqzU?=
 =?us-ascii?Q?j6doZT8bUnA33RU7MSAawrJXfvy8WNlKkvNDsm18p0OUwMuwBcJAKAsIVTkq?=
 =?us-ascii?Q?+KODyAW8cd4EOhzknWKJutcWGnaDRs/x6+ewAHPIQyqq6NLtuEkScyOsd+vW?=
 =?us-ascii?Q?ExsRn75VvnGJLNdQjQxqxwYbRdA1K5a9q5O40C0ihe/dT3ocWQP1rE9XsKLe?=
 =?us-ascii?Q?RM4/X31GX5SbTiW4GPU7WYbP7wVnBmOGLPQTl27gAtFAiNSgRI1EAlQWvS52?=
 =?us-ascii?Q?NY1+vYZm+uAsCrUwU1nvxFrQg9dOvYVmJ8i4HzTUZLBAJ8k8pimwesBBEW+8?=
 =?us-ascii?Q?7mPFM/u0QjHOGKTajKVgE4UwLoqSkX9ictXb9YPmUMD2pSwLmDedKjWR1tqK?=
 =?us-ascii?Q?DTWRhzh3KSsQnDt/B+j617m5jU1/eRCbAbhtMlPnNTV8/d16Ya2WI3q2+Xrr?=
 =?us-ascii?Q?e641yOuQwV9Q8zkwJpJ6q3a6hnNfJ9A6jsG6RkXa23Gsyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NZ2RgBvOoeFUtnny+hgHbwCXdiKaauPpaBvTr7HcWl+NEkAfEDbPr+0ve015?=
 =?us-ascii?Q?1P6spX983VKBgysfrjZ+wkFsazvnkZaerFpw2afxy/y+f8WZ6r2JulhKBv9w?=
 =?us-ascii?Q?e82ToX/pOFYPfU9BAjjWtbCFCMIqko/z5NBosO40Jqq2QJQAzZggLkcF3jLD?=
 =?us-ascii?Q?R1sJhZrYAzhNjH0Q3hIAHL7Esn0tFARNles9Fi/+7tSqwnqAqF6rriJHyesu?=
 =?us-ascii?Q?kY5EDZyZAu5dHLrWOuw5OZhIbRTVe2n5eqJud24Y8DSpwpzDXF4TsWEIGSwd?=
 =?us-ascii?Q?hy9Eh6gz2rQJRsjTX/HbmF+JHS6tqWnoUvjmshZwRim+C9duqEQJJiWshi21?=
 =?us-ascii?Q?zCg/pAI8jq5Yib/Dn+426LqExYv+Dd/R+r9wC3hSrwyI4/NE7fccywN5Mir6?=
 =?us-ascii?Q?oE1Xljp/OtpDKyw8WEPT6sWDanuDJeoi99Wude1TCrONjNPz1U1a9aQ770L8?=
 =?us-ascii?Q?sbRSK5skzT6gazyb3G9obvd9JscKgibo9NU+JLOHhne84OzRGmqxnYlfc9B/?=
 =?us-ascii?Q?Sx9NmY+A9R1Q/BIESOoXuWHYP3q9YMi8YD4XOQtau+0tWknaDeBnw67QtJzh?=
 =?us-ascii?Q?3Gmu1ucPZH7oy9q1zWvzZYWm+tDIjDCjKDcF6Mi+iBaz9K6rwT3zOOL1eEek?=
 =?us-ascii?Q?JryzHa0mW8WRMIDoWZ5qEQYUm3MbU5fzGqSXOyHGpV1iz35nwpYtJJmBHYri?=
 =?us-ascii?Q?WCe0hOqlszEBkjraqYTvL0+sO0284Sciw8E1Pj1quyHvoe1RdZbg25STMNyt?=
 =?us-ascii?Q?aVp2WdxQhE9RRUvZIQV3D8XLJF3xftwevA+S7aFU9AZ3NShWmPFJVbyHvKj5?=
 =?us-ascii?Q?3zQm2kSFVe1PriqL8eNw/dRdUXNzLZkv1xqSQT10c7cscwshCS9VKehFRRby?=
 =?us-ascii?Q?LyYmQhQ2idyl+N+d+Ml8TKkYbIN4Vcr42taPvSrGqKSHpfJWQxJaWULrxNdq?=
 =?us-ascii?Q?Okk1U6dh3nBEKxnKmrGGlVwLTPJ5BMEyyRSMYd2Y5vMtvEizdr3yRxmdGy63?=
 =?us-ascii?Q?XfVXV9v5xa8vBv/FN+jn3VMbCKd+kyO5xrx95etyqoAkgvw4kb0Xoej0VHtx?=
 =?us-ascii?Q?BwqCcuAeMOSA0jk+tJ7eulcG+uygCfQJJOVQlxKj4Vw+Pwb++6Vo9WyaUTS+?=
 =?us-ascii?Q?+j3j6mcGsm+mcS8P5IF27QMBSq7FnHies6GJ+It+BEy2ay/7oqPBVUXEjhsN?=
 =?us-ascii?Q?DG3AR7KOYy2TmE80yPosZOYnigYbdCPWaROjM+Q2ju/IQ6UH9l9SF/VOiKk4?=
 =?us-ascii?Q?iZJAhSMHVz9DedUMVzK5Fa1RBgF0FpRusJ5cj7MARb4GFq6qUfngnHU6HB46?=
 =?us-ascii?Q?XkkldXeG7jLTkfnSAR/7iLyjyi6QDpeuSpjhlv92rDaf6g62S02Qvr0Y9k6N?=
 =?us-ascii?Q?ax9OYTucxiLOFtA9j7exZ+hWligH0SRZuK7mUjExEWjP9GphZ3IzRx8FjQPW?=
 =?us-ascii?Q?OZFhqK7RlyPBbXCfvZY19VbyLmOIXm1OAjMZroWzNoyqzbSx5yxxuKw2gyM1?=
 =?us-ascii?Q?zsAZfsXkdn3kGnTV1ruo+vuJDNHTSPkD/dwkLVzFrI2qtIK3KwmIwLRjS/ND?=
 =?us-ascii?Q?QkkJXsGftgqYGQiUHlRGVTd2YPzm93LQhvSderdR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8e6b44-6047-40f9-ea43-08dd2934bf77
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 00:47:48.8013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPjlNvOS8rlUHOBNjoTM1o1skEcppOPY7pFHr0yt1ORiy9wiJc7RoGjSJ7LpJoMYZxGdJuGyen3UUDZNOAoHew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
X-OriginatorOrg: intel.com

On Mon, Dec 30, 2024 at 11:29:52PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fc033cf25e612e840e545f8d5ad2edd6ba613ed5
> commit: d5d1a1a55a7f227c0f41847b0598982f0a93170d powerpc/platforms: Move files from 4xx to 44x
> date:   6 months ago
> config: powerpc-randconfig-r133-20241230 (https://download.01.org/0day-ci/archive/20241230/202412302306.wrnx9lgU-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20241230/202412302306.wrnx9lgU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412302306.wrnx9lgU-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)

sorry, kindly ignore this report that the commit is not the initial cause.

> >> arch/powerpc/platforms/44x/gpio.c:63:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:63:28: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:63:28: sparse:     got restricted __be32 [noderef] __iomem *
> >> arch/powerpc/platforms/44x/gpio.c:103:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:103:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:103:9: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:103:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:103:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:103:9: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:106:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:106:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:106:9: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:106:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:106:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:106:9: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:110:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:110:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:110:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:110:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:110:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:110:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:111:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:111:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:111:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:111:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:111:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:111:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:113:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:113:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:113:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:113:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:113:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:113:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:114:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:114:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:114:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:114:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:114:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:114:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:136:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:136:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:136:9: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:136:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:136:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:136:9: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:139:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:139:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:139:9: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:139:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:139:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:139:9: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:143:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:143:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:143:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:143:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:143:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:143:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:144:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:144:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:144:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:144:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:144:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:144:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:146:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:146:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:146:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:146:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:146:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:146:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:147:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:147:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:147:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:147:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:147:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:147:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     got restricted __be32 [noderef] __iomem *
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
>    arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     got restricted __be32 [noderef] __iomem *
> 
> vim +63 arch/powerpc/platforms/44x/gpio.c
> 
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   51  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   52  /*
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   53   * GPIO LIB API implementation for GPIOs
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   54   *
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   55   * There are a maximum of 32 gpios in each gpio controller.
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   56   */
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   57  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   58  static int ppc4xx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   59  {
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   60  	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   61  	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   62  
> eecdf59ad2fb90 arch/powerpc/sysdev/ppc4xx_gpio.c Linus Walleij   2015-12-21  @63  	return !!(in_be32(&regs->ir) & GPIO_MASK(gpio));
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   64  }
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   65  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   66  static inline void
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   67  __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   68  {
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   69  	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   70  	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   71  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   72  	if (val)
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   73  		setbits32(&regs->or, GPIO_MASK(gpio));
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   74  	else
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   75  		clrbits32(&regs->or, GPIO_MASK(gpio));
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   76  }
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   77  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   78  static void
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   79  ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   80  {
> 0d36fe65f58391 arch/powerpc/sysdev/ppc4xx_gpio.c Linus Walleij   2015-12-08   81  	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   82  	unsigned long flags;
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   83  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   84  	spin_lock_irqsave(&chip->lock, flags);
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   85  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   86  	__ppc4xx_gpio_set(gc, gpio, val);
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   87  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   88  	spin_unlock_irqrestore(&chip->lock, flags);
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   89  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   90  	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   91  }
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   92  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   93  static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   94  {
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   95  	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
> 0d36fe65f58391 arch/powerpc/sysdev/ppc4xx_gpio.c Linus Walleij   2015-12-08   96  	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   97  	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   98  	unsigned long flags;
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   99  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  100  	spin_lock_irqsave(&chip->lock, flags);
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  101  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  102  	/* Disable open-drain function */
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13 @103  	clrbits32(&regs->odr, GPIO_MASK(gpio));
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  104  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  105  	/* Float the pin */
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  106  	clrbits32(&regs->tcr, GPIO_MASK(gpio));
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  107  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  108  	/* Bits 0-15 use TSRL/OSRL, bits 16-31 use TSRH/OSRH */
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  109  	if (gpio < 16) {
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  110  		clrbits32(&regs->osrl, GPIO_MASK2(gpio));
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  111  		clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  112  	} else {
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  113  		clrbits32(&regs->osrh, GPIO_MASK2(gpio));
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  114  		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  115  	}
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  116  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  117  	spin_unlock_irqrestore(&chip->lock, flags);
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  118  
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  119  	return 0;
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  120  }
> 878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  121  
> 
> :::::: The code at line 63 was first introduced by commit
> :::::: eecdf59ad2fb90d8238a42e2ec41f165964349bb powerpc: ppc4cc/gpio: Be sure to clamp return value
> 
> :::::: TO: Linus Walleij <linus.walleij@linaro.org>
> :::::: CC: Linus Walleij <linus.walleij@linaro.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
