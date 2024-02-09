Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D852645015
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 16:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707496335; cv=fail; b=J7bZTEx+Efpgjgl8WpfYtelBvdBhPnJ17fEwhR6IaHEOJW3vtwEzjxo+Q/I7ZRPl7ipwcd7OSvzu1JlO/DfKIDDHYZ3M6uPYZIxMWpph4xTuTrpdaPWxixW6pYY7JBtaGJQhQ/bJ1pKfX9fcMBWtE2lVArQ34DDxNoZ0KD/aOp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707496335; c=relaxed/simple;
	bh=6SNHNy3pAMfyQfpYfJBz7E+8ffmuUmwMw9s0Lpi9jmc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=IkKNTNXL3Gnu7lmC3SF4ULbeNy6Ei6QFkUMc11crJgQf9Dq4o5zkc8miue0mhrwCtv+jXAC5T9MYFprc8qOmk323lV2bZgtJO24kK+ij8IPfMn24UQC5YNIiQuKsPFamdbH+hm8yKEG7t+JOqe8PHSbl1Y/anTHu9/wEjSHg8GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3sl9VY4; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3sl9VY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707496333; x=1739032333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6SNHNy3pAMfyQfpYfJBz7E+8ffmuUmwMw9s0Lpi9jmc=;
  b=U3sl9VY4C03C2uTlVtnoy22JNWMdi2mn+bc8+6EVHtqCdNgm5FBMZI00
   d0aqwFkMmoSMAQakU5VpRq4RisNYF9BngEIvNckSORjUhFJ2H4tHt7mFQ
   LdpfOA9P3vjJRecnSon/fZ+QuSPVPFuaJW64p4QsSx8CmmGHJmC+RsabV
   OMUVBH6ASrwwz6nxjILUNkVtLYFNuWxMunXbe4n0sA70/HTtQHXZBuvqW
   Or11pAOTPELH2u/dbRs4Wl8lHKN8+RpbKMwwXmPLjbksMCvxtXXl9b21F
   lnTgT/PEPe4eRR8tDxoxZfzIRNryycBqiMhZhtwbp09D3ZWToIgJPjSkz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="23936926"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="23936926"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 08:32:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="33056708"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Feb 2024 08:32:12 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 08:32:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 08:32:11 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 08:32:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 9 Feb 2024 08:32:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vqm7SKV+dR2WFSvaadwiRrYSr3inG+ylR+8HkvCfj/BdGHwVgXLLsTSDqvs/qSl4EDdPZb/j6OF+KzXXJKljo9orJcYM47rEP2P0Za3Sxo2vELXd4BblzywLBWf0eQhahPUpKKl3HUuMKcPsQkqNKqI6aqE3P7usgQfG8bon2MRHJ2iGCeKlwvVdZCGqEiYnwQV8MYDv6TZpeepK6BSISLeKKOWz4fift/F6NPZyGAzV/r11TfphtUBOVZmN1m2I4Tqp5FLgRS3Zs34SnLrcOh7kYky8TY8loAuq/aZNl+3od9JoFNQ/ULblXlt1khltKKXslZAroCjQOay8gH4slw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tR4GkyjXiISMz1iYFBL7xb3jgBgLVbkDVHwcl/kW4Fs=;
 b=SJZB8P8gUE7mGeYciK28iB9edgT2qcTuBBkQuj7ebVPiEB9jIlVC31+DXzw/kFLhzrIrz55j5TXbgVMXt9+FoP0rWTyGSVCF3XmCaEZsKLS5QiZKzSilYGYFD501EzNSir/z1eXVjqY/XgDXB0wSlcX3Cfho6FvOa6ehyadZAMGvDQOFyDWCHa/Y/PvnZ/RS1bdFrTdA99eIIte0tA3Y9nFLwzZ7RikC+rS4LLovM3L6AiVB/Tmjk8fAX2xVeHn5GRG7IVzFHLpsFfM0etjO+HigkXnxkpVSNQ1qa2CvboxYjESDZ42EaLygu83SRb6pS30Z+Xw98bKHntVGD1uzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by DM4PR11MB7208.namprd11.prod.outlook.com (2603:10b6:8:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Fri, 9 Feb
 2024 16:32:06 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7249.038; Fri, 9 Feb 2024
 16:32:06 +0000
Date: Sat, 10 Feb 2024 00:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
CC: <oe-kbuild-all@lists.linux.dev>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.8.y 45/50] include/linux/build_bug.h:78:41: error:
 static assertion failed: "!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
 IS_ENABLED(CONFIG_IOMMU_DMA))"
Message-ID: <202402081137.dkKEWd5B-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|DM4PR11MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a0cbad-e353-40dd-bced-08dc298ca796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1LtWdtDFttppG9T9CYNJP46OhI46ljwOz3rg/BAvyBAruI0/wD/tl90eAkS2B92xcSQGdkfokIjoe8GV/sdQl3hF+jZSK/dpKlMCASfP9U48z4byA2ErLzh9OvU5UokSneGIkN+TY23m2M/rLTRLBpjt3MNF05JJb+9cQQurCfGW1QtG4LEEgUTJHh5Faon6UHLeBzGZ7YonnPXq7rvOEi6kaS2e7XIdQq05dlgqvBTwcVydDzcKe7kLw+u5liXcX5drWH8mXB4eO+Ivd24iyBgMRKeH5VRemDztTrLlhfkO5AdeS8Ywyc235msazIv2Kacl8JmZx+sgveYQI2fED9hq+Lkjo7XUyp8ycHmCZQXgzxvyM7IF+WDPKgK7vSCw7nmy2rCSwvJ/PFkRz/IuCcIu7jKLMkHnkIAJZAJFLqLcPvJdkm+KI2OAz7PA88OfGuPATDdAO8KBfhLa728wCdHF+PlmLF+M/GlZ7I3o3EJTaAjSDptH7NAS0r8fQFb2svXboXUK92PB5au1q66d2DAZpI/j1zgruYzQMkBBBBu5kw5XAEvF1NXYPTzWWLC5qJ4YdykdnU3XBsFo13V0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(366004)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(86362001)(26005)(1076003)(83380400001)(6666004)(6512007)(41300700001)(36756003)(6506007)(4001150100001)(66946007)(478600001)(82960400001)(5660300002)(8936002)(6916009)(316002)(8676002)(966005)(2616005)(66556008)(38100700002)(6486002)(66476007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cVZXC3VZ2stpAsoOpqHkKytwwu99P7A64hAsxxy05z9TIMGsIiq/9Q7nuGTW?=
 =?us-ascii?Q?yB0cixR48QMfH/xmQdV8m2H2UqnvbmlSg5KIhVfwNEGqTWZ7NcSHgOlMOUvp?=
 =?us-ascii?Q?e8DD6a6MtFlunZuRv7bHP3Fu3Q28Odgrc3V7921TVCTYfzWQHtk+DK9Up1yF?=
 =?us-ascii?Q?1nOlyHszEcQ1t9bgjjrWUeRpVd1yX6IM+11fkSNBGMrhm5Ug9M4ygdaN8syt?=
 =?us-ascii?Q?gC82ef5AfRNxlyYCF3u4m3qrzhrcwekdtnYX6J1Hv/qsm0NCRDXBeYdk8NIJ?=
 =?us-ascii?Q?dPC6yF/7JJPuClCTGotP/vsWRCMgk3E5gmk/spSlfFoJmJNf/69WwNFxXvCa?=
 =?us-ascii?Q?k2JUZBJ3STIhby9nmZs2F6B3Bn2IFh0qNTUcamKW0XNXIrB7RamGHzWFauAu?=
 =?us-ascii?Q?2IbzkAbEBv31AaTh48AKntFN0D/Lw08A7oyD6hgHaOdf0HQZGETWTMipks9l?=
 =?us-ascii?Q?rJ85QOOddJmybzG+ug36OLIulHytBWagsO8UC43/XoZPRujc0ROxvIp7cxWn?=
 =?us-ascii?Q?hPassianTf0mKy1l0eGIVp4UL1D/qZgbjnl5B5kyf+iPZbb67u6nMm0/8Tf/?=
 =?us-ascii?Q?/fS5Mfur8s+lVeg3PzvqsivxwbNqXKcamN9k8PjpTjya7Y6RISCIYxnhNieQ?=
 =?us-ascii?Q?AoUek3BRVbiFN/dqfn1YHujTxY8CxdNOac3DwXENxWx8JxBQmcV/lPxVplBE?=
 =?us-ascii?Q?rQMC+JBtzm31JX6NB761uK8bHv0x8jnIs2mpv465g58AbcRilvto1rGAKA4j?=
 =?us-ascii?Q?ORX7QtRx5YTnMeF+KhAQ5pfP2wwJkchK61sNQWels1nH+GrZGxG+/eHknrIV?=
 =?us-ascii?Q?srHE/WaSthLa0j3ODg7nhaj3VYIZt9RgCTXWyKGJ61pUSs0dDVmMNNypfeKv?=
 =?us-ascii?Q?+F9/Ykl63p+JNbL6KFyXLTzcjS2qONr7GCDm0ppgniJDqiJwtDS/STFTpYrr?=
 =?us-ascii?Q?JJPU7bO4nEfxQ4DV2ZYz0pdGJgTVn7lyw+6aurcPkF/0L5IhV088SOJCMlGR?=
 =?us-ascii?Q?4ZJiArEEVL1Cz6A6qau3P4iph3+u2C28PiuxcZ5GzLAyFP8cDqUohSQ/sklG?=
 =?us-ascii?Q?VR43hTkf76NqxpXEGOjR7MetVwVBXEBmphkwr7q4rcVrgVmZ/z47xKdGHx9K?=
 =?us-ascii?Q?eSbeB5e3YHIxnW4HdoC+9iU9RwPFpPGa6QhjuyWDMm1NenFDBbJ9OJzErJOA?=
 =?us-ascii?Q?YVhnoG+6EUmYaXvKDUw0YOhLuPpYE8Hj5gk0HC8etGn00r2xETVb2uhbrTU+?=
 =?us-ascii?Q?Pw8nnKQswMQkKU0aor8pTmcJVMe/K1XnWZ7JpAx1T6MbHtBymsLnxo4bdzzH?=
 =?us-ascii?Q?r0Y+wTeuM0SY5MUNiAF9KMJ3JKXRka5rS8o0MZg9j9o19vwwWMd0D3LMysDu?=
 =?us-ascii?Q?hGxrdohnZ8jzzDT/ucAl1dxspFGu3jQiQiqxKUklmd51cjMBX+7SOEt43HjQ?=
 =?us-ascii?Q?cs8J5P54XAUKEqVT19I3eTdj7CAq8OoQu4CMomV6ipFQFFPmt7IFy4m+S5Ho?=
 =?us-ascii?Q?QXSxuetJJiz02rbihBXfDxQBa1ljg5ppbVyjdxyGXO7iNj5NSiMYuml5vsYj?=
 =?us-ascii?Q?StaKEo948k+TBqH3L5y4/EXaDHFjFeezw7E5y9LXPooVR3Pke4HciUYQD8Qh?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a0cbad-e353-40dd-bced-08dc298ca796
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 16:32:06.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qI+mKHXuBwqiCWjZZ9pGEcjR62xkpDe/BsneZgdZD2YTAJ6zxjPO7WT8qLJBreZd1NG+bfoKIrxrZNvNR81ByA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7208
X-OriginatorOrg: intel.com

tree:   https://github.com/esmil/linux d1-6.8.y
head:   f3b6698ac10e7f6528408bda7d8d162065a44af1
commit: fc999d268262198273238ee56444d61d1af41dd1 [45/50] iommu/sun50i: Ensure the IOMMU can be used for DMA
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-001-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081137.dkKEWd5B-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081137.dkKEWd5B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402081137.dkKEWd5B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from include/linux/clk.h:13,
                    from include/linux/amba/bus.h:14,
                    from drivers/iommu/iommu.c:9:
   drivers/iommu/iommu.c: In function 'iommu_get_default_domain_type':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && IS_ENABLED(CONFIG_IOMMU_DMA))"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:1926:17: note: in expansion of macro 'static_assert'
    1926 |                 static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
         |                 ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

