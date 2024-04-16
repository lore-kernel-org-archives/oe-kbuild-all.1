Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8AE33998
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 06:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713247698; cv=fail; b=WdO+hrZxVfW61Gc4jho80OCL3yL/1nye79RW9CuRZUJvhfRmneo8e0bxH0EDKOlBcJEmwXBih9hnXbkzC6kP/jYHx3QjZy7tkGxKKnQIYoqkb477Qk397rfz0x3rDy0XYBQPooZ5rWz5NaOo39gQH5AFhOTAsNFqn5nm3a7xyNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713247698; c=relaxed/simple;
	bh=vhCWcIJ0RFo62w3HnV0AUMHky5yS9wzrebNopO+FkXM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BrVUenRg37IM2kBDo8th10SitJOZgMJ3gw1BgON9KpUIr4SZPNL5MTevkFAX2tcywH3mLFvDOtrozwr+qVRpacXx8Bek7hz99dQV/ZUbxaKo0/jZ6+vnS63hAnM1g9lX99x3XlXX9GjHzd9lHtsE0aYs35ZVnt0Z+5yj7JxHxTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qfq6EOc/; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qfq6EOc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713247696; x=1744783696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vhCWcIJ0RFo62w3HnV0AUMHky5yS9wzrebNopO+FkXM=;
  b=Qfq6EOc/HNN4mUUwBYGl19LBFqEwixfnHCEJa63sv8+7jmKPGFbzjFQs
   W8rCt5gRPVy4nee7wfAWLWltsh0QobewStst7ikf8XXlZvbs79Cn4drFu
   5v/JlWEtxF1snYxDKrAPtL5XunQuYU6J6y5m2vE51yvRhO9Jlwvm33nnW
   9+xH3ih5qxkHbFx2mFaAi3ANMbWL9Fht+BXZF2nUqvEjUAjZbJ2ragsxL
   89hm4qyWgEa753SexzK1JlG024xu9Dm2i1V/Erdj+A6Zb/s9ywCHnKjCS
   3UIGQgD9rNlxPPUSayl+VqzQPx+NleI3Qr9VCK9F7AeqG+qijeMygNpgU
   g==;
X-CSE-ConnectionGUID: Dh6gNzpaTlKH0QzdePkL0Q==
X-CSE-MsgGUID: +TTMWTo9SeSFLQSO4EPz3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="11613342"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="11613342"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 23:08:13 -0700
X-CSE-ConnectionGUID: yTGM1EUKQEGn5ZK/C1D3pA==
X-CSE-MsgGUID: m+A95yAYRo6qwGnGw7nwkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22053653"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Apr 2024 23:08:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 23:08:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 23:08:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 23:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pc5otUwxsGYuKREYIroOoLb+2oUPW56PIuSl3//kKX5dTEYa5Wx3HNhwdn6lE1BtxrTvK3lNq3JNgJiQIhj2W4yF7W27sU1VzrDu31mib39ZIrEOX2sa31rNFX2ia+dmsFVtrAmVrsSrOmDGpd7GSP322slonwsuJ+v3u/dyannXtAiVpgJB0hI6GsTS1w8oXhufqx9O8JkpbYR4kka3wjx73KTC3JEGnBhEpo+qgoIOG5OX6wTvcT3+0JM+UCcK9kIvK/q9uEQRBu4hzzHfQDCMewenMgP4JzFnL5FLTaTCavY6QqexsSVByasf8RGGuCPx8SDfDjSLXgvWTb6r4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOtMRDaFuvoZs0UZp5je9k8Mr+ofUhHarPdEq6n1Gik=;
 b=Ft6imHTKXpeOg3LZ9ffkp1yTxvBoyn+bcNGMGXC2Sh2pWZmWmV21dYKGho6leIxCivHcRK8jDs54650i1ckV1zEqyy88bfBEWlO6nAi8SAMufXQywgNC6AmGPLmjCLH/wW68cdqbi0uMisUAqzexZVjdvHDv2JFgdyptRZ4oGHoWcJZ+V2jUVuJQ0e+iI+tlPII1K5Xomzrf+uHmQcionpus1w15wvN8Q1Zh2wxm7vAcaVFFi5GdOVvvld2MKXeLGxJVQoUSG7UKerykTIK+B1bKGDch3gkkrnQ4u7QmAxJqVFL+pLe4TyCfQLPzZZm9TNJmQAleMyGVO85c89+wNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Tue, 16 Apr
 2024 06:08:11 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.041; Tue, 16 Apr 2024
 06:08:11 +0000
Date: Tue, 16 Apr 2024 14:01:37 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Steve Jeong <how2soft@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 41/59] drivers/char/aml-gpiomem.c: linux/of.h
 is included more than once.
Message-ID: <202404161112.tinPmErL-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|DM6PR11MB4612:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ddd8bc-6227-44b2-8266-08dc5ddb981a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGrTCnbQuXjc+iUw42/fNmlbZ+xNIfDZ0e3FYyfLnW2akWyJQJjG/KpgNFvOrfLQheRnKbsgibV6sF+U1jGTFEo+NT8J+E/v0jTN4wFG5TY6MdX08Ba5qLx5i7/oPb36qs9LoNotlFZWlKT8LWF0c6B6q8zWhn4y4aeIpiLGBC/KDSxieP/dIuJVpnJEyCjMpTrSBK/StITJ5X8Z3UdL239izxKKaecupS+YsWjf3XOvfZQ/YrzVxz/k9NsafNyYlHSb5n6hEusRT5gfrBbEOUPUSXnATyazfQWe0k4DzQPRU31CLqLSwEY2kA/Wh99gQb65vmnnkx7r6IFEfOHcWezP6mXU6NOir6ydvhI38mAtOuXWJJHeTI3/V0Ovl++NrajWUyic3dWdCpwxgZmTqaHqmBllUBFUkDdhZYqg3yYhbTe7KmEKbtjZXubls/lGpVdQXhfnKK4T3ecLuTz1cGMilOPAn+mZe5+PuJbgOSHNK7+Ty/RVpE2C9MsPUKDHh7LT/fSwRnx5J6jZdGg/wpPxMi/w4BBAfZTD9zb4UwjnnQ6HxlEUpLhgjgX/qxzqKr4O2fIdAZcSDj88+nprQAv/Y4oBOz5UBX0ABsCjwCdgyZU0M8zRnbKSIGN8F9aLM6bJ0EfsWBbwxA5HGW8vZBERxuKc+DLfVo4ZTydVJaU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Iwj3tqxL2zHeWmTInM7fAHIAoGnvUr3HDvS3ukD86biFemmjMKxb9/nGKhCW?=
 =?us-ascii?Q?RmWjpRj3NyfdZUJjzIDFqN6V7VhT6Z42pjjm7QxTyB2gRPS/DNXReQW6Nrld?=
 =?us-ascii?Q?MhinE3Dy3C95AN/u4Fe5AT+onosriU622U/0IxEnDydT2MKqwNyYZxQbeAOE?=
 =?us-ascii?Q?hmqZOUWcAUNbTL90qEw5HZJlZZEAS2Y8NLdqSQkvLervgOJNkgtIdbJubE5U?=
 =?us-ascii?Q?KNJjV5JbQeT3xFCocCO++GQfdLL1t/oYjTiptwnaNgoF+1v1kd4xgzjzxztk?=
 =?us-ascii?Q?Q5Jjxg4YPrEb8yJlkVh50L+jJk3VVf8RR5p33SMZZAcn0c5Bo1nWwuig80Dv?=
 =?us-ascii?Q?2UOhvHf17xrAMhbkaMyAOrXkqr2Lri5oriLSruxpnXOtm8f75xTJK127zcvr?=
 =?us-ascii?Q?kLiFE2JCngXQUiYIgdR1znYQnTbGhMRoWn9N9rKrmzsJgHVcDoy1PB9CvGP9?=
 =?us-ascii?Q?Kmj6zBghsL51QF5kKmYH/nrwv/XY6734aACOcBHyMGck4c83LdSIpXCYeLdY?=
 =?us-ascii?Q?24cBPgTETxlsuYk5GCmcZpxsGZ3iCPDZvPwQp8DHqKGbQVxSalfg90rn5WKU?=
 =?us-ascii?Q?Mvny7NVgeyZKLeFnJhH0+MNQSOun07AUoOo+/GgSjmpfTy1ZOPZt78daoLxk?=
 =?us-ascii?Q?H0SYOgL46bOcxPzovXjzG2GK9fUG305IX7w2yHbKzat92sW0ruhHIPkgMGOm?=
 =?us-ascii?Q?gYA38ndw9MdDJfgYDCJP2P9agJSVENHL++AV6PJ6bCrlQJ57t1CQ5+pNfcjo?=
 =?us-ascii?Q?4DUrsgUzc/L2SKhh4581Fzq0waJnCdXDCfLhI752pVdAc5vwOlYaf1MnSD8g?=
 =?us-ascii?Q?bW1nQLr/M7kKkfkMBtXFwqmk2/Sshd7ka507nMvGsZHurhEJq/gNm4rCZ8T5?=
 =?us-ascii?Q?DCuZ0rGmDJjU75BLElNQPL3kUdCMtmGsv0PEbVczskMzhMLZQ8Iu1CqCrHPy?=
 =?us-ascii?Q?0uz7ql/6d/NnELO5LN0WXTVNXkbxZTR6/gfznmDHPfxM5JBEJeo9B9GX9cZc?=
 =?us-ascii?Q?VPRUq6yOd2gkZ4u9c6sLCoPZsRCPgiZr8dr9di4b9+sfFYFSj/6lcZVbkvza?=
 =?us-ascii?Q?nG+v+yNtJOA5C94WZO3DXnTgT2Jys9YZ7cDu9xQN7gB+uaO1o+Sc2GGwzPAD?=
 =?us-ascii?Q?7D8W1/ckR6Lxww2gq21CGaG5W/XD8y46vhdBRfQGdgFqEP6QaWdNtUhNBW87?=
 =?us-ascii?Q?MP0n5/mP5pcYihS/5YnvSUKYqnlhLz80/fAlKxxmKhIM5E9EMa+StELnVkIQ?=
 =?us-ascii?Q?bmF6VdHq+RiQa/i7PhJDW5Hr8WxBitVANAdewRU26D86RAZCZKeEtcLwJfrt?=
 =?us-ascii?Q?LR4v7rDlwHpvapUZbnvNzDhuAmyzRETeTaebSk3Q2GXYiMzlYqrTIA0mho7k?=
 =?us-ascii?Q?9Uo7UtA45r1q2oV1iMkUq0X8iom2ij2Eya/fD28EH1VNEUcQbeaTWqoDG/nM?=
 =?us-ascii?Q?yBpdaoR+H7rERB1ldo7IztwfmGHroLUpg+uJltpXekjWehaDNVycdbt1xyg6?=
 =?us-ascii?Q?NILzKVrmyRCtpfitvSE2x2HlMJHL1wR9dpW4lWDGyneZCTbTeBISeajotUy/?=
 =?us-ascii?Q?xjeI9H6L2lAlD5hhfxOWG/12lziaLZ+I3SfZ6omf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ddd8bc-6227-44b2-8266-08dc5ddb981a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 06:08:11.1357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Riobb9QFsiDkhBvF7auSCrkmHMz4jSgUu5Dyi6WUYoRZq3MZBI+19ypVeqJorzhZg1cm1xr/lHX07va7ZbIiIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   5aa2a46913f3b979e8694a55b4fd496799428fd6
commit: 5e7a0fcf547e3b4f54e37972019abef8e78192a7 [41/59] ODROID-N2/C4: char: Add /dev/gpiomem device
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404161112.tinPmErL-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/char/aml-gpiomem.c: linux/of.h is included more than once.

vim +49 drivers/char/aml-gpiomem.c

  > 49	#include <linux/of.h>
    50	#include <linux/platform_device.h>
    51	#include <linux/mm.h>
    52	#include <linux/slab.h>
    53	#include <linux/cdev.h>
    54	#include <linux/pagemap.h>
    55	#include <linux/io.h>
  > 56	#include <linux/of.h>
    57	#include <asm/pgtable.h>
    58	#include <asm/io.h>
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

