Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C62A21883E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 00:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763772111; cv=fail; b=PtSQ/8ytuTuMVDkudT9lNxnRNKoWIhDX+vdAuUzbQN9xiKMyOCJbDRFFqJRVBN6H2UhdH6t0zErSM665/YZdnzMzs9k/nLb3X4dBJvlQQ0aaUNe+xBrNpJYP3ApmDOXYA8ehTxLWjJmFzqw4IbTe4lbTmDpon2bPQYpYCyHd1co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763772111; c=relaxed/simple;
	bh=iufaIWR5B5CMtOCXd0bbXlHjIyaA/CbFvMfL87zZl1o=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FVA2eStcDDe6ZWN2rRYpVOphkIQ4kxLG4YXpZEnLBbHQp/Myxp6mhWvu2A4PvnmTFHXCXxeUj7lTcRUIjA05TsLf8S6I9gZqFIg5RMr+7nyVoBtUD+5laakDaBKbZFxESvYalHFnRV1RiNuWcwQ+zKqCru99xMM0H+/5kdo92T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMXYE+DY; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMXYE+DY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763772109; x=1795308109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iufaIWR5B5CMtOCXd0bbXlHjIyaA/CbFvMfL87zZl1o=;
  b=dMXYE+DYeUySzYGiXVMBIoZosKCKLVNC2P/J2lljmUC7VmiKfY5WS3Vr
   nj2ObhkorhKe1drOdb/M81FXSJkXKJ5QER4FSXlXHyNNVot+i6YTJtU0F
   ccqOk+bpkfo8sXepPhpfbBmNFle85U/AudGjo0QUzQUTbG+ALIqC324Cs
   OPnMMzFEZvxEtSxfuHAxiTKwx36efMumMWCWkfd7f438IsFRirAso93mW
   txIkD4p+p4Jkda2EV5DlEmzNkFOZ9FTl+UZmknCus921qGEXzGeQ9kJwZ
   KgGNc+aLSacSfMSUKnnj6oqnVuAtcy2HItF+7SXsPRB5KsNCMUIuoG1eA
   g==;
X-CSE-ConnectionGUID: Rj8Zjms5QdKvEBO4L4foBg==
X-CSE-MsgGUID: IjcY8ixPS3ab7GG+V56RVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65953515"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="65953515"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 16:41:49 -0800
X-CSE-ConnectionGUID: 19uQniv4TBq/pJrobMDa+A==
X-CSE-MsgGUID: uGO0MXnvQY2PA24MvAAdDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="192603803"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 16:41:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 16:41:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 16:41:48 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 16:41:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVuVx3gC1eL8YjLZ2B8B+2AQlbaclGHE4gfoli1b6Ev0Yti+iKApOYaYDoCge3VOtbGq90sXJNRLOa9Wwc0Zfzi7BySfSOecRyFh7FAD36Vv1MjZk2z9KoMH3rlRsR7WS5Np0HzTuDcA1boXZjwOOTIUnAaajNe3SoPyygIZi/K2mwsqvJFjD/ubvTPnQXqcjYhzhESWye+DEKfwYHNJ5fVj2ItXgvOP/0K1QWl2FFyRkXIJyOQgdbw6LK6ae2mXniTkqqYif6959BaYc5vWqMhGLybl9vlpmtfuDZR74GImjpgWJv6Cl+/GximL8tPlPYGLXBeokYCweItDghFTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOPlXYjMbX8Gm+rIOD9JWIw1uAZ3A60OJyHDG+bLnkA=;
 b=vT5BQZ+4egkDjlTCZjYcGdz2vSny38kmBbtZXevDgnIYwhnPzWieDvS/QpORUjsAYmvs0l54pGST36xoLw/GEK4BBUVncS5baS35xaOJ5QEfw1JEmlpjdhIm5r/UFCBZ08R8iVaUDHrGgotEUDpHxPq9b4QcEvrzGWsb4mBjy7EF3aSK5FtBf1nsG2QpFeE2hN0/NIQzZcI/AfXvuPcCRcEDHApkB58qZ5FPfEME6c9RE8vBNeUHSAv7ZCUMEt7HC8BVCYukpom557cZ1+E1xZqlv4IhIf+6eKJcRPkQb90d+NEJKg08F1OhpLMrDFjQqM+OCYw0lm701xsfjRmDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 00:41:45 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Sat, 22 Nov 2025
 00:41:45 +0000
Date: Sat, 22 Nov 2025 08:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Ingo
 Molnar" <mingo@kernel.org>
Subject: drivers/media/i2c/ccs/ccs.o: error: objtool: ccs_set_selection():
 unexpected end of section .text.ccs_set_selection
Message-ID: <aSEGwejeD3f7lnUL@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|BL1PR11MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: 42be2196-e000-4f00-1b0a-08de295fe9b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GUsuDv09NjgtOTtbYkOiMg2yk5hEHXpDe7y2aEeu7zfeKAQgRVck2uVPp+R6?=
 =?us-ascii?Q?jdmoxciMnR4ZgvnhZhFgFi9ytBzCNyd0fooDSSCngsJD22+wRz+vr05obqSd?=
 =?us-ascii?Q?XF0j8CbYf9FUHfz+CaUotkeYjrYKKxQh9BYpXAxa3MmnH0O+MLAyz4ag7P9h?=
 =?us-ascii?Q?wOcY/ipgpesrCz0dBp8nQnZLHSD9bMJSyXLtS2OPk0kedTrVOz8sGGJjg8ad?=
 =?us-ascii?Q?D32tbowOS167IV9tFEGVDnjzy61pEDUAVsnq/J4d9ucOpZB7naKRM/K6ZcV+?=
 =?us-ascii?Q?KCCY23xhCqmvz7S9sVDtQei8QGAIgMNhShUxjJu3KmG+qQmfmgxbY07ne1iI?=
 =?us-ascii?Q?AoOG1DrnCUB4YHWasGbPvLU1OKW5wk+Zo0zjkSAIP0XYbx5e6tPJWZtUrKUa?=
 =?us-ascii?Q?57aOPQul4fjiKz85jC6K0cK2zz9x9LYCq4xNCMT2vK0MMXIZmGN2yaCkTGoF?=
 =?us-ascii?Q?xKogo2qgdDzmVVOzd3efkC1Mm8pEAC3hw8E+L/ZZH6coT0m2YwF0O+ZZ2p13?=
 =?us-ascii?Q?qFUHTB3ndcQ2WmYwt2xNQQrpyg5nVKoR3mnpoSRFvAC45rJuIiHa8lDIk6+K?=
 =?us-ascii?Q?ESSOR2sMqhUXyUZzK60uEeYwdGiEYTCC0HaKLNM/JEbCSGNNAgsux1hrngo3?=
 =?us-ascii?Q?TUGnjRJDsDXSL5OCE8JQulSoe+Ge0jLjNd7266U4AD9YgnXjhme9hRgtTDrm?=
 =?us-ascii?Q?xv2loObh0bOQRSZp1O9yw8KED6L4ouXquAmx+HWeeDfh8TdmmSw3UKR57uc4?=
 =?us-ascii?Q?EWaHnCKF3G782wpdXd5XdRAk/KeVU5MvjpCR/Mr12xuA9tRoz2YkHA/w/qwR?=
 =?us-ascii?Q?pJIuERIfgfV/GF57KDQ2gb3hK402CyvXW5QQ0AjRY5BvpHdec2lrSZsiKtuc?=
 =?us-ascii?Q?pGX3n66dk29HXbWnJl/4xgBPsCniOPxRTimPQPpdNipJhAYgcVjcPI7KFNtU?=
 =?us-ascii?Q?eIltdO3Ly8pyNUVWWUwi8hTduULpJQ1bHgkoVcjDut7mvlfs9EGl6JcFWa+k?=
 =?us-ascii?Q?3gMO34g6mClN43lnrt7W862pQ7T4tG3RdI8yE9PHRjlr/yk/q6fcvpe8egFU?=
 =?us-ascii?Q?UFkQ1ac/RlDyPtqglSXIA9ykMrq/i+8SjFdcIBgQdf6jacFJ6EKeF0G2wIWF?=
 =?us-ascii?Q?4pMwtseOgwJEilVJQRy9celKAFaAmtKFBfQonVS8pwVS7JcgN+40dRRDu1qL?=
 =?us-ascii?Q?VkOtjgtBoThvVPsivh42zmwpXFqqFx23Ifk6XR+WzuwuRlzzy/qD3lYlar0g?=
 =?us-ascii?Q?ybWwUMtJakZVfULYhFR/qa2U3oDYqzaixgXbN0qUiWtiBdetDc+Njwjh/Uie?=
 =?us-ascii?Q?F6YBoBIERH/KgTUNxshMlQBhmRP3LGmKRR7m4XIqP1zGowD3hAeWsXQQ72qZ?=
 =?us-ascii?Q?/yYiw2Vtn0cJQm8P7W3GN93O3oooBmMFdkW1RGT5XEjxFdby09nmUUXLUDrT?=
 =?us-ascii?Q?TuvpmicwOhFnIv4NmI3WARueO06JxseqGK2ecEV3vVz+jjvYBuiS6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4oF1Wb2IqXqnD248cxwB2JwnBnMhATkO7uq31oMJ7rsc+OOXOnBHw4Nh/LU0?=
 =?us-ascii?Q?nsUVaXRoc+vVHwfl8EA5LMMIShJyTg8pc4f24uqMNPe3JS/ygS0/onYqp/aC?=
 =?us-ascii?Q?G/9tjgZhkdvCc36SX29snTFxEL3EPxm4hNXGR1hoVDvs1JbflwuJ+2S5J3V7?=
 =?us-ascii?Q?jJ0uLbtLkr2TfkARdesL5q+IXG1zNPx6yEeKY/FuomxAIpxWVH6E+cCEaQP9?=
 =?us-ascii?Q?Qy415YVcZ4CamuLuBhInVEOQyr1GcWM3dFMphjT7k81fYmdATBcsvyuRH4wx?=
 =?us-ascii?Q?7AlAwySNCOUgjkqjUX8U90Vhq9zJLrc+VQyk5zLRzCjsGQvBUkQ7VmFZiyLo?=
 =?us-ascii?Q?I9qVmm7n8Y2NDGmmEBf3XC3t10drKClT0zOXSiLhTuXwjGchy6RRXAluzXQn?=
 =?us-ascii?Q?4xmavtW9doUaKfVO3nuyrnWiAQp6Mu48R47mcAsxzTumtPDSbepu14UkoxYt?=
 =?us-ascii?Q?GaVzXhy1gC2VTnC3Oaha7EFo4yLL7FrBcKglz6AoKhPFjlwEcgacuEkwbCLt?=
 =?us-ascii?Q?iy+BXV+imJcGzWJg0Ig1akzmAbz6qf/SXsN+1kN7xSMDTQ9axlmLs8DveUtk?=
 =?us-ascii?Q?Qtz/BvxDY2kYoWcjyEafWYbNnM1LqMUvcUEBFWXW56uAqP8nE6ZqAfXd8kox?=
 =?us-ascii?Q?pF4vwi4aNiZqPKYcKJFtWFVVchodhF7ZMJr+GACPXWsJGkglVs8YfaVWwkZT?=
 =?us-ascii?Q?E70jv6KxuLpzr5D8ykjmfF+nniEtsyAgB/K4RRpLqCGmlpw0nC44H2Z/Jrsx?=
 =?us-ascii?Q?f6LkbA31EQ0uSLVa/oXW6t9e8dtVe4NlAhPuT1PkewVOSzldyKvq6y7WyIF+?=
 =?us-ascii?Q?Vnj/p0v+5AyFLAtHCJmQRjGbJ5YjhJJzyl79Xj5jpJYu2v2JGUR61FZTUDzU?=
 =?us-ascii?Q?2tEwVS0JSzJRnJsVQ+x/VsAn/NVMCNLNcVqXzZgp5FT3N0+BjD8beTBzY3VO?=
 =?us-ascii?Q?M1R/Bsk94mB0+r5zi4GdE6YIX64u/xS6rsOnoPOltuYlzSL72oC3GndqmAJ+?=
 =?us-ascii?Q?K0OKvDDX7hDHZyFADtrPdUc+ynq8Xte39ZKWGB9/GNHT9UAQSN2MMF1tHJH0?=
 =?us-ascii?Q?0gn1SY4WdYQ44BP6TfFsb1onxviyca8EFFloCCSYIzyUg5I3lE2RJlUtbMzv?=
 =?us-ascii?Q?Y9GEspZ80ocDcpLemMHsEMWAxHUydOjBJtWZ/UumAokxC7yqGknPB4Gk6rF2?=
 =?us-ascii?Q?AYBfce79cGbv1UCoXQyguOii4o+WLR+mU+WJ9g6TntcAJtfZzHwEishOVtAy?=
 =?us-ascii?Q?7MwZoh/Ev4IdWYr7tNDJCOax6uMOajCSYFQbxruk9RFw0UewqrNn2tx9L/iZ?=
 =?us-ascii?Q?lJlqfxmcoFKau5B+4VvqpaEff/nJhJwAHH1+zj9kE5wEJjdRwBS7aPFdF6D0?=
 =?us-ascii?Q?cW71Iz8O8m1J4u7Ovs2SeR4i/0Zo69UE6y5BZQKFTJW4zPSYs5kOI63agoFY?=
 =?us-ascii?Q?Xx82MOdkGbmoiQk6/Zl5LSCcazsevyX6eYlnIbjkrEZuTaIO81wMHG1OfWqu?=
 =?us-ascii?Q?nR/RJWo6jy28i1AuRJBWwErWEBK5RASww1YUs/c1q8/OB6I2/tOP3n8kf8JJ?=
 =?us-ascii?Q?EW+XToCrEWOeD2DGz5BJeIHCGenvl18y0KFQVVORPvboCFNbdcsXSGgCBi/z?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42be2196-e000-4f00-1b0a-08de295fe9b3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:41:45.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzdeUYVh7BhRMsqZnVBfn+WiaQ/GFhCvhBmqAv7iRnhDsmcqyShhhRnq5OwLI675D0E/y+QM722DgxEjBYKZsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-101-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220717.5HHMLUHG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ccs/ccs.o: error: objtool: ccs_set_selection(): unexpected end of section .text.ccs_set_selection

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

