Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4925A8F66
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694542276; x=1726078276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mLGImyGnrC0UofcZwHVQuXy/zi6+kv/FQ51WW3N1buo=;
  b=ebFcdYE+mhJqaCjcfuFejVoBok7T5rqhRUMq+jDk8BpDjwztKZ2BMJxI
   /ltY7ubgk2zD1gj1YJ/14d1vKaGaU9d9KhxaU+P5LJPNL4ILdMwuWziYI
   0WXTxGAtLFhuQmP39AT2dD1Q8Hf4rIW6PM7GE9feHb9Ue0jiT6g5D9zxk
   aF6nYNB7mL1MoI4Wg6vSQJhL0xZCxlF2ExP7lA8fp6lHzKOn2b8LDgAMs
   he9yL5AjYEwk4ME5wEfs17yn2PByPw2oB8yeD+oJVKAAn7vl0L/xa3Axe
   ZXOQ6eU8p6yd/UUjfxWCnpqeCF6P8tTw3gj01Dg9uOUf3HwOyok9qxBpk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377370085"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="377370085"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 11:11:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="778900503"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="778900503"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Sep 2023 11:11:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 11:11:14 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 11:11:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 11:11:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 11:11:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jifvfiDqkBw0gpEwTqxYyEV2ZkjS0Y/aBlCVygYmZMxPPSn8wnOoks1q4tZmyJIkbs581hTRj/GrOBYvy8l0FptRLkhTfjh+88VT12ko42iivkhuhHqf4eM2AGHJBKsiA0grdIgzvRT99euWwxi38NPbksou1ieAW+jz0ZRD2xxNhVVG6WLzd7EwZ54JFjzvxeYWF217cb8jRyQMWhrospS7sp+e5KrmcAehsyaQjh/BGiACcelfsQpckWv7uM2piQ8Hqgvi7jgmkbMSrFJZA0Dvjs4bV9gppBeOKSMbrk+1473WbaExkexZ5OMlJIiQQW0pIQXG0KBnUHoc+hqF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1n1Vjp55Vy+j7KINZgq+TLbtkTJfVTwE8XGGmu9+FpY=;
 b=e/fVaqrfJenLDgi6XF9gc4CgQv0RCXM4uQ3UM15XCLvSgSiY7RtzhLtj4eOmWUa4sXUxlcGBlH3/EPqTG2lhVin41DOLfewJTjWHk1zNgn0WLXdQ42udv4uOdtvsKnKafO/1FoK04MLd8Jws+tYd3es4H1fZBqhLSdEZCwAsPvZAxw0fmJIM65Qq1940rhPzPqF79OiCW/QFS8CDSgZwr26+UfSaVnH/4w+9FzscuM21DMpDj7LxSPqs3W55AoOxMDut4/14q+OtVYc5SnJ4mxYF/FSsbnAZEHQ2dCEH0dbPcmlDOXyX3NF7AK+FM2dqy5Tr249Y9Q3i4NBYx/iyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 18:11:11 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 18:11:11 +0000
Date: Wed, 13 Sep 2023 02:06:10 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Rob Herring <robh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [robh:for-kernelci 5/68] sound/soc/fsl/fsl_mqs.c: linux/of.h is
 included more than once.
Message-ID: <202309031400.lChpIxaI-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CH3PR11MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0d7508-1958-474d-9570-08dbb3bba51b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: prDvin4MFms54egmtkIUPVVh8JcOCE5ESe2wH7KImwv5doJjZZ59anuWXnq8ah7mVSTje9KakWG12DBfLJmk3Xh3EtmwXPdHWfKctOEsTrPx8XXnQIo4KrYWYqgmyitS5ahpcAN8GhOzEIwVs/Yp+oBKV/dAw8QjJh9/9rSHRVbpc7A40ox8akveHcr0b+Xe7SoBQl0ENel21CkAMY5DsPHwC2TyXNojduCA++qh0//Z/+XS10JSOTJu5KDXlGS9q1LIKfIoKqrW64ferd6P/QUhq8a4htinr7EpBqFdzrYdtr891QnPylMEg39q9dnoFg0+fRp+PmJ2z2SxyKCknv8U6hjk7v/DfQiOymZBIOtmvCUrZvdeWbjhDGnMVs/SxaJIKx5StBDXUYkt9I2JDoKMtuQMk8k8fteAEzgw0LTHqUHeX/DuX8S8sWYXwsPqx/Mf9Tp+YUS3lEPtosHiMh77OTKgHOcCn7HufhHcvlNOETz4HWmi1nI9JW7wO9kpBiJkRGUiWW6obbD3Qu4t8CC2ZXBQ3v24ZidV1oQ0mRBz51BIP4jQFF7d8qIDyZu7d0RVf9CA7c3XxQx00YF7ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(1800799009)(186009)(451199024)(26005)(1076003)(5660300002)(8936002)(8676002)(4326008)(6486002)(6506007)(82960400001)(6512007)(2616005)(83380400001)(6916009)(478600001)(316002)(966005)(41300700001)(66946007)(66476007)(66556008)(36756003)(86362001)(2906002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+qWiPuxHCvFY5GCyz1kOota5iuwNuKJGc1Flhr9fBe5fJyoYglRfd33aopDu?=
 =?us-ascii?Q?zXyiObQgYsnfS7xvY4o1HUJgswhVyuJ8cMF0ptUPi8j+xK1ZhvAcM7ipwgLt?=
 =?us-ascii?Q?7Xh3owdkrJ1pMZ0LvBQdxxZnSDX5C/f1TRZqLORbs+2qetl5ZQdRofY7Xps/?=
 =?us-ascii?Q?7Hr9vacLLW85ADWRaUIBQGGH/FrW3oNyZE72znvNvXTLe0X2QzKoU8JRUWtg?=
 =?us-ascii?Q?ARluwEvC5Zh5oKLf199C0Nvn+gKhtOHd4KnR3Pwjl/mmCJBGkDkZr/+iVyRN?=
 =?us-ascii?Q?Bpp8HntDdXSp+SQB+yG31tasKHR1UP71IGNyAR1o74BmBLgBZu4fCqaDHsms?=
 =?us-ascii?Q?IQXFFeHVsQlS9G0/3O+0dr/Zrr2+x2QNXwKpKxcBcgjKUKcsUoCKUpbD8uPi?=
 =?us-ascii?Q?VFEnKYEVlzMt95xzP5VuYuune2DsJ6wlMV5nv399ZMrjDwIR0eTWxvSGqh4y?=
 =?us-ascii?Q?zD0WkkuEpH5xK+fvl17smsV7v7xKofVHakevDNoorkpwtPR270bUqKYuRCxh?=
 =?us-ascii?Q?yvA6zwUD8QoVZ9E7ClED5PO4iFAv3p9hlw0vATDguPH+kKJQzFKUhMasiC+7?=
 =?us-ascii?Q?7RmUkzakbKcfX8qxQll3Nv1zoIHt8ek16du0T59wGbfwfF1Lzs0tgErVSPBg?=
 =?us-ascii?Q?IoIcrISpIhdMHvCsmu82BixCWT0TgRxreyvsTDIXiIiu/4QWFxQ0C/3pNfTc?=
 =?us-ascii?Q?YEDHvDvwvLJ3gHh/C86DtSlPzs+zWNsfmYm/6/c4NDrThcum9Rw5grCBcZSg?=
 =?us-ascii?Q?poJa/5xUHfJlcI07LvpjrDg6G5oa0WYCWH+9OfuvpfG4WZi7sTdWX9rDw+8H?=
 =?us-ascii?Q?vxkgOm333U5cMGQ+r8JiZu4AnbndSS34aAQPvyoj6xbuS8uubvoKWaI4haIV?=
 =?us-ascii?Q?7254LmO0GXtw3hm3YvmTrh/hadtxLgcCl04npMRpFMzkIkmHQgNJ9T1ZB7PC?=
 =?us-ascii?Q?ypfczGFnCsMyvq/06JQIFmLiVKyu2Tt+brXWmUQADBtZhZ2kprru/JdAWW+i?=
 =?us-ascii?Q?v3V54EmyrhURCoK4ndvcQefdfJp29AxppprrDcuXe+yVs1sRQgTuskiijMH/?=
 =?us-ascii?Q?i+GmMjMWNyVZoyK1PCfSJAfgbDhoad2RiEhdxA+7iak2787jTmgPcv/WwcGp?=
 =?us-ascii?Q?a8LaIrjEX9lCORTRx2w0OF1KIFzyYZjzsE+7EDg6EUVtsm9mfiM/VHMZci6+?=
 =?us-ascii?Q?d2RWfrR03bag/e7S/t+QCLWgTSHHRutMs6iDNckdt+2ViPca+fTzU3UrZa5M?=
 =?us-ascii?Q?oxemaITpr9uyjXOl2Qytf0bhfGuCxhJH9oZn9/D7QXaw/Zi4APHVnP9jDqkM?=
 =?us-ascii?Q?EINIMiAOeuDqWkJiu41aJ1pFVisB3zg66hlQXZxE3GQmKCK0sY7805kIkPLs?=
 =?us-ascii?Q?ax3gKkXaSkOTzRnfpbHlzIZSvCHULqCY0CEDq/tER/sC+eVorQlifY5M1Mxe?=
 =?us-ascii?Q?neFTKKxFrhbJ/GX1d/FoKR8juVihLNkYhcM8pCNwdiPHRzD+lUUg0VLaHgAm?=
 =?us-ascii?Q?C/p3vZObh18NZ9Bf+8dY2/uD71TyTV57ySivsqZWzjICStKsDdlJjuNFzbsK?=
 =?us-ascii?Q?WEWjTC/4m9/PP9MyfOxHhLYA7mvwqCpKm+qrY8rQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0d7508-1958-474d-9570-08dbb3bba51b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 18:11:11.4390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUVHo5RoBfIvHM572rp7ec4U1s3FbWinfQgbEBZrffyMqYa4auUqdjykdgezAPe4b7+L0PA2NPE77b3QPXfHhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   9ece0c059fa7600e46d8e2deecc2fa1bd86cde7e
commit: 464bd291819a7bb45d817c915bab8f126fbd7191 [5/68] ASoC: Clean-up DT includes
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202309031400.lChpIxaI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> sound/soc/fsl/fsl_mqs.c: linux/of.h is included more than once.

vim +13 sound/soc/fsl/fsl_mqs.c

     7	
     8	#include <linux/clk.h>
     9	#include <linux/module.h>
    10	#include <linux/moduleparam.h>
    11	#include <linux/mfd/syscon.h>
    12	#include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
  > 13	#include <linux/of.h>
    14	#include <linux/pm_runtime.h>
  > 15	#include <linux/of.h>
    16	#include <linux/pm.h>
    17	#include <linux/slab.h>
    18	#include <sound/soc.h>
    19	#include <sound/pcm.h>
    20	#include <sound/initval.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

