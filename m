Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8B617D378
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070072; cv=fail; b=lcPkbCxy/x2SFBuZWtY4LylFgCgUtAtcG5tYggs3XuR4AWGc05Ay5/iJJ3kr7SVB9OtupwYK2l19lQFXq/qc3zouY8LkkpHQvB5/7yX1q0kQwgKv4mxyB03Vk2iJvCJESY6cC+8ZVooNZEvnmfgh1da5INqPpO5VlNSXl1tmUuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070072; c=relaxed/simple;
	bh=zlly/PT+drbNQOiBWVmm0HPypsAfPhsK9hBl4M7akFk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pHmEQQVdl7dWpIUCQoMVJBklP9wYPEkc2IDESJz585AcXwQcIHncE4Rsw3XKxDuDHRqmFafWbAjD6ZTYG8hDjGKorJI6t4MrHSxSBd+gda1vVTT68Z4AuV42FprVsCJ+OBQjXnPUbq/rYmchvqi8uG80HLfsG3KEZDsw0dKm2Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BreCNTsM; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BreCNTsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729070070; x=1760606070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zlly/PT+drbNQOiBWVmm0HPypsAfPhsK9hBl4M7akFk=;
  b=BreCNTsMOBzOK4/wkfKaYsfOU6BYdyqxzpiTmlxtmJhAbVeEGGK3RZZA
   xgH0RKJSQA7dmzzmyOjFy2AjBDyJBZElEYnNQO8Gc42MI/N+bDp0Tek2K
   Th221uJQ5EweQHxkddiL5nGQeKdPGwSEGx7A0gL1csWa7AHQwVW+utczB
   uf5CJv6NCFjtKXRmDbSojr9h16m7HxFtvyWsBQjynnWX4aEDipxcRzZdA
   jo05nN20DHfkkwH+O2iGKaR8gY5hTvqxvNTRgiLP/E+2Po2V2Rr7Y75eT
   5MkyIoJv/QD/o3xKHYyh9mHbnJQTlkqTTFuEwxZ9naxXWLHPJ8Dma7t5c
   Q==;
X-CSE-ConnectionGUID: om28SzcpStKEhbqno0uVdg==
X-CSE-MsgGUID: TgTO4DlqTf2TLkdMy2H6Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32426603"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="32426603"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 02:14:30 -0700
X-CSE-ConnectionGUID: OG96AnI4Q1y0VmPzTrRl/A==
X-CSE-MsgGUID: KjYrX2rkRO+tEVKVZ3pJ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78191736"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2024 02:14:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 02:14:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 02:14:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 02:14:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 02:14:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDAZWwkYTGkWFkNSKQy1JPyervHGz/SH1E71j5yJgNjBTrh8QWOOLmuxrxTdexEs6thn3AXKxdCuT/jeXpVAzPpWnRHZBNQWal1DpuR7quPzr60X3E5eLtAHpiYGz1wiY5UmXfmg8BWloOtCKb2vMVp0AUgyrISv+XLQzOS6IvGH5WnjZuWBGOXlv+s24WglvKoGbOWQn10vAjx9GjtDLDy7tlhpr2gzr1QRM+5DPzHw4dwdpTAoUPRRZK6gfeN9FJIttFbALBy4CHGz5KJk8UEwtPTb0MQdGBAW3UZ1jxCIzv928WTbxPgVyI3NeAXy6DgCDQysnU0dVqho3GJoow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhKJQqEHphnKYf/+zk/Ny/9eV+cMdjGKC/zvNiUnL5U=;
 b=fYFqXbXTYNxiRGmmjtHNnc7IGzSPsdnn6VD3GtCNo/pc3sbw4o4Crl1xiAhUWgrwjf0jLgXDrSjbUOeP5Cu0gpD31pt/FI4LymAm2ObBL0XFQaVykaEiX2Y4X4BnqxbvIhe2BD46S27aIE0o3M01pfThURF6iZpdua1ai6m/91eUbLz4aW60+2RYVMzuOCDXEEXgbMxRHzk/ISbQ5Jj9MV0eWnZaEozIFGO5BqSMtY7KbV1VOGdO7KkgkS8c4feBZ/tJSbCLkshfPZ8+9aM1aXz1A9PdWUVHpDuIbUfJMx4Jun2S9nE21ceTNwX/hZOjELI52g5/BN3mLvDVEqT24g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 16 Oct
 2024 09:14:26 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 09:14:26 +0000
Date: Wed, 16 Oct 2024 17:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [linyunsheng:net-pp-inflight-fix_v3 3/3]
 include/linux/atomic/atomic-arch-fallback.h:846:16: sparse: sparse: constant
 integer operation overflow
Message-ID: <Zw+D6Ei0anWFeFZl@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc3dc02-9c26-4fbb-c457-08dcedc2ee41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z5rxDsOvSaaVy5HUHnWX5Uhm4idxCdQdXcERZx28oKlMGzkM2mH6/O1eBdSJ?=
 =?us-ascii?Q?BevPgzLYGQ5e6CrZjuglIhqEiXC2mlA2B3DlluM2xQfikxuZ9N3iPqRLyGHR?=
 =?us-ascii?Q?jOAkA4M8EfivnWxm+6faNSSxwwg36nnItBRQbtzIZajJEry2EwGT+iYjWLFP?=
 =?us-ascii?Q?eLHQRfocOdoithYlJBTD6W6f4cFYBmgsiUU8bwaYMsBDyEqgyAgu0kgY6P5X?=
 =?us-ascii?Q?s17zGpkFFE8KKKz4DBBurv9ZLEaSBLKViYQeO5b4tPPsuGo90UjlmTds1Oz2?=
 =?us-ascii?Q?mapDJEGKzCficLhwKqVlzrzOkXw5QGK/tpWJab9rlaDQCDKL0w4iueSDpzbd?=
 =?us-ascii?Q?7gsOwXTunvIpHRPAIq3BSjrLLVpIwVjzV0gb9Vje2an1HBrQPCCrJhbgc8VJ?=
 =?us-ascii?Q?5Vo2IZuXXnlHSHvbByZNMI1EJ0otq9q2Ib+Fnp2BnUoM57OfEUyRwAtWtNv3?=
 =?us-ascii?Q?K7sMSDRaDqConA43WYghgGl6gSK5qNq0ahNT8piK/T43hP3tUScCQ/9tJueX?=
 =?us-ascii?Q?qfGJ/aEdN4AYTAPsQMut/NWozoJx8ikV5yY+3UXW+4r9DHgV85B/SXa6oj5l?=
 =?us-ascii?Q?1AIJOByNlGTBIf1ehugGmp7LU7nSGXkywiZRqdeR/t9EIHOlsiRMaC1wTF0x?=
 =?us-ascii?Q?cAhlOLsJrQC/bnzDMMz4YxRRqqDjxhKpn9Hdyg5vrbHdJMuG0QEhirIUpJrK?=
 =?us-ascii?Q?T4r9Z92vJr3I2ALZMbYgkM21rL9NgBqrOttJBBPTEri+/wum0UoxbMHVMpfk?=
 =?us-ascii?Q?HkXNMf4AGwDi07OzcY8mWNMJxd50daIjPkbxzlJyqR040hrsZ5zJD+OKVh+Q?=
 =?us-ascii?Q?ZcRyWI65UrbRZWC5hlbUlsEgPQBTqDIwWtPk7/17zoco0Jbgx3kx0nSD6VWC?=
 =?us-ascii?Q?J73iatOAjBVaVnD2xFEjA8RXoS4ghSLF09m2jvrsmNcCoy8n+VL2zkPlakTj?=
 =?us-ascii?Q?/r78/ClQbOS6W/be2lNUlIYyONYqlr0nmYmQP5U4eq3+1VFBen2OVkIHG2rL?=
 =?us-ascii?Q?FI5O5bTJa0lO1ecY1QYeY0G7ewwwleB3l5Z6aQ0vwJP6ubFm93QtpJR81QL5?=
 =?us-ascii?Q?W2VqFQXYK1HlSoVlXv3AN3a/0oHffyoPZBA33cJFMnLbpOKV2IABtK79nfa4?=
 =?us-ascii?Q?1931Y/YCSG9nmbvgtwKtDsOhcsOdkhAfkr4xDrSYDKJ0QXMiGZDFlCPJu+aY?=
 =?us-ascii?Q?pRR1QV0HjaiP9Y2ugzRJ7fDgBe+nMpGm/Hbzyo2NrFb2pKURbEh+/+ue2Vk?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Zzdw26BF1I0yaKQACaa9JJfmpahO/OJUPUJcRWPwyVvif2OT+omKvApCYWP?=
 =?us-ascii?Q?puflixWHeRwcMKRzTjJHmbWZ/vJURUz9pppdPUgI3xPyuTL6pD5z/tOO44BG?=
 =?us-ascii?Q?ByAxJ5DSlWqGQzzdDT82UrThLDKkT4JpxzVT+JN9zUHHvIDM3PTfq9Zu4qSo?=
 =?us-ascii?Q?SIOb2FP8lzCn3groLpsTdYzZsAHuLhnSBQlp18LA+oV/PFidHxrU6hD65Q4y?=
 =?us-ascii?Q?QApY4NjW9UiMSLAwfZUuH3k/PZ9lDxjwU/v0m519d9s8txju3kLfeitClP/9?=
 =?us-ascii?Q?kFbyx3zUZt8/cz7l4L+1VxHhWSNSytgnVN5X9/1AtnZmOQGvMG82vgOVSfTL?=
 =?us-ascii?Q?awwr3wB8Ufsl4ebC0jYvA1CfCbsoNMKrgxI87unpnyxUuURgWo/BpTcgiX5M?=
 =?us-ascii?Q?kSUhj1MPFoTrga3Cx7uD7Dpjt/A/XwFItXv9bB1b+FcqJ14ljpRLSZ9PXYG7?=
 =?us-ascii?Q?DEAFS8zhnDGzE/2MhgeQuMboAvzFP1FMqrgpbW7zInyxZr49KDg21s2uwIjW?=
 =?us-ascii?Q?ik2iLd17Z4Ass5Gr2FcfJ2xvFWtli/RtA0HUdds8wbdbdFOg1zMwWI1TLvHb?=
 =?us-ascii?Q?paFL76PdAUrEr4yNULdrIbRABTKCfuFZnhsROMNi9ztB6jI89KQuXm6gMZbt?=
 =?us-ascii?Q?V3dL4yuPvZ5Y9wtkbmctuANAzCJILsHJI5LSywJH46A80ZzCMXXfPCiA7o1x?=
 =?us-ascii?Q?rpn5n9J/k+vxuPGhxwBi+aeOIw4IUeo9Oz+5KAB21WFeRRWyC6HsFiAeHTkb?=
 =?us-ascii?Q?v1nsrXtuFfCIAjcQ3ZTidNM7V3kd2hZJTRa1cUz5Vk6X7kQkuFg613/FuZLj?=
 =?us-ascii?Q?OufbvWOmnvUYutPG3V2R6Jc9JIXH7IPs7I1BzOMBirZ7GOTWK4lic/bwAV51?=
 =?us-ascii?Q?jyYrQNXjbVQYZy4hTUp/NDymWhtC6NANOLYMhOD/UtfIoFF2qjosVOxszXeA?=
 =?us-ascii?Q?QwVagSRaj3HL+K5YyXcxEL3QxEWl+L7FrnM7CcVXvAapteIVZi0fpesDqlyt?=
 =?us-ascii?Q?XaM36WZwaE9ndpguI0LZgBsuNmlMB5aamuX+zmZWKfb1+fb8eSFRh6+VbH9F?=
 =?us-ascii?Q?eWG9ugdjvdIcl0aOLfmU80Kx802uFTI1XpfTQo6UChIMAPoaX4jN2MNZCC6G?=
 =?us-ascii?Q?92mm3c02UcNq2h9GXJCaNjKGpTPE5V0rw9vsiH01Yw+PFsWe+VCSH2Iz+/VL?=
 =?us-ascii?Q?dsQMDNQ52+9NweAjWVlZM2IEOH2y6EIUgxelVM0LQJPiSHUhohuJJICatoIf?=
 =?us-ascii?Q?VAspm5gy9AsY8kb11oOZ1BSZxxubspfxkicTjxJFuvBpup/cszTHa3jvmOGe?=
 =?us-ascii?Q?7UiaTkfY4QOftRgR39viMn7pkyQ9HHW0EnbkELNBnU5cUzbHBrbdxEzWhtX8?=
 =?us-ascii?Q?GzOPWIYIggnB2AcXEBIvsQGCwyoJ0GYVgwDTNC1R8EF5lC8nYDcbPXP9OeYg?=
 =?us-ascii?Q?HY8IIklIB3ELCNjte1mvj/uWqTG7OgdVz2iuj0aHm9v3fYZVHREhLqoRp67B?=
 =?us-ascii?Q?ETXdg+zThV7I7PnrW+2q2L7Vs7MzLajCsHiq6iaKCuJR0e/hUVuCgilEmbrB?=
 =?us-ascii?Q?WjI0ZOdNTThf645BuyXho3myANk+egmrvpxmTX2d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc3dc02-9c26-4fbb-c457-08dcedc2ee41
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 09:14:25.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zD9yXWW0DdqRRTSKrfCVkxGW5qKJ5qYdALE3UnBuBXYZhBepvAsWBNn7oQpZWSF/QxWk3xE5wDfu52IVWp+Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
X-OriginatorOrg: intel.com

tree:   https://github.com/gestionlin/linux.git net-pp-inflight-fix_v3
head:   bd72d37cdf0449e8175e573706b55a1b5186287a
commit: bd72d37cdf0449e8175e573706b55a1b5186287a [3/3] page_pool: fix IOMMU crash when driver has already unbound
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-121-20241008 (https://download.01.org/0day-ci/archive/20241008/202410082056.oGrW6vdm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410082056.oGrW6vdm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410082056.oGrW6vdm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/page_pool.c: note: in included file (through include/linux/atomic.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
>> include/linux/atomic/atomic-arch-fallback.h:846:16: sparse: sparse: constant integer operation overflow
>> include/linux/atomic/atomic-arch-fallback.h:846:16: sparse: sparse: constant integer operation overflow

vim +846 include/linux/atomic/atomic-arch-fallback.h

37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  825  
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  826  /**
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  827   * raw_atomic_sub_return_release() - atomic subtract with release ordering
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  828   * @i: int value to subtract
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  829   * @v: pointer to atomic_t
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  830   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  831   * Atomically updates @v to (@v - @i) with release ordering.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  832   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  833   * Safe to use in noinstr code; prefer atomic_sub_return_release() elsewhere.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  834   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  835   * Return: The updated value of @v.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  836   */
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  837  static __always_inline int
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  838  raw_atomic_sub_return_release(int i, atomic_t *v)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  839  {
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  840  #if defined(arch_atomic_sub_return_release)
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  841  	return arch_atomic_sub_return_release(i, v);
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  842  #elif defined(arch_atomic_sub_return_relaxed)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  843  	__atomic_release_fence();
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  844  	return arch_atomic_sub_return_relaxed(i, v);
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  845  #elif defined(arch_atomic_sub_return)
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05 @846  	return arch_atomic_sub_return(i, v);
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  847  #else
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  848  #error "Unable to define raw_atomic_sub_return_release"
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  849  #endif
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  850  }
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  851  

:::::: The code at line 846 was first introduced by commit
:::::: 1d78814d41701c216e28fcf2656526146dec4a1a locking/atomic: scripts: simplify raw_atomic*() definitions

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

