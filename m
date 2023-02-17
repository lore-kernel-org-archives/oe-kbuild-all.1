Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3530376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 03:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676603530; x=1708139530;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pZL8WZ6petHCvcSM/ulneREUe3DlSpIKvgSk1F+4ROQ=;
  b=gwttllEd1kaEK7VWe7JKVusSBD6ot4ejVomiC2GpkFwbnbJNC9mJkueY
   fiUuj5JbyoXWCGbF9uy7eytFQJjEFyG8FN2uGQZ0+S5PuyZIYGMcpbzC0
   rUoj3lK8sPbp1luxeLbTXyQd+IGxJ8on4Q9eJFivkncIRMjvOq5IbB1TJ
   ofCEHo9c6rS2Rhw2Znz3VYJ1OScs1oEsmASvlwQKSVqD8WkYYnAzXyAfx
   u+FHlxwYnRDXhi88z/RhvtXgWe9jmkhspAav7vNCj1CMEkcsDjipAuOLf
   aAFQgq+T1C+TnqNRcFVOZ+kZFgt12AVdpDI5t9u4maVV7AEfgieTA7vbA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331899762"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="331899762"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 19:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="794270939"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="794270939"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2023 19:11:56 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 19:11:56 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 19:11:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 19:11:55 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 19:11:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2EuggVtVAAYN/6DWl4ArFvRReoCaAk6jGZzRYp+hib3JDWJGeQxSZmMS4fqzZd1EE/5zpbkSnS8VaVt3+Z7ccTX7eHOTBlqbcrEc0YCuTmtuY8AtiI/sh0QMiAfvI74lVP10hef7oxJdidEirYrIoFGuDJCcOezud27jxquz2EmWNt8bGOEimi+nX9lZQ/lFmVuW2/gDXvVxHUKwzc2R1gwP6/R/YwU6aUPxpW1Iqi+a3bBhOPDMOhgjizgImlT9W1HpxW+dY0Q55UbCSRqrldMfRHdUdzoOV2ZtT0PsYh0Jwp8wi9Yel8UNqpU+bIGHDW5bIDEv0wbpT5qiAK3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6sqZfiak1y0W1ccTGHn1dlegCI+ZsGC9FYXSvjRsMI=;
 b=OWVh76vwQc9TRQgSB2ppPS6gSg9KZUojo9t37dxOVW2RZ4wA5DQ5e/OzHfGgrA3VyjGtUbi9GODEa+5OYVFjvkS96lRmNc0OJCQhPDYXhn5EeKg0nIQPJjQr9G7afcwNJ7SprY75Fbn0Lw+tHPO2ceECSeOc0mKvi8G/NiOvOzpZqdpMnZOd4yy8nyH/kMGGGRE/p8r+tFWMHAHifMoU7zYqfJIXmX4YOeG1+H6PNeAH1rBkjhYQM+gpqlr342UKlmFvLcgePMmI3ZapSUHCOxQrKXtxgvILASEAkKEpUeHEExVafIR1WRQYjzFFnNf9batfygEg/5ICKAzT29gs7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH3PR11MB7818.namprd11.prod.outlook.com (2603:10b6:610:129::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 03:11:53 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::66b:243c:7f3d:db9e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::66b:243c:7f3d:db9e%4]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 03:11:53 +0000
Date: Fri, 17 Feb 2023 11:09:09 +0800
From: kernel test robot <yujie.liu@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, <vigneshr@ti.com>, <nm@ti.com>, "Praneeth
 Bajjuri" <praneeth@ti.com>, Sunita Nadampalli <sunitan@ti.com>
Subject: [ti:ti-rt-linux-5.10.y 8460/9999]
 drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included
 more than once.
Message-ID: <Y+7v1aaP64dGHUPF@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::14) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CH3PR11MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 189f21ce-fc0d-4601-2d66-08db1094b7c9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q5WElMjXnBbKGhySumyFwLQ1twc+DuxS6x6JQ2ru8NTPyTugLbnxBw+Sm1VRdkidxjejSPF2UT/E2MVN23CL1w420F/4575KMSQIXmAryORrMuMlCUK3/wK+lny81KUzKnRkXG2tQ1aofGaPrIwT49DgiaymQCnI/vqnQ0/CgWkeU5sXCp/X4UOmRnaBNzsAcjf9OaMY3QdrCS46qCzEKx3wJjG6pOiRD36eoAflrQrbGI29OMhISQgRLMWDxHnruuCc5tARZdNY3TvCOu1cLNKXKUsZhnB2gxldufo2jDXUwVOtOR/4Bq2s9Z6BHONMYza0P6v9kE/7Rbg0h1JBcR5q8CTuHRu4f8V1lmiPGdXvCfjlToQQpVbJ9P+BghLvT4yGFKopp/3Ej26nALPfpnfgCkfg5GK5u3GT7xE2joqjGci8QKDDo2B+kor3XnUusfJvhwatKgoMB+0Iw72jLCehnkqKXJwrMXKgaVJHzPzWSAOhdoWqDWGLA2lD0DU/pnPgg9BOzoq6LuWzVmTfDkCqzYjfOwlXPKrLWaHYwGHVCWb8nCPBzqgYGS5lXM+As+GyXuJap1JjJTvgVWqPeCkdTxwtyxRph4VT5Y5Biv39kRmgKEgOpXWdgnFTAcNkWBfNjE6wmU+0uwkj8VsgRYjP4qriGtsVOfbBUW4T5Ef7goqzMxhFRnde93Ye/T6l
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(396003)(39860400002)(366004)(136003)(376002)(346002)(109986016)(451199018)(33716001)(83380400001)(2906002)(86362001)(478600001)(6486002)(966005)(6666004)(6506007)(6512007)(9686003)(186003)(26005)(82960400001)(38100700002)(41300700001)(4326008)(66556008)(8936002)(66476007)(8676002)(5660300002)(66946007)(54906003)(316002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CuTgf7eU7JAn8CzIPRUYa6YdoV2Tf0wXS+w+0PmGyFxPgxVEX6dwZR0ogmfv?=
 =?us-ascii?Q?m8+0J45Jci6tahRKVRW6vmk4BxN01bmu2Pn935BCByuZ/KQNtGVZ7KowKTUO?=
 =?us-ascii?Q?Zt4BRHkAYIoPBJDJYzDjQiIaXdHy3EegylfBolUGkjTy5SZyUzsRGCD277RM?=
 =?us-ascii?Q?DndMUmgTUoGI0IhGmyI87px5Wp5z6ZPBhjZNx56FijafdiwABboPvrpWMapo?=
 =?us-ascii?Q?XHpMIHNWPi+ELtc8qcBKQ6NeoD4bAFXxdGkzYGS+/HD69smaYHdGNZq2ERvF?=
 =?us-ascii?Q?DcykowFo/iZk0RtI9NVRvjzW4nYEZL3sl4DlZQpju3y+iH3CjR8lwXAZsbk0?=
 =?us-ascii?Q?6/7hqxnBPtRaYzPgPGp9+oTqipduQLVsfkMErRZmrI3anlHBNxgBvFg8MNRi?=
 =?us-ascii?Q?Ed5+f0qej0liggaZgtoj36H7FMJBEzQsPZM1jYMmrqgdswmh8Jer5gao8lVn?=
 =?us-ascii?Q?iUTgKWU5cwGRWJ5P66ZVia5iY8VickdqCAIp3POOj6FTXhzj+EstAkAmo8Ah?=
 =?us-ascii?Q?yRYn1Ag6K6gkZ4CIA34CczlJb8MLjnrrjJHdkP7Buh5DCHe2RufaGY1Zxki6?=
 =?us-ascii?Q?bdR6Lc27aCvnh2KHx776uaoDe4IB6Sil3gNXhSrgMkHNPnoHF5tBYupA9pWQ?=
 =?us-ascii?Q?oSh9m7EsblgvLP1PNHmArTdVl/3/5EL3Df6Bj9+AbfuxhD94xs4CAXCMLFDn?=
 =?us-ascii?Q?owFGPkoHgyDOeZjTyKLVr5gRS/N3x6wL4OUdXZJTfhRS5wVzHKFejtQhTo7g?=
 =?us-ascii?Q?akL567pxyT8fcfqrqPhnyyBnD9jGht5asvAKESZYGgb2Fuga53Y1WL1jhujs?=
 =?us-ascii?Q?FJRZ6ssg6o+kL7FOTzN/5Mm/QTTnPnFnM6n78aakgwoZSkqMJT/V5yRMdCfl?=
 =?us-ascii?Q?PTo7hVl0H/gEnnNBapvyPGSObF4zOMZqFyicfALOCDn9pGgBqkKQhtuBff13?=
 =?us-ascii?Q?86Ef1jLb3zrdJFPk5oeJmo/8OZZWpganp8NAOD28CplFTXqW5/Yatngoryy1?=
 =?us-ascii?Q?HMqLKgyF4RUwjIUByPF3/UxnRZig9ZTWhKj4mxKX8pn/m4vv2/fHLxiKMIiG?=
 =?us-ascii?Q?4CSiA/u5NGlzW/1oFUvPNTvWQ3vitd30vk6zwt4dAi9KcTAf7AngVeuH7QDA?=
 =?us-ascii?Q?aZE8BpJxFPmb+gS0AuDOPB/pmOeS9HgPCwPeBA3S/zXn9bujGGEBF452Rs+U?=
 =?us-ascii?Q?lMI8l0xdlM/N9o40mqa39JQreyUXiuMvF2S3y0Ou1Ks0N6D5dMcwZluxBB7O?=
 =?us-ascii?Q?rV6G1ZFvlzqCqXOAmYRdWdZGJK18vp+7X91NBGc7ZGglXiKqVTGSDU4IR/zq?=
 =?us-ascii?Q?VCh+unFJs6K+GfPDw5ezHW5lynC4pgPPNJPppIDOsmFaZeLefBwADf12wzbh?=
 =?us-ascii?Q?4cWy6UbJeE98gzmvnr3WEij6zfENX6KBKT23YPEnJQizLNCDSHILMEsV1ofS?=
 =?us-ascii?Q?fFA38MgWne53B1dY0A50WuvArQbrWAWvWuMSK9T0VO54sOOA/pFjaEzbFhaQ?=
 =?us-ascii?Q?sMx1Vn5D4CVJkcCNI/HXwN+XvNPTNhoA4+vdIImz2WI8Yqm7fgEIBn9njXtz?=
 =?us-ascii?Q?YayCksI+aUy8Fy2l+Lv3IGkeO8kMtH+yLRROXxh+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 189f21ce-fc0d-4601-2d66-08db1094b7c9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 03:11:52.9550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkvN1xKak/U+NNVWz6eN8r8c7JILRudnuVtW7v61ePTHFGosfCJM2rClvpyeN4t3Z69mZ1xbrv74f9vecA7RcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7818
X-OriginatorOrg: intel.com

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   221424b9d0cea049e58d5ad93fcec93c90511744
commit: f4b2488987a8152607348f34add9a6e858e18429 [8460/9999] v4l: vxe-enc: Add Device specific memory configuration
commit date: 1 year, 3 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included more than once.

$ git blame drivers/media/platform/vxe-vxd/encoder/topaz_api.c

f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   21) #include "fw_headers/coreflags.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   22) #include "fw_headers/topazscfwif.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   23) #include "header_gen.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530  @24) #include "img_errors.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   25) #include "img_mem_man.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   26) #include "lst.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   27) #include "reg_headers/topaz_coreext_regs.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   28) #include "reg_headers/topazhp_core_regs.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   29) #include "reg_headers/topaz_vlc_regs.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   30) #include "reg_headers/topaz_db_regs.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   31) #include "topaz_color_formats.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   32) #include "topaz_device.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   33) #include "topaz_api.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   34) #include "topaz_api_utils.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   35) #include "topazmmu.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530   36) #include "vxe_public_regdefs.h"
f4b2488987a81 (Sidraya               2021-11-02 16:03:19 +0530  @37) #include "img_errors.h"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
