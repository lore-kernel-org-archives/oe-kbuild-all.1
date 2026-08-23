Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9174F493627
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487850; cv=fail; b=kW3e9X/pZIKXNob50PPCmO7A0CBQmNe7EntV8FRSD9QonxDHSunn/HCSUz0kEPPDCP+tBwN88iHPvCv9lLG+1HbGSJXwhj3T3CJP+UYwLjbn1wnuZ9LqfiJb32xr/HAfJT+HXWBry8XDMujbITKGw3hYHwEdH5sbYZLi5KlNA7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487850; c=relaxed/simple;
	bh=fvZHbJvMzkNRLNWAbJuSGSVL/citLKvUFQ6Yxuv53eA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JG+WsiTecsZPm8ABPcF5jFI7i/kx13fJHyllpVEU9dM99c2vn/Q2CorB0l/A0kvBc9qefQz7zgXGc69eA6Tqzf2tYjCet9qZF3vID9Z1dE/727gAgkIM1zHgDIdLpvEyn/9wXEcZmNbgDLpi2R5ePXgJ0Dj0L3RW6Sy2rP6YeTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdbBfxHs; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdbBfxHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487849; x=1819023849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fvZHbJvMzkNRLNWAbJuSGSVL/citLKvUFQ6Yxuv53eA=;
  b=MdbBfxHspsg5i8SiMoCRkRwBjhMRb7njOovKZ1Un6A7vVioor8MtGntH
   Nt1B04m94k6CPb5whMxc5AlIWwJD8/ZcfANhV4tkG7p3+/LOfg4u+Gavo
   uBc7wejjdxi4A/Jc0UCkU2lnbtSBHMa6tueZPBSd+9vvDI1oLfpzOk/bJ
   mHogjEiBAS8ejVdzWUnOXXt8NTmHrXM9GthNqwWRF6ozaBtc66rmRVfLM
   MHLVbgBLhm8s7wL7RlPgaTkmfHORyZYzfSIU+9pm4k/6x6vmjw2CPbwo3
   HZv3MHhjNJHGD7qtY+J/+nd0AvZ+N/dvhsG+fwaIMqnmJeFOp855jsaY5
   g==;
X-CSE-ConnectionGUID: dh+UTScmRzGc7wh1R+gExQ==
X-CSE-MsgGUID: cEFqd4u9SViPwZFlciBvJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87725957"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87725957"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:24:09 -0700
X-CSE-ConnectionGUID: +awbCtZWTvqMQEgh4LaP1A==
X-CSE-MsgGUID: zhrWfRIzQzSTHc3eUItNpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="291602123"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:24:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:24:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:24:08 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:24:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ub7FUTK1lYBciLqx9fT4zIhEOycuje60NOdUrjpnBktIRkanOlXqqk/65e66d8XNzTqaSAK4+sLOYrMVqS+MzGUkHJ+p3JdHa2k4XLGH4EekyIOwI8+tsrfRnWkkP7d67KqAorD1SCL+5C2u6ujySI6hz9XfnDTK0nQRG+snr6SKXQGLJ4tyWUA/9+d2DFWCxor5mWRrB0vRtdSq0Xe/ZlCMSTBynK5qDnJCDpN8QqeVwnUtci0GAXlbg9CBT/qqc8L00fZSKqeQ8qLR0pqL+siQIl6PL/fQ3F9cQtfoi//WLSrPgA1+VYLMOWs9VG2PlRXRdT/Qf/7sz1LHj5PkTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ie+L966uE6sr3X3W7jRo5YD4Xcdi5qMA+qXJ5IltvKA=;
 b=iV9v2mm0r0dtFVU8D11eJjhvE2Y+zW5bYqC0pdfPFeJSg6ixuD4apXX6b9ycCk0xlnN6yH9mhVPcgoUZqmixVd5rbs7v21R1irleoqbSGIJMqezeEx4JQBVS3Z+KOIWQv2GsLS8voZOY3labDWSnVmHaz4d1z81KkmJVMKwysJYxqzlcyyiEjUlvC7q+HF5p2vgeQuGeFZh7aQFOuGNAcBOChMOeaMPMwZiZhg7nHCbvId2uTEqss6vhkNWFrgm87xZHGb4BlwBzeUP0wiA9VBxcwdw5OAiSkTRoNoJ0kNu0VQoGhtVGks4lEs5w6pFkxsdDv7ncJEbyZGTOFo6frA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:24:04 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:24:04 +0000
Date: Sun, 23 Aug 2026 20:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jimc:scratchpad-v10 15/24] kernel/locking/lockdep.c:263:2: error:
 use of undeclared identifier 'SCRATCHREC_INIT'
Message-ID: <202608230325.neM6byLu-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2f97ad-954b-4505-2818-08df01116b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 0OGxIfdtSuOFGQpUyWYP7Nb/yoBGhhZr6mHdXxhkC9+ccvbI4naRb6jI4dxfma38aRByT9tOqg7tMGK2sCPnlQmpgswYeWnlpVZd/rCxkudLa+NwgN/+MFebq9WsVHyWT4Hn3B46PLa8S8wH3MVteOy70FvgyVLZHnzTGjx74FFL1A0Cv3fAs6MZVSm5FV3f3YkpONgMKi8zAfVwXNtUG0vprvJdXR1H8jsT8FP++X0TE+RNbjW00c87Y9KMkYWKAZHIkxuhWzsq9GZtJlO3ZQzFc2wfbe3aW6lg+76nnxSG3awDJXx9m6D7dSF+oA28xgHDiYQP7qEEmJDHI7MdATrIB/zalbjDS93NJqAISE/JvoBKf5ri1u3/vDLAyJHpLikwXegzi4GUh5H9755nLJ+RTZqs0/pOa/EqGhv8Uz4cpu14v5h18lo1uQD4Av2au4WPyor6aBWPg99bLBO9+wFGVwOrblx4sZ0p/J6lr7axI0+lTkpl9EkaE5jjjauAf1ccs6z4//3lPpNlahvKFHRFqTrjjwaocQGzlnVFhxCqgSB3NvfEDyn9FS7XLBhY57iGE6t1rwZ5ji+0GxvBAyim+l0QM3+UK4tb434twE9bLjqOGjBjAkJGAZW3OFjWe2Ys8YYWG2khT6BEKdnuJ3dY57mWXv/+FkRaaLOTg7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FvgV0GT7YKEiVITE5VzwUCLN2mqNfcUzzpcnqS/jub01xcHkQckHm1Wpt7et?=
 =?us-ascii?Q?IptT5bQyWRpFBUftWNKbFPv2d4kmqyDZf5BxZRwHqL+9NXmWCDqIMDsYRdj/?=
 =?us-ascii?Q?X7ZspyeNj+CEXhDz9w34kjpkQRDA0qjoUonnU447MdwxBy1InryHd+sDYsHI?=
 =?us-ascii?Q?rMOB4OqJ7JXbyNhFMB8BJUxC9zFHu25XmBeNj0AHWdUDLcclt/QpS4LDDExw?=
 =?us-ascii?Q?6DTwgCsJJPTd6ebBhE2wi7rLPg+C2OlNE06W4X0V48aKOK/XIXpCOrY9YDmb?=
 =?us-ascii?Q?VEFdyg+LKjk6fwq5OkDz2yLEoR9BdB1Htbx0wRODnCKHD+W5iV4g5Lf5XZpl?=
 =?us-ascii?Q?gBNN0SMojaWqF2/bDQGwD0FdKvXWz/55Ow08xUgOfzLhn8cy9NHfuOxDGK/X?=
 =?us-ascii?Q?qhW/yTuMMwWZF0SExkJ5WFTjWRxrm6M5UbHnVEy6UBNSD9rYcQywC2ZQYA0n?=
 =?us-ascii?Q?NFqouQDvEhtuajT47KjLbj6XccDodYDfaxFq1IUl/2GzkdHogjsXIIZPLYl8?=
 =?us-ascii?Q?1S0ZGAw2AQVXkWvpVYY3K6/HbSIKWKGNa4poDh1byS03HXhJjZ/5NaPnGoQv?=
 =?us-ascii?Q?mLwJegwmDiNobJErvvDJy5IYiUcZw9hPB+oRJg2bqALQgS8GqB9hXbbchwoz?=
 =?us-ascii?Q?eqeEF4U0ZazX0b8fKvh4GHHsZrSltveZAtImHugDSirK6RgVCoDmVGyt6Bmn?=
 =?us-ascii?Q?mTj52AONeoUO3RZlZKTJXTC+//K+tRWcio0A9LjcLg/hGEE7rEwHBzSDbbMf?=
 =?us-ascii?Q?s+OvSHNh1xspufp2u9e71qYQE/lhzZ9UxD5VEnlrm/H4wC0oIvQ94LBMVir8?=
 =?us-ascii?Q?a9ggfUcijRDmiaPDeqxsUpeNjrPJr13wx33dWO3zrje8ThFoN8bDHD9NksSm?=
 =?us-ascii?Q?yQRkLQ1yeAH7v8XgdZhCdBAEBLCdThiD2+XwgOoMvT3Tf/W7ClgjQiZSqcI5?=
 =?us-ascii?Q?kDmb/f7ZHusJQ7sp1iIeuPgHsRdAqSeSIi84gI2tXhPuTKAbaCEch4FgPLWw?=
 =?us-ascii?Q?F5nRriMVFNGwaeBouHfb9Yt8iq15sVnEcHHE/+RbMH3UBUDBKmsl5bRGzoJ0?=
 =?us-ascii?Q?Q1QMAVNPMjV7igH/sVPUz9qBgefHuHXnXscOdCgOUSOwx1oOcWQwPHUIoo+a?=
 =?us-ascii?Q?qcTDO2VPcyKM3ohhX8B7I9mlpFdZJeL/QG3VVvLn5npGndrZw7+yUg8a/J/1?=
 =?us-ascii?Q?E5UfWs20OfcgUqkr9k5NcO47Sbdua3NgwOIhavv0fqW5jVjU+1Wdw52asYlC?=
 =?us-ascii?Q?7NPSFQ1/paFZWQCDnDVVIN+5G8gkI80HbAM6KIlVPUP1i+ujBau0SVsfMCYV?=
 =?us-ascii?Q?sWK7kzQTnAt+Y0kUzFOFzR7cRH6Y3OAZD0SleRpu0a3RhBvjMD8Wnke0uJeP?=
 =?us-ascii?Q?ppGjBNhq/CZXBH8aAwXjeo4+z10HNbajvq2P3J8QAT0FQgikoXKXUuQh2JfD?=
 =?us-ascii?Q?lhhGZDJytRcKpe1ujpLG6GwrX4DI2jxFOq0sVR83fSpRz3QcdWBGtAuLdGZN?=
 =?us-ascii?Q?1NkmZrYQRQqbLTuxtEGJomObGcFhJtDdYhg2NfLQRahZSJ6cIm78VjxFU6CH?=
 =?us-ascii?Q?nD1zDuGj16cjjM50bDZsPR6DlZjwvJYR/V6bRpT0FzqSJ0kX0IEVkNO84RDs?=
 =?us-ascii?Q?skt5aFw29AHBEOMoPhRTjwF2Iix/yqQyES3gBisVIYlGX3dnzY1GlmQ0g3xs?=
 =?us-ascii?Q?b+E0bywRF9j2gvEdSV323IIRJryT573B6i9qrCOWguyUeX4QD8hRxkEAhRkP?=
 =?us-ascii?Q?Jv7O0YYFyQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: QiRQVemgoRZvJeNkN6qD+oZTB3ZwMrXuah1BKcz5pp2pMvWAtnzeLZmfaPUap9XRjNszncfjYq+Nwhfrm2Wova72+1r1Vqka4Tnp/ChtfflHOuoizWMsdT7LOKZ36SgkUxKJyuwK7gSkhWGeVPevS4oxNGpEYfoXeiFMuJy9+0IqguAsxfXoscxkzkd/FNh1PElMKx+4jlvQ5NXixcIQhmdcIJQRjGOLM/oXBK9HWVWQrzmF77Le1fp7jEFRlZpO/NN13Uv4F/3dMjKFodg/xIuv3duCrH+XBrJgtFWV7H8fajHm9S1vE8QuE4u9mTVYNDlTjyPwkMY+sPks5taQUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2f97ad-954b-4505-2818-08df01116b85
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:24:04.2440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qk040y/xiNd3h97YrDVGswJG90EzohIaOaVPI1CtJ2vlHed1swc8TtB6invOGFPeimNbnXKjI3DTPC0oGvikJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
X-OriginatorOrg: intel.com

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   a23fc077806416450fbeb0a5a534fd995e465430
commit: 468ef4eda872252a66884b59339c1331ded8a0fc [15/24] locking/lockdep: Back lock_classes chunk array with dynamic scratchrec pool
config: x86_64-randconfig-001-20260822 (https://download.01.org/0day-ci/archive/20260823/202608230325.neM6byLu-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230325.neM6byLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230325.neM6byLu-lkp@intel.com/

Note: the jimc/scratchpad-v10 HEAD a23fc077806416450fbeb0a5a534fd995e465430 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/locking/lockdep.c:71:33: error: too many arguments provided to function-like macro invocation
      71 |                                SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
         |                                                      ^
   include/linux/scratchpad.h:360:9: note: macro 'SCRATCHREC_INIT_STATIC' defined here
     360 | #define SCRATCHREC_INIT_STATIC(name, _elem_size, _static_buf, _size_bytes, _min_order, _key) \
         |         ^
   kernel/locking/lockdep.c:69:2: error: use of undeclared identifier 'SCRATCHREC_INIT_STATIC'
      69 |         SCRATCHREC_INIT_STATIC(lockdep_pool, sizeof(struct lock_list),
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:265:26: error: too many arguments provided to function-like macro invocation
     265 |                         SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
         |                                               ^
   include/linux/scratchpad.h:357:9: note: macro 'SCRATCHREC_INIT' defined here
     357 | #define SCRATCHREC_INIT(name, _elem_size, _min_order, _key) \
         |         ^
>> kernel/locking/lockdep.c:263:2: error: use of undeclared identifier 'SCRATCHREC_INIT'
     263 |         SCRATCHREC_INIT(lockdep_class_pool,
         |         ^~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:608:11: error: too many arguments provided to function-like macro invocation
     608 |                                &lockdep_pool_key);
         |                                ^
   include/linux/scratchpad.h:153:9: note: macro 'SCRATCHPAD_INIT_STATIC' defined here
     153 | #define SCRATCHPAD_INIT_STATIC(name, _static_buf, _size_bytes, _min_order, _key) \
         |         ^
   kernel/locking/lockdep.c:605:2: error: use of undeclared identifier 'SCRATCHPAD_INIT_STATIC'
     605 |         SCRATCHPAD_INIT_STATIC(lockdep_trace_scratchpad,
         |         ^~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +/SCRATCHREC_INIT +263 kernel/locking/lockdep.c

   261	
   262	static struct scratchrec lockdep_class_pool =
 > 263		SCRATCHREC_INIT(lockdep_class_pool,
   264				sizeof(struct lock_class) * LOCK_CLASSES_PER_CHUNK,
   265				SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
   266	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
