Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B81D52F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfGJmGVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701015046; x=1732551046;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=Ttb7IhNk6+oNTYVQE3wH3YbSed9UfgduGXEsW6Wfkvw=;
  b=NfGJmGVRcdRDs1F/0gZDP5D5nN9wXNlgHAYMYM1eA2f6EAVK8WMOJe/8
   Tqd+9LI+BcCNgh2eGk+bGLPq7ZEeDVXg30XCRu9CdQTysxGX8NxXr1xj/
   LgQpP2eRgZWZdV5BnMVKMig0106tEqXycJE5UIcOa8c3RJX56Y3JDQYCr
   TAAA9Pc1BpKmX52cLkA4rk2WaKTpgvfHjwbTsQQnjJ1Hx1TOEPpTKa67g
   TlHStGW5y4CpJPssKZ6qP84vJPywqH25JXjpv8pNtdZbTkT83gTRSECSw
   LB+FhBVG16jHlLfoYt0sTsFdPBMFArv9M3qoyjlV2ODf+z2JVa1hDcsI9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="371932475"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="371932475"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 08:10:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="9575355"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Nov 2023 08:10:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 08:10:44 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 08:10:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 08:10:44 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 08:10:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgIal3LQfRL4smD7buW27/I8hvDEFyReFMCeJWKZL41Xfaop1NBJSZHrZgYIj5LYp6tojOzcr36JZbiFkbOGD6V5iQAbVWW3ys1R/LHbvnypXlbk3Wxysl+W5+zry4qrQEJKVlBYKnaq7Xq3dT7rCaSEGn5kg+3dwCtdcknwM0xGqBKanMRWNg8Ok8zM89XTcCMS4/MTUBYPZ25L2AxBnOVohdeKf58nbySykaeMLonnijSpOrg/Wfs9XHWoLlla66q0xWFz9L6nwNCcibDEYP+FF1kTpscByHrxgjaOab8HD3ToUSUroPBHt6wjAJ5MeJKYJ8+xtrF0dZADUTtJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWnIqSVu+P8vsx47JKlyl5zR4ITqYnjh0lUPgOsz9oY=;
 b=AglSUanHwYnOEENkP7Yr8eDPS67ifLEj4SHOWBFM1JXdmiKN8E/QhJEUf74qRMkZgAER0s0B8wDt9uwIiJ2Nc802e+gxneZcpEe/G29GEsvHKoSz/2kpnpFNSZu1fPR9twbW0NYhy4Ir4wRfJrcVKSlG2XMDcMQYXBPjuxF2i3WgmQeIMCopKiVmFM2HzHjJpoYN5cddP9JpzGT8eFzp6gpBhtRrpqEQzPPJbsSHFXmePGJ416EHzCQKm9eWg6YdWvOjAO3J/Ir3vNpog8E7a3VI1kQc4iyf3tB0uZ3fvBFGjnDqJajvwHVgTnXhThE+5PCzmSw/wZDgnHmS4LoJkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 LV8PR11MB8679.namprd11.prod.outlook.com (2603:10b6:408:1f9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.25; Sun, 26 Nov 2023 16:10:41 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219%7]) with mapi id 15.20.7025.019; Sun, 26 Nov 2023
 16:10:41 +0000
Date: Mon, 27 Nov 2023 00:06:06 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC KERNEL PATCH v2 3/3] xen/privcmd: Add new syscall to get
 gsi from irq
Message-ID: <202311250440.DbUQXNLK-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231124103123.3263471-4-Jiqian.Chen@amd.com>
X-ClientProxiedBy: SG2P153CA0024.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::11)
 To DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6397:EE_|LV8PR11MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: ada10d0c-9ed1-4f3e-6972-08dbee9a3ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 99xY+NVocdxMGhzRjyuWFD/eZ9MetTsZDl6Jd0qoI6Vc2KgNcapOwp8ZIP8b1KRjuH2vzBOQz06qxSl4+53F0qkMxpoyV1hvXr48eJ4i7Ly8fOjn676QzSDkfMOA8p1x9XGBX3QArd8k9AWbWT+uSKwmSYMWmcSFTOlifF6gr7nzDxXOOSNhZQtxPCiSuxZhdo00/RSNziu4uprqJU5Psy4S1nAuFb7PIlxnwn9PYckCAvOQXwDZluoxxjy8yQOxg3LBB7IBq2QiDldQfgIwoBvRsMrYIan+3S9+71xO2iq21zzu3jGeq6AMq79dkyNx9NWNnVxAYY+wO0E1TMaAcjsuJvIPKW/xjatjLPPU/OQ75DEXdK6g1MgQh9QtmDp+kd+NbSQPtbn6vyMfeS0cltBrwjSsOX9qiL+qv8K9Za501WYAz1ygMOpJnfYPbp83/dM1qw/g1ibqR5TfcpE++ThBiQOtBUDBZmSD94wtsYg+zbfeiaGlViRSQpg1PoUTcLWMod38MW3Y7ECkPWNOwiyfLM40k2VkNs01blTGzBtjRS4XgRDaSlq5tNYvFSFIwsXZV6ZjWTxTZGebLlADScDojylSH6RqCRlSBDByDvAygK1u07NCyMgkRaVon2lv/fOfW5H8dPoU0h31V+4GJ3k2SMNshGWBVTcflOheH1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(366004)(376002)(396003)(230273577357003)(230922051799003)(230173577357003)(186009)(64100799003)(451199024)(1800799012)(6916009)(316002)(66476007)(66556008)(66946007)(478600001)(6486002)(966005)(6666004)(5660300002)(41300700001)(36756003)(2906002)(4326008)(8676002)(8936002)(86362001)(82960400001)(83380400001)(38100700002)(2616005)(26005)(1076003)(6506007)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p3LTzYKTBdGgIexkVf9jeaFc+2fiGyFDK56p8nex6yrAGMk/UZ86Irx6Tbss?=
 =?us-ascii?Q?A/+DMddTYWf/3884eU8GyMh/DFunczgYEt6iRij31rqGoIsWxcWvmSM0I671?=
 =?us-ascii?Q?JCOm3hyO5hiIKns7t6/kQMdQjal/SG0wjJ+rk0JgdDjTmBjaIRC6WguW6c+o?=
 =?us-ascii?Q?nullh1YR8g+8nvQwm4J8x5vFnWrVvLPj+sInGzRJWWKW7BnTyD7Sx9uR0RAw?=
 =?us-ascii?Q?bhVcIRcG9Bmtzd236Mc5KhUNs+Aexu71pHKRWqZO/na/dpqEtaXfLNEEvVJ7?=
 =?us-ascii?Q?LjjDrVw01uJJZMhY5Ml0sdEnInScz20ARUbjfHaSn+rpkOCiuoa26lk0SXK5?=
 =?us-ascii?Q?8FNyg+JT7pt0gTYB3cdjS0KvH7YvvDsr4PXRAbgx2f1sZvIzTp/mBppfThzd?=
 =?us-ascii?Q?d0lHivGuLKFsOUDqWqqSsiTAEyqCYtrFoNthbCkRcuIh4yey6CgP0QdU4noG?=
 =?us-ascii?Q?idggBSLPWNPkwDhhbWVVexnmPuucLB3lHJzRLI/B5splXh9PhuOYGvcJzH4B?=
 =?us-ascii?Q?+ZwGj+Er6Qf2XcuYZmgweSXpNeQM/McMgbb6sGbVQ+ShZw80DNLIDhdyIMZ3?=
 =?us-ascii?Q?9r6qtd+AX7xWuo1iw95QCCZkRhb/qp1eQkDntM17REVioCdKu0sXy5+X0GXH?=
 =?us-ascii?Q?WU/jvEl4EzfWeRInAfv241nqJKc53tSSm1XtKUZcJPt3pj9X3YHiBy+GkrKn?=
 =?us-ascii?Q?Is6RVt2gdmrXoPRvb6jBNMAgA5CqJshhng1gBpL91DovqMoHp/M76yUny+VN?=
 =?us-ascii?Q?XsQ7tMBmMjAOjX2gZfxJPfrUTTSDTs40HUWtMmt/FE6GYBC40Z/fwKfymvO6?=
 =?us-ascii?Q?kSHO1Im7Ny4cBff16MjEBODtUrFcWzCaT/5IrQZvAR5mUVwnA3HySI5N+1RV?=
 =?us-ascii?Q?4c4XIKdv1uHSdcB24EpqZMvbjMeYSPsHaewpA/IdH1c/nSOaYyaqHlGxrwTh?=
 =?us-ascii?Q?11/hTZgneZLUvPCkHI2ZZpiVe/j30ubKKEmoRqRHIzhJquuCsHPQL9s4Rwbr?=
 =?us-ascii?Q?TJb8DwY1Q8chcE+3AUESWLmlXhtHGToXbuq8JTZRkAESq82IwJMF018g+GUf?=
 =?us-ascii?Q?CQpMTJ2iU9mfSu6cr8ts6q1BlPT6EXLELIYGFKSiMw+378uqiEh4lsHD6/qk?=
 =?us-ascii?Q?a0/rAkYp0M32E9F3jC7O4lN+qrY/AuxqhShvFJZdjxTgaHtXIaPmQgVYNujB?=
 =?us-ascii?Q?NquvSg+96NFV8DxDSk1IYv4tvvoN1u3a5XX1dU5s5Ihz0EK+YKhBXgN9nzai?=
 =?us-ascii?Q?DD0Plxcxbd06YsV4T1aljYL8zJ0yHsLaIkwpYuVmVpMg/PDzKKeqzDygEMLb?=
 =?us-ascii?Q?c3ncPv3fvU0gRQX4+y5xJCs/MD9tdpfX09BOjqWy/KmEmNLBxTgDJsTZrNFr?=
 =?us-ascii?Q?Yq9Elha7sifgE3aZK5R10XEBSkxb3lhVpOzkyFgu1LY/i89QWWFZaZtW0x7C?=
 =?us-ascii?Q?J4rUU7tqdJyU9xBaVKt7sd7IpfDhqN4/hKX6WjpfvXKXe4i9yuUafK4K1vbv?=
 =?us-ascii?Q?fV/2SyIBmAecUc1VAvehRWp/wysYXZGK6uEzA4+ouZHMjvDJdjxYZCUaHmdb?=
 =?us-ascii?Q?iliJDIISuEX1F1SNRsya7BWuLmz32nwsDLAugWdN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ada10d0c-9ed1-4f3e-6972-08dbee9a3ce0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2023 16:10:41.7822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8rBICjRagoau1tRPH+QpWVEXyYUfoap+Rxgdm54m3ZjXPgxkuCijLXc2nVwjzHiO1MhsFRr1+EzU8exM4vBQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8679
X-OriginatorOrg: intel.com

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.7-rc1]
[cannot apply to xen-tip/linux-next tip/irq/core tip/x86/core linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pci-Add-xen_reset_device_state-function/20231124-183607
base:   v6.7-rc1
patch link:    https://lore.kernel.org/r/20231124103123.3263471-4-Jiqian.Chen%40amd.com
patch subject: [RFC KERNEL PATCH v2 3/3] xen/privcmd: Add new syscall to get gsi from irq
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250440.DbUQXNLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311250440.DbUQXNLK-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/xen/privcmd.c: xen/events.h is included more than once.

vim +38 drivers/xen/privcmd.c

    36	
    37	#include <xen/xen.h>
  > 38	#include <xen/events.h>
    39	#include <xen/privcmd.h>
    40	#include <xen/interface/xen.h>
    41	#include <xen/interface/memory.h>
    42	#include <xen/interface/hvm/dm_op.h>
    43	#include <xen/interface/hvm/ioreq.h>
    44	#include <xen/features.h>
    45	#include <xen/page.h>
    46	#include <xen/xen-ops.h>
    47	#include <xen/balloon.h>
  > 48	#include <xen/events.h>
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

