Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C62F23770A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728802; cv=fail; b=ZrBpIs3RMjltFTsO1ppbgmQc28cFGFVwFv8jkDqoZLLgBWFkZw8LydD2QEiMLYxXePfbKWOH6Xy297tLuvbr13pEqIgZxd3zgFpeCppLhQdqBSD44LsMjXIHRFdKqmRh1M0wuRkLTzgFjwYJQDHDA6CxiulogWw/vgAUsZ1Jzu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728802; c=relaxed/simple;
	bh=1AO9aTzQUxXa0BZoKRlUVIHtBU0J8VCAduay7FcmifM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tWrHAvtjGOzLFFl64s9ZJFRGcNC0Blj8TNbftV0nXeWIbMrdVAtrsoUSzN771Zie6GGHVu8B20K9Ry9Uwh6JLKh6aoRtmumhnG4HBnUdwjwR/aYqMcQM9kkjphba+1DibfBiIAwThb9TNWHUp/z7hJbMDvysqhfdFP3NRG7T/5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceXlkY7k; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceXlkY7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764728801; x=1796264801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1AO9aTzQUxXa0BZoKRlUVIHtBU0J8VCAduay7FcmifM=;
  b=ceXlkY7kZ7uazS4gbUqEdE8X5cR5iOBW44Ht5Cojw/kSMcZOeem8DiBi
   kTz1uV48OR7LUOqMoO2x5cHBXz7+Zc/mXIXgJ+3x75+XtgLvTAaSK7wDC
   eseJPW2rWXPgWZo4dWlRg2DcJe19Hl1vWCnKOgUe5eAHLgbzNkOjdCoXF
   3iZXPMuTBtRGXqfV0AEfFb/7jKFK3xhGwwagE1WS+c0oYpZ2a0xqS5ull
   /bJy0FwdIaA390g5jPoTi7yrgUNPjBleoK/1Gz5HwlWQkiaTQnfYpsW3X
   ObPl08dMnsbryl1Zv1G1JRo2/J6rwvz4H1vmDe3mU36kUfX37oHQ0V+tp
   w==;
X-CSE-ConnectionGUID: GKTLY/6vTwK/Y2liGygrsw==
X-CSE-MsgGUID: kekAtO6eRp+IKCDeUxcozA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66434214"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66434214"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:26:40 -0800
X-CSE-ConnectionGUID: T6ZFgRaCQ+ivnQMfzZoFHQ==
X-CSE-MsgGUID: 8KhM4ph6QLe9f5UC8vGfXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="193632911"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:26:41 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:26:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 18:26:40 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:26:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqMltk7j43LEY7Q2DMiVm4WGpEgrZhs+PUpKD3BGE2l2OiKdj1PyjYpaEsUJ5CTyJXocxQDirV2XvXakyHmGEpe7kTMV+kkOwTbI6ron/9S2dEuyZAmmXJaUM7QFmRbGkJ1PAut8xhcE58hFb13SBkhUUomDYNiT+kLdZyI8VFmSqmk3DghT7jWd8v6BPaoMUmbEu3H4dDfWYbB+n6JLKh/yvsD3dEmorRoAdcm01YYPxX3bDcV3NiAcvtpc+BWcz9meGsEAqAxp5nxa98e5ZnLW2MR9OZ1asehfd3xK10SNEbVIZPZwwFQtmk+QTcz3EyD8O0khPWlYE1f20dZ93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS8m2nDhbFhRqZWe1Hr48ALZ1LoNDRShX1uxtbJYwFQ=;
 b=d2+bq7b0DH3fpNl8JLfZeRo55oEKQdN9iSDrTegj5V2xethMJT2+t3AnJ475vS1XVr0R9B1+fxZZvrsyV/ZUSfizgkRg3iH/lRFfgANOnKI2umdWmRkHoVGi4mUGfPON1o12obVXC8rwHhNm5BKDYd/B65luCURbHEUKbs4jU6b2EVLUBiqHb5nx1r7xB85Yp9GMhsclTqr4Vr/pndfQUZqg660pAXY6zqWJrCww0glu0Mvn1BTYXL6FuBPHnbiEaXck0lSs0qkA91pYAg3fjWM3HjIz7/WK/0KzqQzIUsJeclxU9Hug6mOUasEKXwZUIT29qrmDEXKMILS1V6+dFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DM3PPF1CEB6B7EF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 02:26:32 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:26:32 +0000
Date: Wed, 3 Dec 2025 10:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>, Uma Shankar
	<uma.shankar@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_color_pipeline.c:25:15: error:
 implicit declaration of function 'drm_plane_colorop_curve_1d_lut_init'
Message-ID: <aS+fz5ScaI7Hc2iZ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
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
X-MS-Office365-Filtering-Correlation-Id: 21f9a1c8-11dc-47b4-ce88-08de32135f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OSWu8aQQqskPIalAQbTeLPWaJQtriXqsQ+JePfy22Cryzy0c52/3Q4qcvamD?=
 =?us-ascii?Q?hgz9NpVmFakaF6ebXviHX3CG1DY+Yru8dwhaWUOD6pLNQWYdeCTxb2mzI5m1?=
 =?us-ascii?Q?OYL9H50P9riDwZB1mvCDsLjmtkyaVetkLLLHYNVJGAVNOQOmJN62vdYqbcHQ?=
 =?us-ascii?Q?Y+ZMcCE1lugBbtkNWzL37zJ73uVgPlWTkiy5rQQyAy2ID5wpR6+QFg4G7XQ7?=
 =?us-ascii?Q?0jdtbXzrh9YJFoxpEgDC2nRtyyLy2t3qYnGg9qyLhIs6ccUFDcMI52yieX0t?=
 =?us-ascii?Q?BFHaA2RL9rMzRngoPIeR9tKXrlSScfSS27N0RA7RjAh8eEhCvdzsSfNgLjHj?=
 =?us-ascii?Q?uD6U0UFgkR3ArV/h/8htSXqwEHidrcVXfkwpvOKnglsJVvaFL8WI2fPjUiEE?=
 =?us-ascii?Q?h6mfmPfIHYJwiHdeqy7a+Oxzf3i2Ect30hxnRuUBMujQdptk2MrUNHmAJtqF?=
 =?us-ascii?Q?G54DWzJWHOG8kBk4cFQ6OeQ7DqW3o7cTtQXImU3NfAiBkWFlxNX6WWa5If7i?=
 =?us-ascii?Q?HpRLzXdLR3Jl5lnQwlN4CphdCbyZ3TrI9Htze8H15zBDEoWYvdbT3NMbw1zv?=
 =?us-ascii?Q?oElRAFGgQor6XsWUQiBvz0XN9X/s/rq0vLPcZet+JPouNV4s5w+bBwLufl5I?=
 =?us-ascii?Q?OPFsP26M5nLM6dZ0fXie5pxdTRXMFcXQey/sbrxnhcao52E7233j5TKEYmW1?=
 =?us-ascii?Q?1m4LZnrWzTUFHjFJwzUnxLoWKVR3ZeOEfPd0HO3UP2lGDWv4xFd/QN8JeA0J?=
 =?us-ascii?Q?cVRe5+Gxj4P3jEJmY7ZFN61guzpQHS1LSZQ4DE6o57a9tlDVZBpaHJg6Dh6a?=
 =?us-ascii?Q?lEPuNJsxxrxKtLgw3877j+8t2JzKl3i+xRwGZeGe4J4KXDXjyQuMtXH+sUEo?=
 =?us-ascii?Q?YMxWBwoZ340sWJP1UQUAzD+Vs6e8Yl7c1NkRtLliuL2RJx1ThX5QFz5x6vWl?=
 =?us-ascii?Q?ezvzsKpPtTMQDID4hrgr1QaRLhXUemLdYDQk4xJrmf8usHCrDclJLEQ9bmw/?=
 =?us-ascii?Q?R+oEelm4zN2UZdxLF9b59EhSXY4sPTj3T4gAv9zomk3psxCjQcqWe0pGThXz?=
 =?us-ascii?Q?CMGNSLkkkwUNXGxlAqewuN+xjvpFIxb47YiQPCtgnaT2I9Alr98FZ2s4kJ2Y?=
 =?us-ascii?Q?ZQLtXdtuEH+9u8E1io0a67U+C0LsqPW/tBm417X09Sp1sA3hOZPBzCcyGqoX?=
 =?us-ascii?Q?dU9jTJo7rDxmkFmHAfZ9WMJqZ15LstLKJWWArjYRFsguCKUh/TReEl0rD2Jy?=
 =?us-ascii?Q?LKB0U7Zba2pY98BSdm0DzfRX0V/1HyY/f6h1aXv8XkhCFIS6pEUWXVr7cNaa?=
 =?us-ascii?Q?/jwTy2CukTtvHWhBfiHXyRNb0HtgH0IdrDb+/WwoYOmcR5HxiVdYo9JM3rvl?=
 =?us-ascii?Q?kPHLA57sqdm4f8lOKFFwuY0W6YO8b+qX1ZLXgRzAT8+PDLmYjHocy/bronfX?=
 =?us-ascii?Q?Dg3Cz1EP1bnYTEsAsXX9ufggdHGCYdvyKRiGKGJqoBeihR66qDDq/Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sUaKrshXjRmKsP3a7ct+m0aPnHTLbU2PBFKjNSrXOZy24Ff7R/sg3xlVR9sv?=
 =?us-ascii?Q?C5wkCfw9/6XMgIMNKfsSRwMwepxhjOpz5Du1QZAqqI9FS8aRZkQ7OItyy8dW?=
 =?us-ascii?Q?PI1f8FDEFNvXFTCzFAI0xM4IYuJyQPA3v1+H7H91w37Wl3qhmxtW1Wkg2sLK?=
 =?us-ascii?Q?Pc+Heg8SAPmmSwUQwXUFMb+9UitYV767yGxS9fESPh44xwLNPs7LnxSp1M/T?=
 =?us-ascii?Q?DtqWwDKFUx98PBLXUwS7RVeojG+B4lXHASncchV16cQ26nYAvMe/Kww7oFpr?=
 =?us-ascii?Q?Fzp7GFCuUwYCUZvcznW+4DyR7BhDZlF8a4hoYfcCFajB8M8I3+9MD1E2/7s1?=
 =?us-ascii?Q?EulJuvEhJkqdagtgPZbvf3RdrWtj2Kf0gecsWMiOLHQydc5Z0ao+Yceo1eO1?=
 =?us-ascii?Q?WRga4Sl3qFw6yFLW36NzJmN46IZeIKFlWtHKNrPJpiIdy4udU3oSOx2JnEnK?=
 =?us-ascii?Q?cqbJiMLHN/H6a47j/0amPBJGLgybWJVoVxBh7oAYF9fOLgNLefkOdiyLpULR?=
 =?us-ascii?Q?wYP+2zgivt/+PDiNXcH3yyHAVkrDR/+O8E2DYCYiL/GClzd6L2+BAflGh3jn?=
 =?us-ascii?Q?Z7caS766nfO1wqWjyqTtXscuxsOw8adl/Gvy3oXywZwstrcXyehlPjPSCntL?=
 =?us-ascii?Q?uLXDmax7y9gznj34/9Z+CsrolTcYDmuxfQX2vJCGBbw3VvY1KH+iBOtWPT9L?=
 =?us-ascii?Q?XBXTfLYb6Z3Z8C0tc3jmP2OBQ74BWQhjfYoS9T6CDH3jNSiQ+SfUATvmOvzK?=
 =?us-ascii?Q?bSF9gZuw2hDMFklQMOQZSrP7f+gy6wFi7S7BlL1Sgywb4uiL9YNuMbUK7pXY?=
 =?us-ascii?Q?D7Ha2L/dzzsz/dHeeDkqu38gkDJfEg9hV9UA+FqhIIaEd9P/yFi/NYs46x2i?=
 =?us-ascii?Q?vQpENN/ku+rySB7OAmRmvugbkKYzB2dkspt0X/LGZtVGgPo9QQJVgNVHdMoh?=
 =?us-ascii?Q?+8soMJFZaJWqtJYLc2vjTfR1LqTix8wRqRLP1x2zgDYIXgOZBTj5UzZlO2Iq?=
 =?us-ascii?Q?kTVAZH4fOlwtQ731rbC0OngaxM2eXw6fT188oGKMg8yeWPvYDyB6paW4ydNa?=
 =?us-ascii?Q?GKmFPreqmBSRK5uAsRqhM+A5xlkQ/GBYx8AcUP1MK4dJDQDG9lbv2go0i/D1?=
 =?us-ascii?Q?kAiHFmluU7El14inOgS/r9pzfGkKq67STFPKvVjdMdikw/5GfU0uaqBqkzLI?=
 =?us-ascii?Q?1iEFaaKUcfoomMbqIDxtvZXgV3tI6UTpvUAgkrP+7FYoppeEj1V3bAEXlB73?=
 =?us-ascii?Q?ZfTgH0MM4fDsXn+M8L8hQcINK/883+cCVf+WUwFn/A4kg9drAs+m9iYsOCdS?=
 =?us-ascii?Q?GhjExfVYZQqxRCUKqqDkTCStaSdG3Aoa5vTmDNAlRlsuFaq5cmsTGxLquW6K?=
 =?us-ascii?Q?IE23VhZbLUTc9Kt8wiSCwBp/FY+X24xhlHRUjirGUUqkx1p5fFhh6y1BcpWR?=
 =?us-ascii?Q?DHFzJPcTHtvsB5YnzHG1ssXtEk1aRJFiY4keZyXev5fNCLeWULylrpFPZgCO?=
 =?us-ascii?Q?AZyFxEpTcThhLUWbOnRICcVLmcpk4iNERJY3znSWgLHyz/SdPnEd0417NPmd?=
 =?us-ascii?Q?4KcXr+s4+MwJxKYCr1rk60KvcPlLogL3veOsePJoBduA+OkpkjqFmYV7naxq?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f9a1c8-11dc-47b4-ce88-08de32135f78
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:26:32.2513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qny1y/J1hUB9lBXKUscPH8Y5HYe/NZrFP884jjzpfvBl7fgbBjdcLQoRMgudKnzsRLcYiCYP3FWJZYVu65kI+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CEB6B7EF
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: 40b8c00fae913da914fa3fed50bb61c62bcd2705 drm/i915/color: Create a transfer function color pipeline
date:   30 hours ago
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251202/202512021416.Me56fJgJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021416.Me56fJgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021416.Me56fJgJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_colorop.h:9,
                    from drivers/gpu/drm/i915/display/intel_color_pipeline.c:5:
   drivers/gpu/drm/i915/display/intel_display_types.h:1989:28: error: field 'base' has incomplete type
    1989 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_color_pipeline.c: In function '_intel_color_pipeline_plane_init':
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:25:15: error: implicit declaration of function 'drm_plane_colorop_curve_1d_lut_init' [-Wimplicit-function-declaration]
      25 |         ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:27:51: error: 'DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR' undeclared (first use in this function)
      27 |                                                   DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_color_pipeline.c:27:51: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:28:51: error: 'DRM_COLOROP_FLAG_ALLOW_BYPASS' undeclared (first use in this function)
      28 |                                                   DRM_COLOROP_FLAG_ALLOW_BYPASS);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:40:15: error: implicit declaration of function 'drm_plane_colorop_ctm_3x4_init' [-Wimplicit-function-declaration]
      40 |         ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:45:9: error: implicit declaration of function 'drm_colorop_set_next_property'; did you mean 'drm_connector_set_tile_property'? [-Wimplicit-function-declaration]
      45 |         drm_colorop_set_next_property(prev_op, &colorop->base);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         drm_connector_set_tile_property
   drivers/gpu/drm/i915/display/intel_color_pipeline.c: In function 'intel_color_pipeline_plane_init':
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:92:16: error: 'struct drm_plane' has no member named 'color_pipeline_property'; did you mean 'color_encoding_property'?
      92 |         plane->color_pipeline_property = prop;
         |                ^~~~~~~~~~~~~~~~~~~~~~~
         |                color_encoding_property


vim +/drm_plane_colorop_curve_1d_lut_init +25 drivers/gpu/drm/i915/display/intel_color_pipeline.c

40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  14  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  15  static
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  16  int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  17  {
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  18  	struct intel_colorop *colorop;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  19  	struct drm_device *dev = plane->dev;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  20  	int ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  21  	struct drm_colorop *prev_op;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  22  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  23  	colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  24  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @25  	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  26  						  PLANE_DEGAMMA_SIZE,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @27  						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @28  						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  29  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  30  	if (ret)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  31  		return ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  32  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  33  	list->type = colorop->base.base.id;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  34  	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  35  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  36  	/* TODO: handle failures and clean up */
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  37  	prev_op = &colorop->base;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  38  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  39  	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @40  	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  41  					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  42  	if (ret)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  43  		return ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  44  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @45  	drm_colorop_set_next_property(prev_op, &colorop->base);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  46  	prev_op = &colorop->base;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  47  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  48  	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  49  	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  50  						  PLANE_GAMMA_SIZE,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  51  						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  52  						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  53  	if (ret)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  54  		return ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  55  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  56  	drm_colorop_set_next_property(prev_op, &colorop->base);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  57  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  58  	return 0;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  59  }
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  60  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  61  int intel_color_pipeline_plane_init(struct drm_plane *plane)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  62  {
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  63  	struct drm_device *dev = plane->dev;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  64  	struct intel_display *display = to_intel_display(dev);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  65  	struct drm_property *prop;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  66  	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  67  	int len = 0;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  68  	int ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  69  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  70  	/* Currently expose pipeline only for HDR planes */
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  71  	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  72  		return 0;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  73  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  74  	/* Add "Bypass" (i.e. NULL) pipeline */
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  75  	pipelines[len].type = 0;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  76  	pipelines[len].name = "Bypass";
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  77  	len++;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  78  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  79  	/* Add pipeline consisting of transfer functions */
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  80  	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len]);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  81  	if (ret)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  82  		return ret;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  83  	len++;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  84  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  85  	/* Create COLOR_PIPELINE property and attach */
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  86  	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  87  					"COLOR_PIPELINE",
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  88  					pipelines, len);
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  89  	if (!prop)
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  90  		return -ENOMEM;
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01  91  
40b8c00fae913d Chaitanya Kumar Borah 2025-12-01 @92  	plane->color_pipeline_property = prop;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

