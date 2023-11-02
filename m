Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887AD1851
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 05:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGx3hX2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698902992; x=1730438992;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0B+3k1Alslm2Hsu9Py6UrlQZLC0agzW1dbFR9n6/GJk=;
  b=IGx3hX2T/1mjFNBmo5beiCdgd+UaFvAKcsKdv1fbYvQ0c31cXYiU0RSe
   jw3KP3oS4zIc2TSZAC8pnpUoaMwvf3XZ4FY0av8lNK3gSbEudeWwTcNOA
   5+xjIAJI1PU10lwqgtfY3a9guNxFHbasXUqqD7OhJAFZHMgrOYAxdKvB5
   f/nOF93QEIT52OrrthqM4bCu1269ZrtpMd7DCmb2eB1sM9kx/Zk6Tf50V
   0ugafXaSXyf+IGZmmW/HKr2Hr3U46sz2NErLImy3Lp4ioMtagt1eb0PaM
   qHLhTdJ5OOCf5MGCAZeVX269M7dgiQi4IKUneO5+5X2FrFOI2Ns3USHVJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="367987021"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="367987021"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 22:29:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="826998173"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="826998173"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Nov 2023 22:29:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 22:29:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 22:29:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 22:29:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 22:29:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8TYE4nDQySH/0uX/P9ac99NYyzbvIsPv8Ig0puLZ5NyP3AC/Z4+J9oD8pDt0Rs8t50ysLwNhxh9r7AI9rRdkA5JKdYfi+TrAkD+jA/Ug+2j3uGfZ2aXk4k0xUnzaw0ub1KOu5ogKrDyNCg0DERZhrj7dVCzba5BClAYmozbHjBwg2NJFZf+2AMpXJVlBKKGsZOVB69yoYMCAyD4g/yuPFNHDy4Au+sb8uOojcz9xiDGGR0Fl1ljxmwe+jJ9egOz/4rZXwLB7U3tYGaOkEI/ZGS/y+qwp8AWN3md8rrlcAwVySJgiv1g4tI8GXl7WTD7z5UKvRjqnKEqWckJ5SmBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxH1Ls2WzMLiiBmED3OV0sdVidTPJAThb7TRlMqWGjw=;
 b=LKQbirNq4KfHQadg4Fv96L9MR4piuhAXMvCILhrPl/KOsiA9fcJst0kKFQZYcmCf/6mZGnyJ5fB60xsQa1llqO2xyB7M1GIHjgxuI4X3z0aL/7NyJ2bfHF4icyXf4z4kJ9O54P429daHTdjdFRV+f9iei2qAqpuNYBnAAX0ptl3V0rOADJHRvmYW/fKBXHi9kkKU3X8IoXMR/mmtz6qYGrd0qgWmhRyjO4oTnPUdVTDsPBdv0z69tro9+vKGKOZejxZ1ZtCLDJ2dph+cwFwXP1YvpbcrdTFiiHPfhdfZ7odnNpuYYCjBoNd2aI/ecjlutqEK/NziN5l45GABIpzIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 05:29:47 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Thu, 2 Nov 2023
 05:29:47 +0000
Date: Thu, 2 Nov 2023 13:25:02 +0800
From: kernel test robot <yujie.liu@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH 2/3] riscv: add support for SBI Supervisor Software
 Events extension
Message-ID: <202310311237.W6U57ENT-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231026143122.279437-3-cleger@rivosinc.com>
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ0PR11MB4942:EE_
X-MS-Office365-Filtering-Correlation-Id: d3fc075d-44ed-4481-13c8-08dbdb64b99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vC4HYSFAas6rCwDcZmm+B6ZTYIts9nlRombV0SbAFbOQS4oq6ye/sIIwjuNJbnVoKw0hdyNMh5DjHy0RZlqlhMtFipUGCWQgHfxqYSVuzSMR11fa7vyCLorS+ypLnZdrpf6nKXYK+W2VrV1P1YT3zI9tjz2+bus2iysL2VubQfScohfrY9pshnNYE6Br+tmP8AD/HoX6D7DI3sOWuV6q/tdQhZVkuyVMF3QMVH0mmyiRf9nRmcKFfraLF1qnDmZYWqSOSdyI4oT0EA5wJETLiC/CbrK3z0N8LS/pcuavWX6fA7fKd1LCpJiwSk7mX/ck4bh7v4qq5pCSRf62wVDSC7d8AW/bN5W8ux+2O7POJYqwUvfeuIJEyl+gHQI7JfGIb0KdMxBeky0xIATxElefVjtNlSlcfjqW3LjY/ZENI9tHYhu6Q1BSfzCZIPpT8xWJD8T3FOyan8w5OSOBw0IGNbz1MFaBlhVqGbqBTAd72MfhYfUERwqT3ISRo+HAi74oqyZeRj6Gl+ABhQpGE4Rt09JUPyDlUGWfMQ7PecmCNG50X6tK9FTDJS4mSqtZR+HHyYnozpQwbpJfkvgqxTjnGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6666004)(6512007)(478600001)(6506007)(6486002)(966005)(83380400001)(4001150100001)(4326008)(5660300002)(30864003)(8676002)(8936002)(2906002)(38100700002)(6916009)(1076003)(66556008)(66476007)(316002)(26005)(2616005)(36756003)(66946007)(66574015)(82960400001)(86362001)(41300700001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jlzu2bU3NUqGxdVFfEl6KhHy/1YW08xGidRAd3BGol4V2uy4A8O7tGtI2d?=
 =?iso-8859-1?Q?HUiFy+2/68STcG1MBMAWqv7btnYt1BB7Zh9v59MLPnh+cVPt+54ZcfZcyd?=
 =?iso-8859-1?Q?jiM/dq1IYZuAJAJ51pq5RIWN1iK+hAK6g+5qvjqOxLqrXO6FvdcGxKWaUu?=
 =?iso-8859-1?Q?JOrP6Bqge6jeyLVU4CJBK29UfU0b5R032WdotqZnUgIslIFAM8r06I6Vms?=
 =?iso-8859-1?Q?+tZGqcFNwzfEthOSt4EAvTTYplv5Qy+lr896+IRpNGj4bfP0W3DzTxhBwN?=
 =?iso-8859-1?Q?e9p2oDzdYN2NEH4TekUIPcjlbHQpcJJ9cgWn6gQ7e4EsBM/fPUbPbT4//1?=
 =?iso-8859-1?Q?5XCLMbKesXSCPYqg/eBBjFlBavYozyO/PYjx9G9yBeBgYUy1pK4bprRcRc?=
 =?iso-8859-1?Q?Zhts807n7JLpEvq+owKVQbTcCu07iW0Z+HTbKi7nhaM1N+gyStt5pYWeUJ?=
 =?iso-8859-1?Q?RBO5ZG4gZ64JEsKASalXYOdwsdsKCa+87Ez1HBx1kqLsARMKZ3sCM0mYIm?=
 =?iso-8859-1?Q?X3bKhXIEQO4yodHQ/TMeXCmdX927olLJOnJNixckILzoKLbI7qT5v043+C?=
 =?iso-8859-1?Q?oB5gOSZEiOQNmxcsNU7TgfmiPU0WCZNKWe8vCHO/ROM5QWtJY7BBqQYJS9?=
 =?iso-8859-1?Q?B/XQDrxmI5EDvsXLDc0HWxMUZaBSDmHRWucqj+kdmfG1MrBUZIPslpulpO?=
 =?iso-8859-1?Q?zogsyzNoEIndXmZBIVdjPZHfYhvFhsGrwxFC83RyDI7QhATz3IjHFSfs0e?=
 =?iso-8859-1?Q?4/JPV4JEAhxEXLtEIzN7e/L9Na0CY9WLyJbuxXpla8ZFocaFuvGrJMeJuh?=
 =?iso-8859-1?Q?/P7x6AjK2yON40i9NH7jUHi/og2OirbvR0ZfGpHjodrCtWP+XgfKwK+MCA?=
 =?iso-8859-1?Q?3zVRcBO+PDoyotx4H9/ROvqwzKu5pKowCghHIN/WHIPJ5jZVHVtc/whznw?=
 =?iso-8859-1?Q?JrLWxCkB6MhGaGElZ8dKQLQgeY4hy0Ri25xZmo1HB+AmnE+NDmafrVhYq5?=
 =?iso-8859-1?Q?xzm+6o6grje11fYhtFmHfvKRFLfMjwzeEWOurIL/9CZZuLFBR9ipDnwkf+?=
 =?iso-8859-1?Q?Y/F52LKC9b1mfeNrhyzZ6/IsWVDcM/l5Fv3MgM0vRx9VEat8l6F6ETCiQ8?=
 =?iso-8859-1?Q?VrkPAP4mgbgSFqED2/U9Tg2Upp1Z+MSrSCxgktisQtcq1cwinpitFnpKn1?=
 =?iso-8859-1?Q?Rfmanc/okEP2BKcMndfBkfE0o5VR+tdjh91NL2Fqgxgs8oD9OJXovigy5E?=
 =?iso-8859-1?Q?OjfOK3/7iwpe/4LpiqJG8M7bHM/CkVsSSE2vomW18CFH3Egg+e/8qaAhaM?=
 =?iso-8859-1?Q?WVR5mhxft6th49zRKDEY5NtC2e4EH9QdDkqOHzQspjtw1gZ29Ltl4NfOro?=
 =?iso-8859-1?Q?eWtt7bRaa1WNJM/Y/SVWmodFttU8+8h+Ny9J8jBK9aZ5KxPjgqJrLIOowM?=
 =?iso-8859-1?Q?QGV0M7N3Nj7YuHn+YEeP1MsGBmOIVckYVdTSo7VrjMChKGgTyo/xOVumLj?=
 =?iso-8859-1?Q?KvVvzWKZQJOrFuqA7mYK0WSJyYL0HHKckqHWUwyBpP9IRoZ+YZeduF/oEh?=
 =?iso-8859-1?Q?vD/MH+oBJJRewbNtPg6pxd/MyBX7xdRgNW/Jcs30EBrdCPkTTDfXX6v08Z?=
 =?iso-8859-1?Q?E4V0v/gx3QP8SYyb7KBHZ9teFi8Gvgsv6a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fc075d-44ed-4481-13c8-08dbdb64b99f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 05:29:46.7733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeVXtc/Db9ry5GM9ykMDLTKRzLurACMa+ndXQxQu7odqhmeuee/CLRr3j+ZUUcLuYlSC8cE10fG6MUFEc7w7UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
X-OriginatorOrg: intel.com

Hi Clément,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6]
[cannot apply to next-20231030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-L-ger/riscv-add-SBI-SSE-extension-definitions/20231026-223410
base:   linus/master
patch link:    https://lore.kernel.org/r/20231026143122.279437-3-cleger%40rivosinc.com
patch subject: [RFC PATCH 2/3] riscv: add support for SBI Supervisor Software Events extension
config: riscv-randconfig-002-20231031 (https://download.01.org/0day-ci/archive/20231031/202310311237.W6U57ENT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311237.W6U57ENT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310311237.W6U57ENT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:9:
   arch/riscv/kernel/asm-offsets.c: In function 'asm_offsets':
>> arch/riscv/kernel/asm-offsets.c:495:29: error: 'SBI_EXT_SSE' undeclared (first use in this function)
     495 |         DEFINE(SBI_EXT_SSE, SBI_EXT_SSE);
         |                             ^~~~~~~~~~~
   include/linux/kbuild.h:6:69: note: in definition of macro 'DEFINE'
       6 |         asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
         |                                                                     ^~~
   arch/riscv/kernel/asm-offsets.c:495:29: note: each undeclared identifier is reported only once for each function it appears in
     495 |         DEFINE(SBI_EXT_SSE, SBI_EXT_SSE);
         |                             ^~~~~~~~~~~
   include/linux/kbuild.h:6:69: note: in definition of macro 'DEFINE'
       6 |         asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
         |                                                                     ^~~
>> arch/riscv/kernel/asm-offsets.c:496:40: error: 'SBI_SSE_EVENT_COMPLETE' undeclared (first use in this function); did you mean 'SB_FREEZE_COMPLETE'?
     496 |         DEFINE(SBI_SSE_EVENT_COMPLETE, SBI_SSE_EVENT_COMPLETE);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:6:69: note: in definition of macro 'DEFINE'
       6 |         asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
         |                                                                     ^~~
   make[3]: *** [scripts/Makefile.build:116: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=3905066713
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=3905066713
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=3905066713
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=3905066713
   make: Target 'prepare' not remade because of errors.


vim +/SBI_EXT_SSE +495 arch/riscv/kernel/asm-offsets.c

7db91e57a0acde Palmer Dabbelt    2017-07-10   81  
7db91e57a0acde Palmer Dabbelt    2017-07-10   82  	DEFINE(PT_SIZE, sizeof(struct pt_regs));
a4c3733d32a72f Christoph Hellwig 2019-10-28   83  	OFFSET(PT_EPC, pt_regs, epc);
7db91e57a0acde Palmer Dabbelt    2017-07-10   84  	OFFSET(PT_RA, pt_regs, ra);
7db91e57a0acde Palmer Dabbelt    2017-07-10   85  	OFFSET(PT_FP, pt_regs, s0);
7db91e57a0acde Palmer Dabbelt    2017-07-10   86  	OFFSET(PT_S0, pt_regs, s0);
7db91e57a0acde Palmer Dabbelt    2017-07-10   87  	OFFSET(PT_S1, pt_regs, s1);
7db91e57a0acde Palmer Dabbelt    2017-07-10   88  	OFFSET(PT_S2, pt_regs, s2);
7db91e57a0acde Palmer Dabbelt    2017-07-10   89  	OFFSET(PT_S3, pt_regs, s3);
7db91e57a0acde Palmer Dabbelt    2017-07-10   90  	OFFSET(PT_S4, pt_regs, s4);
7db91e57a0acde Palmer Dabbelt    2017-07-10   91  	OFFSET(PT_S5, pt_regs, s5);
7db91e57a0acde Palmer Dabbelt    2017-07-10   92  	OFFSET(PT_S6, pt_regs, s6);
7db91e57a0acde Palmer Dabbelt    2017-07-10   93  	OFFSET(PT_S7, pt_regs, s7);
7db91e57a0acde Palmer Dabbelt    2017-07-10   94  	OFFSET(PT_S8, pt_regs, s8);
7db91e57a0acde Palmer Dabbelt    2017-07-10   95  	OFFSET(PT_S9, pt_regs, s9);
7db91e57a0acde Palmer Dabbelt    2017-07-10   96  	OFFSET(PT_S10, pt_regs, s10);
7db91e57a0acde Palmer Dabbelt    2017-07-10   97  	OFFSET(PT_S11, pt_regs, s11);
7db91e57a0acde Palmer Dabbelt    2017-07-10   98  	OFFSET(PT_SP, pt_regs, sp);
7db91e57a0acde Palmer Dabbelt    2017-07-10   99  	OFFSET(PT_TP, pt_regs, tp);
7db91e57a0acde Palmer Dabbelt    2017-07-10  100  	OFFSET(PT_A0, pt_regs, a0);
7db91e57a0acde Palmer Dabbelt    2017-07-10  101  	OFFSET(PT_A1, pt_regs, a1);
7db91e57a0acde Palmer Dabbelt    2017-07-10  102  	OFFSET(PT_A2, pt_regs, a2);
7db91e57a0acde Palmer Dabbelt    2017-07-10  103  	OFFSET(PT_A3, pt_regs, a3);
7db91e57a0acde Palmer Dabbelt    2017-07-10  104  	OFFSET(PT_A4, pt_regs, a4);
7db91e57a0acde Palmer Dabbelt    2017-07-10  105  	OFFSET(PT_A5, pt_regs, a5);
7db91e57a0acde Palmer Dabbelt    2017-07-10  106  	OFFSET(PT_A6, pt_regs, a6);
7db91e57a0acde Palmer Dabbelt    2017-07-10  107  	OFFSET(PT_A7, pt_regs, a7);
7db91e57a0acde Palmer Dabbelt    2017-07-10  108  	OFFSET(PT_T0, pt_regs, t0);
7db91e57a0acde Palmer Dabbelt    2017-07-10  109  	OFFSET(PT_T1, pt_regs, t1);
7db91e57a0acde Palmer Dabbelt    2017-07-10  110  	OFFSET(PT_T2, pt_regs, t2);
7db91e57a0acde Palmer Dabbelt    2017-07-10  111  	OFFSET(PT_T3, pt_regs, t3);
7db91e57a0acde Palmer Dabbelt    2017-07-10  112  	OFFSET(PT_T4, pt_regs, t4);
7db91e57a0acde Palmer Dabbelt    2017-07-10  113  	OFFSET(PT_T5, pt_regs, t5);
7db91e57a0acde Palmer Dabbelt    2017-07-10  114  	OFFSET(PT_T6, pt_regs, t6);
7db91e57a0acde Palmer Dabbelt    2017-07-10  115  	OFFSET(PT_GP, pt_regs, gp);
7db91e57a0acde Palmer Dabbelt    2017-07-10  116  	OFFSET(PT_ORIG_A0, pt_regs, orig_a0);
a4c3733d32a72f Christoph Hellwig 2019-10-28  117  	OFFSET(PT_STATUS, pt_regs, status);
a4c3733d32a72f Christoph Hellwig 2019-10-28  118  	OFFSET(PT_BADADDR, pt_regs, badaddr);
a4c3733d32a72f Christoph Hellwig 2019-10-28  119  	OFFSET(PT_CAUSE, pt_regs, cause);
7db91e57a0acde Palmer Dabbelt    2017-07-10  120  
63b13e64a829e7 Anup Patel        2022-02-10  121  	OFFSET(SUSPEND_CONTEXT_REGS, suspend_context, regs);
63b13e64a829e7 Anup Patel        2022-02-10  122  
c0317210012e3b Sia Jee Heng      2023-03-30  123  	OFFSET(HIBERN_PBE_ADDR, pbe, address);
c0317210012e3b Sia Jee Heng      2023-03-30  124  	OFFSET(HIBERN_PBE_ORIG, pbe, orig_address);
c0317210012e3b Sia Jee Heng      2023-03-30  125  	OFFSET(HIBERN_PBE_NEXT, pbe, next);
c0317210012e3b Sia Jee Heng      2023-03-30  126  
34bde9d8b9e6e5 Anup Patel        2021-09-27  127  	OFFSET(KVM_ARCH_GUEST_ZERO, kvm_vcpu_arch, guest_context.zero);
34bde9d8b9e6e5 Anup Patel        2021-09-27  128  	OFFSET(KVM_ARCH_GUEST_RA, kvm_vcpu_arch, guest_context.ra);
34bde9d8b9e6e5 Anup Patel        2021-09-27  129  	OFFSET(KVM_ARCH_GUEST_SP, kvm_vcpu_arch, guest_context.sp);
34bde9d8b9e6e5 Anup Patel        2021-09-27  130  	OFFSET(KVM_ARCH_GUEST_GP, kvm_vcpu_arch, guest_context.gp);
34bde9d8b9e6e5 Anup Patel        2021-09-27  131  	OFFSET(KVM_ARCH_GUEST_TP, kvm_vcpu_arch, guest_context.tp);
34bde9d8b9e6e5 Anup Patel        2021-09-27  132  	OFFSET(KVM_ARCH_GUEST_T0, kvm_vcpu_arch, guest_context.t0);
34bde9d8b9e6e5 Anup Patel        2021-09-27  133  	OFFSET(KVM_ARCH_GUEST_T1, kvm_vcpu_arch, guest_context.t1);
34bde9d8b9e6e5 Anup Patel        2021-09-27  134  	OFFSET(KVM_ARCH_GUEST_T2, kvm_vcpu_arch, guest_context.t2);
34bde9d8b9e6e5 Anup Patel        2021-09-27  135  	OFFSET(KVM_ARCH_GUEST_S0, kvm_vcpu_arch, guest_context.s0);
34bde9d8b9e6e5 Anup Patel        2021-09-27  136  	OFFSET(KVM_ARCH_GUEST_S1, kvm_vcpu_arch, guest_context.s1);
34bde9d8b9e6e5 Anup Patel        2021-09-27  137  	OFFSET(KVM_ARCH_GUEST_A0, kvm_vcpu_arch, guest_context.a0);
34bde9d8b9e6e5 Anup Patel        2021-09-27  138  	OFFSET(KVM_ARCH_GUEST_A1, kvm_vcpu_arch, guest_context.a1);
34bde9d8b9e6e5 Anup Patel        2021-09-27  139  	OFFSET(KVM_ARCH_GUEST_A2, kvm_vcpu_arch, guest_context.a2);
34bde9d8b9e6e5 Anup Patel        2021-09-27  140  	OFFSET(KVM_ARCH_GUEST_A3, kvm_vcpu_arch, guest_context.a3);
34bde9d8b9e6e5 Anup Patel        2021-09-27  141  	OFFSET(KVM_ARCH_GUEST_A4, kvm_vcpu_arch, guest_context.a4);
34bde9d8b9e6e5 Anup Patel        2021-09-27  142  	OFFSET(KVM_ARCH_GUEST_A5, kvm_vcpu_arch, guest_context.a5);
34bde9d8b9e6e5 Anup Patel        2021-09-27  143  	OFFSET(KVM_ARCH_GUEST_A6, kvm_vcpu_arch, guest_context.a6);
34bde9d8b9e6e5 Anup Patel        2021-09-27  144  	OFFSET(KVM_ARCH_GUEST_A7, kvm_vcpu_arch, guest_context.a7);
34bde9d8b9e6e5 Anup Patel        2021-09-27  145  	OFFSET(KVM_ARCH_GUEST_S2, kvm_vcpu_arch, guest_context.s2);
34bde9d8b9e6e5 Anup Patel        2021-09-27  146  	OFFSET(KVM_ARCH_GUEST_S3, kvm_vcpu_arch, guest_context.s3);
34bde9d8b9e6e5 Anup Patel        2021-09-27  147  	OFFSET(KVM_ARCH_GUEST_S4, kvm_vcpu_arch, guest_context.s4);
34bde9d8b9e6e5 Anup Patel        2021-09-27  148  	OFFSET(KVM_ARCH_GUEST_S5, kvm_vcpu_arch, guest_context.s5);
34bde9d8b9e6e5 Anup Patel        2021-09-27  149  	OFFSET(KVM_ARCH_GUEST_S6, kvm_vcpu_arch, guest_context.s6);
34bde9d8b9e6e5 Anup Patel        2021-09-27  150  	OFFSET(KVM_ARCH_GUEST_S7, kvm_vcpu_arch, guest_context.s7);
34bde9d8b9e6e5 Anup Patel        2021-09-27  151  	OFFSET(KVM_ARCH_GUEST_S8, kvm_vcpu_arch, guest_context.s8);
34bde9d8b9e6e5 Anup Patel        2021-09-27  152  	OFFSET(KVM_ARCH_GUEST_S9, kvm_vcpu_arch, guest_context.s9);
34bde9d8b9e6e5 Anup Patel        2021-09-27  153  	OFFSET(KVM_ARCH_GUEST_S10, kvm_vcpu_arch, guest_context.s10);
34bde9d8b9e6e5 Anup Patel        2021-09-27  154  	OFFSET(KVM_ARCH_GUEST_S11, kvm_vcpu_arch, guest_context.s11);
34bde9d8b9e6e5 Anup Patel        2021-09-27  155  	OFFSET(KVM_ARCH_GUEST_T3, kvm_vcpu_arch, guest_context.t3);
34bde9d8b9e6e5 Anup Patel        2021-09-27  156  	OFFSET(KVM_ARCH_GUEST_T4, kvm_vcpu_arch, guest_context.t4);
34bde9d8b9e6e5 Anup Patel        2021-09-27  157  	OFFSET(KVM_ARCH_GUEST_T5, kvm_vcpu_arch, guest_context.t5);
34bde9d8b9e6e5 Anup Patel        2021-09-27  158  	OFFSET(KVM_ARCH_GUEST_T6, kvm_vcpu_arch, guest_context.t6);
34bde9d8b9e6e5 Anup Patel        2021-09-27  159  	OFFSET(KVM_ARCH_GUEST_SEPC, kvm_vcpu_arch, guest_context.sepc);
34bde9d8b9e6e5 Anup Patel        2021-09-27  160  	OFFSET(KVM_ARCH_GUEST_SSTATUS, kvm_vcpu_arch, guest_context.sstatus);
34bde9d8b9e6e5 Anup Patel        2021-09-27  161  	OFFSET(KVM_ARCH_GUEST_HSTATUS, kvm_vcpu_arch, guest_context.hstatus);
34bde9d8b9e6e5 Anup Patel        2021-09-27  162  	OFFSET(KVM_ARCH_GUEST_SCOUNTEREN, kvm_vcpu_arch, guest_csr.scounteren);
34bde9d8b9e6e5 Anup Patel        2021-09-27  163  
34bde9d8b9e6e5 Anup Patel        2021-09-27  164  	OFFSET(KVM_ARCH_HOST_ZERO, kvm_vcpu_arch, host_context.zero);
34bde9d8b9e6e5 Anup Patel        2021-09-27  165  	OFFSET(KVM_ARCH_HOST_RA, kvm_vcpu_arch, host_context.ra);
34bde9d8b9e6e5 Anup Patel        2021-09-27  166  	OFFSET(KVM_ARCH_HOST_SP, kvm_vcpu_arch, host_context.sp);
34bde9d8b9e6e5 Anup Patel        2021-09-27  167  	OFFSET(KVM_ARCH_HOST_GP, kvm_vcpu_arch, host_context.gp);
34bde9d8b9e6e5 Anup Patel        2021-09-27  168  	OFFSET(KVM_ARCH_HOST_TP, kvm_vcpu_arch, host_context.tp);
34bde9d8b9e6e5 Anup Patel        2021-09-27  169  	OFFSET(KVM_ARCH_HOST_T0, kvm_vcpu_arch, host_context.t0);
34bde9d8b9e6e5 Anup Patel        2021-09-27  170  	OFFSET(KVM_ARCH_HOST_T1, kvm_vcpu_arch, host_context.t1);
34bde9d8b9e6e5 Anup Patel        2021-09-27  171  	OFFSET(KVM_ARCH_HOST_T2, kvm_vcpu_arch, host_context.t2);
34bde9d8b9e6e5 Anup Patel        2021-09-27  172  	OFFSET(KVM_ARCH_HOST_S0, kvm_vcpu_arch, host_context.s0);
34bde9d8b9e6e5 Anup Patel        2021-09-27  173  	OFFSET(KVM_ARCH_HOST_S1, kvm_vcpu_arch, host_context.s1);
34bde9d8b9e6e5 Anup Patel        2021-09-27  174  	OFFSET(KVM_ARCH_HOST_A0, kvm_vcpu_arch, host_context.a0);
34bde9d8b9e6e5 Anup Patel        2021-09-27  175  	OFFSET(KVM_ARCH_HOST_A1, kvm_vcpu_arch, host_context.a1);
34bde9d8b9e6e5 Anup Patel        2021-09-27  176  	OFFSET(KVM_ARCH_HOST_A2, kvm_vcpu_arch, host_context.a2);
34bde9d8b9e6e5 Anup Patel        2021-09-27  177  	OFFSET(KVM_ARCH_HOST_A3, kvm_vcpu_arch, host_context.a3);
34bde9d8b9e6e5 Anup Patel        2021-09-27  178  	OFFSET(KVM_ARCH_HOST_A4, kvm_vcpu_arch, host_context.a4);
34bde9d8b9e6e5 Anup Patel        2021-09-27  179  	OFFSET(KVM_ARCH_HOST_A5, kvm_vcpu_arch, host_context.a5);
34bde9d8b9e6e5 Anup Patel        2021-09-27  180  	OFFSET(KVM_ARCH_HOST_A6, kvm_vcpu_arch, host_context.a6);
34bde9d8b9e6e5 Anup Patel        2021-09-27  181  	OFFSET(KVM_ARCH_HOST_A7, kvm_vcpu_arch, host_context.a7);
34bde9d8b9e6e5 Anup Patel        2021-09-27  182  	OFFSET(KVM_ARCH_HOST_S2, kvm_vcpu_arch, host_context.s2);
34bde9d8b9e6e5 Anup Patel        2021-09-27  183  	OFFSET(KVM_ARCH_HOST_S3, kvm_vcpu_arch, host_context.s3);
34bde9d8b9e6e5 Anup Patel        2021-09-27  184  	OFFSET(KVM_ARCH_HOST_S4, kvm_vcpu_arch, host_context.s4);
34bde9d8b9e6e5 Anup Patel        2021-09-27  185  	OFFSET(KVM_ARCH_HOST_S5, kvm_vcpu_arch, host_context.s5);
34bde9d8b9e6e5 Anup Patel        2021-09-27  186  	OFFSET(KVM_ARCH_HOST_S6, kvm_vcpu_arch, host_context.s6);
34bde9d8b9e6e5 Anup Patel        2021-09-27  187  	OFFSET(KVM_ARCH_HOST_S7, kvm_vcpu_arch, host_context.s7);
34bde9d8b9e6e5 Anup Patel        2021-09-27  188  	OFFSET(KVM_ARCH_HOST_S8, kvm_vcpu_arch, host_context.s8);
34bde9d8b9e6e5 Anup Patel        2021-09-27  189  	OFFSET(KVM_ARCH_HOST_S9, kvm_vcpu_arch, host_context.s9);
34bde9d8b9e6e5 Anup Patel        2021-09-27  190  	OFFSET(KVM_ARCH_HOST_S10, kvm_vcpu_arch, host_context.s10);
34bde9d8b9e6e5 Anup Patel        2021-09-27  191  	OFFSET(KVM_ARCH_HOST_S11, kvm_vcpu_arch, host_context.s11);
34bde9d8b9e6e5 Anup Patel        2021-09-27  192  	OFFSET(KVM_ARCH_HOST_T3, kvm_vcpu_arch, host_context.t3);
34bde9d8b9e6e5 Anup Patel        2021-09-27  193  	OFFSET(KVM_ARCH_HOST_T4, kvm_vcpu_arch, host_context.t4);
34bde9d8b9e6e5 Anup Patel        2021-09-27  194  	OFFSET(KVM_ARCH_HOST_T5, kvm_vcpu_arch, host_context.t5);
34bde9d8b9e6e5 Anup Patel        2021-09-27  195  	OFFSET(KVM_ARCH_HOST_T6, kvm_vcpu_arch, host_context.t6);
34bde9d8b9e6e5 Anup Patel        2021-09-27  196  	OFFSET(KVM_ARCH_HOST_SEPC, kvm_vcpu_arch, host_context.sepc);
34bde9d8b9e6e5 Anup Patel        2021-09-27  197  	OFFSET(KVM_ARCH_HOST_SSTATUS, kvm_vcpu_arch, host_context.sstatus);
34bde9d8b9e6e5 Anup Patel        2021-09-27  198  	OFFSET(KVM_ARCH_HOST_HSTATUS, kvm_vcpu_arch, host_context.hstatus);
34bde9d8b9e6e5 Anup Patel        2021-09-27  199  	OFFSET(KVM_ARCH_HOST_SSCRATCH, kvm_vcpu_arch, host_sscratch);
34bde9d8b9e6e5 Anup Patel        2021-09-27  200  	OFFSET(KVM_ARCH_HOST_STVEC, kvm_vcpu_arch, host_stvec);
34bde9d8b9e6e5 Anup Patel        2021-09-27  201  	OFFSET(KVM_ARCH_HOST_SCOUNTEREN, kvm_vcpu_arch, host_scounteren);
34bde9d8b9e6e5 Anup Patel        2021-09-27  202  
9f7013265112a9 Anup Patel        2021-09-27  203  	OFFSET(KVM_ARCH_TRAP_SEPC, kvm_cpu_trap, sepc);
9f7013265112a9 Anup Patel        2021-09-27  204  	OFFSET(KVM_ARCH_TRAP_SCAUSE, kvm_cpu_trap, scause);
9f7013265112a9 Anup Patel        2021-09-27  205  	OFFSET(KVM_ARCH_TRAP_STVAL, kvm_cpu_trap, stval);
9f7013265112a9 Anup Patel        2021-09-27  206  	OFFSET(KVM_ARCH_TRAP_HTVAL, kvm_cpu_trap, htval);
9f7013265112a9 Anup Patel        2021-09-27  207  	OFFSET(KVM_ARCH_TRAP_HTINST, kvm_cpu_trap, htinst);
9f7013265112a9 Anup Patel        2021-09-27  208  
5de52d4a23ad33 Atish Patra       2021-09-27  209  	/* F extension */
5de52d4a23ad33 Atish Patra       2021-09-27  210  
5de52d4a23ad33 Atish Patra       2021-09-27  211  	OFFSET(KVM_ARCH_FP_F_F0, kvm_cpu_context, fp.f.f[0]);
5de52d4a23ad33 Atish Patra       2021-09-27  212  	OFFSET(KVM_ARCH_FP_F_F1, kvm_cpu_context, fp.f.f[1]);
5de52d4a23ad33 Atish Patra       2021-09-27  213  	OFFSET(KVM_ARCH_FP_F_F2, kvm_cpu_context, fp.f.f[2]);
5de52d4a23ad33 Atish Patra       2021-09-27  214  	OFFSET(KVM_ARCH_FP_F_F3, kvm_cpu_context, fp.f.f[3]);
5de52d4a23ad33 Atish Patra       2021-09-27  215  	OFFSET(KVM_ARCH_FP_F_F4, kvm_cpu_context, fp.f.f[4]);
5de52d4a23ad33 Atish Patra       2021-09-27  216  	OFFSET(KVM_ARCH_FP_F_F5, kvm_cpu_context, fp.f.f[5]);
5de52d4a23ad33 Atish Patra       2021-09-27  217  	OFFSET(KVM_ARCH_FP_F_F6, kvm_cpu_context, fp.f.f[6]);
5de52d4a23ad33 Atish Patra       2021-09-27  218  	OFFSET(KVM_ARCH_FP_F_F7, kvm_cpu_context, fp.f.f[7]);
5de52d4a23ad33 Atish Patra       2021-09-27  219  	OFFSET(KVM_ARCH_FP_F_F8, kvm_cpu_context, fp.f.f[8]);
5de52d4a23ad33 Atish Patra       2021-09-27  220  	OFFSET(KVM_ARCH_FP_F_F9, kvm_cpu_context, fp.f.f[9]);
5de52d4a23ad33 Atish Patra       2021-09-27  221  	OFFSET(KVM_ARCH_FP_F_F10, kvm_cpu_context, fp.f.f[10]);
5de52d4a23ad33 Atish Patra       2021-09-27  222  	OFFSET(KVM_ARCH_FP_F_F11, kvm_cpu_context, fp.f.f[11]);
5de52d4a23ad33 Atish Patra       2021-09-27  223  	OFFSET(KVM_ARCH_FP_F_F12, kvm_cpu_context, fp.f.f[12]);
5de52d4a23ad33 Atish Patra       2021-09-27  224  	OFFSET(KVM_ARCH_FP_F_F13, kvm_cpu_context, fp.f.f[13]);
5de52d4a23ad33 Atish Patra       2021-09-27  225  	OFFSET(KVM_ARCH_FP_F_F14, kvm_cpu_context, fp.f.f[14]);
5de52d4a23ad33 Atish Patra       2021-09-27  226  	OFFSET(KVM_ARCH_FP_F_F15, kvm_cpu_context, fp.f.f[15]);
5de52d4a23ad33 Atish Patra       2021-09-27  227  	OFFSET(KVM_ARCH_FP_F_F16, kvm_cpu_context, fp.f.f[16]);
5de52d4a23ad33 Atish Patra       2021-09-27  228  	OFFSET(KVM_ARCH_FP_F_F17, kvm_cpu_context, fp.f.f[17]);
5de52d4a23ad33 Atish Patra       2021-09-27  229  	OFFSET(KVM_ARCH_FP_F_F18, kvm_cpu_context, fp.f.f[18]);
5de52d4a23ad33 Atish Patra       2021-09-27  230  	OFFSET(KVM_ARCH_FP_F_F19, kvm_cpu_context, fp.f.f[19]);
5de52d4a23ad33 Atish Patra       2021-09-27  231  	OFFSET(KVM_ARCH_FP_F_F20, kvm_cpu_context, fp.f.f[20]);
5de52d4a23ad33 Atish Patra       2021-09-27  232  	OFFSET(KVM_ARCH_FP_F_F21, kvm_cpu_context, fp.f.f[21]);
5de52d4a23ad33 Atish Patra       2021-09-27  233  	OFFSET(KVM_ARCH_FP_F_F22, kvm_cpu_context, fp.f.f[22]);
5de52d4a23ad33 Atish Patra       2021-09-27  234  	OFFSET(KVM_ARCH_FP_F_F23, kvm_cpu_context, fp.f.f[23]);
5de52d4a23ad33 Atish Patra       2021-09-27  235  	OFFSET(KVM_ARCH_FP_F_F24, kvm_cpu_context, fp.f.f[24]);
5de52d4a23ad33 Atish Patra       2021-09-27  236  	OFFSET(KVM_ARCH_FP_F_F25, kvm_cpu_context, fp.f.f[25]);
5de52d4a23ad33 Atish Patra       2021-09-27  237  	OFFSET(KVM_ARCH_FP_F_F26, kvm_cpu_context, fp.f.f[26]);
5de52d4a23ad33 Atish Patra       2021-09-27  238  	OFFSET(KVM_ARCH_FP_F_F27, kvm_cpu_context, fp.f.f[27]);
5de52d4a23ad33 Atish Patra       2021-09-27  239  	OFFSET(KVM_ARCH_FP_F_F28, kvm_cpu_context, fp.f.f[28]);
5de52d4a23ad33 Atish Patra       2021-09-27  240  	OFFSET(KVM_ARCH_FP_F_F29, kvm_cpu_context, fp.f.f[29]);
5de52d4a23ad33 Atish Patra       2021-09-27  241  	OFFSET(KVM_ARCH_FP_F_F30, kvm_cpu_context, fp.f.f[30]);
5de52d4a23ad33 Atish Patra       2021-09-27  242  	OFFSET(KVM_ARCH_FP_F_F31, kvm_cpu_context, fp.f.f[31]);
5de52d4a23ad33 Atish Patra       2021-09-27  243  	OFFSET(KVM_ARCH_FP_F_FCSR, kvm_cpu_context, fp.f.fcsr);
5de52d4a23ad33 Atish Patra       2021-09-27  244  
5de52d4a23ad33 Atish Patra       2021-09-27  245  	/* D extension */
5de52d4a23ad33 Atish Patra       2021-09-27  246  
5de52d4a23ad33 Atish Patra       2021-09-27  247  	OFFSET(KVM_ARCH_FP_D_F0, kvm_cpu_context, fp.d.f[0]);
5de52d4a23ad33 Atish Patra       2021-09-27  248  	OFFSET(KVM_ARCH_FP_D_F1, kvm_cpu_context, fp.d.f[1]);
5de52d4a23ad33 Atish Patra       2021-09-27  249  	OFFSET(KVM_ARCH_FP_D_F2, kvm_cpu_context, fp.d.f[2]);
5de52d4a23ad33 Atish Patra       2021-09-27  250  	OFFSET(KVM_ARCH_FP_D_F3, kvm_cpu_context, fp.d.f[3]);
5de52d4a23ad33 Atish Patra       2021-09-27  251  	OFFSET(KVM_ARCH_FP_D_F4, kvm_cpu_context, fp.d.f[4]);
5de52d4a23ad33 Atish Patra       2021-09-27  252  	OFFSET(KVM_ARCH_FP_D_F5, kvm_cpu_context, fp.d.f[5]);
5de52d4a23ad33 Atish Patra       2021-09-27  253  	OFFSET(KVM_ARCH_FP_D_F6, kvm_cpu_context, fp.d.f[6]);
5de52d4a23ad33 Atish Patra       2021-09-27  254  	OFFSET(KVM_ARCH_FP_D_F7, kvm_cpu_context, fp.d.f[7]);
5de52d4a23ad33 Atish Patra       2021-09-27  255  	OFFSET(KVM_ARCH_FP_D_F8, kvm_cpu_context, fp.d.f[8]);
5de52d4a23ad33 Atish Patra       2021-09-27  256  	OFFSET(KVM_ARCH_FP_D_F9, kvm_cpu_context, fp.d.f[9]);
5de52d4a23ad33 Atish Patra       2021-09-27  257  	OFFSET(KVM_ARCH_FP_D_F10, kvm_cpu_context, fp.d.f[10]);
5de52d4a23ad33 Atish Patra       2021-09-27  258  	OFFSET(KVM_ARCH_FP_D_F11, kvm_cpu_context, fp.d.f[11]);
5de52d4a23ad33 Atish Patra       2021-09-27  259  	OFFSET(KVM_ARCH_FP_D_F12, kvm_cpu_context, fp.d.f[12]);
5de52d4a23ad33 Atish Patra       2021-09-27  260  	OFFSET(KVM_ARCH_FP_D_F13, kvm_cpu_context, fp.d.f[13]);
5de52d4a23ad33 Atish Patra       2021-09-27  261  	OFFSET(KVM_ARCH_FP_D_F14, kvm_cpu_context, fp.d.f[14]);
5de52d4a23ad33 Atish Patra       2021-09-27  262  	OFFSET(KVM_ARCH_FP_D_F15, kvm_cpu_context, fp.d.f[15]);
5de52d4a23ad33 Atish Patra       2021-09-27  263  	OFFSET(KVM_ARCH_FP_D_F16, kvm_cpu_context, fp.d.f[16]);
5de52d4a23ad33 Atish Patra       2021-09-27  264  	OFFSET(KVM_ARCH_FP_D_F17, kvm_cpu_context, fp.d.f[17]);
5de52d4a23ad33 Atish Patra       2021-09-27  265  	OFFSET(KVM_ARCH_FP_D_F18, kvm_cpu_context, fp.d.f[18]);
5de52d4a23ad33 Atish Patra       2021-09-27  266  	OFFSET(KVM_ARCH_FP_D_F19, kvm_cpu_context, fp.d.f[19]);
5de52d4a23ad33 Atish Patra       2021-09-27  267  	OFFSET(KVM_ARCH_FP_D_F20, kvm_cpu_context, fp.d.f[20]);
5de52d4a23ad33 Atish Patra       2021-09-27  268  	OFFSET(KVM_ARCH_FP_D_F21, kvm_cpu_context, fp.d.f[21]);
5de52d4a23ad33 Atish Patra       2021-09-27  269  	OFFSET(KVM_ARCH_FP_D_F22, kvm_cpu_context, fp.d.f[22]);
5de52d4a23ad33 Atish Patra       2021-09-27  270  	OFFSET(KVM_ARCH_FP_D_F23, kvm_cpu_context, fp.d.f[23]);
5de52d4a23ad33 Atish Patra       2021-09-27  271  	OFFSET(KVM_ARCH_FP_D_F24, kvm_cpu_context, fp.d.f[24]);
5de52d4a23ad33 Atish Patra       2021-09-27  272  	OFFSET(KVM_ARCH_FP_D_F25, kvm_cpu_context, fp.d.f[25]);
5de52d4a23ad33 Atish Patra       2021-09-27  273  	OFFSET(KVM_ARCH_FP_D_F26, kvm_cpu_context, fp.d.f[26]);
5de52d4a23ad33 Atish Patra       2021-09-27  274  	OFFSET(KVM_ARCH_FP_D_F27, kvm_cpu_context, fp.d.f[27]);
5de52d4a23ad33 Atish Patra       2021-09-27  275  	OFFSET(KVM_ARCH_FP_D_F28, kvm_cpu_context, fp.d.f[28]);
5de52d4a23ad33 Atish Patra       2021-09-27  276  	OFFSET(KVM_ARCH_FP_D_F29, kvm_cpu_context, fp.d.f[29]);
5de52d4a23ad33 Atish Patra       2021-09-27  277  	OFFSET(KVM_ARCH_FP_D_F30, kvm_cpu_context, fp.d.f[30]);
5de52d4a23ad33 Atish Patra       2021-09-27  278  	OFFSET(KVM_ARCH_FP_D_F31, kvm_cpu_context, fp.d.f[31]);
5de52d4a23ad33 Atish Patra       2021-09-27  279  	OFFSET(KVM_ARCH_FP_D_FCSR, kvm_cpu_context, fp.d.fcsr);
5de52d4a23ad33 Atish Patra       2021-09-27  280  
7db91e57a0acde Palmer Dabbelt    2017-07-10  281  	/*
7db91e57a0acde Palmer Dabbelt    2017-07-10  282  	 * THREAD_{F,X}* might be larger than a S-type offset can handle, but
7db91e57a0acde Palmer Dabbelt    2017-07-10  283  	 * these are used in performance-sensitive assembly so we can't resort
7db91e57a0acde Palmer Dabbelt    2017-07-10  284  	 * to loading the long immediate every time.
7db91e57a0acde Palmer Dabbelt    2017-07-10  285  	 */
7db91e57a0acde Palmer Dabbelt    2017-07-10  286  	DEFINE(TASK_THREAD_RA_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  287  		  offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  288  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  289  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  290  	DEFINE(TASK_THREAD_SP_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  291  		  offsetof(struct task_struct, thread.sp)
7db91e57a0acde Palmer Dabbelt    2017-07-10  292  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  293  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  294  	DEFINE(TASK_THREAD_S0_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  295  		  offsetof(struct task_struct, thread.s[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  296  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  297  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  298  	DEFINE(TASK_THREAD_S1_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  299  		  offsetof(struct task_struct, thread.s[1])
7db91e57a0acde Palmer Dabbelt    2017-07-10  300  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  301  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  302  	DEFINE(TASK_THREAD_S2_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  303  		  offsetof(struct task_struct, thread.s[2])
7db91e57a0acde Palmer Dabbelt    2017-07-10  304  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  305  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  306  	DEFINE(TASK_THREAD_S3_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  307  		  offsetof(struct task_struct, thread.s[3])
7db91e57a0acde Palmer Dabbelt    2017-07-10  308  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  309  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  310  	DEFINE(TASK_THREAD_S4_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  311  		  offsetof(struct task_struct, thread.s[4])
7db91e57a0acde Palmer Dabbelt    2017-07-10  312  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  313  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  314  	DEFINE(TASK_THREAD_S5_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  315  		  offsetof(struct task_struct, thread.s[5])
7db91e57a0acde Palmer Dabbelt    2017-07-10  316  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  317  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  318  	DEFINE(TASK_THREAD_S6_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  319  		  offsetof(struct task_struct, thread.s[6])
7db91e57a0acde Palmer Dabbelt    2017-07-10  320  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  321  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  322  	DEFINE(TASK_THREAD_S7_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  323  		  offsetof(struct task_struct, thread.s[7])
7db91e57a0acde Palmer Dabbelt    2017-07-10  324  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  325  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  326  	DEFINE(TASK_THREAD_S8_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  327  		  offsetof(struct task_struct, thread.s[8])
7db91e57a0acde Palmer Dabbelt    2017-07-10  328  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  329  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  330  	DEFINE(TASK_THREAD_S9_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  331  		  offsetof(struct task_struct, thread.s[9])
7db91e57a0acde Palmer Dabbelt    2017-07-10  332  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  333  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  334  	DEFINE(TASK_THREAD_S10_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  335  		  offsetof(struct task_struct, thread.s[10])
7db91e57a0acde Palmer Dabbelt    2017-07-10  336  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  337  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  338  	DEFINE(TASK_THREAD_S11_RA,
7db91e57a0acde Palmer Dabbelt    2017-07-10  339  		  offsetof(struct task_struct, thread.s[11])
7db91e57a0acde Palmer Dabbelt    2017-07-10  340  		- offsetof(struct task_struct, thread.ra)
7db91e57a0acde Palmer Dabbelt    2017-07-10  341  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  342  
7db91e57a0acde Palmer Dabbelt    2017-07-10  343  	DEFINE(TASK_THREAD_F0_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  344  		  offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  345  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  346  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  347  	DEFINE(TASK_THREAD_F1_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  348  		  offsetof(struct task_struct, thread.fstate.f[1])
7db91e57a0acde Palmer Dabbelt    2017-07-10  349  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  350  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  351  	DEFINE(TASK_THREAD_F2_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  352  		  offsetof(struct task_struct, thread.fstate.f[2])
7db91e57a0acde Palmer Dabbelt    2017-07-10  353  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  354  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  355  	DEFINE(TASK_THREAD_F3_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  356  		  offsetof(struct task_struct, thread.fstate.f[3])
7db91e57a0acde Palmer Dabbelt    2017-07-10  357  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  358  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  359  	DEFINE(TASK_THREAD_F4_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  360  		  offsetof(struct task_struct, thread.fstate.f[4])
7db91e57a0acde Palmer Dabbelt    2017-07-10  361  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  362  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  363  	DEFINE(TASK_THREAD_F5_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  364  		  offsetof(struct task_struct, thread.fstate.f[5])
7db91e57a0acde Palmer Dabbelt    2017-07-10  365  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  366  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  367  	DEFINE(TASK_THREAD_F6_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  368  		  offsetof(struct task_struct, thread.fstate.f[6])
7db91e57a0acde Palmer Dabbelt    2017-07-10  369  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  370  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  371  	DEFINE(TASK_THREAD_F7_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  372  		  offsetof(struct task_struct, thread.fstate.f[7])
7db91e57a0acde Palmer Dabbelt    2017-07-10  373  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  374  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  375  	DEFINE(TASK_THREAD_F8_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  376  		  offsetof(struct task_struct, thread.fstate.f[8])
7db91e57a0acde Palmer Dabbelt    2017-07-10  377  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  378  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  379  	DEFINE(TASK_THREAD_F9_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  380  		  offsetof(struct task_struct, thread.fstate.f[9])
7db91e57a0acde Palmer Dabbelt    2017-07-10  381  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  382  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  383  	DEFINE(TASK_THREAD_F10_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  384  		  offsetof(struct task_struct, thread.fstate.f[10])
7db91e57a0acde Palmer Dabbelt    2017-07-10  385  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  386  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  387  	DEFINE(TASK_THREAD_F11_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  388  		  offsetof(struct task_struct, thread.fstate.f[11])
7db91e57a0acde Palmer Dabbelt    2017-07-10  389  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  390  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  391  	DEFINE(TASK_THREAD_F12_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  392  		  offsetof(struct task_struct, thread.fstate.f[12])
7db91e57a0acde Palmer Dabbelt    2017-07-10  393  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  394  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  395  	DEFINE(TASK_THREAD_F13_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  396  		  offsetof(struct task_struct, thread.fstate.f[13])
7db91e57a0acde Palmer Dabbelt    2017-07-10  397  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  398  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  399  	DEFINE(TASK_THREAD_F14_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  400  		  offsetof(struct task_struct, thread.fstate.f[14])
7db91e57a0acde Palmer Dabbelt    2017-07-10  401  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  402  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  403  	DEFINE(TASK_THREAD_F15_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  404  		  offsetof(struct task_struct, thread.fstate.f[15])
7db91e57a0acde Palmer Dabbelt    2017-07-10  405  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  406  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  407  	DEFINE(TASK_THREAD_F16_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  408  		  offsetof(struct task_struct, thread.fstate.f[16])
7db91e57a0acde Palmer Dabbelt    2017-07-10  409  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  410  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  411  	DEFINE(TASK_THREAD_F17_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  412  		  offsetof(struct task_struct, thread.fstate.f[17])
7db91e57a0acde Palmer Dabbelt    2017-07-10  413  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  414  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  415  	DEFINE(TASK_THREAD_F18_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  416  		  offsetof(struct task_struct, thread.fstate.f[18])
7db91e57a0acde Palmer Dabbelt    2017-07-10  417  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  418  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  419  	DEFINE(TASK_THREAD_F19_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  420  		  offsetof(struct task_struct, thread.fstate.f[19])
7db91e57a0acde Palmer Dabbelt    2017-07-10  421  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  422  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  423  	DEFINE(TASK_THREAD_F20_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  424  		  offsetof(struct task_struct, thread.fstate.f[20])
7db91e57a0acde Palmer Dabbelt    2017-07-10  425  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  426  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  427  	DEFINE(TASK_THREAD_F21_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  428  		  offsetof(struct task_struct, thread.fstate.f[21])
7db91e57a0acde Palmer Dabbelt    2017-07-10  429  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  430  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  431  	DEFINE(TASK_THREAD_F22_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  432  		  offsetof(struct task_struct, thread.fstate.f[22])
7db91e57a0acde Palmer Dabbelt    2017-07-10  433  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  434  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  435  	DEFINE(TASK_THREAD_F23_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  436  		  offsetof(struct task_struct, thread.fstate.f[23])
7db91e57a0acde Palmer Dabbelt    2017-07-10  437  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  438  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  439  	DEFINE(TASK_THREAD_F24_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  440  		  offsetof(struct task_struct, thread.fstate.f[24])
7db91e57a0acde Palmer Dabbelt    2017-07-10  441  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  442  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  443  	DEFINE(TASK_THREAD_F25_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  444  		  offsetof(struct task_struct, thread.fstate.f[25])
7db91e57a0acde Palmer Dabbelt    2017-07-10  445  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  446  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  447  	DEFINE(TASK_THREAD_F26_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  448  		  offsetof(struct task_struct, thread.fstate.f[26])
7db91e57a0acde Palmer Dabbelt    2017-07-10  449  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  450  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  451  	DEFINE(TASK_THREAD_F27_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  452  		  offsetof(struct task_struct, thread.fstate.f[27])
7db91e57a0acde Palmer Dabbelt    2017-07-10  453  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  454  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  455  	DEFINE(TASK_THREAD_F28_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  456  		  offsetof(struct task_struct, thread.fstate.f[28])
7db91e57a0acde Palmer Dabbelt    2017-07-10  457  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  458  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  459  	DEFINE(TASK_THREAD_F29_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  460  		  offsetof(struct task_struct, thread.fstate.f[29])
7db91e57a0acde Palmer Dabbelt    2017-07-10  461  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  462  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  463  	DEFINE(TASK_THREAD_F30_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  464  		  offsetof(struct task_struct, thread.fstate.f[30])
7db91e57a0acde Palmer Dabbelt    2017-07-10  465  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  466  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  467  	DEFINE(TASK_THREAD_F31_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  468  		  offsetof(struct task_struct, thread.fstate.f[31])
7db91e57a0acde Palmer Dabbelt    2017-07-10  469  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  470  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  471  	DEFINE(TASK_THREAD_FCSR_F0,
7db91e57a0acde Palmer Dabbelt    2017-07-10  472  		  offsetof(struct task_struct, thread.fstate.fcsr)
7db91e57a0acde Palmer Dabbelt    2017-07-10  473  		- offsetof(struct task_struct, thread.fstate.f[0])
7db91e57a0acde Palmer Dabbelt    2017-07-10  474  	);
7db91e57a0acde Palmer Dabbelt    2017-07-10  475  
7db91e57a0acde Palmer Dabbelt    2017-07-10  476  	/*
7db91e57a0acde Palmer Dabbelt    2017-07-10  477  	 * We allocate a pt_regs on the stack when entering the kernel.  This
7db91e57a0acde Palmer Dabbelt    2017-07-10  478  	 * ensures the alignment is sane.
7db91e57a0acde Palmer Dabbelt    2017-07-10  479  	 */
7db91e57a0acde Palmer Dabbelt    2017-07-10  480  	DEFINE(PT_SIZE_ON_STACK, ALIGN(sizeof(struct pt_regs), STACK_ALIGN));
658e2c5125bbbc Alexandre Ghiti   2021-06-17  481  
658e2c5125bbbc Alexandre Ghiti   2021-06-17  482  	OFFSET(KERNEL_MAP_VIRT_ADDR, kernel_mapping, virt_addr);
9a2451f1866344 Atish Patra       2022-01-20  483  	OFFSET(SBI_HART_BOOT_TASK_PTR_OFFSET, sbi_hart_boot_data, task_ptr);
9a2451f1866344 Atish Patra       2022-01-20  484  	OFFSET(SBI_HART_BOOT_STACK_PTR_OFFSET, sbi_hart_boot_data, stack_ptr);
a77c752ef9c2a1 Clément Léger     2023-10-26  485  
a77c752ef9c2a1 Clément Léger     2023-10-26  486  	OFFSET(SSE_INTERRUPTED_EXEC_MODE, sse_interrupted_state, exec_mode);
a77c752ef9c2a1 Clément Léger     2023-10-26  487  	OFFSET(SSE_INTERRUPTED_S0, sse_interrupted_state, s0);
a77c752ef9c2a1 Clément Léger     2023-10-26  488  	OFFSET(SSE_INTERRUPTED_TP, sse_interrupted_state, tp);
a77c752ef9c2a1 Clément Léger     2023-10-26  489  	OFFSET(SSE_INTERRUPTED_PC, sse_interrupted_state, pc);
a77c752ef9c2a1 Clément Léger     2023-10-26  490  
a77c752ef9c2a1 Clément Léger     2023-10-26  491  	DEFINE(STACKFRAME_SIZE_ON_STACK, ALIGN(sizeof(struct stackframe),
a77c752ef9c2a1 Clément Léger     2023-10-26  492  					       STACK_ALIGN));
a77c752ef9c2a1 Clément Léger     2023-10-26  493  	OFFSET(STACKFRAME_FP, stackframe, fp);
a77c752ef9c2a1 Clément Léger     2023-10-26  494  	OFFSET(STACKFRAME_RA, stackframe, ra);
a77c752ef9c2a1 Clément Léger     2023-10-26 @495  	DEFINE(SBI_EXT_SSE, SBI_EXT_SSE);
a77c752ef9c2a1 Clément Léger     2023-10-26 @496  	DEFINE(SBI_SSE_EVENT_COMPLETE, SBI_SSE_EVENT_COMPLETE);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

