Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0C63A3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 02:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeFyyHND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702865027; x=1734401027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J47yIl4U4hmotXs7dQfoFz7DC0Hpa7NrFot5hf4Cz5U=;
  b=OeFyyHNDOuqAoyWBfD3JeeKjDMMJlfgkiYm/mknsVmJI1ZE8Xswjc86J
   l+849JuzBkm1F/usRKBu7TqAZRG56zyzODKVgRe0XFWRaBzlr14XHMCkd
   uMJpO7hA+DTPHWjwtXyEI1olrW8tYzPpEMEjfa0UXS97YvWKOcLKqIH2e
   JBH8Mgs7pNJmyTPRWraFpzN8CJX+AtshNRQIr9gUKDFfVi8J/MHIlqSUL
   K1vra+YBatJRrB7RxodoM1kn329IiUEpMER0OeLyARaw7Jvl7Y3yHTlze
   sJPYg5ntoybMz8IqtClttyPIZ3tiZ8xkpAsHTB42kqpZiAtPFCn9K7+yX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="14130564"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="14130564"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 18:03:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1106768319"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="1106768319"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Dec 2023 18:03:45 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 18:03:45 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 18:03:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 18:03:44 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 18:03:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9FmGkYGwGk5Rov60W7fY9GFJXvtAn7SRZR2/4dKIlSDyByQe0Bnmg8f7Svud4X1zoRAizaTMJY4762+lJHJtVUwRjGmsNmoOrJr6SRq3NXuChR1rfsAybMrc2pS0qrEHUA3rAM1+jt//9LchSQOYfgNiKGB+wpeSyj7YurUH5qsMS/jnbuz9eowwjUlKSdshvA8mm505Ik3q3/p9evdf3T37tTFtbgQY7kx+3zqRxJHj840ydXBEb17WW/QV5mwdMhKMsZ+4jTVQ08qsTOy6Ai7jDivpG98clUYvalt/koIq0PgroxQgaozFepwGlUAMGAbvcCzpYfaOGLTly/Z8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVsygG7830CI18n8gZ1BjWfVC7/+2h3a4RoDEJMTvZ0=;
 b=KOCvi8xAjvBKcoLAlxNx8Zz3iwyJPYr4UksOQlNVlf3vJSHPv3t4iJQ9ZYfP6A7niWXEzcQOLPVdBF3kTKj9sLSfICR94LzuVbhkiYH9UhCuPBYkFVgAjmhAUeLxvea2FBVAxUru45mAE9EfdDTYw47YhVRFc256AD57P9W72rb/o1jC+keMNW+sNx5xCHNKNCmZkrUMJPaxrwbGYUC50bY9Q+BTOpGrDKoAi/mBo7mpm+If/2Zbydxnxd+6fqhQT3yJ1/jwuQDwzxwnMtFx7rv7AxqGNSJXqpL0m3TIwNobdN3ILehtP3odt2ObQmV+FSxxcVbsVzQkc1fC2zkR4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 02:03:42 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7091.030; Mon, 18 Dec 2023
 02:03:42 +0000
Date: Mon, 18 Dec 2023 09:59:14 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [isilence:zc/rx-latest 24/31] io_uring/zc_rx.c: rsrc.h is included
 more than once.
Message-ID: <202312160620.pD7CYup5-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SA2PR11MB5051:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f345f0-7ecc-406b-85e1-08dbff6d8f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GyFR01QR7jdf6VkPaKGSbqVxuw81+Su50TrLJWhh9kvagDcuRvjCaICatLyxm0gTQSKpeuZFVxnPLDQe0RCvVhyd0JbszFAKXXZmB85OfUyhu1DcBdIRCkjAI2CLpnh/cEzl69ERa3BDeBiYo8Jg0xAxKf4tJqpPlGPbylAofjwOepM6VCZtYwP7EE6cUz/CpHw5517hhwvxa1aX9+aXhXDRGizlsLgjc8IDwasjbTb3zQy/CfSozvcGmh07DHBrpfsjsi+pFuMVEbIFS/DGafpYxREjrvu9j9imI7oasjbzqTVUdkImu1bJZ2u774sVK2FyoYot2bHN1Do3WvD79tr+1w4pjsUjShqtie1MBFu+TOC7LgvXcrLV19GYdLm9eMjcn2K91+Mv3dhjoei+OY8A7p/PwKgwZ1loqRp7MY4o3fcZCssEczIGnsc182pi+tveUEOckyXPsB1eFV06miZloRrDBdW859DdRqfwYPsK34LK3z1D2yd11o22XGhKt2oXytmDoruvxtG8QGgQXXnWjpptYng4Q8fWbuRitNY6mAHf9DeSrbdcRIKAMZvfapHd5xcwdxBgdbp59ItgFoEKJ7tzscBt8Qu5alHHBkzwnU4nnjrySp1UMo8OsPRvXUa+unbIyHs0N/fDFHbD8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(1076003)(26005)(2616005)(82960400001)(38100700002)(36756003)(86362001)(83380400001)(5660300002)(6512007)(6506007)(6666004)(8676002)(4326008)(8936002)(66556008)(66946007)(316002)(6486002)(66476007)(6916009)(4744005)(966005)(2906002)(478600001)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ry2izjJrfkndX9PH0hnh5w7HcuDkW0P+mZsGuPYyWehyFFyCTMhHG2X+C0PL?=
 =?us-ascii?Q?GK8nTEUBjMI2PE+rAcZqD5r+oT+0wToSM7tIJlTSIlqLNBRT8thXN0DseeR9?=
 =?us-ascii?Q?C2SwBJIuqXJjegf5qQ0KNfTC5ukmre4Jk7tIblIPqiOG9VfjTNyUOosGpHuf?=
 =?us-ascii?Q?334iBqiDU8LLNOVNmTrjdosoqutNL4xm8RknNHGQPg/VaWKvqLxlBTd59Lve?=
 =?us-ascii?Q?V4KbeDgX99KEwJD2+z6aFRvikdiMKYIRvnaRfeqE4NvrwMtCsNoiiL3nN1ch?=
 =?us-ascii?Q?U7tYaUJ2LHp5z+9m6hgyLDZjT2G/KMi7dZxF+OQiIhfTGRkURk1SPF8aWPTx?=
 =?us-ascii?Q?JcHSqby6Q2wnPyDpd6jKPJ4F2ORcHHWn1PfScUz+KpYqnIo9H1V50EWJgHjK?=
 =?us-ascii?Q?1D/WkGwD7DvDyrPP4DU10fTNPwVFh6Ljms6hKk/MgfZLp1obsIDjmcNBQdK8?=
 =?us-ascii?Q?ixxIIQCtB1puQ4qyZ+93QOSrxU5vRj//r04/dY+dUIqBjB9fq3/V7PnOLfCz?=
 =?us-ascii?Q?pM4U37QIJpoAvD9wAMtHQFa+x7RXwPUVKCM8Ft/166xCTrVRG5n2wxqdMJ/s?=
 =?us-ascii?Q?VXNF9orNRebD/vV4rToQN1zh1pHfA9mmMB65CB62VZIgJ6MpT6yY+mRTXU4A?=
 =?us-ascii?Q?AonnD/MY1Im+SbfMoUv8kxl4kRtnWzwdn2dG55cEvvITBfUkv6eKFe15eiWh?=
 =?us-ascii?Q?C/in6Rz2juPTXmZAabVN7mk+Lg4rMEDnOPu9/m5zW5wxAFARR5cn6f3jDkKW?=
 =?us-ascii?Q?SiAoAlIeJK5LOQ7nFbL6leh0Anmqa1QD7cvh0ANnKXvH7KEDkLHJiSLDt3yl?=
 =?us-ascii?Q?liD/zylKOw8ZeoDtEGX4gTvJATGvdAeOkE3z1JQsBKY5bEremK+0x6opI5uJ?=
 =?us-ascii?Q?7lHnmDqIqmaRWQn/eT6PyhL9U5x/Qzye4uVx4iVsaHLqKq48dYMhwJZBgizk?=
 =?us-ascii?Q?IQFpQ5JsXUJNysJSpl/pH4pQ7O2eEiD0p1FavxWg/gA4YQSROUIl6RoBoai9?=
 =?us-ascii?Q?sAYpX/BzYNJXFQRW+OrKRKMrVXBsgGrcHsceOmM2bzpl/ZaVkdZ8dxiX9H3g?=
 =?us-ascii?Q?V+8n1+10ijwM9UJPEm0OXy1nL7tk8J0knMGugFPvbxY1Q8jLxpDnNboUE2Dd?=
 =?us-ascii?Q?NYFlxm4+/+shIe9XSe/MCdUFM3WcslWZYkZwguKPEVdI95LGpm6i0rejgX1/?=
 =?us-ascii?Q?oS1mtZQr9+HxFf3Zd/UVLP/7kZvUeXKT16CaJtS2nYZ0bauhzmlMS9vEC+I3?=
 =?us-ascii?Q?xrCqCWLTosPT36jGSORB1y7TatvqYnaAL/bJxXZSF7ezIpN4MK9edgMzZvoN?=
 =?us-ascii?Q?mfmW2r40TizW3VMvzGRY4f44bF2Ag0x8dbl3xn7C9mf+37cI26+CX54xoMqv?=
 =?us-ascii?Q?yjKBmof5pGl1fSvjLQA9Ly5CoawMXCiTxiS3tiOTg9GfG415NsRmcogwVIpE?=
 =?us-ascii?Q?68RV0adCWZ1lVSsNT3wso3rL4ogJ2E0CtJ9ntofcdepmKL9340oaJQINLjy/?=
 =?us-ascii?Q?NA+/x268XQb8gvA8tL7SKc5jc7hpa+VTELElPF4gTwPSRBjFf7OmANZzyjm0?=
 =?us-ascii?Q?t9brSg6yL6RHDkI3DaBN7Ec1vpwtO3W/5y37ZU/8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f345f0-7ecc-406b-85e1-08dbff6d8f0f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 02:03:42.0509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyMR6lrt+XaI8s2ueIUHWXnd+KoS77K1SyLpsUzpGicKIqoS0qxDUBxnlDh1TFiJjGMK8A/IoXsWMF+ktt5inA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
X-OriginatorOrg: intel.com

tree:   https://github.com/isilence/linux zc/rx-latest
head:   df0f15513d62887e03d5bdba7b09452d10827883
commit: 0385ee8ea29d8a2a74b9d01d56a57202aa1ad560 [24/31] io_uring: add ZC buf and pool
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202312160620.pD7CYup5-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> io_uring/zc_rx.c: rsrc.h is included more than once.

vim +14 io_uring/zc_rx.c

    11	
    12	#include "io_uring.h"
    13	#include "kbuf.h"
  > 14	#include "rsrc.h"
    15	#include "zc_rx.h"
  > 16	#include "rsrc.h"
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

