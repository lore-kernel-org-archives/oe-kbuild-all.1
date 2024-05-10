Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227655490E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 02:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715309971; cv=fail; b=Wcu9JGz8LbkmJSuFpZE8iI5VZ6RlZAI8N/f1RBGLFZcNauab89QJaPmicVsaLhAT3s89LPAfXr1JC9ttUOZJbI16jNkKsoLmQpN70wrDdYL1Ec2X+gZO/9QJHgsVTYuHAiju7kG89hO09hB0u6NVrT5LrYJUqJs3t/t3s9JmBvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715309971; c=relaxed/simple;
	bh=fRvzT6FRrPffKYKmPh/A+6HMUTKIo2LNNa9HgUmqXvI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hHEnb+FRiE/1ERmVREOjxW3f1hXPMvJsL4ZX2qJPb6eCAKW/2mchymopGB7IkU2N4JCexCKDKYqE4Z7POgrxSnsBRok1OFpkIQCBRrpO4pF3WwU2T1WYJVuGXtcMHZEtvYr88edz/HzTcpbmZXKNhkeelYRDBSr+scN+8NYQvYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ii1KK+5s; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ii1KK+5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715309970; x=1746845970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fRvzT6FRrPffKYKmPh/A+6HMUTKIo2LNNa9HgUmqXvI=;
  b=ii1KK+5su2Q9WHnUN22CoCmoiTn6YGV7To6i7uGoXWutk57X49eMQH1x
   wlJeewj2ihfFQ1ushBLm+qRMafhYAzgmw8JF3zhzt72b+VX2Gidt10PvV
   fyVovHesldrfVd92u9ovg4hsFVuy11SmiQQTQFCcx3OF5o538DjZ8HWJ/
   ghc3bnFKLYQAXiFRp6y2FwnFMx9izk5y/2bznWpT7djDzAA+060hY42v/
   HXQ45HZhpWCZV2rtkwSFGgHVzLHsjAD3eHNZoZkG7IJiXCb8L/4OBjbys
   L4PUIaIjnN49LYRsOfOtyMon7RVB38M1T1XEN4tQQGHKuSQPXpczdcw7G
   A==;
X-CSE-ConnectionGUID: ERFNY1QhTiiHFCNHLdthvg==
X-CSE-MsgGUID: z0ZRgS/+SnGF9gfu/ZMmpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15106806"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="15106806"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 19:59:29 -0700
X-CSE-ConnectionGUID: 5Ti3GH2ZQc6ZxEGsTSEW3w==
X-CSE-MsgGUID: XYg4GLGKQnGP5mm8vFCMPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="33981548"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 May 2024 19:59:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 19:59:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 19:59:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 19:59:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 19:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PByrlgzXE7sUeDHfwILzmQruYag6h+oB95qtF0Qg5kEiLgu2w/c9al2x7KzaPu+cThxZ8qkS++ESxtB9NhnvqVTlQvi7Cd2cDpCCCsvmATKegBtABnS2gzpu84AOKZYTraBpmXh/6mLsQBoVDaJCpxtBtJQcFeNIfnuyAaviPkjRpLA7puuWgrTKHet6jEcEfK451AomdFYPp4RlXDXU24diaK9xV6noQG2f+p5qJ5iSTxyy+1G8gF1rD4wfsrnVqp4jFLURu4Do1VlL4Dmc18DN/wLIPXIq4whDjg+XYksYlfNera8+WoZ+kyFMVSK/+1jRSJMnp3SCVE1/tmj+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynDiA1QjPWZF1UZGhCyIUQiMWVdCw9VMT6RfoEHR45U=;
 b=Om/Fttrg/OUUSxsvjSkNvfNWfIV/TYyCqAk6ASp63iqZqsCkCbVBmvHlxOmRT0RFKC+gcpGZddkGAGL5BabVPIUmI8pFgmp8jU+gHvPkfuP09XerzzAvMyIMvB6eGPM4aVoSZqLC2ZAI1TGJu0RCpLwCnRifjIn5cFWNJv9r9zyGXmmuQUbOjv53QsfBUzF1YugiNmUVGjcLO/G5CvuXI2J2X2PH2zxdhPwE+6EdWKy1kllcfYl42rRmvIPf2tSFQp0oOOAQGCV+Y0MSfkop1ukS+ECWLNQhzK4MB2kpvzGhlvl4QKguiGnpICvGjk04NcG4dniHIGZmghaXBhi0Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by PH7PR11MB5795.namprd11.prod.outlook.com (2603:10b6:510:132::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 02:59:23 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%4]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 02:59:23 +0000
Date: Fri, 10 May 2024 10:59:21 +0800
From: kernel test robot <yujie.liu@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Kees Cook <keescook@chromium.org>
Subject: [linux-next:master 10918/12321] ../kselftest_harness.h:851:26:
 error: '_ip_local_port_range_late_bind_object' undeclared here (not in a
 function); did you mean 'ip_local_port_range_late_bind'?
Message-ID: <202405100339.vfBe0t9C-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU1PR03CA0040.apcprd03.prod.outlook.com
 (2603:1096:802:19::28) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|PH7PR11MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c882cca-26be-4fed-09d4-08dc709d31e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?azt1MWvIjZB3UZ8hxIid9rnu4W5EEC0WsAEWDeXck68ALSPFS90ieu/ugAJe?=
 =?us-ascii?Q?8RRGmFAOIcO5qXHF5jzp37s4WynyrCzZmciOZJMfxvAAazQDvbCAWrq0Tpqh?=
 =?us-ascii?Q?9QH8mprLGwrDL/4DHK0WCmhczu6IQyAT9o+MkAn2Uk7y+JziZ6p5hMZk1eWL?=
 =?us-ascii?Q?nSltjnN038GbPceaXE91+VaiFzAPrqmSUwqksEui9WWp+1EOJekNmCj4GArr?=
 =?us-ascii?Q?k35ZQ9YZQd64WQ60kOpFEW+84NFjldvzf2oPhO0wa473QCzndwmLZeWqVCc9?=
 =?us-ascii?Q?47oOIGJOYADGOVW9GSc339XTYAEW+MarUNj+6ANgO9usWthXiy6dbaeDB8BR?=
 =?us-ascii?Q?7E4zi4EZg2L3kTdvNzs22GFB7Q1eO4Dptzq3ptBSsYbRMoNB+TrjQPgCkA3/?=
 =?us-ascii?Q?2XB9Ag7zJ2Yz9UF2TUr4VvoFzTCmKBEQoCZxL2GT9i8FCED8QNxI1NTYwyUP?=
 =?us-ascii?Q?GprMWvAbk9EhmM/5noFZsf91hMLZHEPVdYi+DjkRGv/yKXw2qMvHiNdxEfhA?=
 =?us-ascii?Q?gWdeEa/eXnrwygJSnH33ZJNuA2uRHLDE7QnC0pqJzH9/ZOVketoBpYyzZ/gK?=
 =?us-ascii?Q?uef4DmOoHlYWgcXsi3Zc8TLvUVNxsLtvoMyxllAeHSZEEe35/brwpp1n+Qq2?=
 =?us-ascii?Q?ChkDcY2VFC5eu6QMiBL2cYlfDDpiGyGh3y/GMNRvssz46GJhZrAWyCxrRlqD?=
 =?us-ascii?Q?mbYQ3c0WegCK6xk3yP4a7UMcLqfBKt8E3oEObVgsMx6WMTza5UEN+76X1qD0?=
 =?us-ascii?Q?7gXbSwLYaejoebuu4CwcCEN7ZjFs5kAvGTKx6obFqjUWXoyxciy+WwO6ADAZ?=
 =?us-ascii?Q?3OQM6axnSMW90UTYa4qKjHIjrHuZBnA8Y0a8u5UpGFfZgASrphXY/kayIg5c?=
 =?us-ascii?Q?akNo14kMqVB5bJDP+E+sy+VOV7CDWAURMiG9TX0gcuZ9satICYoz6wnv4j1B?=
 =?us-ascii?Q?tqAvTpGcpXFP/4MJ1o+C+R25EIPrFEH0bwtYLX7hri0oM7kSxa8qVu4sfv70?=
 =?us-ascii?Q?EHVtLYiO5D54/nxBPO9MSUe6agwriwgm4X0pCyJMqv+Wn8mzsJgJdz3EC24k?=
 =?us-ascii?Q?UCWRzfDjB9ZJRwNl6q8oslhfXrAICixUDopp0uXcewwdZMU+9ceN35DHbf+r?=
 =?us-ascii?Q?6I663fo+CHEAQ0KxuowGiFMPA/uYmJJEYa8EtrEu6+5jRKfA6hgQoHjJsKKC?=
 =?us-ascii?Q?orVPA5rf5AhKMjYS+bl2mML8NeRUf1AuvEZhZ7lqeSuOamC9+Cf/PcW+6QQ?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r2Jl7Hdny/VOr6RiQzz/+/oOuz3WdSLEVvp5Rr9iSd1IK/OHFU/h1+YzOgvB?=
 =?us-ascii?Q?A8AdGAdiMXxKA/0cK+L8oh+ai8ua7OcXDATgd5fxM09gabD0ftMm3W0k11qy?=
 =?us-ascii?Q?Y1s1EVxwvcgcjWs057ugS5+k5CyG9XO4x1+O/AOuxgDzGPN39fIThpWapXIz?=
 =?us-ascii?Q?nVUtgVxpq76Ipbp+8srmsifmOmJVDcfVh5ps2noZA6KY3tKAbaTB9iZ6XmXj?=
 =?us-ascii?Q?Bl0e7rrgdXJ/4hWuWVPnzjopC2ysYbKcS8lDStGoH1mp1+sE3L3XaKweb2jQ?=
 =?us-ascii?Q?8TzskaXEw+9+EGIVlRygnBVwW/88rWfB3PXjEe2GlpXnJKuQrUlwvKFedhjh?=
 =?us-ascii?Q?Wp4ca8azZh3Pzo8YhIFVhlrCnZChW3Zy8RrUnreF1HT3CyLk6vyH/ggpRmmg?=
 =?us-ascii?Q?DWnNjYZjEov6xCNuZcBLa474r2FBzN5hLWNjxkfv1TMlDiqMQCwrnVyZGfxH?=
 =?us-ascii?Q?dL0KWPYv5j74+UXUj8Sw0metJYTCLDQ7hlyODe+IFghuOCB8sKD1mYYv6Dwo?=
 =?us-ascii?Q?02oyM7JZUBaQ2TtlOXea57AeuQq8UPyABvo53odbgVuDnkSKrgVQKg8LQtDA?=
 =?us-ascii?Q?CNIMz5w+YjjQ37NNpnlSd+lI6oHf2/Cpuak5ag8dTCgTC3IZbToW4fnkMT5X?=
 =?us-ascii?Q?45CpDQdR0l6N77UCfDIwPGHeO5srSEVau8W0T0BjYckah3HeP/dslKzJ9dT+?=
 =?us-ascii?Q?AHhe9nYWgbDwDfqXk1BBNdNrV477AQ1KSceFQ5/B6PLZvdskEDAg989xVJDW?=
 =?us-ascii?Q?N6W4+uHjLF28VeUwUp9RikNxf6SePIm9oklq3fsLKg3WciNU+KWVoNybd52u?=
 =?us-ascii?Q?hxvr7z3d2A7gbzdd+EWIufZa66eo77xORuIX07WKulAPKpaAM7lCunZnCl2T?=
 =?us-ascii?Q?BlBbbbhoNS159xUNSFAP/qs37RYUWQAcVT7VUmg4y1MgITXMnlGdgYmenIJp?=
 =?us-ascii?Q?gC2IByZCTBQt9ghxYpjBTAnxaUUW0JIylOKyZABJ940Ei7cz2gaakVzJrf4H?=
 =?us-ascii?Q?u0IIrJoNr6BfpSoRa899IB7F8QZeYRGCdS/4Er8mSqz7XfEKfZNbUskJfn4T?=
 =?us-ascii?Q?4aXy5RKEEJLAQ4+sXoeW9rp7wlg4LwLKLP6CCBtOMCsq7dq4ABA3WY/e8ONM?=
 =?us-ascii?Q?EI22t4/hocpCvKlkkI5YqArQc0Ah0WUa2Oi+J2/n4CmBSMU+MPQo5RkBoWVd?=
 =?us-ascii?Q?vGU7kMlukkk5hajv13tTxQEaTwhU0XM6iZtMfQf1OWPqTy1g+PjR7s7yeIxG?=
 =?us-ascii?Q?soO+QBF6tB+P3cK3FuJdKi634cs/l6dbgaJAOLg1mIUtU6vsTBpCzY0GkjNz?=
 =?us-ascii?Q?pCVdWSsoXJIqzM4BrauuigVUThx+XEpMiJHvuvoSTKB7fRw5ieDLnGpuplIX?=
 =?us-ascii?Q?UUFo6lQ3FlXIQo9jv6JybcU+E/rN1raulOnPZaKegS5daK/8v3qTvmf8eshj?=
 =?us-ascii?Q?CS87v0wbCmNzdilYXZYn6whWYbqa2u0J4kgbL/otMzUnQkhEl7R61Dtm/uBM?=
 =?us-ascii?Q?ZU8Ewgjli1B5/LS3cSdSUM6CRp4IWoj0DYVZD8Y4RBmXr6SVtHUYjGLdhPa2?=
 =?us-ascii?Q?LV5VH1mfoXhjxTBW2BDnQ1wUyDoLX95/+o+Zy/bg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c882cca-26be-4fed-09d4-08dc709d31e7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 02:59:23.2700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GeoEHRMxYmr4jPOmHJhBrYZdXAi+clJ6ybLRQu+rgemnB7h0jpcdHne7hKqbHdc04QVoLgpQ/UyJVtAdZGqlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5795
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   704ba27ac55579704ba1289392448b0c66b56258
commit: 8a25c905ae398bdd40f75cffed170516c749e7db [10918/12321] selftests/harness: Share _metadata between forked processes
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405100339.vfBe0t9C-lkp@intel.com/

All errors (new ones prefixed by >>):

   linux/tools/testing/selftests/net$ make
   ...
   gcc -Wall -Wl,--no-as-needed -O2 -g -I../../../../usr/include/ -isystem tools/testing/selftests/../../../usr/include -I../     ip_local_port_range.c  -o tools/testing/selftests/net/ip_local_port_range
   In file included from ip_local_port_range.c:13:
>> ../kselftest_harness.h:851:26: error: '_ip_local_port_range_late_bind_object' undeclared here (not in a function); did you mean 'ip_local_port_range_late_bind'?
     851 |                 .test = &_##fixture_name##_##test_name##_object, \
         |                          ^
   ip_local_port_range.c:414:1: note: in expansion of macro 'XFAIL_ADD'
     414 | XFAIL_ADD(ip_local_port_range, ip4_stcp, late_bind);
         | ^~~~~~~~~
   make: *** [../lib.mk:179: tools/testing/selftests/net/ip_local_port_range] Error 1

vim +851 tools/testing/selftests/net/../kselftest_harness.h

2709473c938602 Jakub Kicinski 2024-02-28  834  
2709473c938602 Jakub Kicinski 2024-02-28  835  /**
2709473c938602 Jakub Kicinski 2024-02-28  836   * XFAIL_ADD() - mark variant + test case combination as expected to fail
2709473c938602 Jakub Kicinski 2024-02-28  837   * @fixture_name: name of the fixture
2709473c938602 Jakub Kicinski 2024-02-28  838   * @variant_name: name of the variant
2709473c938602 Jakub Kicinski 2024-02-28  839   * @test_name: name of the test case
2709473c938602 Jakub Kicinski 2024-02-28  840   *
2709473c938602 Jakub Kicinski 2024-02-28  841   * Mark a combination of variant + test case for a given fixture as expected
2709473c938602 Jakub Kicinski 2024-02-28  842   * to fail. Tests marked this way will report XPASS / XFAIL return codes,
2709473c938602 Jakub Kicinski 2024-02-28  843   * instead of PASS / FAIL,and use respective counters.
2709473c938602 Jakub Kicinski 2024-02-28  844   */
2709473c938602 Jakub Kicinski 2024-02-28  845  #define XFAIL_ADD(fixture_name, variant_name, test_name) \
2709473c938602 Jakub Kicinski 2024-02-28  846  	static struct __test_xfail \
2709473c938602 Jakub Kicinski 2024-02-28  847  		_##fixture_name##_##variant_name##_##test_name##_xfail = \
2709473c938602 Jakub Kicinski 2024-02-28  848  	{ \
2709473c938602 Jakub Kicinski 2024-02-28  849  		.fixture = &_##fixture_name##_fixture_object, \
2709473c938602 Jakub Kicinski 2024-02-28  850  		.variant = &_##fixture_name##_##variant_name##_object, \
2709473c938602 Jakub Kicinski 2024-02-28 @851  		.test = &_##fixture_name##_##test_name##_object, \
2709473c938602 Jakub Kicinski 2024-02-28  852  	}; \
2709473c938602 Jakub Kicinski 2024-02-28  853  	static void __attribute__((constructor)) \
2709473c938602 Jakub Kicinski 2024-02-28  854  		_register_##fixture_name##_##variant_name##_##test_name##_xfail(void) \
2709473c938602 Jakub Kicinski 2024-02-28  855  	{ \
2709473c938602 Jakub Kicinski 2024-02-28  856  		__register_xfail(&_##fixture_name##_##variant_name##_##test_name##_xfail); \
2709473c938602 Jakub Kicinski 2024-02-28  857  	}
2709473c938602 Jakub Kicinski 2024-02-28  858  

:::::: The code at line 851 was first introduced by commit
:::::: 2709473c938602c3955b87000009e9bf3cd9bb32 selftests: kselftest_harness: support using xfail

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

