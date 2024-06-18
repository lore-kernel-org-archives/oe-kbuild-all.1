Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2632BE56A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 02:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718677554; cv=fail; b=Ppjk7is8I5Vv2RtM76UAFBd1GEJygar7+zSGZNFvG1wWFKiuc/UA+M68tHQKmYQQAaCtBH5732fg09/C7lIx2Oio3t2EG0oCgGClnvKsJLf4lcaokVtCNjpQHz7U+5axR5ug5Dd7x3ZquAlIfBDjdrF17bp33QFK+pDRTd6qfMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718677554; c=relaxed/simple;
	bh=5EQZaQyO+EKxbs/mMX6uNOzFXrjK//D1ryLEuV4YyaQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Zg5UIJNYC+2kpU5MJUmJ6R6dBvGZ+8FO+Qy4K+gcVSzO1nvVpl+eZ/76vAvQHSacWEA/YpM9fIFRD9wc2vTLFFYjqW5PJjl3g7BqoBpFU1r9AguB8L+1xtgFaN914F8W4EGP4Qxy30mlQ3fa+GrWPowYvuSDkbwblUnHWEH9TuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2c1l7oR; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2c1l7oR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718677552; x=1750213552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5EQZaQyO+EKxbs/mMX6uNOzFXrjK//D1ryLEuV4YyaQ=;
  b=h2c1l7oRG5dhgXFc+XcV0sfTZdJTMFFx7K3X2L60bM4/Vn0P3ttY957S
   a7Qfs18Xb+Lye+0F/yFAWb9Jps+Qhgs5BDrxyycpyco6cBksXzFZ0nHqE
   tV+15atTl3FgFIvw9WndqaASP8mB7V+V150UWHyUcGOern12z9m/bWrgm
   2LxqbDwXpaxRQRy0wINS2/BNiZuFzjd61EtcQr+REo/itH1b9UlgdR9IL
   2k3ZUjc7qddNUy3HVMXxXvpzHkwc/gQkYvX1Te6IMY0jt1DFQhnfefMVW
   azreZnkHIZjFpwGBzbGoNhIsd/7/pXSwv2Elkmh7JRyj4cGLhJSSUSIBz
   w==;
X-CSE-ConnectionGUID: k+vbr+IFQZuIsyrJTCG6WA==
X-CSE-MsgGUID: nMBkDzwtSoCV9lcMLB/qMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26161960"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="26161960"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 19:25:52 -0700
X-CSE-ConnectionGUID: h2WPbgfBRd6dzF1cwusB5g==
X-CSE-MsgGUID: rwnqtUwbTxqS/zzs60LhZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="46334957"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Jun 2024 19:25:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 19:25:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 19:25:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 19:25:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 19:25:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gj9yr/u0TfCihxZuYcWFZScKqq22jsLLrdNqksb864iZ4+5PaWod24EumNdwHurC16zmmAfITF+8rEtqybVtN8o4IZxVYDHw1Qf0sHu6H6XVF57MAlMl+NKdu+RTpGPzDOykUtYzJY+d0yIq8pOIQRchTG0lr8+hEPLWvXgdG9zNLPqMK7Fixp1kBAUGLUmfVIG/w4RATnDNsoFNUMtzuEeMVrXOTECXdSB2yP2KGXHiFCdBTEPh7gv970qpbb9QdKpM7qnaGMiljDZzw5BC+ljFD/b5FqnbSguD8/OXbpQo7UfE0hrzWsV4txQCNYfHSyH1YEOcAtD0kqGbWPNN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg06g7nBOVMcG6A4UTSfnaBEJfpXtmTMEUfO9MgA4Rg=;
 b=RBhw+jGjwlHwcj37ZLZGWlx/ZTl1ZlQH236CPpcSoG/iG+dEQyLMIAqMVkngK7H7z1dhb4oqjOmNaadvDPs0gyIj4zCDUdZ4qVa1M17C8Vk4XBSavWV22m0YWBbSrP5yNfhMAS+jmKy4r14uT6NHiUYc6j5uvB/RrND2aJfV7lEyjpkSRZc5pPpHB6ucTHFqbO8VM1dl07kHNfFxyFLXCEcUYp1WSMFIww9pJOhHTUU2WVDSwZpOoIJQuTs4xpBvQV5kpsJ4fBa2WNF2IRs3+YRf0HxoRDzrSm4sNvuGw3XRFI87Im3htqp/dQFUokxJSo5hZtWj7JusHtgaf+eSoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 SJ2PR11MB7427.namprd11.prod.outlook.com (2603:10b6:a03:4c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 02:25:48 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 02:25:48 +0000
Date: Tue, 18 Jun 2024 10:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>, <vigneshr@ti.com>, <nm@ti.com>, "Udit
 Kumar" <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 150/150]
 drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c: img_errors.h
 is included more than once.
Message-ID: <ZnDwI7+gPCfUMSa9@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|SJ2PR11MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab05530-b9bb-41da-f748-08dc8f3df720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m1H/WExmOuRbhh9fEL3rXMYz6OjXzZlQUvvKQChaTiqOrPzs8gtUJFqbzC/e?=
 =?us-ascii?Q?wDJtKaOPh0R8T+YtgGObhhaqmrJSR2E+laJ5QvwDZv6f7b7jKOiUhFhPSOxV?=
 =?us-ascii?Q?WnFiOQkDXAf/1LCGB5PzwQKcndW8DX6AVU2qfNiDByNq8CcsBW5Cu1r8KwkM?=
 =?us-ascii?Q?utmp9ZRG7gtaeAwKzXIjZmDGlxnjsGxrqjgs+WvOjgVww9BKwxDt1kScboTT?=
 =?us-ascii?Q?vwwOw9kvEJ4eHL01WPgGexgH9orfRGsb9DxzMcfR6D994BW4VHlFrCwCMchp?=
 =?us-ascii?Q?RiGMTgSoA6NBRA4cw81eC7Gubk/ZB63XEwh7JPMz61HDXXN/JhtKXuUk6nWX?=
 =?us-ascii?Q?ocSd89FNFHho1dnX7Ez7SJsCMtI3thA+bz+uw0MkiENRplcNEIPRtLQa+uOl?=
 =?us-ascii?Q?z5nrqbfXcy4oEV4nghjoPmwRfd2jWsgubZpu6o+Pbim8EqcIMKN65nSJjGDi?=
 =?us-ascii?Q?Ui90WC9R0FR/4V5a65uM2ZrOH9Hl7a8/u2w9GpKH9q2AdFBaUzDkDEq7zhyp?=
 =?us-ascii?Q?t7j28vltESMRFzE2FVCGWcjYDkt/25Mja6t68zqqmk5XtfiRqzbtu1p6f+3g?=
 =?us-ascii?Q?SRzqjLzAo92swzTBo8aRxk2Pr4dUtfrBssNtWwiU8Sg+HwffYHUYH1Y6zfXz?=
 =?us-ascii?Q?E8EccYfYoMiob1VzK2+70EBMxaGP09r0x9RK3k/mdASYso4jmnnxHAUwj9p8?=
 =?us-ascii?Q?6CBmH2UQSIZy/uxPU8a2YMG1f+3htJQyx/A/ExjeO7KNAa4Fq1qkcYlxE34F?=
 =?us-ascii?Q?9h77Md2ok7luSSMufbtFQrnBP9MRmTfoIi75ISa9gynyvAOrcx7TqQt6NnV+?=
 =?us-ascii?Q?i3WA1R79rLByDszMmaTNF4sY06hrvT2KzWJ3UvRMAoZm20laTPj108zLuNbe?=
 =?us-ascii?Q?zPWMcVyj0FmgVyNxj1sGpKCFMlUWprAHF8UjOie02tYzaRw00jO+4nGAca5d?=
 =?us-ascii?Q?LO7iYkhTNtGcd8H3eDXPRzyNOlvQolatdTCGet4W0T9SxPbtANRMoV26o17z?=
 =?us-ascii?Q?V2ZVbzG9uwsz1ikyLBZNtzJTMeM6CR1zmxANSxzTef+YoQcnJM7vfQYldokB?=
 =?us-ascii?Q?d4VY2dtHp9/JDQK3pliwlnopzNzDBPSWUNJL2Oq2aH5XXOfOT9tqmzZpTKpb?=
 =?us-ascii?Q?rwsfVj1z0aXO8pZNa6nWQpciIY03DnFAzE+09+k8c3E/oMJCZpl28G6VWZxU?=
 =?us-ascii?Q?43P/9uY37qmnm/1snDsAxG47xq0uMsXpJEsVn7R+mhUFViAuM70kVCxtvJVQ?=
 =?us-ascii?Q?Me3MxgHeaNZ1Py8oVBX0ITHD5NY5ogSnxMljZZsL6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ViE+GfvdmnW3DSCMtEhhSCQgJQ7bBVwcReiJGYVzw7Zh/aVNnQGXPbqwS74?=
 =?us-ascii?Q?zkI9AsLnZg2gmqFIcY6Wyjny6QPz5x6pbW1DbivkpJV5P9L8lnx3+Ov82vWb?=
 =?us-ascii?Q?zt3BIVOgVWqglRfhpSwPPgek6uQSQ3ArhnIDyQ2R7b41kuS205W+419eaUco?=
 =?us-ascii?Q?HXRq9Ki1JevbFSpVldMOedJe9gJkAPDGrzdZAMzSfSuPMaU+fu+AleVCjPZQ?=
 =?us-ascii?Q?Ipms1JL+vQCu6l1/HKwrDQ0M5FpOtTZv1h9tRw57I+7fTXWlNb/9fvzeuGkD?=
 =?us-ascii?Q?5l84/TnLD2YYKvq+Q2Mx/7RIijY+tBEYnATHuqCBsqZ3LBZyn+DC/m1iqYtx?=
 =?us-ascii?Q?AUitA+YefhO9frDqzMlR2z4AFYVResoMQrx8sPVU+6vfgH7AA6wyJ4ss6tNn?=
 =?us-ascii?Q?Z8Mh020mZhfSf+aYZvLyY/bagPYWnL0xwySKeRxJ+n9KyoZg6wANrzLHCa4X?=
 =?us-ascii?Q?iJcZl0NlhtUNmA6/ZRV/ka6aEbvT6MkyW4r46/PK6h9kcKvN8FT1H5s7dGFB?=
 =?us-ascii?Q?uEgFN5EbtKCiOP6KOzQfuuIUjtjs9Td0QiSashXHP9B+n1aIQ21LcAcfEsad?=
 =?us-ascii?Q?4OwG8d6D3LauemWexerm89EGOlgBdZF+MaRS8Q8XjNK0xzssr3H+K0pWy3Aj?=
 =?us-ascii?Q?F7fai/Ev5hBP3gQiMlipT7X3UYyhbgsfyWHCcI3gNv4+Uc14SepNkX6JEhwA?=
 =?us-ascii?Q?uBpmVM+moMPi2UUiQwOQuMJzsTHNmXvTvljERDN+iWneG7Xvfzbs6+dYmain?=
 =?us-ascii?Q?+jad/UL8xgBidJKu0Vm+qGA4joM4M70YsbA3YeQlDY+e8HmRVFimUy7aMVMd?=
 =?us-ascii?Q?WlXEO5dDPXLRST7y0ae9SR6JXOv21sDvVQXI6g0XJ2HWpz2u3Ybfel0M3kk8?=
 =?us-ascii?Q?UCdp2g5EMEvnAI8MktAsN4jmtwKhGmBfMpcbKf/ixrRVL+IhCTEk5YURToxv?=
 =?us-ascii?Q?JGMNZNUVIltq8Huj5abT2AUyjH1OZTTqSLCTpR9xK3j6AWdDTwxkRXnum2sO?=
 =?us-ascii?Q?eyhz8tQpFFeV4pEFrHQ7WKGn4DrKZ5RWLcM0h5q5Ptlj/33eTQ+EAvoActeL?=
 =?us-ascii?Q?6fsTwSLknkC2eBGbvKdc8zyM4+U/traEw0f57jZllaSI6odwgt+uHavVUseK?=
 =?us-ascii?Q?9uuakZpuuWb/YzlneJRX2bAAS6JfbSXj4oviQkfmgBK5dSCe1bCFULsLd947?=
 =?us-ascii?Q?q715SBs2cuHP+0nAAVtUuByncg91Tw2vgUxd5JqXd3poKHlpF3QjzWFI/0AP?=
 =?us-ascii?Q?O7BPG6ryuaN+5wG1PC1ct1V08HyDOZ3XHH17PknU7iMRn9cBvtlOok7bxRm/?=
 =?us-ascii?Q?PSvQxNgSexqII6j1neJyD/VwwMG+2QGNr+CMIp0Ts92r6mrY1JlKcq9KioTh?=
 =?us-ascii?Q?3ykKilZ8fuVc/77IU8zbwqpO2IPKDFky8gNEjLhhhculfKr2Nk4zK3rgzAb9?=
 =?us-ascii?Q?YWLPek4MGW0iS3wBQMmXSlRWceF9pd2LRGyEwoHT7kz3hyXY7JSYitwb0cA8?=
 =?us-ascii?Q?8BGA/k3cNhxLn+8Ha2xjae6o+hRGymS5WvjhTH28K88tNIghinasPEAH04yb?=
 =?us-ascii?Q?9ik/VWbR4+UZgzBZ6Y7x2/bdHNcAzjfPzSR4OBK0bHinbNfzQ7lJ7qEd/PyZ?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab05530-b9bb-41da-f748-08dc8f3df720
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 02:25:48.4720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gNG8j3BKQMraSwMdfF9szis6RE4n2Z9IuMzhT2haKQeSwKJJahqJt6yI4LQ3Cxlc4dfkz6vmZUV99BfaXM7Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7427
X-OriginatorOrg: intel.com

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   28ca41014f923e6e0e314492899b7cda49439c39
commit: 882d9360984568792cc0fd52aee488411771f76d [150/150] media: imagination: Clean Up Imagination Directory
:::::: branch date: 15 hours ago
:::::: commit date: 19 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406180732.3nDlFb73-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c: img_errors.h is included more than once.

vim +24 drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c

    20	
    21	#include "fw_headers/coreflags.h"
    22	#include "fw_headers/topazscfwif.h"
    23	#include "header_gen.h"
  > 24	#include "img_errors.h"
    25	#include "img_mem_man.h"
    26	#include "lst.h"
    27	#include "reg_headers/topaz_coreext_regs.h"
    28	#include "reg_headers/topazhp_core_regs.h"
    29	#include "reg_headers/topaz_vlc_regs.h"
    30	#include "reg_headers/topaz_db_regs.h"
    31	#include "topaz_color_formats.h"
    32	#include "topaz_device.h"
    33	#include "topaz_api.h"
    34	#include "topaz_api_utils.h"
    35	#include "topazmmu.h"
    36	#include "vxe_public_regdefs.h"
  > 37	#include "img_errors.h"
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

