Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1881377
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 01:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkuU5dsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696643270; x=1728179270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oLlIFo34Oc/wIdW1XUs8XPZyIluSia4zSeE5wHLmylc=;
  b=UkuU5dsJfYKdAdalg67DN2ZD0KVlEtGooawex2QpsgQdUfbMrw1lqR9w
   TMhJ7lsMmv+d+/xkIegIRps81AfynJjgxj1ql+zoFfjGLk9hUedvPjPfg
   K0O4VRyl1bWz+6qw1q9RXXmVYdCpoF+hqcxsGaN3/AB8VSdEwYwlR98kj
   etZWdceHeAbGZHYr/MAjUJAyv2cL8SZ18WzIbY14LsApc/+gauMNrt+2q
   RqkDVfwCpAuKbF4pbrHS6MPqByUqcOU23ha6Mw/IUmlXWtEO4qgAO1Ql7
   cKJCqTUAzqeranz0+c+Urc8/nC1UGUHjGdAN0CGYKk2woeYB6Qx23noW5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="381147091"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="381147091"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 18:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="896081606"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="896081606"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Oct 2023 18:46:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 18:47:48 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 18:47:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 18:47:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 18:47:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXpz/7JfogxIfLzG+fF5ZYdLg/nbxvh44z8btJXza6BcY1M9nqsVHBAUBodTk+pKRiJqkcsX+DvOsBOGcc4MvbZZTl4Hqm7IFz28qs47A1/ooXrF1dEBFNzWlGOGgmQvJoeuhZ7qSe9AgR76/FRK4KvEuWHT3qr6UNOBX92N7p/qJPFh4vacc0YTpBCJn4QcXFsJaPIhMyZUtDN8E4JbMtRV9w4nIXz6sVdmsJwIUs1tNQ58eg4sUE8Pk68eZXxVwabQ4TH27tIBWaVFAFgwtOFGJWoQnPlc1tulckYvOEtlIhT13bbDYHVcbCm1WGIPIhBf0ovnxFQ+h6hvr1CleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGtmVFWTLZGhN4kRPudxdtEQzf1H5XPBuf/W1tdFyA8=;
 b=Foc/B54KgSe4zI7v/YhNPMB25VUzEW0jW95xxvuPKFphvdx88Zxo6/G5S80GFgffs7DTikHrVqsL8iePqUNDUOq7A7N+UXY4myqhCW+quAIPuQ+TwFYj6Dl0HzI2D9lVfWE+7CdsZ4YYWeWb+c04pd62gtbLJ2ocIOVF80snMtKNeZ65BaPDwcYDk+NXLx9pafIV5aLKSsWZsI5TkAvH1OKxMjobRaem5SZQeg2UjWgrvx2oRWSikJXURBJ4ilTU75l9xSKtSsrcZ1EpOBqwjsI7lbjoddPqNv3uagNUXDavzeVXaCT0J+QTLbre13eZnsukaj5UGD52L/hzLvxAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Sat, 7 Oct
 2023 01:47:44 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6838.030; Sat, 7 Oct 2023
 01:47:44 +0000
Date: Sat, 7 Oct 2023 09:42:44 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Maulik Jodhani <maulik.jodhani@xilinx.com>
CC: <oe-kbuild-all@lists.linux.dev>, <git@amd.com>, Michal Simek
	<monstr@monstr.eu>, Harini Katakam <harini.katakam@xilinx.com>, "Radhey Shyam
 Pandey" <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 640/1370]
 drivers/net/ethernet/cadence/macb_main.c: linux/crc32.h is included more
 than once.
Message-ID: <202310021030.wCK5vsu7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 60451838-7445-44c2-f346-08dbc6d7665d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ml6mrmPlwbnys3wt1yFMQKOWryKOl0vGCRlFcN9RubYZVi9F2ktR/yx7YwUHbj9ZJkd+btrAWWaRUZfIs4FT6U4Px5fpi7Gy0bfxh+nw4W0m4SzWdoOMwO7tdPtB/jrLpggfs4+I6ojJQHQ/AHtA/Gp2zxffk3z+e0tBFZHewpzdHbSP9h9u3nh0jKgGzVrgZECqYfWYoZQZ3g/NfwDy1d7fCxwzvbEiETDpO0T3YpE3hq+MkWp+Xd4bmIWTxG2SedpsmfnoHSJ8tf/fBhqWBUdvfZErrgqYqgi6SIH5qJjBR02s+xmjhF2aVoWuKDYNrLq/uRsL4Onw033JCI9JN5U1UlcU/Yu9zKS7AvRs3r1TzEb0EUF88r13bZW0RaKBGLwr4NZxhraAHir0ztrBkxxPiTD5yBLGzoBrf5z42JrFQAVOJLg6A7dSayuG6Cuoy16DUqg6B4j3vKaeg99aGyDInhWfSzJgMC6cIGruPXQy929/iaBaxrR5h8bYHqkkIgPNBmdNiWM5gQseDEmVu6XNTF7Nxe5iy/fi0eOzsTsVrvYbdcWPvo/XJhHldb+jtPNNscBxA7Nk7KQoKvwNkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(38100700002)(82960400001)(86362001)(36756003)(966005)(8936002)(5660300002)(4326008)(2906002)(6512007)(41300700001)(8676002)(478600001)(83380400001)(1076003)(2616005)(6506007)(6486002)(316002)(66476007)(66946007)(26005)(54906003)(66556008)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dTnPSnXWhc4l6Cti+myHv8S2mrsTtVJxofKZPn+gaa+++adIJHJDoMGJ3EVq?=
 =?us-ascii?Q?I+JfDrYORhEExToOjXoY/bSWoC/yIRK36PQzu9s4sxHXNbemEUFeGW3fDu4t?=
 =?us-ascii?Q?mj5gLz/wL/u6zWom8jhSKM4UL7r/b7QQlu3mWHeF7L1yySrBdDlHJhSKEels?=
 =?us-ascii?Q?S6HyLY03MaYvhmawt02tVtuGQIF0V3ugxDBgJxoiR0prVrddjreiWO0ryEkY?=
 =?us-ascii?Q?Tov5A9IfKnezz22suJGZwC7bDSq8JA3LgMbLFYL7d5rM6JK6FyITqkesh2eT?=
 =?us-ascii?Q?/lhLc+t5tY1srB23BSty4nsXfqO4Sdq2i6fJMUVGQjItwn8aCErNo3Ir2NTL?=
 =?us-ascii?Q?0bWrlDYmKwt/6o2d0P5+o8bwxtvble4O2J/RO1j5ckivR/35V12obhdH9o35?=
 =?us-ascii?Q?qD62D/XIhwHsIn0cQPIMFweet3tlcXeQlNtiuWeGwAAfl1eHRLvlCckyUg8Z?=
 =?us-ascii?Q?+jOUm87z4RRGfwVbykAae/VvfDGDCNG66Cu6WPm2VKCSJvrQRv1Zhpmke+lT?=
 =?us-ascii?Q?MjD+4VNVM8IE8VJJxfGLdOAAJ1Xt5fUpQZQXGfTRloj2UA9vGcg2dqP8ZgGh?=
 =?us-ascii?Q?63jvVSb145FISdqjCWr5kMUMH96ebHnRCt+7ruUAnnskOK+6uRe+JftAGMQQ?=
 =?us-ascii?Q?AL+ewdPs8Uuh7H/jl52cecJxUTtNQz61fsprRuJMA6rev/oNoo4a3Q/mxegq?=
 =?us-ascii?Q?1ajl8K6Fvl3NqhlFxdDvS9ZAag3BJNMhGayYymIvpwARk0RL7wg4JA1OG7HS?=
 =?us-ascii?Q?5SbpKhFTTsRfNK23lmnIrA0myyfDKajXZhgDY2MQLgb0fhBaCpECfgtBb7ah?=
 =?us-ascii?Q?EbgaxsIrO8ggZjJBn1fyuCylGPP7ZQ93WxD2n0JhUEjtC7zRqShfmbrnf5xM?=
 =?us-ascii?Q?JZcmHsXCfOzx3eMLrEjfaTdM38jrZ17ohWRzBGd3ureTXU4RB5lwh5rLxS0U?=
 =?us-ascii?Q?6D+RFCE9EORWQA4rHRJ4FSM09cZrM/42LVnWf0kQKCOJGRYOUhTwdhLtFJAW?=
 =?us-ascii?Q?xKh0FI8iVz8YmHOgZGr6K3OrXmj9YPHPuyD7sXXhdjYIXDTqnsmY6CqC+x6g?=
 =?us-ascii?Q?7ExTje8613E2d9/TK9WHMFvZbGz9QAInAlj3TFnihdArlCRBIBKkTD4pcoCR?=
 =?us-ascii?Q?C5QRPbQpicg5L9csTGXADl5macQK+A3rEQV870zk00IKwaiqOZhXYQuIzYF8?=
 =?us-ascii?Q?qVf54AhKoXGqGSp7y0R+4n9H2qBN1GnoKpe23yhOFqIC7GfH+Fv8I68dKNEZ?=
 =?us-ascii?Q?nIJPWGwpo8cTQehZ6dtuJSIDl1aechsUGvLGUsRjqAZ43kGP7T7vo7L76VvQ?=
 =?us-ascii?Q?agi6fMu0jnoLs1sAVUf2lzpfNKyIxz8FJAXxobOy/bbRXNU+wQhyIcCrcwB+?=
 =?us-ascii?Q?pdx17NN8k24vdQOW+UmDoUh/FabxCTeOV0e+GSThU/OK2eavavQL/bfPKfv2?=
 =?us-ascii?Q?c3saEyvcYdnJ3POX3I6Nf39+h1JfKM2WtfqN66sJDqtArRLanMUT+tWa0+oT?=
 =?us-ascii?Q?ctUPcSiCTEpmlYZfLF/pz2ZNVj4uEkfH5CmrNNSOERyKSsPdTkBL5g03KPpC?=
 =?us-ascii?Q?SZ3AXJkg3DAHW4UfUvHU43X8MZDMRYN6Gzr+whz2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60451838-7445-44c2-f346-08dbc6d7665d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 01:47:44.2170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8LDh+Etoa/Ac3/n7eZNmcEfXlrH8q4xAEAX/nEqQpg0c1jR5FdEeSMNtu0ANw1XTf8W6PtxRj22TE1wJRb8IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 8f95a9789277d5c3a7d1baf48889559f1e9f3e94 [640/1370] net: macb: Add support for partial store and forward
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310021030.wCK5vsu7-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/cadence/macb_main.c: linux/crc32.h is included more than once.

vim +11 drivers/net/ethernet/cadence/macb_main.c

  > 11	#include <linux/crc32.h>
    12	#include <linux/module.h>
    13	#include <linux/moduleparam.h>
    14	#include <linux/kernel.h>
    15	#include <linux/types.h>
    16	#include <linux/circ_buf.h>
    17	#include <linux/slab.h>
    18	#include <linux/init.h>
    19	#include <linux/io.h>
    20	#include <linux/gpio.h>
    21	#include <linux/gpio/consumer.h>
    22	#include <linux/interrupt.h>
    23	#include <linux/netdevice.h>
    24	#include <linux/etherdevice.h>
    25	#include <linux/dma-mapping.h>
    26	#include <linux/platform_device.h>
    27	#include <linux/phylink.h>
    28	#include <linux/of.h>
    29	#include <linux/of_device.h>
    30	#include <linux/of_gpio.h>
    31	#include <linux/of_mdio.h>
    32	#include <linux/of_net.h>
    33	#include <linux/ip.h>
    34	#include <linux/udp.h>
    35	#include <linux/tcp.h>
    36	#include <linux/iopoll.h>
    37	#include <linux/phy/phy.h>
    38	#include <linux/pm_runtime.h>
    39	#include <linux/ptp_classify.h>
    40	#include <linux/reset.h>
    41	#include <linux/firmware/xlnx-zynqmp.h>
  > 42	#include <linux/crc32.h>
    43	#include "macb.h"
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

