Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AD4A56
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 02:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpzYBLks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698720684; x=1730256684;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=vETYqH2EFG+BrRDlRogCDecvERn3+ymZVL559y5M9VU=;
  b=dpzYBLksQoBl4Q1PklIo5PIZP3H7yiarbKQUS07WdejgTp61EYlr1qhK
   16Aibt0W2BCTl9TbwfvcPOoQawxGgBeqWfS6zJrO4khk5k2D2ZpvEaizd
   86UMNLdBdu4gc11A9XqBoHk+ZoZiurfkWjQEIb0KoA2YINiKISLDqGVgx
   nfvaCpYP/hv5F52EpNwOjCqgKvDI9b19iZTNwo4ohxwb4msjhBtyDdjQo
   exAGwgUkvvNQ1uWASfONX7djieqXyj5amw6A3bbp7LOm6xAc9Rzi/3Ffw
   EE2L0SV1t7+9UniWlAhVjbKoXBLAITVMfJ2Ii0eUy/dtbxKm5x0VOk/NP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="419312899"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="419312899"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 19:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="877347882"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="877347882"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Oct 2023 19:51:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 19:51:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 19:51:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 19:51:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 19:51:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmHAMnwqN+xcpLLuvbaMBh7TZgjFCgic7hG/6Ao0oTA0vVIvx6xgbkL9NuGAFrYeiKfm0FgL/9MChgUD4J19SHHMdt5Uvn2FSAO42wYdIOB7HbxPEph/8KLa6j1a8Qlk2az+F93nTVMaLPQmNfxGu6iWOQeRY9NTUmeDqKWD2KqbhuJO+AskOzo9w7vhiLPvdouhxlftCqTGY9fkaov2PC2BEzl/533AI5o+g2QhywIHfp4vdiB2E4KURzm1AIBSOJQy11j458SA8CnQSxb13rl3yVxWC+XqxViyQWJnY3Y0MwChnwsf5vBfXDLNk3nSpc+QP7DsNStC8nqrHGV/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W756Iykaq/LR06I0IhyevsJqtjJom6F2ZPnCbBo9Ies=;
 b=c0dQEi5/2YoMXJJrBKC7XLYqYCyKjU3i8pWbz6V4oY/GlsdMUVlTiBYWYbXLqXa7NIDAlnxxKGxawrOQc0SDnVomJiFgqgVqNlYnSU/wtC7zdeYbgUXuEnZqN3RWRDNSpD0PsDeI/829YgD9ntxLWzJbPruG86ATjx1gz1gRbZEnlNYk1iq8y6UP1wONkype1SnX6HvTiC6xwp0aPFbDlQoUBmDLSxRAzx8NrZcgrupBwInoahKroeWN3h89h2cqqtZv7WuDxQnv9s2K3s27NDg6z0NWiX8zcZeLrpeTlFZbhcy5yTLV0aq+TC03nnjRYlm/615/nQvJ8gByorXB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Tue, 31 Oct
 2023 02:51:13 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 02:51:13 +0000
Date: Tue, 31 Oct 2023 10:46:26 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH v2 20/21] ACPI: RISC-V: Create APLIC platform device
Message-ID: <202310310701.nob7BXRv-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231025202344.581132-21-sunilvl@ventanamicro.com>
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 02870f52-25ea-4e05-b757-08dbd9bc3e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3TMvkV6BfgxikkOn10mM+QLQY5HYSU5HADpkhLr6b05miYUHpZ0tKlhaivK7qD1dQspX6ZUPMIcxB3VroakRDqVMt8NfwiUOvxJlwki3PSPSlk1tWeF03673Xaw9buaxe87RDlebr9CYC+FwSd2SILvhh/d2PAfSlxfE72FFTHvOdWWVKRseznt+l1QQlaJc2EKC7qQ2y4EG0cl9lh4cENyKnc5Jb1RKrb02liezSHSp8RKaPWXCPuOmmN2OS0czuaX2sj8mqHwwJxaBvK9odlQV76SGwpCjKluJPUzRQXCNbja7gwTz+Uqay1xizDNpbrX4ARZYEiHVJ7bbce2cRyCy6GYwp94/R/AmnRDsbfSFtHiAhx74gfbnVrHXFQ5J7iuHjjueMkP/ic7+stfMiA4C+s/BexfmsDsGXCNtR4Z7bB2jFSx+xlosQj6fDTmtr24ZhQGurc6HWwUCAsfYNjm0ArQMzQQ+t0RXoKFANa1OZWc85zstYbGOLYruxTKOuDepqbVtyaj1UebM4YJiGNn7Hc14lD8mxVUeJaNrVUJFZio+voy07LrklpcVz31PQFkvyGPcpO1cmXq27P0VX9rlL+j3P4Ii7xi3qbBoyK/lyagTTl7qNqeAv2OmnM8IIpIHwJrmi0Vsitwqyna4Nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39860400002)(136003)(346002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(451199024)(1800799009)(6506007)(6666004)(6512007)(966005)(6486002)(478600001)(83380400001)(2616005)(26005)(1076003)(4001150100001)(2906002)(5660300002)(66946007)(6916009)(41300700001)(66556008)(66476007)(8676002)(8936002)(316002)(4326008)(86362001)(36756003)(38100700002)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vRMxdUQvH4Y6x367feDsrmvdT+eJPUWjiyGML3aREvSDT20emr7YaBO8zg19?=
 =?us-ascii?Q?Sj4dyMOk/gZBT+uoR6G4Jpk0pjuJ5LK7UjM5m7g6rqOAIWe0/OURK/GmuYnU?=
 =?us-ascii?Q?oPW6uu19jcvEifFzvKigbnXHGAldNBi25Ce8rA5weg0w0qgO2/1RqNLmbIhg?=
 =?us-ascii?Q?+kdGrCRowFreE7FqjUCf/BxBSaGwNrYpZ/CSYblJA2lkiUr+ai6EVQawG30D?=
 =?us-ascii?Q?iXP0UJZ4kdHFmCFnSBFGrMiZWNLkZp21y+4Muz8jkr1HH+WJ+fWRR2GVO8WT?=
 =?us-ascii?Q?O1BhQni1hZqj2E32+xgyUKqIO0bmU6kEIvw1IdsJvCEPp5hkq5SZ3j3uMYOk?=
 =?us-ascii?Q?hKU2ZyzHZBHTTmEIir0z3wcrThDkg7dYfGDcT5N2f9z40X9kPfRNDbfcVcxF?=
 =?us-ascii?Q?hcFb8YNrli76qm2hBX1WpCCPMlyBHtyJE5C11MfLA4QKoU6TullQB/fU3EZo?=
 =?us-ascii?Q?mJt7Fi3Ud9zWQ1I6KV2l7wRINyws32/dKmif5VtIc6ZMc5qxYiUUzU2rK6ll?=
 =?us-ascii?Q?3mhsf2lBqMF9SK86bU5ktFDySmUOst8VzzodUnuVv/LU2TkXwxNoJ69sWOWz?=
 =?us-ascii?Q?uYbgEtqSxTUG4nDwxGvAPtYJn4wja8nmjOjpUZEMkqPlXjHm1GPTvz1fzumn?=
 =?us-ascii?Q?xtrz8LOFr32gQ2CUuE0i1i4FmBhjEEllLjeqhywxNfWlgYR/s5GUUL6olH0g?=
 =?us-ascii?Q?msllZURydFydosMdetKb15W9cBa7SluINC3e+JNmo/zkZtkrDoGYCa4Pzo44?=
 =?us-ascii?Q?R/RUth8/rk1doFwsNzkvSZxhDkiQ7yv5BpKb5/lPX1O5w6DXHnUrBg3YnJ1z?=
 =?us-ascii?Q?bEStuazRHuM4enZsCPuRMbQKDd5mACFtWBJMHSb77Qo8MBBHOGcHwgqlInre?=
 =?us-ascii?Q?WHzGIzxxT9jIGvmZKCqzEtIvQFsc3PRFDa/jUULcOzAbND++zdvOcAmd+NH+?=
 =?us-ascii?Q?tq5PoxRab34an4BG9a9bMQnlrRNlxxFiwapucF422hNDzfAeSHYnWPQH9g5M?=
 =?us-ascii?Q?SIMOgg+QFJuzvT0EBBREJRxnBODKQGBtSODbkliwz23EZRb8Rts2rjRMRoYa?=
 =?us-ascii?Q?1UR8tmY3+D7p2/iNAuWg3E9NDKi4KbsJ3RjxCGsT8PDsOXLIywVJvjaZeYNz?=
 =?us-ascii?Q?689KYXhubrKjDBX6v6A6yzoSIN+68kPzSUfw0cVYQdc4ccwzrmRLV/E5aOvj?=
 =?us-ascii?Q?oHOQP0/pTbab2/85OUv5bszZecss8se3Ef9yLJxJIJKjKZWrO9wJUiY4zqNQ?=
 =?us-ascii?Q?RXGDLQpUD8DFFG0BEqiz100byHlCQi7vDqXEpBox8zxkhbqrOXmuJ9xkvcWF?=
 =?us-ascii?Q?gNgjvxvqlkf3uit2hmcQex3vneZCqDOcYxDX/Y++xEr4Ekm4COYPFMKC0ImF?=
 =?us-ascii?Q?APN57cntg4Vjv7YPhsRDtw6rwy1IAvPHs8wUThswKebL5zRYmEq2Nl7dsRam?=
 =?us-ascii?Q?ABY9UgoGQl/Xr6Mo3gcPDhHrNY7uAuwafTPgqcslbK6w6fji+7e8pd+3z600?=
 =?us-ascii?Q?1dSPYlcCLeXETwKX6q2cBIeScu2FfsGFsSVO0a5AdnjvM4SJkPG4nq10J9QD?=
 =?us-ascii?Q?erIoTlM/fMRifQElxRpIGii2fWHJ0xUAKn8j3JjJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02870f52-25ea-4e05-b757-08dbd9bc3e94
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 02:51:13.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dgdc6mTzNgPuKFtcvL3N4mPuevQaW10ULIuGFa39ADeSGCUg3FRl0EPzJnVlD8cK65FXmvsYVQ4HAZ6PTVf8OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
X-OriginatorOrg: intel.com

Hi Sunil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.6]
[cannot apply to rafael-pm/acpi-bus tip/irq/core pci/next pci/for-linus next-20231030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunil-V-L/arm64-PCI-Migrate-ACPI-related-functions-to-pci-acpi-c/20231026-042858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231025202344.581132-21-sunilvl%40ventanamicro.com
patch subject: [RFC PATCH v2 20/21] ACPI: RISC-V: Create APLIC platform device
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20231031/202310310701.nob7BXRv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310701.nob7BXRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310310701.nob7BXRv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/riscv/irq.c:103:13: warning: no previous prototype for 'riscv_acpi_aplic_platform_init' [-Wmissing-prototypes]
     103 | void __init riscv_acpi_aplic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/riscv_acpi_aplic_platform_init +103 drivers/acpi/riscv/irq.c

e501748dc32f47 Sunil V L 2023-10-26  102  
e501748dc32f47 Sunil V L 2023-10-26 @103  void __init riscv_acpi_aplic_platform_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

