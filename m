Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29DB381BD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 06:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713247225; cv=fail; b=jHaHGS6cXgESpuDyv38boUkg5LrmI4yoOSnJ85X6POf1jED4ljqcQzHUzU5Y9RJa5Y6Md3e50dDCZyzfcLDYL9KzBc6gfujRWCgZCXCaG1rvxTjy1UTJuTvlBcRMAVZsKXm4RglTBeU0bM84kroyYDdJ7J4hIIFrxfXTXZ5pnvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713247225; c=relaxed/simple;
	bh=Dwg5Qvl6CAroGRSrdK8GiXhl0btLKjN8ssi29k/DOA0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GrQ8eWWzRWvNyZb3Pi5HMmAHurGO+4nBpaA+1gllBCa5YCf7q8jLDYTLWh1sC6ZtDf2vpfqPyi7loLS5r07DGgJtGS3rwS7/Hr3ckjhXJJkwZboMoEVpYtFabfX8JjOp/jPsCBoByoKrJIJsTt3s0U6A3n6X0KViKmPV7SICQCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3Qop3DI; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3Qop3DI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713247223; x=1744783223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dwg5Qvl6CAroGRSrdK8GiXhl0btLKjN8ssi29k/DOA0=;
  b=I3Qop3DIO5Mlu0wdannB6d6cDQ2iAqV3Mj40ypyuJ60dKw9Yfs25O72j
   BGJyfHSKirMSXKM66tUh8hUa3Rd/oTkNaDN2mYfASq6PrpCeDpE8tCkIU
   v91NCX4AyTQwreJ9u3BhvRMSNsn7pXZcsJve0fhVQ74Vgjoi4BfCS2ztA
   3AwQeOEtXK7cA3JWgUkzHL5FEMYmqavpfgQF+c2kdMHPGOYVwTtku31Xa
   esikx/ZB3E6nYqBJhGNNfGxfxEwIGU+2EDWQBU6cvStjWWV7lZgMAdllq
   /71FCUwfLyoiIOuyo3IIoc1MpNHPX9FMTVWzsRYdUFloTZd4PNs9YlP5N
   Q==;
X-CSE-ConnectionGUID: XSu1cpwbScmqXNJQQl4y1Q==
X-CSE-MsgGUID: aGadbV9zSyyoEoeAjKCI4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19814537"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="19814537"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 23:00:22 -0700
X-CSE-ConnectionGUID: rPpRviwDS3mzXVug8oOoew==
X-CSE-MsgGUID: loCWkS1NSFOGj4Nch3bq/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22050674"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Apr 2024 23:00:22 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 23:00:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 23:00:21 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 23:00:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQaAKK/ZRXXsTdBXwj9DkAEk8Wd0G+4duuJhzR78fKpnPmcdxyvEgUziOY/ae1bcSZFJPi7/WRaPRtFd3YHACf71nywmEtS5MMejGAsf6dgYv3MAuyyxwG48xrCuW7UDY/Bby7hJz6hGAwfX/AwHP/mLHhWKRU6tQefFPW6HKIM06Q1PwFBZ27JcMBtnSkZURlTcBecDh5jitCaaXS1jaFoyzxBFp/PMryMltmZ93+fPGzG0Ot7+w0aISUbrehWw8hMlD70Zm76+96cJFsKSSccJkQ/Q1vyjEfwadp5We2PTFWs7CM0Wl+l43qdAFU4kxE2+LkzGXTmb4kQcAqAwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwPMnlbcOvrTU+H/eqC2xd+SPXgaHjzztin7nEu5t4U=;
 b=HF3XieSpYNRDr6/U4A3P78N6k10E49XVTB7fgPN0ozKTXTrUlD8Qwbql93jcACVcQ8Zp3Zpng70bzKB7MnBO0l12aLt2u45vn0+qeAlxN4xExQ/LazCYP5t0MUvTen9zsWyanFw37ijVep3n9slpeFtVm7y5obbHrtaTEptEnkK5riMIPCgzDLaACIsLCTU8oFxhzY3CgvBGWC6Si/VVNYziGl+3JUlCgjxaQW+hU1SHzQGMOb7bmmO/IYiKy7RkzVVoq7e/YKkOM77vyppuOaBMdXyNDiOewNgCqfSV6zjQz9CiQJit9LIJkJLmw0Agw6BDz3xlq9WVLpdTBpS2hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Tue, 16 Apr
 2024 06:00:14 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.041; Tue, 16 Apr 2024
 06:00:13 +0000
Date: Tue, 16 Apr 2024 13:53:39 +0800
From: kernel test robot <yujie.liu@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6 9626/10059]
 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c: nvhe/iommu.h is included
 more than once.
Message-ID: <202404151401.AlmjILSu-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|DM6PR11MB4612:EE_
X-MS-Office365-Filtering-Correlation-Id: c1559f78-e175-4fe8-3c68-08dc5dda7b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uCzrG13SOfw5ozKxh3cfuA9BjM9RTxkMOe65n/sYTvAruJxNnF7/kvJgOjswkAskLQ7236tz89V+GmyibMD9XoFs44FQNn92WPwK4Z3OFoD3QsXG9TLKajHhKb1gkxIDO9StjdkhBpQLPQ5wz+k29QGJHbZ8OVYpZxfVMgpfCYfa+bnmDF0I3t9hXjWgT4MwIW4VwS5lwEUH7g/7EZJiJD4laYaNmADP3kn/Z8TXdMfKv0zeUcoSeN5q0lKrdJhoguRCdAg5sj/EcnUbRzqQpDIT3FhKDyBPvIEdHIe6o0Uo7GQF5HvMKW4XLgkf7BzuquIrm4ZVgnWULPBjwsZncXPH2luSOBrOnAS2pDMivIjEdC6ihsjAArbAnclTMiOzlpEZpMcTQFiWd1iEFQmuSqlQczm6saxU+1rZ5poeOStHHulLEzxWT3k5qvkZtAXUBD+eEDOrsirla8OPYVxdPut52IR1g0gWPzQ2uh0FBAHVXXlOVPBzz4tyk47Eo+ZztvDNGuX8L9QNGWryiiQHCRBWl7BzoI4yPbakx3v3JdSefV3tNP/jJJKzfbIXroLaTdMJmocmyz+L52ic5UUnYzNXt97FxmBTMsG+2d1JFxtOyDQeHsDL35TMop9xMpS3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bMUQlbcAxtjhnG3fEcHAyqXFDUN2W/Rp/FvN9kKnm29vLSB7B20zQOuLCf2i?=
 =?us-ascii?Q?4U/CpMn3xxqgJyCsL+64yXmPpvG3UX5TU8SupavZsSZSi9mmuLI+FzRd7hpI?=
 =?us-ascii?Q?uTrKHObbtoM5YVVgZzLFPSnjPlrM9470ZS4s7ugPHN6LmtksxTkfWwWNc723?=
 =?us-ascii?Q?oiAJNve+y4RmPwJhaIAPDD4IkDgNBGRL3LVQo6Vir+yJbfJezVj26SiHcdcj?=
 =?us-ascii?Q?wNudoQLQOUBnoXNfRB78qYI6kw3KZdBNUW/FSdSvI9Rr8izKoHglhc3ZdTnj?=
 =?us-ascii?Q?6XA9IqnffGt/7W9NnWdTuIgMwTpzJcfcX5ZkpnyezBd3ZjCiGa2Qz4RA2UMk?=
 =?us-ascii?Q?zlpiLBYc/2rbu0f0gqBl+mT1yQKQOCMfQr0zzN3YNNikSMrfuXGe1QKynaTY?=
 =?us-ascii?Q?j9FRBdi3N5RfGpjKeZehXs4+ajXehjnhoiUvaDjbrIFVssGAbfpQm1QcqTgs?=
 =?us-ascii?Q?/JqhTmqHGbCFtLLD6a8Vt6KZpnbMtxNspQpB6Nf5AeI71m5pFWs8GvJr9llA?=
 =?us-ascii?Q?p+i7mJ7FN+JNqVg4hnxgqbVTJDm8LgleKHhH3ltzfaah25Z1mar8BKtP38Dz?=
 =?us-ascii?Q?0+JSk9XvtBHdHLiEGTZoqWkQkyG0U0u3nmpeNXQ6m6ip/XDINLX3LFunET1x?=
 =?us-ascii?Q?KXUeqm3xviVi12ZwZ32a0zkf9PT1SO2cQC1LlC4e3RSOGcG34CB7NpvX1d5Q?=
 =?us-ascii?Q?FIqg7DvGC5rgKLRemrotQ282ZQlaF7szHAfe8kR6PGIX2L1jsAWz9IijowB1?=
 =?us-ascii?Q?Ruze4v0pvmqvWGduBenaVv06qlrL0CsJO9YHSPeNHV4DH9HLcIXYMimezoIY?=
 =?us-ascii?Q?XqobrayRZM/iMq8N550TRl8sa5h/LBn4y3qSBCvAAYIVPvm9q0sLqzDGDxSL?=
 =?us-ascii?Q?l1F4doiww77GAmv5oTgBueDHCb4ctz6aO/X2XEpJYg2h9f7ccGwrAUZ7lHti?=
 =?us-ascii?Q?leeJ3CtwB4qwei/3cQ5JxPMBLRpmxofAiIV7KBoPDsIpC7d62ZH7FDgbO0GE?=
 =?us-ascii?Q?NQgq9hzAW0cBevzKRwkQcU4wW4gjwzJLC7bVcVSLzrOsBMx7lHmxxhdsBrmZ?=
 =?us-ascii?Q?jUNc95/+p4/1w4liFKuQeKaSUd4PtHbtqBbsocJuLxpbhoHd5Ff/hXBBghWC?=
 =?us-ascii?Q?7ttj5NXKV+rfSuVxHbeZEj8aqgn74cP96vOxembKr5oJF1ejb2x4c6ZTLAkq?=
 =?us-ascii?Q?Mz4NNQ5rEK8o383Z9mV/VbgpdIjI+jtJhnq2BzIVpXUzQd2oE1oAqDUoXU2g?=
 =?us-ascii?Q?sZ0esKaYmKPBiaqV0UBF80FHhCbfFaP1dWuEz/j6WEy7QfIpFSgdtwnczyJ7?=
 =?us-ascii?Q?6YqTWMpLOwrs1O0E719/R+I+KG86Iy9onhmgSleaXvJCJ52xiueEdVIXCk8U?=
 =?us-ascii?Q?AA8jQdaaNskFZkbo8TlTkDfszd3ncfWPuxx6GfKT6F9JjcKwI39B/X484PLx?=
 =?us-ascii?Q?gPRxCRcznYtxwA6hcRMDZvqoEHuyh1MPaJ1xVWp897NWvTCyj/Rsm+MTMKSf?=
 =?us-ascii?Q?c8hjgohCI42Owh5oe2+jxAvJ1CxsyW9W64Sg7ibyETXxx40EMkJosre3BKbf?=
 =?us-ascii?Q?zTtXOXMP4VecSP13Sndj2pc8t/dlmVy5v8bBBycv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1559f78-e175-4fe8-3c68-08dc5dda7b8c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 06:00:13.7433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yofAAhS69367DL7J7qUo/9YqI1fEiZYMlBr+WJNCHsZceF4ehzniW7mlU4YQOMq+gBOz8umYb7ErXlXVFUr2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   9733657132ed06dce3913648f69658b55d11584b
commit: 988736bbd276fe2f5fce9b78c453e2508b4f6150 [9626/10059] ANDROID: iommu/arm-smmu-v3-kvm: Move files out of KVM
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404151401.AlmjILSu-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c: nvhe/iommu.h is included more than once.

vim +11 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

     8	
     9	#include <asm/arm-smmu-v3-regs.h>
    10	#include <asm/kvm_hyp.h>
  > 11	#include <nvhe/iommu.h>
    12	#include <nvhe/alloc.h>
  > 13	#include <nvhe/iommu.h>
    14	#include <nvhe/mem_protect.h>
    15	#include <nvhe/mm.h>
    16	#include <nvhe/pkvm.h>
    17	#include <nvhe/trap_handler.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

