Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F1C63D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 02:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723688372; cv=fail; b=DmsGwIBzVXUNjmKPP+6j1l6cCiOKMIZXMgdyg6Z0Han+zE+cYtzTIQOpRrQh2dhvFS5ZgPPZ8I3+ymB8p57f1xJ/O7UrCKfDLlbFjrghLT/SDl+JE03t/ZQX5EK5KPg7ydVJdb98KwtL7IrkeU/gqHSH8+zNPcAQqayiSwh2xIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723688372; c=relaxed/simple;
	bh=CtAdFzlgbrU1fxleTWH4smjq7rJj3pol614ARCgjvGw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YrzAjh2ewMbETc7FghJydq0oAziSgI6RYwUtWI1WzeasALYwtnQ7POxKHn5mEK8/lTjOlQLTrvu/4b7aZcv1fV6m0bO5fyepQ2Gjxgz0AjF8RlNuZyhNzlx6PD4cf9gybLHHlgJc2MokMHPT+L5oqb+v1CTc3ajrpznQnWob6Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JElBIPLe; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JElBIPLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723688370; x=1755224370;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CtAdFzlgbrU1fxleTWH4smjq7rJj3pol614ARCgjvGw=;
  b=JElBIPLez50ZMt2snw5vzsXcBsDzWJ+54n/vihXOBXG74F5bdBbM09Fs
   YWfiy1/mdYkZXVcZVXYZq5wE6821ezjOy27n82S/N1zL+JpSHW1/QkHrQ
   /lsdPb5CfZ7WO7VqX/XCw52QT9gSAoITNcn4lD5QwcA+CcV5AcB8kQ0fT
   3v8211U5P5Zr2neL/RDr5PMG2cXru32W9fxocEFhSrvidKntqjrQdbuIT
   8BdJwmU5jF8sgIse36w/2GUlcCP/nQ7d0N6KxmQBJMpYpdihe0f7B6maM
   RsuJ3qCgu02iy0Y0NUrKXUhB8vBKGMda9WHQfJF7pARxG1DdHE/peAacn
   A==;
X-CSE-ConnectionGUID: M0VkXr8ZTve8XV0eR1FjQw==
X-CSE-MsgGUID: 0B/Op+gBTx2+WnwkaN+D4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="25699329"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="25699329"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 19:19:29 -0700
X-CSE-ConnectionGUID: cL4fQZTTQpm5CvDwjbq6Qg==
X-CSE-MsgGUID: dVM8na3CQv+FKajujCSIow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="90009705"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Aug 2024 19:19:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 19:19:28 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 19:19:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 19:19:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 19:19:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksPhTDOXsRNovvxNJGE8r4JHcdzm54DIuk55oPdb3wnY4zbe9+sqNnnKK7YRRrqUZ3tLMthcs8ohPZX41JQ9hRkjfc8SeTgRmp+bAEoeIYFHCG7zkrLVn5phFCCgxcpL/IH16V+GeRQCl8NhdaEOTrjN2AZCL3NwOfinNc1INuOCB/aUKAPouQ0/A6HFEkffEetOQLYPOqsi3hvA7Z+xx9Zjnv6rhAlNxR3Rff6DMnbX6LuafZogjOVzrEU3787HeGU6vqgsElsvS3OeH8f/ONeLvJm0Tn2444hYPQrNZpAhmpiJ2FT47qynbL9jdd3d3c9UrbEPvLbwEWPjwTFdwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nATmsaiZpfKFUMmTErCZmCMPOY/cVzltZ2hnnjPD8EU=;
 b=TsR/PFWxExtGuTEg9IGpPSE8tr/kCaYQoe+A4Q/fRTXt91DM4t6KJPvRc70toMdBLOciO4LnTtdbCWgrlNqPmrVszeLLSUlMTGUKyR/pPJlV51rXCGN6mLQfTjJ8ClSiz6PLWQ8YvdepdHs8dm/qq94qeE9tvBxEvp1uPd0Kiw4Bzr8JW7uotGlC7aTmAiAoFhRjOvaOah7uB+NRCygkdDjdXIeZjGu8aIp49jgP/8PcLJLtk1sFiYCQkP4INIfROb49h9sy7yAnAb/2+Tfkt+2xPpYnKyTKauNQHdc5KMJx6GcWEzfSQ8NWGET6Ysrmrv8qT6lmhdTcs7tDZUbL+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.31; Thu, 15 Aug 2024 02:19:20 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Thu, 15 Aug 2024
 02:19:20 +0000
Date: Thu, 15 Aug 2024 10:19:11 +0800
From: Philip Li <philip.li@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: kernel test robot <lkp@intel.com>, Stanislav Jakubek
	<stano.jakubek@gmail.com>, <oe-kbuild-all@lists.linux.dev>, "Linux Memory
 Management List" <linux-mm@kvack.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>
Subject: Re: [linux-next:master 3898/4224]
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00:
 'battery-detect-gpios' is a required property
Message-ID: <Zr1ln0gSlaDeBhn9@rli9-mobl>
References: <202408140049.pjQHYO6B-lkp@intel.com>
 <82cde353-ca36-4272-a954-e816f551ca64@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <82cde353-ca36-4272-a954-e816f551ca64@kernel.org>
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: d45a939f-b825-4a9e-deac-08dcbcd0abfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?opZH6o1bDQEeEzfugn2uFB4okCpoEyo0qoal0Dmdv0W7iYXkPnKwntppPt70?=
 =?us-ascii?Q?t8EUmRNcV4d3v/5Ji8GZl6vVjhFS6qWGZ2+yuiNQDQcxSwpkoyfwhFZ0113q?=
 =?us-ascii?Q?28nDO2esU5vZeWikuLw8pcb90MCN6qbR4sd/1FX5XmMvljK9J7cvDdv1lwBX?=
 =?us-ascii?Q?oGScoAmI8pb/CuVUkq+BTbzCRgzBk5ZEX7Kkd5DYBVLFudnny0JvoosL6/f6?=
 =?us-ascii?Q?PGTOyzRCYAK5wBBozg8+RVCP+AjCmqxdtxJbJ5O1XQ8f3DnNx4QlB/3JNgcK?=
 =?us-ascii?Q?uBxZuf9dOagvXgD5ciXlwjz72K1jdp85/pFxtNKZQR6xzmN/TH6mo31JzU7t?=
 =?us-ascii?Q?JneMKGjH5IG7AlcU8F2UmcFqQ6SbsUux9wOU36vVPv3Hf2n774FK2Rn7sE0e?=
 =?us-ascii?Q?QoZcZdD/tyRLyysexKfC23FiBpQ81XhveRoq/x0Rpwl9BTpUfkJ4OPU6DFGe?=
 =?us-ascii?Q?FrBM6+lC7LdG2vAMmRK0J9BEpQqp1cQ3/ESkIti7emWnSVcUt4+Ze+u1rSsk?=
 =?us-ascii?Q?lEaqPPYheKA+6tVRhyLLd5cZTESLY0dQc4zlRZahpjirioVPRCSphyiBkW5K?=
 =?us-ascii?Q?XZkHepHRmkFb4COtb4lMCFM3xlztHj8uA9lQxoi+ZDcwb5T/B/g+NUuH5m2w?=
 =?us-ascii?Q?Aqgom0QKIzytPwqt5lVdvLmNUQb+lnjiMd289+tDp1WYKtR0fotNkms6Za3P?=
 =?us-ascii?Q?FeFFrgTXIMY3Bdbu8OdIXsXtPVIKJcQhhyHcpIUnoD0cXX8XFceoX39cyLKv?=
 =?us-ascii?Q?ZskdLw+MBDXAJkXwEqdMQqnXAs3bBvQKmrf+vEVqwx3eq8duIhOZVoeSIII8?=
 =?us-ascii?Q?rURjrFd+JgN52sPJh1xQCG5nQrheKkMux3lrTQKKhvPoY3McNSGxgzbxTq0+?=
 =?us-ascii?Q?T/rGwsVLiyDWmdqPJMUy7CXA6APRIXmbSd4ilcIRWSDmHTxMcJnbUQ8VjEpP?=
 =?us-ascii?Q?cRzaSyYsNV6sJWoeCk+czqYVfy5D3n5fopcscNQ2YluKqZZTEUi42Q36Pqzw?=
 =?us-ascii?Q?wCCP/x742oij6MB1plhLmsPE34wbUySB/eqVVrm8uXWG3k+3b1OBGFzOwpvv?=
 =?us-ascii?Q?7cYS7SkJyHNL2udVWbuabLc8rvdzYW1Srm4AUKs8/XrJJoegwgmCHjQA2lzG?=
 =?us-ascii?Q?uBWFPohfb0uHXZKnSJjFJZ6NsIy7iAkuU+q/QFo6beZ/EhU6wtYf3B6sTXBx?=
 =?us-ascii?Q?4TnRhfcsu6Q3lSpw4CvL6n3J3xdBRaYTVK/ZiNODCzAG/4scqHKl5X3mMoEy?=
 =?us-ascii?Q?2uOvpApaG9i74MBVgqbbPtQfw5pt0fxFxvhm34WFXQ1A+XNX9/8/pj/BmQHQ?=
 =?us-ascii?Q?elBwUdxeWuHI7YNKFlbUrQHwB9ruk9iF2q8GY8GL1UVWkw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xx7oP8NWEWmwGxThl8Hz+JOIWi1IXh0RiXf/XfcmBGK/oPjnFUTrOk6Hq/jp?=
 =?us-ascii?Q?aQg0hBl6j1BkLNBR+Ia9fMHFBCwnM6BtUxby9y48FP2jNR1VcKDBbabiAM4K?=
 =?us-ascii?Q?eQo/JqKEcUQhgRWbR41lyqgOslefpVqwcKuRPqelRFfuLvivxOuse6drkxNN?=
 =?us-ascii?Q?avLe7waUJMXHBOZMUHwGQzuPVKfmpMIqdSq2BaoyU8kBm7ZGtYzic7DNatZP?=
 =?us-ascii?Q?swOtGxZeMXFAbAE7bfDRio1EmpKV+LxKVXMWmljjhlq7CFKChFaBHI9YqU5B?=
 =?us-ascii?Q?KPZlCNnhWPsVf1KJ2MMN7vraPcnVlMV2hDw2lF79Q36LLBRYlqN4jVfr4ttY?=
 =?us-ascii?Q?CgHqK6BVO3uyOpvv0UwOmJXcMptTG3/cRATbKlltM3db1hEi0E7cYbPa3Nta?=
 =?us-ascii?Q?WvxrffFJSUxD9xj0PrTr/gfRsyssasNPiR9cfCFLUdvr3tH/y95xLzE0OhZO?=
 =?us-ascii?Q?hxmFi9CUGm2DCYElNnSJN11SAqJCQA2PcRxX9LkJIGcq6T3jwwYgD5oG83tZ?=
 =?us-ascii?Q?TzzZhWMHbRttSTQF6hyETP8Z/2Y7jmqkMzrNOLXrgCBFniNR94EQI0NTzAN/?=
 =?us-ascii?Q?UsMMHRU6k8gtAD/DMGMwTVFP0YiY+nGQ/d0S3VB0N1o4+f1OouKNpV2JFZEH?=
 =?us-ascii?Q?0HOmkR+qQuABedhMjUG0Df59JZPLkb+9fGFlbp+Cm2QYNpQ/IMy13nZr3BGB?=
 =?us-ascii?Q?H/iWNw9KkwtZtRv2OaYVGXWUOcu1b5ZWRwxxHG6HX1SCVBffJEpPYwW8YBTW?=
 =?us-ascii?Q?1j4VwCDICLG377IgmzfJN9lcKyyPoud3s8yaOj+97jpf+aDgUa/dJs9gZOHW?=
 =?us-ascii?Q?U8/8EIV6j+rE3efjtI4qW/aQFVcmAeEnsjLRploQCihClIjLAAdTsCsXLNuB?=
 =?us-ascii?Q?gJglHWHpVb/aJ5Jp/zrZor6/QNk55MvGgPiv2eg/7oG9UEjAg4vBJDfq3/7a?=
 =?us-ascii?Q?Sdf89mNMYvljUPgg03Eh/dA7z/p7RIAi/+4RNnxtbVT7UB4vEjEncQ5i7gQv?=
 =?us-ascii?Q?ISANeHc6Cu8XhNLfmKamLZXEvDpZZBQkPx1PBoO51HJkzv0n5IL+nbU6xga2?=
 =?us-ascii?Q?qsh5FWuJihNbrUMC0XHlLPEr7AbEQzavyVBJWU2RZkRHwX7HVOUs3vOt9v0r?=
 =?us-ascii?Q?QrNwot0eCH42aRTfydh0EEruO7Mw9SzWtODWKMbaBk7qqoycqZ3hoP+vYxOc?=
 =?us-ascii?Q?/BpBY2SCoMUcRRoSUpSQMRdJA7qpsHd+v3jlisJNQRS6C68DDmKNvm8yUxLU?=
 =?us-ascii?Q?kJ+p2yStCTykV6IagcZawScOo9OFKHCE0ObgjfcorRHLFSkdeGTYksRP175S?=
 =?us-ascii?Q?X2/MWK7k5Xmdey0Lkmld8iBHZH5U3AF2PKWnP5+mIu6ri4uhJcbFz2QXiAgk?=
 =?us-ascii?Q?T+vUN4C1lnwgrnmWfPbM3GlARPpXrRGIZmSeBBfW9Cd5ss2v23EDT2px5SEr?=
 =?us-ascii?Q?kxCk8Lp59IPuL6JY+ecO9HUFYyVpLV8eH12GdjORB8lcZp5oNEEbGxlfFZKU?=
 =?us-ascii?Q?SvLo6LJ1/G3yu4aj55TgZ668f/bNZ6fXOo7bLPxmtrWpevrCFgmx9pCiqEZH?=
 =?us-ascii?Q?DwOZkXWEWytdR9rLnyXK+pgfhB9FQt6YuusiApT9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d45a939f-b825-4a9e-deac-08dcbcd0abfc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 02:19:20.7316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXGmtgVoUDGFpcOKja/hkwRXdLL81YZiQ6s0RAsK30JclxJsAHCooQXgAq3GIMpiQDSFY6XFwIXL2OMLQJDufg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
X-OriginatorOrg: intel.com

On Wed, Aug 14, 2024 at 04:00:00PM +0200, Krzysztof Kozlowski wrote:
> On 13/08/2024 18:12, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   033a4691702cdca3a613256b0623b8eeacb4985e
> > commit: 0dcc203956537696e6f936eef886fde70e049f54 [3898/4224] arm64: dts: sprd: rename SDHCI and fuel gauge nodes to match bindings
> > config: arm64-randconfig-053-20240813 (https://download.01.org/0day-ci/archive/20240814/202408140049.pjQHYO6B-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 14.1.0
> > dtschema version: 2024.6.dev10+ge5d88ac
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408140049.pjQHYO6B-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202408140049.pjQHYO6B-lkp@intel.com/
> > 
> > dtcheck warnings: (new ones prefixed by >>)
> >    arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-apb@70000000: $nodename:0: 'ap-apb@70000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
> >    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> >    arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-ahb: $nodename:0: 'ap-ahb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
> >    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> >    arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: aon: $nodename:0: 'aon' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
> >    	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> >    arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0: failed to match any schema with compatible: ['sprd,sc2731']
> >    arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/led-controller@200: failed to match any schema with compatible: ['sprd,sc2731-bltc']
> >    arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/rtc@280: failed to match any schema with compatible: ['sprd,sc2731-rtc']
> >    arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0/efuse@380: failed to match any schema with compatible: ['sprd,sc2731-efuse']
> >>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00: 'battery-detect-gpios' is a required property
> >    	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
> >>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00: 'sprd,calib-resistance-micro-ohms' is a required property
> >    	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
> >>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00: 'bat-detect-gpio', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
> >    	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
> 
> These look like false positives. The commit only renamed the nodes, so
> all the warnings were there before, I think.

thanks for the info, we will avoid reporting similar problems on this
commit in future.

> 
> Best regards,
> Krzysztof
> 
> 
