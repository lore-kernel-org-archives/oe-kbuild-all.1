Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9FA567D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 01:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLm81ZHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699925744; x=1731461744;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JXYlBpDzIgr6YyT66ngZxH9tQi5klDu6M0ImhJYhDZ8=;
  b=GLm81ZHseRffEALEsa6FKJpLnYMWeegOtjezHAeDp+6hkEpzcwIzPk5d
   TjizDQz6x5UHda9v4PG0dNr/i4lr1mPMNsjVWndhJqZTu2hwI4u04IPMu
   QaMpGLiIabflgCwodsBhDkTCNSBOIrpf6cyMH/TFwb1hzZJdZrB990/MQ
   HF6Tr120jpRHnGI6vdy1V4CBJAzfPmmZd3RzwIZzpMwLI65BXwvkYSird
   HRaenwSUqAviJdhcWtP8f0FMF4hz8W9tCWv/E3RqF6X1fH0dfLStgCh1p
   /7X3LF+fTLS/SvCtLGdh+htF3i7DgZV+lxX7qSqCAriXBT+etfrlddCZy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375578026"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="375578026"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 17:35:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="834866757"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="834866757"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 17:35:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 17:35:06 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 17:35:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 17:35:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hmoi2TTZDl/W0WCiM2MKWlQ60ELXp2/j254vEiGYvpn1718e/u/TKlsX7FPY2YRpYYDa3Vzxs2/ZdeiQYQN3T+1vVc1E8k2LEJLhu8Yw/Xu2aylIr3okjdNoS0Ss7JXaSS4j/a+ZlGvdHU5LU/QgP/zmTKf3/ZWFuGORW2Jdq+6L1vvQ3T6A5h76BHlOxkhME81OWInWiXHW0ar9lSD89pZeUnoxtUEaYKj7nvxai4eCytvCfwgeW3Gm2eTtUfWM0jtK9/UwttRxnWaRHkS5bvlHNsGIDo0AHms+Lhc5rjTO19ggyl6wU4EvpHmv+p3346/AYtQMqkbbFmgdZPUrmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSC3+wrtlv4pl76cnqlEef8Q2yOVPcHb3Lkfimy0KK4=;
 b=Or2+L8ehwWHc7TrlbQkuc8tgowDQFwDJErO/nQC4VUP0+8GBjn0ess/bHxE1FuyaGoKlhyoLayJLryAOn9+8UQAyJA6mBhwXcGo6Ifgm43k7ZMXZ3Ny98aDZG4XmQ+2Xtb8dbnbRNv/O2s7mMHRJHCnW836WRw+jqfzBEkLnV0jWMRjNKiLAX1gWaOBUBndj1HRNiRcURHxjN2GGOxrbX/ShCtePix/di1YHP5sUtvmnwqw1XjRLL5qUpEIoOti6PjSvFpFkFQxUmD8vLhtCbIoGGqdTImsVVHAeZJp0f2IoyLvKnEf+rhiKJ6H0i5XZCkGfUCsPfG7HMnXHBa59CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 01:35:04 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 14 Nov 2023
 01:35:04 +0000
Date: Tue, 14 Nov 2023 09:30:24 +0800
From: kernel test robot <yujie.liu@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH v2 18/19] heki: x86: Protect guest kernel memory
 using the KVM hypervisor
Message-ID: <202311131528.mJpddiq3-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231113022326.24388-19-mic@digikod.net>
X-ClientProxiedBy: SGAP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::20)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SN7PR11MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b25cdc-e2a0-4238-e2e9-08dbe4b1ed12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z0b8L2NJdVdUbY+er+BaSNtBvJ5NUOnEFrOiUoqxvk4Z+On/uYyxAvZPkpGGSSjhEgP3clySR0EDyhXM4bZjSWwYiFxD51cFjXaLMlYJymN5LoQqeJAnvQKwQpfiSxyhyOCzMNFhqInvVNzYSVUJu05JeuMGrl0t4PpN0RGCyIcFnXlwjdniJCeFz+7w+mvEn18jRpLU5Xb4TTgK7/Y8IowyW75dikHa7TdPY780yg3tJRBgNqGyOBbuisbBTqVXiMs3AfK5cm2JBViIOhT+tOawAluPIh59l+WWcQwnU1t9r+KAYkXjN08BnSVm4l25XdGxxn0c+KlTa3UMnuZVMzmOlBWzQg09HM+2kdlKIzHy9N27PeeSjdDmKgjM8WzmoPsySnyvJXcAhq+ymUWZvoXEl/2J0ruAnMIkYOFVNOz0JiKuaTl6nqaM9St9vRtW7ir5bfUCH20qjGkVgQTjjzjkgzgB/ZhvMejF6rUiSlw+MDnF8k6Rg9uAlM4CN7XSL/lOwFyoEnEy7VxJDBTOjDt29bZE8JcjNenBzRrFqwd2ewyLKP7uBK1sbdguySVMKTKu57+rV+Qtv2QI8dYGUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(4326008)(8936002)(8676002)(1076003)(26005)(2906002)(4001150100001)(5660300002)(86362001)(2616005)(82960400001)(6506007)(66574015)(6486002)(966005)(6666004)(36756003)(478600001)(41300700001)(38100700002)(83380400001)(316002)(6916009)(66946007)(66476007)(66556008)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0vNgZEY1tR+gK/XhNYOdV+A4ub9cOr2go9P6lP8rOpOzBC1Pyn5JzUAU8n?=
 =?iso-8859-1?Q?jINvpXuvsa5mYCb4leltYZ8IpKqswpHkZgFRPqmtZdOtP0fY23oWB8ABWq?=
 =?iso-8859-1?Q?YcJw0QG+ySNHhwPmFrW5vUwqLtP2SVdssIs9+t8EwKw3MP7iD931QSQPBU?=
 =?iso-8859-1?Q?JmGYYyeXxcCu64F+ndpuLpp9HQLxKgvuT3TYaAaSyGBTVceeqNfygziYGN?=
 =?iso-8859-1?Q?Orid/zJPvWWDDN4slEtAzpe4y6l2mLc3S7z11HYsq41MCqeiyg0d3kyz3W?=
 =?iso-8859-1?Q?BIWiy6CgXg7NE2M1YB09RHakOgw0gPki8wAp3DOuGwOpBpJG/Ujv83FcX5?=
 =?iso-8859-1?Q?4GuI4mokZIXi4lKFHBM8ytfZpR7EJbRY9l4N9idKKLcxM+P371BYck0KfG?=
 =?iso-8859-1?Q?LvsoYBqWSoqh9vvhMePlamlH1hEC6dbjslRxGekENhGtLNPj6quScrz9Mu?=
 =?iso-8859-1?Q?FXdDXdqzHvAgjd/M17xXFg8aKFZAgKDciV6mIjKVgfCiFMafj9qPBqNyEe?=
 =?iso-8859-1?Q?4buuE5u5IABDsRNxANuoaoDbmlY/XLPiOCcsN3yiK0lGd0Y4+vJnELNPxH?=
 =?iso-8859-1?Q?yA9Iltf5frdASBsLCKjGnFBMWtLwuTv0vSeOkx1gmNyRGpi//t+dxa6aVA?=
 =?iso-8859-1?Q?F6EKUOWYkU2uOCMIl8kT3C82CdvITm6Fc5jltjx8yCVO/i40lHDw3D5Kzy?=
 =?iso-8859-1?Q?gVgQkWTxmPZNw7JK7t1nX3tIlmvGH68fs5y7MrCVAwyT12rm6bnd9sULEq?=
 =?iso-8859-1?Q?BNe8Php8E9LO5LEzgeEAVaWP8teo6a9Ech73zMEDe1cpZ4xn3XOVChx6zj?=
 =?iso-8859-1?Q?2a0cXUcbm1RgRcuYGYOpu+1WCnKmTkcNjEDHRD+Pa04P41NQmr9t4ld/39?=
 =?iso-8859-1?Q?3332fdV+YT4Sm0bS4BTd66v7SuymoLdxdUX8BhxvQmHnmbRTLd7Or8RQAZ?=
 =?iso-8859-1?Q?Th8ovelZO69mtYeJCC9ZpO2B7gFQWUU8vmXm02PysBK+ujsKVxRu+gakZX?=
 =?iso-8859-1?Q?B4gXUejNV7Klsli9n/l7M4ckehOm6gs2jWSPNWtkkOtCdZNkL/QUTyvdT3?=
 =?iso-8859-1?Q?DliuVSXUIGfzbEH/F+s/ZfEk9Exj4f71MxnhDJEBdfg4ebkahkd/zAR0eM?=
 =?iso-8859-1?Q?WzG0v+iOCtsEViOt87JMU9IA/tRcdbH+5Ph2/rWD8JDjV7zcOfS70ya86E?=
 =?iso-8859-1?Q?D0f6R1VGYelNG0XRcp4lXPwc4Cx8DgBX/vpGECA21Ot0JIvfZ99UMRjR6R?=
 =?iso-8859-1?Q?f5+xEMkRz5Ro9uW3eENzb/7QjZLvIVPN4PIOG4tUFM/yIDR3IhMwavxhqS?=
 =?iso-8859-1?Q?z1mDynhPhL8ae1EcGLpdkTF5Fi1nmfrSMQ7mHgwHkVvqrCqtvagqCLqUsb?=
 =?iso-8859-1?Q?7I3Ipc0+bdf2nZ3k3gFGGmX+zFMkE9i6JQdiRJnh5S4wMz+5KLwPtSvA+/?=
 =?iso-8859-1?Q?N3ZRECsw9lTkQNnVfN83zBJmNxVhJNwri+qxYrrwDxefmjOZGnI0ktkM9/?=
 =?iso-8859-1?Q?il6TudCsvMucjIL/mng74D4tRMI9Bj1OwEg9B45wSfqHOyRMCtLzMd/B3W?=
 =?iso-8859-1?Q?EQoPbzzDo2XrhpLOk2vNUcbrHKMSQw5heSdvhyYVJENw5A7v2YohHcqckR?=
 =?iso-8859-1?Q?Ppldibs4mGNpk6J85IZctFE4FC39/Y4GYX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b25cdc-e2a0-4238-e2e9-08dbe4b1ed12
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 01:35:04.3978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2OtJYMdxI0Het1WzRcxjXL5nfNbQZzy7u0a8P9OuwkP09Aj7xy0Qj1exjErKZs50KgP9k4ZubgB27R5QiFuNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6750
X-OriginatorOrg: intel.com

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 881375a408c0f4ea451ff14545b59216d2923881]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/virt-Introduce-Hypervisor-Enforced-Kernel-Integrity-Heki/20231113-102847
base:   881375a408c0f4ea451ff14545b59216d2923881
patch link:    https://lore.kernel.org/r/20231113022326.24388-19-mic%40digikod.net
patch subject: [RFC PATCH v2 18/19] heki: x86: Protect guest kernel memory using the KVM hypervisor
config: riscv-randconfig-001-20231113 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131528.mJpddiq3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311131528.mJpddiq3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/Kconfig:833:error: recursive dependency detected!
   arch/riscv/Kconfig:833:	symbol XIP_KERNEL depends on SPARSEMEM
   mm/Kconfig:461:	symbol SPARSEMEM is selected by HEKI
   virt/heki/Kconfig:5:	symbol HEKI depends on JUMP_LABEL
   arch/Kconfig:66:	symbol JUMP_LABEL depends on HAVE_ARCH_JUMP_LABEL
   arch/Kconfig:441:	symbol HAVE_ARCH_JUMP_LABEL is selected by XIP_KERNEL
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +833 arch/riscv/Kconfig

aef53f97b505ff Nick Kossifidis 2018-09-20  787  
d7071743db31b4 Atish Patra     2020-09-17  788  config EFI_STUB
d7071743db31b4 Atish Patra     2020-09-17  789  	bool
d7071743db31b4 Atish Patra     2020-09-17  790  
d7071743db31b4 Atish Patra     2020-09-17  791  config EFI
d7071743db31b4 Atish Patra     2020-09-17  792  	bool "UEFI runtime support"
44c922572952d8 Vitaly Wool     2021-04-13  793  	depends on OF && !XIP_KERNEL
5f365c133b83a5 Conor Dooley    2022-12-19  794  	depends on MMU
5f365c133b83a5 Conor Dooley    2022-12-19  795  	default y
a91a9ffbd3a55a Sunil V L       2023-05-15  796  	select ARCH_SUPPORTS_ACPI if 64BIT
d7071743db31b4 Atish Patra     2020-09-17  797  	select EFI_GENERIC_STUB
5f365c133b83a5 Conor Dooley    2022-12-19  798  	select EFI_PARAMS_FROM_FDT
b91540d52a08b6 Atish Patra     2020-09-17  799  	select EFI_RUNTIME_WRAPPERS
5f365c133b83a5 Conor Dooley    2022-12-19  800  	select EFI_STUB
5f365c133b83a5 Conor Dooley    2022-12-19  801  	select LIBFDT
d7071743db31b4 Atish Patra     2020-09-17  802  	select RISCV_ISA_C
5f365c133b83a5 Conor Dooley    2022-12-19  803  	select UCS2_STRING
d7071743db31b4 Atish Patra     2020-09-17  804  	help
d7071743db31b4 Atish Patra     2020-09-17  805  	  This option provides support for runtime services provided
d7071743db31b4 Atish Patra     2020-09-17  806  	  by UEFI firmware (such as non-volatile variables, realtime
d7071743db31b4 Atish Patra     2020-09-17  807  	  clock, and platform reset). A UEFI stub is also provided to
d7071743db31b4 Atish Patra     2020-09-17  808  	  allow the kernel to be booted as an EFI application. This
d7071743db31b4 Atish Patra     2020-09-17  809  	  is only useful on systems that have UEFI firmware.
d7071743db31b4 Atish Patra     2020-09-17  810  
fea2fed201ee56 Guo Ren         2020-12-17  811  config CC_HAVE_STACKPROTECTOR_TLS
fea2fed201ee56 Guo Ren         2020-12-17  812  	def_bool $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=tp -mstack-protector-guard-offset=0)
fea2fed201ee56 Guo Ren         2020-12-17  813  
fea2fed201ee56 Guo Ren         2020-12-17  814  config STACKPROTECTOR_PER_TASK
fea2fed201ee56 Guo Ren         2020-12-17  815  	def_bool y
595b893e2087de Kees Cook       2022-05-03  816  	depends on !RANDSTRUCT
fea2fed201ee56 Guo Ren         2020-12-17  817  	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
fea2fed201ee56 Guo Ren         2020-12-17  818  
867432bec1c6e7 Alexandre Ghiti 2021-07-21  819  config PHYS_RAM_BASE_FIXED
867432bec1c6e7 Alexandre Ghiti 2021-07-21  820  	bool "Explicitly specified physical RAM address"
44c1e84a38a031 Palmer Dabbelt  2022-05-21  821  	depends on NONPORTABLE
867432bec1c6e7 Alexandre Ghiti 2021-07-21  822  	default n
867432bec1c6e7 Alexandre Ghiti 2021-07-21  823  
44c922572952d8 Vitaly Wool     2021-04-13  824  config PHYS_RAM_BASE
44c922572952d8 Vitaly Wool     2021-04-13  825  	hex "Platform Physical RAM address"
867432bec1c6e7 Alexandre Ghiti 2021-07-21  826  	depends on PHYS_RAM_BASE_FIXED
44c922572952d8 Vitaly Wool     2021-04-13  827  	default "0x80000000"
44c922572952d8 Vitaly Wool     2021-04-13  828  	help
44c922572952d8 Vitaly Wool     2021-04-13  829  	  This is the physical address of RAM in the system. It has to be
44c922572952d8 Vitaly Wool     2021-04-13  830  	  explicitly specified to run early relocations of read-write data
44c922572952d8 Vitaly Wool     2021-04-13  831  	  from flash to RAM.
44c922572952d8 Vitaly Wool     2021-04-13  832  
44c922572952d8 Vitaly Wool     2021-04-13 @833  config XIP_KERNEL
44c922572952d8 Vitaly Wool     2021-04-13  834  	bool "Kernel Execute-In-Place from ROM"
44c1e84a38a031 Palmer Dabbelt  2022-05-21  835  	depends on MMU && SPARSEMEM && NONPORTABLE
44c922572952d8 Vitaly Wool     2021-04-13  836  	# This prevents XIP from being enabled by all{yes,mod}config, which
44c922572952d8 Vitaly Wool     2021-04-13  837  	# fail to build since XIP doesn't support large kernels.
44c922572952d8 Vitaly Wool     2021-04-13  838  	depends on !COMPILE_TEST
867432bec1c6e7 Alexandre Ghiti 2021-07-21  839  	select PHYS_RAM_BASE_FIXED
44c922572952d8 Vitaly Wool     2021-04-13  840  	help
44c922572952d8 Vitaly Wool     2021-04-13  841  	  Execute-In-Place allows the kernel to run from non-volatile storage
44c922572952d8 Vitaly Wool     2021-04-13  842  	  directly addressable by the CPU, such as NOR flash. This saves RAM
44c922572952d8 Vitaly Wool     2021-04-13  843  	  space since the text section of the kernel is not loaded from flash
44c922572952d8 Vitaly Wool     2021-04-13  844  	  to RAM.  Read-write sections, such as the data section and stack,
44c922572952d8 Vitaly Wool     2021-04-13  845  	  are still copied to RAM.  The XIP kernel is not compressed since
44c922572952d8 Vitaly Wool     2021-04-13  846  	  it has to run directly from flash, so it will take more space to
44c922572952d8 Vitaly Wool     2021-04-13  847  	  store it.  The flash address used to link the kernel object files,
44c922572952d8 Vitaly Wool     2021-04-13  848  	  and for storing it, is configuration dependent. Therefore, if you
44c922572952d8 Vitaly Wool     2021-04-13  849  	  say Y here, you must know the proper physical address where to
44c922572952d8 Vitaly Wool     2021-04-13  850  	  store the kernel image depending on your own flash memory usage.
44c922572952d8 Vitaly Wool     2021-04-13  851  
44c922572952d8 Vitaly Wool     2021-04-13  852  	  Also note that the make target becomes "make xipImage" rather than
44c922572952d8 Vitaly Wool     2021-04-13  853  	  "make zImage" or "make Image".  The final kernel binary to put in
44c922572952d8 Vitaly Wool     2021-04-13  854  	  ROM memory will be arch/riscv/boot/xipImage.
44c922572952d8 Vitaly Wool     2021-04-13  855  
44c922572952d8 Vitaly Wool     2021-04-13  856  	  SPARSEMEM is required because the kernel text and rodata that are
44c922572952d8 Vitaly Wool     2021-04-13  857  	  flash resident are not backed by memmap, then any attempt to get
44c922572952d8 Vitaly Wool     2021-04-13  858  	  a struct page on those regions will trigger a fault.
44c922572952d8 Vitaly Wool     2021-04-13  859  
44c922572952d8 Vitaly Wool     2021-04-13  860  	  If unsure, say N.
44c922572952d8 Vitaly Wool     2021-04-13  861  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

