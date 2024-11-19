Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FCD17C8D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 00:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731976183; cv=fail; b=B5KauMGasMcK0iyqW7o/VogdKUXO3LUKCYH96qEREe/BZd01cjr/XbNWeHl0tht0FP4Y6tBwB7z0QKoFhCDzHAjIORrNzIm96yT5uTd/BULj4MUwuvh8wX5+RPunZiGRatBYTZddn3KKfBsRk9fZqsqpPFDJwU8ydQnTqxhAhS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731976183; c=relaxed/simple;
	bh=EfhFcU12l4Cms6YlecfKzFGtJQPMvu1WJaAR+yyvj9A=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=QM1S/qqpf7XSJygImkzFa7oiXjQUGLWPhi//xuFaVgAgQvvQ0zJrpe3Jqnlqp9rdYcWKIRtm3msxFIUSVrUKvivwWOn3AlegPl3PHLGdguNveZege1xDFr7Fwjs1T7eCJz0PegIcCfDn9AVsH9t5XHYt6u7M1dvoqaIxbXZg+jY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUl43l9M; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUl43l9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731976181; x=1763512181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EfhFcU12l4Cms6YlecfKzFGtJQPMvu1WJaAR+yyvj9A=;
  b=mUl43l9MrZPOvySWTfet9aAwSthYYaV9hNJdyj+XND1IY60dR9Wwnh39
   wyhlv4nLN0Gr0y1B50mx5Ej+IEFvdCubaiWZdYSxo4AGTR/473Wou91g4
   BJNgYIJ2hc5l/ZXZZ5grFj0ynXqX3l7Vi0Y/OvxoxVrUZgLplyYtq3kSG
   k8lSQmYpKJ7ZNEO0D+IUElZ1hUQNY9qSd47umk29dpA1kf8kr9IC8OUAI
   pGCJfs62UvaAhrTYrUFBO3m8sXJgSO6lEt9RrUfTNiQ6uKKt1ueWjRouW
   xFKgfgm/+wlzeDBJL9ruCswHsQBMgvcPSaZ4juGUPXUeVjuddFH6UExT9
   w==;
X-CSE-ConnectionGUID: MOkjChIwRYCEzvHdmO/91w==
X-CSE-MsgGUID: IA64RW2MR9WiFm6kQvUB5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35862370"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="35862370"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:29:31 -0800
X-CSE-ConnectionGUID: ri8eP7ZrQiqxneVoRSPpaA==
X-CSE-MsgGUID: 3Ke/bPyaQiyE0QbqxO5XWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="126919398"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Nov 2024 16:29:31 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 16:29:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 16:29:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 16:29:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCzSE/DZajT4rhhRHiERzjhYvHTmiMXoHlXW/fBhCcUr8zGEUT/KMbHvt8hY2ee4AsvxiQIWe/P36UlQwUwRClnxOIYX3OhuRbCPmwmxt+gX2WzTx7zLFkKxt1dmPYtjqkUVY82efWbprnS8389ITH/RRJeZa8u/wH7SzbEjfz/ZBDHmihOZQRHzeSfsjx76+Ef3yO9ZVLhcfu2qVwhaqknM2vHoYxZdTrlJ9k28uZhMlbkRzqlF19GAeo8Y/u0LLQyUyh5Ukw8fbLI2rB8p+AOpVf+/dqFNG9IsscTPMhbKNScgnp3O4gvEBINp8oM425eMbrp0l2S8GGXyhmdb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MU3mcA5wInlZ15Ve9MLBt2jExZB2I3K996addquVqFU=;
 b=GH/Y9VwmSjpqTZl5n7soiMyUNJAUZgIrrz9ZnVphVFZdBPa9R7MIimFDYhsbrTPVYnZn75HpT61k1Jo1qB/D9F+sJ8v1J0vJSfUPFw68I/cCDyKaMzxiBcaXecyww4tTZc6ISa6xSiWoRRuWxsH7TGLG2YrxBkuK7Np1MM8ceSnWR+Iaduxia6mP0OzYLrjXCUfX4cFqLjS5iFIJDO2kBDG840HtSfgGhNSogJh/CeEDQ4AYNvQLP/ONqbA/g0NEkj7YSsqX487RDjZatyk3SXyJXgLBNrZgz/eaVgNcnmNBC+oREKTITgBHT+vG5yuR1Oi+MsSAj9RMIptufp9OPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 00:29:26 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 00:29:26 +0000
Date: Tue, 19 Nov 2024 08:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [thomas-weissschuh:b4/kbuild-c23-extensions 2/2] fixdep: error
 opening file: lib/test_fortify/.read_overflow-memscan.log.d: No such file or
 directory
Message-ID: <Zzvb31nMDtF/+DI7@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: b49ef4d2-6a63-4ea9-3315-08dd0831391a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s2ZdNNV0k8rus/0g2xpIwFvgM07nJfJLHpa6HmBf/o2C5LpxLU3gEYPua4wj?=
 =?us-ascii?Q?/S3z67tPj8ETMkCHA4P4k2M0D5ddaA+2RqSfyx4V0IrSIOPvx9YVmlm9iXyu?=
 =?us-ascii?Q?5DGBsZEw50rwCx/7a57l1igc306qsvY8BPQ7Qd1MSwUX1gt1kmxv+KDuKMz4?=
 =?us-ascii?Q?xikjxD7ddDn/tg6xsf6ygbL9KGd6rDqXlnDGnkTerCcPpx5Ru9PE0j7DOy6/?=
 =?us-ascii?Q?qaC64OHLUTzDwlQ7878VTwfnV97tmrJwbWLTsDXM9ilrXpGoXltE17Ezpddd?=
 =?us-ascii?Q?txRndc5g+U3L5vyfmoYp+Eg4r+d3GJAO80guwriunKVgbJgBZ9cAs75e85xs?=
 =?us-ascii?Q?otpCTLCESz5UiGt+/PvL/1ntREKx1J2NBMU08P3eOEGnC9i77FHPll5bkqmj?=
 =?us-ascii?Q?cDapWf5qZMuuEhGEPrRhgwk1c/+6M3A85TSDj2UYEunU44DkVr+eH5ieFGpM?=
 =?us-ascii?Q?7NslO5ekxKpnYlh9NJKgSBF5Ey0AgG/bhwL5lXC2eHZYQIe7s2JLjSuBXVys?=
 =?us-ascii?Q?jFfVnhcnBmLQKxOfoiZYt9FrD2EC9bTCCi6kjwhsusdnGmgamqiebVqHqGTS?=
 =?us-ascii?Q?+HN3SKu38CWtckJbj837n7R2CQ0x8TU35bAcTv1LUZnwstSTmskJD8Dn0L72?=
 =?us-ascii?Q?OqKVSKrS6aG9l4KGfQ04cdC8Nt1lRDjc1I9EF/TnX589ve6ibYUDWf8OsIAG?=
 =?us-ascii?Q?2fLp1E66UJsX9L2uboTF/mqHpS+w03gJGNpR8y657RfquiE2ilxn/BpLCVZt?=
 =?us-ascii?Q?6rIOPskIqRov0xcwyQ1zkEmzUllDgIVYXwuUkzBXcqwKZrXfXFTNS96Fcu/r?=
 =?us-ascii?Q?X4MAdsIKVG4ojLZuEWV0jH63rKKyqHDsAXf4VtGz35eFfgeT5ynLUzJoiKMw?=
 =?us-ascii?Q?coSOaJNjnDpJNIcG3cLI+HS8s+5CbAwlktFnLwypuYOwOYqDFMhIW15aaQb4?=
 =?us-ascii?Q?/8pOpSYk5yK2NQw7X20CJ+cUSiLUSAUQs9rh6VOevURiBUJe2QTyUxSByxlA?=
 =?us-ascii?Q?Qgz5BNt0hbxC9VqgoCi/M5mqt/W49Lh6EtG1M/2GKd1zRoo6h/Gp8l7SlHkh?=
 =?us-ascii?Q?7QhMZN99O6ILJ18hucZxydShXNFHNhcwjcBn6sAvAvwLECoy+lcj1TXGB2pR?=
 =?us-ascii?Q?p55n+W55xTIJ9Y7lEh/x7kis1Vk8YKV9FDKJ78zgEjjs0VT4gJdiXQ+0Re/J?=
 =?us-ascii?Q?JsPTX1DgzJGvgffTFyDEmGMQxhI/DER5dmOCO6m5gfC5rClE+3ag2IPsj3XX?=
 =?us-ascii?Q?DCa8dhluFozRVOAvV/7926bY/K9VSUMV8dba600W7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r9KGyAKbb4hGQESTXL2Fhjx8VyyePw6Pgr1C6O2icUhm1rIJn/S3rOj4wKXw?=
 =?us-ascii?Q?dWQFPiwUYwUlohD+QPETFkuTd2uVE8tUM68VVRldh6Y2UsbS7tuOXkBVd9NR?=
 =?us-ascii?Q?rtwNMMTXyFH8/3CLX4JZQnnr93gTxSh4JW3x91khIdv/4dwZsbchg3ciCMvb?=
 =?us-ascii?Q?IEHfzzKHKyKUkCdoTTjoUWq1KmIj2B6nnvDANwfpBfv9+Jmchsah6uPkLW0v?=
 =?us-ascii?Q?rT+iRa466tE9TeDNFAKgCNgka9rSrifnjj2p20QdNAdg2LTNg3VcN/hmxkWm?=
 =?us-ascii?Q?tc8vGd2aYFDc3xk/QBh58FixZRqFQnSzjXvWv27w3rRU9yoK91/dSBujO2RC?=
 =?us-ascii?Q?rWm4cBIzcrGZ1puu0gAE0iOTP8CD0KrJ0GJ4vb0M/RQGS+WRQOjF+gC/5kRo?=
 =?us-ascii?Q?lquDtk88ev0KxtFip+M+S7R1z4ywXF/3wcJPZZcLzRpSEO4ZP7KHBfpg3xzV?=
 =?us-ascii?Q?wMsBEvqCMdpaezjnNuSiR83UymdkMJTmdl0vwceUKCHJIXxvZvuCw6ba2zP4?=
 =?us-ascii?Q?PRL58lpkOwlFi2wESZES66USr2Op2Ov52R1Xnj+6VfTxCo++jLzmqHLkPC5o?=
 =?us-ascii?Q?ugCGV4RQmV9V0bFV6eSyvcx5JK3AS4ArGC8uRJhhMimg5enNLxTWg+jM+AC4?=
 =?us-ascii?Q?wNlulyig8obvqQBvlkQ3KyLCqHJ6NMaa5htX7jmhlIopXHbxE0f6WzsqP5ZG?=
 =?us-ascii?Q?JyY/ZBSYA81qgjj9tZxOUV0DsitJkP0+iqQnI+bzGfhP0Xusk/Izdb2WHVNH?=
 =?us-ascii?Q?2Z+baHLWow3YR8M7OY/xMudxLDJh2Zl4zCSpDbWdMZo1CBxHhrFPi08SOxb2?=
 =?us-ascii?Q?VcbM+1fybI5zZXIbOdtZlIs6r6NKotOjkndQOiJ70ujWJ7e6TIgjktJmeeWs?=
 =?us-ascii?Q?5OIt8qEuLY3r8NqxYGkbNRmhpB7lrWSeAxdWaqoPwHiJ9f7vBZNmBXyclQCo?=
 =?us-ascii?Q?+/K3BKRR2L8MT1r0TkI6Y0n02Lfl+BhMGYhPnsAu/hQJltjnTvobMrvJ/sHL?=
 =?us-ascii?Q?6Gg7Q9CYpbZ+pi+EhhIDjegkLnRbC63mOvDBmMGq7AWgy2prFr0t9LO9afV3?=
 =?us-ascii?Q?UMeLI62Yor3fqSa648ZNpuByULCvaWyWbqRxgwOxEm8rDnL+s+7cHhs4flHp?=
 =?us-ascii?Q?MXZmXjbzaoGnNbZj9tWfqmKbnr2XBWhDDqM8Rm8HYya6yyG9OA1aA6foyeGp?=
 =?us-ascii?Q?RryqelxISd2fngK8GlaLmvkWlnm6FDL7wWKVDeS2dcSXz4c06u8l5DKRUoD+?=
 =?us-ascii?Q?QJCabD2J2+U1b0Qqh8vcEakLHMBpEajv8+Raj7aFPWrojX0NiXWnmPcQ+D5C?=
 =?us-ascii?Q?Rky9NC8khelDlh5OzGN9gfIV27Q4CPxWnrJRG+lkFHv/L58OT+cg3+jGBb9R?=
 =?us-ascii?Q?o6Xj3aqhTIOdBAn5TT3oQXIjopVQkjRHrJebosbXQbHu/V1wn3aGIf+/AojB?=
 =?us-ascii?Q?Ko8pxTCtec4eX5MajE1nUTVHAfJxevDjCOpgfXJR/3rSvi3/40bfQFKHit3D?=
 =?us-ascii?Q?fZgRZK3a+9W5dzivVoQmSX7T5Qt9PgNy0Eeq44sUoiqWLldTBJWgQwwIb2UU?=
 =?us-ascii?Q?EUwURdpi6HSmQWNHKpIC2qFks7hDGlTzh3+hD/3x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b49ef4d2-6a63-4ea9-3315-08dd0831391a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 00:29:26.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIqGWaAKxAyqyBHUHZp22WakpaalhbxLKjRbkvY7Tahm5b/gYToABGMkb5iih+BieuFHUSXlwQcUesFO3NT44Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-c23-extensions
head:   e6d1e6eb54a88c725f912f98dd9b3548adc1ce6c
commit: e6d1e6eb54a88c725f912f98dd9b3548adc1ce6c [2/2] kbuild: disable -Wc23-extensions
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-001-20241118 (https://download.01.org/0day-ci/archive/20241118/202411182156.OhPAOv2H-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411182156.OhPAOv2H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411182156.OhPAOv2H-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   warning: unknown warning option '-Wno-c23-extensions'; did you mean '-Wno-c2x-extensions'? [-Wunknown-warning-option]
>> lib/overflow_kunit.c:820:2: warning: result of comparison of constant 65535 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:820:2: warning: result of comparison of constant 65535 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:824:2: warning: result of comparison of constant 32767 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:824:2: warning: result of comparison of constant 32767 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:825:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:825:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:826:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:826:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:827:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:827:2: warning: result of comparison of constant 255 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:828:2: warning: result of comparison of constant 65535 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:828:2: warning: result of comparison of constant 65535 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:829:2: warning: result of comparison of constant 65535 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:829:2: warning: result of comparison of constant 65535 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
--
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:841:2: warning: result of comparison of constant 32767 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:841:2: warning: result of comparison of constant -32768 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:841:2: warning: result of comparison of constant 32767 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:841:2: warning: result of comparison of constant -32768 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:842:2: warning: result of comparison of constant 32767 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:842:2: warning: result of comparison of constant -32768 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:842:2: warning: result of comparison of constant 32767 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:842:2: warning: result of comparison of constant -32768 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:852:2: warning: result of comparison of constant 4294967295 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:852:2: warning: result of comparison of constant 4294967295 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:853:2: warning: result of comparison of constant 2147483647 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:853:2: warning: result of comparison of constant 2147483647 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:858:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:858:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:859:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:859:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:860:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:860:2: warning: result of comparison of constant 65535 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:214:18: note: expanded from macro '__overflows_type_constexpr'
                   (x) < 0 || (x) > type_max(T) :                  \
                              ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:877:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant 2147483647 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:878:2: warning: result of comparison of constant -2147483648 with expression of type 's16' (aka 'short') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:896:2: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:896:2: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:897:2: warning: result of comparison of constant 9223372036854775807 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:897:2: warning: result of comparison of constant 9223372036854775807 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:212:7: note: expanded from macro '__overflows_type_constexpr'
                   (x) > type_max(T) :                             \
                   ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:932:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:932:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
>> lib/overflow_kunit.c:932:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:932:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:815:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);  \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant 9223372036854775807 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:27: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
                                ~~~ ^ ~~~~~~~~~~~
   lib/overflow_kunit.c:933:2: warning: result of comparison of constant -9223372036854775808 with expression of type 's32' (aka 'int') is always false [-Wtautological-constant-out-of-range-compare]
           TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:816:24: note: expanded from macro 'TEST_OVERFLOWS_TYPE'
           __TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/overflow_kunit.c:802:14: note: expanded from macro '__TEST_OVERFLOWS_TYPE'
           bool __of = func(arg1, arg2);                                   \
                       ^~~~~~~~~~~~~~~~
   include/linux/overflow.h:215:6: note: expanded from macro '__overflows_type_constexpr'
           (x) < type_min(T) || (x) > type_max(T))
           ~~~ ^ ~~~~~~~~~~~
   55 warnings generated.
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

