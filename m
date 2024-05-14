Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC7817C2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 01:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715649244; cv=fail; b=tupv9DLu8dddQaPcIXRgDdZRuNmTy7mNqIOwr8hC2xuWkHhJrlOr4GYzejGHsLxzuInQRH2EvLAa/MPoVOad7FumigSFr0uJtE5gMG4wfHN++i6Do8QiBVmJPxQAtkQ5OxXenFxc5xmeho7KWms59Q0zZajVmweSG62TdZGphZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715649244; c=relaxed/simple;
	bh=UG9eZiCc0PJhpbBc9R87HThgsQkA0xiSLLxa0FUIYjc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=T0/jUhmzxI23Zqr1TtWphEyZ117Rsj+kCgx1L5LFyrOREO2yjX56uigS5T60rfT6LV3JT9J4B96HmLe8vldFYw75QdwWStcUIBNU6n7flrTz3H4/q9ZCS1kZwo7NxpNXLGGb75LLlL7CVEeIhpH998hnzRVHWCtSam/74nT9vY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHWA4vID; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHWA4vID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715649243; x=1747185243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UG9eZiCc0PJhpbBc9R87HThgsQkA0xiSLLxa0FUIYjc=;
  b=ZHWA4vIDFGA9ywyeh6bow/2drddaGlS7j77buRokTTvEy/HsS71oWi2x
   UrfJH2kMVM125TyF6ZILnaOoWfKgMJzAuqK3zu274I9aVytz77mNQz+eY
   wNRiGvAknxveMhQ3Alwf2OxGqQdjMsmaqajVqB/ci93XdimJZUaZja+NW
   S+w9G6oXyl6Rfl/9DwIXE2izqYGakGwOSkYEKbUBQBbyPCQ6IHY7EyzWv
   UAuM2Mm4NuZTdMOR3BZ7yYICLubf2Kv06o4+9VAcURVKStjW74ApLMZKm
   ketKAKGdiObXAfM6A24OBfMLGqOjHDXkRpap+bZB0ssPppbeS12H9Gp3M
   w==;
X-CSE-ConnectionGUID: sUfNJ2GCT1ipm29moS3clA==
X-CSE-MsgGUID: Nt40rUOPRmy0YKG0Q+nLvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11781999"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11781999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 18:14:02 -0700
X-CSE-ConnectionGUID: D3n9kez3R4+b6VW0YOYPxQ==
X-CSE-MsgGUID: LLMvlpIyRB6uok1Ba88v2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30636576"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 May 2024 18:14:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 18:14:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 18:14:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 18:14:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 18:14:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMKfYWcuduf3JW9AoX6AJ+mrX1qQu6KvNNx7UKvdGaHuhxVzbbDViWy8L3I2Zl2QHtl63jCohRMjSglozjshNKiXPxR4BruIFHOtp3ZJdMJTxD2oSbq0/+Jf4P4byIbV1up/OluIvlc8gegLfu8TbGR6PrUUMkQgGggQo33Q/Rdujv8t0dReSpQvHgYA0sgs9iRfnnfjFpWI7UNrpKrGIE+UfxV77UCkYpDkdKeymY5wK87g0quNMoLGqSTGdlXmu1He5r68L5Y0p1uIeoECcOwSWdGSubyJbDeDUXWfzK7bPwJZUTxoRcc2ELG50STsmIOOHMH8ABtt2GHTJVg/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RczO3Upc3BC2NQsV+jXpujk57EHT0mVeT8NLnxiDbf4=;
 b=Gu3RsJOBIzuLRkbHNYIgeOfKC++iFzol/6YMoP6tP8bDUw89EKoSpiJ8vNZc3H/PjvNx3ylNn8V9Qkw9je8jicDGgDOb0ln7R6e0iUo4DhqQZ77BJB57aHOuzkZz7Tqq6e/2oshpYM8cbc78nTIzaYzdt/2i6WRVow1peTc5s439mwtEaZY9c3nqKapmrC9LnMnBY63txo0erVyqSYOHNA138o6yv15o8shIaROhrJN/SBptcvaKCRP2gM6ufyYQH4FhPJgzpxa8i64u8u/674j3BBg7F4lika0OAvst9h2zQJyPQ2wN1C+gJ/e5Bgn74WMKy1PJYhNrByC8MUCGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by MW4PR11MB6740.namprd11.prod.outlook.com (2603:10b6:303:209::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 01:13:59 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 01:13:59 +0000
Date: Tue, 14 May 2024 09:13:58 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Ben Hutchings <bwh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:b-4.4-st52-rt49 231/395] kernel/rcu/tree.c: linux/delay.h is
 included more than once.
Message-ID: <202405131926.EpWnrMxy-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:4:7c::33) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|MW4PR11MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: f599e770-5db3-4943-d918-08dc73b32238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+o+2aaipt1nfzhYFyylPOgGMpgtCWN2MVsL5H7+/mQHDS5TGCmOQHvHR5P6V?=
 =?us-ascii?Q?jlmGc8QPbRapQQEe2kCbGK6LJRLTZMMTlqO0GkJkJ6CTZ9TuY27FFclyJ3Ho?=
 =?us-ascii?Q?AB1Q2yOHr4VQpYKWZe2Dl99z0D1cXorOTvSbwLyy4plpeDaUTnq82xKX3UuE?=
 =?us-ascii?Q?BikJUjLgFJpvQGbu8jIRT2nOVnkk9Wi2evwUwU6HyF+IlQktXTt7GGMvjODV?=
 =?us-ascii?Q?5rY4eb2IN9sDWmQEdf72CKwkriCYANPcWHBQDyYxP7mZRftFyJTKcnxkYsWe?=
 =?us-ascii?Q?jI24uH/4i9JkoM9bXczvtTYm13uxozbY+l5kV2rzNH1JtdN3KRsW+q4cnr5h?=
 =?us-ascii?Q?OZoddM/WHnH86ibOVr4QhMEEUBadeoe4wcjGhH99lTLHq6mldBX+/HACNanE?=
 =?us-ascii?Q?aRCdqI4bwYkp17L/f9KhbCknXdg+jITvn/1JQB3iekNEuc11+d3TJvlxs8E6?=
 =?us-ascii?Q?Shl30XJJq3jh/PLUu/1OczD9NTzwbfcm55xSlhJ7EGj42iI1UxpvDQkjMXEd?=
 =?us-ascii?Q?s5WZGJiB9mNMtRorKEmFWThe7vEE8mvXrXOTsQzGIeiqZz4g6gh8pVZtuBvI?=
 =?us-ascii?Q?c+fGA7FU9IEf07pubHlz/ZZXZkI80krzt1MbZ/GmzBdioDba/XvqMy9VQqvk?=
 =?us-ascii?Q?06tOcb0kVMZHayFC0o8mS5Kh+F3csrXe+wu9WQg8LVT2aVP3MwR8+f1npLUX?=
 =?us-ascii?Q?7kwBpGb3QyZet5UhsmSNU5kfHj4OMVVtquMa+YL31/rUbDlRmSPMeIZOp6SH?=
 =?us-ascii?Q?9/YekEA3VHE0vntSCMDvQ45MEhpJ7dDb9Iw095D0kDoXfxVcp3hIcpY68OdN?=
 =?us-ascii?Q?pRIUrK0ZF7mGoMJAuEBKZT9XxhuR8il4jT/4R3RrQFco+kSCdN5WAwmVaLtN?=
 =?us-ascii?Q?sn+52v/LrQO+w0aGnyEOCH7s153sUFpUJzAHU/NopQPEy6LdA+Cx9K7W5cir?=
 =?us-ascii?Q?g9ODFzXv347cLjGnYI7Gnh5MNkbq4eDCUPaBAbydPX5aToO/D/ys2kb8Qt3T?=
 =?us-ascii?Q?hRHA+YOUKOUMFg46YitHNn7d9lE2PK/bZ4fH1P9HCtjlxqk0gvC8+uGZFoiI?=
 =?us-ascii?Q?x8YJhHJOr5m0GdZXJcijMa10cxWObydc3q+RCpoQBZ+MUzUySzzaW1Kep9O0?=
 =?us-ascii?Q?uF+xG641OPFgj4VbXoe52QjodK3HvV/o+Ib/tQW4sVHcGd38E3zMg5aeRr9d?=
 =?us-ascii?Q?BD6nIpGwFJ3rplP6RkHkJVvP1amDsK+ZXPqycGbQ7oAxr82HxXhG3WyNTOE?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j8PbLbe3NbiE9dvNIUXlJAxl9oBYuVv3X2Uvi3ASZ8DskIyzuPRJjnvtxbT6?=
 =?us-ascii?Q?AGJ/0vPVqm7upuMDreyY/i9iTB94MDHF+RdnsvHIEB+Idtmt1iecPgk69ht8?=
 =?us-ascii?Q?mrUEUyqyNkEy71+j2AN1xAbOMyEB3qKnnBPqJAf1oZnLH9wOf5mH82KdhZYk?=
 =?us-ascii?Q?kE+9mV2uC0nlSgLIa15so7ajV3cDq/jtUe/S7yXHJt99Ng2yU/3Fa0Eqlock?=
 =?us-ascii?Q?DmKQ6JejkfB9GiEr8Gnfr9KWJou7Q0dX0EHyaSM7mBER+k5h60TvwAiK3AeQ?=
 =?us-ascii?Q?6aSxtEqV6gdkjPYZyQoXlyDsbZWvNDcb38l40fCbGUR5hUS3iUE7mQAceNNs?=
 =?us-ascii?Q?FigeyL1f16xw5QUpyw2sbqSXe90gHIrAPV9W7Pa/qRgHKo2XIJKe95lLSlF+?=
 =?us-ascii?Q?+bH8YrjO04lA4wqgY9+bvbP6e5H3Q72v8GduSuQwXvpCR1uJNjUalDAKHlDo?=
 =?us-ascii?Q?aNE4Nc8tY56WijS9Ij5rBCGA2sSopKXNKW/n4o6KBov4ZMTKKopwuHhzNURU?=
 =?us-ascii?Q?n/VvriIm6BYovE6/wm2c45CQ+upAUH5QmxGh+AxZcKoPPNi4Z8oPudybOP5Y?=
 =?us-ascii?Q?4pA6d/fIW7V1vKMlIf3Pl7ExCNoKoYTnHErEfeNZHCnvR5mzrUjvn3KcfcnW?=
 =?us-ascii?Q?eGeIs5gEjp6yicq5FpmLRbXCu1sa6Dju4ji7wIpSQ/9wrXqJ5YWZ+MBeqL/r?=
 =?us-ascii?Q?a1FTtTlgjLJW4Pkopf2ciyKwvwQww6LlJILUVEouBwTYFR5xkvWFy4WmJZEE?=
 =?us-ascii?Q?iDgYJaroSvfd2DiKY8Xd7n/AcTY+bLFSA+5isF02d1xBR+eNFX/LcwMKvj89?=
 =?us-ascii?Q?1gK/10yj8+S3M2xWhzNLKtc8KA30iMkH4u6f+cJ/+/JVGffgb3gf6J63uHUf?=
 =?us-ascii?Q?2yJp7Z9nSOoPV9Mdvj65qIbkNvHLGIiYWP7yZvvYTEIkSgUN76sNWWDh19PG?=
 =?us-ascii?Q?mKoJPA23ncwOuQ/dF3mf/jlOkux8Iqak3fMHtB3PpSdLINNIkRnktoMn3unc?=
 =?us-ascii?Q?PdTn9qC3CoKSynxjs+1AyTH2bruut4nOYf26LBVrlfqmlUAufk6W7VJPl2L6?=
 =?us-ascii?Q?Z5+6QAsBJsFzOE49y7l6RQCD+1rLQSkdTPoGpfdx1IGBwVy28RyJTn/avU02?=
 =?us-ascii?Q?+hve667+7ukNkQfcEXNL41/UAY+SkGZPLLHbhSNFY7WPavlOV7IYmnIC+i73?=
 =?us-ascii?Q?yGI8EM710QAtLJsIJeXsLrJm5nvSx3OZjcINjkcbW16oKBft7zTmFupLLXmY?=
 =?us-ascii?Q?fSprESwt8gSNwMJ7N/WPdJ0JXRR8akjDOkzN1GTcnY4QiRy6/wQH8rNbmW2l?=
 =?us-ascii?Q?dx2ojUnPiSR6xh52uBYxVgdX+FrJy+Wgy7Jk9mK/cHeitSG/QqiiFP4kcQzp?=
 =?us-ascii?Q?Dk63Pii+1RdTiY2orzbBzD8Mmv7/rIDn93Bdow8MZncxT9XnX62E2qcKekUi?=
 =?us-ascii?Q?vnbJJp+i9M+p1GKmISoQvMxP7Xura4YG6mBYe3N1UUk3xCp/JCigdd3A9phq?=
 =?us-ascii?Q?6uQwcn9pGqJuipJ3iitaTfEbFADTs3C0VhHPQXqVDYsGCz8iaQ1iWq6gv9/a?=
 =?us-ascii?Q?SvLdVk7UvG7FpKXSMy/237BUI1jVK5PA9+DcaA3R?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f599e770-5db3-4943-d918-08dc73b32238
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 01:13:59.0953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzOpOJzac+tfvCSIrDm203VQay3S6Iq4qIoCIIXN8UKyIJI/Dcnowt22naVHas0xf8jmwUbpIV8LOXcZJajG3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6740
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st52-rt49
head:   4c5fde95daea7696fb9556a4dc7fd77e7b407a1f
commit: 3c902f7f74c6a9cf8e92589883bab325b42814aa [231/395] rcu: Eliminate softirq processing from rcutree
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405131926.EpWnrMxy-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/rcu/tree.c: linux/delay.h is included more than once.

vim +54 kernel/rcu/tree.c

  > 54	#include <linux/delay.h>
    55	#include <linux/stop_machine.h>
    56	#include <linux/random.h>
    57	#include <linux/trace_events.h>
    58	#include <linux/suspend.h>
  > 59	#include <linux/delay.h>
    60	#include <linux/gfp.h>
    61	#include <linux/oom.h>
    62	#include <linux/smpboot.h>
    63	#include "../time/tick-internal.h"
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

