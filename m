Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8DD1FCA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 03:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685589026; x=1717125026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVXq/KemC+0tTZ4naGgkrCw5Ha0uhoQ+7lSO5P16r8w=;
  b=lcvM3BrMVR4WyqQZuPGAkMu8Ymu8mXX53eocdWGCx++taRjphv/bDyX8
   84boeUwQfxWEoos2RtOF3Cqd4e1fJlenclH91emmQmubO2dNRihKOpxp0
   rPLIc790DHZfE8TZpwhTvAMIhDy60IH8VU3kH1MXQdjCOHBE5pYpPTBJQ
   1LOPM/UsGFet0ubNw2LuK22smVi5mvTrMkFt0EsL2e8PSzU7wz3Z61LEm
   UmK61WEHNRtEOE7IQpCO5pD/XcRMDB6DfY9V/9b5s58eARYU/K7+pIprm
   vK/h/OjC2BleRT5tKYlSnLPvWNDWR1dqUPhZ5OdzCpo3Pc7BBlM/UecpX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="352937720"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="352937720"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 20:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="953898017"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="953898017"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 31 May 2023 20:10:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 20:10:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 20:10:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 20:10:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsKIszyAS0U1fShQoEhckZyblME4tu/n1x7mAsrxwxOidysDM1Zn2Q1b0wsOxHd7EFund6Hk5VgOMIzMW8V1jUcSh9V0abgzxI8WdPvwlzzuBOHr2smPXOwhA+YpYj9LvKj5HwbmwVNRWMQNyOhdAQXb50Fu7ZzMVbolEM1EP3899bPu75q+bxhUTvSV7Rs+4/uJ2t1Qx+Jq65DtvB7G3wKQ1Jk79UDvd7P9U3aCAX8p+gWWZWFRX2pyIPz1Npre1hR146x35Gm4R/58bczaJX6c4V1mbyIP/XbyhYZmRafti108m/MGTqSZZOzy9nbmuhCG+FuiGpB/zrurefCSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gUPjxIR+a1s1bCoKzH/QRbqe849baPwu+Wxhdaqvj4=;
 b=BjjOtKRjsT6SJRDNmSCP217R06p12t/MtfclWCx7GKA4HUm+hf/Q52a9Re1EBe/HRv6LlEmYTTeWbvXtIh21w07kCvb1AJv4ChlYexytIiIRZVV9mlP8uuwZQZ+4ipMyfcAlG9dnll1EcYLFm+dgGY6kqcGiHU5tK/3vkvzg9n75OT7jznYU7insnXCAry4OUSvlNLE+pBEKGgKtLRhwhWM+10p43Ff9sgE6ZH6pJZjFAHl282MA+sSQdrYQGv27dHgEqzzuIZFB/SBp36iG/S+fcdw/Gu/cIqODvO8RyR8m+ucUl++ORRWPWjdHReSTdp+71ihB2XvOOU1oIQiUhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB5599.namprd11.prod.outlook.com (2603:10b6:a03:3af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 03:10:21 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%7]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 03:10:21 +0000
Date: Thu, 1 Jun 2023 11:07:09 +0800
From: kernel test robot <yujie.liu@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-6.1 3/7] mm/page_alloc.c: trace/hooks/mm.h
 is included more than once.
Message-ID: <202305281524.S4TJufi0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR06CA0235.apcprd06.prod.outlook.com
 (2603:1096:4:ac::19) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ0PR11MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e3fe11-7915-482d-de2f-08db624dbbf2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /CHW88k6gW5C/QrigIWJXp9g0ut1krvZ7izXIGStr3efdqzYekUEizro4pCNR1oJ6Kwq+LAaWND8CLUCiiet6d30NUcqFMZhESsQ3obOvj7Po+z/UeQDZE+MFCi2wC/sAOu1mCt/xqfhS/OGnAdN3NrsxCGihgDinJD8LBNGg3cmqXCwOigFmuEMOTUCIXaV0bbelmghHXKExTT+vKAtU4GxLjHR9Zhue+rp5+BdZpHKZMfJ4Bwo/ssHtnHrAjOjH+bMNuNYkzK8vavBuC4C3Yi7ZC4/AuNws0LtYXV3ILEzFwAnTPWVZbCpBc0lM/5k1YQY/XedxmoZEJ126YA4g2JjpBdisSD53fQqRiVgyG4TJYStNueCMF/fzq6voH/Y7IDLEyoqdkli/aqo2/0dz6V/mnT0cYV+R1RKY7lHdmOZJ5QcQj9ssHiG/5c8pwOul4kCF9vnxIvoLiSqLsd/lBlcN+NHItzmPA6Y1p7+7fIOdoUCkYUz7acCVS9ip7D8YEjas83q3e9HanuMSO+nlQeYEALDmCZ0tizc9W69u6UAWwfZXT2evCvSJNTxZNhiDE+VuNE+dm84/PBN3Fdt9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199021)(66476007)(4326008)(6916009)(66946007)(66556008)(38100700002)(82960400001)(86362001)(478600001)(2906002)(6486002)(4001150100001)(6666004)(36756003)(966005)(41300700001)(5660300002)(186003)(2616005)(83380400001)(8936002)(8676002)(6512007)(6506007)(1076003)(316002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?geArTA+qdpM4KsSd/VSiQTcB5snWC4CP+DWB8bhtGs+8IpZkFxZyQ0Ty0tst?=
 =?us-ascii?Q?MDT/T07rrXSjIW+z2bt7i0TlUcZutGO8aOJnwnD92TxOmADXR7UWJgr8VC4G?=
 =?us-ascii?Q?Lt4b1KWpN2yse65PV02HjIcVVn5aJkMCxtuOxUSI7UbdttR/isSlJM4RDtEe?=
 =?us-ascii?Q?zD8vjy8Ivkyu4c9XFe5lRTQVYMOAvfP40FU8XhrqgchakbStSCd2WkcILsKS?=
 =?us-ascii?Q?A5QoYW6vHXPDxkxBwulYa5rZAqqi2w2H8zZGrDPzSNI3YWMK4XBaihMAS4yI?=
 =?us-ascii?Q?+dAN4KH8k8nQEXqmYjDNIrg4HVGSY3IDspC3pjptZu1NhdUnU9FjfDdt7M5P?=
 =?us-ascii?Q?YllqCqokx7S4Jc69O1OJDoig0MrOsCwSz5Ovw4Y4dCjURTiN+SSurSmqLNoh?=
 =?us-ascii?Q?JSUC549h2nrcVHKrZjdnF1nYqrojptIK8jUGA0YCUF/v5kC03Ga+1ifHIAWf?=
 =?us-ascii?Q?XbYiO3DbL6rZKVcX+aSLB9Vget0mxrEjXSWb9hncLOpvIzJhVc5ZX2JaFCN4?=
 =?us-ascii?Q?4bHR2kwScYf2tAIdiq4eRIhLKMdesztFBBx5J2pXW4df7SZvJkWdUCjtwVUZ?=
 =?us-ascii?Q?yX+/VjjSRLYYpfU6KZ3YlVvJ6QklWf3exov+4tiTi+U6pqOwtAJ75xl4rdi9?=
 =?us-ascii?Q?j0p3OF7tu6yDlrGoQZc0ANhDRnxPkmde/ONpBNYkOcWkAK/CWmFeJGKBojqF?=
 =?us-ascii?Q?uRFJY6ssHW3Kf/kAFbQWAgUiJk7ljWwG2USZEOF4mUcayWkke3hpY2HllF7j?=
 =?us-ascii?Q?5kJbNYfwqF2+Qxe3ARuJmSsGs4Mt+WJQDbMvVx1bag07zHXZtmGAGPCnLfVj?=
 =?us-ascii?Q?j9vZEsv/do6J1JB853cRYRJ4+N3sJ+qPZSrbxfq84imQ27XznlnJoxGQ7Sbd?=
 =?us-ascii?Q?ZJNluSmSq4L3oiRDyuqxmao5MjodZlxUr9OoXCGKKiGz8jZ4aDWIzYztXr8t?=
 =?us-ascii?Q?VNY+UCum/ruOvN4o19P3qg6WP4d/vdQwWKWqQbeFOIxaPkUqoz/XWytVHJva?=
 =?us-ascii?Q?Syjy7l5AkdugXECzWtUHcxVIttTLfWyMANHXHjIUrTs4NKe13R+PyFLNefre?=
 =?us-ascii?Q?soLcIYVF+JGVn7/+yZ0LO84EbG5/cQpDRvzdNoVpIBR3rYjTqDc+lyCzvQIR?=
 =?us-ascii?Q?oLAxeSu9Lml7dSfhvP/70Yy0xgc/AkHPfNcIkXGYeecAGL2Sb0YiTf63NJed?=
 =?us-ascii?Q?ZPhLwSpO+UBQWURJPk/QFWGyqpMaJVJlyFHg+Pkp2I/e+jEChY8hCv+WbskK?=
 =?us-ascii?Q?D2ODeArGOvsXqI4+RKPWgbiOLQVSVWylsjWAiPyZtGcPT3h3sIlY05Sp7IQB?=
 =?us-ascii?Q?ihOUSFtXSGhoqe+9ux62i7/3AP0bRTk1ZhHjoZWViUe/mqR/vZ1wzV5CPv0y?=
 =?us-ascii?Q?EDB313SHJ3gqbdvxfOUzqIHIQ9eYzlmzu1brn0sVZzV2csdtnFU3eblhZlzb?=
 =?us-ascii?Q?hrikolRCDODESjAE3bf6sqCP7j2WKv5y7rIFdQFC9L1DPugfr9NZ2mq8+QPY?=
 =?us-ascii?Q?IFe5vu/L2vWehyEsc7s5wkcbPhftb8M4TL32sMHeoOTznge6MxmM68npFYAt?=
 =?us-ascii?Q?zixY3q9MtruKxabVkbmza/Q252iDVCm7co/S2Vaz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e3fe11-7915-482d-de2f-08db624dbbf2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 03:10:20.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Js5/AZ9EVoVMeE08DqywDmhJPbCiBWZg4ntqi6sBJppa3SSkAiZwsUln3fwu2+oFLeA7RRF9LusgRo8vob998g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5599
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   500484f5be022b113cdfb97287e3491a149435cd
commit: 573ba7b6e66e9aca2fe4a1c982bbced96a0d1e10 [3/7] ANDROID: vendor_hooks: Add hooks for memory when debug
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202305281524.S4TJufi0-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/page_alloc.c: trace/hooks/mm.h is included more than once.

ba8f3587f5566 (Lin Feng                  2020-12-14 19:11:19 -0800   77) #include <linux/buffer_head.h>
5bf1828153445 (wangyong                  2022-01-19 18:10:15 -0800   78) #include <linux/delayacct.h>
573ba7b6e66e9 (Liujie Xie                2021-03-11 20:40:06 +0800  @79) #include <trace/hooks/mm.h>
573ba7b6e66e9 (Liujie Xie                2021-03-11 20:40:06 +0800   80)
7ee3d4e8cd560 (Jiang Liu                 2013-07-03 15:03:41 -0700   81) #include <asm/sections.h>
^1da177e4c3f4 (Linus Torvalds            2005-04-16 15:20:36 -0700   82) #include <asm/tlbflush.h>
ac924c6034d90 (Andrew Morton             2006-05-15 09:43:59 -0700   83) #include <asm/div64.h>
^1da177e4c3f4 (Linus Torvalds            2005-04-16 15:20:36 -0700   84) #include "internal.h"
e900a918b0984 (Dan Williams              2019-05-14 15:41:28 -0700   85) #include "shuffle.h"
36e66c554b5c6 (Alexander Duyck           2020-04-06 20:04:56 -0700   86) #include "page_reporting.h"
014bb1de4fc17 (NeilBrown                 2022-05-09 18:20:47 -0700   87) #include "swap.h"
^1da177e4c3f4 (Linus Torvalds            2005-04-16 15:20:36 -0700   88)
784f566942e0f (Dezhi Huang               2023-05-19 09:58:01 +0800   89) #undef CREATE_TRACE_POINTS
784f566942e0f (Dezhi Huang               2023-05-19 09:58:01 +0800  @90) #include <trace/hooks/mm.h>
784f566942e0f (Dezhi Huang               2023-05-19 09:58:01 +0800   91)


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
