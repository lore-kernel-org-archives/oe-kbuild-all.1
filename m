Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847D823EAA5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764694102; cv=fail; b=nJxmF0N9jh4f1Rl7lUm+C/OI7UYT1siGLfMsVqjdWN7Bc+o7A+ZrrX/e4pJ1yOoAjpK1DYFsSPvaoQEUfW5nR4rbHlhKqbWoy2PkR90Ky20yLCbxjiraFKSFNQ8Hfkmd+wLD+QQVK3od729bjaHhhK0ggYOkMLgWyh61XtvK3Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764694102; c=relaxed/simple;
	bh=2HfguLRPEfp+QjdQFG/pGcbYppRU0IYStgmsyIVoceU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JpeOgJbPJrl29hHWwzHgeDyscVqAV4ysfAM+pU9SQn1xgfOqsYYlbW+1XSOksCln0qx5O4MV1tKVr9RCSXA5BQSAP2L+n7mN+B/MXL4ShIRHWgbi35m0DO00MHKK+lhC+Vy5GXMFxW2j6hjJ0icUdp4tfUqYZvhli3D2YXdrXac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hM3qFEPu; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hM3qFEPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764694101; x=1796230101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2HfguLRPEfp+QjdQFG/pGcbYppRU0IYStgmsyIVoceU=;
  b=hM3qFEPurnYNK4aGU/rBesKaoAyn7qT52Xf9EmPo/ZozaixeCURntkIL
   4ZKlzFaYtFxba4CHG3bFjDewQIQAjYqfssO+j1rwpB1J++PNog1eVZvhb
   GRmXKDTpxAgTuTxNIcACnak4xUKzXEk7fteCNgPi6AlInKgS6q1ACJOtg
   zr9N71vJWvYauqrbRkVq6rAFFZWef+D/M7vWf/72K37zdfrZyo05IKcUi
   hITvxeCO7U4wqbKJI6Dl2+V7KulKd30v7w93KBr4mRKY+T2T+mHiHL22b
   IIrD0zlfwJAEBxMwhVI+6xa8b5icq3IzV6d+c189HzokYLdoIOQU5L2l4
   w==;
X-CSE-ConnectionGUID: 7icP/028TsivT44ZW/mHOQ==
X-CSE-MsgGUID: pkyVTonTRYaLUUZH1R7mlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66561928"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66561928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:48:20 -0800
X-CSE-ConnectionGUID: jHmzzK4ITTmOz7x32p7Ygg==
X-CSE-MsgGUID: YFS5WUsTSL+jEY8rl7+A/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="198610142"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 08:48:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:48:19 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:48:19 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:48:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NK6ZwKu14lPBhm0a/vGd24DYwnwZnVyEUrormXLdx9iEpXOGrSKQqMGMzRw6yW4Md1oEDGhnQhH8qzgUroBHcfOGtuViMu+SuPmxNwD5xAiEUaiMnRa3SDcAYbG0Z67RCSSX2cLE5+sd2tVGIfE96/wrU7k8zVq+dMzW35IApovoWYLvgWAw41Vcg4XGBuKkVMM/43T5Rp3p5Twwl0bw7GQMS6ynCUDvopvIEViTsZzdPJ0ZFn3r/pUK7jDiIwMXko3Z+HvWxq4jOpTnkFPkZgVHpGpDMWycOcFHmrxptMk0J+FX8nOoMSJyd0OoXvN3szKVnttqg5pb7ZjRRzDsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wJJrRgxktpMd0Pxzao6ad/LvcnFcBS07r1/tlFutmQ=;
 b=MhqUtCdwsLGgCkKA80NuDv/H0w0KxudSLt2HPjmgCYrROFgBOiisgCJURHT0SOCFhjp++c4y2O/tKEnRSTeYU9wXoTGl0AVIMBu3j8MAIps33dEkN6sMKF3+GJW48b5QeyNdPiiJlJxNYi79eUmkmLfaTDP4TQ+xZbESh7y3cHp3TCU5S0aLFEBOFoBpK7Cf9Q2XOHh7K0mtMC4teXD87tzVp/O3n1po6QhgDT+jdED68Vg1fd3M4hAJvrabRRujFBejsNh67bNS6hcYKea8+e2nMBqUUavHz0Vmi21weTI1fxi0JSLLQV6c7KPkKWQSU9jIv195bvP+GzuGn6YAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB6808.namprd11.prod.outlook.com (2603:10b6:806:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:48:17 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:48:17 +0000
Date: Wed, 3 Dec 2025 00:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>, Suraj Kandpal
	<suraj.kandpal@intel.com>, Uma Shankar <uma.shankar@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_display_types.h:1989:28: error:
 field 'base' has incomplete type
Message-ID: <aS8YSGcSo/IfdLyZ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA1PR11MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: c3007246-a42f-41ee-24ff-08de31c297a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DQ084O22fHWhRKu8C28Kho+G87GdbuOxBOCb5HLrvgeGlH1b8SppxE3YvS98?=
 =?us-ascii?Q?VaADJ5zaQV8tNsIPxcbn6MkHvaegk760AvqmdwbX7Sh2GNdGS0YVPUHW1hSj?=
 =?us-ascii?Q?V0Ya8zyfzI8Gjyb/ggAXn8jBcVgPuom1NiTLgsnYgYMJBZG6XY8L0DR7Lx2B?=
 =?us-ascii?Q?uYbTddOTte+yrN5X3eYObTOcXP/bzDMqBA8jyr1puYmRoCnKPaoVa5M7x6xn?=
 =?us-ascii?Q?l4D7vw7tIZ5z+AWJ+G5GgGaxkJT1fUZYY7VQT1xI0Nv+TRxDaYQP8BXIbUEb?=
 =?us-ascii?Q?E/KmxswirH946lDYMDH2pPZOb8wEw43BOCBLudtIidKSfu7GLGCGze4a3BNh?=
 =?us-ascii?Q?HuGhNUB7g4KflaZxOcJSuME5cT//7yYY6NWOs1fuXaBWeXDFwwLtFXfeBMXR?=
 =?us-ascii?Q?Q5bJtn6wuJUCTU+gGkoe9vaaIg3kiNyF1k561SdHc75Y9Eq9zKDmsJJIyefS?=
 =?us-ascii?Q?E7Ki3J0GYmoBC6blNwizWEEMSWY6jbDdIkERMnydhgeBMXv/Pm8UQghDsDd3?=
 =?us-ascii?Q?V/8Mtuah3/dbLTaPG4X2JZkxGJai4BbSD3+y8kCgHCpBveJVThPrWm9NE1Be?=
 =?us-ascii?Q?CRK6DgFL9MhWZDKGLusUjHYQGbheJsl7RP15ZMrjGxGafeXLzCRilmU5FWDB?=
 =?us-ascii?Q?EWRXBfDTGXBRO22/EbOWzvFoWA6IVq2yhw7d+T9SkD+sAD54oBxHe8FIievU?=
 =?us-ascii?Q?8P6kUcIo79pqJOu2q+5utnh9f/bTkvZzpaRXl4IMj08OoW3by8JR8sSxSuSw?=
 =?us-ascii?Q?Sd2g38XbLb9voZa7omoE0h+Frxys4rcTsjUDE31qIhEHBmoSImXHKefPCpe8?=
 =?us-ascii?Q?g9z0K+7wB1GZp+sNpF/2v7SnVy/4VC1ZXMtnSU/j37iVL0Mki+P6M0GkoBRK?=
 =?us-ascii?Q?MLm+5aUiVSFSSNjaBSdMEdwp6ROw/rduU9/hDrEa+mH27LepdREq7/sL7IAB?=
 =?us-ascii?Q?ms53kREZngfLopFFoFZVp55jgaDDOCdGJ4fRRgHWFGV7juhxAo+rl7RW1XpY?=
 =?us-ascii?Q?R9VFhX2UgnXG0d1WheNOyY07zof7PHMjZNuuo0DVG8P23sExbyxV/FfQqNAD?=
 =?us-ascii?Q?0HdHLgKilwCJGsgZqsXbgyQNRJ2fiirz65stX9Gm7GA0xJKs8mpbVbwW1lBO?=
 =?us-ascii?Q?BE6s9vP/BD5J/R7kP6D8r84vL6cr3WaOKPK4vq4pQVJX5uuF1rL0g+XbbaK0?=
 =?us-ascii?Q?7EWDV6fygpr5onWlaXebr37+UqohQSZsqIZIBFQcJ/SIiHohErrdCy+RoMOn?=
 =?us-ascii?Q?K7suO2i2Dykam3Ml94OewU23LJvWPYZ1s/xCIdF1GlQ21aDe1e+uIpiVMOM1?=
 =?us-ascii?Q?Nw+n//2X8wKtmAt2fFCtnvAnn3C9Tm33NLgeVRY/tcCMYlyce0sAsnkzdRJb?=
 =?us-ascii?Q?5OhP6OSeadGn7YmXyb4niwrEgQxH4bKDAIvTS9PDP0uw/b0VtoV/yOsEYgnh?=
 =?us-ascii?Q?sBsQqbgFIYcY2klWUOf++vYDL1R54MIzJo7Oh5S4Ez5nLwqGx9WmRQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bJ4trD4p7uNCLIgaNfNUv8ngCwGXlucgAJRF1j3N0r8Jsmw0hFMK4AAIXKtR?=
 =?us-ascii?Q?sF+OE7CaSG4MqTeAzmedZobsoUNJO+y+LjlsNH1fNjzQwBWRm4YPFhZItrpx?=
 =?us-ascii?Q?LP2jrFU5H6bD6Th0fgd3ILTGNZiKzZAcrc/VbsO1kSJe6r5SAl/AtTJuEZSU?=
 =?us-ascii?Q?szPrloR+ytRok6whiKrGADWXjoztqdTWCufJeDH17fb17cRMaketciczaDfN?=
 =?us-ascii?Q?gowheWvlXhF1fM87F72Gr19ejsNlptXG407GBEGjyVtI2FR9Ps+YD1ZD0Gz3?=
 =?us-ascii?Q?rqA16xefaWlcNjCmYWhm0itjwjWZR2I8lREZ6iPpSUagCyaP6BXvZ1KJSrK3?=
 =?us-ascii?Q?QG0dCxYBSSF09BSKIQ3Ltc5JCtsj94sL0IeomgCtZrd/kTeXLWi5bPkFtgsT?=
 =?us-ascii?Q?qxuelzT6ZGmghRgeDq3S0b5UssPr0aLCf+1/PslLiNTthcs56S38Qzp5DJ7i?=
 =?us-ascii?Q?Ne8hS2Y0I+bfTJ2W32mYV7vLXj5mNBHkgWXQHk5LVhSqSpUul7LqHmA985y8?=
 =?us-ascii?Q?jnEwMFspWrhAAIF4RabOn0mYQCs0CNHXMChX9iFjSnhUrqAjVLtYr5XJBd+g?=
 =?us-ascii?Q?/lsH8IolkDNrWCR2yCoTUg/neNnkm4WdLuOCXBiI7XkGqJlbk5HqqD/rS7+o?=
 =?us-ascii?Q?aefpAGdIDnj5BcOOEXKqfpfbb/4fg8kDLWRGBBNHVDN27bHMZ6aCxopxcqAs?=
 =?us-ascii?Q?nSuItDvnJyNVhd0N4cV2k3HTl7c58OI9V9bowbFPsVsS2CgsfGHUvesFA+Zc?=
 =?us-ascii?Q?LIweLOw7NF9lIHpYEk/jTn45kzRDjt8W0Q3Rrk7LjGL0lWc1gzhiEK7FXvCj?=
 =?us-ascii?Q?28o7NQb8t2b4zVFbwSiKDG/uzHM7kmItHldBdmVWsZTxi43oOjuk19e1Liht?=
 =?us-ascii?Q?kDB5vSSTIjkktkKI1gD9CIgT8WMlTCNd618DW1wrDLIl+k53ZNfIyiD7TrJQ?=
 =?us-ascii?Q?d1yqjR5XxKL84qYGnSp0HFqbZa+B6UDBLXj/HGMvX0c3OX5roCcqYDZ0JTIS?=
 =?us-ascii?Q?AmtMFohtxP3cK4xhrJGwKrfS3O1jnrOEQ84E0nhASe/z7n1SDSKVDVKSq2Ry?=
 =?us-ascii?Q?ooHod89fvlnyKXwOezuy06Q+pnXfDpA9d7or4fUXZIrxapPJhAtZxXhSz32n?=
 =?us-ascii?Q?9yohBT0gWuIYJpSZl8RKaj4/2MS2i4mERQsXTXib+PGgJP3EDcrntmBdMD1k?=
 =?us-ascii?Q?gjbrmgqlK3kTaU2n9gS+f+Ovwixxdla4QzPVVknUKNptreET4ygGpzj+UfO9?=
 =?us-ascii?Q?Z5YBtNAdYCCUkAO3JzWPnFi2l+GOSNXe84ucAoBt4hEVDf84VhWeUwauf9e9?=
 =?us-ascii?Q?GPbaMppXAMqA6m60eH/4hacn3ibfx5urHopSb8pfB52AFBlZqADn7Uz6AxJ1?=
 =?us-ascii?Q?dNeRCbBWZotx1ZfRlin6Yq/3Sjo10phH1UTDseMK4U+gLsO2aozsCtz1I+7p?=
 =?us-ascii?Q?N+6RnaU+bO9NmjxSDk4huJPzvv+XuHaY1jJeGWfYWm+HqOWc1cZO/KBvr0M2?=
 =?us-ascii?Q?VVRCQzXzHffgdS0zq0AqMoIB6K3YEy5/1aYcaRmoquzy+gVHZs66WbQzRnSI?=
 =?us-ascii?Q?X8+kvouA2gnEsRTzynG9pHlp5VZtsQ9tLx7V1JVHrze/AKEVhY83beW98cIq?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3007246-a42f-41ee-24ff-08de31c297a3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:48:17.3346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BQAt+rQNeyNUh6ndQoVidFl0JQ3NW0E0XOQaRVWchQX0fGDUOSIwLXXngcXoQbfGzoDEridzbt+fGZ/3pdrbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6808
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: e1baa3af87f6aa58790e98aa728c99a548dd9cb7 drm/i915: Add intel_color_op
date:   28 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251202/202512021242.u5Knsko8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021242.u5Knsko8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021242.u5Knsko8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gem/i915_gem_pages.c:13:
>> drivers/gpu/drm/i915/display/intel_display_types.h:1989:28: error: field 'base' has incomplete type
    1989 |         struct drm_colorop base;
         |                            ^~~~
--
   In file included from drivers/gpu/drm/i915/display/intel_colorop.h:9,
                    from drivers/gpu/drm/i915/display/intel_colorop.c:5:
>> drivers/gpu/drm/i915/display/intel_display_types.h:1989:28: error: field 'base' has incomplete type
    1989 |         struct drm_colorop base;
         |                            ^~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/plist.h:76,
                    from include/linux/pm_qos.h:15,
                    from drivers/gpu/drm/i915/display/intel_display_types.h:29:
   drivers/gpu/drm/i915/display/intel_colorop.c: In function 'to_intel_colorop':
   include/linux/compiler_types.h:552:27: error: expression in static assertion is not an integer
     552 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_colorop.c:9:16: note: in expansion of macro 'container_of'
       9 |         return container_of(colorop, struct intel_colorop, base);
         |                ^~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_colorop.c:10:1: warning: control reaches end of non-void function [-Wreturn-type]
      10 | }
         | ^


vim +/base +1989 drivers/gpu/drm/i915/display/intel_display_types.h

0e32b39ceed665 drivers/gpu/drm/i915/intel_drv.h                   Dave Airlie           2014-05-02  1987  
e1baa3af87f6aa drivers/gpu/drm/i915/display/intel_display_types.h Chaitanya Kumar Borah 2025-12-01  1988  struct intel_colorop {
e1baa3af87f6aa drivers/gpu/drm/i915/display/intel_display_types.h Chaitanya Kumar Borah 2025-12-01 @1989  	struct drm_colorop base;
e1baa3af87f6aa drivers/gpu/drm/i915/display/intel_display_types.h Chaitanya Kumar Borah 2025-12-01  1990  	enum intel_color_block id;
e1baa3af87f6aa drivers/gpu/drm/i915/display/intel_display_types.h Chaitanya Kumar Borah 2025-12-01  1991  };
e1baa3af87f6aa drivers/gpu/drm/i915/display/intel_display_types.h Chaitanya Kumar Borah 2025-12-01  1992  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

