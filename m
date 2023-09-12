Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B709448
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694541492; x=1726077492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JrU1W0krdaY1GyC1H/fz5plk3B5dVPtRRGJcQ3YucSU=;
  b=FNBhxh3qu0ZqpkRWD1ET2qTPQtntnRytMJJHpicYvhQIXZXCeYOfmPPL
   XMe5L4lVISvzLDKjYcj60voQjBAe81jWLScYCyP1Up4F5AxDQoDrMSKU+
   LnYqdAvW1Z4LxOErgzZNo1uqxOA/Pg0qg+mWufAx0EfODz0ozV9T/x2yy
   EuN+xGHFlhIavv/21EfbA3rFbTnFKWHgfYpAWb9L4fhAvM9Hcr8RkMnRO
   49wdcb1hcoAI3V9m3ccr01GLMNnQpagBOkeyr7EKv6VTIqgj4/FIEFBWz
   iP0h8JE2WzFyZE69yEHnC3KLa+lt+VsDCMW7B0ulicq73U/kQPwck1ruh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378359133"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="378359133"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 10:58:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743800720"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="743800720"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Sep 2023 10:58:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 10:58:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 10:58:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 10:58:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVB48pl7cQu5L1EoGQxI0kQY7Q+rh6gmGq1x4Oo/PqKh+PFakkCZ/uLuckEXYa2xmBwgzJMcyHfzcSF66SLAZul2apz594/AO2sLLt0S8CyjTlfz7oRghX3XsRgBa4uOiXGKa1ne5gqpkX5spK/8OfmXrtQ7F6YEfl6gAwXkyqLAcXsA/LlNUhtroKGQL9LggTWJqeFhITeZTYvNxyAvUYaQJSLxDSwCm4HYTjZ//DkeMzGTexlQMg7OsHwUq7g4X/Ljqe0y3itKYZ+mKhLWS28wovJyIVC3Ay6dRUyGbf0eNs0Ic7X7KnKOsFpmRoS78ahQiKcUPyKLwMeltwfI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fb6b2cq7Vkd8f43wdzF8oNzrXTDXp+JndHcVNkjvp2A=;
 b=Hi4octeBW4AVDVyBbUGGTfPLYp4lmYbtB2pFbJR6vBO4Mc4oBHTahPf+5ZeSbp59LC7093KlBrvDX/86u+ZS7otMK/EzO64tStnbJBSd/xE7/wzWuA5xPSx7cujRLxCUBF6v0uT1iw7iOtMkEB9AjwORSyXnK/VGD2jKx1jt9CHDe/cDrqZ24iTkDMPXmM7zeaHhEjGhnIbBX7eSwxq0wkwWwBGT+NNR0yPxMw9aS42i8YoYhPEulctjErAZujIyOuze3NJiC4grdtW+F2wZr3/THSgQ8mz+PUW/ly+MzBv1joDPFs+O8NqudipaVl0viETsC9lKObk5lDR9pdnp1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Tue, 12 Sep
 2023 17:58:07 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 17:58:07 +0000
Date: Wed, 13 Sep 2023 01:53:03 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [hverkuil-media-tree:hdmi-dbg 2/27]
 sound/soc/bcm/hifiberry_dacplusadc.c: linux/kernel.h is included more than
 once.
Message-ID: <202309102328.tIiTqx1m-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG3P274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::13)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH0PR11MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d084ba-3bb3-4b72-8510-08dbb3b9d1b0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C+qX6NZYvA99Y4Y5lvx+F3IKrBt88AQYaQT4BxwtpJqz3QP8nHCHeaV1fY1GJQHbM/I6szzFMfv6JPPB3FpdJR6sEsCxjTR1E8SQwgziX6Evf3wYew6KuC8AurX7EYCb3RqJs0g4TT0gZRtTaVsZYbNRAxxfHERGy7mYlmh3nWEsSMssdcKf67pkehoirFSyf3Oovu8h7t1qVk03PHU6zprWQNjmVTFcdnm12ywRZ1IWQptZMA6sjcaCy5tXb9J7hEM13EFCyK4Jz0sbPtshl1vi95VK6Hv0TYTRMgCF8h/2JiAtwP8X39u59GY7dkFI9NGJiRsRItIux1To9zgO2bZXkA6BRGYJClixlpLwAtTjiaD+M7EZm9ZOT+y/FWNv7xkFl/eWYwNCOxu3m08JiS45V5TYJp0dnscgorlnYmyyfSTVp1bIjlSge1tdCgU9KunJXWvFKw4FiaASqF5q9Ho9X49txdPSxukPbJz4Z4Mg3Rbmyhqvwy9vtpCHp9/mjYHpIou0NKy9F0PxMQ6hsOgr3/pvyTR7HE5smdjN7EwdwqSl7LtvIUUMsGJ1pPu/YPdBLFp+9f3UPMZiHMJySA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39860400002)(366004)(1800799009)(186009)(451199024)(966005)(6666004)(6512007)(6486002)(6506007)(2616005)(82960400001)(36756003)(83380400001)(38100700002)(41300700001)(1076003)(66476007)(26005)(66946007)(478600001)(66556008)(6916009)(316002)(5660300002)(86362001)(4326008)(8936002)(8676002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bsK6yz15GdHBsGN/44gdt1sR0KXCElUNxHg8+q8Hb8cGa9v7GRfM64aWXIIT?=
 =?us-ascii?Q?ts39NTcDiI2Xs2A8kdZhGKIcUUeR456aQJYkeIZarAuuBX5kBTu+Zocrtgqq?=
 =?us-ascii?Q?exY5RH1EhBUOrHkdXOVDV4EghtQhnHmyEczZRAoGYmyp/9iMFdt/xYQxXdsb?=
 =?us-ascii?Q?GHYWAgnpbqIPKHCmRO4uSmLzmppD5nYuRS1406KJMR6X6Vt7epYKVXDd2SzX?=
 =?us-ascii?Q?qy37pk5EAMGeqO8WEFwWWIjY0lg47DexyXSwC3JWxns2w/CPFGG1ieT24KUI?=
 =?us-ascii?Q?0sW7EAgqsxauNicnLFkPYTikx9cksMBlc/dO10FOzODpXV1Fgry12fnPapTy?=
 =?us-ascii?Q?gsY9RGIEdtCzsz5TumVQWmN8sCXIMPx/nQgCMYPUG4O1jKNmNIX3RXl1CZj3?=
 =?us-ascii?Q?spHPD1YNHSrpNRP/QHUWFbRY95nYuCcqk7R79pPo+9Ovn6I4Eqm/+phQiLtK?=
 =?us-ascii?Q?+Lvi7+btWzmg5YAkawAqPQfWBGsqZUM5H/e8/lo73zftgV0II0nZMgXetAzY?=
 =?us-ascii?Q?JxavTuuv6KbUKPSk3jSquRJDQ25JO2SrK3brrr8ipfUipnxTrYIqNCEyzHrt?=
 =?us-ascii?Q?EdXECq2c3AaH4mUKctfyGrSzCCFgPpO83tGU8RnCFBwF50gOeVAKO5woEq5Q?=
 =?us-ascii?Q?HA+ZjqSNImnhPbh0HZ6jkC06Tli0I1rcODlHfya+yww6GtdBSGEVub7eXICs?=
 =?us-ascii?Q?wBzUUmayahNB1MN/FMY6XTL8A+1EEx+84oS+H3966MMoufev6I7/PQAV9u3O?=
 =?us-ascii?Q?HZDvm4QPbSamPpAIk0Qnf3umBnHgKlt9GyLxoGgrPDRhgagYHu9sjO0hZbxz?=
 =?us-ascii?Q?fA6bdiZLb/PF46HgBMLCIAWq/qBiVIx7gskUNd6iPrltk41cWzmyfycoGY7a?=
 =?us-ascii?Q?eojEUYiQyI4zrMoa4qmd0YxrHdkmAtt39Fbbgy/RwoLOg0gfBzQNSqY5wD3g?=
 =?us-ascii?Q?OanMnso53LyLtELb2yYdQR3PBptVshyCWErIHc0uOpXHGSOo5xzc4e8mc/n0?=
 =?us-ascii?Q?rACD4iq1MUfO2ULg/tinIdXLyUW2oQlRW8Jq8h0zlFmMBd+ZKeuzs2pk0fGq?=
 =?us-ascii?Q?i51mnUcaMkqrQjf1EwcQvrbpLJIUMj8y4uwaL1CjfpH7VyBV6TK15wOR9ubF?=
 =?us-ascii?Q?t6NP6592UiG8W2HlyIWp23sIuoppMD2ozLfJnIcGif4NNLVshvJIIprBYbMZ?=
 =?us-ascii?Q?xkyEH9J1nod2RVFC5tOz0ZDZ0Tje75a7gs4vi/8v3MNwnFXY781wWMudHoJE?=
 =?us-ascii?Q?GCWRCBLwhR1eOBN/Ab7/foZfvlDqrs2DEu5clKcsFw/aUpp+7fs8mCxupYf+?=
 =?us-ascii?Q?eh71CT0ftV3EOR05t0QDbkBRLZiuW1i4SArXIv5BW2fnFgzhoHuUc0AYCbmK?=
 =?us-ascii?Q?O/xNYvsHC8sGyiJ4SZ6lDrTjrhfsy7s6DuzFq4rLaIm6m0UArHjZsDetO89S?=
 =?us-ascii?Q?MALaWOs0w5qmoU2MNqewYFrl/eURAnBiMuB423231EvY/ZfXymYBigQnxmzB?=
 =?us-ascii?Q?AvAJrV7TT6LbVMU/DJ/F1nlJ/aSEYDAS1lik/UfMQa/bAp8untDAM2dh+ELW?=
 =?us-ascii?Q?A6ZhrRLWXvHHYntf2iy7P76n7ASzeQujAi+znoS2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d084ba-3bb3-4b72-8510-08dbb3b9d1b0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 17:58:07.2618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGoR5I1k0NBxTd7HQlVBNyKYuIGS7viryqUMeHkyf4Gp8VpMhz3QFEhH8li0sXaQ+ETmNR5XPpWKhwJiKJjE1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5205
X-OriginatorOrg: intel.com

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   4e36f69879c101236bfb136deb83de210cf43046
commit: 6f24fe32ea9540ce2945d64d477fd3babd4b662e [2/27] hifiberry_dacplusadc: add support for the Hifiberry DAC+ ADC
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230910/202309102328.tIiTqx1m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202309102328.tIiTqx1m-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> sound/soc/bcm/hifiberry_dacplusadc.c: linux/kernel.h is included more than once.
>> sound/soc/bcm/hifiberry_dacplusadc.c: linux/module.h is included more than once.

vim +22 sound/soc/bcm/hifiberry_dacplusadc.c

  > 22	#include <linux/kernel.h>
    23	#include <linux/clk.h>
  > 24	#include <linux/kernel.h>
    25	#include <linux/module.h>
    26	#include <linux/of.h>
    27	#include <linux/slab.h>
    28	#include <linux/delay.h>
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

