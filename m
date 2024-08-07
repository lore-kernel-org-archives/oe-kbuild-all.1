Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172201A269
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 03:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723002403; cv=fail; b=CjndRcJ4o9tdvQ+XqtD6L9+mRD2oF9YwnjzNv9dLl/Qe/6+t+cm5i3xAFtxn8+hdPfClhdX5Raqw9WUXU88+xGGe4pXLKUwS5X+O9LM7hvdmlzo9JwSPeP9zu6z2HCAlrbXH/G/uTq+/z+Hgh7PXKnFEsl3+aC7C/YAeQ223gqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723002403; c=relaxed/simple;
	bh=4qYv64SD3eG+RLT5DRYFyJWij6a5rMo6iT3qeEy12co=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WQkNm6Luere2kZvAleOzD1/cDLXh2TcQYZEcoHNNcjxYLHhf5CIGJ3LSxOJ14v7Y9qfKB2MyL3CTXHNkhOzPX12VmtTBwN6PGOQ/6AxQHznV2CJ9nTkHiPEVlA/3qBjqGYrwLQ3y5FQOKRlwMQ7IW/BpZb8BgWiyCUZd/vJzP0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qp+5V9SR; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qp+5V9SR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723002401; x=1754538401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4qYv64SD3eG+RLT5DRYFyJWij6a5rMo6iT3qeEy12co=;
  b=Qp+5V9SRTqpbAaeBAQVFsS2qIFYw/LI8scVG92jkCYzgZmB/xdRjemLu
   LlDG91/5krfhqflg/Ppb49zMMnoGyUuS+iydQw2+5mYYqrbIXZsY5ELXj
   AS1ay3AHISlu2+rDLTaPm49zPayJpsi9pkhA5CC81ve7nAoOs2/2d8QUh
   w8qIAbHzcm4UkAz2KOZ5MkRPZfdfxNcd6lvT3kY0SnnmkpvbQOWryCXfW
   rR9yscu16+l9De+VAI0SJKQe/rvPQnevTZO/OZZTpX3xUH2QOnwk2aBBS
   xUe7zrLU47hNh9Zj689vzeReosuLHx7p0sG8OSyLVuZVjGO0e5qgy4Gy5
   w==;
X-CSE-ConnectionGUID: 7YIyHXuRSh2Cy670cQ8Apw==
X-CSE-MsgGUID: cVhU0uOSQk6fReu1w47/uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="43577520"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="43577520"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 20:46:39 -0700
X-CSE-ConnectionGUID: znWDaWd0S3K8AdPI7yqMtA==
X-CSE-MsgGUID: lCbI5S/dTKmfXvrt1wW7Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="56789554"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Aug 2024 20:46:37 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 20:46:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 20:46:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 20:46:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VX3/7RaG+BYftSEBkZ83mKxSgjtXdS6pJOnsGAI2J5XAwJEAPwOjxkNU5XiaNniyGvgsnFPAMgQp2Qw4i2sGMUcJN6kmgWGR2YhV+HQ8ABVkKTUX9p6SdBiC47BUehJ8gMBlXut7v0hPVO3OK81d5xwGlImZH5rL9WoRGdzsAU/9wnLrPQUaBrtMBeDFdTrb+h1Sx432nOHJe3Ma0KYulHCDmmXT9aA5B3ouDRxoL+NijjZY/EoL4sZ0jVcQ0lUPnN91AbLqv2fjn6YfxeL6lb+mjzFnZflbMwivovQ/TZaOgiPuBp1mxKY96u05mePu2skMyb42QOIcGXPb3oq05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciKwXvXHjn7NuzIgZwOn5busP0/urwjhTC0G0GEDCRY=;
 b=tTUOeCrszBrhd98oCKLmgOSklCiTAzhpI0E87QOwOeQYAKLpOiUdurJn8NMC5ylq0l9QhQThWGYkWMZxf2CboKsjpkCzChy6FmeFpzeASew43Rmq9+OCFgSuY5eOKet+xCvHiaEZbuoF3oHyY9m8w+e/p35vLrgAIORg6Zppicl30ACAEVuK/hYHuTMpM2jV4juM0GJIiZFlX79DgqCC2Oys2Mydv1lmIvleO2eKjgXGdJOZxo0QnSMAPDflKL/S/CJco0ykXH+2VQtfZM9l/LIO0oO9oKkVZKM90yaNGg6qQ62Sfkqd5Mkpv0plH0k3POvLOlUxK1LLACGCLmTkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM4PR11MB5278.namprd11.prod.outlook.com (2603:10b6:5:389::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 03:46:28 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 03:46:28 +0000
Date: Wed, 7 Aug 2024 11:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [khilman-omap:lpm-v6.10/constraints-tweaks 3/3]
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <ZrLuCzBLov4ncgPO@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM4PR11MB5278:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c55d45-1748-43fc-5076-08dcb693849d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rF/Wbjhvv24HenokuHY+WqiW23vMo+AH1pIRgAbxneqjGBRYU2ZXc334zNtp?=
 =?us-ascii?Q?70IQQVGcHWgtAd8bxl8LZtC5NWGBaKup8k+qEojjoCWXscFNMHF9n9NunRBx?=
 =?us-ascii?Q?Vvq9et8s9yr3xYs4Fe2f8avNR8LGO1JagVGLWp9lKp6mfWOZ4YuJTayS1+r+?=
 =?us-ascii?Q?/k4N6knpiztItcZlO5WDF4x1Sdh4/BD4zJVzAS895n7ohPQsMgTMFgAMl9Z9?=
 =?us-ascii?Q?nI3y7KpClHwCpLG9Ctr+4SMzWVBQIio9ke35/XFDG+34QP08z/GVmnv/glTb?=
 =?us-ascii?Q?YQRz8dfKPrBZeUYJBGzEd5FFO4DJgtqL+ElTfSsXbfjteeSw1/KqQIEUgcmM?=
 =?us-ascii?Q?N21crxEUnyjuBG44fm3SOyNbC7suOCLRFQ1J6LAL1DvtBQjIBNNii8vA7bL1?=
 =?us-ascii?Q?BnMgNZmeo9m87LxmF0k2xLpF4EawBGO2cJZHEyNXX1oTYkvspSsIsMpxmfqf?=
 =?us-ascii?Q?QM6YxwJt6kJ8RjtR2lvD/p+yU1AFe3ddU1ofFRK9euYO4ffUuS23u9ja16xv?=
 =?us-ascii?Q?zNkBwG1tdwDU+Dz61IQaGiHqQgwLIMh5uB5gV/TfhJqqGJ2x0n8HBWoTy9w8?=
 =?us-ascii?Q?3Cw8Hm4Ooi7LV9DOrfbclCE451wODH/jlPNeBIlngLsuDOgblZr3MWgYl9bt?=
 =?us-ascii?Q?iQBZX956eNPgr62JcdNFOOyKRrE6Cexl3QICA6fSidvbrXfMGNPWt94Zgmet?=
 =?us-ascii?Q?3nSVWHvmfWOYZnvUsXppgB/WJRhstz30o3wrouNbHls4TzDoYoCEQsmJvl0R?=
 =?us-ascii?Q?KLIEQrlYnt3TwcG/aLQlouNICsklOSfcmbAI0dw5lJnaS67fSqjfqpX5/noZ?=
 =?us-ascii?Q?M0f8Vzm522DKEfX20ZcT0wmbiL90K9Nrtz2Csf7rYf2QcHdVeygbnMGfATSf?=
 =?us-ascii?Q?RGHMLJoibgAH2r6dECooLuUrxTAZzrAnMptEUCDduWSgfdutHS4+QVOZ923X?=
 =?us-ascii?Q?47AW9NyQYZE4N/9z7VM7Drn3oXB8IyZLLWWhnB3xNUPJvENDAGPfEi3ooY1b?=
 =?us-ascii?Q?qYMpGNse6Bb84x8xxYZgIuGV1TzbOI1ppe4uITizXHdro/70TeY4l+aX4/ij?=
 =?us-ascii?Q?kr8+CLJETFDH4/iXaTNB6kXfeXTBUigdPN2i1tI4MEOIpeXRuMjHC/HF/PDL?=
 =?us-ascii?Q?jBbaXZQ+Gf8MS2BwsSFu8DOkuR70yQABbUbgP4lhVuXzgDGEOPUVAq9Azfy6?=
 =?us-ascii?Q?kiyE5Wg6A7jBwYRIu0IRXvig3ZO/lfcSk1TuS/hKR3C53YY/qH7AOjFbHeLs?=
 =?us-ascii?Q?8l5pBtQNFs+jM3qm5b813A2k7bEpW0huMUbXysr7eh2fclKGAnEQdkt1scf5?=
 =?us-ascii?Q?Yu2s4Krxgz4pgZRi/yxFtZL+z76CtSyCavCFx+YY2T43aDWyIj8brMH4UPwm?=
 =?us-ascii?Q?EK22x7Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?naY1iD31KRDrjo66rad5SbATsc1+/SISzrP35yk0Ptd0550Tbc18/adwjYDN?=
 =?us-ascii?Q?dqPfY9guMx/1WzWCR7643+/6RcL2M2k1ZeJMSkzfYvJjVCtfylj0wUgdTMSd?=
 =?us-ascii?Q?v83zxgmfLY4zq7oeS7e4xA6ZF5LtwvnADNrRQbhNJHyhuWBBL5UfAPBl7WbM?=
 =?us-ascii?Q?DbLfqpJVRYlm5o52oTo9JFaL/DzvDGbjFIBLGEXq0BONMG1WR4BjtCQ+Dik6?=
 =?us-ascii?Q?Ocbv5v4+TLkEmnOmlNK5TNrKkm1XP7NZwHCwkZb2Hp0x7X4gSyEaxWt4tHCU?=
 =?us-ascii?Q?pzoQPfkYzREJDfjmj8O2wIdAAft88YdnKQGqtYghQJJM/WJqMCFXc26WPd2P?=
 =?us-ascii?Q?JFUi2vFgMA4QL+QXe8cBKH8AuGR4OfB4vp+fvbM4dy/sJyPLRyeLtwKr1rMF?=
 =?us-ascii?Q?Ja8U3X+ea4SwPM3LMRHgoz77HYrN91gUIXlZpNfHGgvwZjknB9h7vIjkUMdz?=
 =?us-ascii?Q?U8G1CZ2idGL7jlr8k5K1BZ7dwOFWp56AWjKNkMvgpndwF+bcxWYqfN4cspeB?=
 =?us-ascii?Q?keRfkjtmp2+0NCYiJAQvpCyTLrCMYwZcc0oasx8QuNsC8uC4FKuod+JFyuuV?=
 =?us-ascii?Q?z09jFS1lY0ZHyF/jshxAtVyFzrvcTkqmGj9RTZnTKfRfbjmJRaB8eBpn24TM?=
 =?us-ascii?Q?+DTdRzcR42tn4Qc2YmQrVrp+vqz1pb/sJ/WdiQSMZu3ncNlkekowJTaz5SYz?=
 =?us-ascii?Q?W7qDHeEH3WnSCU+3tDFg+SDcHgMBjM4Ckt9f1/bXAvmOc8tpBKkVVxnNe+gs?=
 =?us-ascii?Q?aQtWSEoWBZ8FSt/cnWKhkPJoFd/xZrMOSVLFKfBb04yxVI9a08TMVYtGKc/d?=
 =?us-ascii?Q?3pR5Um8rtXyCYq0jXIBeM5CcX8mLNOFxErRjfWipews6fMPtjAGPUsiC0gFO?=
 =?us-ascii?Q?XF+MdfY6q04RVDnOyzhUZqzoSCFDepRqW8qkcN4p1hMkCR5tZzTPA6LKAQrF?=
 =?us-ascii?Q?7UVZGjnFpvNfoYBsNUPU6xVeaz2Ls5pUJUKrQANrWkt4kato83YLUMCPzfme?=
 =?us-ascii?Q?4I7xJ6BfOeXu0Vk9U8ngpklA75x3Yhz+V4eJ/0y3MpxoGgc4mqgz0ooz1Kpb?=
 =?us-ascii?Q?iqe66NnwxhKt9GoegOfQY48P/gx/lLqPPD9GIT80GEoB0OqnFp+98bn0ELDQ?=
 =?us-ascii?Q?mM2M/mu8/4F1IumVc44xiF5JdOKPMoe7WYKHQpEbe3npJvK7bcdaWYvjVYtR?=
 =?us-ascii?Q?W/ahQUxDXhavBblZBm7QFO3sUzA93SR1nDUqNa9gIhO2C3+qJXyhli+l1HMW?=
 =?us-ascii?Q?sVcc4x5VWZefg/RrslrtihOjDpiFgHjX1772k/51yGYEn8scMQ5HfoDtNU+S?=
 =?us-ascii?Q?KzgWt201zY1l5hR7QPNSvyw1DGxNrs+vtcy3xtErNY+zHTy6+uXoBdn2NtVm?=
 =?us-ascii?Q?P8AWajZAuQxWwMY6PpILsS5A8NLpc7sPrnNA9PxcWmoAD4Uh+Gw9/dnyC1TT?=
 =?us-ascii?Q?ibIT3q+VBLzkG0mWEtryBAF3/iS2hLE6KsUaSvvWse6udzJ3p4UqAHjrFUhB?=
 =?us-ascii?Q?FZoshcgmlR4RKw4UDAqdsKK5QHzhUJTsRUyU4kwfZTt83ZlFyN+CC6aLejM4?=
 =?us-ascii?Q?wVuFryY3G/lnXfMfubApfwoQ4Ecj6+KcfLwdcaN0dYPOWIK6jJVusB94+IUk?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c55d45-1748-43fc-5076-08dcb693849d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 03:46:28.6595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDx6uxZ2ZoPziLG6EQVWYNYpjmNFwubvW1kyf9WTt3+VjMgY1Z3IOv8gnItg03IDbkWgVfGAyu88J37JLtmhVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5278
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git lpm-v6.10/constraints-tweaks
head:   9e022011507d3f18082a0539c1de9ff176e24908
commit: 9e022011507d3f18082a0539c1de9ff176e24908 [3/3] WIP: main_uart0 uses dedicated wakeups
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-051-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071052.eel3CeSD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071052.eel3CeSD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408071052.eel3CeSD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: syscon@43000000: 'syscon@4008', 'syscon@4018' do not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: serial@2800000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

