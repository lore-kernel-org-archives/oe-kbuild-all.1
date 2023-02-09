Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8C82107
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 08:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675930540; x=1707466540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AgLKdza5lr7VaQuEpMAMr5OcdgJ2U2IEw669AdzS+uM=;
  b=BpAb9GzziQLs/ADh0i0v/GgkNfIuh9e1Eh8S8h7md6DOUq7wRRR4CL/Q
   SZpPXk2n6zOUhwajesgYp7D83wXAh/2NS+30Y531DUdvyAjI9nrkhI/uV
   yLoqCthMpoQKety51rm8uDl47VbWZ59vZKHwtFRd6hwBWDf0LrktRmJ1Q
   KYcjDRNe2EdgZ8k/J5UxXyWK6Mw/2k3WfPjvDWooh4VKelbfeb6v6lYie
   c3vUO8k3VcJlDiuXbGUdqCdKGozWEdrhk7HY2eUMwdK32FMZ2S93P9aA4
   SGLS5MOC0I2B9HTFVkIRtnYVgDqpxFBAeSWmOK9QYug5OOXnvmh5h8ZK8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309695977"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="309695977"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 00:15:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="667555666"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="667555666"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga002.jf.intel.com with ESMTP; 09 Feb 2023 00:15:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 00:15:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 9 Feb 2023 00:15:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 9 Feb 2023 00:15:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHjI7/nzTDRLe8OcvG3wy3weR0mShLk6pSxTy5SRBwNMZ3Ndwp5+sJkD74RvFd7Y4oD4To8akJbOrtpSWXb5ZvdrMKOVUDZVEhJMLqU441g3aOiVOy4V6nWvKsrU7kpP3JWNgFoRYOMxroHVG+24ohHAVEj9/Gyqpzwse0+TzwOZVIeMFtf0cY6fyn/qqulsPbnZ0f/XOe9tmi/ZYc82A3WOQdmuu9AHlfzzQe1PwwqczARV6mr/fID/698BNvK8HD76Z9T9+8hjLVWThKHN6GzNCeLZ+qNuAYDS2puzkgeBSjePtXLVBta1zoJpbOGXvjecft296+KO0FipJYbqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpewpRgMN+yb7P1jEKMDoRbattmU2+/zYUmR20V8fSQ=;
 b=X7tctdwTpkcipcdXE/4CEPu+jyU+un/ib1wpnuKJaZBkXHo6xa424EU/yD7TWtUPBIEOhp4rRwRuPKTzJ9kJ3yac04XCuc2IcNMBQ+TrjNfmezkiJVm+2u8oPzISGiWIzO78rwnjJHPGAccGzORIjKOTeb3G5uHHlgq2TgGIzBYWNUPPIAQPustWM00Hj4+Du/V+Cp8PMGf4LEis2HlgPkD4qsJVzh2PdU3nvBlyYZpwAZWANZmsf0i/lHn6QzNlZeBV3r1WGcoRVDYMo7J/cSrbNcW+DfkmQ0AVe92yFnKDEPII3r8w3VrMkeURcuI315thAYymLinL/R+Whpql/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MN0PR11MB6280.namprd11.prod.outlook.com (2603:10b6:208:3c0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 08:15:18 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb%8]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 08:15:18 +0000
Date: Thu, 9 Feb 2023 16:12:47 +0800
From: kernel test robot <yujie.liu@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [djwong-xfs:vectorized-scrub 409/495
 fs/xfs/libxfs/xfs_rtrmap_btree.c: xfs_imeta.h is included more than once.
Message-ID: <Y+Sq/wsnR84ZTUA5@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:4:188::23) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MN0PR11MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: 638ea589-be8a-47ab-eb1d-08db0a75c7e8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LvsDndyE6qao1Mkj6ADbuPEkqQ/yuDrk9M5G3r7p9nENg8eaKx1ltUk7uNjGbeUkr1nS17uphz8/oJBIH4RiYuIBRU9Z3QpAkVdbxHbOGORl98To7WZmKaLx16bCES3eyy82NTRi2Gw/b4bPh6O6s39NDC+e75Yw5oTbSrU+DIafv1RknqxGordxk3c4PNmy2J/Ls135611bL6n0XzOC6IS6tCvQudffLmh4g33k+UIO3GDfhfeheCCyyAzKTcL5+deOGF/C0ONuB/ksPIvKJF6N8w/l+zHANRwrN3543OP0ZdkpJq6RDS+UpsvROWkEuEfg/g4QfVKJndpzLOVDQ5enat+SFa0NKdUBML0W5q2tEu/eHELQY/gfDDnL4Cd1/se2atLAMchKpnZ2CDVDmlpz+jEaFPvTrpFqEWqRiak3oK+ZIg6OGRJWY4m79GJazJVA5OZMXnXicyjRKHBRjcoSarvhOwv2FXHwBd1wESbpmg4u6BQ/i9pImTjcifLqxBoxBSOF9lCXM8rvqh6MacQ06w2tTcaaIFYwotFWg97u+bI669UsqmQud48nBuDisW+tDWa5ggUh7Vrj2UKTab/voPfZUfnOIJOCJbCgbrpdOiCDY3N4gx2bUxA/2bA7pL4UxF/vccxWX7FvFRpP4Spdu22dw0WtMPL7KVQKjJtXQM0YRBNoMs+8+yzlqfyYgyOnWT9Pc/oP4JLzj3WAzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199018)(2906002)(8936002)(5660300002)(41300700001)(83380400001)(66476007)(66556008)(66946007)(4326008)(6916009)(33716001)(316002)(9686003)(38100700002)(6512007)(86362001)(186003)(6506007)(26005)(478600001)(6486002)(966005)(8676002)(82960400001)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ix9WU8u1eTXLd0aDP9Bq5uphXKMzzCak/c7fEsHPo55LoPOrTmh3dlSMkp8D?=
 =?us-ascii?Q?nk4Iy+LRdwiZd5jWSJlAyavPpBqcndwQ7p82AVIrbxxr8OjfprXwj6PtIKep?=
 =?us-ascii?Q?pFmtlG282dVign2zX0sbzr+HRR/JHiMLiVdRS/7lw9QdNH+4wjKQbX3J3W8o?=
 =?us-ascii?Q?TC4g/ADYyaqkvTzbFnNe7MmliSBdN2unV80SdUCzThJpoXbk8XVeSAbRUpgY?=
 =?us-ascii?Q?yMuAjQXbvMPXFsEc5T1d7QNplftXO75++ySQm1+7O9iih3unLSEq6Wlj0uwg?=
 =?us-ascii?Q?la6laGjb5mBzggmtZXPDSYyZGOWqCYmoLvccPOu10r2u/4vEFv3gEc49eHSx?=
 =?us-ascii?Q?8rGq+Ay1DJJZwAwvzxejUvJtd3ymhUoZJAD4h36W0ciq6MlfcUIIvjqAFqb2?=
 =?us-ascii?Q?u3QAHgXCS5Q9uNz7U3STNz8rekxiMFcJ0KL/WqrOjYP0nq9ztsbu0pJ2pPmR?=
 =?us-ascii?Q?T3GxDuFnqAc9AcYBuQXE+t9t/ee9GEAs/RO3Vx5ieqJ5XaxqPqgGWAvM/RQX?=
 =?us-ascii?Q?w1i4gEtWSkOodOhi0YCIwJ4L4v39E3sx96tsyIdED6rnZ0SnowSI5GUhwySh?=
 =?us-ascii?Q?Q0gGXwx+AG0B2lYso0x14X5+xB+bEzS5FifLG603b0CXqDeZ6eoEy19y9OTq?=
 =?us-ascii?Q?Cjl1ZINCy2m2GF9Sbs0vLW5iw8dEGHp5xUniJvGV82gVyVGhghAds9LDpbC7?=
 =?us-ascii?Q?uwZlH+shgPMDTwesNYS9+nTM68Qv0g0ZPQuAmWP8hes1Y9jU8aeWfNvUr6Hd?=
 =?us-ascii?Q?IVCsu5aQ3zQwuB5zxGgInxRHLWuGlITNx/HOUfnkLKAYZA6d4eREItuSxNy9?=
 =?us-ascii?Q?bTzV6qbGdeq4Vr2Pov8hJzBaYyDF3tM0wTA4xdHhGgDpaJp/MYNzI5Iw8fPW?=
 =?us-ascii?Q?vDqCyXoa71tTdXVnT+IsydlsLfgfUKOPLlG9SJMTyXV4QQJLWQdifwPSgwI1?=
 =?us-ascii?Q?ESWAUony+tp5z6JicTd2SleAsUneaGq4aVw6hdACgYQTCaPzt7p4ZqUb4e0v?=
 =?us-ascii?Q?3qU2DvTt2lFHIm83K2ym9XhCyxVFBFVflyZgXLwz9BvKpQRrrAYqg5ZkqlNW?=
 =?us-ascii?Q?HphfuyN+Eho/oYxMcYYoV1qMXYVXXo78waWV0RjDV8z76FIaP/eJ8iIfD0lk?=
 =?us-ascii?Q?mF4Rz2VLTls734Aq2aX55eumfg49eY+dwA0At+6LJAqkAMfXRGrWkPz3clyd?=
 =?us-ascii?Q?BPMY4WKbkmVVMxDZZHLyUGhHqHl33VcLght0/FjwyZ4m6CY6yVPlT0pW6V+t?=
 =?us-ascii?Q?V2TIQxsjPEwGw9eCXPqBx+MuJ0OUIJujwaCt8G0NmwN0BLs93Lmy39QTbHBa?=
 =?us-ascii?Q?tnHqrkc1mHlORyI0xQnlpZ5BkB6jUUPHqjPAv8kVjyPkwlMn7fOS5nP7iElT?=
 =?us-ascii?Q?pgJXKsGS4/EHSo7R8gtjWEBXF/0NJwN1ooY0LnBwT9KMy1Xu/kheOw8ufYPh?=
 =?us-ascii?Q?d/cAk/ptBbVDOpDHp19Kxdhu1Q3++pQ+Qav9wRmqHkkkAorPqdT8wrz0ii4i?=
 =?us-ascii?Q?g96YjiubLnAHeqJZxfRWu39ZS3lIqsQcGZXeVT17anXbioQ/l9zmX1hdQPkS?=
 =?us-ascii?Q?vSPFQZZqq/go1nmxILxjGMc4ryyelbDQ0BzMtKc9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 638ea589-be8a-47ab-eb1d-08db0a75c7e8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 08:15:18.6469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQYrlq6lXzd9C7FVFMnDhn6buuI6zB4aJdV7QIL7uRonuJ5KV23QpmUQ4vubb9wx9QlXWXMyBOvSq+GfT8Z0sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6280
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   4315ec0cda3c70a7df76c2516694e6d1219b2995
commit: a11cffb94df7caa5fb43d3955823fd07d9113b16 [409/495] xfs: create routine to allocate and initialize a realtime rmap btree inode
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_rtrmap_btree.c: xfs_imeta.h is included more than once.

$ git blame fs/xfs/libxfs/xfs_rtrmap_btree.c

d0a5d5fc4e9a2 (Darrick J. Wong 2022-07-14 11:15:32 -0700   20) #include "xfs_btree_staging.h"
476719010b0c7 (Darrick J. Wong 2022-07-14 11:15:36 -0700  @21) #include "xfs_imeta.h"
8022328a6d398 (Darrick J. Wong 2022-07-14 11:15:33 -0700   22) #include "xfs_rmap.h"
d0a5d5fc4e9a2 (Darrick J. Wong 2022-07-14 11:15:32 -0700   23) #include "xfs_rtrmap_btree.h"
d0a5d5fc4e9a2 (Darrick J. Wong 2022-07-14 11:15:32 -0700   24) #include "xfs_trace.h"
d0a5d5fc4e9a2 (Darrick J. Wong 2022-07-14 11:15:32 -0700   25) #include "xfs_cksum.h"
d0a5d5fc4e9a2 (Darrick J. Wong 2022-07-14 11:15:32 -0700   26) #include "xfs_error.h"
d0a5d5fc4e9a2 (Darrick J. Wong 2022-07-14 11:15:32 -0700   27) #include "xfs_extent_busy.h"
d0a5d5fc4e9a2 (Darrick J. Wong 2022-07-14 11:15:32 -0700   28) #include "xfs_rtgroup.h"
8022328a6d398 (Darrick J. Wong 2022-07-14 11:15:33 -0700   29) #include "xfs_bmap.h"
a11cffb94df7c (Darrick J. Wong 2022-07-14 11:15:38 -0700  @30) #include "xfs_imeta.h"
bf92705cafe97 (Darrick J. Wong 2022-07-14 11:15:41 -0700   31) #include "xfs_health.h"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
