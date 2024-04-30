Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411D4171E60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714482772; cv=fail; b=XFL+Kuusd8dKwCb3FRg2bQcMSvbKFoC4EpZgYsJT40MgqpaiK/eWzDloa1AnTIiY6KTkS59GQhsECOpyFVa1OShSz85TW54DJE2s2IM2lUXDuVFrUQlvJFhjwWj7/LbOfk0zq+23ZNADo4RWxFT147D0LDaRUxPsKirnFlzRITU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714482772; c=relaxed/simple;
	bh=dN60Ekvtmarin5BdCY2smG46CXKX270unXKX3D2qVIE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hKWdKGmCyuk76ASerhlln5DNFQeHFHiao9leyLb3/z2Nmo1XHY08I+Km2NpkYjtLEi6S0vSYaeZMVtlgbAFr47DGrRFVCybk8Y0H7TMD5bf8FvUANgtXZDniLjrGc1LbtyUij6pYzoRf7OUIEEYe6MzHzyY9LwkgKIB4Sd5s3H0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G++59QO4; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G++59QO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714482771; x=1746018771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dN60Ekvtmarin5BdCY2smG46CXKX270unXKX3D2qVIE=;
  b=G++59QO4Y5xWxUuwRu3MbQZwGRlDuAs8F7dEC/11gtXpyJrFf9lErGCv
   3iMh/qMN0+fBPlMC9WEes0mLSlx7hlHYbdZUGSZSDbwwBqk65XNrl2Ryb
   HkKBjZwGfN0Sm6qWvDOBhrkEpP0/QnTzHpCKi8VY+kMNWCoSkIUtXHfeA
   +a8gqmFT1HynwQhQG6MSFe1dROxU98CWKoMs12o9aGnTWRZ/c9P3AQDnF
   6FqhQoBgIm/VkTQi5OPlD+sw9K+0u+mzOARrGo1ajdmRHK3PNyrKxzBcl
   5ug3WJ49HP8Vzk5hB07cTCeihl2T63h8QieT8G+j5M9/D5jItfCgZTxFo
   A==;
X-CSE-ConnectionGUID: k4311IFYQDiErbFJFsp2Gw==
X-CSE-MsgGUID: +dfQlCvITka1wxyehq6EXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10037608"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10037608"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 06:12:50 -0700
X-CSE-ConnectionGUID: EyN74XelR1mI2PXVogL9sA==
X-CSE-MsgGUID: A6PM8gEkTIGzKuVXoXj6aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="26324166"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Apr 2024 06:12:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 06:12:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 06:12:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 06:12:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFzTh2vMrIrUJ2lskHQI1ojACo63QVbbmyQ9dWwZlZmBs/3M2TXdpiE4+/j0GuZs4y4ISi0q5E3U3oeVeXDs4ZfIGDhUPPM8kgb+feB6K/GlaI+ITywU3BpE9FMqB94S9vQF6RfWS4dSXRnelEY+hazetfPajomrpCYpWykGy/A7p0Fo3yHkNhUWQlZW5TvjKnERA6XPQD5rdHmaZBOy2dZxNzLmgXCyFkrrKfDRjlq3SgXL5YQBBRqaWtKyWvSCZ3RlOAywl8EndY8VGyjUGUa13+qBnsqBGxVsU9jhq8LH1s3mO0bo7S7cMXZITmLCkt2XAdoJ2uAnavlUudgYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP/wEWY600xD1Ivc6ssx0qmj7hZNHH3M1oXZj3WyaoM=;
 b=GeeWsWqB6IxpYINF7B5TTvtI/SLsWjSlyqKExnMaU8bUWjJu24T5Kws0G5MnatXVC7X3ihfVpxOFn4Z5ZrAOb0ZqueFAxPeZCQb+1T4izOmSD4NLF0xUEBao/jXBbyhB0Ub+2kuBbnDdYf8rXS42QQ2shFsPQh42cZpyn7g/b8m8UcuBBa8V51fPCQOaS/Y+jDcPJsV0dPLEIQ6EovIeg2Y0sSj3Hp29oW5rjdJJJWzL9tiBrCZYkLXSozy5k8i69SZUYIhmLeIALKLSdTFXlQH+drKiXMdpiNOCdMh5o5p67KR7zCExZKzqyEG0CrQsZSTnpEB/+Fsmcrkp9YKo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 13:12:47 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::35d6:c016:dbf5:478e]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::35d6:c016:dbf5:478e%7]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 13:12:47 +0000
Date: Tue, 30 Apr 2024 21:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:5.15-2.2.x-imx 212/29910] sound/soc/fsl/fsl_sai.c:
 linux/pm_qos.h is included more than once.
Message-ID: <ZjDuSZSDUJmIi/Xs@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: a30f5dba-897a-40a4-f2c0-08dc69173ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?++CdUjg6OsbGB+3/NSH23cC0YqgoK0XewvOIeMPJEAYoHbnyW5fQyQ05AZhf?=
 =?us-ascii?Q?QZk5y/8mQBCdsHPvic0tmn9WV2eWpwI0avFnDq4F9KkABasxBFS/F2ihu2Gh?=
 =?us-ascii?Q?XaCxnBntCXSw4jlbnMAqusgB4FlJ46osK1Gv4sGbs9m4lqocGyFcXi0uD2QQ?=
 =?us-ascii?Q?N8I1yZCa+LndIP0B5UMbHoL9zxpXRbowbmgUwrGdvkuErzd3bskLujSihNqR?=
 =?us-ascii?Q?/2sFKwjHzUDcW+QWhHbcgYs3fAjtydwc9L/43YkgB7fuLwhlFYjlR8RWBAIS?=
 =?us-ascii?Q?kUx9gn4H9Hvr26SC9SXdjwiRcgMLyeNrEPPGmOOIzfLjPGc1DL45mfwgOYSn?=
 =?us-ascii?Q?gANiuB0KXlxs/OfZsJAEEYkC67Xnv4iS7ynG4RPTepVLSFsnM//8XdaDN9Ig?=
 =?us-ascii?Q?TQJmhLeBa7b4MJbkMFMBJla9d7wsptPDamkYMMa0fUAY9VKTJaKkGFcs8nxg?=
 =?us-ascii?Q?uHKqKnSgmzbNIIie1gtGoBtgH1YM/M2wB1NB1uWYTqMI9y2LtYqd7IbNeESN?=
 =?us-ascii?Q?2h7jZrFdpGpmf2FgMB/JzjuRdPhvV5ITBPM5UPn3RXA76FgIuVwMp2wE2CBv?=
 =?us-ascii?Q?/9I99wVeAm2rUUDUn3Av2u7gtaeEToE1X6RAqmOSP44EkJ8IWa+n48vgPxvN?=
 =?us-ascii?Q?zP3LHdc+nPwcw64nOTRMSW3g/DM5Dg6M+SZWWXi5Q6OoFReSP0B4XCZtoEWt?=
 =?us-ascii?Q?FRCCecPFs5b0Q14l5pGPNqLaLV6/U0CtDiJUym5vmFaQsONeU8c3HA+7sTFG?=
 =?us-ascii?Q?rb0yg41JEgMEmvHqktazuLtg7rd8R42OWL+R8Zl0FKqLe7VqQqTgd9E0kILt?=
 =?us-ascii?Q?XxAhO16cudeC9y2zsmjSz2PAyP7dHKCvLZd/Uf3nscA8Hhyg4AHLT2C4k9GX?=
 =?us-ascii?Q?nR8ADpkeTYP0pghoTzegMeW9lAUkb+ggP9e3XknaHxC6F44BjM2X3OkRivuF?=
 =?us-ascii?Q?MOfTk8nkpk633bJHCYSG9kGEGDiGhhXADD8xuYQhvTyaMzK751ZJQ8Qk1htz?=
 =?us-ascii?Q?D+v9IVwb8Jn/6IciinYfXPojYdpLz/gI66sqeKC0u/0P+TNE/qiptxrKaQVq?=
 =?us-ascii?Q?OZK4HqJeHg1WW5jCoKFVNU9fh9EquwQlX3LjdMkr8xgvNJPJV0fzaazC5oRe?=
 =?us-ascii?Q?GYqOXsFEtJL4Pg8OQ0jk1+isLOqolPXEkbol5hbYY/2xEM93It+PXbH2jGef?=
 =?us-ascii?Q?YwIHFA8IRvcIH6Pfe2ZIK5FVXbK98sjzOBjtIxjpdVBxFDtzURu2XvsYG/w?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ciPu1NyZpo+oCTaLOsNnLSTnaedfOEKlxbmxX3lWav9QJ7nCRFwtTfpk+bfI?=
 =?us-ascii?Q?exIUJFplYjlkLuncqQ9FsmJkIwpgaGhrnMV2UcGcmpD3E6EAHn/FM8JOGYU2?=
 =?us-ascii?Q?IihRxzoAzgAcCqGu5PXESbui4LG/nJRVuaaL+GmzuNruHkzpQ4qze+YCyrKe?=
 =?us-ascii?Q?D3Dhw2qj+xz9KbGy8mZqrbSJ1vbBQWmHcwiTksibBBtB4bpOGc1GuRpOhULn?=
 =?us-ascii?Q?aANhjK6m7S/RynlwEp7Z1mUGFuQ5i6J0yDF20jg+Tv9j64d03IZ+9V8VjpYi?=
 =?us-ascii?Q?Qlyuqc9+NFqMtGjG3VjzszNbNb5bpQvdV10ufETRJalVUnFOZOZLsSstFXWM?=
 =?us-ascii?Q?ejcx6RepFKFd1M+gpL5RhHCqqGXvhRBLb4djFUJIiphKGcPxz92BPfE9QK2i?=
 =?us-ascii?Q?B3V/A2vDpNScmKnjsNUd3RK4vxI1snGDi+1GMrww1gmwLdvys3/Fk1C3ivr4?=
 =?us-ascii?Q?fKXsjNq4AQ+91y1jH0gPEAdQ2uNvvoMQY7dGBU4yg25t0/+tWgk9UJm7gge8?=
 =?us-ascii?Q?INyU39JmQnhWlWhwr/ea7OtR+EXePPinU3LYKeXOyt1tGEMU/8pOeJz6ioRP?=
 =?us-ascii?Q?3gFDaagZxN5/ZsiBwH+oGLmaMsKiXZPrxadW+xI4EWLlltk/QWesfiJnLXRF?=
 =?us-ascii?Q?6IyqMld8+sAMwxM+UHeyaK4qZ6ZCMakDQfyyMWeWaIuUJTaroQpAJYPq+dM8?=
 =?us-ascii?Q?d9bpRrXBLssV9qlYbZxkvHtP1Kik+EE71DOyFr/8B8dqyuZFHWP8uxNGmioq?=
 =?us-ascii?Q?OoRa5LUa7PU3DDCZmcAbK4k2B6pUnYvKT6AUnypAII4ClXEfVW416dnIi34E?=
 =?us-ascii?Q?shbA95QzdeYadMDsxhFFwzky32dDDmE9XSud8q3Kjpyz2xdylt6RhY/g/iVj?=
 =?us-ascii?Q?gN7R949n4PymE9GGZWCEq1fQSmnPP121s9HHx0Vw9Hn4GD2SbLW9JOR3U+UX?=
 =?us-ascii?Q?MoQSt0ckd7Mb2Jr3cAXPf3PDpSZL7KvtVln2fPXgjWFGJuH3XXU7CkdxMEXe?=
 =?us-ascii?Q?sJ0ab54JA4Iv5Hn+kR1aUo5BucjCmhNGGVxFd52MpxMtlSuN6qQhBa1QeHAn?=
 =?us-ascii?Q?mwFs9XC7io0fXrnsvFRuhrQPNfJ2nLObnXQX5vfH9mBtzuBPth6u5NsxDg8/?=
 =?us-ascii?Q?cGFXfQ4vXOoDhEDJudDsd9i6Oq51VhPprn074UJ/gNeBAnr+potLD3LIcEll?=
 =?us-ascii?Q?je0ELEbkT9KF05rLx0fT9BPcblia6SqZdVBxhMEg4I1FztLlNXAx2B5LTdFX?=
 =?us-ascii?Q?Gxw/8xbBMOHAHlgW+BF9pkkN2rf4jw+AIC0pdv0rN5+/Wt6RCmmdckOSLiv6?=
 =?us-ascii?Q?tqNSG9lyUwjog6HcJ4Zy7BXutYiiZUnVbmDozV40J+y31DurfHLMeF+gSRvF?=
 =?us-ascii?Q?x+2pTfFYG4KL16qpCcf6XcE9p66vU3wa9cSKuAbtfpc/SP7CaicSWh0scEQg?=
 =?us-ascii?Q?QSc3i1yoinma08QI2HfQ2364lfBc5tqoehyFsuYMHfOTuPzZjLVu552fOd9S?=
 =?us-ascii?Q?Lt9vCRxoFbRH0ksAzIM9J9RMmDq+1DbaYd6ykR+1ZDds5UdMdbUQBlgQLSAI?=
 =?us-ascii?Q?8UgXT8ZJ8HUMr1ZBntq6q2UkqQl/4VX9fwc/FUXd37Quco234fwCrfpBMgJq?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a30f5dba-897a-40a4-f2c0-08dc69173ae9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 13:12:47.6080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsbuZph96ORo4rbdToj6eqqXo8+2z2rfu3CLtldiPh0CE6PNSLEgI7d7XDBWurSmfto7JKTpcm92Kqv9bE0fdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   ebcdbe7ec49f9c3405ee4b89e7ec279e313026f3
commit: 2c3928cd87d3de8462ea7e547487a619c452e81b [212/29910] MLK-13574-2: ASoC: fsl_sai: refine driver for ip upgrade
:::::: branch date: 2 days ago
:::::: commit date: 2 years, 6 months ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404270027.fnfuE6yd-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> sound/soc/fsl/fsl_sai.c: linux/pm_qos.h is included more than once.
>> sound/soc/fsl/fsl_sai.c: linux/pm_runtime.h is included more than once.
>> sound/soc/fsl/fsl_sai.c: linux/of_device.h is included more than once.

vim +14 sound/soc/fsl/fsl_sai.c

     6	
     7	#include <linux/clk.h>
     8	#include <linux/delay.h>
     9	#include <linux/dmaengine.h>
    10	#include <linux/module.h>
    11	#include <linux/of_device.h>
    12	#include <linux/of_address.h>
    13	#include <linux/of_device.h>
  > 14	#include <linux/pm_qos.h>
    15	#include <linux/pm_runtime.h>
    16	#include <linux/regmap.h>
    17	#include <linux/slab.h>
    18	#include <linux/time.h>
  > 19	#include <linux/pm_qos.h>
    20	#include <sound/core.h>
    21	#include <sound/dmaengine_pcm.h>
    22	#include <sound/pcm_params.h>
    23	#include <linux/mfd/syscon.h>
    24	#include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
    25	#include <linux/pm_runtime.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

