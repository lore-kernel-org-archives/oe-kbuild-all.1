Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B62221271
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 02:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728660; cv=fail; b=mpQkW1hxhUxeA6bIXd+OqgVH+aAJ3Wo1XQ9SpS2AvtnD65jZHwBJUIXyZ+MjDWv59ukVNa4IDvFxo28DK2mjSJ3Rs73x7n69QNrR/3Bfm0DxuS6IbGnBvldx5gzY5nzWB2R3clcWQBu9CYbEUFYm6wZozuwmiMrIgEwJkbC+rrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728660; c=relaxed/simple;
	bh=7V7V+43EXl0XWfL/wAKpDSyLZicbEB2k7jMraVem6gc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=bRlQt9aAB+W4T/DsCMqb+nHv6UHjQznAxF9QAChjwJPbeTUD1ghmd9GUnPGUFHulFnQ6tQuKZt5G1ZKyhX3cpo3zV1F7BrudzsbUvfXH7wLTxufmBTzqoc9nUkDHCWkYEpR0NCIjSk8EMJ2xyUUKC/lJzDB+gFm3jeYSWN7JA4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpEyV+fa; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpEyV+fa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764728659; x=1796264659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7V7V+43EXl0XWfL/wAKpDSyLZicbEB2k7jMraVem6gc=;
  b=QpEyV+faV4s/QbbcnW0IIu1jWrFbVTXFMdvaruGSUpxQlZuK7nbfbA/O
   cbBKX0iXL+AsT8wtZMO5Y7Mtt8P3c418y/Y+eqHYHqNsIlCyJCyt5ISwV
   EQd/0pt7aVl4g+kEUB3lmo4Mws6TeUDbQBiDCbSaUWV8YJCklmRZjrlEu
   rYZeFUP+LzdLTpq3+vJGalfh5cLxGtlr6UckP3JYu5Sya4IiMgwpgl4xK
   SVSkB/p2spgHxwmB05SANMZJI36GH96I9vu9eyeUo/uzJz7POpv8Zxf8j
   jbH2RVu9rbK0et1Jog3N/FkokAgEdDTvYW/mMkTlko9pgiVIT0BbV75x0
   A==;
X-CSE-ConnectionGUID: ypfXb9R2TdGmaPO6wkO4sA==
X-CSE-MsgGUID: U/hzNMitSNa26IBjnqJvOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66602012"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66602012"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:24:18 -0800
X-CSE-ConnectionGUID: Y5lIjaFpS2ij5FCTSu8p8g==
X-CSE-MsgGUID: P5eKSUjSSUCz31R4X8dNkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194433069"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:24:18 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:24:10 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 18:24:10 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:24:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVqO6XWcBZ/Z1oEBHJPo+TH0p3AdJ5l1w9ffcEqmB81jaZVVZKJMpL0kbq126gmBNxe70inXhGtQxOWj/r02N9l5dwOzlw7JoQ/7t95Yo04B3HSIG+1ebO5X8QxMCc+/1FFrQvZcvAvgUZwU/1U24e+HXz+fbqfhFeObzWnizdGcSyJSfMAWX2GqYcmnp8hpJF+a7ZnIGU05TFxX/176fb5AGc+ZnodvKEp/9q7qSU84a0p3x2L27RP6xeAIWiYNRJyY4KrQisWUi8oY/Zws8em6q750W+lLpx57ElOpxRpLcoQli0Udg45Hlq9gsexNYH5n7plOGIKkJXi5BepwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQ1qYbBNrFzYAbNGrIZDCBEP+aj2dlfz7BfgJDvbG54=;
 b=jsN7tEI8nW6zx+Xo0M70elqlVyzGJsU2Dr+d+7FXztR8J7LTFJwcb1AtWr3NpngxDKKSfufCsbJzC694u4F+Fu+1n8aqXu+6+TToaRP5tenwuaaTiByAhGN3GPE9hAzAWE7sXzYsLw2uGrRPLpEkkuNDra7zYkQV1hewJt11Z6oHb77DJAOFfwAIlOhXSR8u0+ZIyAMaRE91KgpcWUGlZ9IP+JFPcPwSxOOB+o5wc0Nanbw4a58qgUVjWF6z3bSNDXD5Tf47D7zmWMl9rVzFAn1jkoWc1ajkKlqi+PzA47cMWQJFeBhaYZy8cNT2GbERMIwDHVsSEULxV3VOHNMXxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DM3PPF1CEB6B7EF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 02:24:02 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:24:02 +0000
Date: Wed, 3 Dec 2025 10:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/char/tpm/tpm2-cmd.c:210:6: error: assigning to 'int' from
 incompatible type 'void'
Message-ID: <aS+fOqbT+LiUmu3i@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|DM3PPF1CEB6B7EF:EE_
X-MS-Office365-Filtering-Correlation-Id: c1967d64-ab11-48cf-2576-08de32130631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?enB4hGTbX0wjN/siOsqnLJ9TRyvgLbzr+JxOOYYTiMNqlVJicRQ6QQ8GlVue?=
 =?us-ascii?Q?DUFL6LZfqFcw8reqpvWl1P6/nhlHhqFNm2I1Yf7tfJ1ZveoOIlgdZc0VwP4h?=
 =?us-ascii?Q?t9N5/+FqdPEihFykAHZRZXwBnrUUwyuR9ckrGXGLpU950MfexHGrgQrTuN+x?=
 =?us-ascii?Q?7beSRkZMnEP08atK150fuXdhd8ls/Ug4HhtumDT0eZDJeMg1JPZ2z2GUxEx6?=
 =?us-ascii?Q?mHY1JX3Oo3Al+ECgScmdlFUVjf1KBt15C63FVGKd6wMG6ZzTbNyT7NHiKJ91?=
 =?us-ascii?Q?dBovtqjRlzASjTcTL67QJFo5hmMNBMpicMkQWiTkFwDcEfFfbaJNYWHK+n+e?=
 =?us-ascii?Q?2PyxLlFVrqVqXRM5nWrNYnwiswcc7tUJt0E/PPEvwA334YQR9VEx7addHRwC?=
 =?us-ascii?Q?RRK7+o2tlLHdT0dERdy1E99jqCZQOQwMSwYvRIC4BP/fJZMk4ANK6YiHpPOi?=
 =?us-ascii?Q?hjIm02cwp+N8oU+8iIPtONYUfUF5L3jyqcRXYXhKSsteWZlkmqLm6ZAQqbxb?=
 =?us-ascii?Q?AhsuqcRL/nhABKGn053jhNrX/V86gi/eewv7gLN5aWA9073mc5qJKOFu/5pR?=
 =?us-ascii?Q?8Z1g2V/iasmEi8ay2wrFVxZACMADIw0FHF4OxDlHWG9qUO/sxKIFxYOL41mo?=
 =?us-ascii?Q?GZaxbxf1C9a6gOZJHYywALFwhnvg1VnBLc/GIvfCuUpu/4yI+/3ooP4tKE5t?=
 =?us-ascii?Q?f7CNXwlItROAu1hKT/KXw2JGZKQV8L70pMMrSprHyy7MMTUt8V4jeJbxjVwi?=
 =?us-ascii?Q?cMO+Bj351bKFu6WNrqIBiuLX5DkHgJWgS7qyebH5EONKikBkaj8EzZE7IOWZ?=
 =?us-ascii?Q?Ki/D1XIRFkdO+JYIWb6fD6w+wyGWmSXJZJY1I8OdFJ2BNILIcNk1Q8D3f3MD?=
 =?us-ascii?Q?aiRRXDFa1HXuX4yYoCphTw6HZ72ERAHNnqpUtSViZ3/EqFBFaBJQKiOrUvIT?=
 =?us-ascii?Q?mNHlHf07lafMNGMZcBCqekiqzFwykrD4QFkcs5Zi/R7+EYVmbouRGXD5vNT9?=
 =?us-ascii?Q?A7kjj1Kjp+7h86XKG5SlWPxtgmHiAuADSbahyGOj+X9JuAjaTQ4kHv1wGWPp?=
 =?us-ascii?Q?5lNjsBwf1+xRIfRpBseS+cggH93HfP4nmzRlC6oA1jVZqwOSq5l5DgJdAi66?=
 =?us-ascii?Q?Ge1RBRkuqgnQHt/cJGHSWVQF1VLv5LZur70PnP3IZ2NXp0pdJssf5nFCrIjh?=
 =?us-ascii?Q?nRQZSkHLerqtSC4RSS4eVnBeDnTkq+H6WhM8O5HMB9+Ac9AgjEGaX/mkf7QB?=
 =?us-ascii?Q?8/DoZGxcA7Rhsu2WT/nniM7E6oJqKoC0UagVhtg65I+sgG5RnVyemZNuUEv2?=
 =?us-ascii?Q?PdmgZ9aYulUtmIXxDZ3MGhDuTYSy9EUQTRoBrKpp5EOKqeZlVcF0Z1MuBYJB?=
 =?us-ascii?Q?zCWWZ3whE2v8bH3b/0XSLY+8ltAA5K9PH2FJTkdNv4x/6T6eDQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JjFZvTZzZmcNi3QPAEcmnMJ9oIZ2FKN4bec2IDO9pARItDjKEHmHF2yY+2Rz?=
 =?us-ascii?Q?kVoJxeyHuctR7LQA8dR32s8U8diCWRRLdwsmF1oMwqupCtWyCIx6uEf8U5rx?=
 =?us-ascii?Q?Kg//dTFC1E8dZJ/Km3NmrK3sQj3tb76BRfvZ8P3GLH2GG55PWF5F9tNEuX3+?=
 =?us-ascii?Q?UfO9MTULuPVlqRrEgfwSoU2DURpwt8u+I6HIeIkaTm9UXYUZrwmoXjA1LnnF?=
 =?us-ascii?Q?usBuFiKY1w4R0S5r2HE7rMElfEtMoX9w2Zwr4lzfCV1PjF1+risu61TuP373?=
 =?us-ascii?Q?hnkxIbsdA29EZT/7CD7ZENrYSCg7alSjD5gWcGbO6sSEX6eH0RR9Ozlkrzyx?=
 =?us-ascii?Q?/PSZDfqiFDsI3qLtmJoSdiFPKXCv1F9s81BTFKB3uTVIo1mvuOHp+BZxIjzo?=
 =?us-ascii?Q?IM+0SrCOFI5yEEbhaiPlTLyC1nOBHCD7D4watQucsM5FBpt9/PpoPqyYAlL0?=
 =?us-ascii?Q?sn7BU0dhmaQLJmpA5QkvM74S926LRodWLkKixtEDvCmlIQ2gFu6MIeuT+OYq?=
 =?us-ascii?Q?+NWYsscdrrgAZ9w3bVbRTa6rJYOvBjkwnnQ800rXQWQvLWgFpFq7i7Ez5ZIA?=
 =?us-ascii?Q?tIbCNhI9xh9BgWk3pXHDtLmbDnYuQSJ9gutnvo0wdyyaulT5czZ8cl1Ivoih?=
 =?us-ascii?Q?BKauBOlZQ5q5g+BmM9QtS+dLmV0N7npV9bQQJ5ktgYMaVCVKccdFvtk2WWnw?=
 =?us-ascii?Q?uHkTjXyaxwoRmn64ptCBrFUYsBf99fdLFaKRNfsb7Esoj9tH/3hCs7Pw4ZK6?=
 =?us-ascii?Q?N10u2Z62NbZvHkcxq/eUqonhqbB51N8OS+YqHtByjLFhr718ibxFjt4MM+Zc?=
 =?us-ascii?Q?Gnb0LP98MCzyqlfNQ+pUbEsqQAECRroMcCg4rH17XYbEXncKWwbRI6OH2ULV?=
 =?us-ascii?Q?kYr8hGEySZ/3CSqS2EuJ4Q2lDKgCcTRdOyXpQMU40rMffB9dJ1s7YC6CR9WC?=
 =?us-ascii?Q?/vntcYTWfuTo2KYhYfPEk25ouSD/HTgWX1Y562z/mtyJk3Bzajq1ZqQVie3v?=
 =?us-ascii?Q?xLoqLOMjuyujUgr8+Wut5wM+Y0Cv0X/9nu/DpirFNCYz71cVxAY7E+QwuMmC?=
 =?us-ascii?Q?vRbNcChsYJ6kewvymOuVM+MUX7yPjGNwdP/9xY7DtuwZ22e+KLF7c/DlV36l?=
 =?us-ascii?Q?Z2jQmm0kmPdq8cmNLvlstFiEOJYN3ouaIf7C9JGh4/Gc9ee60d9D6hzpAJLE?=
 =?us-ascii?Q?T8KiI2TStaHUKCVLNVP7dcH5QI+N/j7/ZQrZbX4eEukXOjyQ/jNSNPoDydEj?=
 =?us-ascii?Q?WchxoGqSeNK3Kz5+vWR4wrq1UBs+3/6GLQlRgZhDlNrjJJc21Mk8vTBapdbW?=
 =?us-ascii?Q?JjQiaWsrWgp5hJPWAtOAF5Iogl+ZUKS5HwmUALBFtCZ/m9f3fZ+MSr7LyiPI?=
 =?us-ascii?Q?upm2ejZpPcEPyfjvNss1cVjfSV3IVvXCQnG3rpbwNQ2uZK6VNDSofs9mjM4n?=
 =?us-ascii?Q?4vopC3pYKPAhjgD5C8mxN+zGJ17f7nPrJb0Z41KVhdyImsFMtAHFRzG22IVT?=
 =?us-ascii?Q?VxTo319nzlpzDtz1lCyrkXpvg8QnBFFeudrX195WQU4PCqs3q2ZKkQleabFc?=
 =?us-ascii?Q?XoJbrGBqNc2dFFWYeqk5EHWsUiC6afr5lzbn+XPJ/+Ryvh7aFLKPd4CRh/t2?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1967d64-ab11-48cf-2576-08de32130631
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:24:02.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7fNO74ZL45Wc+bUDW6JiFUT71UuotzlRTvpaDMhBOD2ysMX/v/XSFgavRRJ65tciF3rQP/WZney4UyXdfq20w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CEB6B7EF
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm2-sessions-address-out-of-range-indexing/20251202-034236
head:   991addbbc9ef9c912d1dce90bf0e8a9b83b1704e
commit: 991addbbc9ef9c912d1dce90bf0e8a9b83b1704e tpm2-sessions: address out-of-range indexing
date:   22 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021827.04qmHc2z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021827.04qmHc2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021827.04qmHc2z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm2-cmd.c:14:
   In file included from drivers/char/tpm/tpm.h:28:
   ./include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm2-cmd.c:210:6: error: assigning to 'int' from incompatible type 'void'
     210 |                 rc = tpm_buf_fill_hmac_session(chip, &buf);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm2-cmd.c:274:7: error: assigning to 'int' from incompatible type 'void'
     274 |                 err = tpm_buf_fill_hmac_session(chip, &buf);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +210 drivers/char/tpm/tpm2-cmd.c

7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  @14  #include "tpm.h"
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05   15  #include <crypto/hash_info.h>
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05   16  
27184f8905ba68 Jarkko Sakkinen 2024-11-13   17  static bool disable_pcr_integrity;
27184f8905ba68 Jarkko Sakkinen 2024-11-13   18  module_param(disable_pcr_integrity, bool, 0444);
27184f8905ba68 Jarkko Sakkinen 2024-11-13   19  MODULE_PARM_DESC(disable_pcr_integrity, "Disable integrity protection of TPM2_PCR_Extend");
27184f8905ba68 Jarkko Sakkinen 2024-11-13   20  
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05   21  static struct tpm2_hash tpm2_hash_map[] = {
aa042475938f58 Roberto Sassu   2019-02-06   22  	{HASH_ALGO_SHA1, TPM_ALG_SHA1},
aa042475938f58 Roberto Sassu   2019-02-06   23  	{HASH_ALGO_SHA256, TPM_ALG_SHA256},
aa042475938f58 Roberto Sassu   2019-02-06   24  	{HASH_ALGO_SHA384, TPM_ALG_SHA384},
aa042475938f58 Roberto Sassu   2019-02-06   25  	{HASH_ALGO_SHA512, TPM_ALG_SHA512},
aa042475938f58 Roberto Sassu   2019-02-06   26  	{HASH_ALGO_SM3_256, TPM_ALG_SM3_256},
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05   27  };
5ca4c20cfd37ba Jarkko Sakkinen 2015-11-05   28  
70a3199a710142 Tomas Winkler   2018-10-19   29  int tpm2_get_timeouts(struct tpm_chip *chip)
70a3199a710142 Tomas Winkler   2018-10-19   30  {
70a3199a710142 Tomas Winkler   2018-10-19   31  	chip->timeout_a = msecs_to_jiffies(TPM2_TIMEOUT_A);
70a3199a710142 Tomas Winkler   2018-10-19   32  	chip->timeout_b = msecs_to_jiffies(TPM2_TIMEOUT_B);
70a3199a710142 Tomas Winkler   2018-10-19   33  	chip->timeout_c = msecs_to_jiffies(TPM2_TIMEOUT_C);
70a3199a710142 Tomas Winkler   2018-10-19   34  	chip->timeout_d = msecs_to_jiffies(TPM2_TIMEOUT_D);
70a3199a710142 Tomas Winkler   2018-10-19   35  	chip->flags |= TPM_CHIP_FLAG_HAVE_TIMEOUTS;
70a3199a710142 Tomas Winkler   2018-10-19   36  	return 0;
70a3199a710142 Tomas Winkler   2018-10-19   37  }
70a3199a710142 Tomas Winkler   2018-10-19   38  
207696b17f38e8 Jarkko Sakkinen 2025-09-18   39  /*
207696b17f38e8 Jarkko Sakkinen 2025-09-18   40   * Contains the maximum durations in milliseconds for TPM2 commands.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   41   */
207696b17f38e8 Jarkko Sakkinen 2025-09-18   42  static const struct {
207696b17f38e8 Jarkko Sakkinen 2025-09-18   43  	unsigned long ordinal;
207696b17f38e8 Jarkko Sakkinen 2025-09-18   44  	unsigned long duration;
207696b17f38e8 Jarkko Sakkinen 2025-09-18   45  } tpm2_ordinal_duration_map[] = {
207696b17f38e8 Jarkko Sakkinen 2025-09-18   46  	{TPM2_CC_STARTUP, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   47  	{TPM2_CC_SELF_TEST, 3000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   48  	{TPM2_CC_GET_RANDOM, 2000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   49  	{TPM2_CC_SEQUENCE_UPDATE, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   50  	{TPM2_CC_SEQUENCE_COMPLETE, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   51  	{TPM2_CC_EVENT_SEQUENCE_COMPLETE, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   52  	{TPM2_CC_HASH_SEQUENCE_START, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   53  	{TPM2_CC_VERIFY_SIGNATURE, 30000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   54  	{TPM2_CC_PCR_EXTEND, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   55  	{TPM2_CC_HIERARCHY_CONTROL, 2000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   56  	{TPM2_CC_HIERARCHY_CHANGE_AUTH, 2000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   57  	{TPM2_CC_GET_CAPABILITY, 750},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   58  	{TPM2_CC_NV_READ, 2000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   59  	{TPM2_CC_CREATE_PRIMARY, 30000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   60  	{TPM2_CC_CREATE, 30000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   61  	{TPM2_CC_CREATE_LOADED, 30000},
207696b17f38e8 Jarkko Sakkinen 2025-09-18   62  };
899102bc451895 Tomas Winkler   2018-10-19   63  
899102bc451895 Tomas Winkler   2018-10-19   64  /**
207696b17f38e8 Jarkko Sakkinen 2025-09-18   65   * tpm2_calc_ordinal_duration() - Calculate the maximum command duration
899102bc451895 Tomas Winkler   2018-10-19   66   * @ordinal: TPM command ordinal.
899102bc451895 Tomas Winkler   2018-10-19   67   *
207696b17f38e8 Jarkko Sakkinen 2025-09-18   68   * Returns the maximum amount of time the chip is expected by kernel to
207696b17f38e8 Jarkko Sakkinen 2025-09-18   69   * take in jiffies.
899102bc451895 Tomas Winkler   2018-10-19   70   */
207696b17f38e8 Jarkko Sakkinen 2025-09-18   71  unsigned long tpm2_calc_ordinal_duration(u32 ordinal)
899102bc451895 Tomas Winkler   2018-10-19   72  {
207696b17f38e8 Jarkko Sakkinen 2025-09-18   73  	int i;
899102bc451895 Tomas Winkler   2018-10-19   74  
207696b17f38e8 Jarkko Sakkinen 2025-09-18   75  	for (i = 0; i < ARRAY_SIZE(tpm2_ordinal_duration_map); i++)
207696b17f38e8 Jarkko Sakkinen 2025-09-18   76  		if (ordinal == tpm2_ordinal_duration_map[i].ordinal)
207696b17f38e8 Jarkko Sakkinen 2025-09-18   77  			return msecs_to_jiffies(tpm2_ordinal_duration_map[i].duration);
899102bc451895 Tomas Winkler   2018-10-19   78  
899102bc451895 Tomas Winkler   2018-10-19   79  	return msecs_to_jiffies(TPM2_DURATION_DEFAULT);
899102bc451895 Tomas Winkler   2018-10-19   80  }
899102bc451895 Tomas Winkler   2018-10-19   81  
91f7f3d773a469 Roberto Sassu   2017-06-23   82  struct tpm2_pcr_read_out {
91f7f3d773a469 Roberto Sassu   2017-06-23   83  	__be32	update_cnt;
91f7f3d773a469 Roberto Sassu   2017-06-23   84  	__be32	pcr_selects_cnt;
91f7f3d773a469 Roberto Sassu   2017-06-23   85  	__be16	hash_alg;
91f7f3d773a469 Roberto Sassu   2017-06-23   86  	u8	pcr_select_size;
91f7f3d773a469 Roberto Sassu   2017-06-23   87  	u8	pcr_select[TPM2_PCR_SELECT_MIN];
91f7f3d773a469 Roberto Sassu   2017-06-23   88  	__be32	digests_cnt;
91f7f3d773a469 Roberto Sassu   2017-06-23   89  	__be16	digest_size;
91f7f3d773a469 Roberto Sassu   2017-06-23   90  	u8	digest[];
91f7f3d773a469 Roberto Sassu   2017-06-23   91  } __packed;
91f7f3d773a469 Roberto Sassu   2017-06-23   92  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   93  /**
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   94   * tpm2_pcr_read() - read a PCR value
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   95   * @chip:	TPM chip to use.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   96   * @pcr_idx:	index of the PCR to read.
879b589210a9a0 Roberto Sassu   2019-02-06   97   * @digest:	PCR bank and buffer current PCR value is written to.
879b589210a9a0 Roberto Sassu   2019-02-06   98   * @digest_size_ptr:	pointer to variable that stores the digest size.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12   99   *
794c6e109b5938 Winkler, Tomas  2016-11-23  100   * Return: Same as with tpm_transmit_cmd.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  101   */
879b589210a9a0 Roberto Sassu   2019-02-06  102  int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
879b589210a9a0 Roberto Sassu   2019-02-06  103  		  struct tpm_digest *digest, u16 *digest_size_ptr)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  104  {
879b589210a9a0 Roberto Sassu   2019-02-06  105  	int i;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  106  	int rc;
91f7f3d773a469 Roberto Sassu   2017-06-23  107  	struct tpm_buf buf;
91f7f3d773a469 Roberto Sassu   2017-06-23  108  	struct tpm2_pcr_read_out *out;
91f7f3d773a469 Roberto Sassu   2017-06-23  109  	u8 pcr_select[TPM2_PCR_SELECT_MIN] = {0};
879b589210a9a0 Roberto Sassu   2019-02-06  110  	u16 digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  111  	u16 expected_digest_size = 0;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  112  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  113  	if (pcr_idx >= TPM2_PLATFORM_PCR)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  114  		return -EINVAL;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  115  
879b589210a9a0 Roberto Sassu   2019-02-06  116  	if (!digest_size_ptr) {
879b589210a9a0 Roberto Sassu   2019-02-06  117  		for (i = 0; i < chip->nr_allocated_banks &&
879b589210a9a0 Roberto Sassu   2019-02-06  118  		     chip->allocated_banks[i].alg_id != digest->alg_id; i++)
879b589210a9a0 Roberto Sassu   2019-02-06  119  			;
879b589210a9a0 Roberto Sassu   2019-02-06  120  
879b589210a9a0 Roberto Sassu   2019-02-06  121  		if (i == chip->nr_allocated_banks)
879b589210a9a0 Roberto Sassu   2019-02-06  122  			return -EINVAL;
879b589210a9a0 Roberto Sassu   2019-02-06  123  
879b589210a9a0 Roberto Sassu   2019-02-06  124  		expected_digest_size = chip->allocated_banks[i].digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  125  	}
879b589210a9a0 Roberto Sassu   2019-02-06  126  
91f7f3d773a469 Roberto Sassu   2017-06-23  127  	rc = tpm_buf_init(&buf, TPM2_ST_NO_SESSIONS, TPM2_CC_PCR_READ);
91f7f3d773a469 Roberto Sassu   2017-06-23  128  	if (rc)
91f7f3d773a469 Roberto Sassu   2017-06-23  129  		return rc;
91f7f3d773a469 Roberto Sassu   2017-06-23  130  
91f7f3d773a469 Roberto Sassu   2017-06-23  131  	pcr_select[pcr_idx >> 3] = 1 << (pcr_idx & 0x7);
91f7f3d773a469 Roberto Sassu   2017-06-23  132  
91f7f3d773a469 Roberto Sassu   2017-06-23  133  	tpm_buf_append_u32(&buf, 1);
879b589210a9a0 Roberto Sassu   2019-02-06  134  	tpm_buf_append_u16(&buf, digest->alg_id);
91f7f3d773a469 Roberto Sassu   2017-06-23  135  	tpm_buf_append_u8(&buf, TPM2_PCR_SELECT_MIN);
91f7f3d773a469 Roberto Sassu   2017-06-23  136  	tpm_buf_append(&buf, (const unsigned char *)pcr_select,
91f7f3d773a469 Roberto Sassu   2017-06-23  137  		       sizeof(pcr_select));
91f7f3d773a469 Roberto Sassu   2017-06-23  138  
879b589210a9a0 Roberto Sassu   2019-02-06  139  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting to read a pcr value");
879b589210a9a0 Roberto Sassu   2019-02-06  140  	if (rc)
879b589210a9a0 Roberto Sassu   2019-02-06  141  		goto out;
879b589210a9a0 Roberto Sassu   2019-02-06  142  
91f7f3d773a469 Roberto Sassu   2017-06-23  143  	out = (struct tpm2_pcr_read_out *)&buf.data[TPM_HEADER_SIZE];
879b589210a9a0 Roberto Sassu   2019-02-06  144  	digest_size = be16_to_cpu(out->digest_size);
879b589210a9a0 Roberto Sassu   2019-02-06  145  	if (digest_size > sizeof(digest->digest) ||
879b589210a9a0 Roberto Sassu   2019-02-06  146  	    (!digest_size_ptr && digest_size != expected_digest_size)) {
879b589210a9a0 Roberto Sassu   2019-02-06  147  		rc = -EINVAL;
879b589210a9a0 Roberto Sassu   2019-02-06  148  		goto out;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  149  	}
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  150  
879b589210a9a0 Roberto Sassu   2019-02-06  151  	if (digest_size_ptr)
879b589210a9a0 Roberto Sassu   2019-02-06  152  		*digest_size_ptr = digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  153  
879b589210a9a0 Roberto Sassu   2019-02-06  154  	memcpy(digest->digest, out->digest, digest_size);
879b589210a9a0 Roberto Sassu   2019-02-06  155  out:
91f7f3d773a469 Roberto Sassu   2017-06-23  156  	tpm_buf_destroy(&buf);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  157  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  158  }
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  159  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  160  /**
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  161   * tpm2_pcr_extend() - extend a PCR value
794c6e109b5938 Winkler, Tomas  2016-11-23  162   *
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  163   * @chip:	TPM chip to use.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  164   * @pcr_idx:	index of the PCR.
c1f92b4b04ad70 Nayna Jain      2017-01-30  165   * @digests:	list of pcr banks and corresponding digest values to extend.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  166   *
794c6e109b5938 Winkler, Tomas  2016-11-23  167   * Return: Same as with tpm_transmit_cmd.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  168   */
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  169  int tpm2_pcr_extend(struct tpm_chip *chip, u32 pcr_idx,
aa042475938f58 Roberto Sassu   2019-02-06  170  		    struct tpm_digest *digests)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  171  {
c1f92b4b04ad70 Nayna Jain      2017-01-30  172  	struct tpm_buf buf;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  173  	int rc;
c1f92b4b04ad70 Nayna Jain      2017-01-30  174  	int i;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  175  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  176  	if (!disable_pcr_integrity) {
6519fea6fd372b James Bottomley 2024-04-29  177  		rc = tpm2_start_auth_session(chip);
c1f92b4b04ad70 Nayna Jain      2017-01-30  178  		if (rc)
c1f92b4b04ad70 Nayna Jain      2017-01-30  179  			return rc;
27184f8905ba68 Jarkko Sakkinen 2024-11-13  180  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  181  
6519fea6fd372b James Bottomley 2024-04-29  182  	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_PCR_EXTEND);
6519fea6fd372b James Bottomley 2024-04-29  183  	if (rc) {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  184  		if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  185  			tpm2_end_auth_session(chip);
6519fea6fd372b James Bottomley 2024-04-29  186  		return rc;
6519fea6fd372b James Bottomley 2024-04-29  187  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  188  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  189  	if (!disable_pcr_integrity) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  190  		rc = tpm_buf_append_name(chip, &buf, pcr_idx, NULL);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  191  		if (rc) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  192  			tpm_buf_destroy(&buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  193  			return rc;
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  194  		}
6519fea6fd372b James Bottomley 2024-04-29  195  		tpm_buf_append_hmac_session(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  196  	} else {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  197  		tpm_buf_append_handle(chip, &buf, pcr_idx);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  198  		tpm_buf_append_auth(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  199  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  200  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  201  	tpm_buf_append_u32(&buf, chip->nr_allocated_banks);
c1f92b4b04ad70 Nayna Jain      2017-01-30  202  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  203  	for (i = 0; i < chip->nr_allocated_banks; i++) {
c1f92b4b04ad70 Nayna Jain      2017-01-30  204  		tpm_buf_append_u16(&buf, digests[i].alg_id);
879b589210a9a0 Roberto Sassu   2019-02-06  205  		tpm_buf_append(&buf, (const unsigned char *)&digests[i].digest,
879b589210a9a0 Roberto Sassu   2019-02-06  206  			       chip->allocated_banks[i].digest_size);
c1f92b4b04ad70 Nayna Jain      2017-01-30  207  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  208  
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  209  	if (!disable_pcr_integrity) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01 @210  		rc = tpm_buf_fill_hmac_session(chip, &buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  211  		if (rc) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  212  			tpm_buf_destroy(&buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  213  			return rc;
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  214  		}
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  215  	}
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  216  
47a6c28b6861b1 Jarkko Sakkinen 2018-11-05  217  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting extend a PCR value");
27184f8905ba68 Jarkko Sakkinen 2024-11-13  218  	if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  219  		rc = tpm_buf_check_hmac_response(chip, &buf, rc);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  220  
c1f92b4b04ad70 Nayna Jain      2017-01-30  221  	tpm_buf_destroy(&buf);
c1f92b4b04ad70 Nayna Jain      2017-01-30  222  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  223  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  224  }
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

