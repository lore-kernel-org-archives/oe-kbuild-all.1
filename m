Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40111363084
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 06:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629778; cv=fail; b=Jo62zRjnmIhZs8w7tbrJBD0hhwIMdDdY6rImY89VnuysLPMcLuib3+yxxBYIq0YK2Cvp1guY6nkI3/oGHBHcMtztG/kP7/yZ4N/52MAiJSDv6MIb9pj1IgKzL9/hidKkedCc0NJPlIVW2t9aQBefCiKKYiRCXF94h0n6IfTf6gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629778; c=relaxed/simple;
	bh=I8bWtEwvVRnUsrVr6in+/Whf8PVqN3pltvRxDxA5Z8c=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FfS0SZru5pPLwEZ1iB62kuV9DLMuzTwBml7Y8bGVCviCAZDQU3AxkllrfOlgubkswZTvI4OyAvoPB4VPDjoTW55jFX6FVn6Ajj905YVZ4WUmylLP3WE7EhFqnUmmJCmEcyNBIkH8njA6ZHKZnY6k4NKEwjVIZ/9BOuRi8NWT9Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBxkxY1c; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBxkxY1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775629776; x=1807165776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8bWtEwvVRnUsrVr6in+/Whf8PVqN3pltvRxDxA5Z8c=;
  b=UBxkxY1c3Jk5G2lKHPTkRF8cJ3wHrfJ98XnfIZdW+nf+65ovEdD58kyN
   t/ZXOk/S6E+XpiKdtP2l93rZyXRvtVXE5ECJuAtzdNGqEKecUlHLidGbQ
   8JjN4XaX6SD0eLAcM41wJWxIs7hrgZ/80R8Yt+TYo0UKh3zG6hBg+6X+c
   VuVnGGFMHFqfmmaHcAbxj60ZbBm0oceKdB/qFaxjR5PO577aiOsPFhZ98
   yM9MHogFaOfCEPzzeWwopqOKluOC7EQUidRS/sMANSd2nbmQK4mmJTEGv
   m7CUFn+ia0RtiJjXg8tHxauNyWfDei8fRsE11Sb/NY0+G06o4Yy3xabxF
   A==;
X-CSE-ConnectionGUID: AOkOVGdyTkirrMEAqLmlAA==
X-CSE-MsgGUID: ccFoc/hgRKyrZHLVdMr7zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76324921"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76324921"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 23:29:36 -0700
X-CSE-ConnectionGUID: 5r46X1sYQ8CIAANd1vk4jw==
X-CSE-MsgGUID: ncyiVScJSR+1AZr+KHLRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="232427155"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 23:29:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 23:29:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 23:29:35 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 23:29:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ7iPJxpdnS0UX+nUbHJvGMFcY8ShdfxxxHnK74wigxZXuCPjjg3hf/3AO1oRBuqZXKGR4ZUtSU8P29K42SRzY5POxqZZsFKT++4kRyXp0jnbh8Tm+f0WKXbbKlhJyds5FvzAqXWoLfwa0sAW+JRSPKzKjYkbpGu4LSf9B2psUWk6Xj+gFFo8X8GhOQ6zgXZw3iZZAcBsHuRnXh6sfNfOXJdu8pgLwEzcwhAV2kuqX4H6gcoeRL4/gP3MTWrpWG6A+u5I0/+XBw5OdwetwXzbeWNFMN5Q4swXSUc4fr1NcrCpB9zJloNZUZYBR0fIiqnOPi9IzoivCI2x2b3pyStCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX4cEXX7jR30cBnIr/X0DkV70dAfrV/zX6oJq8aHiAM=;
 b=nabIYNaMT9KatFk53f9ahGO+rO/h3dSLV1JVz20+g+HfTDgKsLqHhRyZ81f7iuIig5z//mMUkTuzSJIiq9bxP0FLlRfjIQ4ITTrbIbxJTbFiMDf+gcjXC4WWJjCvysvlqunXlFMvL2HejNAYo/vYhw6aG9RqkzUdd4VwVgoIs+xujO3WEJO7NSDKpJm5ciSNtR4se9s3OY5Qroc9D7EaHsEWFtru/aFxpgFmSDg7GgBS1lKgAy7HDWzdHB1HqH6CL2Z+BgCOzgBvnwIhvi1BlKcIEgg0H4ZJZnGn9uX/S/e1+b8UVvOpoT+l8gMx4eSayN+VTA7TO07p94CkeW9uCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by MN6PR11MB8193.namprd11.prod.outlook.com (2603:10b6:208:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 06:29:32 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 06:29:31 +0000
Date: Wed, 8 Apr 2026 14:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [dwmw2:vgic-iidr-group-fixes 3/3] include/kvm_util.h:1139:16:
 warning: passing argument 1 of 'memcpy' discards 'volatile' qualifier from
 pointer target type
Message-ID: <adX1xLJMK+rkq6vk@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|MN6PR11MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 046ddf43-7bf6-4103-9074-08de95383195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: JjkRr8NlC8wyZ6pdi7E0yGGfoshsM+wOP03gf2y7FEDZZF6fdVwZA/1dzO6bIC+2sRry/n4NmMdL6qe6x8ojknZcGjm0Krxr3lKwsRrElMJ/xfqSXP17yIxW1+5wKrULJZugOSOT4VSzDbyW4pzBrJhofpwHxWHgPNUd+0EFCzCMTu8TZSDpw47F4S2VpysC1z/8cnV8TUFpElpFjS1wE9y0Hv36SeTuC4VyY+1p2h5fK/kEAr8e655fHnw+QnxnDpfn5qopmJYorJjKy/fhClCjKlldj9rAjyURuYCW+44S3dHK73HfvUiu6/FpvCXTLrmHNYucnli02rvZlHekM/c97ruYrXcUZY/szIkwl305LIHi6Tl9kWVKrH7tTWlpjUfuipaIYDDqavibckPqCjwZyST8QGfuwSaZPGnG257C/GB0uMC5ipLDojeF3WStmiPUiiw+8xiVMi8NEOcGTaFEbUt4wmTJvdI9gLi/55Da0JQv3Rjnubmw+TmPtgHPdz0OETvo4xBD2dQqFUhHgmqI7X7gizSOR3a+WOIWlk6pNUUI9QADWHZUkDdib7Z0XB1XFNHFaL9BzxutBNfvs5p3zoiYu0OLJ7z6qAFK1vgiGCkEHPj7eBNt5eBaC9N926/YGs6r2gAdJPOy6sJCfQjl/YfWi6GppUhYQhMs5stF7LJcqoAIpXDs/p3RfqIUYEpVOtYpuIp0vim3d89sWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4IK1Q01ConchUrCkqh9nBQBszvdig7Tvk9o4NyFsAudZxMpt9/my4MOCmNPe?=
 =?us-ascii?Q?vCeD90hovhC3usxFHBCqpZmkzKDLkb0qok3DPBm9ryTuRGAaVNlOcm8bMO9O?=
 =?us-ascii?Q?e4IQJ06KhruLdt/qaVy9MvaDnL9GQ2YuGE9l0bKl6l9jgEf6148YBe0pYUDt?=
 =?us-ascii?Q?e4LjhCXENqnz9607Fo+XfkdBtuemaQNG0k/UPdWUqATuphmAnZ5tFFAUrf5i?=
 =?us-ascii?Q?04xoLzIEaBKKzPLyf5J/D/f4J+ZPnRFerXIRcwR1UMsCjEi10af9ozX58mUn?=
 =?us-ascii?Q?2E364195mUxtcxkJZAF3GK+AaPwiNHjfNFAaf7sbKB5HXypRTNeKRZnEDBEa?=
 =?us-ascii?Q?IgfKjfjD27r3y9ttQrybfuZr6ntBr1qXnhs8t82YJrVzsPhX0cO6EDoUxLdp?=
 =?us-ascii?Q?2y7veQucphz/2gE7UJ0RQofShwpuRUuyjQWEufHRQW8u+VuxsSCyNxiUuSqJ?=
 =?us-ascii?Q?2e9my1LRq6M20Vut+DqM0IvDEuYy04ay3fO5iM2sERMxabz5hz8bBtFuN4Wk?=
 =?us-ascii?Q?MPFf6zDBO8mbvGKylNBHa112LkMqgqyWLGZsDggJJiZzMy5moHX1Tvm3g3YK?=
 =?us-ascii?Q?dugAawuXqSON4bwGmYiMesX7WDASDxTCkAqlMuZe8rIiYX4q1iJ9BWjaKG2K?=
 =?us-ascii?Q?fBYy2vgbZEfy353fgz7TQ7U6S3wF+BMK7+pMnNbIJRN9iHFeT5J4Wb/8ttmj?=
 =?us-ascii?Q?eliKxIllt6qNI0KVU3Wxtd+uc2jlNocwmwcoQCRwCXhFGyfJPcfqEz071wl1?=
 =?us-ascii?Q?2Un2kA2AJ8QJXEAgkQvPlVVpTqjkOl5xBxiHQI6M3IaA2xUzGiL53n0G07Hn?=
 =?us-ascii?Q?j1wti2LPjpRbeVFrTWHMPB7mJo0TNbv9Hwptq+vDJT3Ey+gBgqxdTaQcJrpt?=
 =?us-ascii?Q?O76kTNwGuUVTzcvHsUj62VCxeqnc+hhtOc2yjrSiMu1z7NTQlz3p0nZMA4v9?=
 =?us-ascii?Q?aE8fZwKutT5rhvqd9poLwcOglO3g3rohy2L4IL22tW3R47lKX3Pn/c/TvQc5?=
 =?us-ascii?Q?/kHMWwdJOZICyNB00NXDSYYkqBp4e4TcpI8stCoQVLuZB+JjQQ7meYJwgqXg?=
 =?us-ascii?Q?kZCKmEWSFvu2/ChG8i6wpjp75ozyqjej7vSr0l25IYoDJ2cLPY7DILRNGm34?=
 =?us-ascii?Q?Il/hRDRYHTG663YazGA2CWReoMxjAmnEcyBMC6JuXd+e7mspVkXz4eEsjn2f?=
 =?us-ascii?Q?5IixXUKjI/8x/wa0c2TorUprx+xFuqXgH/Wo5vCnTEGZBr7d4+kVnFQc+fK+?=
 =?us-ascii?Q?f98AUCH5l+vmwZ8EqOeDa28jSCvxgPwvF3myKmCdhYHGss6orWZVS70IglTr?=
 =?us-ascii?Q?rUMREnFeYMvoYuqTxc+sj/WGRNIffw8vOFiR2CJHSw37KBaaOqkLkYiKxOFN?=
 =?us-ascii?Q?ZnlBmKFAtL9YRTmlmQsIgJHuKW4DRErlCtaAqeMInosZZ7/hLFLlT4s0xUOV?=
 =?us-ascii?Q?ZVSBA434IxQCzISScqRRmKqWkE49LPDymAQ/w+5keVt6dC6hnO5jWfvS/cfT?=
 =?us-ascii?Q?PXFwbndR/keQpbbUehjURdPOGuUVBaE04W0KD8oKYdrVxvu6d243TT2KGkBj?=
 =?us-ascii?Q?FCVd3Ty3PImLrGnqSjVeKRoVL8fR4v6OsXY620A9mGHD507fqxwXXACnBiCs?=
 =?us-ascii?Q?FBSLTWYWGc0RIC1F6fxMLi7OsO8U1Oz1Jjw9t0wlh7h1XSldjOr0me/NLeUg?=
 =?us-ascii?Q?MTlYuAD9cWMwioqkEk/l0ONi2GChwFnng29ZSuXHHZyl4IigHUgdnEojdm7p?=
 =?us-ascii?Q?k4JR4Nm+Vg=3D=3D?=
X-Exchange-RoutingPolicyChecked: MW39AVctdXEylWpVLPpFrGsrqvpevQJcFYork9ZmZy/p6bdiJYjzIl9kktSO+Q/qkiE4bwuRU/PvJ8Y8k49ErqTdfNo6V2BAEFcRw+JZFrgt58sOySYq/SrPRlwJyoqwz8Bmgdh7x34kOMy06YqpeV178qDEg5Vz2QWLb7whM5VVbRNrYshkqKLDVvYz9VDyPPAv0nDIWeJMhwBzkd9k4Npy/uloFTEjmh3XVhq2ZbLMqjlS0yISZmC2jdFyHwsciExxi7c56Jt+Z/EuNvZ29cm0VIOcBO6Yo5mKa4iADHvyFUfvOalFbzs1SwMyLeMRC7T+lx2/LaZKO6fuFS6/Lg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 046ddf43-7bf6-4103-9074-08de95383195
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 06:29:31.8686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nsrud4QNcTiHPafolgzX7qn1Sx4ZT2uhs701j/+TGNm7QhKmmNPFWK3kz6mo2GQ0CS4gtl0275ifumrw7fGd1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8193
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/dwmw2/linux vgic-iidr-group-fixes
head:   89879757040970ab272f17b4ec2fb7d6a7986372
commit: c1ec22a93f919c6d3bee511832ca8422f9e61471 [3/3] KVM: arm64: selftests: Add vgic IIDR revision test
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260408/202604080614.wKKMYdgW-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080614.wKKMYdgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604080614.wKKMYdgW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arm64/vgic_group_iidr.c:13:
   arm64/vgic_group_iidr.c: In function 'run_test':
>> include/kvm_util.h:1139:16: warning: passing argument 1 of 'memcpy' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1139 |         memcpy(_p, &(g), sizeof(g));                            \
         |                ^~
   arm64/vgic_group_iidr.c:87:9: note: in expansion of macro 'sync_global_to_guest'
      87 |         sync_global_to_guest(vm, shared_rev);
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/test_util.h:17,
                    from arm64/vgic_group_iidr.c:12:
   /usr/aarch64-linux-gnu/include/string.h:43:39: note: expected 'void * restrict' but argument is of type 'volatile uint64_t *' {aka 'volatile long unsigned int *'}
      43 | extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
         |                      ~~~~~~~~~~~~~~~~~^~~~~~
   include/kvm_util.h:1139:20: warning: passing argument 2 of 'memcpy' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1139 |         memcpy(_p, &(g), sizeof(g));                            \
         |                    ^~~~
   arm64/vgic_group_iidr.c:87:9: note: in expansion of macro 'sync_global_to_guest'
      87 |         sync_global_to_guest(vm, shared_rev);
         |         ^~~~~~~~~~~~~~~~~~~~
   /usr/aarch64-linux-gnu/include/string.h:43:70: note: expected 'const void * restrict' but argument is of type 'volatile uint64_t *' {aka 'volatile long unsigned int *'}
      43 | extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> include/kvm_util.h:1139:16: warning: passing argument 1 of 'memcpy' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1139 |         memcpy(_p, &(g), sizeof(g));                            \
         |                ^~
   arm64/vgic_group_iidr.c:89:9: note: in expansion of macro 'sync_global_to_guest'
      89 |         sync_global_to_guest(vm, shared_rev);
         |         ^~~~~~~~~~~~~~~~~~~~
   /usr/aarch64-linux-gnu/include/string.h:43:39: note: expected 'void * restrict' but argument is of type 'volatile uint64_t *' {aka 'volatile long unsigned int *'}
      43 | extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
         |                      ~~~~~~~~~~~~~~~~~^~~~~~
   include/kvm_util.h:1139:20: warning: passing argument 2 of 'memcpy' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1139 |         memcpy(_p, &(g), sizeof(g));                            \
         |                    ^~~~
   arm64/vgic_group_iidr.c:89:9: note: in expansion of macro 'sync_global_to_guest'
      89 |         sync_global_to_guest(vm, shared_rev);
         |         ^~~~~~~~~~~~~~~~~~~~
   /usr/aarch64-linux-gnu/include/string.h:43:70: note: expected 'const void * restrict' but argument is of type 'volatile uint64_t *' {aka 'volatile long unsigned int *'}
      43 | extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

