Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9E5414A3B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337148; cv=fail; b=p0vWYs4jhplRp6o390BwIQ6w/FaTZ/o7OLfnoWa7fB39ojNQqNpFyb3VpXak2g0IXH+zrWyIO0dk17O02PTPKd2R/8SzSqugWQ6kaGNe52ijpYD0qvS4twEqLYoYdAAnhdMQXmJPUkk8N3ND0psGYxIqA+bRAvSDC1C2WiaETCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337148; c=relaxed/simple;
	bh=3DEtkPgN1/rNo72Gz7rbhhLM02Wup2ttmrCdk43uEFk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=bhKv9nusW3wntUFhUklv2NW1T8Epjg56bj4XeJrY2cJaF6T4fi4+3bznuFLJEKnHNm2KCcdGzOghmNZUTj2Xdrr1MjH11CJ8TSxpIRVc5YaNTxhiHf28mCZvYLSU5F2COwYl5OcFKLJVMWAJuDugdBBWoBFJCLuJrKbZVyOYlxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iebk3Fue; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iebk3Fue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790337147; x=1821873147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3DEtkPgN1/rNo72Gz7rbhhLM02Wup2ttmrCdk43uEFk=;
  b=iebk3FueYnF1inntMfw1HUoBpr/DbXVy6ux9feyXgJXfsHlqik2ALdIv
   Yk00xsq9tJzx5Sgm5+NkRSyNI8uBEQMloyZWI9+fDmQOsoQ4jB/7qYDT9
   EFd6nJL168tgmAUsgAJ0cIF4yPKvJw9t93dWZ9QsH+LHLxXJfWCQvuNUU
   GMeu3MpeRwzP+NjaI79vXIor5vdVUl8ER4OLLvv7VlGlJtIUGp7jbZY2c
   y07Gu1PW/RuISHXMxlz0085rNyjTc7Gt2Nw7AjK/TIXK7Mz2yhIhRk3Nh
   A22LK8ASb285d0qLNUs9cOCY1bBN5L18J8RHpgla1+6Uim7JJ5Zbd4wTB
   g==;
X-CSE-ConnectionGUID: ZqlU7IwiQuyvTWeWQi0q4A==
X-CSE-MsgGUID: +IWTlsJeT4KSvcZhOG6qDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93616735"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93616735"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:52:26 -0700
X-CSE-ConnectionGUID: vGJqkCvvR6aGPqRXweFTng==
X-CSE-MsgGUID: j5O9lvlXT+GoRmb2RMw/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="312239707"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:52:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:52:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 04:52:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:52:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyJoWPm1uAMwttOPY6sqM8pIMovQdne70CL7II111oyC/2oGOuLVLTuP+1bZGJrxCuu1W2i81QyVb43Fqf9LIe89tbNUZU0AkTUbaHSwIVgXRBxhppMn0ofA8FYNauvdjxFiINo6RVCq9imUZyGCEt9KKIQR4swAFmREwBMHN0YWWawWkQmp/j4coE25QFHpFzNiaIl9M9751PXMDD2j0DV8KkUkNY+h8vs0gAKKgJnA/o+vyfBr28i6hbEBzJxRY7xJ1bpGuJKrA1zxVTl2zk4wKCVhQpDAbBEiLLDezaQli3zvcRTBtxR03UuICdrGzPQ23FqLIiGhJU/fVrQ26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmv2TTG0VI/mbV6FapLAiSU3kzHufICKtgrMndy2nhk=;
 b=adPTxeXa1rXJsk70lEgTuvu0eRFMPLJ7p2HRRB2I3dOuiSHJUNNBVoOQRVsFG2Zzb22bXyaTA8i9yc9ptqid1tvNEHRHi9brpWe2H6ITW22nI69aS0zCzpLUpfR5nv9pMlDAsMi3hKrWPMiJvXA/S2ovTN0M6cg440Y0dsKA34+udU/qemeOBHjaT7vS48yEzzS68C6/Er6DdjJpQ38ORIeM2oy2oUYXEPuXKMioyy4OAsJXYfFiaBpR91BOlt4r9fgYA3QaJWNT8ICb7N1lELYBN31Y9jDEziRXCN37oWL99pzneRJMHDTtZSnG9hNQpOc51quTZL6co/o9j01ArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by DS0PR11MB7286.namprd11.prod.outlook.com (2603:10b6:8:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 11:52:18 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:52:18 +0000
Date: Fri, 25 Sep 2026 19:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bill Wendling <morbo@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: word-at-a-time.h:206:10: fatal error:
 asm-generic/word-at-a-time-instrumented.h: No such file or directory
Message-ID: <arZgbJddxFYMzW9j@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: PH0PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:510:5::25) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|DS0PR11MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 0483bd6a-b9da-406a-a40a-08df1afb7306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: yK/pQO5qjAijPGC1UBeMRcpFa9OKsIT0tXDdegw4e4hqJH3KkdWOc2+zE8ekScc6sKGvW2JTvDs+e6HIk6D/280DkmKG5C0ZnCEpD7oym7l0tKRUWTX5thwzWTyySZz9ie9KzCt2FJcGIW72uWgba/pX9izWArZAb9ziNHnkHEwPOIWrSOF8mmmG7MdT5w8gmLN4Pm+Tm7Ieppcwf9DzprIpHGCytW9ae1beCmg9rHCm8xcam47EkWJB2zhymhGTYxxiK7nrVI9MqGpwjSDFl15F4aiTPgF0gx27vHkOjR00wEonjzKf+LzGcsUUWvVOYthug10hzi1AEYqmtxIHVH2tM7xKb+miMPDhF8v7FvdZhkL6f1HJ89eCY6Tn9M4oXCUB1akvphNQjPfFWYoDr+m+ngI0Dy0XIq++bnqwrYMN/S0KvBxA4ARbGYistxDyp+XFisoOtDxA0HrDVN1QlDHDHFDAEAdXUFhGGxpwi2P8+KK7lPbfyCTWq1sNObBsVg+zLzlUhX7O9L12Y9d4oUe4jliY77X6KO8x8trezPDzvV0p9Q7kwk7UtR1aJXWB+ngLVyKSYN77vThn0yEk8HMI7JlMujjclkKascxlPpYKlPid1Qaz1qqGx63Hp8vs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jsZ0i2ql9eDSI2YcoPZbe/ImWvjtFJlToxTHKhbktT4a/NOusMjN+QMf9D0Q?=
 =?us-ascii?Q?/jOMv2LMydWj3tmQQxb09Af+xizxiiwCZtxoscoT/QtlZRbipIIdpeF+I+/7?=
 =?us-ascii?Q?NtF0qUoOWVEs1htCD90A8wuIqhFUjnNILFtM1AfLa85k22ZjdU7nWZ6yEyf3?=
 =?us-ascii?Q?/HmlrQ2J1lgim7YdfZ8SGXb0gmeAgYc20+eZI1fGmnUysFEs+TWuCTPQdOdY?=
 =?us-ascii?Q?B4lGUsDRjb5tsd/n5sWZ+c5Ergvl2tM5NQxk/BYbtwAPhl3mekB9XZFn5Rry?=
 =?us-ascii?Q?GzTfP7pH2jcKn7xsYvy0ozTNejwk0htRuLbyUe+++csp61daV4SYR0W6SclF?=
 =?us-ascii?Q?rtMLd4hiTwtURoxrPGsHNL+d4ZXqTHXQY56BBrMrDCzI4HsAAQmB9gX0W9xK?=
 =?us-ascii?Q?qYhZYij7RW38aQ/3dpOtBtbiUKOgJlJ3+iPBkykcPK1ta8tZPXMSqKlJ0lTr?=
 =?us-ascii?Q?CxJCE+nAecbREWHyqVBK5EMnFhHMLAUzkXvDEPGNtwL+yx/aHrmUFpBvV6m0?=
 =?us-ascii?Q?pXAL31771LIujZRcEn491ymt+jKOeS49wfXlEAH1uYVtro2waURESNXKoprM?=
 =?us-ascii?Q?W4eXL+mJdttqENRev8b7PvrnD5b41zWeVa2hj264bu+Aj2tgn6/E1B7e+kGp?=
 =?us-ascii?Q?vJ+823UfaxtWQtG6j8kuTlqAxtwbmBrIfB8IjqAFoesxKLl8qmZ5vHUVLwh3?=
 =?us-ascii?Q?fqFnZQNa6ScVOgQy1p/8dewrQCwmjZ/WfGxd0uNFwkwfmx5yUGuEEGSDoGcq?=
 =?us-ascii?Q?VexHEH/yvpiplUYFZHXccCYw33o9wzRqgb+HOtMlmjrMpnC9qtD+s8L/C7S6?=
 =?us-ascii?Q?aO3qTZTTLMKZc2cdVrTDyLMc3+Ig/YZzTzYpNq3lQ+spH8HKYNdwOeNNg2nt?=
 =?us-ascii?Q?NRqWw2r/QaqvcM5NEhPlmwIo02wq0XaTwRFCS3UTn6HqKtzFwGNL7Lc2e4NI?=
 =?us-ascii?Q?4O31EUpkjL/yu7khFv+1vJbB5Id7F0iu5qMic11ZF3smkMeZSC04cAZW0GXA?=
 =?us-ascii?Q?78cjZKjknskFVsE7GM6MytRmkXN/KOYiYCZsxhUQslSqJy1KkGR7lcc8nQZE?=
 =?us-ascii?Q?2MYl33nqRd5kE5cVYlXITgyVLEpH6PEDTmSdtMx8oCnalNODkKD3j4+d0Mtu?=
 =?us-ascii?Q?LQS/Nj2LPwvr2UwKrG9Ijg9QotPKtkG8eABheUaH9Ei6PBemIGh1AK+/KXUo?=
 =?us-ascii?Q?2XntAIZA88fNzcLO+d/MhrEyA3GBJDlimj9+PqvrPWQ3hyCxaM9vA9Dz9nEw?=
 =?us-ascii?Q?tL1C7PqlrLoaaxD5bO1Oe/Ajduo1oNJln/fUxCFkYAYKTdMwujqqYN+217Ws?=
 =?us-ascii?Q?Ri+AiGWzsbELLOC/gnyxEZFTYg7KFv4mgUQHKkdQOu9GGmp8eA/FAov4Cp4U?=
 =?us-ascii?Q?HdzcZj/o1S5JWQaZYYk2029wb97eFgA/N9aHLRGefxzoQF+PAyztJNQBwByx?=
 =?us-ascii?Q?JWcVpU9FNfelEm5aFLjWJtFdTO2+Ylg3oKI7vjOfr517mf0HbMT3DXX+LUfb?=
 =?us-ascii?Q?AN2BKlG9Ad/1/5BASh+DaeTKgiO/8mPWP60wB3OHpYilEAlMIrbL4fbMA5IZ?=
 =?us-ascii?Q?I+PwkdL//39/9+UtLQvwww0PSAQPlhFAocbw/S8627AZEOw4rBTRX0T2vqLg?=
 =?us-ascii?Q?b+dYPXNCYeQU9XLWan7LYdrW+qU76b3gbjf13IiMBZ7JBYUFZbI37MNsUIMW?=
 =?us-ascii?Q?BXRjve23wC4cO2zPROtkMMGD8PUnCN1ACuez2swXCqDidWsztO+4QJnKh3+s?=
 =?us-ascii?Q?0wda3Rba9Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: TDzWAiDndB7OP8/gJpXJ/Z2I6LVVBuVyX6XMa+KkeKZiD+67wSmhwrB/ymQk15Wmp4xOTdALXibKZIHZ6o9JwkrizCYjNX5DfnwBats1U2MTUOQ0lU6OtHL6yWBm+EGpQcHmBUruoqJDueYMpMMr4ht2BIqitfs94HB5v09uioOf8AlcIdfRebZYINeYFUa/qaBrSjK7XKs+MdKEYbAvPj+QEX+Nor3lfRJkSw6oHOIjA3BjPYEeHNxsDIMRrcS2jgf+pvfE5NTtf27ZXPhkKbKO8eASXW4VPA3bODElRFgiawgdeR/8NHDt6Ji1v/OfCWP0YNTzQ3eeiakfE6hogg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0483bd6a-b9da-406a-a40a-08df1afb7306
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:52:18.1488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dzTmaRojU5xQ1YpWyuUew+5Oe5BPZnKpJeaw1Tyaqz+pYMvuMAN0KOxqmdH9CkrQJIMVg7Q3CHUC4LI3D9RCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7286
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Bill-Wendling/kasan-Add-kunitconfig-for-KUnit-tests/20260911-070339
head:   8eb2e4de44d36f988ae01685852429bab194bbc8
commit: 8eb2e4de44d36f988ae01685852429bab194bbc8 powerpc/word-at-a-time: Instrument load_unaligned_zeropad()
date:   12 days ago
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260923/202609231856.FRpz24qP-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231856.FRpz24qP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609231856.FRpz24qP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from load_unaligned_zeropad.c:26:
>> word-at-a-time.h:206:10: fatal error: asm-generic/word-at-a-time-instrumented.h: No such file or directory
     206 | #include <asm-generic/word-at-a-time-instrumented.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

