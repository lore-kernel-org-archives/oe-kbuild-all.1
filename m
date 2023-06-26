Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50691440C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 07:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687763998; x=1719299998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f31v2ZNDA4zPq7+rqtAVSePjvG1IKm9UoDrvE5LVvrg=;
  b=EZdl23OZTIo8DO5r9QgscCePixOnanQJqV5qENQ4DpuWkH5f41ZBssyS
   vQ3JzgD1L+by7RxcfsP7lCmY1Nmm3xXTNP9Q2DDolPEdJwaDwrUnmh7ef
   /TwRA4H8XvZTwmQ2M+7ah2xQQ8jUP9wJU5hvC0y1TLzls/z3rijgEMeNe
   t6s30bguCB6sda9sKCt4B3BKodgBOFBNHcpQfUFt96G3sxczfzXaW4rY4
   Sewtu0L7Oa7EwIX2eYhe2qvWa4ybuhVEXuyW3Lk9YJj8jualuCZU6j2+F
   DdR8MgHUtecBrv+p661WL3EzbTee1ZfGDOiG2CL5dBoEEfZWfl5ADhDN8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="340787160"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="340787160"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 00:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="693375850"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="693375850"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP; 26 Jun 2023 00:19:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 00:19:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 26 Jun 2023 00:19:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 26 Jun 2023 00:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk9eZa144WIu7BJhRbyEQF86cwx2VnpgkRyiZU5MSeoddmF8WTHUekeWTD2KG9tun/Vl6Z+m67MYgaauhmMotc7ibT0qQnkcHR2QbYrHytST6pAutQL2kWzsKZZ/x3hymI4i9z4IF58m2aN1Cy+gURFTdhjf4k9/wZ63LtB7X+DabTbn+AbbjbmvXFuT1KZ/AU7AvUFwSOpYnlz3lYWZOO3To1k/CPk3a8rQlSlT9iNWxshwDsdcm5/7S9BS7WWrKt72os/AJY4WpOXBtddQfA2V2szdv1gOI3hfEKKyJ82Ub8UyCcVH90XYbWRBK3004ZQ7dAOVXaU3QtV3dAgCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPL3codi5oeqhFjmCEbxcWD6Uion4kecq+iSFjGrIAE=;
 b=iUJiUCUz+FsdhJPW7DQduJnVjHjvuQ66G9bqJJHnwKxQybKBvJ6BS0eTv7MtUTlNRKmoV9eDTghAZlux2S0w1xHVBoXBCzCwK3cTbZI44//jUHkeQR206/pPQ+EGwm2+1qIDOCS8SYsImHkAGx32xeUVOTR5zgxnEIz/Baqt/m9cXsgFDnWFY6pfVSPVhVbJw4qkgyXqbDXG9kDWPwH1/m0zvR42Qt/RNUZtoz1nxOHHzcu+vpiX0SQELJbfcujSu2lN0umYOFh15gS7AGMykun+0SXA4lAb0NTAud4AZQMpy/R4RIit+MvNI6VoYCBA06hCRRTlE1+b2GUpdkbxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM4PR11MB6120.namprd11.prod.outlook.com (2603:10b6:8:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 07:19:44 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 07:19:44 +0000
Date: Mon, 26 Jun 2023 15:16:38 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Patricia Alfonso <trishalfonso@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Richard
 Weinberger" <richard@nod.at>, Vincent Whitchurch
	<vincent.whitchurch@axis.com>, David Gow <davidgow@google.com>, Johannes Berg
	<johannes@sipsolutions.net>, Dmitry Vyukov <dvyukov@google.com>, "Andrey
 Konovalov" <andreyknvl@gmail.com>
Subject: mm/kasan/kasan.h:485:2: error: #error kasan_arch_is_ready only works
 in KASAN generic outline mode!
Message-ID: <202306191845.ddCTgcG9-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DM4PR11MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: de5b631f-4515-4856-cec1-08db7615b6c0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITHJMtqbRxzpHAQvWPtoLmUVzhCoY5/0HDr5o+lmftj0K+V2mFRnXOFjlnt7lL2xfD4eZMI5lU8pPl5hQ5bRW5PVaRgiSrIok2/kt56rywQEk0BvRjIkxFKRx5zPqtRZtzTkEP0Xd0Qlu3zUgkJQIm4BNU9P8CmoH55pR/JUYdrvO6XnNrojXixTqfz0/sDZ//rSlRP/qXmWKH+VaUgAukoUnkak9XpHE0REZS28ZJlx/aUVeBfcAE59sXKAVQAb7iwpOtKYx2Tv75dTS+FMHAnjbDbxZEk8OoVvDSEzDQnPZsG5SDojNBMzYzu7Rk9IgTkiQfylPm9K3XbR9bKd71ZQ7IdKrxJ2b4qkadZZu+vQZ1OO+JfmjugmYy89e4Fw9x6tPj09qgg917Sln1lRh5tYP1RRRANy1EixBtm9K9zfFSUHMHbqMsW5tbvqmJwcOZ0VGJ5bav2aKgdb6RsFVsfMLnpYzdJctcBveGXmKPuyLv/0ltCJXu+hI6BEUn0vDWVv7TEZNQac3WwoeD+4ZEV8V4wDlx6go/rsDEnw6mtS/JDB5BfqluZeovQT2XEbZOEFC2CD2VqEhcw1lR6yvYtwTG7fnVjIIaWVYPVukNVbdwT/04tRhRuu0PARGmtMo2k7xjiqEzvfJ3UQ/7+ChQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(36756003)(5660300002)(6916009)(86362001)(8936002)(8676002)(41300700001)(66556008)(66476007)(4326008)(38100700002)(316002)(66946007)(82960400001)(966005)(1076003)(6506007)(26005)(6512007)(2906002)(186003)(478600001)(6666004)(54906003)(83380400001)(2616005)(6486002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dhR8RPx027a2zRBDJure6b2M296rLbrz3MDfQQ4wrHlBtnRV8JYnNQm+vl4Q?=
 =?us-ascii?Q?8/9lYmvdCeumDe5SIx75dEReCCQRJmtaiULo+F2+m84uqosR5RvBlW0o61gA?=
 =?us-ascii?Q?J58KTcgDK3y5jumONT0/4bQelMIfO75C5/zLCjFP8mwA1K0w/S/BKDZ1WPgR?=
 =?us-ascii?Q?S+lCSGDutn8kRquBwTawxX+BpDDnOJHuEiN8EK3Jb3G7S+H2woCrQWHmivoh?=
 =?us-ascii?Q?0w5km7QOEVr41emXwMV0EVI9jsnbk3p/QMlN51udOQ3RCONcAbcn+4OL7fjw?=
 =?us-ascii?Q?lZJsvaO3nblRYAG604l8cfDWTsqaBI0ulQa8l0Al99bH8RXVt24ThASfKHc0?=
 =?us-ascii?Q?6I25qgLRxDm/kpjapyl/7OzRkhOKc8aagvw85iZZ+bFiqUdh7QrUcXCRaJoK?=
 =?us-ascii?Q?400UNSTgKO8a3fWm7Ri7qkFrvxLVXaq3fLpp3IPg8QApd+FEmYJ43sNmsRIm?=
 =?us-ascii?Q?ljjkGGLq+bamcr1IvhjMxrl86uBSJaBaKZqOmXMcJNN+2yce1RFgpfGm5KpY?=
 =?us-ascii?Q?GLyOVEpBsPGUR+O15fV0UMVtrEtAgMkflOnIJN3a2OPNCL0lhmS1z74lore6?=
 =?us-ascii?Q?QOeEojWYqEzdwwxzXgCzm0naN+zlu229/0ZutXIlzszcK/vxFd6khbMIdsoU?=
 =?us-ascii?Q?iKv17A9EqiU6EPDmg43bt9cfCe/2i0XcYs58RH/tdsQ3xT44z8OAy+1ZcfTI?=
 =?us-ascii?Q?eL3wqhkPE7Hn5LvtU+C/sip0Xp7jAueuVfFvbC0/va14niTbAqgIOzfpYur4?=
 =?us-ascii?Q?RM/F2HDftTIQaG2JD4P9naz9gi9ae3mYbfp+Snlod87OzYlQ0QaEsvuiI01f?=
 =?us-ascii?Q?bgT32FuRy70BzcQ7MzOwaDY0JdZKlMMXdcfD+06BfzjUlJHPlukwY8fEi63v?=
 =?us-ascii?Q?W6uxYJLmvtpvCET8XPZZv/MaB2pUNN2k+UToS2CFQikNPmh5I0OU6aJ2rjt0?=
 =?us-ascii?Q?a5OiKe5+iPMmWfpXOxM0oDJ+hxbfcjO3PLp/IUBOXKmDnx9vPPTvQwzcRECQ?=
 =?us-ascii?Q?KEKot80QgBEwXSLFJvErt/AwKqB4H3NVYWobHULuN74uv23OnBGx6JsshZsE?=
 =?us-ascii?Q?WHCE6iDW5HCZXFLDUbIKVYW1Cgl6/qNczqK0hfgh96B5D6diial+5NS+3Md6?=
 =?us-ascii?Q?rF1GWYcbRP9Mj/6CXYK1aaDVZ1rFMACkYJEcQi83YHWGFJH6nOhkwJsqXtdF?=
 =?us-ascii?Q?X3Dv6ax6DGfCvs7Knx/uSful2toN6TVcjTCAp7r1JniN+Ti74zGK1XTlSiAq?=
 =?us-ascii?Q?6W0f7mAYTOs3rw5Hmk5QFILpxS54L6QcYdQ9kMGm3Eu6f7XiE1Ee2y6Xkxno?=
 =?us-ascii?Q?V7lc+jOCo4C0bvmToNTz9WoyDBrmD3uw7gxFV29jijO/akOTkbhYbb/BrYEu?=
 =?us-ascii?Q?UONvRurMO+/RLUzdJcBIx668dHX1sRCG1UtFK69+nPsGUeB5OJ1yQlCNO/sP?=
 =?us-ascii?Q?cgksyv2A3khZx37YGvZ3QI+KaWv62dXg9nlKvIdcwh5SOzsn/eDKaVIFPsl3?=
 =?us-ascii?Q?MSGgd3aYyCxrECWugPOy9Hl0yvAkWrTSGht9jL//VQXYyghkkjjYHB6bZ13S?=
 =?us-ascii?Q?AmbCvq/vJ1SnFXM2sWr7u/+syuC8iou3ZE1NA+B2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de5b631f-4515-4856-cec1-08db7615b6c0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 07:19:43.6875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQxmdW1BK6Ce8o/oHspZj3ty8bR9KD8yeP+iG4qv5GSkIWxtYHkhFElleZfYQKnjQwISqJHDyywCm9ahG5M9MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6120
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45a3e24f65e90a047bef86f927ebdc4c710edaa1
commit: 5b301409e8bc5d7fad2ee138be44c5c529dd0874 UML: add support for KASAN under x86_64
date:   11 months ago
config: um-randconfig-r023-20230619 (https://download.01.org/0day-ci/archive/20230619/202306191845.ddCTgcG9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191845.ddCTgcG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202306191845.ddCTgcG9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/kasan/generic.c:34:
>> mm/kasan/kasan.h:485:2: error: #error kasan_arch_is_ready only works in KASAN generic outline mode!
     485 | #error kasan_arch_is_ready only works in KASAN generic outline mode!
         |  ^~~~~
--
   In file included from lib/test_kasan.c:28:
>> lib/../mm/kasan/kasan.h:485:2: error: #error kasan_arch_is_ready only works in KASAN generic outline mode!
     485 | #error kasan_arch_is_ready only works in KASAN generic outline mode!
         |  ^~~~~


CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set


vim +485 mm/kasan/kasan.h

e2db1a9aa38149 Andrey Konovalov 2021-02-25  481  
af3751f3c2b628 Daniel Axtens    2021-06-28  482  #ifndef kasan_arch_is_ready
af3751f3c2b628 Daniel Axtens    2021-06-28  483  static inline bool kasan_arch_is_ready(void)	{ return true; }
af3751f3c2b628 Daniel Axtens    2021-06-28  484  #elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
af3751f3c2b628 Daniel Axtens    2021-06-28 @485  #error kasan_arch_is_ready only works in KASAN generic outline mode!
af3751f3c2b628 Daniel Axtens    2021-06-28  486  #endif
af3751f3c2b628 Daniel Axtens    2021-06-28  487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

