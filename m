Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075B910F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 01:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713489771; cv=fail; b=PvgtK5DZ6yUKu9eA/+HQhbizRe8IU/j5RcJMzllxzMPi0N7rA3CoLjvQMj9FZo5lxkE94I/+bmb7FMFJd+od+12Od5XMoDp1Nc+6U+PJanrXLU3zJgml5LncshMS4esoxaJALAM1RxHQVfKDoZ9WcJy2HHCZrpC/iGuCfbLHQGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713489771; c=relaxed/simple;
	bh=4bAlmRZ+AE9g5usliSlYIoqJUoMjfB2shrGV5Rcyo94=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rIM+No3VHfoznkSEFeztb9HY9cBbhYXjvcT21sN+SCE+Xr9d9CUDwaCHsx1S1O2N9+QuNgye81GPudOJktjuLQFwiFIHVXyZKNIjEHStrtg96/ujYqyLRc/QBzlDDnGMNjYCgzi3PaUfw/5sFGo58HfZDSYzrOjZDwILdwPl4Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERh8tkhc; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERh8tkhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713489770; x=1745025770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4bAlmRZ+AE9g5usliSlYIoqJUoMjfB2shrGV5Rcyo94=;
  b=ERh8tkhchskTxlB9KT2X71EhafFJBEFyduevQ3aQrQSmmYq4hGs5LaJS
   3j1HEW5h2dyNfZynPSKulQ2vzxNRTVrS+oVpoEQP5xwa8IeYbStBP1o/9
   hm9pldC723qoM/KTaVVeC59/F6eZtOYgGl8U945fUJKNUDoCknfuL5i9s
   7yibTk12TE4N+QkUATo1OMjXvhQruwTa/hI9hR1CcaiqXPe8jBXerCFT7
   X3JQtNqg2sdywi5Q+X82TAEOzazctJw9vtEdm0D2ROVckwNNmNIbbWRcM
   ggATGg65yhN6HtOz99OX2cTLlz673zHcMkGagd57t+WhhjioYRL6s/+lL
   w==;
X-CSE-ConnectionGUID: XQtKQh8NRyujM7dsA52Orw==
X-CSE-MsgGUID: 3Jbr6BDaSia2/M2NGhal6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20218018"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="20218018"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 18:22:50 -0700
X-CSE-ConnectionGUID: wa3HH+3MQYaqjjQg/nx8YA==
X-CSE-MsgGUID: jXAFN9SIQae+ZM6WbH2gEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="54091113"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Apr 2024 18:22:49 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 18:22:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 18:22:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 18:22:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6mzvoBMgJ4OMhoE9m0BMtBaG2XAT2QoJC7tH7VgCMvD+t8CcgtDPCLXdsKwa/LZ/2Dnd0oAyV0FB7cQma5k3sVdshOhujpdGUtKrXBc/IYj0G+MyYpIxpKKI0r4dE3QBEgH2XndB+SUe13lSImzJ+ST5rd4LUPdisLI3QP781yc2/xIeXm1innyPYMdmuFB4ux+V6gwXRqgvfTEsteQiEzfHI3vKQ3att42ueEg0U6WzZLpEiMYDhODUcsORbCULTGPOqXD6IQ8AM0JDwZGNcnTq/R+yZtw4ye3XMH/Yhv12HQH8zq9BshvQr5DXbrQZxovAGMqohcdHzbHATPT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0f9A84PmHmn3wdl/QgpxxIJcSZijZzioYxH05pvyOSE=;
 b=HDUu0gH79FYVVHezKhzxH8VwfOC+AfrjhO+JkyzV3OiE+VFxPK2Z5Ihgzffqt1PMh2bEWOOf3snyyDt/XNuoUOYOtJBIA+4DQk5qjAEuFcf8A2NN8QB98u6m5qMTmPtsFk7CxrNlalq9geodkeSzIw4NxIbXOkCfpiXUgAxQGY156KytkHFKywJYooQi2JEgr1fcpE9ljWDafO8iroa2Bp5O8LkShYLrRQoHZSbzn7LuFbxGgnvEnC7i8P/gAzwqGOGirXHz4GYVGehaffLKk/efSoM/PaA6luST0QsA3D+Kw3VlVOCta16sfScq0pBGV61muqfrHiq9SeMHDBmbUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by CH3PR11MB7772.namprd11.prod.outlook.com (2603:10b6:610:120::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Fri, 19 Apr
 2024 01:22:46 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 01:22:46 +0000
Date: Fri, 19 Apr 2024 09:16:12 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Jeff Xu <jeffxu@chromium.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6378/6705] mseal_test.c:84:59: warning: format
 specifies type 'char *' but the argument has type 'char (*)[5]'
Message-ID: <202404190226.OfJOewV8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|CH3PR11MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 8255ac2d-8014-487b-3e7a-08dc600f37f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: Q+xpU7cSXBeEBqeYp0czzo2uVBpFcTY2YBDEiPZHAcCEMBR91VIydcXQbZcJpc+M31fd3XvtJZHNCSIE0n3t4xxOcAxTyeU4DospFwKwTiYyBDT9BQeIcdbrVM9KCLs1nKgNMu11Kox8UtiD/hhysAClSDygoyDWY/m5oWOUFN5EyB+U2iXvo8drVyPZHuJMCWC7Rak0UUjtw3echndmJbPohu7OwTREW65IUEfqtaPaclr6J2a4KecgTztiqNpf1wl4H8PUCXN0NJ2QsCeoDgyAln+FmktGAWznghyh/vjoXAzOi3nVtDzv360qNCrWhv7lWZntddKfwGaBVTtlCRWforowYWIU4zhL65WQkB2kgCxgw9SrhZ56fjTawxeb3FodDMjEYAiqFc5j4r3CCzATJPBsIe+K6VDxdLeynLImgss6Qke8ipbZuYgawp6j6Vz4tfugGX/eg5NY8h1rwliqsaw2pFlj1SX2Jl3LSjH4nXngnLH6Q43VdkelzC5gXi6WskruM3GzOf2Wwu0IEm1KfTNM4D8fnfsz/1kx13O2is/jnXZRhB5TFmSXb+AsUwwp7eTnVkGET/9Iu+ePIwEkf0d/8Vvye/IwhM5pS7LaSWc0xaRxI6tmlolgxwe1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?65SwPzLO9VuEGnORQxPLp711zcRfsjMSdT71DLywEeVs+OGrZKffP+3URoua?=
 =?us-ascii?Q?2Gmy0smC7hgD60qlCmUwj6mO/mbnnTxdi39EK/hCtbCKirQii+UufXr4Q7Gp?=
 =?us-ascii?Q?lk9F88O4fedg4Up/1WGuPf7sMzVHhLrnGtgSd14Vx6D3w2nRsIVrkmdwqnXe?=
 =?us-ascii?Q?h4z2lSwmniP6Wa5F5b79h2NkU2gimdPr0Flw+rNnYCmX1fR+yT8GYuDnwPec?=
 =?us-ascii?Q?dr7qDRcdFx/a6pkv2hca7ayosL4KcCis3sAfVvyhqxJ2Srgq8OivJ54hRxtG?=
 =?us-ascii?Q?pSV88nAc9RDA+zXk4q0KjCsBAP/GGTbzpQKbP0miXRaE6e9MLVjbMmEHLH+G?=
 =?us-ascii?Q?CNvdwC5PK51pMHeJ75k2rs53D8eXl9/Q1TBgi+dTKCkYGNxdoDWFryy8PBoL?=
 =?us-ascii?Q?YxjlCouHbqaxW5oEOimktvrt6qKGp0EfC0zlED7qFCuqsce40/aBW76d9EWh?=
 =?us-ascii?Q?MioLBpjaQYJWHOeayMa7sP77+wDC5XZNm/t3QhDIzI3NIqWht6S9KGz/zJep?=
 =?us-ascii?Q?khBUzEHDtlRPsX1n72yKjaqTundU1X3FBvf8J0CMix9DIfKXkUiHnSFb77Mt?=
 =?us-ascii?Q?b3YqCPwlYXN+jvFO+oVDrrrXYku+4XVla+BBeeqQ4BGXNHlObeCXCzSS5RRy?=
 =?us-ascii?Q?0JmPDXD/YjbsR+S704PX6TVi0rmzIjmKaJ6VvsWHd0kczjXU3H9GbgFy36Ih?=
 =?us-ascii?Q?cO7Fk4Z58CVXB7wfhGofpLdYY63PnM50q0JUkhG3phnQuPHKY3+lnreWE+GR?=
 =?us-ascii?Q?I3JOlFlDw7hOZcfL5HDR6VI4eKlOFPy/AiU6SgfQU2W5ZZtUYe9MKhw5gsKP?=
 =?us-ascii?Q?6Py7RXHP2xdBRaOoShmeIO20HEAvEILn35A1oyzxKffckgIbaB1jfqqkl1si?=
 =?us-ascii?Q?SEjGEJsDb9kwCJzOhG8da0WdIHDrpBSwR+MJUK607T2gvmnCpdKxwIM8Onro?=
 =?us-ascii?Q?hW9bduGs/bhGKDPwYlaFhbDBZPs5gyS1nfG/SW8G3C3MZvZcK6bq9bMuLZug?=
 =?us-ascii?Q?KlwAEyiVI3LR3t0qwQpmjRfCoGFSuokybClp0VsWF0sLhab2z8ur0i2r4uvC?=
 =?us-ascii?Q?R68L+QD/+Q9iLfUK9Ww5bEJKbQuuVpUm5LDXRIel0ymBIv//ZbLoqvtJNefq?=
 =?us-ascii?Q?d+gP84XH6D9lmu33uMUF4PXxzWFoAmu0Y1ixMNoCQ7VxXsvNvcHxi4eejnAY?=
 =?us-ascii?Q?vqeLis7cJQ98kEURLf7hZM7+6Tcca2f+c0b8y0U3UUzir10AOwTHsm0tZsF3?=
 =?us-ascii?Q?CQk+17w6yfIXrPA04J3KJmZZdjv+yiQM7J8mA8Z4VYDo2NTQwwDVQa3XNMKW?=
 =?us-ascii?Q?yaqV848R6F6JaQIRTXi52fbnVm9/yh/a733ecg6C++DNn98j9IEdqScHQqaF?=
 =?us-ascii?Q?0gqSqVBxQIyIhMqimNXa71dgSx1Y7TJkuXKPIgKkA2jaln5S+EdxahDQhbSo?=
 =?us-ascii?Q?+ADimPKr2mNtPfbz0YH94S2AeKqEAZZHPsE6djrGPaiEK+yEPc+PeFiP10tO?=
 =?us-ascii?Q?5YJmIzMJCIGDpbEnK/+3Xh1JqcvJkRpUBlYpGnR7oastJ0OJfKkBQPnOj/BG?=
 =?us-ascii?Q?0H3lD5AF1AoOo3Rw9+bjjUvYVoyv0tV56ZfajUZW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8255ac2d-8014-487b-3e7a-08dc600f37f5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 01:22:46.0937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rh+h7posZOclJjlPpK320E8tsoCIACrCuMjDg3HHMNkRhNOaAHKcctCLjRocA9v9RE/EhojSurAPPZBF7TTsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7772
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b4f2bc91c15fdcf948bb2d9741a9d7d54303f8d
commit: 87c436bebeeb885b21f47a7dbcfc548e9679c688 [6378/6705] selftest mm/mseal memory sealing
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190226.OfJOewV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404190226.OfJOewV8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mseal_test.c:84:59: warning: format specifies type 'char *' but the argument has type 'char (*)[5]' [-Wformat]
      84 |                 if (sscanf(line, "%lx-%lx %4s", &addr_start, &addr_end, &protstr) == 3) {
         |                                           ~~~                           ^~~~~~~~
   1 warning generated.


vim +84 tools/testing/selftests/mm/mseal_test.c

87c436bebeeb88 Jeff Xu 2024-04-15   69  
87c436bebeeb88 Jeff Xu 2024-04-15   70  static unsigned long get_vma_size(void *addr, int *prot)
87c436bebeeb88 Jeff Xu 2024-04-15   71  {
87c436bebeeb88 Jeff Xu 2024-04-15   72  	FILE *maps;
87c436bebeeb88 Jeff Xu 2024-04-15   73  	char line[256];
87c436bebeeb88 Jeff Xu 2024-04-15   74  	int size = 0;
87c436bebeeb88 Jeff Xu 2024-04-15   75  	uintptr_t  addr_start, addr_end;
87c436bebeeb88 Jeff Xu 2024-04-15   76  	char protstr[5];
87c436bebeeb88 Jeff Xu 2024-04-15   77  	*prot = 0;
87c436bebeeb88 Jeff Xu 2024-04-15   78  
87c436bebeeb88 Jeff Xu 2024-04-15   79  	maps = fopen("/proc/self/maps", "r");
87c436bebeeb88 Jeff Xu 2024-04-15   80  	if (!maps)
87c436bebeeb88 Jeff Xu 2024-04-15   81  		return 0;
87c436bebeeb88 Jeff Xu 2024-04-15   82  
87c436bebeeb88 Jeff Xu 2024-04-15   83  	while (fgets(line, sizeof(line), maps)) {
87c436bebeeb88 Jeff Xu 2024-04-15  @84  		if (sscanf(line, "%lx-%lx %4s", &addr_start, &addr_end, &protstr) == 3) {
87c436bebeeb88 Jeff Xu 2024-04-15   85  			if (addr_start == (uintptr_t) addr) {
87c436bebeeb88 Jeff Xu 2024-04-15   86  				size = addr_end - addr_start;
87c436bebeeb88 Jeff Xu 2024-04-15   87  				if (protstr[0] == 'r')
87c436bebeeb88 Jeff Xu 2024-04-15   88  					*prot |= 0x4;
87c436bebeeb88 Jeff Xu 2024-04-15   89  				if (protstr[1] == 'w')
87c436bebeeb88 Jeff Xu 2024-04-15   90  					*prot |= 0x2;
87c436bebeeb88 Jeff Xu 2024-04-15   91  				if (protstr[2] == 'x')
87c436bebeeb88 Jeff Xu 2024-04-15   92  					*prot |= 0x1;
87c436bebeeb88 Jeff Xu 2024-04-15   93  				break;
87c436bebeeb88 Jeff Xu 2024-04-15   94  			}
87c436bebeeb88 Jeff Xu 2024-04-15   95  		}
87c436bebeeb88 Jeff Xu 2024-04-15   96  	}
87c436bebeeb88 Jeff Xu 2024-04-15   97  	fclose(maps);
87c436bebeeb88 Jeff Xu 2024-04-15   98  	return size;
87c436bebeeb88 Jeff Xu 2024-04-15   99  }
87c436bebeeb88 Jeff Xu 2024-04-15  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

