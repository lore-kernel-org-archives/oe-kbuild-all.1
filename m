Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D585C85
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 06:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685599209; x=1717135209;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=GI5V5wo2xWwKJ1IRMzyxGKCuYEOxeCe2SHJuuwMrCOU=;
  b=J1zlfoHUC1Q2VHXofaiikQzEseacIiEeDiUhoZYTkp4q4SXdBFZjxzKd
   PCYmsO9YuqOP+K+XRb45I8KU5Yb5Py8dpJgKFSGN9kblutC9EdWqBr6Qh
   ZY2qNmNZJ5JDiGKiiW10z3Jn1Ts5kRYwuPyM+N8zbYNOQ/wZpjX/KLDqy
   ks+XyMJo1nzGtEvz3MOPvsF/xdg6Xueddk/iSl3O1ygX68R8raxNtvsFL
   Lj81ZXOfsRVS0cnzV3jTFIYOt1Xmzswgspwl42sIIlld6v4QEKzcsmc8s
   GOVonmx1T0Bmu1ejsgOWusvYc+aL7M3SqUWjUJz6LqF/GxWeDl+TOxJ/I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="355469473"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="355469473"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 23:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="740240710"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="740240710"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2023 23:00:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 23:00:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 23:00:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 23:00:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrcZL2b/iGaocahTvq9iQ7xpczCOqpRnDNmhiTmJwONllcBMY4Eo86ZgYGcEU9tGePagrqqY2egjhJ+sZhZYjIPlFDY4UFJgYxEHW6jMaH+H1sTdD5OERYUoAjYAmHdNGKRSAy8RoQEGU62gu2Nlr7DJ06M0Xw8fngmqTyyT+zZrzUxwsY9PhvOLzZ00BcrN6qvSa4CjhPDlAhTr1hSs6/PT50+calPkFvXcnijlf4b+6rBU1sMUHtGRLrrQjAt6Q2jal6mDCSOLtPks6nZbGoc95aSvkaupMAam2kz8bR0UghqauDVI7PqnROATtJVfAd2XwAyPVcdl0joOquRdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yT3pzxJBq3e+vjqUCZc5pCAmt5eKrGQMrnHgnnUu+IA=;
 b=c9Y4HL6bwAUOT3sMUJ74Ml7C/9llpw5kP6KQg4l3Y3//4zV+Qpq5vOq1tXWVSnJEK+QZKogHEajAjb53PUL0cdtGMZcLweBVs2Rsb/eIlHYw9ESlMbziOlN/T6dwJQrgKUM4XFpc4J1Hv7Oj1ijDpudw5lZ+CUJ59hdcYYXm4v2sKu2nNCbXZoOye8w9C+V7W4jy2CpUe6eFa5Xfh6vf11ckekrH2Bt5tZdBMgg2lFoa+j9tmuerlTFLE/itTey4jylcjgb1w2Ty+v4TKQ+zve3PpQXz7zOiBPULJjZgedrD0Jg4Noobb42lDhqpDGTn/z9w3pAUaAy53+rJWjYWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB7607.namprd11.prod.outlook.com (2603:10b6:510:279::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 06:00:04 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%7]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 06:00:04 +0000
Date: Thu, 1 Jun 2023 13:56:52 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH RFC v2 net-next 18/28] p4tc: add P4 classifier
Message-ID: <202305181621.3GcoiWn8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230517110232.29349-18-jhs@mojatatu.com>
X-ClientProxiedBy: SG2PR01CA0151.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::31) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH7PR11MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: cb13c62b-8227-46db-25a7-08db62657136
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /TXk6Xpgy2kQhkI9oB+hMeSj1pZTgxkKYfjXPVHbAtyfDOnuZ0GWtOoTyc8p/dBxd1ZbsWuHCqI08Jv+XvI9eTeF1duQgLtRjKygjEJkVUAzK8u66xvPldwW2NRWhaUWJQrLEbEExNEJoR70BfuWuYc3nlzpBycu4ErGcX7JoD8HDGh2iIy8HLDoeHIY7Xp5RoE9b8EDyUiz/zEjU/R5AGswVaUgVMa6psJRnMvp6W+mklLXAatkFDtkGCGNlyAqn3I7dnrgaFpaexuf5r0b4wSXCsDKQu7Z7pBJtqaABwesB0/ehmIFNQvFlse4w4BdmTchPXT6xMog3u6mkqOXvpc2C38T3+YV6LvKP1C4NqSfIAIoMUQPbB9kZELp2+E26uREMtC0i/bDWMyr8ZrzQWvXCA73D5+kos3CUnatxJbTMNFXzil7pFexSUW/x7A+m0U1e3I3qA6EZDTgOHz1613tY3xlfnSxAMbsr/jV04pUwsFmuWVR/t+79Lkm+rSB0lvncbTANjs0OTwgKpWajF/AGC/z8tMEaIA5Fj0rcuKopAY3k/WUvFA3Ji4Pm9QVVKZY2NFXrrutW05ve+84t7P1tyM9ZbjJlKpsjtwWAuDAa8b/EP1OxbUC9JiTXa/+Xxp3ZamusHrSQTqufQr+vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(6916009)(66476007)(66946007)(66556008)(316002)(41300700001)(4326008)(8936002)(5660300002)(2906002)(8676002)(966005)(6486002)(6666004)(478600001)(82960400001)(6506007)(1076003)(26005)(36756003)(186003)(83380400001)(2616005)(86362001)(6512007)(38100700002)(32563001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sRFtUzNJebBxsFKuzxhL521QLwbwo+GP2W7mmC3iM3QpIH4LaEuzwU1YwB4z?=
 =?us-ascii?Q?iOQqArikaL+rmRGNyQHbAcb3UtVtOkkogOIwU07funsmaZksNCUflG1sEDpO?=
 =?us-ascii?Q?DxRPUGmDOh0XISgg5qKeECNPOyZrfu4sjmAkpZUWcjwoerpkTcUHQS+Sgivb?=
 =?us-ascii?Q?XebX8cQhIelrgap6mb9quUByAdkG/8EV16kWGCqYv7fnfHttBp9veDpS6V6f?=
 =?us-ascii?Q?RFCdWMdLDpcV00l6o0twZN36uVhaRlO6L7PTEWSa0uqEIMtHNligK+GiQI40?=
 =?us-ascii?Q?oKHbreABsIU6Xw5JqRx2+TtBc2NiPwU4PXIkrLilIjaMhIkdmLXodqZTFRf7?=
 =?us-ascii?Q?fyAHvdCeVfFL6AH91Dc6YbXtn0sDJi5kqgi+Va8bcfb1yLjtXKHM1+3bRvHa?=
 =?us-ascii?Q?HrVOhzFWbs+o/U7PZfsIGR3TC/EzV5eS5SdpcDvSYmPU5/oP4c0/QYyWAjYJ?=
 =?us-ascii?Q?dYM82yd9aD7y5hRc5JA/Sdwswqe87d+IbDpyWqQzfELIdQHoWCgx5sfc2glj?=
 =?us-ascii?Q?gE6oEl4jKnl4QbUo+ewI7TFnwbkKkTCSCzFqHyrWo53JGFjYHahVSEd8LTaT?=
 =?us-ascii?Q?TkFILq0a13HFFFsrrShyXZ14kn/wmgyuSTyGc+D1X50JLLG7DxFcdKKWpSSs?=
 =?us-ascii?Q?8H03TcmbODqO4u23OtfA78hh+s3u+UH4ije2IV94qhyPyRqwM65Kg5pgg1x+?=
 =?us-ascii?Q?F7m5ZN+OYsYtuDoa10glRqee1XRLHr0/e2wkrnj/lznhbvGddDFRocA4JwBY?=
 =?us-ascii?Q?WGyt1236nnrzZty2OdmEKpIgLlG6hkOP+mU5DH7hc9uFyfyXeitfACZUpDHt?=
 =?us-ascii?Q?EF2YrFq1IJi4QSrpd7Q/njLsq0ryb3GntnkPLlLjDm3DIx52r7qkfb620Z6s?=
 =?us-ascii?Q?1OrCZSDGNhVfIZc9sDc1783IgoXQ0RVcVsMPaynKfRcvJ/GP9mNkOuN2sXo/?=
 =?us-ascii?Q?tRR0S1+918ENEtQQaC02ORQGISnsFhFlWVXStamTBCpPAfKgk3qdfIedmDbZ?=
 =?us-ascii?Q?sVqGwYyfE6VSMApTr5ekf/XNtKcsEUtaA5upHWwl+gJV+1WgtaRTzgr//UoA?=
 =?us-ascii?Q?XZjkjPFQBRWMksL2AX1HQh04sn0/ucdzVgAnwGfSp//yk+7XqAyKkhq+SsjK?=
 =?us-ascii?Q?Q2JJLh94lR/7Hwf/bvzScvcZ5APFihnTgw3FsZTnGy1lyeHEPaq5nTxXpMFb?=
 =?us-ascii?Q?fZUa7B8SlTQl4KKozMvreIMENyu4sEucYW0roFHdvdo93F81Be3+dFC/Tmyv?=
 =?us-ascii?Q?cXwv47dwKoYHsnLSVU5PAzjCrw+QF3lW48WSilv8kD6N4akjn+iIUkr8G1F1?=
 =?us-ascii?Q?/V8J218MUD9/W37C9/nBajXj67Yr4OIT5YjG2bnw9DYhGSmn6oRe/sxJIFrq?=
 =?us-ascii?Q?FHK8+qTTC78Q1ItvblxJT/ed6YTwSwMTlAp4Q+2oHK/V3jcjk3Rouon6PUnM?=
 =?us-ascii?Q?gFmDGBWnBcq7o4A/f9d6AhQb3PDyuj5vuU3UaVXoncS7US1f4JfbKRprFNo8?=
 =?us-ascii?Q?mQImWuy6rLmEvgTkSeromv6OjKBaXEaopaST3VyB8TG9bjN+lsXbh7F5MaEe?=
 =?us-ascii?Q?I/KbrTYxbty9lPzeMgVd8ndsEvYYiOaVg40Q38XX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb13c62b-8227-46db-25a7-08db62657136
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 06:00:03.6938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2EKrVjkYfuVRhTpmpR8po79WwHBDgZzkPwj8cwgP9A6IvrHd+jPkmpwsLncnd1kKwG0n9Rh1ALzFpDBH0ZjEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7607
X-OriginatorOrg: intel.com

Hi Jamal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230517-193344
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230517110232.29349-18-jhs%40mojatatu.com
patch subject: [PATCH RFC v2 net-next 18/28] p4tc: add P4 classifier
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305181621.3GcoiWn8-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> net/sched/p4tc/p4tc_bpf.c: linux/filter.h is included more than once.

90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400  10) #include <linux/bpf_verifier.h>
90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400  11) #include <linux/bpf.h>
90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400  12) #include <linux/btf.h>
90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400 @13) #include <linux/filter.h>
90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400  14) #include <linux/mutex.h>
90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400  15) #include <linux/types.h>
90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400  16) #include <linux/btf_ids.h>
90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400  17) #include <linux/net_namespace.h>
90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400  18) #include <net/p4tc.h>
90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400  19) #include <linux/netdevice.h>
90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400  20) #include <net/sock.h>
90c70f7ced4ac (Jamal Hadi Salim 2023-05-17 07:02:22 -0400 @21) #include <linux/filter.h>


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

