Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EB215B971
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 00:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773015097; cv=fail; b=p1U4kcC3d7wi1jnHK+sRxgmR/SFeBi5rV5DqYz3nM8LFXgYU+lQTxAck0WgCxQHo45k/MEOmNWtX+gWg/tE8HWuxDkdpFfez3TF9nRMn44RatfdbxjfTxKMbplQHb+nW6+tzkWqBT3HA1Hjv4pBXsUIgBpOTu2qkG2MbXUUOqZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773015097; c=relaxed/simple;
	bh=CBCv8cfnu/QXgjehmz4v25pOTBgRTz+pVq1o6sMl9BA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LZqlUY9Kt5Zh2fgpcBlqvBBLg8Q+MgGhnPnctILprXTWY53BtNWEU7nKLvp+rD9PYzl9U154nUoKNiHA0QJXcoTZFB5rga2n6G9KrqxqkVllRvI9UwbD0bWf7PRrHkiaA4S0Zgqdcb6c5jeZHP9alAulZJ1fgLgBqypRgme77xY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqRlXj3d; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqRlXj3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773015095; x=1804551095;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=CBCv8cfnu/QXgjehmz4v25pOTBgRTz+pVq1o6sMl9BA=;
  b=CqRlXj3dYFMe69vRL1OgADo1/AjVBKtVdVBEeXkud+nmUFlIEVolcWFk
   JcEj32RrlMJiKp3aatIwbGxupRXSAih17b5T4c+Y0EqT4l0NrJ1TLZthh
   7qsEK6IwLwTQ2cPMGXPy2j0uAce/mMuFxuyy58E8FBi+2KbKsRft+nMzY
   eXo++2A08fkTe4+5teMTmcxL1F9pg+8rFkws11f0blKyQAsqEnSYSr6pB
   uw3IXbl5pIeSkPzVN7vK27YGh2EzrbssqFFfYJp3tsSIJ8/3vgxMWRDa0
   BcphqoWh2A8AbLfzRTyyKppRJf5mA8bYDJ+4Ahq1ecyhTESdnwLgNJPtj
   Q==;
X-CSE-ConnectionGUID: /f//LzCgSD6TUnBeLbJ5SA==
X-CSE-MsgGUID: iHIju6R8TGe02UizcUP6bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73910183"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73910183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 17:11:34 -0700
X-CSE-ConnectionGUID: hNuvy9tmRqmHQ1Mz/6SS6w==
X-CSE-MsgGUID: GYD+x2h8RgGlFxQyW3P55w==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 17:11:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 8 Mar 2026 17:11:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 8 Mar 2026 17:11:32 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 8 Mar 2026 17:11:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kz7dGVL39OXVFGO+RIFO3mDOy7ZY6o6Ix9HecY5HIWvqEQQZO9pI0E6OZzT3/kW/MuS3SXhma9I5AFQVANOQUvZKjGWcwrlO/vfRF0rcT1dUYDH3gb+p8Y1I5xXxIn7BRcuuCvuCe52rDdjslSicXkM31JR5OVb51Ut1mAXYaReKMIFI8VhCjvrFBEmJZWu2Dg4cVPOPAWT7ouPwMAVf14jgJJfX4fsrha5U6LhKkn/4yQpqZDlM6mZb3Q3RxhkVkACLOsiFVRfflGLKU/jZndsMrdHeMR9X2/aaVroVa+Oqpvs9IIcXgS5zxVk7tAshBVb6vgg3SdMpVh8prtsfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qkA/FdLp15llfu5K/m7Je9ukRdFjA62yITMLbyyPFs=;
 b=taPllMYmenZBAUykoi1fuJvfldvAtu0Tg4dnkEmcWat2s1mKZRHAJHInxvJhAjYBzZIVEdP0OZ85UfhliCyrQs9wQCp88OmefjTWDLL+4NiJZE06CGHUyJLpiRnuyhVtQuoSlbS4Eve9VKrK+x5EJDKhZjaEQtZkdLAw/Z+WJJV4qxR8la44kpaxDHZ5xSuE4Z/P0QakxfxMWxZbKs6NeoESCq0LJ35ERtYy6F9PwO+rXo43avCR2g4ZoygwuyFqcgZZ5LmdyW0X7ay/z4rq2/Yb10UQa41VCtz4CgJv0MigMv4SD86loSqYygMqMrPlg9meqgBlDK86RMQgW8r56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
 by IA0PR11MB8335.namprd11.prod.outlook.com (2603:10b6:208:493::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Mon, 9 Mar
 2026 00:11:29 +0000
Received: from PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b]) by PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 00:11:29 +0000
Date: Mon, 9 Mar 2026 08:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>, David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 286/330] include/dup.h:354:25: error: stray '\302'
 in program
Message-ID: <aa4QKbYOvGmDEqVG@rli9-mobl>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7710:EE_|IA0PR11MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c228e94-2145-4253-a0c2-08de7d706926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: +h7PEZ3OCFlV1wf38DPSL5DuRY6eC+KMvrdtsr/XepCBQ2f+5/qs/QFqQa7vXm84NOPP0xPPHlsjJHekXwsy7hXNz+P6LH+YL/iQx3KMNeoleg2X+Th5bahziYdEbRvGIhjlcnP6yLhx8sIXmPq6071PtNkFXgCfkGcI1qcxy6tbEfy8/BdRKxk32q9XzDyUE4OMHl+S7Hl8MxhuTc/iD0gxh0UQ8EctwUeKbQo+jbVXykD6VHyCNVexLRV1So8sTPDtstzf2XUDLqmfzP3Iqq5GV6OKW2/QDTraF8LDTQ4seegAClIjhEDhY3E1nqmnBtYNPd76zu6oAYnzbA4oAmT6lc5iXxAy6MbsxN8rspkokW35lFaNPu4C7ov6LD4rGQf0xmoz3LDOi2WK5fbGDUcab41z57/WMaUmjFFt6z8JNEClsZo2ctaMCGKMmRCqasyLLckKlIsmyQXkSBQeuAhSj14H+B9Lryn+CS4WTe4hq0ArRrPw2ou+v8psm7VOG1LjsuAa3nz5n0gbLhQtIXy1QlgvoLL3P9oBeYF9PHQ/Hj5qdHHIqebMsYkXeLFzM8n7tCzfM1dUQ8MpHyuN3f0Oz1oDvQ3SIioOKam0ayeiKwKddhz31I1q4zKsf6lbDb8Tz2JOKyhqHI/58Kaf7AuDNQfVZE5I7LbWffOQZ+QBE24w1TEKg6R0iqQRVo7Z2uJw765UmfBcfwOHYIFsSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7710.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MWkjvTTB0g4YwSrm6cJrsVD5vyKaGkcfjrpOEPXY1q9flQ3EAdK+ffsoL5?=
 =?iso-8859-1?Q?cOy37Npx48KJdr9geytW3y4wZ9fgoOcbb6gWi6Q3OhwzHUi1ofUj+kYRXC?=
 =?iso-8859-1?Q?+gwjp2xITkG7qb5IC7jHJ9yw8KyZ6o2uHZIWBHPmAPpTEljorh5kcVDtYk?=
 =?iso-8859-1?Q?8D4pEyumvlJhU4zz5N9Uq/7P+DHwsYhuc9QEIMHr+mrkJ0rMiywJonCtSx?=
 =?iso-8859-1?Q?ePqOzz9DWAdrfE03kngiJFpf4CRxPNDKqRwUQZ4BKa355eOwbMlgBBq2kj?=
 =?iso-8859-1?Q?LGKMTGeWOl3xATUoIgcd+2e5MYceXTCch0FPWdu/xP7Fm2tLZrgbdWIVzg?=
 =?iso-8859-1?Q?PuZrB5xgsyVtFG8h9+5nIdoHim/ulM1Wdy7MWSrdtopPnU6JRrdurLWEWU?=
 =?iso-8859-1?Q?IP0At4bbduMgkb2wZJiO2p1TYDDUsArUJTdnaSir1bHxRovjDscBXzcly0?=
 =?iso-8859-1?Q?LPKiOa9jP1KYzkFU5Zfi6fmuFeQSUsbrwAWXQ8hjFOJfAjvKKEpsK2TQmv?=
 =?iso-8859-1?Q?7c3ofV+67RCw64Pa3Q/SHBK+pDYCkku+sW3IH2DyMKlv/TXLvDstZ1moek?=
 =?iso-8859-1?Q?Z5U+juMMGtlM+F6jxymCi05FazyEJw1P8MQX2MeRMM6VnJQpzd9w/rTCi7?=
 =?iso-8859-1?Q?NYVda7z/0WQLDBxYxvP540nhi0iYp8WzFVT+h1HJWNHrCWFuD0T1H/c9Rg?=
 =?iso-8859-1?Q?c6LygidNRGK2EvlM6/a2mqupzxU1RVDEXJFMoVRiQYYjS5NaYaCC+XY3cT?=
 =?iso-8859-1?Q?nmlXQk0JBQEqDxJ2uiKqg0HP7c54pCgbg+psxvJ15sNhC23ogk25SnfcG/?=
 =?iso-8859-1?Q?RPrb0gPoVxbP7k4VsxzIvjbR8ASAtD1i8DR4zkXsh59LmpYS77HzDwOQbj?=
 =?iso-8859-1?Q?aVdZpGyP3Z0YM4qZxSkAvBhvPlsUxYPgfl8ulOvPB+XWuZ7OXom6EdPvFQ?=
 =?iso-8859-1?Q?wdGwojmOZE7P1gPqdIqtQew1KkXkhmKA/EsJvIicqTXdzV2xkvyosACLMB?=
 =?iso-8859-1?Q?3dNr+DtcEyTQhcs22Oi/Ndmt4cj+cLEfzL7KqlBzhGMmSm2LLmQTm9QFyS?=
 =?iso-8859-1?Q?eR9UInHAN9Dc7X5JzvXPks1NSDPTMM5ZK8vC9pwf7M9f1Shpfr/quR8MWB?=
 =?iso-8859-1?Q?nO7QjXpRJ3nwQradXf7hWFaqx6ZFl6UShgN4rrrhNaDqYQTwI9UEOW8Tlt?=
 =?iso-8859-1?Q?qJMc2LteyDpluTMHGZFVYSuk8WP5t/nAVdOhy65A4Vt/Vqz1N46QCQ+NPB?=
 =?iso-8859-1?Q?7iaaIcGxjpn6S3hu37kroTlwbI72Kkwvr37nb8XnD1i/MlWPn4g6BhDyT6?=
 =?iso-8859-1?Q?6/LuQmj4RaNBNtslUTK4zcxaB95HDBNJBMeTvX+rvHuFf6E4fWQlQ2TKug?=
 =?iso-8859-1?Q?0Cf/9eCq7CIkguc5pL/K/zd0h6au18Lx28/TLtmXnUAd8/lJQFBXAAmDCJ?=
 =?iso-8859-1?Q?n9F+ojiHPSzuqW9Ivhvp0y/H9D8KHw/a8+FYgtJ9HqZ+hV+z7qX1jRvr0u?=
 =?iso-8859-1?Q?MeSy/vY8jlCXEzGYD3hJLDvkRDxs3A0PuWQS4fHfNhEj5Uyr8R/nTqXFX6?=
 =?iso-8859-1?Q?KT5ms791bqnpAVJJMpooJNMZhFgyl9mWocG+EPJ63uI+cn+zFtAGOtvpnL?=
 =?iso-8859-1?Q?WXcg44FGICdlxoumKqOSCyo6nWd7OcdBueOp8eTS8K+C1LHmXN17k6ppDs?=
 =?iso-8859-1?Q?a+cpDFqzcSjeIXBX7s5dKiR3CliFbcaGc5Yxl9jasGwdj+QfGXW4UpqNZd?=
 =?iso-8859-1?Q?pRyf7gVqd9kG6OCFjQ5mqJk7tbnGD5h7ShzVAe+ymJ4F559g15r76LEBnc?=
 =?iso-8859-1?Q?Cj6e3vWFcw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Qx76z1wDzL4Vpr05JwnLQOOKbOLc7ja17ZRpQW/fKm6YUxI5KHYFhc1piUFSHdlG7roBejt88XQbkh/+2vjXuRQlUCrgvLMavayuLU4bgZv5SXX+aulj0HN1fgqHvJtFRn141+MGbqxGMRBopBVrckTBDgXI5mHzW58ik1ebZhyT1kuqGbpDq48ZQAx8Dqc2+jndwS8tPZFMM1j5uSaRngtS4n9mo8zt2i9EHwii2MmHvDT7qaEakcXhqp8eWEGP/dGcC98PVbiylfNLVuqMZv5q1FEbVIV19ePRlq1CcMNxFaNq+bAy3uLe9kqlJWttY8n9YiqoVkOGa8x9JlvDdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c228e94-2145-4253-a0c2-08de7d706926
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 00:11:29.0647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3B+UuJ3HY9jEAhAZy2mqtDalMUUdpzfCL0PAz+tpZTUbgJn48q7km9gFBiQ+E70xftavc73KSAw+pawSJOfRxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8335
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   167400fd4c51f9e5ea8fc9d33c89c938799be4be
commit: 84cd8de2b92a1ccf493c43da8b31bb983d320ca7 [286/330] mm-prevent-droppable-mappings-from-being-locked-fix
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260309/202603090023.npem8cfw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090023.npem8cfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603090023.npem8cfw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from vma_internal.h:55,
                    from shared.h:11,
                    from main.c:3:
>> include/dup.h:354:9: warning: ISO C99 requires whitespace after the macro name
     354 | #define VM_NO_MLOCK_MASK       (VM_SPECIAL | VM_DROPPABLE)
         |         ^~~~~~~~~~~~~~~~
   ../../../mm/vma.c: In function '__mmap_complete':
>> include/dup.h:354:25: error: stray '\302' in program
     354 | #define VM_NO_MLOCK_MASK<U+00A0> <U+00A0> <U+00A0> <U+00A0>(VM_SPECIAL | VM_DROPPABLE)
         |                         ^~~~~~~~
   ../../../mm/vma.c:2592:33: note: in expansion of macro 'VM_NO_MLOCK_MASK'
    2592 |                 if ((vm_flags & VM_NO_MLOCK_MASK) || vma_is_dax(vma) ||
         |                                 ^~~~~~~~~~~~~~~~
   include/dup.h:354:27: error: stray '\302' in program
     354 | #define VM_NO_MLOCK_MASK<U+00A0> <U+00A0> <U+00A0> <U+00A0>(VM_SPECIAL | VM_DROPPABLE)
         |                                  ^~~~~~~~
   ../../../mm/vma.c:2592:33: note: in expansion of macro 'VM_NO_MLOCK_MASK'
    2592 |                 if ((vm_flags & VM_NO_MLOCK_MASK) || vma_is_dax(vma) ||
         |                                 ^~~~~~~~~~~~~~~~
   include/dup.h:354:29: error: stray '\302' in program
     354 | #define VM_NO_MLOCK_MASK<U+00A0> <U+00A0> <U+00A0> <U+00A0>(VM_SPECIAL | VM_DROPPABLE)
         |                                           ^~~~~~~~
   ../../../mm/vma.c:2592:33: note: in expansion of macro 'VM_NO_MLOCK_MASK'
    2592 |                 if ((vm_flags & VM_NO_MLOCK_MASK) || vma_is_dax(vma) ||
         |                                 ^~~~~~~~~~~~~~~~
   include/dup.h:354:31: error: stray '\302' in program
     354 | #define VM_NO_MLOCK_MASK<U+00A0> <U+00A0> <U+00A0> <U+00A0>(VM_SPECIAL | VM_DROPPABLE)
         |                                                    ^~~~~~~~
   ../../../mm/vma.c:2592:33: note: in expansion of macro 'VM_NO_MLOCK_MASK'
    2592 |                 if ((vm_flags & VM_NO_MLOCK_MASK) || vma_is_dax(vma) ||
         |                                 ^~~~~~~~~~~~~~~~
--
   In file included from vma_internal.h:55,
                    from shared.h:11,
                    from shared.c:3:
>> include/dup.h:354:9: warning: ISO C99 requires whitespace after the macro name
     354 | #define VM_NO_MLOCK_MASK       (VM_SPECIAL | VM_DROPPABLE)
         |         ^~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

