Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866EF3C344D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Apr 2026 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846832; cv=fail; b=XnioRLM0oVToTEhua6K0g7z/e/jg9Ed/4eygFoWDhsq3SOdH3wvbhcWQRhfunPuiiys5bQG61E44Iut+VwWbgIz716sp0KV2yVX3nMi7tg0CCd8+qjsxCD2uMh0DuJuu0CTvi26W8Der4LKNdXd1Or1WaCgUNEyVfN/Fx2vrVVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846832; c=relaxed/simple;
	bh=jMm9t0T0qL0i1zJYutd2ppV7UbhWPYpZnK4tQhEiGAI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hK5vTIaBDNBLmRc+s2CvXFXJ/HfFiSf9lZ6OpYLW+p1wxlubuNx5g66ECAeNvAN3dfRHpvd8tvxHohA8/BH6VBMwY2PP9RVgvjarvB3sVGmBDrjqMiNWfLZq56K9i+WrvsFnhsDyfGQRHiMRqczPVxqjlq7yclJH05hpjHYJrcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTfR3Fmu; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTfR3Fmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776846830; x=1808382830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMm9t0T0qL0i1zJYutd2ppV7UbhWPYpZnK4tQhEiGAI=;
  b=dTfR3FmutKoX4w6eWFZf4KPxDfyGKXKO5ZxAOK1mCP6rqdmkNhBfhiB6
   4g6TQzNpHnFLvI9JYaGH0HBoEY3Idsz5c6vU3XmArD+vr12q4bcRlzyDT
   J38nhd3Fl9QKMQm+Lqj5Ci2ufoeu+5KSgGuaoVrHll6p+0tAzNIHPNGVS
   gG9NhlCmpJu8dPdZkc41DMXMPdU2geQQX+xHCQvKxhb7FGIa7SbfIMdmB
   ocYhxiULo554Fk3M1i28+vwqsBA7o45m1s5yymOjPuTq/35NU77CP4WGI
   gIKJ3zNVHYcAGyhm8/M98UlhSidDxwvqo5Gq/3GQFjClocvyMhFisKnD0
   Q==;
X-CSE-ConnectionGUID: +n95iWdOS+arlt4M7mCq3w==
X-CSE-MsgGUID: k6DAbKjfSLWnM6HfJwgBxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88870195"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="88870195"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:33:49 -0700
X-CSE-ConnectionGUID: 0EgGp7HxQkSSYga8AS3kzQ==
X-CSE-MsgGUID: 9RgP5Dg5SjyFJfmDZKqy4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="225803766"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:33:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 01:33:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 01:33:47 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 01:33:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bi3Dh3MvtDWhbk5z2/QIcrJoWeSSiBwBM5Hz7XbgFAWyGfsfxhp/r8POYGRjVCUkSeUVU80BMRBdAHXtUy8pYqt9HrNeBbqej4L1uL6JxG+9KFA5rCH+kyd3NHGtIuLtRbcK0NA7oodY/AUHcDsH9wI8jXyfSA5k/cLvM+FLK7px3Rf0BfLpKOTiMNUPfD9FI49J2wsifmhrPRk6IApXZ5DMZLxG3KQTMEs79Jje4Tc610yq5km0jjltxG+IiJtohMnuvXafeyQS0o4SqYFssUqkzzarFd44Hf3+gtoNZJgeA85dpGVKa0RWQXGqsog+qsVJiqnGrEw1VsvFxBOigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiNLk/LvslKe2Zs/tBTYzznGvH/bSKPHMYAUC5XOCK8=;
 b=Lsye2m+Hc9YjWIXhBeamjj+FNUxx0o5eftCIpFJHSfGA0mXExDEt9/Miu4P76iZRGzYTB6lFCDfHH1emC5nMOFN1BJt9zMmv5eUKSVIZUdcC484YVTVjkOm2VMYKxZoqXfRu9XDuiw87TazFBxioT1KZ96+PxUKsxaoHMjKRyx9M+y1Nj8Ls6SD05+z8TnjriW4lMTD644rungal5fU7CtC19j9zLI7AuSpGO51cBL5jYnrSTiLeRDtlPHsHPOO6X/F4jRYRq+JbOD32xODSmzbI2vye7RpQqBlE2i7pkax6pjzDrSNlGea3doaKX5egZhSA0ehEK8kJnjC6GCZOOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SA3PR11MB9487.namprd11.prod.outlook.com (2603:10b6:806:47e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 08:33:44 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 08:33:44 +0000
Date: Wed, 22 Apr 2026 16:33:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ray Wu <ray.wu@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [agd5f:drm-next 109/134] checkpatch: WARNING:BLOCK_COMMENT_STYLE:
 Block comments should align the * on each line
Message-ID: <aeiH4bzX8EMM6L4y@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SA3PR11MB9487:EE_
X-MS-Office365-Filtering-Correlation-Id: 24fea0fd-5459-4fa6-e7b6-08dea049dd79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: IMVU6TrGg2O45b6yJ4DK3idLCouuql9qLrXZIrFMyxdKsRbDSbuWjKiuP2/bkyUQvEnmAzTb5pV8/h99ab7puc7GICT/HTRcq9YkFUUtvhD9CDqjVAvyvF48VfzryUxM0xZFu4gn5QjYwIcKd289ihiFHNNLnsVD4d6sOXPAta8/XZH88sDSJDJqApZpOW+fkSJucX+U3QioVHAsB+BiSUHNE0sPgzDEOTu/uXPRCKuVLOMjkSUFbQKU53FpuYGQPNZc8Uy4AXkiOq7HAoEAtMu9L/o9AHCAKKLrP9XckLN2kR7MMrRZk5KFTU2GPLuKwPGOyRqaCigPZXEjsdoyaxXhZCNppeu4SGu9fXI0eWnWmIXdWcSHZUQrZN3fb9wsdjiyKqVvjtyg8I3ka6We0/lMhfGTKpjOv7A0MnJ5/0XaQzICoQyZTCYLxaZ2eBi5efqkK2wsZrYCkps79ZhKJ9LUS9L3BChO+bpa47xN3bl5bkl9iYiTSY0S2z7NSHR+V8qjn9ESBEMWmGMPmuZL4802B3oo1/sMo33/gPchAcYKdGDm+w8hI45t/L8lzRVoHi+nGyY2npRWOfdve3GpQoMqKvPkIB9aQDNhE6uCicksWG9uRrJE40B1f8VVgBE/JW7oKvPNkEn1cJbr+LYkny0YY38aJK7PKGXZzpfQjyoMAbk9DpM7xfuQm3btiMUh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ai0ERFlHAqxG1732BmIE/TXvzphlK03LlPsPr/NIBMdrqehWA+a5XaqeUUsW?=
 =?us-ascii?Q?amYyueWiechcIuw/b5y9bhDPVFUjL483cxUQLN77sAnpIhmfyMHdsxJyH0bK?=
 =?us-ascii?Q?LUzj5iGA54rAOOfFxhqlqnYzfxa4cOLQoyjzg8me+4/XmmFKCzoJ0B4CvBw4?=
 =?us-ascii?Q?XwP8rr5DKu0GfAMFhe7nuZe6P6jKW+XoPjFHD2gi1VRAnnPr65Y/X+0KsTYo?=
 =?us-ascii?Q?JCguWJAeBZMN12PKRB4aE063PuN79GSgBgJViMd8FT78eXPmW7fWzooU561d?=
 =?us-ascii?Q?bRt1ApDNMJQLi/375MQDl8hOKyEYDl/mcxWD/JrXE/egyIkVsRIYMFVyifn9?=
 =?us-ascii?Q?AdjWeMfAPcgX8ZvI19oZfOrqmJ8eFi5qU1HGtRLPpJDgSL3lrYdZTcT35Z8H?=
 =?us-ascii?Q?SeDmAnJiXgQmIWsoA6HjirRRPEwZ2BQKLRNO2xGA3elzSyxNfYHMWTM8kjOq?=
 =?us-ascii?Q?3uEQQWyBHLke4fv8qfgsYmiz5TKPj5kMEAwe3xrtvoDbpFnFHaAreUDPOv0C?=
 =?us-ascii?Q?s6xbqHF3Q1AxxNAgjZWWqd7b8OQJjoQG7GZybQGyeDc97e/l//WjvuwYLE1T?=
 =?us-ascii?Q?9Z4TFa2BqvwG1YzA8zBMVnSdd5nLEHuTSgt/+fzmZulmMIZ7mepHnsWq7/u5?=
 =?us-ascii?Q?gQJqU2HYpdEkNyY0nSIUmcW1YZHumEKqgDe9l3teabzD7NjqtM/XWa0NKEJy?=
 =?us-ascii?Q?VnDllS63wBt7eRY99wTQawpOQi+St+vrv1G7IJodO9d7BiIZWdhrpVetnNpK?=
 =?us-ascii?Q?Y+kHwNWFL2lWFvysQop/h2+R+eKBDYumd1bUfrNnkHr55HJTnZOGqhTY+QZS?=
 =?us-ascii?Q?bAaHqE9II4Fwf81lAGV+vMVYs6XS6FHi4Zf++dx4yRYFTfD1DJlMap2T0Eez?=
 =?us-ascii?Q?n75yqH8KP0HF32UsItuW9KUOASYgGUUe+yfAXXn4p00WY3Qb9Fg8x4yjcaEb?=
 =?us-ascii?Q?05EgIjXTQCG4dGZTP2JaMWjeVZe3svnZx1ZBfSLkfHAoP2antT1WMcE+DCFx?=
 =?us-ascii?Q?fjs5z/2s32ilyThzMsYyWqEXcoJ41G6uvG+AOaMtV1ARLyYPahwoVptC0Elt?=
 =?us-ascii?Q?+ScoNPwQ9t28uBkaNG5Vgu2v5uH3+S0o731qc+kpZZJDRU5oBBT2l02S03GE?=
 =?us-ascii?Q?QD1drbMoFezrLcrOGDHTjuIUEVXVSKMxlsQmdSDVNEie3EaFa9zFJ7ygFtHj?=
 =?us-ascii?Q?P+hgqFOFuNUzDrvWCv/9h16K6uwdIFiH3pF1+GcOqVmuIpZWSYH42+mZ/Aql?=
 =?us-ascii?Q?u5TsYIVWB7+Iy3vCzVlhbMleDn++9fmW6P6KIa8sog09aQo1IwW/XBcF/Oac?=
 =?us-ascii?Q?TVS0M64Vp4hKeDpopumZcQQzMcwA4sahTZc6ai9FnxM7I8s76O7bBLj+wHhM?=
 =?us-ascii?Q?anuupyjnmgGL8DgjsIpQWBRQKvI3IAIURqN1K/FJGFBzWNCYZlmigsNAkU+W?=
 =?us-ascii?Q?pEQuL8XnK/gyQjMkUqfEEZWTRbQfZioDMDog8j/hSj78NrVHzATVi3g9EPWn?=
 =?us-ascii?Q?ZxWyNJpuWe1vbzpEgR930z9nbI7/qOjNii/NK9e0liPbI6wd6/VPk9loThFr?=
 =?us-ascii?Q?CR005Wi6XA7NmTbPf5IxANw5jyyGrq5wGhcrLhKELkY2QvnU0+AhQAPhFA9x?=
 =?us-ascii?Q?DReT9rXOU18uOC7REqnr62IIId1hGjH94Nq8tapxAiSqx6chCWzhT7XQMn4a?=
 =?us-ascii?Q?gdnMv+E6PcuRxefkz6nQPv37OVks0go+Lo4fh1QlQzAVTeoay9Z3TBLLk32+?=
 =?us-ascii?Q?o2O0y+pJLg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Y0nc56Nr2YdU6QcQnBIJxZ3mFb1lS9AcPQaJ9TnEU9YYh4h4qy3ZiERUBnsZiFT7cknjAeRdDwTPK58CUcbmAQutfg0+C4QtbK9Wnd93gjVNXVi2/X4lPRLU5S69S+FRt9JSEECRYOeBzIRHA8IHPCUeQYL2iZffFCs0MeImMVGm/zYjj+9iRS5WsqU8MFr/9bgC64XmF2cvw11Z1NEV/Z4cL9NdUidxp1aDi4pwTzslDwFTfQqmTzT0kH50Q/It7rQcU9+Z8DDmQXqdk4KHqYhigsKnAWxr+GvJpX1R7kCbjmnQCQGZbxDRLzvfW0Ti8FrVAQ6GEhZOuKAz9mBWnw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fea0fd-5459-4fa6-e7b6-08dea049dd79
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 08:33:44.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hvsVQGOV4z1DTJXe67XqCEK93VLI43n+ga0tHpT9IyQgNXvKATzAYvXEMQLlh8mrdh4Sa9+HOcdQcQls09I2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9487
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   98ff46a5ea090c14d2cdb4f5b993b05d74f3949f
commit: 4cef2ac4c795e4fffd6d35ea110f1273e3cb74bf [109/134] drm/amd/display: Introduce power module on Linux
reproduce: (https://download.01.org/0day-ci/archive/20260422/202604220910.6KmDxb9x-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2145: FILE: drivers/gpu/drm/amd/display/modules/power/power.c:1623:
+		/*
+		* DSC support:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

