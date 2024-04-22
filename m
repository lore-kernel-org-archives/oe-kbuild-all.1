Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F10B205E33
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 01:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713751153; cv=fail; b=PSSxCNjeljvlaoyRkPfTP3Dkx+1tHTVHCDNUIaAS15/LAILVVTCXju7rkQJl27T5E8EMVEdefm5KiB2beYlpNJLH5dITolHaU6E2hvYDY/1sPf2Q2DuFW24gB+Xq9Fko+E/y6wJ7U8eharCYhHfUgdLx94XI7qPeykCvu25fZfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713751153; c=relaxed/simple;
	bh=qi7wWGUQNKBNiu3g575N+lWpbOMrYWHtwWR2DpCiRqM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gK590Kai3blvfmMhtzY5gEvp1+1Jzh2UGIr3x+T/Uuxy+Tp/vTYkqkKc8JK+kH9F2zqRp4DDrQtCOYqUVepoOukojBck3z2Rfmzx4dfvKHzy1an5dt0NvObgkHICZ0H5NcJA2V+RfJeaeZ5K5YLqzTFBmgIw+GT4eK/zILQUG8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fC12k8B6; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fC12k8B6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713751152; x=1745287152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qi7wWGUQNKBNiu3g575N+lWpbOMrYWHtwWR2DpCiRqM=;
  b=fC12k8B6HTVwxSGVGVSMrkYXWGWIXFeFoZnZ23I3IMT9ILBxKE2tG0cK
   PR83qDYvC6sgbZBbHg34nLOLNXoaS/jw/OiKxMxSoh5p0vtEC/AllUKx2
   bHVm1PhbaZhjSSxJowm+78kCMohGZZYSa/DHrkcpHZA6WeswdVQrQPNah
   llO8Wk7pxXQ/BumZissBPAU/pix0MZl547lxIb5OosryrN0M3/NaCaxv4
   8B97t09YWa22bTLZFu5H797edorBZHAfqZQWYUPN1iaDYIvys/kISuIt/
   AR3P6mbbHhXNNLInCrBIXPpFroieXZQO5i/9voGQPStLVx770ngrGewge
   w==;
X-CSE-ConnectionGUID: Ki+6zseaSf2QGA+DmUNbeA==
X-CSE-MsgGUID: sd4J9OOWRiai+OyMZOgSqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9444786"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9444786"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 18:59:11 -0700
X-CSE-ConnectionGUID: +hAO1czdQz+Da5GN/T9Y6A==
X-CSE-MsgGUID: 1oNrJntGTSyelylyRw4yaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="28642479"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Apr 2024 18:59:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Apr 2024 18:59:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 21 Apr 2024 18:59:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 21 Apr 2024 18:59:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2xk3TPmQlhDvpim4j6N6iDbXbm9mYTclpAvkoCIDgIQWV2e2u/PMTWZKT0rJVOgDk+aeiBO98eh2uY0Px/U5oWX0C7nRRcLd9zWIrE/o60lsUYfCO0swa9fMZN3J55ZKCX4hPJIF6AoLkvO6LWy1WZa24/FO1dpVrJcueIj9pvO1LjfC+2fw6sUOZ4mHdsUKj2ZqUn9YoWlIxfvhwitlQj7BT947JGJgY+sC7icWugnqQ9jlIIQpvVAPFAqL/ejF+CRjPHDSbgr59RsqcpE3TC4M0ei6Dc4rf20CnwKd34Mta+ut1ozOA7vtBJzHUZXBZeK5cBARSjpARcJS+YXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+unmpffYSJCZUKtVHtEbakCt571kg/MKLVIRemxA+fU=;
 b=MyzmQU+GK1D14zRLY9cNvg2AAoUCpuO/om3fiLbUNSP2WrcyTPQ7Y8CaqMcsBv0ju4n6avFHAJLMIZfRMx9naP6eXfZYYo42wNzlMDKDWBD1cTD3BtOvvDxWDirDQFO55oS7xRgSZmffkuKe+femQqquNzfSlxV0ZhVl39Fpsk7GVYeBRS/UC+g6fmJNktGTC4ZpNjhvq4K7NIEWbcrVKxNz0ExF1HADtKUpJtzTvBQJdyfc9SudmcDLjKfXBiXdBo5FFacyQvp03nDXQMZu/rcPA5kEr9yy0Bcf2KJ+ARZdbSMjToodIXCCsjLtBMp7A5zXA/fCyf6sD4697eX1dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by PH7PR11MB8456.namprd11.prod.outlook.com (2603:10b6:510:2fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 01:59:07 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 01:59:06 +0000
Date: Mon, 22 Apr 2024 09:52:33 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Jeff Xu <jeffxu@chromium.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6797/7122] seal_elf.c:undefined reference to
 `sys_mprotect'
Message-ID: <202404210810.9nYl2GMd-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|PH7PR11MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: cc181542-aaf2-4c60-f278-08dc626fcb0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KkOHxn6DhSksVYBbsX3BOEWChHeCnUU/9iMQytXjw/FtZGRYQjlZFHj2HQlB?=
 =?us-ascii?Q?H35bozWm8l7hY0IrFt7yrrqWuoz1gZdI5GzCELePePIm1znCrnqGe2TQPXWV?=
 =?us-ascii?Q?Z+6sIQ2tyWklN6IRmA6L0g2DsJVQO6KPxZhzxGjQ7TlhHhNVXXkNZuEMxyV/?=
 =?us-ascii?Q?h4/Nr8MinTJne84KN1J5fkp6PZKvejPC49NnFD+fLYI35QAEhFjdUYP39SLc?=
 =?us-ascii?Q?8FygOcollRzDeYH+5uNh7Tx7wp70fXbjnue8QZE47FUavn+PdLrLhLx5VTt1?=
 =?us-ascii?Q?Pf9Q5aab0XrXW1BL7lh0rNQpHYuqiqHTWe0d40WtZgYmM4VZgtqV6muEeoRM?=
 =?us-ascii?Q?n371xo1e8h8j/0n4P+UwzIzFoWafuBnTT1XuqefFLwsnn5UmgRfrlTryPgWk?=
 =?us-ascii?Q?r6TyCTxjsEB6uUrhOFK60TxxcYjm1uvgHNOK2TmNhVz6le0gorACcyDb3JzV?=
 =?us-ascii?Q?+XuJfu1+3hpSy5Qa+It2lgfD7Q9Q472pWpR3S9zeycx66Ro/exg83JVWLcIr?=
 =?us-ascii?Q?TLI1nGY6hZb6ExgqyfY2AAFplxydJFrmlaUq+KFt2WFv/HaoJu9WjM3zpVRN?=
 =?us-ascii?Q?x8LRPW3CIjOgjXyTGpjsmiCbHDjuNuSNHFYpD/0IJzeHjNpm1uxxiCjCBK7v?=
 =?us-ascii?Q?ukDUfZWpN7/5d7YLtE/TW28rL6t0EsZQs9J1EMO4IplgM6eTxqSKSiyjfAUU?=
 =?us-ascii?Q?ffYaqp+vKeu+dHWL9hqw/qtYDSv3EqA9LpiVw5TgulVyoTrHq3cj9GZ0Hs4h?=
 =?us-ascii?Q?X//8WuVq9u1JdyYisdp/2W7BM4eKGE9mun0y/iyHYLsZWUBarnxBjfk6fttM?=
 =?us-ascii?Q?qlyjGlLP55RBNLkaeWjSEM9eZbTy/VB7HLROzsz/pVOBzClyhv2YN20nQOk9?=
 =?us-ascii?Q?X6Qodmoyfy/65H0N3qWr8WdBaqENAj3kBitxnhasjlaopg8YiblKjLYqxrCl?=
 =?us-ascii?Q?Rx9nuzmJMXPUE8+lHsU95Y2i52hrmxgp7Csgir2YqbafbYU9tqOXj6Bms54L?=
 =?us-ascii?Q?XRbrT4fSe227iacoaKaB+KyvJLfuq9THilYM6307Vchr/0QXquD5HIAcWnrg?=
 =?us-ascii?Q?/De26/YXHYH/1AQlGNGx/WVZe30G0v2QPS0UMYLNT7CmOWVTvdH/Shq5DUYc?=
 =?us-ascii?Q?SmCdCKWdKO0FA/b6xM76JhF8BgnOlnZLMmMlI+1+5kjSk+1cfn2yGP5apZxp?=
 =?us-ascii?Q?yVgN3D4CJpCnUOcVafElEUvKb3eeskBl8QDzyV5DuXBCF/DBoTFARs/DnZPB?=
 =?us-ascii?Q?HNzS84UyQ6YeD+JXd22vw9VTPp5qr7LMxw4rke20s+ehC0rrpgp+5WWyqYYv?=
 =?us-ascii?Q?iVE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JrEw0NdIYq1PuOjywihUXIaPNVo8PNcEmm1PhZ4LvZLdaYHN3dj/7/0WYCPP?=
 =?us-ascii?Q?znmpX1/U4UWjbqlX1zjfn/Da6M524MrdnQlpvAVtp7xGYrZmLOsroznLbk69?=
 =?us-ascii?Q?x8Iqwynnp6Jr9vXQvsliB7tyMeFZTq+CLGsVgbRWqbKp14Q+iVAcGW9MZWTM?=
 =?us-ascii?Q?qg0DeLdLycJWkF63kWqOXK2OSTWg0l/zFPegrLXVXlr85GMpxlCYWfBhS7s1?=
 =?us-ascii?Q?5KJSaV0XuAjzKFGt2kA3ZZyBUyBD1NTK1zvsqBZbfL45mkXyLhNckp5CtcYk?=
 =?us-ascii?Q?Vin+Vm3cA5sMN12O/FScWfsC3WKg9TdsN2r4qaXHvw4oGZL1QZl/tF2jnYZh?=
 =?us-ascii?Q?lVoIZaX4sil6nfpgP0Xg4SqGcoVuOntNosAYeD/j2RNbAo91O4A39VQWGyHJ?=
 =?us-ascii?Q?Fo2lP3azLLgGiHGjdfWvmXJrzlgMYuijPQBpetjHt5LCPCs3kooGSstAGk98?=
 =?us-ascii?Q?Clx1yyTgpfRLq7pV7obFDEKg2TcmHBNMBTx2W7bjd3prCYIA8M/cz2sYOOrK?=
 =?us-ascii?Q?wFybzaMEnTtpfIe82CFKwFCSA4oZMGYnu2QgAqBVbJ8AsYIgJiu8KzrUQSYF?=
 =?us-ascii?Q?JPRHN+rnY0bKhXqofEu5TINZjwmoQK14ER4XnkbEyKdEoPHSV+srPtCREA6X?=
 =?us-ascii?Q?JEIyGqwzA2Pf9/W1q7PO/MD0rSYTnomppge2mRq2hh/eHKLpYuSH1V0Q3bV5?=
 =?us-ascii?Q?IDFD4SxZlPuzKrLoo8Yj8+A+U5p3fDSKIVl1f1p/eJtaED46VMcWEjyTG+oE?=
 =?us-ascii?Q?0sgpv7Vihe7+otDunv4U9oWb6IionGy/8ZiZl90j42KZUjvg24fEVFgWe5rD?=
 =?us-ascii?Q?7AMv6jqQryBuO3tfW4tGPLrnijlDUMUlm1QEzDBfavtRi/S0rbhXA7xhsddQ?=
 =?us-ascii?Q?MmdZBehR4ZgIIKVlRSNiv2QK+x/LLpFiyasK7V012bXEKdfQn240GNYk7zt0?=
 =?us-ascii?Q?XXmup2iCeugUHxVUKlxhDZ8Glon9G0rWercPDENcez0WmpsfhDEEOwJE6tK9?=
 =?us-ascii?Q?NXzxfaV1ZowXqrHuqnfiMYpOBhVwW/aet7q2gN6sCnV6P8JGrEAFdWVBHRVY?=
 =?us-ascii?Q?7g4a9JM/CnK9J7gOHocotFsVsF0jIvpaYnXPOGdyij9nfE8SWSp43jBla09H?=
 =?us-ascii?Q?Jj/QnF0QQeJS8J0rcvlazXszIzCckKIRH5qtv0Yug1uQHP793v2HU3pajIYq?=
 =?us-ascii?Q?eb/qqPZc0TzPY9V9pYADvr8G9kunk5A9wRGzBiIKSqOod91Y+CMiq546za1B?=
 =?us-ascii?Q?qoczA0FabSZj8sxc90/dV5GneJucbMxsOgCVhjziKCXMYzXFLZ26kzXIXh97?=
 =?us-ascii?Q?RuZNyZSpXs7j2IyXy2wMSZwAC5cOSIECGfVIP3ihRgAUWthu2LSXW4uLlyod?=
 =?us-ascii?Q?ud+m7wmL9Cs+mhtsG9i29EGO672tLsDd+Fi82MlOA0RxEOvxiMAxu0ZfKRHC?=
 =?us-ascii?Q?Y8pK5iB9JqW7chYfnnYn1ZNhqpeoRrWsk0y1lHyFR0WCUyFFl7xvgDcRCtnm?=
 =?us-ascii?Q?8hPqgfgy52wAvGglPgzXalEiFqSu2qmsuHXgBOX/HuoX14KtjDuWrfoFEARI?=
 =?us-ascii?Q?KOQDnBTpS10yOmZ6JCkwlGn70PsTz3HeUzwYkIRj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc181542-aaf2-4c60-f278-08dc626fcb0a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 01:59:06.8186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BAoiGw84S/50IgOyH7uS+BLGJwqsQqpNnXC4sFrCBDdtN2fCnVC7MR985XoTJ45ji+9B+qJcLcP2WmTOC1ZOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8456
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a35e92ef04c07bd473404b9b73d489aea19a60a8
commit: 93934a4ca8eadf5f74fe2c7c79de3d30a8603793 [6797/7122] selftest mm/mseal read-only elf memory segment
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce:
    cd linux/tools/testing/selftests/mm
    make

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404210810.9nYl2GMd-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: /tmp/ccl7501S.o: in function `test_seal_elf':
>> seal_elf.c:(.text+0x7af): undefined reference to `sys_mprotect'
>> /usr/bin/ld: seal_elf.c:(.text+0x82c): undefined reference to `sys_mprotect'
   /usr/bin/ld: seal_elf.c:(.text+0xa4e): undefined reference to `sys_mprotect'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

