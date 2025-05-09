Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39760101E6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 01:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746753044; cv=fail; b=fTRHblQxWCRhzGGBFQC5F0YN6WjXyPH5ioaHed5J/oc/lb0A4BuDrv/Lz/AEiEfotaFWDUbmaeeOhBN67E6Bv6dy8MgQj/twnUEdZM1V3jI1JAhtVyKU1v7XvzVhv7I5fnhrMMV6tixCCLTW49OzvlLxdtQXSbYRhuGvQ090zvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746753044; c=relaxed/simple;
	bh=vh6TSd/UL+5KGgDFpp2Hb7wcJ5Y9/Rk2GjRKj7R1ujI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LTFR2XzseXDYEDTMUuPw1ItUfptsUApK9mRFwxL24xOtOdjpR+iHYwYZTb08CPXPjlTQadXTwL6tGJRBgMBb0IU3Kf3XL7BeepXpx5dtp4h/MszI/zMDo/XwgA62BkT7S2qLjfu133sa7mCEK2/ivNSIgURvbIPtClNhwkiPdDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkBiL/RV; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkBiL/RV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746753042; x=1778289042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vh6TSd/UL+5KGgDFpp2Hb7wcJ5Y9/Rk2GjRKj7R1ujI=;
  b=CkBiL/RVhIsD4zfoaEy97x9ESmFh5wQB4W5C/ZQvW3EUiHp+kMSY+pbX
   v2mJ9aojv/sX1A25/YjJIBClkT7PwWSd6y6BIJCr6P65LNWf/Tx938jyl
   6q63ynk4y2mXhvvxDMKW+4M7JUL9y1ayCfrmH8JLtTQvrDAulxj8KI70G
   L4dmowICf4MiW1BPo3Nya/2oHo/mYt1/ULj82xRmkhP73xoOb9K1nXoF+
   4pnXwAfqRRp0lW8Qp5KN2spPezsEp4oeRFt1ClmtrQB5gnpxLHRzAhryk
   v/C++2tioevqywy4FyebPtDQk07PG4PR5QlEEtkidfaj0FjLf09eDgl0X
   A==;
X-CSE-ConnectionGUID: z6sz69YhRpGvh9mkyOrTcA==
X-CSE-MsgGUID: //H0FTB+SWehGZHBV1q82Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47822612"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="47822612"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 18:10:40 -0700
X-CSE-ConnectionGUID: zVmIAI7uRpyOFdMewDmrPg==
X-CSE-MsgGUID: zvFEoSG4RdKc3FLGmHOlhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="159765696"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 18:10:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 18:10:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 18:10:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 18:10:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAp3JmCO23o4GV0Knuj/t4I1CPGE4saX96LK+uQ2P1WsJ9Ri33/2glNvS2TDRePMig/ylfQJE1b6HlRaL0WjIo/pjCLCOwfQjl/YZYOft6wSwhzrtagU1jh3FF94z/Joe/Ez7cHse5ghPrzUGUZ23jeMQVujYyy8s4rEX0RpfBpAzRTmlHVY5BgOnhUllovYaqldcgWpk41WTYN6cizElrd7n44WQuX0oQeo2I8UaYqaZoTfvy2Rqg635Dmu4OT1IOaW+ou09dpQldrbR4shvLsezFEH8dYp1twYSHG6chc0EgzXBD+Pk4DdBa2zSxQJliX1FjDmwyqJj7nfK0CmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIZ6QCQmg8do+gA4cfEiQU00Orrh1rzNKq1MfxQkN+s=;
 b=XhHNrxeVwsjVrukkai5PHnbGpbBeeTKigQUzHOl6pEN0JxDyZDKgremIhn3P4G2fzb3T0nAJpxcrn+KGqesokO4X5b30cHIZHJQ9nVA36ZKoNi9SXNN6iCcwHXAmfUjqQQNKCn3quJwDKpFljrXHWpCprdurr579LsRQOovVFz9kqfuTMGg2e/ulkV6G2khimZ+eLHPJuILuNBbYd6RY2l4ZcZdxGC0qr6B/sAHbquwYVPStbFjxiH/GtsoAOwTewm9rgN0ziKFJeIZQMevjsLK3mlTTRz5WGHXwmCPDgxSWH9om7X3lGV3vdF7n8Br03fjilQbmwbTR4uynF9NxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 01:10:09 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Fri, 9 May 2025
 01:10:09 +0000
Date: Fri, 9 May 2025 09:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jpoimboe:klp-build 51/57] htmldocs: check.c:641:9: error: call to
 undeclared function 'memmem'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <aB1V6L62sB8nUZhY@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: f78f9e95-2b21-4271-b63a-08dd8e963d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TZyfFkq4+naFk8Kn+jlEgSN07EOviOVsdjBvCa3z6agPOGPtUu81pqhirksj?=
 =?us-ascii?Q?Pd2UdR5oNK0mqxgNVi1pkA5OaZarWYtf6+qmufhanMlz/Yfo9Ci2Kmdct3JC?=
 =?us-ascii?Q?2XMFZh/F12FcZ+gl/eNesrpPCK8TbZOY1GPnBrvgyWtTBxGemwO3z6G5GVHV?=
 =?us-ascii?Q?1lAMx5jOwSMvK16tkcqBoxT0RdH3kXP1GWeVvTMPcZYGUzzL23OHU9n+sZgX?=
 =?us-ascii?Q?HATdujsELToRP6S9pHuJ8BUScwSWepkAhCbsyzUsfNw0qLI3RBQW3sX7nOhe?=
 =?us-ascii?Q?gmwwyLdwUxi1TMOHZ+7rh97F7dbAg93gU57nfqJaPbJSfNulFEsa04EpE/s9?=
 =?us-ascii?Q?oQ4jrxnx+4DZ0KGxLGWjH2i2CqgRhBFhknZSPOI9aPH7344cyKzQyADgTYo2?=
 =?us-ascii?Q?WUOZNsAFo5BqcW+elInpdFoQpPSU7XKH7DcAKKwukcvaV3USK2GcpBNMSrTl?=
 =?us-ascii?Q?VY02fRyHGpakf9XqL64CntUICOtS24pQXB0EdbSHPZcyLeJNK56Juxorbbfl?=
 =?us-ascii?Q?5m2q2st+MugkwwRVjmU6kxZcfD9nKuOmjV2us/4em6FO9NT1nRTz2SQ5tW7f?=
 =?us-ascii?Q?5r/5vhUPFxNcge3A5tCcaOzLWuDrS2+1svyRNz2rtitQghnJDyP9iEQASVq3?=
 =?us-ascii?Q?NDuI5oJ7UmoN4kEjD2bTYyDOSldv3IGj2BRsS3mv4BO3oBsNcC6Z+SREDZHu?=
 =?us-ascii?Q?7hUhlLwLlcbYRzv/3C8xcPhuh5lXECoQZbl488JW6if5GjUxGaQXmqmACOnj?=
 =?us-ascii?Q?RwlAP4b9CPY1O9n75n8x1Tdbr4ZIEd7/SRxksBD0vLT9IXc8qqvvTTt7Md5b?=
 =?us-ascii?Q?QKMTXnaOVA2+hpcpe+QovxEjj4ENZCKHI5gD8Rxc2nbRAjBsz0dxGdEo5/G0?=
 =?us-ascii?Q?tzSLmAX+vdK4Y/scqwW6gwHAJ6gtdMNauTh6P93jrfo5BZbPNAmRwRsKABGh?=
 =?us-ascii?Q?AVyHmFwieQdFGFzu8npcvtWi+ZZBMzYMDWy5JBizxKAFq8WXl32hkvrxGDQ/?=
 =?us-ascii?Q?Bbilx82xlv6EO1a2Jr8xrLXMjc0zcZJCNh22mvdHKQ1HEyrLRgrbJCU4GB3F?=
 =?us-ascii?Q?OOxv3aqc86ivTWmLBTU5gJ1VACh0LdvTmk96E8YbD/OaLClIUgo31zKvurWU?=
 =?us-ascii?Q?UQr6/j/fV/CVnTHFIQknBvZDY1Wuhnag0cWI5icIo16bTL+WFGo2wC9GMwlV?=
 =?us-ascii?Q?ZvceQFFPTQb6f/XJ1jddprAhjmMSzJvvruWco1eoIEZpDbSkclJCGVGJXJRI?=
 =?us-ascii?Q?viExCd6u8lEkIee5a2eW9Cu5ByhxCU7HU2In2B2sLXpyBuOJmqqQJbReK9dG?=
 =?us-ascii?Q?hGIJlWPweIspNBFLfBBQ0MbH1iABtDQA+UxWW1pSmBodQZc2Ghfpzw6H3Vef?=
 =?us-ascii?Q?SD5pqZL7/YVjBfMRPWnhsEqrq9bj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PsoonlWHJUoK6S6dnfD7V8hYfRxLACPSJGVwnSLazyjYtNAotKX7357INgae?=
 =?us-ascii?Q?wR2HL/P/LgisIN+8q28bU6SXLdMwyER5s09POV/WlNsEyDHn+s75uapozYrL?=
 =?us-ascii?Q?TltJ/MQzfmohvl0jI5WjLTjJY6qYyTByEIs+9cmHoT089tE/dQ8nkLVGk03L?=
 =?us-ascii?Q?gDP62LRsuwqdFPjKEX2hpyrRBB8voJ43Nxd8z/Iagd6BHm/98y8TpNanaX/m?=
 =?us-ascii?Q?XfICly7V3lhQSbp5FvTa77Jko96S+Vxzq4CxISzRjlTyyJIMTNq2lgjLYOLE?=
 =?us-ascii?Q?1pQArywv1U64TH6TK8zYmreyKEeCdIkVAvO22uIPqVegtdqg90hC5WRPI9fV?=
 =?us-ascii?Q?YiXvAPJGo/b1b0O9VhhNvRYwPB3x6p92yAmNfVeJ1UIyDrJ0knVq3OlhaZEn?=
 =?us-ascii?Q?34CXkaOubXk0+JGuq3qhUvEv1RslkLJLbxIFQ6Lsp0qQCrYkBhEH03YjHjaG?=
 =?us-ascii?Q?zSI6n6mrBovtflGWiU+fa5c2Hx5RIJ2dohHqOqGcYc13MsXk+yMV3PqREFxU?=
 =?us-ascii?Q?jJN7ydJPCZJjIeC7RgGGL/ZbeTm32vPjIwcoE8TIaIda8rnxG+ESW5dLrgrB?=
 =?us-ascii?Q?uV3rNMXoz3tB2cPslKRakTXjoqKB865xRtgWsAR/lvmnSGb4xEg4D/wo8y4U?=
 =?us-ascii?Q?2+n1GE7bmpoqcnsLKSMZ7e7Cor8VVJGDxfo/JPvkjwKP8p3HDzMtU2nFVtn5?=
 =?us-ascii?Q?WcCXVtscDgPWztEqmtge/Jpkmv+L7wH3kowRocKaSIs8p8M8DDSHm6YSUSf8?=
 =?us-ascii?Q?C/UFT6DaeMfwQ9lzETw+4M1epRuhFW4ldM2MgZQlrjMjjnUj7f9vUV5j0tS5?=
 =?us-ascii?Q?8tX/UPbrlbQmdmveIKY+QqnDbRYQp1UfYFil0DjUh5oxWuwvNBf5RmaS4zvh?=
 =?us-ascii?Q?z2+uLu2TvHPirACPm2z0C42gH8wadTgJOrLetKUVAlxjr58O/O6vyFI2Ix79?=
 =?us-ascii?Q?ws6fRqAGdibq5V5q3gjGBYUGb+ZT8v3oKvmjlZ24GxRJEH8FfXT+/PWcWs0Q?=
 =?us-ascii?Q?Zc0CEfoiXcGwnpMuqOoIIYnpXKkZk8eqKq8vuRaJX1/frsFnV6mOsd1Dfv+i?=
 =?us-ascii?Q?1guNlsQp5PnG3S3H1beUxpJdwClM8PMLm19SGZVREE1prOznhfLD5ELwQpJk?=
 =?us-ascii?Q?BXkSSoZpjShtb7FG9XuaieP1+vE7QJ11aGvxlYarlvjd+FlEmfIhRVxK7dfq?=
 =?us-ascii?Q?RCw2+klVY2pnQf261XPGCOEssseyIkK7d4Fcu+pMi2NW8y+/1u0RSXqgB04B?=
 =?us-ascii?Q?A7WqCY3BmzoZJaW9/+nq/bmAZ0HT/Fg999T3jbuaGFXpwBKdo8usN8BVH92t?=
 =?us-ascii?Q?vCc0A4kk5jikrvVrrz9pO0C+/05P0pqmYhSt7d34xt2NmlE4aNMcebCZau5O?=
 =?us-ascii?Q?nukVSLGswBfFtOBFAzaL+feyVDEuRINUb7SaQ/0YCW4bBlEBXxhP2epYuJjR?=
 =?us-ascii?Q?XSd6VQ5+2JnmXGuGQfOtZMjg0HENKXa6b8HUkw/uEqWIv13o4Jya55IbDr8R?=
 =?us-ascii?Q?RMAd7oBEbUvO263wf8dZkhrGiUtpcaj6zYdJRx7VXComV6YI1HzxRqcy7B/C?=
 =?us-ascii?Q?Vv79Rmw1YCb508B98FCp0PInwb2t4KHgeo3ZFommpGZSm4u0+q7aGXAPYxuD?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f78f9e95-2b21-4271-b63a-08dd8e963d7f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 01:10:08.9479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTL9DK09+zYIqEdf0gtar7e3cul2JCYZ2PsG79bX4GPssplQgGDqLPkm+3lZblCJZpehnn/gjMcU799lJ5NMZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   a756ad343c6f178683f423165424a8b5b8048da8
commit: db5ffffab4819bc919ea60b818dabeba709edc58 [51/57] objtool check klp
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20250509/202505090139.eNgYYbIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505090139.eNgYYbIS-lkp@intel.com/

All errors (new ones prefixed by >>):

         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[2]: *** [scripts/Makefile.build:98: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1277: prepare0] Error 2
>> check.c:641:9: error: call to undeclared function 'memmem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     641 |         return memmem(sec->data->d_buf, sec_size(sec), "\0livepatch=Y", 12);
         |                ^
   check.c:641:9: note: did you mean 'memset'?
   /usr/include/string.h:61:14: note: 'memset' declared here
      61 | extern void *memset (void *__s, int __c, size_t __n) __THROW __nonnull ((1));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

