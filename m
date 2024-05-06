Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224734F213
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 07:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714979532; cv=fail; b=XyLcxUaTF2kNnPOV9Qukie1HgnF6Zw53tvzy6gowohZVSDzrh7aLpKWA1Ir/dpw2eKaSrMmn4oIBETPgZ4z29pmJQUo74BglmDoh5WlBct3n7wyZF1SlRQ3S6meovujKeNverEzMjhv9dWIMJR3d51GHb79OidzJ0tgQBXqGEnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714979532; c=relaxed/simple;
	bh=MZpx8RPi6uhfMQDkJDmInulYcWQqTI+X8Jc3gdk4nE4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=emiAJSLsS2n6oABZX81eaLqOC5MQafRiQ8gejhe+oDkdwd7ij/r/ILcuolYzvCecX3cAJl5JaAearZpKpM1hdGVB/HGe4YffBR8Whcdq6p9KCIxbaYLqJrjUwT3bvFfHuGLtsGTYXD+eX+GU2E8Zrbbhp5UHwt5w5JEIMQcdj/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUvMP0Dz; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUvMP0Dz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714979531; x=1746515531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZpx8RPi6uhfMQDkJDmInulYcWQqTI+X8Jc3gdk4nE4=;
  b=ZUvMP0DzFoKFT6JbpJjUArZm7OpwVmxON3NMwROw71oG8Na3FnnXJOpp
   6qk3GXp8koN+1sRLzC1ky48qOfn8d94IixP/xUe3kb1QaFnUGrCXrVEA4
   6YyKkHCKhZtwAZ8cV56YK/g75U2XwjBYcLLrUAlJYJUnYcXiFJrAXys9B
   GUdiUtnUytsyzVZfWJi++1wapO2nveSTJDWy2qdFozF4cHikcQmHuXVCp
   x4Ri0TgLxTK+2RKmBJnxwTb4vr6kQE9S0oIPwGD7a5fdAvDq/LFEc1I0y
   PYO5GwdzhhFS6u0H9ExVHjn7RxwZfE0Sdxs1JxHTjIAf/VQhUbjO+Xqa7
   w==;
X-CSE-ConnectionGUID: mqYXWghdTZKxTZa1CynyAg==
X-CSE-MsgGUID: duW3TT7JTwuHiv5FfbwrQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="13656517"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="13656517"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 00:12:08 -0700
X-CSE-ConnectionGUID: ULONylLRQdOrCNuKSTjUYQ==
X-CSE-MsgGUID: 2yTccwc9Slya2M0TYOgWZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="51259481"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 May 2024 00:12:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:12:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:12:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 00:12:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 00:12:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGrF69cEWbeIICOo4gjf++00L7gdGHeI9hIUkbtwO/Xi+y/AL6oMnFd8yxqV/Rp+3Q6+K153siQBWhUclGd+V3NPOMJnmuh7pBvS8pRYoEnYhUGIB0OaqpEqB3PwdUOjh5XKD8ohmlovBMqbKCLZBayUp18yxXcJH72ZXHHq4tB10fpE9U0o89zRezoObjGeiWbA01eVtF2ND+hmTgXFIoXHr3Y7zm/cGYx0LLZLW8TTMadfMTTeQhu8sErDqmpBCskddqPtYx8wvxAo3c4zK6+LGNysup4SiLLe17JPr9G7axU8KXBrAgL6I/HuGC33gmmWPSG5Mtle5IyCZ9wZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqVmyZvh5dCV9pTGrF1EELn5SD93YqPFYHaF8UDP/yU=;
 b=TI4Wi/kNbHxbsVYr4JEQSDuydLXb3d/KW/9qA7WXK6DuLftPbUqeGS4gCahETZUHx4euSfjPAVRO5W72m8QbhnFpa5x5++9qqRCeu9L60DdrPaU+Ko7RaOz3HFyQL73F0U5taPimrG7UuwdvZU6ila7ivlCtDaPg9A7M1mBDzkJT6Log9MtKe8jQvjKm6wCYIEmTAFNiNcIPXec2oap5JAI7P726BXsYsO1tIT32JfIUN9aDTPgzTgQA8wubv/LiyddWN8G9DA38xzBUMJirAcwjXtWgOaiywTjro8+LTFRGpY0RvVmi0aS4eyoFG7i1n3caVUv+pyxj2rVRwSyY1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SJ2PR11MB8515.namprd11.prod.outlook.com (2603:10b6:a03:568::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 07:11:59 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 07:11:59 +0000
Date: Mon, 6 May 2024 15:11:55 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:5.15-2.2.x-imx 212/29910] sound/soc/fsl/fsl_sai.c:
 linux/pm_qos.h is included more than once.
Message-ID: <202404270027.fnfuE6yd-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SJ2PR11MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: c20ad945-7472-4ca4-0509-08dc6d9bd209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xP2U32ipRViDiTHSQREi2wJPjkc8h/4KNDAT+baihUdWuu6nZssuuY/CFR2u?=
 =?us-ascii?Q?0RkC7aDT9+fjiWEauTf0luVJwYfvVoXlVRwjk7Tsk8Qtgy2aikTubBwSQBKx?=
 =?us-ascii?Q?fyOyx3W/78pH224jrOmKoYfKeqSoMwKFv/9HQKzglaChnXPCXQUHgMD52Vwm?=
 =?us-ascii?Q?fCgrpWxIzrkIotatdIdkyY6Y3otfEQ4FVrFt5BaUBIbCieIgtFjRsfv/Watf?=
 =?us-ascii?Q?QztmjYGQGRnLOqyXDTZG8bkill4lur6HSjqm/ARgGW10BQEJMTd7bLBtyMLU?=
 =?us-ascii?Q?dShRxtMwLeKd3iL3H2PvGevTg30f8Mxzr9DoYS2MbZO03XCVvAHP0jmJ1Aaz?=
 =?us-ascii?Q?xifn3J8m2uxMhcmKyyIyuuZJo5MtL1xip5NmioCJrRYEiyYjhuc9eCpbXj52?=
 =?us-ascii?Q?ksouc5n8+IiRnZciJqxu+1Vatkfn+cThPfgQD04puc7NkUUuA+kkDEPw3FUl?=
 =?us-ascii?Q?cr6Hnw+5h7zoF+Dz2hbAHQ6+tdvNOOvN0DlbM1dNj57AegUxnb0EuFkfueLE?=
 =?us-ascii?Q?X/z69nsMWV48/2+cDWb89i1JkaqqWcfI/C/BwI+O5VUjwF8gDu4Eb4A9QSmr?=
 =?us-ascii?Q?vKWUUW1wHArh5HCW0H/IUDAe8I7OTXy22LpCcwbRu8JSQtTI1J4LtyitN+uM?=
 =?us-ascii?Q?2QHlFz6zM4BN1/QcK2XvjxA90/JYQJm7ARX67MCbferLnZ1usunHSfvEGOGK?=
 =?us-ascii?Q?2KHC0ym5FgCJFqAo6JIgDMydtOE1uzj47vINSJON+9oCw1TuBcI2Bf9md++o?=
 =?us-ascii?Q?mHqpnKevOfWVlWQ/SNPs9y3JxXQCQ7gMP8b+3jGH9YSmoUMJ3B7mJd7GAb8I?=
 =?us-ascii?Q?IOoMF21PEZ/QZss655xNJiRkFRQLpdA4QNXZLSSCxv/eUydPhYi5wOjH4YVZ?=
 =?us-ascii?Q?yvFZUhgi/tYrAd4staFalZ9+8WkzlayJxFCV+BTnQP4XX6CWKXcgrPhXLGNQ?=
 =?us-ascii?Q?J7Q9qJPJARpP1Wv2p0eNmtce68hx9aPLrebHRMAfpQZfWTAIWPlVnAZ64fAZ?=
 =?us-ascii?Q?msHFy8Ts2SdM/Lqx055M30/nEStM7tWaQkLU0Lmg6pGBn2LK/6YBauNPv13y?=
 =?us-ascii?Q?H1XsoCFJRBuelKzIeIynXwPefMiO6RyAtIC1zN0t7k3r50lsfDStmsYM9uvj?=
 =?us-ascii?Q?6pdlHCPKhxtHXf8L9gAXon0RedeILlhq2InPaGD+fdRHY+ERBjk4OaWwqv55?=
 =?us-ascii?Q?ACxAjFig69PvA5Um0qcTEnOTLCcon/Jwax6sVixz2EcqnptKqcSH1K61VZo?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zVN7NTEFV/Lxq1LAP29JCvIYhZpHP4nhIKWhFQOEZ8LkRiZEpETjdjeva4i0?=
 =?us-ascii?Q?0Z597tBgJVEf3IIZ4lmggk1TJQTVexIUYA92AX0vqWbfHdxsUvBkl6oKiDUz?=
 =?us-ascii?Q?k0zLmfX/+azfAR8iQoyCsQ8vXGoWxks1LVu84ku/XgSOywxoyCMJrQqaWeGC?=
 =?us-ascii?Q?dMI7s85IfwD1cGHuAXu3PrFgIdX4s9CD47dnty17f6KARlvq5E6tEbY9L6fr?=
 =?us-ascii?Q?sBQxxdK01CFz3pci2WQLBYIdyTAqMH05bwZhQnFAyToY87o5PSuzkFJk7xmt?=
 =?us-ascii?Q?SvurIS4i3E4ksKq4mw5MZp/BBWTBUerteCm6VtBv4snimTEFPq4Y1H8wZ5wh?=
 =?us-ascii?Q?2GuT88jrGiS8pi9Gzawi5QXVEETNlMKBpSs3F/pClamC4wDt+DSGdNibjaXl?=
 =?us-ascii?Q?IqSbr9PMolR0gPVzs/EX8QgM/Vt9krGwrbTada5NXbkcdN6I55o2OmSkxzeF?=
 =?us-ascii?Q?rl/cdFXyLcB37D0RRucwgsXfm55WTMqJuNgjtq+/i7TYS4/wBiZt8m40bo2A?=
 =?us-ascii?Q?p/2HbXnz0PFOpHBlSppF/RjbrOK6ucVIIEgbZ1tDgo0RPNBiFWcG6EypmBHv?=
 =?us-ascii?Q?KRGQO2+RDv2KLzLb/PCqNKDacHQPkKXuW3UY7yoxHY54WN/Ee5MpFAXYDMGk?=
 =?us-ascii?Q?j0N9dOmID8+KuqU5xYM+MXvd1e+BEaVJw8xrpu8HwicBLi8MZXY2a923hlJV?=
 =?us-ascii?Q?i1VGc3QlRPNkYDkPRit+h4fb1olTkHbB1NU7N/mq2GwM4i45mU5s2istrbKk?=
 =?us-ascii?Q?x3S3gAuYF7Amu6TJwjZNS9jaUXS9Ooc5cYpHBVRI7fZmFEyYJgoc1qj1jsXz?=
 =?us-ascii?Q?dTzNqB3cGgArxpuVakmKvsHba3Hijwz8HQA29L+THrmDxZ3P0oJ0kHwkWj7Q?=
 =?us-ascii?Q?sLk4NCf8sUu8unAAq1kM61e8jpQ2/bNZQUUx1AuLWU0JgoNDWIvJdTjDDzba?=
 =?us-ascii?Q?G/lTWDW7xZgvNL4oS7l7IlRLy/CaQ+4NFp8uaVX8CCrM7UbGL3ZPp76+emUf?=
 =?us-ascii?Q?uNPuoy+D1l+nH63kCmbFFbjS0O5yMb/4h+95M5eQtfPxTxt0i9mVTNlU5Y3O?=
 =?us-ascii?Q?LPVGiIVaHAj5Wmj4r1mLqJ/AEUpDmpZVRIEkEA2IO14+hDHcZeP29aQKJRF3?=
 =?us-ascii?Q?lyrdqgZthZlfATCaxM3WBQZHr4jYE+0EMSG2nnEg5RVD77WPmmwQ3irKhwG8?=
 =?us-ascii?Q?RVictyw1J+WVoMLIHFu/TtGvWcH5ExOjZySDtFMLORfzX/UDslryEar6A1vr?=
 =?us-ascii?Q?dxPlCpmfD7tGh5mV855vXmP7deKy5U5D0hF7Q4gj08RhFHqv29ezXzhHsgXN?=
 =?us-ascii?Q?yhWFjEDqTs72WRz2oR63dtjuj9FwR8zbtJxqK2/13IvIxzFXuq9pERmMOxfc?=
 =?us-ascii?Q?Z8JuM6Us5shH48K15hgIn5C99cVG/3rRdAc9+VYSvq+WyGEidme60nZwnDUK?=
 =?us-ascii?Q?PWYiatDcPmlRqQddhUIyLMjwn7lfHgkU7gqjaYJas9JZasCVquPduWADMBYd?=
 =?us-ascii?Q?uhxZARaaRinB7S9vE3lJVmy+vSDqGKYv20aoBqj/3aRRykvKKzxM1dbEFwcm?=
 =?us-ascii?Q?xUmVnLKKgSFELcy9RJ3FA3scC7uRJN3qBIC0qn5P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c20ad945-7472-4ca4-0509-08dc6d9bd209
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 07:11:59.1827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EU4B6puqRbvP0V+E6rhmv1X9/jmRbrp07BY3c/qZlkCTSRpUpbFSDgj2T0CR5tZHwCLbTFRffONaZ9V8xIqeow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8515
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   ebcdbe7ec49f9c3405ee4b89e7ec279e313026f3
commit: 2c3928cd87d3de8462ea7e547487a619c452e81b [212/29910] MLK-13574-2: ASoC: fsl_sai: refine driver for ip upgrade
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
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

