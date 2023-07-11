Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB5C168CE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 06:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689058688; x=1720594688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QUrzh/9yWqoIS3tYfLgqvCwu6U25jg+95ku8xOuq2HM=;
  b=fLeYiJzg57oH6gqo0C+laFGEgghTd8kAk+r/DVWdjgi7QJuAwFxJ2lz4
   p1g1OnaTb+VlPifHhB4gac3QtArvayWYWVd1+m9E1agdeqO+D7Ge+f7qB
   /yriXJdACdHx6KpuyP+Z35dJPjzhdl6t1kUNjKheZYIvJO0P43jyHeNJG
   x9JpAtwf/yxAbeakinLH/U5L7eRCF4z7tUs7TkdlVa3XBoIieitRM5bCB
   ELcoGWUW1Qt9JRMXmsZHrDlrqtT4mECDQZ5YULip+WP4Mwnm+2T7aMnbO
   IpkNUdseuuMeCYPXcdLpxCGNtryqackRa0HD40Z7+2Vt1jsAW5QXlPsDn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344141134"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="344141134"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 23:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724318563"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="724318563"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga007.fm.intel.com with ESMTP; 10 Jul 2023 23:58:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 23:58:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 10 Jul 2023 23:58:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 10 Jul 2023 23:58:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSCEYp4dEDw6GruEYK/vTdfeym1ViNIe92KqkqsgeY5IW3Y8sjvDhqk/AkB7jlmgTb7HjA7iu8uBQ1oRodmS4iZ4s6NPs5hfi+Cycx7gYVeLdZcetlLqg2araxr+HwCY5xUmAcsu+JtuMqkEQf8LIZzOWH15mVN26pg283b9N4z4wL5a5eH5ZtqK78WRo6XahMozPlQpz/cqxspOIOThJblumslp/Lfn/l6j1Ci/hOjZwMC2vMaG1Saa8pA/W/xJ0XtvKGF/JcqXgIZ5s9CtNjDVr6q2yW2Jl0DCo+lVKZY2CyI02+yA0z2Zgw3hWuxB6bkZSwbqOyTe6EqGgLyJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGn7OgmGZsd0zeWMnfaqLS0WtqYID9F/K1rkDb7DAFY=;
 b=Exd0kmC3m8PbayrCCOkg60/b1g7ovy86UtEPdFmMd1VchvlyRA/AivZRhm1b07SFOtXoHZaxJl39peCMfDCzdcO6QVuMrt3SYA4Oy51I5gp41mOIAOCFDvwruE2jKCExNtqkl2wS1Ay967V7MrZaMV3YToSP8E0S0Vl4nTpKkOBfDnBL5HLNKpL0L7vN0zpcrhQ5b+VIMp6QqBMfSba3zN1aCpesJ/RWl9nHNTzM4xxPxbsNISNdzoYSEslT3KOuhluNd5f5Uy+AknAan+OmuiAbMIFV1zY7WoetCVeXhaC4GeNtNtXHMD9FMOJ7ErjYVuro+kaqzUMsS8a1/ldk6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB7973.namprd11.prod.outlook.com (2603:10b6:806:2e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 06:58:03 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 06:58:03 +0000
Date: Tue, 11 Jul 2023 14:53:49 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
CC: <oe-kbuild-all@lists.linux.dev>, Andrew Morton
	<akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 7/20] kernel/signal.c: linux/file.h is
 included more than once.
Message-ID: <202307081626.VOmT8STW-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SN7PR11MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: af6ee38f-a269-492c-6229-08db81dc2bca
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vUQWjjW5RZ597G9xCaZ6hD45qjY4OVhZwLYf9UJUMKMWMB45uGPlobuY3zAjL8rdAlVJHRdhrJAQ49xTq6bm2TbYx79t5rjSIlGU2/C5HlNTkrP6QPHcOeJwLaXar6jLdD9diNLXH5khbh7HYu1HQNhqhyHqHPiOGcN+E+VmEonb+u3BXxp9tIRTU3hAWTS6TCN0xDyPVlH/4iAzKZ05Krhd6EXqUQUIJzn5P/sJ5X/N0pKrlT/r4rcqoHw47n/ZzH8NISNcmFd6s36cNOk5jetDygVNvW3BvvnIclzOKxzcHBb8rhPs5ZO/1jFCRBEXtCrxnoSjSVTQ7KHk1yph+rgRcwXXVwHit8X5+SnIwf0vgrsjeZuzLcIhfaO/xAjUU9+HxuI8mWEfNlpcXm2NmmMpLL6+CEAafupIhwm3X7Lall2ACQ9s2dV/2mmkusDVMkJKibQpqzUrbrlKR6y2eHhmiuwFD5GdwXQd0SCRLe1ZYPuWbp3GccrLkW8oQ/DLbChh28cdYpgBHPTjz0RcApIIp8VV5+TCsSeHpk580pSNt82JX2uxNHb3YrcnHE6DSFcu1EVY0IXk/EWCS/WkXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199021)(6512007)(966005)(6666004)(38100700002)(66946007)(66556008)(66476007)(2616005)(6486002)(82960400001)(26005)(478600001)(186003)(86362001)(6506007)(1076003)(36756003)(54906003)(41300700001)(83380400001)(316002)(5660300002)(8676002)(8936002)(6916009)(2906002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bMSx0/k/0KBIr6DU3ldub57LDxui9IlywWpwPx2fLTw2Qj/vCg0v5UMzMUnf?=
 =?us-ascii?Q?vI/jaNzMjjhbl4hY1H3buoJ2CZoSu5biro7V8kdmv9uaKisI/3Z94rhrr7Wk?=
 =?us-ascii?Q?p+j0HBHoif6dLoh2OHiRcvw2fheZ0S5PjnNwahnbqXvr+t2eN3W3fBSuRE6c?=
 =?us-ascii?Q?V/IGVAb7tbWIEJdeqO9HD+K3nhQkpluCKco4Circ6/EQQXEcSTQRyMvzqNAl?=
 =?us-ascii?Q?T+f34q7AH+GYyAX4KzEsHEYFaRZRvts/+ty+f6Yl52hIS2dEq5ggNhUFHaZY?=
 =?us-ascii?Q?jry//JJ5oUDkIlrETRbc1krCvfwMCltWhrsrQcT19WLJnwDzI0Xzgscw3dP8?=
 =?us-ascii?Q?01lFKmrqpumypTeBqa12jIs5JoabcRy7+FKFDtYB3Pvte2uuYIFhraNmDkin?=
 =?us-ascii?Q?EnbOI5jq9inab/ILOplADhwGd44RoJ2i01yG145xF0BxRJ/1mN+0/M1EP1ZO?=
 =?us-ascii?Q?xogXX4V13ocQBKJ9mr20y1e2BcHNzb/fvm2uoL7Ky2EqQ642tcv5442y8c8p?=
 =?us-ascii?Q?CbKAECtcpYKrkoeoQ/Y2f6dAtgWtWSSk8ERtm7eWgxwgNGWRgJZhzPgD3Px0?=
 =?us-ascii?Q?EOpYEEGYEverfvl+ZuQtUzkG3PAYJ86AdxBYsG7qy14XvTFWrBOcLQE9MOEE?=
 =?us-ascii?Q?KX4qYIapzNcNzWhzg5KDNWs8CrRfdwl2UcMpGJqmhs7qKf9KE1aiHOBbmPs2?=
 =?us-ascii?Q?ttsAwQG+iRBPvwePAG2jSvIaQuCGQlZWa4WNXQOccnOhhMhwHMvWMdQhDkn7?=
 =?us-ascii?Q?8lL/iO3T2r7sjvIFvU8GSI3a24HZ84YFAeP0aS/DMFY3yuk0AzqV7eNIBZio?=
 =?us-ascii?Q?CdwE4d4ROT4Oq1SMdiU4UNxkqwSdUCrmjYoInEEewuUaQc468ZY9j6NA4zMI?=
 =?us-ascii?Q?9JJu5S9tFpKs3+SbhPhsO8KhqayfBQujOD7QGjZhLJBdo7cFsl2d8QpTPh8K?=
 =?us-ascii?Q?hRZgW+6K1U3fB04Slfx9KEDgcknyfaJ8Jl9FKI3xqQgR6mLrv9zaKvYPc/M9?=
 =?us-ascii?Q?HG7YVkUGIFjuggiQ1M+zE8GkWrZxBDysOcFLuAxWE4/0GQOU/kp91B20XyG4?=
 =?us-ascii?Q?T2xhFuC9hvmn4DokPelD7O6RyYGUQzyBsoJLHK20MbB7JknBTJnXhkcvvJQ+?=
 =?us-ascii?Q?wXafSEPJk59IOklRHc8p3XjIlASY4NilOQNJaUo8YW6KmkYze9t2SSi+2sAd?=
 =?us-ascii?Q?Vis1LPwIFMJEa5miOAk4wdXDRgUIhanwY4VijH3Qr2X6zBMGOTN1d3mmWAHx?=
 =?us-ascii?Q?aYHTIMvtyzvZLTzedgtUdHEmIPnw7GLcPGBntd42Ez2+uWZ1j8+4M+mW+OZj?=
 =?us-ascii?Q?1lqzJcoiowMte4DDdVhN8RvDdHpj5u6hIRI0O8rRUeIsB7Xebw2aPoyBJ0r2?=
 =?us-ascii?Q?bAxYQLN9vFi4MBFZ2BGtCvY1pyNAoK5MzuLDN0Ts8qpXc2/191b5zTt3mDeQ?=
 =?us-ascii?Q?L96ReyTJWtVwuqt0G8b+cAWLhzUlRborzDNoSWC/igIhZa+d0EkKQSB8zq34?=
 =?us-ascii?Q?Adym/oz+0CvMEY//7QQ3bw4OPVIpzDh04D0RPYuHNO4Z45b8ddaf8qhtjrx1?=
 =?us-ascii?Q?2RSzI3dXwxV9HrcJTPopudyGx+wm9s9BX9DSY3WW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af6ee38f-a269-492c-6229-08db81dc2bca
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 06:58:03.1642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXSfNOMEfRYvg/2I/Rpovjfv0JY33L4OPfhFC2oc+9/JGn//PbA48VJMnrp3QSb0R4ecrozMzFwgtxB2sie2tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7973
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   cdd54ce0ffc0c99482337abc8f65f4f7058e1115
commit: 0646c9dc794fe4d3ba48da9dad37300e430e6eff [7/20] signal: print comm and exe name on fatal signals
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202307081626.VOmT8STW-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/signal.c: linux/file.h is included more than once.

vim +23 kernel/signal.c

  > 23	#include <linux/file.h>
    24	#include <linux/fs.h>
    25	#include <linux/mm.h>
    26	#include <linux/proc_fs.h>
    27	#include <linux/tty.h>
  > 28	#include <linux/file.h>
    29	#include <linux/binfmts.h>
    30	#include <linux/coredump.h>
    31	#include <linux/security.h>
    32	#include <linux/syscalls.h>
    33	#include <linux/ptrace.h>
    34	#include <linux/signal.h>
    35	#include <linux/signalfd.h>
    36	#include <linux/ratelimit.h>
    37	#include <linux/task_work.h>
    38	#include <linux/capability.h>
    39	#include <linux/freezer.h>
    40	#include <linux/pid_namespace.h>
    41	#include <linux/nsproxy.h>
    42	#include <linux/user_namespace.h>
    43	#include <linux/uprobes.h>
    44	#include <linux/compat.h>
    45	#include <linux/cn_proc.h>
    46	#include <linux/compiler.h>
    47	#include <linux/posix-timers.h>
    48	#include <linux/cgroup.h>
    49	#include <linux/audit.h>
    50	#include <linux/sysctl.h>
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

