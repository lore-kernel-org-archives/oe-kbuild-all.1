Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC8620EE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 01:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJgZP/08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702864505; x=1734400505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z6ckeiYS7WVZW23miynHk+2YShgnEYR+Z3EJBmCKA/0=;
  b=AJgZP/08orOKtJ0TqCygyo1HIW1wDvKVpWG+tPIuWDeDS/adoZCb8aK0
   DgPl+H4awuTUJ2ZJ74crLWV069ls0n39w/c7MJ4WrQbdLDTenmAQw8urf
   iL809QadVabMDiAeeVy7WWQs7iJT6X+1NTEuBoIBn+trsTi5Lg4XQgCGm
   igCN6NdyMxQcVqjAZvb8YI0JPHds6Y8uAR0rEWEUX36g5fFk3EZ8K6yjJ
   H/2Sz32C/JhqxrGiIgRf+fvgHMc0tucTxc3HaRY3TzjVgvbazFAkhBpTj
   dGSP6316gBdXz6+aIABiWpBCtGsuxf9SAOr9XFh9CbQXFSnNAL1FqULn8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="399278650"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="399278650"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 17:55:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="841312270"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="841312270"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Dec 2023 17:54:59 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 17:54:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 17:54:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 17:54:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 17:54:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cia+RfnW641sdXMg3HR0TM/R6eLGCBecRNpgfg3ERKO2XlQRSmm/Ne6z1IdJUrFrjDomN5UOFoRTmORdPl3OSMEzPjDsCP3+zoTkh/Eyk7H219gUCUb+af+fBKacq9u0vb16cF7Q3Ar+rJ8rcra2oYkf6AjKOXu+JZpEWcwi+XVusNFwwTBE3VF3OiCaPeziUHt6jNG4Wu46O5W1gwGHilYLoBh1ZqNvjxFA+xbctHKTTt9ha0bxoLibidpx9BeQ086jNf2BqIifFG7eDYzN1TRu0JSXUDmCSBMbZETjyi+qnJnz5yfjk5/UkF1mJ+bLrDSiYWTzhA1rFSU7tQzyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TJfWcWkqYXecyu6xGm4qpgr6gLbwKtGIdskeZzlsxQ=;
 b=PRsAGK7QQFJXJLboWANaPXV6BsWjkSciKXNK7AbwcBkZHQfUEgcoi6DGpTOdSMCr2oAhFJT+D1Id+UemtPFsp4mkuJb4k47kFYwVDKF/EgF87pDD14yHL9cxMHjdFsTKnbhWlOkAGvJOaxzTsHZXsvYeHJUYDxWoZIunwybZyY3tZ2+pZH2hiI9HY2csBMAOUd/RYHT07iWNIGgVEjcJYA89GY4Yjim3nCmleSPoUftIpDHHBR5ZKgA3SYAfa/LnZ8Y5tAymtL+T2Dym5afJfXE4ySo1VJSpxkiGrRTtD/iqWHCmYAUSRDTwjyAzdsxUvd4XiXVXIKt2K23Xp/d3AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 01:54:56 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7091.030; Mon, 18 Dec 2023
 01:54:56 +0000
Date: Mon, 18 Dec 2023 09:50:30 +0800
From: kernel test robot <yujie.liu@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [djwong-xfs:xfile-page-caching 113/208] fs/xfs/scrub/trace.c:
 xfs_da_format.h is included more than once.
Message-ID: <202312161233.35VETvh5-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:196::13) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CH0PR11MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: ba42c8bb-f64e-4c85-0c1a-08dbff6c5603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scRXLkl2Gu5NKJjfG6EEWZa6p9/kaUjrPW8oOKvbT3Hi+igQWld822UfUGZuW2gOhDD8G6W5FXEv3Ujxe1lT1937GzIPKukZxFmc4XTTN7uX8yhw3Eneaw/Ol6yXkfl8xzeJn+aCJQRNZVwhMBFaWqMzK4BmSRqKMnuk9N8eDDQitsizKytksa2HzAbR+j1KrAUdsbfgMFqLu6sRD5+Aj1YqxRW6G400qvuCt3tycaEH3+p28ZOd9pxUc6NFJ2mdXPfWvaNMx/Ah1d1I7nIpDqralnpioJ3Zy0Dtm5bsdn2DiFjzFBvYh8ANG9wwkqbrSg6Tjn8jnrzpV/0mstR6cVKhYzjjy02sqzqittGKNdONmtcpSp7fLhFgVsBpWWg78Jma94yq1FHWQv7stDIElx3aTlBDf93a7clo6ldDW+XEb5ohKE5OzVzNOKt946mbnAb8T4FGfK2nrDArNGlZkM5YwfTvxQTAmuEa117LWjcmN8F2zLXAefNhA53n20d+OzxTmrvC34nsh/mNPBacI4niTBu7C64xHsWsDw8ujGC7LEMjepGGxnTOthHx6aD0Q41FTMJS/ex+iwVFIOOnBqWWIysv+KBk/r1WkQaPE2qSiICG5eD6WVvAj8DMnOWGrwtFYprf8/AVB8oIwwlA3G7gy19vkQL4CFgpR06Evbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(376002)(346002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(451199024)(1800799012)(26005)(2616005)(1076003)(82960400001)(38100700002)(36756003)(86362001)(83380400001)(5660300002)(6512007)(6506007)(6666004)(8936002)(8676002)(4326008)(66556008)(66946007)(316002)(6486002)(66476007)(6916009)(966005)(2906002)(41300700001)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EApDmL8bT6I7PBTc0ZKFKQcnsO0ztgTpeD3F1s8eMqOlteGpszDm4uh7ba8z?=
 =?us-ascii?Q?GPYBUTMjgsYrcSbGRfrqxISsu0NVkZt/VbgD0xSsL6OZGkUPZGfrp7nyD6vV?=
 =?us-ascii?Q?HIH9goZFHeg3tiAMjb+X0RaK6KkWB80BosNGoaudAJSd6SocEpIisd1Ra3Iz?=
 =?us-ascii?Q?SoYA3mMH0y1q4uOE0TZa6uiuzdTTvb4L/ztJp/Mso1F0zNs/rRx3Nbvq6rBg?=
 =?us-ascii?Q?LMcpzoQh5PYpEynl38OyDNvNpg0r8d+RpkjjqBIXaFQGeDBjU2fRTuJCbI6h?=
 =?us-ascii?Q?6vSfsEGvGOmulGX0mbKUEywW/B+CBlEVnQpOhL7d1mzieLMlZ89MfnDuxUFG?=
 =?us-ascii?Q?pkWdYxgm696yyi1wlnBdksD9bG++n6UxHi4pus/C6cTmLHBRtdLM+L8VB+9V?=
 =?us-ascii?Q?8b/7ewVpTwQSXjpA//BIbdYta0G5dfgjX2g1VgapaYegbbYHZ0D+z3ijjPp/?=
 =?us-ascii?Q?qPPJZ2gMXSsTTv6/eapHmUlHBGXKHq01M3QO3VLgBCPDYX2ZsqEBPFpi45hr?=
 =?us-ascii?Q?RFWC/d4k9cV/fRLz8IpwLqe/aFJWsZ2Yg/j7wCb58MwSCnZmvPkIGClicDtW?=
 =?us-ascii?Q?d9w0hVPxtB0QY+Tco5snTVXLY5VlRis1JBV1dDzL5x5dKA2+QCKhOfTRuQyP?=
 =?us-ascii?Q?OalBO/CDfpgQnPsKQXqc2amK9IvmtEKm5iZW+OuxApYqdlqY8PSvWfeezPlo?=
 =?us-ascii?Q?ZWd8NeD0WWH2Ffc/YuiNt0tDBTX8bxCgACzaTXITcRvooa38pyrRkyT7+Qa7?=
 =?us-ascii?Q?xPSm3Zy7xk7g8ODCgKSLzArFitFewomWEXvDhh6vgQKFI88//jw0yiDb2HKm?=
 =?us-ascii?Q?EIO+jjkG8LYtu9+l/rVzvjhbtybj0PxFyH3SVhDemGJ25b8OW1g3MIso7Glb?=
 =?us-ascii?Q?ewr5Vj93aKvPmBBOWsdv2mHm5VidZM8fsYme4W7xoE3DRtyDEM0Ma+eaeFe9?=
 =?us-ascii?Q?qFXcsPqScaJh3J2o7ZFtR5HkmCQd1U0N/sxe+NliTOI0EkuRSZYKqwj1NYe2?=
 =?us-ascii?Q?+7MAQbQk/N7r3wr447LGUmSEs0V7rbDc9qgQSMP1JSsQ5Bq2PPvLDdVIvJHM?=
 =?us-ascii?Q?NJ4fOJi1Mw/yVeeuPB+D9AXcoffOZdx83+8BCn2Ll5Vjo9J/aMSK9Al7rj2r?=
 =?us-ascii?Q?YD6mh7Htg0R3WaBpvwM0zn0/JivC/o7q932bnXeP0EXcKLgYRskrTYgcO9u0?=
 =?us-ascii?Q?faPz0E9efM+KI1p/coJEXrDHyIC7A+MAcl3f8rvjGBfOMYVpRgPNyFLgWzak?=
 =?us-ascii?Q?QMPna+D/7hv//TOsMqQbxUcd/Thk2cZtbxswQdI0FETHrLBmdiDXhV4KcBnf?=
 =?us-ascii?Q?yrnYj23PcfkFVI3uhGFgUuQLJOyVAfhbpikmmZuotYfD8f6M7YyQl65Nt1FE?=
 =?us-ascii?Q?yX5miA1PfUwi8ZSHrIfMkUwxCVerCzxo7wOU4hpG5fbrm5x3FsmGMoIvoRH7?=
 =?us-ascii?Q?W+GOx1f9McQzdLl9TAo8+RlC/1U2/nIb1cRqBKqLh/HnNG//kaZBkoIU/2qr?=
 =?us-ascii?Q?ZiD/Krf+0UyHVl2GRwO5vfn/hyr24sS66BBKD3rEhs2HFgrel0yDJvS3QEVj?=
 =?us-ascii?Q?dJ9AgRSQiYK7wED2Ecpmq8aPHT0DhKqzjb7Xmn1H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba42c8bb-f64e-4c85-0c1a-08dbff6c5603
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 01:54:56.8689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlHag1IeAZrALBYTxLYwXHcD7t+BG0pMFlUZdQ4gGWw+FhiNN/tR1w62ErKHU5fPVx76RATvvb8fMJI0qH9Ffg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   a040f4e3129669cf8ac70b7d3518a21e27e212c2
commit: c729d275332b258f6e328a1bec1aedf9cf68ea7b [113/208] xfs: connect in-memory btrees to xfiles
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202312161233.35VETvh5-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/trace.c: xfs_da_format.h is included more than once.

vim +20 fs/xfs/scrub/trace.c

  > 20	#include "xfs_da_format.h"
    21	#include "xfs_dir2.h"
  > 22	#include "xfs_da_format.h"
    23	#include "scrub/scrub.h"
    24	#include "scrub/xfile.h"
    25	#include "scrub/xfarray.h"
    26	#include "scrub/quota.h"
    27	#include "scrub/iscan.h"
    28	#include "scrub/nlinks.h"
    29	#include "scrub/fscounters.h"
    30	#include "scrub/xfbtree.h"
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

