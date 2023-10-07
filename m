Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BF4EA8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 01:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNJ3qnTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696643095; x=1728179095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CM5cBcngBWoMidcHbCPoRdwWeKqRU6NTy9Mff/1rC3Y=;
  b=eNJ3qnTpv99hLeeyZqaOslcH8PCWBb9wrqL8MIL/8WGdU51E1UXWd2nP
   kAFxliCGcPJeq5FRHtdbAZn016XO3C3a0wuZcw6tX8Amn/8yLM3YpAFB9
   HAkYHhDDMHMmArk2p6MkZfd6VtnzvUowizlHnz8r6ultMKybwx6kPkxGh
   SjJ6XucOpLPhGIb34JimeT9QRem0baxSQTVxfuRvnvnJ5HRGYtM4wWhnb
   4LTfWYJMdnGkBUz7BohBHMpXgiL7KaxsaeSfGtPe+SbTc/amaTUHOEAXF
   0/iFOuwdCG7VBFFKAXOb+Bn/YTZXyY8Njsd6aD6gsf0Y/O82IWt8axT2K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="5431241"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="5431241"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 18:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="1083666238"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="1083666238"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Oct 2023 18:44:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 18:44:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 18:44:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 18:44:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 18:44:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/jQiJeCoB8bElzMPF1Em5Ndl5rV/WqbZBXSvyZQTPpGLcZnomLUHesqBsVyY2ohOh2TCpDqXbSCVJTWUSBHAJi6RSnuGpVVgGW449ntNSsp04Qr0LWobG5LKOfmv6kLQwGD02njqxMpKuJOgcK9G3TZRDjEsSA4lKPgrcL1FeunNpwQW9AmLAP7qtOEJqjx3pb04nmuQwxkXJsrPz0S0XOFYvoqlnpAq1w6tTwrLT+l+xz95WjN3Mldn7MJy57C2oBLwfC57UHfZxQEXfk6wJpPQ0KMglY/Wd3SsbmnBCNr5SKYIwlZEDzg3o7fD4y6p/khQ8HJeHPOJivwKw660A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nr6QIFBSyJ41+Zf37KH3RZSVfYdUQIjHIlCi54OLRk=;
 b=howG+20Z3QZLefZAkOFWKk9RfNfLL7aaULynvj1gH77ffoje/0/M2/MaUt71nHrbPBoF2GUxmAcAEA/vzd6beds4VHGVmM8Y9xq/4oXLQzKiw006KHsJtomigpWHwIo0VCDfT8ClpNlqeGb9Tm6uwxhE/MayWJyMF9/gAD/CumIpVDBjuSbpvYsRAZIQYnLhO61cnSR5ftE2cve0CTe1jfgIoS1irNCeNvw/hP9cJq8e2s39ZBFxf4fMmFMCbX/JQiB2AwznbZmwH60qG0X1Sge28ZTMMZmu2F7ParrZNDDNYgswxsvvLR0QeA05qasUNS0RAva5Cm4vFywGfurNhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Sat, 7 Oct
 2023 01:44:45 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6838.030; Sat, 7 Oct 2023
 01:44:44 +0000
Date: Sat, 7 Oct 2023 09:39:51 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Michal Simek <monstr@monstr.eu>
CC: <oe-kbuild-all@lists.linux.dev>, <git@amd.com>, Stefan Asserhall
	<stefan.asserhall@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 189/1370]
 arch/microblaze/include/asm/mmu_context_mm.h: linux/sched.h is included more
 than once.
Message-ID: <202310011838.w32B8u06-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c0c27d-67e1-423c-cd32-08dbc6d6fb7f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DuzpwOP/qMGBVhCfe6Ek7TBcYUnpyLPEw5hICC4lNbS+TZw0fagpq+CiNRJNjj4zBCpDIZd/goPd22/SNhd0zExmiajWjXbEee/gLBDrWVqHlLot82RY4vOb67ylHBM4KgQbynMR9g25LYSsFqCTZhEH+tjfY/tyxfC4xt75R3/OTUEAtr4igmVnSsS6KY96tT2a4iiUuS6inUpB6WK1R3yDR+IWLdBVeOVjJWkeqB37Wge4XdoK8tvKrDlPAFcj8Pl+rOW8UM747XiiRA+uV2HTVjrld8CGRYzm0bvdQeUWlPbaag4wcxUgRtsF+eDJJpqgtiz67vo/e2eF9pTHcUpS2hiIeTso2l08xhcc0BBOVgwhOnKDwDSdG6bMoZPVkrrcTqQ9BP9SfRSdc2F48HNnorhhl2R7Z9vZFL2zAfShhDCisKSoNMjK2JGSfkOKFOxR8v2XzfYTDEomHvQX20ICibyH4YziY1xwpUrfGwvrlkUBUH70x6H0zaUALLe1KHSDBv+O9hWmU0RlXr6163hazmDC2Txtj0reoiz6sqHhSq7ygicR3XvIOUv+XiQEz+ixCUXjUrMpnmtvZoim6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(38100700002)(82960400001)(86362001)(36756003)(6666004)(966005)(8936002)(5660300002)(4326008)(2906002)(6512007)(41300700001)(8676002)(478600001)(83380400001)(1076003)(2616005)(6506007)(6486002)(316002)(66476007)(66946007)(26005)(66556008)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nk3gqcX4gjY6FdImBURWV8Au9pBFdLjQngmpSa1CFvP6oh4TfXh2ztzmXRZu?=
 =?us-ascii?Q?t7QjXgBCO6JkaXABc0A3zQ5UjPc9BH85s9MV+dKyoWHwR96y756vW93lfjI3?=
 =?us-ascii?Q?g4eBVrgpy+2QDKT3s87Lka9As7OBFrvM2PP4/HLJw1jveW3PkWBkZM++BSVY?=
 =?us-ascii?Q?Bs3xI9zK969C3Qsag/66A9VFr1JEgdWAhmmu53XujPhiP6Ir1ZUfAjaj/ew2?=
 =?us-ascii?Q?Ji/bDhVhDQptkx6356lMmInUafnXT+bleQ8WPtfeW+4byBXN8vWcNuHxEv3q?=
 =?us-ascii?Q?wvYtlFUXMM5SDaZhCrPyNIQGxUFEF67m+zopbKH2DdLqYnzOTXRYNOPofwOE?=
 =?us-ascii?Q?iCR/aVWH6vzLIfpVw7kTVEz9DgFZKFslnPpyWRSaAgIARKepBenqtRL1TkoS?=
 =?us-ascii?Q?9qdp1f2ObFpK/d0IRt3H32z8+U/Zq6jUsPgppmCO4OdE6on/AqjNiIv5eT8i?=
 =?us-ascii?Q?IJN50XujatmCcBPgBPZxtzYeMaXmRWef2aEB2+yXUGvOk/2dKka/6GnfR823?=
 =?us-ascii?Q?lHqLoZN3OcU0aB2MQ2CTCPewYfuxoOALUH5U7BNKMOtYf8t3AFhgp1lgeQcZ?=
 =?us-ascii?Q?LXOuqccojL5nRMIZLVwyjvmuOduEzt+yr3v0uUSBAfuc3AiaJimaGNNLiHfv?=
 =?us-ascii?Q?HlASQnSp9n4+e1BXFWdS8kxaOSXGMOK3OownYYojzox8NeRIQ77YQkNXcQh6?=
 =?us-ascii?Q?lwaFIr3yrAw20ET55VrhSuQA2HbZ1ZQFlF7dcy0ZsRNABK8HPJmZaifiTuL7?=
 =?us-ascii?Q?v7UNzdghdssbwloibcjDthjca38FsfnMLaX4Odx30LhZ8hlCZ0dJTfi8hhxs?=
 =?us-ascii?Q?iwtiZeG8xywHvxLaBaY6r9cuI+qQSMD6h+S5VYP6bbxFuOJVme0rd/5HXFUJ?=
 =?us-ascii?Q?mUtbmZGWdkv4Emot+Ws1Lysn8dP98TblRyTY5aPXFdr9M1dfVu16XxvNzP16?=
 =?us-ascii?Q?5JeU6QOWT3mKT2GvY8Q6z8wRIdy4l5j3r++VKKqUZM7tExD4K64LoNFJk9uC?=
 =?us-ascii?Q?k/eRlicvxkTRtypWIConDNb1AI8mwmBXfk3rdXwEx9nLGR9jeqDZM9nngk6W?=
 =?us-ascii?Q?OuTUoMzVRm4MOgoPJ1BALnS8Ns60SJVcircqUTJ5cqyxP3+FtDNZ7H3lrmKp?=
 =?us-ascii?Q?7g+iAxC3ic7isiQ41S1mXSsAnjiKsj27lrH1TGhwl9DP1iHdfUHLG+TJOWbu?=
 =?us-ascii?Q?/4URn5hABdO1XMHywANvUZwy7dIQixDXBzmVsyWn2YEcFOBl8hqtDp1q8Yss?=
 =?us-ascii?Q?M1wzbublToPbhEKAhTWnsuJEpqOZTqnXTuw1s3g0zJlZq7vBvmgET7Vpk4Js?=
 =?us-ascii?Q?6sbF3+8mQCtV2+BpZ4babxFuqu+2DuKmgCd2xdpQmTqXAVhjzHsnSrLsuj6t?=
 =?us-ascii?Q?PgYLgg04G4xoP/35YjbunLDZQMSvuQeKjlV51Nx/illN52q7tJH5UZq/oaJj?=
 =?us-ascii?Q?NCk5eWuZsWYi8mt0GlDv567NXYmZh5vRu5RRix/aygQYN1E3JdNEFSlUJsi9?=
 =?us-ascii?Q?q+VTNczEuQkC5onGnCjNBxKUnNuRFtUvVvfbJ2kjtX3NwLJXDioa8Jb9QocH?=
 =?us-ascii?Q?yDNryhOy9Ew8EzRoUl4NOn0T6jZNGG9DRzqVGIUl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c0c27d-67e1-423c-cd32-08dbc6d6fb7f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 01:44:44.9050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+yMEJ19nNmhnE0U9+xvBybTSeqYSu7UiRANEmZszz6xE76p15pBcxZAHz2I3CtHaOarf+Sg8LMVJX4lH18teg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 4c0e8851358566e107e3a4242a2886520a9ae7cf [189/1370] microblaze: Rework mmu context management to prepare
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310011838.w32B8u06-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/microblaze/include/asm/mmu_context_mm.h: linux/sched.h is included more than once.

vim +14 arch/microblaze/include/asm/mmu_context_mm.h

    11	
    12	#include <linux/atomic.h>
    13	#include <linux/mm_types.h>
  > 14	#include <linux/sched.h>
    15	
    16	#include <asm/bitops.h>
    17	#include <linux/kernel.h>
    18	#include <linux/mm.h>
  > 19	#include <linux/sched.h>
    20	#include <linux/spinlock.h>
    21	#include <asm/mmu.h>
    22	#include <asm-generic/mm_hooks.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

