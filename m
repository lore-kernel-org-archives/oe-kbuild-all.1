Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893F4165F1A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722930960; cv=fail; b=CBK1ZjePC9xclDJ3PQRJ40bWLyTnS1PtEIrYWbXqEHhq+CnI8KeYT3Rc0EYfrtWXjP6ekYCDOob4frypIKlF+OXOqk01enG14R9zZudHZfPXavfSyq6i9VnYEHmJyGQR1iZiqEFEIAvRe+PXJU+MKXTjQTIRPxSUfWQBQFmFN1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722930960; c=relaxed/simple;
	bh=h9zFvQHgZx3AeD6r+xy1LuM6DnjX4XD/X4dSKNLFAWQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=MKFQf6UbfLYAfpsVch9Z9wXDS5vFqi+3MXkgm2m6wDlHJvmYcO36vdO1/2X3wIdOYOEY3Cnyg/iZj4t/d+6PAPEwZZK5nUWkgkU9z6oggrVc+R/Knhn9FwEbrSYzdSjZKY7Lw1O2b+YNGaard6iuo3esWQDkvctCqf58RxVHeWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPpd1iOU; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPpd1iOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722930959; x=1754466959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h9zFvQHgZx3AeD6r+xy1LuM6DnjX4XD/X4dSKNLFAWQ=;
  b=dPpd1iOU85lgGozkP4WpwfD5KebKob63l4bVADkTKfEKL/xYUDQkDTCi
   HnaKa705H7LWqJmx4PUJwUef5WjVHK+WZNgP981ndZq1qxdD+DB1toG5B
   EmatzStQqMjdAFRBgJmqvFxCEUb1d56LmVsgKSYN6AG4h8iOrlsgD71Wc
   bK1TVcMuVHwUjcyNx7IFYD3kHf2Mhnr3gCbzDLF+gYvdA7K878YBq5E6+
   I7/W+OL37NEmd2Rp/BybNhUCc2LZCsKLJln8C6BZqN/VduNPf6NDhkSrQ
   0SzxrGBuqFEn/2FBGXBYAIZ40lJc6vKCDcikG/Y4OWo+2/MGOFuCJRQOR
   g==;
X-CSE-ConnectionGUID: QIrHoVfDQ0my1pbj1ZAGPg==
X-CSE-MsgGUID: eqEKBpYiSFGF3CDgEoi1eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20806228"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="20806228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 00:55:58 -0700
X-CSE-ConnectionGUID: 8xkBiw8eR+uuzHD6EgDfbw==
X-CSE-MsgGUID: 2yK/+lg2T+OwhaSlFUnKTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="56514105"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Aug 2024 00:55:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 00:55:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 00:55:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 00:55:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PP+FwO/iyj6+0ptv5XRjF/vpqQokVol+hq3z8lSD3dMyHr0UKCkvzuAh/T8lSfbg2awRau8dhd1Z2Eds5yOsnUZCNA/SVpVFfcIyg7VJYS28kGY15uipownwLo8ey9NdLFMs4vUKBEsZ7wMqddBAhPDn9/ZisEp3hEFNRlD1Ixva1HFpeRth8XUXjSnCDGlcEVDMmWHFooD9U5YJeiely+nkVIm9xb/zZbtmPtwx2PgVq/WAJzJ86uKJ0/9xGE5Ao1GzsQQiMr5Mu0DrYX/nt2WecPIhh+HxjN3b3BZddM12qjkMonsvLk+uTJTJnbTZLqm09my/xGvcG0pyEwPM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPmGxqM7lAKrYJeobVvi2iJNzO9om/qrsMQ/1D8VCRw=;
 b=mY41cI7mdyK85zldwQcCdEYVPeKhGzNoUU9PwNpsDvzn3iYThrNYYuSOXEnsYW5UQuujWFCSPM6IK10e3yIY5RHQ1LZG/Qn9R6KwrsT6Opmkq1npLMzshroW0Ae1jhotUedde7O13I7Pc1Q2CKGBVDjMaUbqBnlPfNHgclb1QfTqcL/HgR5vmrlaRLJ6hyIyCZCz04gPriGMoOg6db0HM8uVrc+e+QGnmXlnb0QVQlNqk09F0RIZsqQZJ4WEH18bnP4jL/jsc/Tz1AL2ZVGSxot0FaTlWPrUy/u/lDeMqkCDm4Jcjj/ycX6rUR0NxABC6n+Uth9xutdTbost6fCXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB8570.namprd11.prod.outlook.com (2603:10b6:510:2ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 07:55:54 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 07:55:53 +0000
Date: Tue, 6 Aug 2024 15:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [hch-xfs:xfs-per-rtg-bitmap-rebase 56/60] fs/xfs/scrub/bmap.c:
 xfs_rtgroup.h is included more than once.
Message-ID: <ZrHXAZcbYaYrb0iZ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c31807b-7c4c-450d-e6d0-08dcb5ed3250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CbTBKfA++M6VxetlR/GBjiG9NWm1mWzf5Pr7eDBfByjDGTRLzL3z32q52RV0?=
 =?us-ascii?Q?EVoX0CD4iDjQaOUbz6D3bHNApFxxMHGuBFR/EpAdLbwTgNp4Yld5y55z8zQx?=
 =?us-ascii?Q?FNlq4wjIzG3qWwGN63jP/7b5E271SpUL9UlFtT4kotntIjzsXSic0GwqXPVE?=
 =?us-ascii?Q?mMVlh2T+/L3Q1eGGK5HEcwkBpuyqT0wFw1Dy95KofjKrMtWGRFdEqfYcdQPm?=
 =?us-ascii?Q?KAY917InwDfe63q+HcOI6fS2kuOOwKDJWlB12k/FlHkL1jh+V58C5E4E9Pgk?=
 =?us-ascii?Q?mv4GGyDqya9WaW7pfDgkxQi1JgAJlGygnvOSeYNo+ruprujVLeV2sfNXUrLB?=
 =?us-ascii?Q?wLDivRBNLH+1Z2yEv7srf3CezglfwpDdc6kOSEVHR6bLOhuCvY7kO3Zwo2fc?=
 =?us-ascii?Q?6bCd39ufPTxDOpAECEHzApntZwwrv9oxcbn6+j+nD143PKSwCneupUz6CpJo?=
 =?us-ascii?Q?/etwYmRw1857sljxG8jI8osE5/hipDo1u4sHMbF+BRvOxKyD2cCddBAgWtzz?=
 =?us-ascii?Q?SyT3YsIXRDcllDaEXJboa/fZgPTjeVHqDaX9gqZJBM8ogKJHC6ofUHXwXyrc?=
 =?us-ascii?Q?3+nd5S+bbbnzaypevgrqos9TRqjEiv9s22quulwDKVv1OMNKtp+ogsqqSITT?=
 =?us-ascii?Q?0ZLBsqZjfeClnGLioxB2o6Mz9Ud7WCQ9NDuG/Kx2S2si3EhPt43lti0yWlXb?=
 =?us-ascii?Q?BhSIFzx9Q9muXPqOYf9znY3iybjRBvemZqzYCSM9Xm479dChGhgAjBR3MeaP?=
 =?us-ascii?Q?K2oTUnb2oOg9Rd/eGtVA0RHjl+YRaIOZXXVKBJ5ctlPSyYEpsA4pegwkHYxY?=
 =?us-ascii?Q?bSZXKttnovybPawbGBIfVS8gj0+ZDBbhuDbxZ12p5mXlxc0V/OklrHs4wlp/?=
 =?us-ascii?Q?QzaAO3UExrTLnJavV3Z9OneN7n7r/WLg7PtYytwFbT3VxVnZBn9aTzAorQ8+?=
 =?us-ascii?Q?Vv8GQNE41H53q8gZMaqwAWc3S3C0UqgMg0o3bkRTVc/ocogiBorbmw03A4zO?=
 =?us-ascii?Q?M2fASL8uNn3U1oOXIrOgcnY6S60W7jHoOGpNjAR0k4Y0WlIeMdZbuS5frioE?=
 =?us-ascii?Q?Llu3+tTq+ordGhhNyLo9b6mzyBFoYZ+zTJlVdprjgLbH8iB4Dss22ekp4HS4?=
 =?us-ascii?Q?6MIcdYOG5rLdDmNDlAXazHvKwn+ZK1QCsFtf4fKGdpcAvOlAOkIw8mtLUgVm?=
 =?us-ascii?Q?nOCDL30E1tkjaklxmQEkX9phkEtwx8LwH8QkHMG00eL9AAzSbqf+PYVWkY8T?=
 =?us-ascii?Q?WPunr+QovfNCqLdCHHvhz6N3W5V7ptClYVg3N0RF1F+HCJKucJzAxPWl/eK8?=
 =?us-ascii?Q?k+nrYtd60j6ABgrgQS2dzgOp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gyi2M+2E2OIKQ8kgWnVbppUkNc64itdSD9qIge6ZS10ydsglXcYa+3SgY8KQ?=
 =?us-ascii?Q?sEcNxeXwo4UvfwparEZ+mm5LNKcoUfCEQ6PrtCF0vPAc7BZSSVqjV0LunLid?=
 =?us-ascii?Q?E93kZtPOoB8HcZQja+Yms319d5YlxgErHfcM6+dPXDq2QGpxfrGpMjPsszdO?=
 =?us-ascii?Q?AoN0JkmEAY1qLBs6cGJ6XqvgJyhiEpQlaLBragE6E3oQkFnwaN9qKzzfneHy?=
 =?us-ascii?Q?BMa5LR5boqAjn+D9KiROmkpPT32XMTO6PNp3SZspMtQ1JPhqg9boaP8m9fQi?=
 =?us-ascii?Q?TWNC0kij01jIFU4h3zaUTFm7/Sn5XyZ8Lg2qW6DIcE9Y3bb2nqRu/IqFyvQN?=
 =?us-ascii?Q?DQtf5TdCik2Qhzn+ofQMJAMWaDJ489QIo+aSWIK5Xf+ZVZD6sR1yfJ9LatM2?=
 =?us-ascii?Q?gu3L7+8/XJ30K1SsaHBeJY96LqjNnZz99oP6KKvw1stl6bcxHycdutefHz1l?=
 =?us-ascii?Q?4InEn6NyqBUi4/WpwXwO6yRMvcLZwiper/S634ftxiVLSAa8UcE6m1qiWv+r?=
 =?us-ascii?Q?3gHZDQ7+9j3NyRnTJzVlSzZZSiHW5hTHfBR94+AHVnaxsoa2yKKtGaTLpGQz?=
 =?us-ascii?Q?2vlLnRgxfiBmUAdaB8XJij+DVsJ4JAtB9B0JWPnSnK0E/ypIbZZQDKfMPDq6?=
 =?us-ascii?Q?+jZ/BXiTHlJ+dMu3kjaYzzrbwS/aeOqUlOWHalBviesOpFUby5iNfgmEL9ej?=
 =?us-ascii?Q?LrhqvOe7/X8I0C73yBDITifoGqmsGi8GifqIuZkRq9MenFMs04qkHCyLl7oU?=
 =?us-ascii?Q?cZ02vUzKS1MyZaB4p5/Y6t/U41gXkJH1JisP+9yTYlLk7uEKfkODjzTwA0f6?=
 =?us-ascii?Q?mkb017IZzMxVqM6ibTRO3UYlaYRboYrEWQJkBR7OJXJl1AcOdut9yTbOpx3M?=
 =?us-ascii?Q?A+YrXBqX4bJ378xpnrBy1Bn+6pDDEdmKe3dyeeMs9pB1xiidgXGgcvKcKiBg?=
 =?us-ascii?Q?IQuoNd2PE2r99rjgQK+rjS1UTQH+WmUXpxSOqH9Pe6Y/+txluj36AeHmBI5j?=
 =?us-ascii?Q?/fW040fUgGqXVIjqQIHXi/r3H1n3nNUNHJTIBHcPU0JOtskqOoQBFKTyNt/W?=
 =?us-ascii?Q?LGKEyh0xLF6eRSC7zpzmbRa7YTVd9zbAdiSa8nZR54R/Vgv/g9kEfbS3IjVG?=
 =?us-ascii?Q?CROzQ8B3fey8DTfghQhlDYXLAdnjSOL21Fr+A+iZ9FbhQapJBxWQf8/lkd+L?=
 =?us-ascii?Q?7nE11x62p54OO+QdzP7CbyjmryDhvO7b5zjJmiZN3fX4PKB4h/hzvxd8xn4v?=
 =?us-ascii?Q?bIV/HjSuhiVuREfKdoNthlEcbhq1hDyEnk7zWaXqXXCT7TaPXvGB7IeRrPSG?=
 =?us-ascii?Q?njw/dcZsWkLf70EebiCPmkh2NJMrPg1sEnHR33aXpFs2H+sl+aLgJGwr/QCm?=
 =?us-ascii?Q?mNTkGQaMg71we/22RF5Wo0Z00icWngtXW3gWvDQ+DbbU5MZssinv5Zkenlqr?=
 =?us-ascii?Q?QTM807ZTslzfaZP6MUkquTE6xcSId4ekQ8hPRILw2SkiN8JdejFhNNt/dHik?=
 =?us-ascii?Q?aADeRaXucpr0BlvjkghVZEkGZtpFwv9EhDxGhqoRGsjuYsmDJJ4Ld2WZo7YB?=
 =?us-ascii?Q?KUGyhhxrr/De1CPANaR8IJRs2UebCMxCJWrgaiYf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c31807b-7c4c-450d-e6d0-08dcb5ed3250
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:55:53.7103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UeCbqVZ/2SNKyiy1mYKBifgDMHrD/SvGDIRtgG0IS4wFSHWpp4qaqZUDLeWiZ6HGMYc3z8ABN0FB30MP0v+sww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8570
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap-rebase
head:   556815df77c3443419163e1deccade141c065289
commit: b586f162ed8a92a3c49d905ee0b71d4eb9a3dc55 [56/60] xfs: don't coalesce file mappings that cross allocation group boundaries
:::::: branch date: 8 hours ago
:::::: commit date: 9 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408061420.OpRtP2oI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/bmap.c: xfs_rtgroup.h is included more than once.

vim +22 fs/xfs/scrub/bmap.c

  > 22	#include "xfs_rtgroup.h"
    23	#include "xfs_health.h"
    24	#include "xfs_ag.h"
  > 25	#include "xfs_rtgroup.h"
    26	#include "scrub/scrub.h"
    27	#include "scrub/common.h"
    28	#include "scrub/btree.h"
    29	#include "scrub/health.h"
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

