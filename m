Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D905245
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 01:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXeKGXNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699925237; x=1731461237;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VSzxuzv/f0GssPXAG7WBd0Bgy8BjCcWzPI565+gmWN8=;
  b=kXeKGXNkVxq46Pn3wzMkNWqVYqiSfp6cAZoVKD6O835XP7AtC6B2gvqp
   0eHYWaAJhD6Teh/9yOjKe5ZCwuOJSJCdBxYFBfud0a/B4te402CV7MN6l
   zn7DbcfZqyf/gUYlWsBp6jBlEw83ntOhutUxxU9oS561eYu8kxFIihvA8
   8jdtrMgtiF1hKx4xwlO8VSumaFZFE9g9Kgczm+TX/TOitKxWKxCFn1IAH
   TGduVhTfOLLIPVFZyPlFXTO/TZdBkGRE09dbWvnbqr37CRtEDzPuUUdr6
   EPBvbeQFORPdoLEvY1X3iuXpvximD1bBXapXaxsSEpTQurEXX7DqyTRLT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421648626"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="421648626"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 17:27:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793580642"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="793580642"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 17:27:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 17:27:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 17:27:14 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 17:27:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbZ4X3tijEdyoeLDWeDabMVTWXVVO5qPCiaCs37bgIRStIEDn1O0cSqY9ZSJ6W7Fm0cR2ypJUhujhbGhhhhtO905tmrTTZBcKdT2XzaejlhgLgWcZf0LW8c5WFjPqqX4F1sNwNR72aKMPSABOQWZHPoZrQ4eltHFZGczNIeqMJc7O34V36fCywxjr82wIAo/+SgKfakweGe9kTpKTcBcFsLmb8IekaBoW9KSe/Ht73eA/yuftWR1+G8XSwkYYXuwlPkW8u/E/cFs8suNM2WdvPrpsqqw56My2oyhYxMYNIbzZpSJmzxgumUrRzU78Wf8SncKHZ479BKR3AWcmlX5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ug2aRROdtO0cvk5crBityo72ug3BULHv1yf/HL8Oukc=;
 b=fNXYX3iUlfo3J3gjWCE8TcxsLK4WasTqbZ4gF6Z4yRXIVJbSPF31+rdUQ5+5hze1eHgVM/Tf6PPxO/+D4dIXy4WdwusDg8Az4CJB1rZWg9xUoeQktVeDrpZzdeHQFVVLJDTFG5yEM7QKkMG/e5waSoXCuIutuxXYFAF99+vN8RikSqtQzlAafb3KthQ95WfQNAWKCigNT+XRO/BW7XWQtPX8g7vKb7LVZLQaekdqBWK/xGYTgANWlFpobBP8+es8WFew1XUiynfgYL3sd+KBsPY034J6zNeLaPMARj2m4gi7K1jJGOThZNAcm2roSLIEP1+X5mPIS7mkFbdy1s8V1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 01:27:09 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 14 Nov 2023
 01:27:09 +0000
Date: Tue, 14 Nov 2023 09:22:29 +0800
From: kernel test robot <yujie.liu@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH v2 14/19] heki: x86: Initialize permissions counters
 for pages mapped into KVA
Message-ID: <202311131254.C8WZC0U9-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231113022326.24388-15-mic@digikod.net>
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7cfa7d-9020-4152-f344-08dbe4b0d1a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SrwLfLhlWpQJX3CCTtjBUK7m/BTazgPjGSW7LtzCRMn6Uh6YEgLxk6qIP92kEzHVxiBOT4HikcAAZOFtIAp/Lq8JXZ+nflMBXuqNeWU/OoDVwNzqP6cSwxYWU9ZTf38TJqRmDQ3IWYqftj7xHYD+RZXoXjIACPPyUaT4l1s4xA0UwZ/kvT541XQnS8K0yfvyjOCZ15SS5bhTWHVUWUlYrOdVtbgHfbMT0jleyWC/s86YM/xiUjIOIcClbrM57GUDh8s4cnGCto8jKBU2XL01QLaYLnbPfDGE0OhrVjEwbvrgrHPtLedoL06sBkkkkYJKMNwlSkJZRGyA1MMAtkPyy6uCvthyyroiX1XrouLYz4OieCY/+DCVJ4Xl/wdveUiy2bUN70780twzFW4TLGEpmCEyPAbSea4fM8tfIUIApPXYqdLbSnxiC1oK3/ocElJTBRwnmOuf1z2iogEM2zEqKt6/3TGCHjOtx0yt1QUiIJEdyoaCwAZl32Yc/KD1/ZsWwE5eBun3pdWCKN9n1gC3touCwbZ/kx5/okUsrK3ByEXhNd5qca9xpGKzctIiZdOvyytgomuKToR1J2SyM8RujMKI+mIyfbRdnxnN0g2bpp3dNwipDddr35DAcygpOavrcFG9AekczKnQch1huZUGqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(136003)(366004)(376002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(1800799009)(186009)(66556008)(6512007)(66946007)(66476007)(6916009)(316002)(83380400001)(38100700002)(82960400001)(8676002)(8936002)(4326008)(6486002)(478600001)(966005)(36756003)(6666004)(6506007)(86362001)(5660300002)(2616005)(1076003)(2906002)(26005)(66574015)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4PJpzCVkwgpfyRIVg3qr3/yX1l7q8xREE5W3wubKQlPCgH63swET0gw3Fy?=
 =?iso-8859-1?Q?fTZenXflrZ+0h6A1ya1LzHiP8Mn4nTIhJHZHq/QRCaZw7TzmMcFgLrvSLr?=
 =?iso-8859-1?Q?elzZz/sdn2NdT540KuYBh51yCIHybsnOaZQHw2GnUXSa2JLYLW2xZiLjAN?=
 =?iso-8859-1?Q?J7zizktquCFLQBZUhMmrb3tmshPug6KhR/DkCjBUfoeMJvLMq/C5k3dHUD?=
 =?iso-8859-1?Q?RtZZ5idIlSsg3ApD4+yTqG1xUXIUX+nE4WujZpCfSEgmT5LgV+oPrs1Z1X?=
 =?iso-8859-1?Q?ze8UM0FWIb4AS1804XUgXpA70gbOf0kVciIF7wZAeUp9JZq/wAGGTA4F+s?=
 =?iso-8859-1?Q?H2uplUxs/et02F6pZNWPyekl1X5inhhe5WBXkpc0EwH82xgXBtr4F9f/IR?=
 =?iso-8859-1?Q?2fImTnUxfzTP6KJyRlB7qM5BPGq7BT6o2eo8q0DiDf0fw1xumXxqKffDBv?=
 =?iso-8859-1?Q?2gALVsh9LTjPxOgQtZCRsm33RyticexUchE2m6gU9rDRa3xkn+2GAUIkxW?=
 =?iso-8859-1?Q?5eLMS/xTkB1Ct0/MX3EsZ2O0yzJfDAygcct9FPC0QvZv5AO8AYAcEyRCW9?=
 =?iso-8859-1?Q?k8sGz3JaxL0GLW156Z/v1kw7M0wWhkfED3LmjrKwR3l/PavdugAG85iT2G?=
 =?iso-8859-1?Q?EJi8KmO/fwst6MpcmtXFWsZcnFkCHa5D1P6GCfG6VvjofR5BUdcNzn34UP?=
 =?iso-8859-1?Q?98SWCyYrNxQMHid0RQX4qJSgkjj2HwztYeqJtiRI6N+gDsQF7hYGhKwZns?=
 =?iso-8859-1?Q?1DGasVqBqtYvzMSI2YDq2ORVd6WWlp/gcCf/RwYHD/CwLLnTtf0yG3ZWkb?=
 =?iso-8859-1?Q?xAmpPYA8Z8ElA0N1coRK6BXkovS5WB8uzQ3XBZKxHUJqtYqOKlXI++t9pq?=
 =?iso-8859-1?Q?Rj9qurI21MdcXkndVdv5fg7Eg6Rw08/Odj0Y35QkhF1ZeCioD+OwptVRQ5?=
 =?iso-8859-1?Q?rh/abdoUCo6NrjkKWIiF4KWk0Lw6ujK0wFhcO1tL/XP4OWiQVI8U0MjmNF?=
 =?iso-8859-1?Q?5mwYOr8UCh7t4oQKJGXIGgULn5bLbPan+0xLWwmV4Qma4Da8Xf4YP0Cz7Q?=
 =?iso-8859-1?Q?rKnmmV7rrx8eVEtqNLErHwYgTninN0oMca9vSCjhZ82r9QBuWRc7bG1j1B?=
 =?iso-8859-1?Q?mBqe40Xtq2Ou/4qZ+jJH1XEChXu55C58+uuJs4jQo4PvK3ea/ejxJfD/2A?=
 =?iso-8859-1?Q?t6/ex29NmZ02U4mrngF2GWcrv6qm37mheUxlQbwrbcO84Exht30WVkb3//?=
 =?iso-8859-1?Q?ipIYfUi5yDg7UF0ZAbmrxU17fATgYhY0vZABoUY2T/DEbXFsDAzkJVFgsA?=
 =?iso-8859-1?Q?9gIV6RT888S1JgWRy3CsOT637kaJ4CQtjeryylsZ6dZgngHH/HklGC72Mf?=
 =?iso-8859-1?Q?EbMShMnydx+hZSqwyBZr+rYyyV90l6bLnT67wpQsyXW2k6SQ1YhaXLB2cO?=
 =?iso-8859-1?Q?wSViXvW/4DJidZfDGgfDvbtp5RrbZkRoSx3le1nOgSNV3cIqKr6LWW1WPC?=
 =?iso-8859-1?Q?Uy+OcN1oe2NZW7byW3dUdduq+5mV8oFEh8crM7Wb0Gq+2CSIEHprzmn6s0?=
 =?iso-8859-1?Q?T0FxKsC5Q+0J1zShrxtA9c56bDMseA0muDju/EW/RxPPKiam49kLvX5fpl?=
 =?iso-8859-1?Q?KWVJWs51p0zGqZy0GirqzvYQx2VXUSBWRO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7cfa7d-9020-4152-f344-08dbe4b0d1a8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 01:27:08.8350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOXkiey/2W3mVaSdzdZq3PqU7B52fuwKGVUoYkBZKPz+Jw70kbaTqPrWOeIbDFCzbnHcpzbvsF4la6wdXy/axw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
X-OriginatorOrg: intel.com

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 881375a408c0f4ea451ff14545b59216d2923881]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/virt-Introduce-Hypervisor-Enforced-Kernel-Integrity-Heki/20231113-102847
base:   881375a408c0f4ea451ff14545b59216d2923881
patch link:    https://lore.kernel.org/r/20231113022326.24388-15-mic%40digikod.net
patch subject: [RFC PATCH v2 14/19] heki: x86: Initialize permissions counters for pages mapped into KVA
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20231113/202311131254.C8WZC0U9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131254.C8WZC0U9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311131254.C8WZC0U9-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARNING: unmet direct dependencies detected for SPARSEMEM
   Depends on [n]: !SELECT_MEMORY_MODEL [=n] && ARCH_SPARSEMEM_ENABLE || SPARSEMEM_MANUAL [=n]
   Selected by [y]:
   - HEKI [=y] && ARCH_SUPPORTS_HEKI [=y] && HYPERVISOR_SUPPORTS_HEKI [=y] && !X86_16BIT
   In file included from include/linux/mm_types.h:18,
   from include/linux/sched/signal.h:13,
   from include/linux/ptrace.h:7,
   from arch/openrisc/kernel/asm-offsets.c:28:
>> include/linux/page-flags-layout.h:30:10: fatal error: asm/sparsemem.h: No such file or directory
   30 | #include <asm/sparsemem.h>
   |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:116: arch/openrisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SPARSEMEM
   Depends on [n]: !SELECT_MEMORY_MODEL [=n] && ARCH_SPARSEMEM_ENABLE || SPARSEMEM_MANUAL [=n]
   Selected by [y]:
   - HEKI [=y] && ARCH_SUPPORTS_HEKI [=y] && HYPERVISOR_SUPPORTS_HEKI [=y] && !X86_16BIT


vim +30 include/linux/page-flags-layout.h

1587db62d8c0db Yu Zhao        2021-04-29  28  
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  29  #ifdef CONFIG_SPARSEMEM
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22 @30  #include <asm/sparsemem.h>
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  31  #define SECTIONS_SHIFT	(MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
1587db62d8c0db Yu Zhao        2021-04-29  32  #else
1587db62d8c0db Yu Zhao        2021-04-29  33  #define SECTIONS_SHIFT	0
1587db62d8c0db Yu Zhao        2021-04-29  34  #endif
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

