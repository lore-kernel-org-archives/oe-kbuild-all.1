Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429A0168DC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 02:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723169057; cv=fail; b=VU/xu7m6pTkWNbhgrLeWu4mOe6ZYA8BEi+UB4DJ03O2ATLk0vVq6NN1PPRxRmWruPE4bOW5HbkquRIB+7weFu1L9FtHC1yz8j4Zkbx91Sup9QLMDEdoiOWiP133tVl6m1+MFf51vDvp0A45vRyR17CuEcJbpPggZ+MRsJFQdgts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723169057; c=relaxed/simple;
	bh=gKqHBkMnUBv884z7sBXcZ739fvMaaa+1jMeXo4n0JYg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OxwFtAtDgNwNFyXRYf6GD2pjbTrWbOju7nNc5Ksp8+F45GYZbFuQKAVtEn8RGZujwmlRfA89ND2RNAp+yIq7B0Ag0HuhcX41BR+zq/GX91f3gFwxnF8/nDzi7wXVOYIr+NjObJuACjQWsMmQFpuDVNg5PuRlGseur0nCEpcDAf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHKwdWzm; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHKwdWzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723169056; x=1754705056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gKqHBkMnUBv884z7sBXcZ739fvMaaa+1jMeXo4n0JYg=;
  b=SHKwdWzmKTvTiZkMyXXptz0c4BrlNJVSwhggMiwppYYU0kD9bcnQ+WoB
   Uans0KgVBUG1kFwEYiLcvAlPSWQ/KlDe4cFq32luLumwnsk4nja0Vqd12
   cAIbUdWfZHbAhGmIVhLNiK9j5zjlZFW/XWZzr6IGeTP57MDC8JAohvOu0
   GpI94BrCeXfK3Tts+fE6KIBXBm+KP+kTB/1i/88opKEjMPYi722k/I17c
   AlPujU5FnpWZKRqL/PTG2/8ui9x35quCZVHSbrVW4pR2AnDndUYbIVxPD
   9JHSvWjtgjbi5qZTug2IoDKGVFgqAEvoNyOeMvDDN9BVm8TICK4bojEVg
   A==;
X-CSE-ConnectionGUID: fCsvT9rkTLS5VGLXFBJ3xw==
X-CSE-MsgGUID: 5VSnAd+XT5e7S0vJ7Brk0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25123738"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="25123738"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 19:04:15 -0700
X-CSE-ConnectionGUID: 2WKJr3+cQKOXdGwZwq4kyw==
X-CSE-MsgGUID: PuO35N1jTJmZniUWD6308Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="62256563"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Aug 2024 19:04:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 19:04:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 19:04:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 19:04:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 19:04:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAzwC9P+lihiBI2ifm0UM5rtJeSdEKsjPk+2ZHExsFrPJe65DNdSoJ0wUFdehsfMjyfRqcA1en8+4B6CP8rtOQRiI5rGhOetJ66Qb8Of2HsPodSMoBs+exHyUQUhF1ifekuTos62WEThvDifyoax//+OK+0hdlclMh2gc4UKnmYPDwjj8yv2526/diSo+rO9pIK5OzK7bnHNWFJvWJCPbz4QwHOqS3j1r6xKog+htmJh/TfKm42KyS3NCXifexiyzpIwAo2Wsw+l76NwbRCpQcUxGdDFvuue7ZswqIbzOuuQk/iYb3QOPMMr1DRG38shKFqKNEfe1K69b39Rh6Qxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU7qIGnGU6MRNdOFZX5rhknDAFCA+YDwShwvbdPhXuk=;
 b=BZorJ9bO8HnI2Ov12pBvLdWcvCvIwYDrR4GkKANen4FDQxQVHJL4gLzdr4vXCo6p3Ks+Rb9uqHjjxWqOS00Bb0VYynSqM94Y/HbYqNIDmzR29m0eIWGaBpIM1t5pYs02wXrUQT2Fon1H1SC0swJLiYzL67FH8kblQWWnOJXGT7F0D88k5/LdGWMWnivJHLRopm+MLEG0aNzdWFs51RFr/iFPe3oUN6fHM89ZndRUYKt8DIxoRMv03ElQlBOAQ7SP8g0mdSHKuXI3Z7Y6ysH/X+SiVitBuGbv8q0/B4ITXrsuF1L6Wp1Nif3RAUAo9SiC0c7gzkK1JDVwTFrUf8l/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 9 Aug
 2024 02:04:11 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.029; Fri, 9 Aug 2024
 02:04:11 +0000
Date: Fri, 9 Aug 2024 10:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, nanli2x <nanx.li@intel.com>
Subject: [acrn:pr/380 8853/19666] drivers/media/platform/intel/ipu6-acpi.c:
 linux/gpio.h is included more than once.
Message-ID: <ZrV5EvtFPef6jbXA@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA1PR11MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 2011eae4-7f29-4327-3709-08dcb8178f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ywUEWFDGo7NHPXFRxNy+P9FwBe/DsodZS+vsD+Kzm8FUhz15YGqM9ubdoR21?=
 =?us-ascii?Q?uTLbZFrNHomE2HgM0PKQydOzp5ngmWtxHSxK6uDGF/H5MnP9ZMXHRCzyhr5O?=
 =?us-ascii?Q?QGOWD73XDooxFqshd4i0pEk05I/LnkFho2my2GkOpSXwUli93ynf3jKcfivF?=
 =?us-ascii?Q?MYNasWkLxo1hu9xqFCCXzUnaAATKZSG3Lk+dAyL8slsOlriUobycRUCYlD4D?=
 =?us-ascii?Q?qj/3HtfHqfp2JFyEPiZUf3X/4eSttOwL1m6nNHnsl67jfar1Q/LuXIAXBURV?=
 =?us-ascii?Q?AtDfGriFhnAAYYYmxEMq4UTfZOhhjxUqL5H+XnqBGouHlbWfsgwPr2FQQIuk?=
 =?us-ascii?Q?eKYxb9UncstV5ePGz0A7pKiHc/g3UjYMpSylOUL0WjkkhEZWePOi5u0gjUFT?=
 =?us-ascii?Q?nN3tt92wT5obz4s+H95/5gt38wy8+9OfPTMcxBsW2Ht2vTrgcRzBei2mzXuw?=
 =?us-ascii?Q?01cUZBLg2ESRh/afxw2HAHJ9S3HixIqr2dGFE2ceiwvQbVv2kYKKEjZVNdiw?=
 =?us-ascii?Q?kzqaqakEJY4t8LpBtFHm0h8zV+cJ+B+7hTJoPJc6cXrWuwdIr1WFlskIPGwb?=
 =?us-ascii?Q?pvV8SGoHRT33ugZAnYlYNGkKv2NcBaRW0YbkVdqh+lvyWhX6I4gsCGffpyOC?=
 =?us-ascii?Q?JuG1RRs94Go488MtNeSAnrVX507g5LfSwDuHRhlVfRFRLX8y3McLeGFaCOYb?=
 =?us-ascii?Q?LzoZxOGhhj1/7dY443mRkcLIWtJ61/DxjFnoqgWTOhEaSHSaIIljGzqegC1V?=
 =?us-ascii?Q?E2R19VM7wxpe2dNccWPQupQuu/AfsrfXIBfyWS73AGBCGz5MAzJqBgLLXjOF?=
 =?us-ascii?Q?HiqrGKG13RbOvZC00i0GXanQ5hoBdazqwzrPUBHYqAP788xHBP9Z0uB+jbdo?=
 =?us-ascii?Q?qqfIbet9MlOn2w9VDaYh09U0i2vSKxUQrnwnDLzy8SevQCLHAwFNl4OC7Su3?=
 =?us-ascii?Q?O+dkRhm0eX17/vxu7bfduBZuqc5FD2HMLi+xelvQR02YLUjTUxInDPfk7u2u?=
 =?us-ascii?Q?THCjZ+bEey1PcT6sGifU/1igVryEgSaufg6IRLSsQW2klKlmqqEpo+TlAbzh?=
 =?us-ascii?Q?mmG6aS9nIgvEklbeLQHd3n2wZTw6Wxsp7YPG5pzs2ShpF6rvR+QLZ03K+o4o?=
 =?us-ascii?Q?QBRVNyR87RUnOm0FCbKAx1u9j3HCyhlXUCRG5jxhpjNwXH7ChMO2zQCkZ/Sg?=
 =?us-ascii?Q?WAHttM5g8Pjj8nrdWUgxGxZ9rNbGK2/3MkqAsyyYqhdw+7C+x3ERuO9Z8nIA?=
 =?us-ascii?Q?LEpiEPm51m4TRkHl04p3iTJLN+tbCfBTW52nK9mjMqwIF+vuA3g6s9KZDdoJ?=
 =?us-ascii?Q?8nc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uWgTDfe5VHJawhe/lURGvgjiteh4+T0nTlBCXJD+H/t4NgF7Wa7E3tjb5Dk2?=
 =?us-ascii?Q?x5K6wB6g1rlU/KFhcyY80kndl0oIRlYneKfCgJ1ojr5Zp29TVq8GKP1O1IP/?=
 =?us-ascii?Q?XJYhnB6zlCL3gbHBtpKJMqQhDFXxIN9AZQTRlAc4GIwZfIQ1pOclk+rVDYSF?=
 =?us-ascii?Q?VMCmryzf60/YfJa00xTE6G/M5tjztmjAGSlhSQaPMIMYA+w3PyabwMu6Jttc?=
 =?us-ascii?Q?c60829XsEtMZWvuQlhkcN6po31YfXRpt6LSVZ0g6KpgbWwBV1feKtSPFqF58?=
 =?us-ascii?Q?2H5BcnIZS6HZUUo+RF26uvJ37f62dl+8z80HAQaHsBQkcQ8U0PVSLUv+n74j?=
 =?us-ascii?Q?shDgDfiypjEFbISAg4BGzGrdpxWrnOGvLVUd4z1Bq3t2NQ6dI2I6R39WM4ym?=
 =?us-ascii?Q?YXsUXtCw8LYeSIoFgYd6uZHtY+mjMz0I1eKTNASHJkouvnz8FDwB0xH+UbCi?=
 =?us-ascii?Q?yX+9Au46OO4ADw4QaYvT7O4ANPTyxmbIT9nlapAZolrLmtC3qfrml5jvetb3?=
 =?us-ascii?Q?BgiED0giGGxJHNYoK8nCVaVk02zfjFHeI/nOij27YhjVY2EGDGWNd5PWFEWE?=
 =?us-ascii?Q?mU5biv5hzsTrzGMqTnVfkmpjcJxpwVttUT294T7gihASa8GKDfMR2zMUEhoN?=
 =?us-ascii?Q?d+G+U/EtQGtL5YHqVFCF6rLXxjENDarlTFZ/J/vgJslicP0dX90J88ORn7LZ?=
 =?us-ascii?Q?ykfaseFwCyik+3MjZ7MQibGkIk4mCpXMNax/I0v5iHttVXSiXbJBp23fVaf+?=
 =?us-ascii?Q?phCFkQGm7eSawZsZRyTF0ckXcHf0fSMNfJXCB6Q8PEuK9EYkq0eEMrrnWZZR?=
 =?us-ascii?Q?vmhjC3b+xj/8ZQinRT1z1M8SIAh9qAhYcIPrvQexPWvqhd7q4dJrGkzqxh5z?=
 =?us-ascii?Q?4N5tkYrJcmL+AGJeRGOYMPsA+j5+7NI+r8Hcn/DmyXNbmWFGOgUWFDbiUhlq?=
 =?us-ascii?Q?5KI3ENC//e3JvdOvmP3bPXioNt8Vu/+ufVYe/74ozP/1hmceH5r9Cx8WrfaO?=
 =?us-ascii?Q?vLZbWS9PEi0hoWBvGmN/wqc9Pz6k8PaNbfmTyg4JeDaKfRCPVdcnXO4gTUxV?=
 =?us-ascii?Q?A5BahiHTzl9OVVlIKJxd1pWHxEQoB5iXDB9JYG9jD6XM22fkq++UhQ65VY0r?=
 =?us-ascii?Q?gY1iC0JJhc3/zcj/E8n+4qevtq/ovs5OMZ/I8JUVvs0WctmsDjPgjjHXx3hF?=
 =?us-ascii?Q?F55MUwLG5ja9z03saT8b/ST4pvAOgrCUM2Kck2avPDlyP77mA6lv7WuYSRXU?=
 =?us-ascii?Q?pTITQdhpZuubQwSG4OnX3EL9s336QNq6Ts2RSla56BQI0wzOaFh1Qzx2Of2o?=
 =?us-ascii?Q?5aNRIfx0pXxnrVNoq0bTxfnzvrJd55qfnzW/WOcYcnN4/UH7pZzFoLRox7EM?=
 =?us-ascii?Q?8N+epC04CpeEnqdBDxTowL1ZTeDwvnVwW7bXs+mm3mMm7KsfLunjA10DGfR2?=
 =?us-ascii?Q?KbeH/n13Zvx7VY2aNHbmfh0aMkQBw/OshyvKdlr+tH+Lg4XzHg+w1S67n8l4?=
 =?us-ascii?Q?OzCvLRhk1ol0bQbXf6agLc+oqwP2EVLVlvSn5U3Qm8+XutniJbdOCo7v39I2?=
 =?us-ascii?Q?iYnrdcq5UDhmjuvU9i3KigFJRhxDNBm5X8zV/eHUAngQkhoIp8XIlmeG3Ml1?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2011eae4-7f29-4327-3709-08dcb8178f58
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 02:04:11.1161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zj5mlFlVXc0C35A8VpC6TRAY2G6YQ1h+P5ATfYjCt8LvRdAaruRBrRGlk7ZDQaTmQzZzW/YQmE4RNpnelJAj7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
X-OriginatorOrg: intel.com

tree:   https://github.com/projectacrn/acrn-kernel pr/380
head:   1cfb4ffc0c480ebec70ad4ba52d984cc5f65401e
commit: b2d9ba9588cef2ff54740e1a514eec22b8ec8e8d [8853/19666] add ipu driver for kernel 5.15
:::::: branch date: 11 hours ago
:::::: commit date: 2 years, 3 months ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408090835.lGcxVdQz-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   drivers/media/platform/intel/ipu6-acpi.c: linux/platform_device.h is included more than once.
>> drivers/media/platform/intel/ipu6-acpi.c: linux/gpio.h is included more than once.
>> drivers/media/platform/intel/ipu6-acpi.c: linux/clk.h is included more than once.

vim +19 drivers/media/platform/intel/ipu6-acpi.c

  > 19	#include <linux/gpio.h>
    20	#include <linux/i2c.h>
    21	#include <linux/module.h>
    22	#include <linux/slab.h>
    23	#include <linux/string.h>
    24	#include <linux/gpio/consumer.h>
    25	#include <linux/platform_device.h>
    26	#include <linux/regulator/consumer.h>
    27	#include <linux/regulator/driver.h>
    28	#include <linux/regulator/fixed.h>
    29	#include <linux/regulator/gpio-regulator.h>
    30	#include <linux/regulator/machine.h>
    31	#include <linux/list.h>
    32	#include <linux/platform_device.h>
    33	
    34	#include <linux/clk.h>
    35	#include <linux/clkdev.h>
  > 36	#include <linux/gpio.h>
    37	#include <linux/kernel.h>
    38	#include <linux/pci.h>
    39	#include <media/ipu-isys.h>
    40	#include "ipu.h"
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

