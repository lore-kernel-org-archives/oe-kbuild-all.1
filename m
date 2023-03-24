Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2536615A7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 01:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679620518; x=1711156518;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=U4B4e5CrQMqsUQk1N/5KanWm7Ryl4SGwSkm7r5NEr5I=;
  b=CEvB0gnV4G+SPM5at0xX8RCJM8ImJWhLjWZFMXj/CS9t5X+YenIU6wxN
   W3WyGde1QVRiiYQePhEtZr5fXzkAHVUAgp/mjKkbo1w6mDXGJ/L1QpRuI
   WJ9gje1lRZyCmO2MCb9aqUAxirnofUzyaOSrOvNce9XZ8c2CNbhMEIHVt
   Qpy5/zWtg9IYHeSYvq6NR5tKAGDBCywOBq9vg++DkRLjqjMLQoA2SfEy9
   E25soKk5OpBQWw/UT9MwCpwvCrTTnqSRiYG8+DJI01Kv+1ImU9+ykbIhG
   PxqOMW87cQEVM3zvILPXEhqaK25knht2Ye8F5XMyM8/uFT9D1LBaBIY1q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="338391459"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="338391459"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 18:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="715039551"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="715039551"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2023 18:14:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 18:14:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 18:14:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 18:14:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4sJ95BiEjxuK6RrkpPfqbEuv4HTEhMucbU32QKdok8sQLXJJDqErerBlXDEROgr8FhLy5IHz7lbk98sNxJSyYNX3F3hERM8krJvsxqaX2XmwgljTUE5PjKylTf1fW3U9oVlRyMWW98bZcwE7TKNdMgnnnfGxagNovmmS/XF3CrAueMcBID9ojTZ+7fW/vBFCS/4ImYKYICIRUbDGntCyjdpb5uyCaXbbNgw4M9LfVt34d6jMP+gbZXRqcNTOnbet54li4hY1Ud89Y5zWEdTP1+x8d/AtUT0HgkIIVycPWoJM+LHwM4VGjdNXgQSl+kWb3gh4A/ATxEFneNMyz5i/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhsZR+7OAB135X6wL72jdME58fG+JrLhnDPeKmm+1Yo=;
 b=jCs31D3c5Dmh/R12K2E8vsB/z3o27UcdQm3hEWkFiNHJqqgK3FBh8bdkQ9kbmjfg4VLZF5JA1N9FAdiS2gsZfJcVLJTCFbru2RnQRP+k+e+uT67PwIUb8DGnL5cDkpcgbtgFMEh3p/R/RRUyMDLR9EROqqThPs93mS+sGpf+NkNw66P+JEiwK+IW7jhXWAfzfxxmDsue6nR/MB1R8DSllnsgeelcbb7zBVqO30Hqy/lCE+S1YJaCJ8XvUogTF8B3Bly1RDxl83qvlW2nJ0+WEUfABXTnqcrV6ixcNQzES8vnmhnf6muQeKJeeUecwjtrTOPaDRUBo5U81hpq+yrGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by CY8PR11MB7826.namprd11.prod.outlook.com (2603:10b6:930:76::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 01:14:46 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::93fd:14c:bf9f:6d03]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::93fd:14c:bf9f:6d03%7]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 01:14:21 +0000
Date: Fri, 24 Mar 2023 09:14:11 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: "Mike Rapoport (IBM)" <rppt@kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>, David Hildenbrand <david@redhat.com>
Subject: Re: [akpm-mm:mm-unstable 225/293]
 include/linux/compiler_types.h:397:45: error: call to
 '__compiletime_assert_357' declared with attribute error: BUILD_BUG_ON
 failed: ((14 + (14 - 3))-14) > -1
Message-ID: <ZBz5YyyxkppjZvmZ@rli9-mobl>
References: <202303232056.LpwXNsoL-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202303232056.LpwXNsoL-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|CY8PR11MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c070aa-ac9c-4b89-9f16-08db2c051928
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nkb3OBSrlJu41NtMoF7IadHq7r8yzkpmXA7bFVMX/CBFC+aodVZE0x1bCidXzp20O1Hk59ueKVmLQGQ0q04mb9Ltl61I6QPTQhFzfGxpRt3IVf6Ah7skepRgnWogCzRzS1epfDpq9ifhYqj/gwIjdhGIUgsbzUiZTI8dy0xMi4zmd07EcYwZ4jr5ZN2qGB2dZ5OUAfU9IivjyPKo2eRvLKT+vT0X/C1Aoerx7DiA1o0li4PAPQtKWXvqq8cWyal2sHDAWWuSJeZZQ6XSLRhB5oBofw9XIjls6f2Avh3UOPQ8d6qKl/OAAJObCmt8awTuUw0qT5gyVtS8HYEvGtuEMpsINADEVcGWc58/sxh+RHs9G3cADWvKmGZLMycelymiI2zpSlpqbLibK4Dg5+e68LJ5FPIImPDZ6wkfk0iNE15Zh2qFXLR5DXjALKTjbQtIz00ZeWVvQcg5QCH3TbuHstWitmT1kEZMRhRACeUn5mzRzmu1VadwR+qGf412W9AfaN7iwQp+093oO6cjDhul27e1kkZCNEjWtimjfsf8B23DuHga4qdnq/AkVVvfkpuaYHyTXj/mckxAmCBf/jjRdn28OnLujUDn+Hf6za9sRKvzDaox8w6YmfZ5WZ5KSijkJp/jNKEvT3HEXrlRj5BrY//U0piChDOAkQPIT36CRiQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199018)(86362001)(82960400001)(66476007)(38100700002)(41300700001)(44832011)(5660300002)(4326008)(2906002)(8676002)(33716001)(6862004)(66556008)(8936002)(6636002)(6512007)(9686003)(186003)(6506007)(54906003)(83380400001)(66946007)(26005)(316002)(6486002)(966005)(6666004)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RisKgMEYH3dzOFkThgEt8u4/6bZaKqrFDyR6boaW87C+6VkDtgxnx5MFoPsh?=
 =?us-ascii?Q?G9Q2hVLg1RjUXpxekjysCBn7Pjie8qBW5JpzPfMO8RylbNnQqPG2WEvRGy1D?=
 =?us-ascii?Q?mF7RC67e6NP5iNnlm1SBWA3mJ/y8e0i1SihACGAVO9+r7oqUKNGeO4JIaYqR?=
 =?us-ascii?Q?oKxU/yUmeQhLB0Q7PBlNrRwsq7bzl2/srDjeSRNyHOlkOxF7INhuErG7Q77R?=
 =?us-ascii?Q?POHyS1xP/2IdsO8e9UzdBqeP2Sv8KD3HOTkU+YC+mBn/6K7lsrYJVmmt6Cy1?=
 =?us-ascii?Q?7yjBPIwB/u0oaX1yAuOFE158wAy8qIVk/nSGJPJDvIzdfRvgvW5WoMNZh113?=
 =?us-ascii?Q?gbQPj6q+yjpri4rMkaOQyZ5BRJzkLMP8f4BFxMuw3XR0Nkt59mxy7gk3u0zE?=
 =?us-ascii?Q?ajI2zvB36U+6JNmFjMQJVHFuEjd4R75Mh+03K9tdPqqgsFwMyRol5361pSa2?=
 =?us-ascii?Q?pckfND1/jtzdxK0mdccrshTg4OXVrfSus69gwfO4DJCMZSnq8Xi0DuoIlQXV?=
 =?us-ascii?Q?Ih7yo7xW1GMF4eORwL29jR5DoISvLNn3wR+LuRJvgg4KvXkfIjjT7LBACvt2?=
 =?us-ascii?Q?TYyr9bU6Caqd82mxJtblA6pfMCfzuNEx5cSjU4ZiJ43iMVEM4q2Fovh8PUFT?=
 =?us-ascii?Q?SQ1w3/X+l/rnj+9NqRob+Z0FxHYCTw+FJIE3Iz5UoVtc/GkryJcxNV4+GV5Y?=
 =?us-ascii?Q?9XVaoVMIJifNvR30+cQ7d+pGFx/BVM2tRdNT/t7Jt2zVpYmcWX1S8Bh5dRHR?=
 =?us-ascii?Q?HPvcw58F2c5HkeMs7XKGHc2cCDZkBCV56wjOwUj5B/ZWmpcCDeYBVpT2J6xb?=
 =?us-ascii?Q?ld5096Ot/kjU7qs1R25n6dk+s58N98m0ARLUTFtrFfPdky+Gm2sUJjz8eRmB?=
 =?us-ascii?Q?eiehktqVyeVpAokNf+7n8M0RMegqjx59tbWkPxDwjbP73Jle9/9UHjwX5S5x?=
 =?us-ascii?Q?anpUeJA02wWjxAjq1WiKBwm1lVLijzlCWyNu5G5NpkknDkIKwKd94a2XVeDP?=
 =?us-ascii?Q?vMAqy0Zod0JqFY2Fy0IU10vDJj9GH+zKfFlvWZXtpAeaPJEnLRPgluM3RtsT?=
 =?us-ascii?Q?LUbc2Xjlz+V8XQl7QLdgVDsJIIpX4KU7CFOfYJivcbvUqmtQeGnfLI0jj65j?=
 =?us-ascii?Q?1kbzf9oNhzcgjy/L50akGvDzBAK8SmSA3lBEXJZKf78YnTloceJCNdKOFjOS?=
 =?us-ascii?Q?OwT5YQY0GeVFCG96FzqD7Fc8mrNKOs8L0QavLU4RXykBZP+6tJhoLT+Uaopw?=
 =?us-ascii?Q?rqLa17DlQ4d2hsuiMKzfw7wYCrH3k/G+eB7sNP4t4V/ccNHfNYKBPlezsLu+?=
 =?us-ascii?Q?q4ZIcEiWbT2chwU7oM556jqcJj3vze4x4UgSHYNUqam3ZyPc5kJSpqM5XlM5?=
 =?us-ascii?Q?REfqopdFkAE8XfENxNrUSMtYXvtw9Inqa5GPk/oVVMEYYbhliAkk1kHSIvwt?=
 =?us-ascii?Q?G9a8Ee/xbySe/J/ay4MKwr2OXP2OiDgVLRhbMYCz3NnPMqeny4Df9Je4cTt/?=
 =?us-ascii?Q?cCLhvvd7u5GmUkdE8cfjy+1ToCuRb56sHIEr4k40Dv6RTAh78p3NA4c8BFbg?=
 =?us-ascii?Q?hAQqwYDggYNLqwMd8cHn2aHboAgPbxowkJZz3YDz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c070aa-ac9c-4b89-9f16-08db2c051928
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 01:14:21.5358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpPhA4tf85A/o1NQDMWoIQ4mMtxVLaGWVyG5cxusW8ge6tLtXIaUnHwVZEejQrRKweP3QekaQ9Hrkq3RlCcjLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7826
X-OriginatorOrg: intel.com

On Thu, Mar 23, 2023 at 08:54:27PM +0800, kernel test robot wrote:
> Hi Mike,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

sorry for the false postive, these are all related to the bug that bot wrongly
handles ARCH_FORCE_MAX_ORDER. We will fix it asap.

> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   51551d71edbc998fd8c8afa7312db3d270f5998e
> commit: 03d7e648fa25961bb92e920e7962710aa72fb409 [225/293] loongarch: drop ranges for definition of ARCH_FORCE_MAX_ORDER
> config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230323/202303232056.LpwXNsoL-lkp@intel.com/config)
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
> | Link: https://lore.kernel.org/oe-kbuild-all/202303232056.LpwXNsoL-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>    mm/huge_memory.c: In function 'hugepage_init':
> >> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_357' declared with attribute error: BUILD_BUG_ON failed: ((14 + (14 - 3))-14) > -1
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
> vim +/__compiletime_assert_357 +397 include/linux/compiler_types.h
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
