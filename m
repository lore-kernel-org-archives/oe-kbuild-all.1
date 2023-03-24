Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E580B15A7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 01:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679620228; x=1711156228;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tFtG5jC4CsacYYciH0XOcVbL3jJdP48ds9kyD7CS7uc=;
  b=JrhVgYQs56/3NmI5lS3XXtplbXADqtJA+SZAHhcLmL4DXr3WTR8ScAs/
   L9F3lHICVrtkX+qKuhZL/qECpcpQLt7btg6F6QYscadM+HduxD1EcWepi
   l4dpID9stwTEuA0++VAMByKJZgOji0iiK7YIpd+DAaicqPFrSVB+Kxwuw
   IAsr3YVQXYGw1z6tUwMVilpGbg8OHPXhK43zlycOfYIpNSZswFfzifeKZ
   2geOw1lnPlQ/bdAi+cSysO3n0rB5HQUF3b1SsVwDQkxlO6nH3a3Z3fgLx
   Z5qV/naO8rL/N4oUK7xC45/77hLaymK2rRomr302lv4GyQOPMT925+lcz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="342052453"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="342052453"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 18:07:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806473368"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="806473368"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP; 23 Mar 2023 18:07:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 18:07:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 18:07:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 18:07:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyaUOaSGg3hs0AKV0lbOKkhE7jsb/dY1pvNYRNvrONu1mok+1SJLz71bm92wsFv//yY9kOgtXPIlTemCbqER6gYjk/Iouih2fGSuqonlJRZdyGn4ZSVJQS/21V8fN+jY6/oX1PJBDq8ykFvCesZZRAD4dKhdV6W9V/H3fGNZCCsHhh+uiRe62sJtWb4+xtNCuB0VofQXewqfmvyCPhpwOLkDkmLtvl4IOuEc1tdJFuJSqe0VNpYRm2AgVP+AZDo+mqNRFeshsBRw9B6aJCs/jbi0tSsuJ/PmdjPZ6SCuMKl5QNxTRiiof9iMYAqGw/TMBUfE1lJK6sLNU/WFxd7ZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wX1m4nWwcuT83G6EeTRu05XLObOCQydV+0fLf60RoIo=;
 b=UH59/AC4tukuzJRAOF4mezAjdclgo6+wTIj5/Oh948HbptZF8J4ntbXx/SPVakLFc0Rfq5ErMVlzM+2Q9zvDPGecqoQHhDLe2TJ+xHhaqJ6YzA2Q8nb5sSqulaiIJMFktUu97X62/dtA3yG3oPJy5qKed0YKqSslVkeYzoN2g1vpkh66tJXQVacUveVxfyllxq662HQ2fU/WIQrPG8VOsDQJDJ1zCIV5BWWowkkiaQAGlOHKArvSMJWIu3KogByhjIwuJV6qKj5iFtVee8RqzbsclZJC9mpR1uDTefeRhy5/WyAfGdGC2NI8fbbeuESRDo/AGYYqKNezrqoCpzG9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by CH3PR11MB7369.namprd11.prod.outlook.com (2603:10b6:610:14d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 01:07:35 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::93fd:14c:bf9f:6d03]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::93fd:14c:bf9f:6d03%7]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 01:07:20 +0000
Date: Fri, 24 Mar 2023 09:07:10 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: "Mike Rapoport (IBM)" <rppt@kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>, David Hildenbrand <david@redhat.com>
Subject: Re: [akpm-mm:mm-unstable 225/293]
 include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_311' declared with attribute error: BUILD_BUG_ON
 failed: ((16 + (16 - 3))-16) > -1
Message-ID: <ZBz3vkDHoddguZkd@rli9-mobl>
References: <202303240542.vEBPNs2Q-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202303240542.vEBPNs2Q-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|CH3PR11MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9c9f0b-7823-4c11-928f-08db2c041e33
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pBJktgpDV/3NczqfZzonAmKsf2luhpGjwFx3xYTFp3sfRuxA23Yh+9cRJQe9lCp+Jmuu/hcufdC5JWxNAluWfk9mV87/ZJPUja1kXqVb4OeQkl8gP9EmvEbXzPpCEwWJ8eJzjMpcAtpP1XLLWTdbhh6YIuWEGfzUWUpxWKWdQo/tw3EJ/mnIOsqvlWp/GlfN4ULttVaCc3x/Yto5mqHfMOD9OLYZ1JNjA1lWYizrkkLHRpf0Bp3gNGWb7s4puSNWXsuV0Ul8Yf2ul8vWuC2tRQ6P2uFRKvUHdRyDbdp+GxU1aK3vxrW629LFR4x0W8JXYj6itpbQBQfT/N30Ko6JCrewiYNi77FU93HFUSYVYzl0D1SoQ6cJGphxZ4PoswM9t68FjSXR4KUfAq+KQxM14V1iDnhIOxMZyb6RTMBCgujDtvYW0vOJDxaxK8wkfeZkjNzSCIYOTOS5fnI+MNESxyEwT+eTR3BzKCyB2hvLxyYE5UH3W53xGDn3rla+QJ+X7F7/kwulti24TM30tckLGJpDduT1AmWIPAA+hb+nG9KrGtIjdL2ulZKjagPNQcPTbLRe5J4NHbduuW3rKMGcTkwXZq97kdtpf989BqUtTiPaACxkeifME58t9T47Qm8FS9jqF8Fv6/q4IYUW0Zmet3V/xaFVuwXOpg7JcLLr5PI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199018)(6486002)(8676002)(4326008)(5660300002)(66556008)(66946007)(66476007)(30864003)(6636002)(41300700001)(82960400001)(44832011)(8936002)(6862004)(6666004)(26005)(316002)(6512007)(6506007)(54906003)(9686003)(186003)(478600001)(966005)(83380400001)(33716001)(86362001)(38100700002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ldeD1i1G6a59EGnFVK85+BfZ658YjPSidi3L30uzIvEV+IJZiRjjbUmtgcYv?=
 =?us-ascii?Q?QYjOgR2LI9oNd3XJbb0GlA2loh+MxrUrrMTCmbt1Wf4CtPIWUe8f/gkZFwLL?=
 =?us-ascii?Q?95Rev1UB+3poswyRlYIoZuWlHJJx5j723I58bnqu3d9ATrnQeK4lh3cHsefb?=
 =?us-ascii?Q?Qd6F/LUKVeaPnV+dLl09q5Lxm7tnD9fvuIclv98WJjwCnaE8o6NFLamtU667?=
 =?us-ascii?Q?K9ywpD6rpahGDDCZAcX3Dp5sabrkBevmUVDh1PVVS8COBjpiXIU5b92Fm+RR?=
 =?us-ascii?Q?ElLm9HVMhspLoAG9/aVjFezis+vqGQUulP7pEn306dsPU0w11OxPsZocXc8z?=
 =?us-ascii?Q?9/3mlOOmqXrAezYntM4X7+6/ACu8ZwPNvOlohJiEMVvByFpPtM4j+ovHTzEc?=
 =?us-ascii?Q?cJ+I35nvC94GyUYOOMJHXOJFD3NxM35TV4MGjM5QVbgstTSaWo5up9cSOPDg?=
 =?us-ascii?Q?m/ht4H843VdkR3n/K7Ii0IHd9qxcBy0ASzwpW7fidN1uKcwYpyuMBj30gW43?=
 =?us-ascii?Q?bntA/jlfa9lZ4ciOBciHPjofJXd1mIQOhZXXnYLREj8ViE9pxvF0jt/tc7CH?=
 =?us-ascii?Q?nppI0lPFlVnU3b5Goy1m/i7q4CqfvZMPRuoQppngzNsqFvuCsEo4rnjC+iaK?=
 =?us-ascii?Q?1X5ydQZaE/ZLASgRmHxDC1AXQpZ6OB3UVW73XSaFq+0y/VuwpoZerpqDfDyg?=
 =?us-ascii?Q?6PrF9mD0RV7PFR4oVyiNZQ87xPCaAUabq3pMYhmVtxE+XiTCtmYB0ug2nHKu?=
 =?us-ascii?Q?NNxwrAikgwQVxi2ooXb+NpK0mzpfmh/oW022yUi0fJ6RyWvX9KvMBeQgmxrt?=
 =?us-ascii?Q?k6xTLRlgPWGfIro7/M/fDEo4xpt++Eok4Gzp+joCiH83DSDXX1YeFPiGnWir?=
 =?us-ascii?Q?HUc5diwLWFvf/CmebCw/PIKROF8w1NHMKlk7JoJd1TveMkdvucDhpgfOLrPd?=
 =?us-ascii?Q?GsOQ7qVLwnSzw49GA+LEfL7IF5DdncXSHcU47OGfuVSNwrJj3x7YNCEDsNkl?=
 =?us-ascii?Q?TYHMXhaSNs/uXUCf7rRxB5b+xDD+PSpWJBzlOTVq0aOoM2+/hyj/kwxGX2E9?=
 =?us-ascii?Q?gw7j1kHFddxkWq0B0weI68TiAItOMxHGAP1VvxvRhpTQmbeJR/9bmQWc4b0T?=
 =?us-ascii?Q?PcD88D18pxXxmJNTpxlx7rAW1kHRjMb9q4BiDuCWh6toMtpGAwS/0ds1F/H0?=
 =?us-ascii?Q?jVY8ymZceu0bL8aKVLjycijKmPLhEMmSQke2/CD+Ec6Rqd+Usppc5znVuSWk?=
 =?us-ascii?Q?bBNmDkHUunbHeRXyavWkwZq14vKPuHzNtZJTR8lvIz2kwdc6gufWAmLlXtHz?=
 =?us-ascii?Q?a0bNG1PXZcH+vTyBqa2biFF9P6iZZwlzD4GhdfQmWv/1732S+uHsvaBzm2Gd?=
 =?us-ascii?Q?9fuac9o9WNRcKUxsMhaoyTul7JESyH5t3Pq+l+kAPHr6ZxFl7luAO1AZgdXQ?=
 =?us-ascii?Q?82Pb8Gd7T3e5P+IOK3Jd9wwESiNRe1An/Fb/NGx5lPDa0DhVzsglLqks640z?=
 =?us-ascii?Q?0rgAwbPJRqTBDGIbG1I6rszuqPyyZ+9ar+LJci1ZFo+fjiDe5QUmAHBRYJcE?=
 =?us-ascii?Q?ywk9wnMZNN9a2CiLFxedKXBoK5xabKmSGNwuxOGD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9c9f0b-7823-4c11-928f-08db2c041e33
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 01:07:20.5307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Tjz03HkDnrVEGm32OLqls90MkOYOpT0AChPlShSOEgmHFp011nOSvknucqGeojgmr6NHbA43JZuiZBNMhJXNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7369
X-OriginatorOrg: intel.com

On Fri, Mar 24, 2023 at 05:48:59AM +0800, kernel test robot wrote:
> Hi Mike,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

Kindly ignore this false positive, it should be related to the bug in bot, we will
resolve it asap.

> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   51551d71edbc998fd8c8afa7312db3d270f5998e
> commit: 03d7e648fa25961bb92e920e7962710aa72fb409 [225/293] loongarch: drop ranges for definition of ARCH_FORCE_MAX_ORDER
> config: loongarch-buildonly-randconfig-r002-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240542.vEBPNs2Q-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=03d7e648fa25961bb92e920e7962710aa72fb409
>         git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
>         git fetch --no-tags akpm-mm mm-unstable
>         git checkout 03d7e648fa25961bb92e920e7962710aa72fb409
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303240542.vEBPNs2Q-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>      886 |                 if (!valid_page && pageblock_aligned(low_pfn)) {
>          |                                    ^~~~~~~~~~~~~~~~~
>    mm/compaction.c: In function 'isolate_migratepages_range':
>    include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
>       55 | #define pageblock_nr_pages      (1UL << pageblock_order)
>          |                                      ^~
>    include/uapi/linux/const.h:32:44: note: in definition of macro '__ALIGN_KERNEL_MASK'
>       32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
>          |                                            ^
>    include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
>        9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
>          |                                 ^~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                         ^~~~~~~~~~
>    include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                                           ^~~~~~~~~~~~~~~~~~
>    mm/compaction.c:1218:27: note: in expansion of macro 'pageblock_start_pfn'
>     1218 |         block_start_pfn = pageblock_start_pfn(pfn);
>          |                           ^~~~~~~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
>       55 | #define pageblock_nr_pages      (1UL << pageblock_order)
>          |                                      ^~
>    include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
>       32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
>          |                                                  ^~~~
>    include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
>        9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
>          |                                 ^~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                         ^~~~~~~~~~
>    include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                                           ^~~~~~~~~~~~~~~~~~
>    mm/compaction.c:1218:27: note: in expansion of macro 'pageblock_start_pfn'
>     1218 |         block_start_pfn = pageblock_start_pfn(pfn);
>          |                           ^~~~~~~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
>       55 | #define pageblock_nr_pages      (1UL << pageblock_order)
>          |                                      ^~
>    include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
>       32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
>          |                                                             ^~~~
>    include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
>        9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
>          |                                 ^~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                         ^~~~~~~~~~
>    include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                                           ^~~~~~~~~~~~~~~~~~
>    mm/compaction.c:1218:27: note: in expansion of macro 'pageblock_start_pfn'
>     1218 |         block_start_pfn = pageblock_start_pfn(pfn);
>          |                           ^~~~~~~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
>       55 | #define pageblock_nr_pages      (1UL << pageblock_order)
>          |                                      ^~
>    include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
>       32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
>          |                                                  ^~~~
>    include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
>        8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
>          |                                 ^~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:59:41: note: in expansion of macro 'ALIGN'
>       59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
>          |                                         ^~~~~
>    include/linux/pageblock-flags.h:59:58: note: in expansion of macro 'pageblock_nr_pages'
>       59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
>          |                                                          ^~~~~~~~~~~~~~~~~~
>    mm/compaction.c:1221:25: note: in expansion of macro 'pageblock_end_pfn'
>     1221 |         block_end_pfn = pageblock_end_pfn(pfn);
>          |                         ^~~~~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
>       55 | #define pageblock_nr_pages      (1UL << pageblock_order)
>          |                                      ^~
>    include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
>       32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
>          |                                                             ^~~~
>    include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
>        8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
>          |                                 ^~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:59:41: note: in expansion of macro 'ALIGN'
>       59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
>          |                                         ^~~~~
>    include/linux/pageblock-flags.h:59:58: note: in expansion of macro 'pageblock_nr_pages'
>       59 | #define pageblock_end_pfn(pfn)          ALIGN((pfn) + 1, pageblock_nr_pages)
>          |                                                          ^~~~~~~~~~~~~~~~~~
>    mm/compaction.c:1221:25: note: in expansion of macro 'pageblock_end_pfn'
>     1221 |         block_end_pfn = pageblock_end_pfn(pfn);
>          |                         ^~~~~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
>       55 | #define pageblock_nr_pages      (1UL << pageblock_order)
>          |                                      ^~
>    mm/compaction.c:1225:50: note: in expansion of macro 'pageblock_nr_pages'
>     1225 |                                 block_end_pfn += pageblock_nr_pages) {
>          |                                                  ^~~~~~~~~~~~~~~~~~
>    mm/compaction.c: In function 'compact_scanners_met':
> >> mm/compaction.c:1308:30: warning: right shift count is negative [-Wshift-count-negative]
>     1308 |         return (cc->free_pfn >> pageblock_order)
>          |                              ^~
>    mm/compaction.c:1309:37: warning: right shift count is negative [-Wshift-count-negative]
>     1309 |                 <= (cc->migrate_pfn >> pageblock_order);
>          |                                     ^~
>    In file included from include/linux/kernel.h:26:
>    mm/compaction.c: In function 'fast_isolate_around':
>    include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
>       55 | #define pageblock_nr_pages      (1UL << pageblock_order)
>          |                                      ^~
>    include/linux/minmax.h:28:27: note: in definition of macro '__cmp'
>       28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
>          |                           ^
>    include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
>       74 | #define max(x, y)       __careful_cmp(x, y, >)
>          |                         ^~~~~~~~~~~~~
>    mm/compaction.c:1360:21: note: in expansion of macro 'max'
>     1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
>          |                     ^~~
>    include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
>       31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
>          |                                         ^~~~~~~~~~~~~~~~~~~
>    include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
>        9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
>          |                                 ^~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                         ^~~~~~~~~~
>    include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                                           ^~~~~~~~~~~~~~~~~~
>    mm/compaction.c:1360:25: note: in expansion of macro 'pageblock_start_pfn'
>     1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
>          |                         ^~~~~~~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
>       55 | #define pageblock_nr_pages      (1UL << pageblock_order)
>          |                                      ^~
>    include/linux/minmax.h:28:27: note: in definition of macro '__cmp'
>       28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
>          |                           ^
>    include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
>       74 | #define max(x, y)       __careful_cmp(x, y, >)
>          |                         ^~~~~~~~~~~~~
>    mm/compaction.c:1360:21: note: in expansion of macro 'max'
>     1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
>          |                     ^~~
>    include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
>       31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
>          |                                         ^~~~~~~~~~~~~~~~~~~
>    include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
>        9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
>          |                                 ^~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                         ^~~~~~~~~~
>    include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                                           ^~~~~~~~~~~~~~~~~~
>    mm/compaction.c:1360:25: note: in expansion of macro 'pageblock_start_pfn'
>     1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
>          |                         ^~~~~~~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
>       55 | #define pageblock_nr_pages      (1UL << pageblock_order)
>          |                                      ^~
>    include/linux/minmax.h:28:27: note: in definition of macro '__cmp'
>       28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
>          |                           ^
>    include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
>       74 | #define max(x, y)       __careful_cmp(x, y, >)
>          |                         ^~~~~~~~~~~~~
>    mm/compaction.c:1360:21: note: in expansion of macro 'max'
>     1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
>          |                     ^~~
>    include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
>       31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
>          |                                         ^~~~~~~~~~~~~~~~~~~
>    include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
>        9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
>          |                                 ^~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:58:41: note: in expansion of macro 'ALIGN_DOWN'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                         ^~~~~~~~~~
>    include/linux/pageblock-flags.h:58:59: note: in expansion of macro 'pageblock_nr_pages'
>       58 | #define pageblock_start_pfn(pfn)        ALIGN_DOWN((pfn), pageblock_nr_pages)
>          |                                                           ^~~~~~~~~~~~~~~~~~
>    mm/compaction.c:1360:25: note: in expansion of macro 'pageblock_start_pfn'
>     1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
>          |                         ^~~~~~~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:55:38: warning: left shift count is negative [-Wshift-count-negative]
>       55 | #define pageblock_nr_pages      (1UL << pageblock_order)
>          |                                      ^~
>    include/linux/minmax.h:28:40: note: in definition of macro '__cmp'
>       28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
>          |                                        ^
>    include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
>       74 | #define max(x, y)       __careful_cmp(x, y, >)
>          |                         ^~~~~~~~~~~~~
>    mm/compaction.c:1360:21: note: in expansion of macro 'max'
>     1360 |         start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
>          |                     ^~~
> --
>    In file included from include/linux/pgtable.h:6,
>                     from include/linux/mm.h:29,
>                     from mm/huge_memory.c:8:
>    include/linux/swapops.h: In function 'swp_entry_to_pmd':
>    arch/loongarch/include/asm/pgtable.h:277:34: warning: missing braces around initializer [-Wmissing-braces]
>      277 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
>          |                                  ^
>    include/linux/swapops.h:519:16: note: in expansion of macro '__swp_entry_to_pmd'
>      519 |         return __swp_entry_to_pmd(arch_entry);
>          |                ^~~~~~~~~~~~~~~~~~
>    In file included from <command-line>:
>    mm/huge_memory.c: In function 'hugepage_init':
> >> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_311' declared with attribute error: BUILD_BUG_ON failed: ((16 + (16 - 3))-16) > -1
>      397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |                                             ^
>    include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
>      378 |                         prefix ## suffix();                             \
>          |                         ^~~~~~
>    include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
>      397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>       39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>       50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>          |         ^~~~~~~~~~~~~~~~
>    include/linux/bug.h:24:25: note: in expansion of macro 'BUILD_BUG_ON'
>       24 |                         BUILD_BUG_ON(cond);             \
>          |                         ^~~~~~~~~~~~
>    mm/huge_memory.c:470:9: note: in expansion of macro 'MAYBE_BUILD_BUG_ON'
>      470 |         MAYBE_BUILD_BUG_ON(HPAGE_PMD_ORDER > MAX_ORDER);
>          |         ^~~~~~~~~~~~~~~~~~
> 
> 
> vim +/__compiletime_assert_311 +397 include/linux/compiler_types.h
> 
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  383  
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do so.
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  
> 
> :::::: The code at line 397 was first introduced by commit
> :::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h
> 
> :::::: TO: Will Deacon <will@kernel.org>
> :::::: CC: Will Deacon <will@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
> 
