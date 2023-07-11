Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F657171A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 06:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689058462; x=1720594462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pd2xpV7tn2Iny3EVb+Q12i9V+KX2vo9WayHo9hlFYdQ=;
  b=EOAWGhquzbDZPuKdrblEIayf/IR6N8gsQIGwv/YjLnltz9u658anb3OJ
   f8kU/Oh5hO4TsVrsHNuR1nKJtnJw3RfiAuvlVisv5mqgsvQTFXWzQSYyh
   wMEMIa7+noncVct0BgqCz1ZWgvtpK+k0dEPGxLmdhC4kYIyj52gz5vakW
   Y3GuyYvOJKV6W8g2VE6XaigvHyoNgnegM8EZa0NHz7g0Lzde+iT2h5X88
   zj7i9lUaYOadgfc05jlNILLsXg9o9Q9iGkaJe5nvRXI6JnUxDOiXzBl1t
   3NE6A9WS9Zma/Bsba2KqYu2eSaPbg09OYBOQO1OVXFjO5r27dQb59sIsp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344861767"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="344861767"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 23:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="791092718"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="791092718"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jul 2023 23:54:21 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 23:54:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 10 Jul 2023 23:54:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 10 Jul 2023 23:54:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtI7cpfgdB+0jOu2nKfJUGSkNCDqsjL0/h4n3oDO+T0q0vSujbaCD14SY79MOBDKHC2JvAJLp45X9JvAdpOKsnvqEC0Pz2+we7+lfjQmsorbBfSsNatU7PgU7akfFvAR8OS0CKUcZtqWiDdishiWN817bAVtVr5GBNqnO1z3JGKh5Zn/QjYXwg9UtW8SmYOmnn4hcXlc7hCUTzbwK0cPV2YAV1hCX+KV5NNqMT9xfVvveLxKmLsKSANVpDbbosyMx3Fa7cbx5+Xt9qEloFTUK26zbKX06bBuSq618tRHO38ccsnMuDOHO67O9u5Sxep1E7NJUgwbzhb0gHIWRDYiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DERFiFbV1hPEcUcFmuFWDp7s6OY/dQYAjqZgrgB0lA=;
 b=MSa6wSJUbZxwTUlY9g7OHKyLa5jWB58ob6BXyZRYPn+SsFtSjthM1moKfn5r1bCTm4IUNbCwqTsYjCbokrV2WYeqjdlYz7ZPu/grMSFqHxPwwZZpJhRI58fJXq8sVXKKHdVFQX2KcdP1rXlaT1TuDHqFyuDdMmN/PVX1mjnM73lNEKfs08hQPdv+QBLUyEuFCDCOsDpZvRpRjBCzVBkmsfQx0klgv4Ie8IeLbWo15KDZUWva0JpB9UpL1xxPUVSOqWg8x7hStSQV2iv16LQMxhOd3HKFYgSGqsuWj55QKanynRT4Fyq+qDYYVTiMg+4RA1qjXPl+P1GtqhYARs4IaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB7973.namprd11.prod.outlook.com (2603:10b6:806:2e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 06:54:19 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 06:54:19 +0000
Date: Tue, 11 Jul 2023 14:50:06 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Joel Stanley <joel@jms.id.au>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [shenki:aspeed-xvuart-host-driver 3/3]
 drivers/soc/aspeed/aspeed-host-bmc-dev.c: linux/module.h is included more
 than once.
Message-ID: <202307071806.FEKZ7a84-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SN7PR11MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 1285bda7-aeeb-4ce8-ad8f-08db81dba637
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IkXqZcEgZ4XK70x/6X7g0FQ9FKKySVc3RB1pgDuDb7zLcY2HM2cHVuQMiTZQ4f1fwLQ89bnOxsdu6s9kyieMLM/LP42KgDJeIQJQ2NhmmdgVtMv/4rtajTuyVs5L8anb8LS8Wn9/b0oXMerKDli5ZHifi8tMUqs+Z98JWE5hrhKXCRqqlLRJCSot8ZyKExUPRjWrv9V1cU4GvI2t6/sWQddt9WBYWQ97p76g00uZHirbuhfpy4dOsPGcBjPeFpor2VoXdT/QSs7Ac4dHPxwAZlcuvPHVIqdsMNqT5B+GQAIyfTmk8LtVYdNn9z43gq343YgLpTVVGxdt/oumQxvl0DWOO6HM3sj0xZBwYrc7R6Z3+EVAt9Blb3tBSN+ZF5yVSjSnlSqOHdfiCRu2vNqEcrv0Fz87o8rk5eNhpPpBHUCMwBAsVhV5AxGaOE5KPhJAyOVNR8NrChquuNReUljD3mKUTRxMJZ4XfBoSd7CQIw7v7lAl/vHoL2II31VqoN3r8uB2XNh5OzAcT+S55AAS83mVf0Ehvh6Ub3ms8pNp+3ie8fQBjVU2df1Rnq7C962JKhDRz52A1yooDY07lHlopw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199021)(6512007)(966005)(6666004)(38100700002)(66946007)(66556008)(66476007)(2616005)(6486002)(82960400001)(26005)(478600001)(186003)(86362001)(6506007)(1076003)(36756003)(41300700001)(83380400001)(316002)(5660300002)(8676002)(8936002)(6916009)(2906002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qDNDrx7XePCfJ+PHMUFh4jMNO3BSCpx+HBwq5vkGe7KXWj00iFCmAg9TFEJU?=
 =?us-ascii?Q?H9n8zAN0k9ojlBuGG2NC+fewz+7jAi5ObFa7vkRRu+vJ83OxepyXqSKy8U5K?=
 =?us-ascii?Q?I6RkujiopabmBAUCwFGbl3c7rEKFbKjEtEooV65DxC58+zPQbe5rsO1dJui9?=
 =?us-ascii?Q?sIkil+SQnuopI/rAsGPCaKbVAPSO1ydhDeEMUFOAvLIpfUmdoK8Z2s+WuJTR?=
 =?us-ascii?Q?iuon88cIeChVPoTlbZvPdiY9h8Bcem4bELT5bLRf7VdiEuPCurOvO0Auhh4f?=
 =?us-ascii?Q?40vxAWjdtsfB00MJu34Vc9Y1stjDeMFdhtfGfUviIup04k9hjlz2EGfhrV6v?=
 =?us-ascii?Q?kxKra6J0qmu0LzvZvf5omV0dy5sLTxsavJMAj+eWdc8RcrUYgJU2emKCMMdd?=
 =?us-ascii?Q?RUAtNBOmPSY5Igj1DkLjBFmuoWRdV4/LuepaY332myzs7an3IAYlZYUsCy0W?=
 =?us-ascii?Q?a/2cGBstmotHLHUZMVYqDtYlyQHt+Lto+TAK3x2MAxiBNnvBkns1R3uQkhLC?=
 =?us-ascii?Q?JKQyKQiKgVMLmGLk9Rt7gVvjys4TpCo7UOygdPqNMGlALqXYdnTCDA9ApJGb?=
 =?us-ascii?Q?J9Df+qYva2DsTfKXadi71Y1vTFxgZGy/95Rd7rU435Dk47/B2Q5xkz4ocUQ8?=
 =?us-ascii?Q?CuSnToiKxYR66pP/y0AqW28OY8OlwyXiy5gMRj1hL0u7iiQ9pcLmBugaTMzW?=
 =?us-ascii?Q?HcbLGvcRw2M2sWj9xbLzRtnk0h6TlqKQDST6IjdyNWsPy+TGy+CN1IfXB/qL?=
 =?us-ascii?Q?J6mVw86htHrXoeJnzDbh93HfNkf9JR9vm+nS0wo98Da4NGtNpL7tX4c70Lk8?=
 =?us-ascii?Q?ZvQEU/2y227oPqePyzyUkvPeKK3avX+YypZ4AQk+cN09gRN5CVz8hNUgFS1w?=
 =?us-ascii?Q?4yyKwl8SYjKecWhBQjjYK6jotqmhWrQw0t+GorWfOuNLiVS/JMtnEeF/3sgX?=
 =?us-ascii?Q?b8655wKqK02UenM5DujXsOarV6mEqpBWuF63OJAvxrUw5aksUlGbd75GODKn?=
 =?us-ascii?Q?iku6CiuwbccwVPeilk0eucPZ3X/2mQ28zujpD4aWXpzUXY9Q8YA4a4xDvGiL?=
 =?us-ascii?Q?602RxAdYIdu+9vp3q5a6DWn0MTCqgEeL3cv5h63INousJzBbwSrfyf2wVcTn?=
 =?us-ascii?Q?CtX43kuSQvQirg72zydGd82lVI9sB+AODzprYnHYK7UOs45kh/LqAJFjUgiH?=
 =?us-ascii?Q?/Nl8NJHuHbsGB8wNZ42ygUlPTWn0gFZGigjuOh9KD/+JOgWb/iSVv3acmoLh?=
 =?us-ascii?Q?PhABjcw/Y0T4bTVAONP5lUOLawHwtzGULYMgaYrm2K1lK234WG3DCGuHnarx?=
 =?us-ascii?Q?xU4LLze+fnrTRWL0OBOCPvL9FfTgXwR7XiIsLsPE98OCiAHjMzR8nT+Bh/kE?=
 =?us-ascii?Q?IHH5iMjCBFsteuaZjbKxVqx3fzBdamvVDnSK17KqPla5Jxut9daClqQY5Ygl?=
 =?us-ascii?Q?c20n08SrCd9Z/k5IcpkN7qC8AoEzIIIBqLuf7bRdl6MLzOY5iw1Vkja+hsLr?=
 =?us-ascii?Q?cNrsYAn53MDI8sRTm0n+WGq5QpzGGvGQMGcEyG/DOz/S+0k3sjD0Xk2C24Hb?=
 =?us-ascii?Q?0+TSYe3hwwNwI0W3lwBQpk39ezOBJmBzesGWS5jl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1285bda7-aeeb-4ce8-ad8f-08db81dba637
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 06:54:19.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9fTTUVY1b7L1Aou84IXJngegy7Ri7CdpvpHRbJt/dgf6uf7da3HQWgJHDAHBJYl8TEUdZyp/PS/zMz/+VQ+/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7973
X-OriginatorOrg: intel.com

tree:   https://github.com/shenki/linux aspeed-xvuart-host-driver
head:   8384d7b383c2aff772d5503ddddd8a938e48c43f
commit: 8384d7b383c2aff772d5503ddddd8a938e48c43f [3/3] soc/aspeed: Add BMC host driver
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202307071806.FEKZ7a84-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/soc/aspeed/aspeed-host-bmc-dev.c: linux/module.h is included more than once.

vim +6 drivers/soc/aspeed/aspeed-host-bmc-dev.c

     3	
     4	#include <linux/init.h>
     5	#include <linux/version.h>
   > 6	#include <linux/module.h>
     7	#include <linux/kernel.h>
     8	#include <linux/errno.h>
     9	
    10	#include <linux/pci.h>
    11	#include <linux/file.h>
    12	#include <linux/fs.h>
    13	#include <linux/interrupt.h>
    14	#include <linux/wait.h>
    15	#include <linux/workqueue.h>
    16	
    17	
  > 18	#include <linux/module.h>
    19	#include <linux/serial_core.h>
    20	#include <linux/serial_8250.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

