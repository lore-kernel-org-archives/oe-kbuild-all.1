Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3740423AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 06:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686552140; x=1718088140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ut2MU1fVnIh0xZVpmHIajAD6LrQpFKE66vxd4UZ5s04=;
  b=YAue86VTKHSyAPt6+lqKndJEY7MNhFVpu/KTz9OBm0N479GEkIbaoXTa
   dgUGxqjLFtPU0QJMY9FKr9p51A4DZ5h3zFjk4jdeWdVj7f4dTCWZbo5S2
   K643342w2pHUQwG1Iw2wRo/o66S/FzUSHc6cocjnpiiLjVUZR+PRLf8nl
   6zAVHAILXfpX8LSAOb5SLrozXdAGPaKvCimZBi/dr9WwhbWR+7aj9MvNe
   KpmuTIP6KKsAevUbcUEk/k4a4/RhdrdlKyu0pzv5Lwg7zJocD0DkIrBxG
   t1DJ/ZiBLRoPzcl1l3XYC4c89YupgTLwsbMoOFt5imw6MWpne+aK/9Xg8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="423839711"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="423839711"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 23:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="776234438"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="776234438"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jun 2023 23:42:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 11 Jun 2023 23:42:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 11 Jun 2023 23:42:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 11 Jun 2023 23:42:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 11 Jun 2023 23:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncIEGjFIIIhgjfCEXTn2gJXsysJlMdHsRSZqyMGTCuP8/TgD0E9gzPTALzl16iPHriSI9UjKzz32XIQRR+xVsgEIO4hyGA/X2EzvZy2esHZ/pV3lodmrBjGApqYfedkD7PxE5FQ2BtVKIP6noGwDuG4l4OxEm1V65tGnJ7HMQEsRvHMioa0gNVaPsXi0B8Br93sg1uEoUzDxAeETp2Hfj0mpnxFlX9hvkQkAsl2rP0xpJqESly4eospviJdj2gs2GIFYeWm74mJzOUdZa7E4fxEPg1eVlkYwjzRJxsWLx7MZuCfy8UREZuUXDgb7zhraB2s1YQGVqOghimknFttmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hepi3SpiSe05UVv6ys3L29/LCs1U4IJ/Ph8YOg6g1PY=;
 b=bAxWfD1H27v4RAaNdf6u6cHqlig54oDJ+KXQR5sLyl+Rz9b4PH3FQAiRSJUTHFpU21bXWut1kI2iGRlR64nNFUfc6folRgJQ6sJUn4afG9MV1X7Jg3L/14d1+WHfYYUJUtcdga8Q/MAunGkEsJZJhm6ONZUtYj8DPR3TLM196zZKqpAbv3wjtXuq/5SynEY7Is2isnB1QxSKHM2K+COKM1TSFvoNoBTfHDHzyiRz5CT35sIn+MJvnXSQAUeojE/9sRTVeeQ5EUBI4QX5B2+1EeLKIHwHGmay4gyqHrlrel50AdoI3MMApXhycNhoQ38uuxDG05FSF977Z0TuNyy0dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Mon, 12 Jun
 2023 06:42:15 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%7]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 06:42:15 +0000
Date: Mon, 12 Jun 2023 14:39:07 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Rob Herring <robh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [robh:dt/header-cleanups 18/20] drivers/firmware/meson/meson_sm.c:
 linux/platform_device.h is included more than once.
Message-ID: <202306110817.hE7USVO9-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c76a747-e1bc-432d-4c58-08db6b102900
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ofeb9/vtP1zHR44+APacGCwh2CEv9O4p5U9OUKVtQGd3PcFQj5hWaoIhKY1+8Pfwh+w8sGhXImuifcIGZ0As9ypMbkAHZ+esAoQN1yzPSrCZp2URyIpxMEkQcgKdaM8eoXszPdd3+hAHW/xCWBRp+cHdvmJFxyaNpr+E/eVN5hzEQrQ4PpSPMEcRWt/+kKNLPtC0yXUKAkvYXO2s2jvH4v1gk7Q3EBi3RYQ/e6EbC2smzV10PLJllUCnV/x4MxbDROwPzFk9630LTOf8W4WT7bLhVkoDDOjjCsoFtDASMWmw6HWC7h6xQmYfcDD+kt6cFNVO2VrPrSXLpi1kNNXkvg7XzR2LBkdRhsrudsvErdCPrqr45wJ6bhM4IHCT8yaX1T/jXGcM5EQlhF+p3qYPtbaBUHRjXDDWdVfSBD0ZJv6lkmMZA2Giq+xn0dz8rRUouTB6BKzZVc7I+2LMwUdnJQh6vYenVXnNp1sEqEzHrZF95i9JWnthx0uvVprJBSxwJMxQ0KWgC8EtEl+BGw5zH5qe1ZhdIzlrReMLA+RQAZ5ifE3aBWrcJUd1PxMbUNKsA5mXs3kkqVlBUFu4wtpbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199021)(26005)(6506007)(1076003)(186003)(2616005)(6512007)(83380400001)(6666004)(2906002)(6486002)(966005)(8936002)(82960400001)(8676002)(36756003)(478600001)(6916009)(38100700002)(5660300002)(86362001)(66476007)(66946007)(4326008)(41300700001)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/g1XfKTWGEJMGV1grn6kvNSIBYpdyz6Yo/gBfzCj5W97kewFC432pz/NFFZ+?=
 =?us-ascii?Q?U2kVC5Se5vrZryltQlImXJNNfrSt9P4lb1Bl2oBQDmykQQyou5EUYI1JW2wt?=
 =?us-ascii?Q?DCQYeNeXVrJU9BSp79DeCxmO9Tn/6X/PRx5YN0Aw0e2jNm4xagyKpyGch9Gn?=
 =?us-ascii?Q?8MnObFx61moCSNVr4Bv8sps5ntq9Z2uk4jBLN6szMhhK16VWr7jhgBdrSMed?=
 =?us-ascii?Q?CdR6s23mwsAH5Zdz0q3GLS+7BbIWU3EYlWbYo0Fqf/dwxINi5iSDejc6l6dH?=
 =?us-ascii?Q?dPcLkscZ9R484P3ZGFhGGjvzgNyRtULNTAYAxZYQfQL5xywa0LWtbN/u6WDi?=
 =?us-ascii?Q?VhGYY06sOfVONeMKhpcBfdnvID+vy6igi8UqqsYyBzWEa2ZyjpCB9tv+qAnv?=
 =?us-ascii?Q?uJwSqZaBlx6hcsn69MQh3blLECSzu5a2KgwRCrVVbm5s2x3/GnyLQfDXiNgV?=
 =?us-ascii?Q?SR3aVHZPBmNwH2WyQa09MWKMx2LmvpUeb41Wgl9ixDCOLEgSIOgtOZWvPtT5?=
 =?us-ascii?Q?EvZRMNjYK0vgPI/NE7JYVhIJSdQvHPdQB2Lt4Q3mQKkgszDsnpBM86+alrF8?=
 =?us-ascii?Q?YOa+rXyM4i0BrcXysczLTQwb/cfNKkcmfRahxyp6WCE1xnSkZgZrhjBAdNab?=
 =?us-ascii?Q?v2eXVzpp45WswwvweMEc+4B7BZgglkyVv05HhIkj4n/hcf42F1jc0peLpYxz?=
 =?us-ascii?Q?pH5sGWpwXjhEMOd/xt1KdMTg0NJH8FBmK+SGp8FHZlxWEjsStXQzZ6Ludj/F?=
 =?us-ascii?Q?Mf2/7fC79uOmJs7j8W9xSF4nPIrww9XtlYbcYX1t43TBE6eXY7PVWOSwDCk5?=
 =?us-ascii?Q?W754OrIpSvOnN066NO8pF/Iq6N+N1oBs7cj8tdGd+a1D/iolFGPbwUhyvZrB?=
 =?us-ascii?Q?KljqZBosMV9cDJtyFQ4uHw+CiwrtKRCzp6KNZBMZnCy7ljJWiDOOZvUWOFyz?=
 =?us-ascii?Q?+ta/3x2owNre1hGTlujHxAgeUAfS+1q/9D5sYYioEY2sG4RstSMD2+I6umP/?=
 =?us-ascii?Q?RyBQZjmVFi3kXRdj+OkCm+niEop+00SuQTSD9e8OqCxrLonmOAzkuHKeU+T6?=
 =?us-ascii?Q?xCeSkYNtN37j/oDH3LweREAVqiZJQeE3asz2lFQj8KrYPeEIj7kMXFjgHwZl?=
 =?us-ascii?Q?OVVVXZvz5WSKDQy5UETTFFzeuWCi+njsOHxxfZBND4wHcHa6HVkSv/Xsncdk?=
 =?us-ascii?Q?hwFdM7KXynpi9bQSr1F72XgWCJaaZF/6k5xFAISb5y2jbWXMBNrQeysQprP8?=
 =?us-ascii?Q?b3PRJKokf5M1yNQnMfk8PFcRbEsT94/zfw0qM6DMQnm5vAX5iwdePAtZ7d2R?=
 =?us-ascii?Q?+CvHQzX8byeovyFS6kBp+aAWldgoQtV5HgzMnHJB+SHS6uDpVWhzQURcw/Ky?=
 =?us-ascii?Q?+RL+TGLiBnj/MT7S/K5QK+xN5i0zGLjMv8nBHcaXwima+OHpU1t3KnWsTrFs?=
 =?us-ascii?Q?RdvDfa01jtEsgySZqDqDvLMFLT6rGBbxyHmzluqykRJ6ZbqYezWrVRLnRRST?=
 =?us-ascii?Q?vq6UQwkSTQsdNyeeg2Pmi9NJ3a7ir2tYfqTLO5IgyNy03AFb2aod8ZpXtqya?=
 =?us-ascii?Q?75OS7k8NdNuQrVU6mAdtHP/tEieGHyoBLGCSvccH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c76a747-e1bc-432d-4c58-08db6b102900
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 06:42:15.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mBN2yEPM/CZYIK2+j1MYa59gwwbV1sF9NiC44KN3qq7oC2GStSTjQB2akUmja8AH0f/bQ4xSWucO6JqClDqOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3118a5812ec5b3b83ca38f2d1c4162ccda268c0d
commit: e5f3e4857d32954dded294a3536c0d97dd345921 [18/20] Use of_device_get_match_data
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202306110817.hE7USVO9-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/firmware/meson/meson_sm.c: linux/platform_device.h is included more than once.

vim +17 drivers/firmware/meson/meson_sm.c

    10	
    11	#include <linux/arm-smccc.h>
    12	#include <linux/bug.h>
    13	#include <linux/io.h>
    14	#include <linux/module.h>
    15	#include <linux/of.h>
    16	#include <linux/of_device.h>
  > 17	#include <linux/platform_device.h>
  > 18	#include <linux/platform_device.h>
    19	#include <linux/printk.h>
    20	#include <linux/types.h>
    21	#include <linux/sizes.h>
    22	 #include <linux/slab.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

