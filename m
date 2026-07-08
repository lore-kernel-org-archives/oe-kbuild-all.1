Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B6C3F8ECD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499713; cv=fail; b=ETTscyb6yR9TO9r+GIia6C1q6K7WChT6yWRS9c480vbcMIjASFzeF1Cn/FpDGy2fsLDLZxZaaYnHEnFYgwnGrUBOcFMjJ+ETKunb/Ia1Qeap7tbygnwwC54d764nYSujSUIkA0/DLRY81KpQvrkF8/Hk6xxQnv1ThbyvZdzNQVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499713; c=relaxed/simple;
	bh=UG0KHLV/NNe/u/V318I4dzY3Ly/66nTfyIVvYTi1Uko=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PRdNw44UiuLvK5HYguFXVHfadxd0bsI4QlD7T7FIaLq5pk14R7+wCm/AkAFS2/po2qYY4h57y8q4IOjkvLuvMv/hXWAvI4TlVRDMoW7KIlzB3bLE7VzwUJJF7nO+r8DvKyDb7vltFdtGWbzBzUDMF9I2ES9HGYphX1lwuBrniKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqYl0//3; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqYl0//3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783499712; x=1815035712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UG0KHLV/NNe/u/V318I4dzY3Ly/66nTfyIVvYTi1Uko=;
  b=QqYl0//32sjsqT6SZlEdWMDFekUFphCGYPYYsc1SjQAoES+fYCh1qWeI
   z4uHl89dvvucV6/VObvqWmOVtNRE91zfgSzG4dleSjy7H3hxi05P36na2
   H4gcbdjy9ZtAuPQ4e3vdwoaxnI0rc4dgrgCRI943YtRu++Wi8EkfoUVbT
   r30F6aucgcko/I4xXaQWh8YQX+0VZl6P69tWdgyxLXJclz55eviGI06pK
   qKsw87Qgh5dyEXNQL/mKGp6INrfDyPvxJ+Ya0UFYljXmPUqNIt+xvFj54
   KcVODFG3VFnyKi+UohszUVy9vpIhgkqwKrxold3aKkzWOBFiL/PJbmvvN
   w==;
X-CSE-ConnectionGUID: Xt1xTSwDQ8KeOY/0Ih0VJA==
X-CSE-MsgGUID: 7EdPUjiATnWih7Ly72WOdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94799982"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94799982"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:35:05 -0700
X-CSE-ConnectionGUID: ozxrCqTySXqGL7QegTh81w==
X-CSE-MsgGUID: tkvbDlkZRzKeAxdx0+TjSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277435678"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:35:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:35:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 01:35:04 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:35:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IV8mX/y4X6Map/abpjxH/VzkZx2GhiaSpnC7cnEjAJkGd13BM6UDhbIpMAZEO1ufJr5qGgiGOKH3E6IGlG97JTTtmONrbgZsgPCve76nJ0jbc26ZD1RbqI60ehdJkfxu08+25yxXj7InWtCPZUmGdK6TXXd33eBKXFb9kyS39Gc3AlndWLz6eBP6evipdEaO4QPZBgIMMIQwkgizR38ZYE0tldRlWXfBkbgpdMDUVpY0V/5CZ0oFMY3ln7P7kYfX9kbiMn2F/y/2LUKOeVWOHYup67V+qwJ8OoARZwO6vXopWL50vgaaqAGcUT6D/3gYmlLLnOuyo6/cY4/e1/oX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmKL1K55XJE3fVcsvEPXXl12zCfzJgGuUhB6fA0pRkU=;
 b=Wvup7IKxgf3SXT4DZW9qAuT5mpq0NE65E1hZVzwDR8JHFnC+2zPhScYHp1MxNM947CTXJ7locgnJTszLVPBJ+dSMd7J7ZZn2ymBiJPCFd1qDL71MrV4KAKJf+VVRoLK5hoQQ5mfZnfobZQleOYpcA3u1LdK06BjmIvaT1fCSxYAMfNJkbRlEFhSl/X9dMMaFDirgZhvb1HdK2UZ7VXizEJlUnIrjBCWRZWiz1jT3y37snuulf89E4XRq2RB7xCD1a0vmkRP+LXeeNaLF1GpzETnHTJDdeB5OYVyBxNskO1B/akjEjQHd+7tTTco+PWMGEWX9/MWjt3l1MEecUywi9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 08:35:02 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 08:35:02 +0000
Date: Wed, 8 Jul 2026 16:34:54 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>, Peter Oberparleiter <oberpar@linux.ibm.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 trace_define_generic_fields+0x8c0 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <ak4Lru85KLzj+jfP@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|BY1PR11MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b06a251-38ec-45a7-0fa2-08dedccbcd6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: SKUYIzxzJPx0HGR9D9JtVMm0JIRHwJ51jZSyXRV+mL4/9LUdmtsvfwHEkl2mhQ6NfCKa087E2ItaTXT5iCA07mwG5231Mh3Pe1EbsXH8hFVGj5pqYH8Q+CTXQrYuuFNrFtkuIy4Thwy/5TbiMnKRCzwcH73JZXnU/AmGOlVC/qOA1Pocrzt0oMlQ1xvyMLA7C9SvJGlrIiZPQlk3YB4DER0C1022L6L61y3oW+Ws/+fWnvjDTJvkJwK+r+aQQoFWALyScKHUlyGuP8qi0cFc37jfj1VRFKrMJPwCSGkJkt+Y9JvUkQCkJHApwvcbxhngsyC8wpIk35skx6D+rHaLtI+9u3Lxtm2LdaZVrz3w1QRWZ/prS/cw/bwezKdeuB8EGznfuuu3FFCENOorm9homgoSUmjaiT6ElfWtbXnDF2kNPNqeFmYGMa1wUlYIOBwfC1sLaoP8AawEXkhW+wblsCvcFgFgMAQRAZXYXdDmB9m5aLOEfS5b8S8P0I8ZcliOjxQlNKLND+H1JKcqCVvuPnelVmc2CL8V04yi+lQPEWSktK6Wq37SG8/Wr9smiEZs++vwOtnKnz8LFrBmbtWnDCg2uJ7Y9HAKjfw84SdGC/sB2LPVY2xDn11iUYp+rpB7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8kAc2CZaqQ4YvROCzrvJGCsyGk7E1N+R6mNL0jf58fin8JluhdT9oRG9bi7b?=
 =?us-ascii?Q?eUDBALRu3tk2kNJ1+QlihlEe7pJnoXCemtNGw2F+YzKBT8P2J2PtQgjffu5Q?=
 =?us-ascii?Q?cmXB+rHRtvxWGCBnX/wYUw55d2Sbt3ceAL+S7YnpaOfshjpNPK/T6rDn9BTG?=
 =?us-ascii?Q?Bf+KXiYR2voU2sndFg9ra6qxuC+ic46QfKPXqLgIKofHzdopxbO6LZ3AWeom?=
 =?us-ascii?Q?ezfiBFuCpMDbp9vxyPB3tVczDbkEcxwlCjDIbiOGX/w+/i4Zt7jcjNV8WzEP?=
 =?us-ascii?Q?KRivWPXUZuVJF9SF++NMTY3FwnVrbrsLptidB59wBv5E7OLjC+Uesh9SpYzO?=
 =?us-ascii?Q?w6ddFbOw4tC/Q2ysms61AMzb14p/kdKy9OnXpUoADlPdxzI5urXPLri0UYZ5?=
 =?us-ascii?Q?UEFlU/zViXCZkUMnf48A8hTRp9Ma6eS8uc1CnRA6ptJAynCd4UtvCl+/OMNk?=
 =?us-ascii?Q?3NJdBjeTinCtDWm1IVCEpDbYRRzGXLBKRWy8XX0rYTQSyoA6sy8tlS7Yg4v9?=
 =?us-ascii?Q?WdZ1O2FLNaInNqpzMjVMpVZfUqzVAFmZx8lYT0ge4AB8gcARY6tS1s2DMR7E?=
 =?us-ascii?Q?wv1DS0fzO4NuNnZashWqVfqOiJjruu5yx1QIKZxh1AoINcBetnZZHiRgQcl3?=
 =?us-ascii?Q?sOnDpbKSiJaihoaaHQnmCiKAr2VOznj6aQG4cZ/Ooz3TkX6sagfxau5V5yOT?=
 =?us-ascii?Q?ifDJNv6v+fhbpYTCALnMHmQX/J8sCJjlGStaAEzOhg9Qu0xCZK5xwGhclJDT?=
 =?us-ascii?Q?4gSYGYxe96b3GvHbclnNuZ1z85oRkHjfqWjGOw3q7JLhlqFeW9zWkmGoH90f?=
 =?us-ascii?Q?sFFakpDSyEI2PPleayLcleO3kNJlQMek78W5eluur1/BjFZpH7KSzAmqocky?=
 =?us-ascii?Q?JvQ52OVt3vcx7H2nDt7dV7fpVVyCV+BZBkPDdksMjBDLWz1AIEkPXMcrMNcw?=
 =?us-ascii?Q?rQt6Xvd25g/y/Eip7l0SGZRBUSL+R0E3B3yGbqyjwrxjqURMJptxzt850YGP?=
 =?us-ascii?Q?Yy/H4dVqxLJQ/fUBz9QhLWi6rFFnmCYW1vJHwWTqYH5AGtUc4er7uVEtwWCt?=
 =?us-ascii?Q?GYrSqg+ToQIIgfza+EEuD6X9Q1x5TJA+YEFmDlg2gTFG/w+4ukJ3kGCwewM7?=
 =?us-ascii?Q?I4IqMsMAoG9Qjrtq7OhA/wex1Ks5caw2SqvWr1r1UWIM26IWy8Rqcy7d5f1c?=
 =?us-ascii?Q?yoeURJgDHjOmw7dkFZllHeQEpE32hV/BxVBU2+jfpPaC3Oek19zpSMHXVieW?=
 =?us-ascii?Q?v62iQ42XBO/QFs9MNas8336oft2zv+QHeWE/S49AYdIhNwrDbgaOxYysUS/8?=
 =?us-ascii?Q?Etbw9EG9PmRMS5jQ8tDUpxZ0wqqUABDbWU/p30hcWOKBEOiFJJcWBbt/7LWm?=
 =?us-ascii?Q?3Lkcbet44Eq8So2T5cX12pl1MLxeFCKagcCZUbqBktgqx+ILyiKHibhm2PrP?=
 =?us-ascii?Q?mAdFBodQz8WZV1+5HdeBEdtGcM34xa/V1d4MguKt4wAiODeeCz2hfOpvbcZV?=
 =?us-ascii?Q?8hxroHnc6XYfQleUnMSK3Rr4cFYr8FegpuhZH8USoSxd733U2kqeslczVPoo?=
 =?us-ascii?Q?ZsXkNIpaUFKqYgCV8fS2B7SvMXRPPMVCvhuwmxZA5OhoGpEbi6S5g+RBXdD5?=
 =?us-ascii?Q?yp4wNpJbjvNgwN8LzRv58RXtJfjtMmJS4qwlfAfCK5BoaSNXWcEbhBbQWBVE?=
 =?us-ascii?Q?vKQbFMXMP+45+ynIweDULY7sjDBeLHzR31AxFZZy8S10Oiojivd1E2lJd/2A?=
 =?us-ascii?Q?f7/DCUKtnA=3D=3D?=
X-Exchange-RoutingPolicyChecked: RFjulZ/wyw7ooKOiDfCj4KXdl2t1Tuk1Cgaj5iGhx2TPhHeIlRRuYMH9X97XzSlYv9SgTCGac06xyd28UcNit1NkxqdDzm2WB1NPwvf7t07gI/qXzQLf1jn1E3/51GAWO+F76ifHv+GeOH/SnEppMdsTBLilgSQblSIAunzJAnQryJAWpVaj1tmKPNeZ3wqov2i6JkFw8NWbuWjg5reZODkA2xpEo2QnCipkK+EzRaaXEMMt7Q37FOoUh3PytmEHggZ6HQGcV6Q6KytuNiMH5PBw8wcqjj1RtEECjaGga54prPO9vWnAsw+MGYqAEm2FiplLH44o1DO+SlXJrjKfgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b06a251-38ec-45a7-0fa2-08dedccbcd6f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:35:01.9288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioGVUvBTRiEGW8HR1B1svhK/VNeuFNHyCLDj2isSBg0OoLMY9yKD2a6IFVLl0d19uAM32f1Wrz6NcTktVJucBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 56cb9b7d96b28a1173a510ab25354b6599ad3a33 gcov: use atomic counter updates to fix concurrent access crashes
date:   6 weeks ago
config: xtensa-randconfig-r131-20260707 (https://download.01.org/0day-ci/archive/20260708/202607080240.7Avbq5g9-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080240.7Avbq5g9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 56cb9b7d96b2 ("gcov: use atomic counter updates to fix concurrent access crashes")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607080240.7Avbq5g9-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: trace_define_generic_fields+0x8c0 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

