Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33AF4C61
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 05:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713158263; cv=fail; b=Kp9HPQOJnzZcNKUIr5o/gE9HPTvgTyQO+ERJAKT0NiKh/K5i05wjU45TpEC0IxTQ7unGIsnAYz1gh47/8ZY2Dy6wmw7cn1T8x75VvAP3KebByWFWemv9J16f7EMiLuiSXRYfFgTl78xmSHDMdCLqS2ImFjNSphn+9e6gvc4YvhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713158263; c=relaxed/simple;
	bh=VkiTiRwcItqDih+JSHRKwBmaSs6ILpRNJXGyH9kQ65k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=U0bUX7SDrRaLUOLKS0Uo/DsD3Q2YzR5QJ1UZzZLrbQgphHm3cJK0Qeo+fMgG3ye/CiNKHHyu92dUji//yCQX4tgzwwN9ZGMgx9xL2TdPJjkZ6CFXovOEsu5pdv8Cr+WvLcR3HmpjeO8O6LkpyKCCEMB0cuiLNaUNvyfCYH8g4Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEBoBPQl; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEBoBPQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713158262; x=1744694262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VkiTiRwcItqDih+JSHRKwBmaSs6ILpRNJXGyH9kQ65k=;
  b=bEBoBPQlUqu3yEX7IUT2psvNuGR6f2hSbftrOkOZKfa+mWJ0OHLHEqrE
   fibsvsbLXXvQtETTmkUv8qReIwej7/Ilm75LrOymHb+ZPtItv3jeYrId1
   pqNkujEpzWlPNUZBUF58L9KIod/d5txHBgeBZv+RY5JUla9iXDTm/6Grj
   AynvzzqPQ7zzrjMZW7NLvEnr7lKnRC8peljO86MTU0qSUg8SK4hyVPF1b
   0smju/OUZdWZzcc1qOPBX8ZZx4Ke3N6jaOVU6YcooEob6GXrHeZgWF4Dk
   rAEXBV9gJtVEfKDPMChlHQj/oaenDg592tOVcG3P9sOA3bpDJ+AR7mal9
   Q==;
X-CSE-ConnectionGUID: Gp+a0i6LS1Kin5nx/JS3iA==
X-CSE-MsgGUID: Q3TOON+BQ1yoNBMYsZhfbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8396412"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8396412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 22:17:42 -0700
X-CSE-ConnectionGUID: E4y1EjxVScWVtKQRP39ilA==
X-CSE-MsgGUID: qpkg6a4xRjapuVNGIHP3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21789585"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Apr 2024 22:17:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 22:17:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 14 Apr 2024 22:17:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 14 Apr 2024 22:17:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjbrcaQoM7w7Vpafmts8C9pC76T82ODdrO6/aU+NerP1Wv1QNzGi3IesU4JaO8NIvLrk1LMG6JWSN2/wXv4VjcRGKEgEm/qP7gpFoFXBUTWPFfVCZsHcr2RnH3BWsMEbRUWpTJ/nx83rEDh4Xz3lzHpTkfIzutj/lXdR9+RDgEhahdB6FgLEEtjj2A5NYfFtdVNlaGpQBVpr4dljMACS3AfRBrQYtgmt4e+/aFZk5StMSJ49B2NGQtH7ozDT8JIpjMhuUCj5N7juC9ZOokhugOptvuDcQp5H/UbFsRvz0H8x+HC3kIEMOhdTIanrnFYlMk8hrb1Jw8Bbgawe7sQq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNlMfyPkb0AXBdrBdjb2x5qeCLNRhBhGqpZDLLSgZ3M=;
 b=MJGZeQ8QslsInKyhu5b4DTsYowb87DtX6xXx4flArrXAir4eMQAhFjUnPY4Oazk3VOGFcFjvlapAlqoELpkZHXZrIeYxpjobcCuuKSTRp1MH5fPTp1yLOMKmdHoMaDg/lcMqrTyH6bZXnsdpUDzEb4GUV4zb8/WxO2pStXafsZNCyQ3Y7Hh/hSw13Pgv1p6mNUr2WU4Ja2HqnBo96za64h2KKtvdLQrAPS0zfRlGefdXQlUrNTYdsiXVoPweU2BkaZAG0xxCtKsjwWyo2hJE2gp+7g+8pVhwlNjya1s35mEZxvjFOz1djK/pyXfp2S1UXKcuKGBIvodSn2XoVsBCPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Mon, 15 Apr
 2024 05:17:38 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.041; Mon, 15 Apr 2024
 05:17:38 +0000
Date: Mon, 15 Apr 2024 13:11:03 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Allen Pais <apais@linux.microsoft.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Corey Minyard <minyard@acm.org>
Subject: [linux-next:master 2570/6010] drivers/char/ipmi/ipmi_msghandler.c:
 linux/workqueue.h is included more than once.
Message-ID: <202404141026.U9TuWR8P-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SA1PR11MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd98b58-a11a-4fd5-247b-08dc5d0b5e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KsWhauhkKQzOPYlU3fAvKzd01IpBgJocH5p0cyLGj/83gC0X95btFUFYkmQKirLrZ8uKRmW3S2WK7xZEOOXF6/pAEWtYT0kRBotdI+MQTqNoJfmPhx7pwb5B45cR3fQhiQNc23h3OkhHGRYJeuqmeXI0OtkDg3WkfuG2e0Jrbh1+MaSpEmVmIBv9baceQ+/xL4RrTZD6JJT9gBnEYucLhBt3/lypWOuNib52SJFeZVebIYdee0aRCwEVdHw85wX3e9BBaIkR2DmbCxiyyh9SMOTBf/gRiFJc3sllLti8p0L81tNKJXFRmfUjHCPDgIIm+JsishSRl8+E5t0w38cbZhYQmHs4LRqSPN1IIgkTYvjuC7O0rw+ydHtHyDL94+MzLWXTipygaC0w3xQlAvSaiky2kly22yAafyclsw6V0b6TKfj4XDrBlZGor0HBO60R3Bupb2gE9bC3S6/KZMhQbxZLNdLWr/wmUE/riHJjIyLgz+vVGFrnVfnu8yq5pYhsWd7HuWWdZb3pwDPL6Cq5S0cvwgkpNBSWDrWzlLiZnPw7t4ZE6S19sq+FgpvZmiWlhlR/tEBDxi3AnIaqfhmrvILhrHlXPKbuWHQ/0Mmnxhc3TwVAQC23Nmwp2r/tNSaz6bYDiONdNjjYv1cv4bb22z8z5dYR31UoEdqrkinMGQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E+rMGAjEkQdLuUtm/LC9D35Fz12BTXAvmzS1UUSwHg2idhf7aOmG8Buj2uBX?=
 =?us-ascii?Q?WOFxqjAqN/OgI+DYHS2sk+NvPaTS2Gds0JQXBkkeFOKpFKYGXNp6dOcY1I8S?=
 =?us-ascii?Q?Sn5fgLp75jaNl0z1w1tWNuKInLOyDuWSvRTOhtdI90Dcy82jOrstHZyIrvOD?=
 =?us-ascii?Q?6wt/4y6bOEdoeIv9pAJS1tWM4RZFUELs2CJThEO+6vR/6r9K10Me+MhEeXoX?=
 =?us-ascii?Q?y47K5mHFFzQhsNTHv3xMGTmgt5cvECO35R0AalmlzwVL8OLA4qC5jGVvqCD8?=
 =?us-ascii?Q?ceASwyvU0KwKTf2sJjqS8QULHzsIVOIcqZyMrYPSchCsM2AqS/bT6ybDYy0s?=
 =?us-ascii?Q?6tCUHg1tIawh5eFUaFUrl6cR+dDn5WbeUAiONAnGxPu4OTrxDwigYQkOu26v?=
 =?us-ascii?Q?UWzFbJsbIikDqzcRQa7uoEOt0mxMPtdbAFkf9BO2Un7WU+6gHMsGTJKQP4HU?=
 =?us-ascii?Q?dA7xmBcTQAyNVwS37uNa4fw+wy7jyEtWaOdiGmqHxQZNrQ0jaGuesUBuBOXE?=
 =?us-ascii?Q?TsDtW/SwIyRStNh+h19172yRGPEG9esBuSv2slg5CMOKEoK5GwZQeoTJLga1?=
 =?us-ascii?Q?g7fnY2pBXY7OutD6OIGjwgYY+P2HzioC+DHgBPUSP/SpgS197glhApClTXNF?=
 =?us-ascii?Q?FACLN7np50Bt/LgnBRT40bxCEkdypaUE+mS8d35EBYMGIlWzlpkiTVn0+d+1?=
 =?us-ascii?Q?lTRFLbA2gzcxcEBddpWFyUs4dgz4IidNnyVt4sigwLewXSWynHFceD6x5n/t?=
 =?us-ascii?Q?NA6F9wA2x1Kr9penab3Ntt2NcWjVVkiX38jHBIHEheuamWeJ6f8G5f9gHZEk?=
 =?us-ascii?Q?Jauv5PRPbv+h+/6n+z4uZVPP76L8A8VCNxHlg8t/kL4IbivuoWz8iqrAl/cy?=
 =?us-ascii?Q?cH9yQB6HyB4A1AXFQqHlwGTJrNd1mcK1Di3lPYyDK6qJJsempEHjHtOrWLvU?=
 =?us-ascii?Q?GPP4Lotz9PUZfnmP8bIEJdt1jNLUHy1XttneECGl++PXB4IoorEhEo3vNjLK?=
 =?us-ascii?Q?Cw93LYUCRgiJlzVKKfgrNddHghpuTjyshVw0s1eegatpchK0mjSirH1NqPNM?=
 =?us-ascii?Q?/G8SKoClUxpwf37P7Ij5ky80/lVl7kxk8TEzYQqE5w3dXhUnuQsh+sH6T7U0?=
 =?us-ascii?Q?NZZrVrH09b35xWefJsVVbcd7vsH1Cwk8Q1SScCXzOUsICulFGSk/5FsNvO/7?=
 =?us-ascii?Q?M29AdmwypYzBU5sN21ZqrQ4aM8qzDYjaksVDYb7ZFhFwWC8owOCxjWdf9JC6?=
 =?us-ascii?Q?3qk1FiY5WbIuTm+MTuuuHpflPYxenPMZxs5B3+nGbhBdugj8OkinOpN502jP?=
 =?us-ascii?Q?9f1f4C4TPQpMUGCMWN8Cni1+4AcQlLQ9lelRKOKIlOTKKeydDilh/C7SY+pu?=
 =?us-ascii?Q?yEXWWprV1tZWudeEbocTIPg/rho/MfPLOhtuUzepqABDlDuMDMuLaqT4LxT5?=
 =?us-ascii?Q?m9urEWVBwcC8FBnawLNpIpccUGfHvczyW/tD6atCQniuC7CfTBtBUFLK/2US?=
 =?us-ascii?Q?DBDM0LDr9sdEeERCBsVEzPe174RjjdH7GANtndrsWTBYE2U6iyqaqgSAZi0k?=
 =?us-ascii?Q?ZVTFTZ3kG6Q3fhKZ/PzdK6iCSqH2icr0NS0cMtsl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd98b58-a11a-4fd5-247b-08dc5d0b5e2a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 05:17:38.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tl//WDchwvvstHplH/NKsOOHO1rZAaMsoskE3z481YRjwHD1Ex+WgSdQdrC8rvwQbUi8RB5TuT+swRKKcD+D3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5900
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
commit: 740d0a267c8d319202523bef474e74505749d183 [2570/6010] ipmi: Convert from tasklet to BH workqueue
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404141026.U9TuWR8P-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/char/ipmi/ipmi_msghandler.c: linux/workqueue.h is included more than once.

vim +34 drivers/char/ipmi/ipmi_msghandler.c

    16	
    17	#include <linux/module.h>
    18	#include <linux/errno.h>
    19	#include <linux/panic_notifier.h>
    20	#include <linux/poll.h>
    21	#include <linux/sched.h>
    22	#include <linux/seq_file.h>
    23	#include <linux/spinlock.h>
    24	#include <linux/mutex.h>
    25	#include <linux/slab.h>
    26	#include <linux/ipmi.h>
    27	#include <linux/ipmi_smi.h>
    28	#include <linux/notifier.h>
    29	#include <linux/init.h>
    30	#include <linux/proc_fs.h>
    31	#include <linux/rcupdate.h>
    32	#include <linux/interrupt.h>
    33	#include <linux/moduleparam.h>
  > 34	#include <linux/workqueue.h>
    35	#include <linux/uuid.h>
    36	#include <linux/nospec.h>
    37	#include <linux/vmalloc.h>
    38	#include <linux/delay.h>
  > 39	#include <linux/workqueue.h>
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

