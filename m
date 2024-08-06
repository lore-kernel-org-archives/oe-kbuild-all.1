Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D01BE228
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722941074; cv=fail; b=s2H9R8DrIIfmVqj0ARtuaJEDefozCqrz0QXD2ob9+Ghd0OYuZ235dxUJppPtZ/RZHCd+hp05xiCasL27JQZFcaXYZkkhJ7P8jJaYsamXXca3UGwTllsOiJPnib2m+CSvvJMsUUTYx04/qKFsPUQ/48EzjzYZWWSqzf/rFgsIa24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722941074; c=relaxed/simple;
	bh=D18tXNi0Kmi95DZzFfY6rROHYOEC+KzZCZiIFmR9SYg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XA6Ezj2NrOwrO0QdvyDzo6zqLhiYiP7UNc5gY4CCN+0ewgWFVPeqqlRh6vakiKqwpPckl61jN7oosv/87hP4eV7Vg34xByF5tLDewerrHybifS0r5f/eNcQxAsFfhgnQdxkkP4ZBGbX+3z1uSoRPh1zWhwidTsqDQ8CSTSLv8/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWY/CMbe; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWY/CMbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722941072; x=1754477072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D18tXNi0Kmi95DZzFfY6rROHYOEC+KzZCZiIFmR9SYg=;
  b=VWY/CMbeqDSkXnPakNeaTttH6NFWQlLbwaaPMQbPNG+S2wi2M7XwRZ+3
   7/JYr4tuCFkqmVrWV2i18SI0/sPA0NkxEwLC3GmKZvbm5hxtuYvD3GjR2
   6Q3dqrwB/zN5teNPCIxiDLza+Y5G5aP93LcjigXg2KPFDTL16dETOVKGK
   70zSSQv9tr8jWoGT0ReWEQBN1er9SQwmVX5LzVt2EZ+mTh6vzao6bh0bm
   /cfFd7ZiHwaDICO+vbejj9D5LWdtG98GIO0OQxT15D/GBNGdqdZf1wWqV
   qgsv6dkS3147GTR/wBuAw4xmshh9Bk6p0PHq0IMwdMWpIT2Ihuf6TcvWd
   g==;
X-CSE-ConnectionGUID: 61AZQTSuRMWQnEI8jVTJ9Q==
X-CSE-MsgGUID: 0mCv50ZTSk2gY1+A+9LYww==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32330264"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="32330264"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 03:44:31 -0700
X-CSE-ConnectionGUID: 9gKfFI3FT2+4NGZUzAQj1A==
X-CSE-MsgGUID: 3cI/1dptTSyQOXKKqq5KyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="87091641"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Aug 2024 03:44:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 03:44:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 03:44:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 03:44:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 03:44:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIRxBdC9DXR9ZMkS2g+ELAUQHWhw72r1iPi8XM8D4rFFxnecHViChBmpZxMWMhtgnd66mwsjwNUeMzwE19PyQvPeuFtPxx/hr+eFTG9f6PJcbANil8p+YB+/bndhYnxHJ5t9WjeNAX+GTt7m9HjXSL//G1Id1C1YXoqKrzAhXul1hNwJdu7gs/WVgAQqyK6h1seZcA7xH6pNrSwf9Feoyvt0UxMS9OAOfycaf8XAVQV2e5HNBFKsEpL6B2Qc44NBgGCwvZ9PPH6sEJV9UrC7YZ2xEZVBkcZKO5Hd82d1Afe5UqM7IphSEhd+m9/h+gTAMgu2JK8KQj2AtzdANhf10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqP1wtIH0sOPb2nwXPt7G3txAJ6fxCXK7ZgyqNu3+fg=;
 b=VCwCDSzd2HkoRcxMrLzs+L0HVQ58y+4k7PcWI96S5kzEzZ15JJkoupaUWgAKW1tDTJNfO5lwypK1g6n8yrihdM2eE1Qya6VjBqya8vdKXPKL50908QRap1Z42Tk5lxDZwBEXRffctxzzhH/gIsybjboAY2LPDzKbmauWHoDH5kDdJcJXSgsm2jBRWoKFqmNJi1hXiROtZHExpcblHnBef20cw9rDfiUsc2BGe0MPuQ+DGmoM44Pfm7R0uAdWuGrIhYFpOtjSUSQ+2HBJhXZUEQdeDJMGYAVUkpzGexM29sreP6Uc84oTYGfcFzda7yjVTaKq8qcvqykQ/ueGk6xVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 10:44:28 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 10:44:28 +0000
Date: Tue, 6 Aug 2024 18:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [robh:cpufreq-compile-test 3/6] drivers/cpufreq/omap-cpufreq.c:
 linux/cpu.h is included more than once.
Message-ID: <ZrH+hIAIeoh8a4AP@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM4PR11MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: b78b5ca9-6864-4815-796a-08dcb604beb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bTGUWHzxfR4VJUKpMgh/ftx9hVdhtX2rQUF9O/dDhHJNA5BLDtajlA0gegPg?=
 =?us-ascii?Q?nEfvIoU2z6i64MBNspRqTn/BmNJM+vlLbU/6Vw8bHGo1cO000kJ+I60uf5g1?=
 =?us-ascii?Q?+tvIYMK2l1WTJF/FEmyt8gPGUnnCFdjdOteuj3ex2Hcy6VPnpaevM2xElnMO?=
 =?us-ascii?Q?LXdCx+nGQD409w8zJNhBcZn7S2NysdFoqHbVbNav9TV5pdDaWcjgh9Ao+Wce?=
 =?us-ascii?Q?2/RgkRkAEL/D4PIzn2pa3BwMtn5oSkPLS+h5NGvR9YiGWTPc3pPPPztOEmfH?=
 =?us-ascii?Q?i8cJYiGPp0up11bA+e33mDyMPQr/+Rw67MwfgzoToQDwWdXAll3/tHY6FC8Y?=
 =?us-ascii?Q?DYFPpC99LYwtcKH6HoUebfsTlISchoS7crjL75WrO6vr132s0vs2hkngFPrq?=
 =?us-ascii?Q?3L0UpNE9F7bYQRqx5nZvSIN6I9dEDcLUjgcqoTaIeUTEXm5iyDYSO2k/NbTc?=
 =?us-ascii?Q?y6y+RTqmiVklA3lxVf9vGeTJbzWCZ1vlEDMS61PfpgYi7Vjh3CZ8SECtvRnr?=
 =?us-ascii?Q?IhLumWCdfXU4SP+6t5fxf0FAV9t1eVXuPLLo3lsQEBNoRf59ECYLZMoYrL0N?=
 =?us-ascii?Q?DTqz1p6eQP9QaHn36QHfDLbtlwo91krI3r1uDKh8pD1snI4xKX5JuE9/r3aX?=
 =?us-ascii?Q?vUjdEiGC52A75y/M2N2xwvJEYC4GnznpHqfAFJwWmeSTGkpjZR+2BxA9Rymr?=
 =?us-ascii?Q?RMzb5bmiZBaAy4WutUpULURaeCuMdpBWINf5x2z7vWhplNyLgZpi3G8YBriA?=
 =?us-ascii?Q?V68WtD14SPjzbHl43rjtr9aBIZvx8LTYAAgmz07r2bB8fIK/HiWv4CxbES8K?=
 =?us-ascii?Q?G8vcLNaKiFjx4R+Iu/mjtM3L9/a3skSV4ogyEpddmZXYOQVZAxz/iSOQBpEq?=
 =?us-ascii?Q?ZX/b8ESbq+dTCuoYHuoal16hIn/8PzC4mYTH2O3AcX/ul+u9SDO+MJO6TRyz?=
 =?us-ascii?Q?rNaVfpzA2haJOY0gkch4eqWahfjkNQezy6CiLpOn4VeAAqUnls1rXCbF9Qkp?=
 =?us-ascii?Q?4IZgG0oflLFaTCBruNW6zK52hVHp9JfyTTDoq+W/xxwRvoYfRQm/kSssX6LC?=
 =?us-ascii?Q?6FtLdke43j9XRSSgX9/cSRaGpxubtaAUmR2boS3m9yHTDfCpcYlcY1y+vokI?=
 =?us-ascii?Q?e+d7B+gom1za1VxGnrfUJE5FlvHOlcFa/l69CKqsPARYCatOvLgezfov5FCE?=
 =?us-ascii?Q?+n/AfTeQRygOtNzwYKIDVMk45ar4dvNj3kVoPZ8Qs+AXEC0sjcjREzvB6XDd?=
 =?us-ascii?Q?Ms4kqweEvUD/5Cd07gYcejuUl+l6NJezB9cwtDOkO1aHgkJk1dxyD4I+LSRG?=
 =?us-ascii?Q?MppcnZM/P1An1jMx0iF9zpwb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h8HfXWqmWtesINEe1QNJdvYMnv3W0d23iKUYe9B0e7ahc8Y5fyManIjLPXMl?=
 =?us-ascii?Q?PvMrTyYsDz2iscXqF0wgViTDrMHWRtDq9Aot7+i9aG0NVQ0YQjdS0f59VmyY?=
 =?us-ascii?Q?8YHn54P03KAj6sdyjN5Y2Y2j+EqfesN/cjwKdTafArsrSLh6kNzs6AET5Jfc?=
 =?us-ascii?Q?GWpQsDongFBwa+msUyaGw+bGHgZWjPYyDoliZdLlsn0uuyGpmCVNMWEh+9M3?=
 =?us-ascii?Q?NuzvZaZvGRDYA6TYWNTHy1LN76Z+TWjAl/0Eqyp1fggGMWue2Pu4ic9Nw2TL?=
 =?us-ascii?Q?ylBeJeUrALhTF4wPvPaESQXIooK08a5u6XV9hXBKf85AI/U4a+7nTSXV8MqM?=
 =?us-ascii?Q?O5AliVdkWppH9naBINffL9htyeX5gRtVUN6GdHAeDUxUw6vZJ4zesuj3p15M?=
 =?us-ascii?Q?g2FtcdSKT9QFD5yHQm4JFbMxJ6oSxbC/3MRAYxGk+5LBN6cgjIl8Jpv/kGtz?=
 =?us-ascii?Q?RKxBPhW3VqoVDSqGwM8qUJ5j9+ESNhbL53FOg3ZxF9loiq7Ojcjl+rQ8BerZ?=
 =?us-ascii?Q?eOaDUOrUxGrWYJsAIext9tXZrCOzE5EFTgsvGSN5Y+Ii9ZqIAM/9XA9GH4Jv?=
 =?us-ascii?Q?UDREQXL30v4AKHZVpWTo/HOTTvroZkSm6rueUlGgeEwpbEJJO+tYl+30Tho+?=
 =?us-ascii?Q?FAkQeO/wSS6hhyE3yLMiwV/L4g3PtZ1l2hEXDattuAQXXHvo57XapwStpYzN?=
 =?us-ascii?Q?BonNcrAeaFjqWRcbSXT+kNAr//HDu3ePBWfPrWO5Sei1a1tVBJk/XjWws5PF?=
 =?us-ascii?Q?Tse8cq7ZLAbrmynhckabS11OQxJXC8hwNEeudjfkildU5J8wXBSN/zepD1ue?=
 =?us-ascii?Q?jhj5TBdmrBKSMBG10utjJYGf7UvMYw5UxkuhfMDnEI3xm5cQBLcAeZ46tY8M?=
 =?us-ascii?Q?/d+Inx2zsUJdKTWf9tUEq+Xj36Msy533nVCcOCSqzJSHDo1zMVeKsSCk2AkN?=
 =?us-ascii?Q?MGpyxL9Y3gM7qmH+SZ1rl0vo2bEi8uOCyGGP0JUkPsj6SVELG/a1y5ttdAir?=
 =?us-ascii?Q?Rg7B/cPnv982P92vD2yTerbYxxAtZ1i2pSm4KA5e3TyvyHtI/PaIjoHkYLP/?=
 =?us-ascii?Q?S/WSG0OkV3AbF30C1FS+UkmchUVcmV7PC8QIw+Vfi4MpMNWVtNt7X1JanqN5?=
 =?us-ascii?Q?qBOl9OlhDzcIE2AzCEL8HYQfRc76pUd8q5cew1FXzKqTVdVrh6MBccZBeA0Q?=
 =?us-ascii?Q?fp6X1MRlbnf1C3b+bZmdbh7PR975dl3YRbbi2ph6Wdkjc+Jph/HbifcOCStO?=
 =?us-ascii?Q?ofUeCLg7i1b8hJoskGRZeGVKLPvjB8/NOsZpbLmYqWGKEk/sGxTcykMQ38C8?=
 =?us-ascii?Q?cpk0gu501MEMjvk/2MzKAKe4AkIs1M7DZ+yIx9lVBNAmTi0zQJ99XlegGU0q?=
 =?us-ascii?Q?a55tU+8xB9I3/zPk3Ux0jYbFSsVOWGgmrbEs2xgmg2VsJbVttK/+m/mE7i5C?=
 =?us-ascii?Q?YfRFNldivVPOj+T1XjNZzy215g9z3jRqYgCdabTwdIXf6jdJ5nXq1r584hb7?=
 =?us-ascii?Q?VCV09Iem1H41lJVp46nZbmL0scvRKzpAXlSM36gMVIewURfKqWHQq1bqu/s+?=
 =?us-ascii?Q?McxU3Zc57NxV4LmAO8l3NXWj6CoStESBwZ2CWgcY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b78b5ca9-6864-4815-796a-08dcb604beb7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 10:44:28.1129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: na6W4FAKcChdcnve8GMqcv4WZwS9M67muEKMSzg9HjAAZ4Jy3EtbLgnGJNRxf0S22egQYWXP47pI5m8c5S+ivA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git cpufreq-compile-test
head:   51646201e21cdf40aad3925f7742a8d2ac727f43
commit: c03f7c269533692f7a8b6058613adcd17381039e [3/6] cpufreq: omap: Drop asm includes
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408061738.zVWNWzJq-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/cpufreq/omap-cpufreq.c: linux/cpu.h is included more than once.

vim +19 drivers/cpufreq/omap-cpufreq.c

    15	
    16	#include <linux/types.h>
    17	#include <linux/kernel.h>
    18	#include <linux/sched.h>
  > 19	#include <linux/cpu.h>
    20	#include <linux/cpufreq.h>
    21	#include <linux/delay.h>
    22	#include <linux/init.h>
    23	#include <linux/err.h>
    24	#include <linux/clk.h>
    25	#include <linux/io.h>
    26	#include <linux/pm_opp.h>
  > 27	#include <linux/cpu.h>
    28	#include <linux/module.h>
    29	#include <linux/platform_device.h>
    30	#include <linux/regulator/consumer.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

