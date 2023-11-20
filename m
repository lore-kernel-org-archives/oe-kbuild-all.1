Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676381C02
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 05:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSxOTccb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700457419; x=1731993419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gTwJ745GIPObfFGE6KeXRcG8u1RhXseyZQWkv8Jbvrw=;
  b=dSxOTccbMb51rqZ3v586vfF1dbxAmrAAuzrslHY585mrKUpGjOVAXr7Y
   Vw6z6hjee5lYifjvkpdHmfgFok3MNd90aUUqsGvWgLxSAZtBclaCA5Mkg
   PalNjMnCKNL41n6W45q3e+1VPgV7q4+AJ1pUPR6E1/pdYHEev+pe1Fmee
   APl0JPYUNqiDE8wEmIjrGw9mAPMEG+szALm7ZdSaRgVAIdsgSP01ZFL4b
   2la5+aeGxjKPwEgWn9vPSNQ+Sifsh7pLW1LHjXGjYQwGvjOMipBtmz0nT
   YKb/l7ltCNnO2ZvVRMmaV237dsj4MZjeVbimAaWlbXk8slGj9y70Ed/8U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="422648422"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="422648422"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 21:16:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="883747750"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="883747750"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Nov 2023 21:16:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 21:16:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 21:16:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 19 Nov 2023 21:16:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 19 Nov 2023 21:16:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgAtuAnm+P++88wxuhwIJV8Y2kPk0da9/DAoYF8ACseTsGal/BwyCYltW7/n48Q+Vvw5IlK2Mf9fXXrDDhtMIJbC/A60ORkVnGGnk/1rZVbHu+zfzdSwbfYq27OPGTwVvf5c5AFUqNEGXy6zopCgSCt6EbAM/+s+btbcpKH8nrNCe1lUD6KMEkP+ByZKstdLlZWaOViXk9UfCj0sRlhSCqcIGZI/MUfB0oCfuzqlBQzGgpoZXnFk5IXIEautLPsk0Wqt2JaPMYwz3GSL1Zz7ytULfL+/8ibv70U68qSfhWHx56HnsjGvqscdXkz5jDUhx+DSXXm+iiaktVjwhnJIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPHH6peQ1LzQUJ9iejqMg244LlsRhpr20gFyw0hntds=;
 b=ceaj9IkxIJ2XdqqgAcuaGIfabodlj6zdmYvvTZ0B2BvAF7VJR4jrS/YiAkZ7Xh88N4EgUuKciQmFLCMlMRzhayyeRJ6qw9wJsdYN9dintjGyV5j87H/o1QQ/pDMg6NbSKYTIRcyqo3EeQvONlYXTc54AjhE0IdfpoK2CYQCzBhpn9k/r7ObG+lhtKfWXB4obURrPbCVQQI1rIaf61OhgeM/DKWzyUW9zx7n7X4TLnTM5jgaDBCd3BSi7fH7PCsnt+rvrY9ihAHiMn27tz3DKGkn0LJQ2iYzvx44Mf2qe9N68Ku8p0/P4PrxW9MFPmGudvalA/FXafd0odlgDBujkLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 05:16:55 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 05:16:55 +0000
Date: Mon, 20 Nov 2023 13:12:16 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Mounika Adhuri <moadhuri@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>, Alex Deucher <alexander.deucher@amd.com>,
	Martin Leung <martin.leung@amd.com>
Subject: [agd5f:drm-next 22/55]
 drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c:
 dcn201/dcn201_hubbub.h is included more than once.
Message-ID: <202311180503.fajzMSgk-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SA1PR11MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a3b5fa-3a6d-407a-2f2f-08dbe987e96a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: plo6CtAlWdcmSiQoym9ymWY879eZAY74C4BYjkKaC07hQ7efxAn5PoukgGkPzYYTSrt08gq+Uei5tP/3seEVb5PPaiTLvt98JWyLdHB8Zto//RB1NQrESx1p/EzcnPjjByKjI+MFtmDzZiK0Ug9HO+0I6GoFGzgZCzkbtqoAs4jSFEjIQmjU313aKB68SW/mHXZffJVFz/bAbDNhwmJsXTVyR6aZy/3fYBvyS2fv7XTEKQoB3uKBXNHw6P5tfFIeb9GwllJ3X3HWhgnCwBGXHjMu1M2EnaHRe45I2lZHeJf1iUFEn8cLG+8/QWSnEjuAPr6LBJE8VLMOH4vXDKKkNpdk6FPrBUL+MlCmcpdbpoJvbHf1IzGLzVXa9hlGZ93Avf+NWgc02/9s3iV6istMJihsRG24tIkZ7OQ/QOtXMXXU4saIUSIz4b1UfmF3YgUMjfBKJ3JXPd1soHZ5p8/l5y+AHJ5/GYU6k3UPAZkMD/1Y3juQ29CnUkoGy/gVBZpQdKfGkUjXk1O0Vf3f7HQiBQmTa9rNtjhv5X46zfPUpBsa8PQS8YTxx+63ADS2AaNAEccH9VggsG/IgtXYP+oxDyJ4oygvpIL7tGlyAaI7ztaX5vZyAqvBg10qMsRHxUndm8id2OAZMKoIQLh7KikM0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(376002)(366004)(39860400002)(230922051799003)(230273577357003)(230173577357003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(6512007)(26005)(2616005)(1076003)(4326008)(8676002)(8936002)(38100700002)(2906002)(5660300002)(41300700001)(478600001)(966005)(6486002)(6506007)(6666004)(6916009)(66946007)(66476007)(66556008)(54906003)(316002)(36756003)(86362001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QpuJwGTz4q5zW3uInaaGl9EGZlG4/nKfT+iRNLHYZOJCv0EWWlFRHojXh5lc?=
 =?us-ascii?Q?MJSY5b82+IFAS36tEozEJXCbP4KxsNo1TB8DfBB4O95d00wzp/qGamUBrTGc?=
 =?us-ascii?Q?ntdtyqC/wSgJlUzVlZCI1SRrsLOBZB4UvDP0ZgIDwQszIm+qmkaFx2T6xbBt?=
 =?us-ascii?Q?D7ry58Vyri0yrGnosD5qODB2NBJ5/UiofDo6QLCWjySP1Xb71AXm5D/GFII9?=
 =?us-ascii?Q?N9nM16zP44vk4gaFxIxr7Dvkjc20+OoZiWiK4G/TH2sVUlfG2kffQ5KkOxjF?=
 =?us-ascii?Q?2Y65sI//tczpOhHToZojP4R7fH0JvjZo6zOmqSl1jNZiME1hbsPStSL2OBSn?=
 =?us-ascii?Q?E7wCxG73ViQavysUnf0al9xidcukmVjwSoK8qOz2NbSUlPS0vMA+Q7dex1dG?=
 =?us-ascii?Q?rRh74C5diktFZqFAlcXmizwkB484Btu9vlJgOXo2bb7siH35KQ2lo/6UFFyN?=
 =?us-ascii?Q?8HVHsQDSSpMDnKhrFs5X086D4M+7BVo3/BiZ/Euz9I3/FGGz3rIaozOwXZL3?=
 =?us-ascii?Q?aDoouksW+YQaUZ5oDuVG/o0dq3WTleoAs+EmGDNDv/CdgzQ12dhsqDX+BBbg?=
 =?us-ascii?Q?clQZkrEhxMfK3T6GiccUefeMjPCElfOJP4U7Y/EL4z8jT1k3fTEKRFzYs+JE?=
 =?us-ascii?Q?8sPcb9jCOkOpTjt8P8kzq+6rww9M49uW3l/ODfBqR9irVBZRhUf1hPky8X8g?=
 =?us-ascii?Q?TulWk7b6u54rPWWMYuNHEW++alsEv4sTes4l/nANrYhThjLnwaqH1NKPaVkp?=
 =?us-ascii?Q?Dafa2EYRYDhKWilD4LdLGx5Y7hZCCYlgPnvC9L13DC84DCmRRJ01Okbg+vC3?=
 =?us-ascii?Q?oifNtaerpEnLzYuMJ/zas6RgjHcupcKjSHe8B/inDiAu7+1yhyAYR/ehLACt?=
 =?us-ascii?Q?MRXJTa1Z0KPnIwfm+G/43xYH0ZCpFi1tHyrq9Bw6AGAEQjaA2YJj6LAHwAQI?=
 =?us-ascii?Q?n+s3LBI8uJ1gKQwWs0faN5/lUFWF5sa5HpV5pI+zmUfc0DS4BtIMin+ZDmN9?=
 =?us-ascii?Q?41pYyAN2+a6RQXHEdWCl20MT9pmVpTEaKLhYDAUffvuK2xUd5xTR9ENRfPjo?=
 =?us-ascii?Q?YiBeHTNHXSP3iuJ8D+NzqdjudxCCHQXGbhh4ObIQu5XmP1nwe8cXk1dBcNd/?=
 =?us-ascii?Q?W3W2w1iq9URtvGL00Nld6uK8B8ncZeuV0EVI5VmZplWAk0qVDXigtNFXAvOm?=
 =?us-ascii?Q?8yeQyoL9yhqVsBRWoZ8E4ndgDg8ebcQUgYkeIjDE2H3ik5yqxuc6ONCHOXD9?=
 =?us-ascii?Q?syv2gpTNkFnZ/18B3MtOorfLNEqcVapTQm3EylRLHS0dKf9w4emYJyL9JD+W?=
 =?us-ascii?Q?rzMxQiEcbjaTTlOJ/MHs741cGaQakEQYrME3B4NPWiY2L6RBRQPk5S1KaXo0?=
 =?us-ascii?Q?WmUILru1SyMXTPp8XE9f7aGQJ1G6CTB38dI8PrqQbuRtYptN9pNosB9wyT7f?=
 =?us-ascii?Q?IFtQg6sb9Oxra28VRHW8+1AVLmSdctfyhzTH3j8Qglz+a3rNbdndhxAQw78X?=
 =?us-ascii?Q?uSA7Eo5PVh2ODKfPNUObQRyBnQhtJ3KfdTpR32dGSEtAc3LRVB3cNlQdVRHM?=
 =?us-ascii?Q?zo2bt8AGY5wBioFTDf2nvNNy0F4uQ8eROGeoFh88?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a3b5fa-3a6d-407a-2f2f-08dbe987e96a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 05:16:55.3098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 769kNGFIoAekzZRk5MAW0Ur7MmNxJSC/aokBjTcZijY37OSj4WN0aLIj+y0gHUfdkR3ncrzgYt6jEAnznVHlsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   699d392903c3cebb7d2a2a3505ec9047c419dcd7
commit: cf5668be4e9b7c6e92844559ae7fa430acac271c [22/55] drm/amd/display: Refactor resource into component directory
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311180503.fajzMSgk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c: dcn201/dcn201_hubbub.h is included more than once.

vim +43 drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c

    36	
    37	#include "dcn10/dcn10_hubp.h"
    38	#include "dcn10/dcn10_ipp.h"
    39	#include "dcn201/dcn201_mpc.h"
    40	#include "dcn201/dcn201_hubp.h"
    41	#include "irq/dcn201/irq_service_dcn201.h"
    42	#include "dcn201/dcn201_dpp.h"
  > 43	#include "dcn201/dcn201_hubbub.h"
    44	#include "dcn201/dcn201_dccg.h"
    45	#include "dcn201/dcn201_optc.h"
    46	#include "dcn201/dcn201_hwseq.h"
    47	#include "dce110/dce110_hwseq.h"
    48	#include "dcn201/dcn201_opp.h"
    49	#include "dcn201/dcn201_link_encoder.h"
    50	#include "dcn20/dcn20_stream_encoder.h"
    51	#include "dce/dce_clock_source.h"
    52	#include "dce/dce_audio.h"
    53	#include "dce/dce_hwseq.h"
    54	#include "virtual/virtual_stream_encoder.h"
    55	#include "dce110/dce110_resource.h"
    56	#include "dce/dce_aux.h"
    57	#include "dce/dce_i2c.h"
  > 58	#include "dcn201/dcn201_hubbub.h"
    59	#include "dcn10/dcn10_resource.h"
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

