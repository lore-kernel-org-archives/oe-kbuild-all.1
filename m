Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8E646B3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 05:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjTMWaGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698903233; x=1730439233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Txwt/Al2m/k8USOSCIn70FAlCmqL3B2RfgqrOC88Jk=;
  b=AjTMWaGYL2WVKrqMJbilH0RT8ocyujh1SDNThPF604wzSJg9w7NYL15/
   csMYFrnsxI2z9TBeT/wAw6KWTvL7ELUqU/BKqTY+Dhtu2EVDhfSd86pAB
   OjR8XxCIPwUDhb7aEymewvq6kweTKYfZp1tjE9OxO6YkAuDwuh11VJ0yL
   kavDkQf3LsKUQZ3Lx99db7p1jFjvHxGTX8Dv+iVcO+WfWs/9pt3IZNDhG
   rb8gPeZ8uzNrw5xEgKTqw2u6wlFNXIWzaXkFxooaQR6wqgghTX8RpYQzS
   0bOdtB4VU/yH510okNzIhMqQHeIQ5wRyZ9yAX/wxanEp4YdPddszvR+SF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="388459436"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="388459436"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 22:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="2421065"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Nov 2023 22:33:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 22:33:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 22:33:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 22:33:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLdeGFLXd7HtVKf24EJGOV2HkXbJ8Tq3yCYJwrUP4+1hlu507ujpeUKEsP6JIuZrevbnm0WcwjTrACJa8Jic86x//Bj2arFNJPRnKKQct4DHZm9MSgDVM8cd1MWyn8ashtIDCFD98DiCr5istfuLg7++metoiNyeZddHVCj75wBZXMF+p2+iV3bTN0oapVJjOj26scyHqPgmP7rl1A+tg3V8JPx1R8OSjK+jfktKlDD2hxM3jI2D55z4lwf/2qtafCE2agsOW0S9pDuGLTLhjIZU/yE9/w6ctO/DtQGSFeNE7JXuSqmiy5ks1+br4ZNrz3wjt72nMFR/dlQkureyag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nMZPyc63H6DuikRXa30ZvC870FXiCc84MQlIPh3830=;
 b=cBFjhrfSgbKRaSnNg0DovwheXMEQPZ7qdlXZKRHe9G2Y9L6+LLwa5obRl7BTVbAd2FSFHEsyPuTYJ93CBuKGa0iMvqsBsUBJor6FVeO2YDmBUQrMDlsSe8MwcWsiD9PopV28LvgUADfqFByT7KOMcDn7h7ZXbymlaD26sFsFTGLItvV5BoV202G3bhwDD49ilqSi40a81U9hnmMLps0ykbfdcZfFuUcuFDBHVLWQ/z22TiIVtWSNpacjIBYLlJTp+bZoM88XStw0lJIr+d8GENRSUVybJQtW3OqCANXXAuilXmNdpcnBCmUAatLjgHg03SwBqUfYCv1hWDQyYg4G2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 05:33:45 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Thu, 2 Nov 2023
 05:33:45 +0000
Date: Thu, 2 Nov 2023 13:29:00 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, <intel-xe@lists.freedesktop.org>,
	"Rodrigo Vivi" <rodrigo.vivi@intel.com>
Subject: [drm-xe:drm-xe-next 1329/1427]
 drivers/gpu/drm/i915/display/intel_fb.c: intel_frontbuffer.h is included
 more than once.
Message-ID: <202310311925.XhpqocMB-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ0PR11MB4942:EE_
X-MS-Office365-Filtering-Correlation-Id: e05206e0-22c8-4a1f-c3f1-08dbdb6547f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IWA0GL2G8JuZGB6gS9hzLfj+coSy/F6/BxRk1Pk2JWVSMyFPbHgMkayG9fO+9vVI2m8kkswH59Q9quxSOOXXjdGq1IreIpGUtdjECR2U44H3DBKGBjm4WbF71Bbh1R9migZSzfEXsRdF4vIPo3Mt3OtfZi/b3/uq6VpeqUZOFdJZDT/xZ9GCf0JeKk2X/PpQdGy78eKHbSV1aqZOsE3uVSgqCG09urwUHbe5jr6lAHVz0ANPR7hrlQ5nOfZiAy4EE6gfq99I59eTWhv80DkN5lQLDWci7LaxZQdKvxhk+GbY+iqBDRuoHa2DcH0hvxWutjoqHFD8Ca4EmoVwzUS2yxZlALxpC6bWymvo6Oqpq+DII796VMt96nf5XM57cww8xiRydNNm6tT2tee0gWHpualpcg9aYLJIEP1U35Wt+6hmpl0iYyPhdu92htngxYpluVrOmHzzE6TWVQKN286IynYVaHIoAa6xfvuswj94H5m+N2FU65VI7cHXjfkQur2GqGRiRv7XOt91uWKe8ncil4NBmkaCziFBxujiNElSdngYm764k6ieMTabXWE1/I99B9vB0v9H+vM4ihjz1kGgPBJTUXi12dRcxgdzvpkYy3UatvWSQfoKqCnFuRsOJ4c6sGIf8NrXYeym71zSRiAu8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6666004)(6512007)(478600001)(6506007)(6486002)(966005)(83380400001)(4326008)(5660300002)(8676002)(8936002)(2906002)(38100700002)(6916009)(1076003)(66556008)(66476007)(316002)(26005)(2616005)(36756003)(66946007)(82960400001)(86362001)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3J5RWmGfMmevE8/g5xU9Iethg7wZQlrBKp+dvfa4VzjHNtnsDvdWr/wdiui2?=
 =?us-ascii?Q?lztUrJzFjJKniX1UoTYoo92yua1tw0lQs93uyJwv78rgdkzID1ibL66xIdh3?=
 =?us-ascii?Q?oO8jOlmP8NUDKpOq6LSqH2Zsi28qOCnFc6zoD0fxV2IfcK4mF9/3eZ0++vlW?=
 =?us-ascii?Q?YT03csYg3XJtvZGf1CVh+j9gySK/9J0p/O3dTh7gcORRSMd8eofzUouEsVxS?=
 =?us-ascii?Q?4V7UUGxJ/uKPQDtkaJP+GPUt5j16dzsGeGKFDES/wrGjP79mOvSopMfrZorl?=
 =?us-ascii?Q?rkFMbSSCDWyqbKEKHJE2YtEWXUFNL/95pSBGa4ZOjdG5WHfaIR8DvXjdmn0O?=
 =?us-ascii?Q?uGhrFJcJj6myPrW2p60uhpi69f3w0GhtEEaArSxDUWnr0sJGPaSQLYNIItcU?=
 =?us-ascii?Q?n5KazpH/8v3maZngAsyVJlNRfQICT+Og+syy01sqQkZcetfzjDKa9Q+EASiH?=
 =?us-ascii?Q?PTVw12mG/jB3tBfkI6dw7l7eZU8rmOL6h+cgDRI2Wl2GHgIpdn636uEw33OB?=
 =?us-ascii?Q?whGbZ17FXfnZA2qLKNz3bBBiolRj6FBJ0YZo8ACmXpbLm9YS+Ce2W7JesUdO?=
 =?us-ascii?Q?iZikMxrNLrKuuI6Y8aKyrfaNrI+TxO81Vron0IW91GVCu3xhbcsisE+avrxZ?=
 =?us-ascii?Q?Mz2lmPO2skbfOADnupmFsISpmiia1jM0UaPwIq8grhQcWSfBoJqhmKSsNcYM?=
 =?us-ascii?Q?gks5OfmL0Pu237v++7CIvYkM2Q9JC5Zo1keFe+tVW8Wwt0SHzWmgAGeEQjwb?=
 =?us-ascii?Q?nocLzPkKdYMClyKeB7vthIrWaAIxflvJxlVy/bbXbYd7zJSn+ZPOagkNnW2D?=
 =?us-ascii?Q?gbUbMG2gD2G7kKnaI2KVSiENGgGNvTXYkJX95V2zhCXXirLiZ/0lzaTighRj?=
 =?us-ascii?Q?iXri1QttHemCuXeOyoULphOQYJgQwMjnc9g5B4AetOc8gvEbZS3EXtU9yDq6?=
 =?us-ascii?Q?cnQ0sXy/u5Nbz4LS+kgeqasIONrB0bmmRxd6D1r+6MMpdOZsWev4G1rgmVyd?=
 =?us-ascii?Q?JShQxt8k7J1kyf6aOgAC+k56SvSg5keLDV2vzgEv7DbJABbONmcdtZ3DBAfL?=
 =?us-ascii?Q?TdKJBRBgeCDOK7bf9IXwovuN6rb6l7GuwZ9oCaqxCdcn7cbEJUHsCobsAZQy?=
 =?us-ascii?Q?0r/etXckVgAHPAA0IPCguhVQP36ZvAYyf5x1bDSPVTWtI7w0M5he3fNiXAa9?=
 =?us-ascii?Q?yCER+1baU5y/Dj47dJZKMm8w6Nrw/Pt+xSZ3EEJiIOYpPMCLY3ijXzv0M9Db?=
 =?us-ascii?Q?RtME2Fq/DaYbZVUud2NTb6pXdPK/TvIIHKjwMqw23FumVWG3kzKrvH4hcY33?=
 =?us-ascii?Q?uXpQjQ3r+rv4l22axIO2cZ2HMqy1Pd8X3SnFD9y6S2WOLrUiq8u0pZL1sxPq?=
 =?us-ascii?Q?28++LULunmaauRuPUUUSJRullEp59aZgERzlailmeB/JJmbY3F6iOIBmJqIA?=
 =?us-ascii?Q?FoEEDa3foRuFxAPACiaNo/zAEQ0+nzxWWls85iwXGy1/hdCY/DME1557t5Ut?=
 =?us-ascii?Q?k2sJ4sly8yL7KFMjVEmiUVtJ5q1TrHuM0TI4JORKl8W2/SuuD11c1HcXKkio?=
 =?us-ascii?Q?H9JmsLmrBAnITK4dAqMlE2sX+G4xhPl6hT0rE+IJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e05206e0-22c8-4a1f-c3f1-08dbdb6547f9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 05:33:44.9540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmpvR7HhPB0F8/Iq9UQDUfRieDYvEv7GhObnvicSd3HlilQWwH1N5g6f19qr9uZD/9lUT9qktibo9s+dD4dK6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   1e652bcf7cc139244f4f8c0cd1fc184029240050
commit: 088b462e322c581d33261a814abef7f09fc59984 [1329/1427] FIXME: drm/i915/display: Remaining changes to make xe compile
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310311925.XhpqocMB-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_fb.c: intel_frontbuffer.h is included more than once.

vim +19 drivers/gpu/drm/i915/display/intel_fb.c

    13	
    14	#include "i915_drv.h"
    15	#include "intel_display.h"
    16	#include "intel_display_types.h"
    17	#include "intel_dpt.h"
    18	#include "intel_fb.h"
  > 19	#include "intel_frontbuffer.h"
  > 20	#include "intel_frontbuffer.h"
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

