Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231585CBD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 01:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706233447; cv=fail; b=MK2GmGNdD7rKU2OyNnqRS4zers1ejINI7UhW7Cpy0tVpp+NocHww5CdLz85CgZBoyQinUxnHO3Ek7OyTsZP9mL7Ua7zCKTQoqAkBAX+iyE7QEqr9LswSHX0ZPifFPXy8A2t7FXevwW4En6RBWibbfJ9Gh6ZDYE76maVCjadmvhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706233447; c=relaxed/simple;
	bh=RK0md52FZ5BQZeD0JP3KubClK4BsFMXycinJmz97I4Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=IbhAnURtes3Bgou7grKVHWIOMeoosrslyqTXunCkSi3dGJTiNyfKWp+16EY+95d8DSnRgRq4K2cGr5jwCjga+giRGLn4Wd9i4ZimcbOY3dXmrHYhnzJulr8Lboayen8bCujlrGw5TCQ3PWAKRFT4KtTvXZsEe4eEgIK2vk1zsFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZQioA5L; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZQioA5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706233446; x=1737769446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RK0md52FZ5BQZeD0JP3KubClK4BsFMXycinJmz97I4Q=;
  b=EZQioA5L1nUddagdDrykxWB4YmxgPO91g+GZZdQTX21gSckblMIP78CH
   C/1Y+U6QwpJc00KLV5oU2Zv67TNFS6HgsuBpaNhKbFxjlKh0U/I4gBejZ
   ySb9k55X4Y4nBj3+GhVbBiN6HiAx1Oq7nG5pWNCKi+NXB7KcNbSj/nmgT
   RPviqenEhaUQ1QKJhJ0jCPINjuGUyV2PTfopRXNxxhaGrbGhShkjqwy6l
   LUWvYneTld+tEWJEJNuuc9/KtRzKlar1byA7fS1N0CgS9JYWdBv4US/kS
   y4oS0BPdFzg4XgiuBbk1G06y040+XU4jS1SdM64Li/vOeL4eGN+pX5XyL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9732905"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9732905"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 17:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2449083"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jan 2024 17:44:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 17:44:04 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 17:44:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 17:44:03 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 17:44:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eN9BE6c7ewd1mTurYtD3maVa11QMCj0T4SHcy3Pidqkejjs4d1XdD+0DDcfbBSYclpdYvOJEDpx6ZX001yaX1TJawCCUhMrPCu2JvQ2SQoigHAhlyu3DXAaoW8toRMXAcagOQfI0+7HBZbxJ5PJLPB5jvCBoSWC4KtIbbajKNgeuqIFK9/ud2jw96l3KL6Ogt2eTE6pQSpPNSGelY6FzNgbOpmNLskxgmKxperxhy1AL00YrGMOsu4y8+OEU7c36sLMggDndqq5FsgqXbSBxdJvVpGoX5f7cbchnceqDcuL6C45sotdEn9UFPTcn2Y8usQpklYbqVwL8O10YDQ691g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reSMLVZeqfeJWrKof8EyXWKLxWyyS4si+8aIU5j9m6A=;
 b=HXsgS73z6Hj/35YpySoSBZuEdMOk/TWD3fGx7632aPJuWNbKDrOxu/0/+7Wud63uq8c7Qq8girClJiimXryeA+3CuVOZavSdHxt3fiynJsPy6m24f36vOVEKpjCCTfhl5qRPqhiCoc+UN7dVnbtp9VnpPsl0AZyEiD3Fr34dk8tTJ/1fekm/Fy6+lFFHtZADJTLkW89fFVCNLiEDrzLPrfgROJ2NXFOayIx2aNxjMS7rqFN4+uFz++dNdZh11aJqf+rMcmYlmQSaS7ETAoZkC6ONGWRLyj3SuVqZZmrgqjrDb3A/onLL3a/lvPRyWLHPCciT33dtkZy7P9dnG0vqbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Fri, 26 Jan
 2024 01:44:00 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7228.023; Fri, 26 Jan 2024
 01:44:00 +0000
Date: Fri, 26 Jan 2024 09:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: <jasperwang@tencent.com>, <kaixuxia@tencent.com>,
	<frankjpliu@tencent.com>, <kasong@tencent.com>, <sagazchen@tencent.com>,
	<kernelxing@tencent.com>, <aurelianliu@tencent.com>, <jason.zeng@intel.com>,
	<wu.zheng@intel.com>, <yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: kernel/cgroup/sli.c: linux/cgroup.h is included more than once.
Message-ID: <ZbMOVWSLMBng31zl@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|IA1PR11MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8124a4-7270-4cd7-94e5-08dc1e104477
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bjdw0i/OLSID0afwueuN3QYc3mewZU4N9OPe2pl7+1oHfz8U3jLOxiOTqJEJaFgli5FDY8Iz1EXXHyWYjSPCtbEAcU3omzTMSEMkdkM4EUBVNgTks8aLvF+RIZa3EE+ySqT1C4n3tWGzgRmaCb3bc06L3f/465/X2GGMm9rHfBt8oM9l0kyFa+pjo6raxGElne7Ns8/29/md5JafA8qivIFJwBxJBcOm1uyPIsAl+jGtf6ETcCKdM0iEEt9D68OeymcVoTN/ccilBgQYHaMfHdV0L1pGRdi2ozOC/C42EcwbbPVhlIoeaBA4xRoVzFFwikaPep9g4zhDLYa3y+eU8HgiuYU0MkxnqOtkeq2CAfwhyfZLBbBSIQk+lG9sS1k3WOZxFo6kXCgsLTFEsu9yDwtZBpDpU4FRQ9okivbwaOg723N9DCF2aRNGbb96RFtBYAaLR00S+7sspO1OnaSGQTHMkQ83NiqgSMExxUlA4uTbHSMQtrxpSwvuy4KgE/+5C6bUZp4DTpP76QvKN2vumSkVbmBNczE9QWNxy6Fn1AnlcUqLLNjCh9YxAZFGk9Zy51AE4vGgW+ji99n3mpsbF4laBl/QxfFZ6S2lRdAyw0Sj0+01nAJZGHmzHckcE7dL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(376002)(366004)(39860400002)(346002)(396003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(82960400001)(86362001)(921011)(8676002)(66556008)(33716001)(8936002)(26005)(316002)(66476007)(9686003)(66946007)(966005)(6486002)(6666004)(6636002)(6512007)(6506007)(478600001)(83380400001)(5660300002)(2906002)(4326008)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hiSkDgZcaTgANpnxhx9YSLgg9M9DEl7bUub9W7OPeLppr46oXr4JBM3oozPV?=
 =?us-ascii?Q?ugW4Dvi6cvXk724UFOmqYIiVWHfWVRUFmvTts9ppdPuJI1/sJ6DYWK0rVrba?=
 =?us-ascii?Q?zAF9i0LXKnRkr/2PsPX/7dmw4fr+ceAGKyTYlM+V/HlxkjMhwcEjj2zmZ/g0?=
 =?us-ascii?Q?CbZwMIWVsBEAUNnR8F4FYEYkSVMw2g9G1bthTMaK9RS6JJpKU06Thp55bXiG?=
 =?us-ascii?Q?YF6RHSySO0KfjfJXxnmc6IbPe5MEI9qxToeCYy/IjKfuH2x/SDPRMBAjoF9R?=
 =?us-ascii?Q?9CcV4ThuV2X/kaK7FFNLzTWdu+Y8Ry3Len4piCk0XjfhGr3lnCUe+SdpnI8+?=
 =?us-ascii?Q?ck9EECCe58DIuk+dmTyHfWLZLc87qNb6qrnetu7aLy3RLiZyrPGOKYccXIv3?=
 =?us-ascii?Q?MjFKTAeJdg0diia5O21rrgZ4cCtwfF9z7nngOUUBR69M5/B6UtSY89Q29H8X?=
 =?us-ascii?Q?eZRzsPaE1MErwVgMtHaCTr7i6jy0u6gQYJ0dq4rUfg7ILVKN84/hT+HVr3DT?=
 =?us-ascii?Q?AOw5tRczzCrnpD/QfAkmuZ/vky6kb8RPTzqPAQaAQtLqK++5nGINTI1WK4Go?=
 =?us-ascii?Q?AOBGUXyZGy6WIQ3lrTliBqeVLXEfIYZexooio8m9vitI6JyAuRsawj7UzVdh?=
 =?us-ascii?Q?OZ1xhT5NYkEfG5QhDQv9F9yEXrPRYWQRykwHV/XbF3Op002wxdmoHOUQYia+?=
 =?us-ascii?Q?YvBsvCUrFD/h6CIajcLLLScnOJ4Y4hbgyg0KnieqFfrzqjrYaVS6QPoLdMfC?=
 =?us-ascii?Q?TrMz967iUM2zj6grKL6bJmSPMRq6YfqeiyFvlpoeYx+pdhF5le++zl7HDFCD?=
 =?us-ascii?Q?1XnwwRgcYFxE5L8KM/vIq+MhXC/H+mM0hH+bqGQ0J4oEetoIZJLNXo8539ul?=
 =?us-ascii?Q?P2ISZTeIONcdOmiIeqTGBVD9CPhA5kbkW8UXEjtTQZHnTniNNgzQkBQCtt25?=
 =?us-ascii?Q?+vuEX0R7fuwVcRsxB2IUiR8NxECXZndAvqxQ6Ssi6ciapDKpmDaZuDParW30?=
 =?us-ascii?Q?18wOLX3tydUxK699gInh6aNfmKOVhJeO4wuTyRt1+d0xglLwEuIGkvhCVnb7?=
 =?us-ascii?Q?u0PGkNjK2w6rBJDAQlfNMP1y5KWEpldI3FQlDh5ZPGO3YwTC1ezSLDyHwCKC?=
 =?us-ascii?Q?Lc36HQxr/u9/m65reYx0A4LFGdzQXzl1dhUvevcp/wB7p3slR5DPA9ynBBbW?=
 =?us-ascii?Q?G03nYoPu5Tu1YBfi4fwg7cOrf+xdC/d1YUHxJysfPf2HoPVZbxG8EshJxWpb?=
 =?us-ascii?Q?HI57tw3CMg7clwfa+omCt3MHOf+cAp7nGWjwCKNFSNhgj81iqc7w/aE2bLa6?=
 =?us-ascii?Q?vj7xZu1CtP/Nnylr5rea7tHAPGFfHKrDWHA//g2EoXLYryuTuLflBN+me2V2?=
 =?us-ascii?Q?f7OYhojwaMysZrPBYiHiN5EM1371n5rlNFOqt/Ae9vTWz7blzpvbzrXCvVxI?=
 =?us-ascii?Q?ysU3XdgdZ1TmmAZH9iqPfRb3sfI7L1kv7Kfyc+JM4+xOCAnARUeG4RFW4OCA?=
 =?us-ascii?Q?AjYT7ft8x/xrQSSeA+ns7Ks4TeD13VPykd/JBpv2PpmlT2sc0UqrlstMqMrn?=
 =?us-ascii?Q?2wtruHfI+coWqeE5b3f3xm0shuctEDHmeUikHeHKOCnb6MYBwPnbxR1UY1du?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8124a4-7270-4cd7-94e5-08dc1e104477
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 01:44:00.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hL0oiMCYf7YHcLgMSffNIk1LJis6Tj6FcyGMmt3XTOSn2RmGP6eGImWkuevN1lt52Z26ZorUtlxjmAZUqmlTpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
X-OriginatorOrg: intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git master
head:   5aef72f74942091b6d408fce235629dc0620e74e
commit: 2690abc40b3ff5bce2553981394ee072eb1f5f66 sli: add sli event monitoring for cgroup
date:   1 year, 9 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 1 year, 9 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401260540.7P5Emiq3-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/cgroup/sli.c: linux/cgroup.h is included more than once.

vim +3 kernel/cgroup/sli.c

   > 3	#include <linux/cgroup.h>
     4	#include <linux/module.h>
     5	#include <linux/psi.h>
     6	#include <linux/memcontrol.h>
     7	#include <linux/sched.h>
     8	#include <linux/sched/task_stack.h>
     9	#include <linux/sched/sysctl.h>
    10	#include <linux/stacktrace.h>
    11	#include <asm/irq_regs.h>
    12	#include "../sched/sched.h"
  > 13	#include <linux/cgroup.h>
    14	#include <linux/sli.h>
    15	#include <linux/rculist.h>
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

