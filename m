Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0006B1369
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 05:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691387336; x=1722923336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/qbbsab8Y/kANMnZdUVimjQ+afN2Ja85WhG4eb2dhF4=;
  b=DHKYLJb10YJzSC+ZeIm7SoXpN8PH+KDEgkWqUA9jDh2VJ/qk0BfKgujJ
   rZnKE0s5ZhdAjcSPzOb58kH/87PFBOPNEeXOI1HuE++FBAaCaw7WJFyPN
   0y7Oi/aoLWTihX4RNK7Ky0X7o8n/uMsFfyBgpce6gCt/g5tpJUbw46xMW
   13t8RzEkq+bM4pZ9+u9djMtiADBDGFOQCVNYT/cif5+gvVxjUPzFEBJ47
   1MgjwfYtnjBQa2I9s2hQgg1RyIA2ci0J+KYzbKKZEIDaK5pX8V2raiNP5
   ViqLip4A2SeHkOG1o8B/HAgKoxa+35Ue/LV0n7gfjQivRT2OZbegM9lZ7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="436790272"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="436790272"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 22:48:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="733976257"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="733976257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP; 06 Aug 2023 22:48:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 22:48:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 22:48:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 6 Aug 2023 22:48:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 6 Aug 2023 22:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Er/Mh9PnrmYv6pl3YsvU74OyqePxJ2YwTVyR8ajHUCFp12QrXSCrhy0Cpl6BOjD5osm284dFqge/zSXxBGjQzLEt7KcHzyo9Hq++WQlekk/6cDib8JhLVtOiOedWhrB5vqUuavqIRHdSDJI+3Ee8Gde+LGT70tO3uLPiHeVI1BFzeohuCA6ZEMin0/yC+opBxQ9xuj9setVA0TsMm0oR9pxGjTgIbKEqa5AMEyr2fOFu2zJDnVqiMC0tQbcXKna9xBlDe+MVvagB3i2WFp+yPw5DXu0QH90NLJXNky79iqjMEuvltLCjFVU91sWpNIFX5S5B3SBnNirKgCgAJ1zLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fOmjOegZn970drkTvDf0mi0hpH0ZTwSx2RMxVMdNJY=;
 b=MUcWLFKDgMcBUJLb/pTx6BZmybaa+Dh00b7U7/DxB6WqxIBfF8nQhxwiWHbmLS8l4LeYCT+5lrNH3yQ/LtFNrDvImjAGmC6BG4KFK4Vjlb8gDlAFd6w0q6ZduG9HzOAyl/9/2TO4iwJuB/gf1diq89d6ADe7jGDlk9msTtKUaSepsrQOypqy6oLhuXRO8iC6wNHMt8PYFsRCtOi6wzT1SwFeH+CeZu0mVHIMqhRVtEY5RjIJfOYMGS/hDzvloRTndnRYTmeZZ6zCAB2afF0M4lEz3XNWrZOw1fWVXTRkktD2PkSrTaTasyuZZ5MKWYmqHoIT5zJ/+FhmJVJ3TVaiqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH8PR11MB8259.namprd11.prod.outlook.com (2603:10b6:510:1c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.22; Mon, 7 Aug
 2023 05:48:48 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::c407:a2ef:2fde:f6d1]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::c407:a2ef:2fde:f6d1%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 05:48:47 +0000
Date: Mon, 7 Aug 2023 13:44:42 +0800
From: kernel test robot <yujie.liu@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>, Guenter Roeck
	<groeck@google.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chrome-os:chromeos-5.15 28/28] drivers/gpu/drm/evdi/evdi_drm_drv.h:
 drm/drm_framebuffer.h is included more than once.
Message-ID: <202308060735.Q4X7kqjf-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0072.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::36) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH8PR11MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb7482c-ce14-4246-e4d6-08db9709f825
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7FN/KsAhMBTYsFo9ZG0T8Z61twtuJ6c4GvpuqdtO3SYtCxsAASSeBuzqFrco84Asl6WtFFyZLJesGOxcfZSZC7kkObV1HGtYWToFtWsOcdCfhXZcnzRe0//v+XsLkq11cMXWSTL8pcZXaoy7T7LHbaPacg/MBYFzwz8tOL3rBjLYsBtUhqgih5gSPKPQEUJRxlwQd8wjovJXrDHiXmMJorTiEuF0AWw9+byYnCVA9umJCZG0KwBKeiKnQdjdjoozyKxKo6s5oMcUbLO3Rn/nIr1Jry7FInOzCpvmvXdleCqJG9PZ1tqQ58v+C27GG9sqNpw5n2zJd0Jy53hGw/X7GY5ydngMNg+bvUWjPbGZBOkFXySACfNoTmSuyADMqzYO7cZ46Tj+/IC9PGSGTw7WgxyvID8V1tQ4ScUH/fbXjYdsTV7ZwS+sLWxoW0kxz2elw1mfW+pYP82W6s9YKqrn4NNK70k9Mf9Yh9w3ER/zV4ZnB1fscT1yIJNlX6q307hQhl8vi1y/FV4XeQW0efSKP5scp3vSGqvZP+Q0+pA7mDFStIQsUkoU3EW94g8YVrXT5j45F4UfyplRpeXsixnJaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(1800799003)(186006)(2616005)(86362001)(6486002)(6666004)(478600001)(966005)(6512007)(82960400001)(1076003)(26005)(36756003)(6506007)(41300700001)(5660300002)(8936002)(316002)(8676002)(2906002)(4326008)(6916009)(66556008)(66476007)(66946007)(38100700002)(83380400001)(84970400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fbByfW41/evPRCJ0/UF7m2hKtGdcK2ksmNzMvMZLSCfADRAF4DaYyDM71d8s?=
 =?us-ascii?Q?zYzeIXn2GpOU3OIxqv4gfe2sHoq7mIsXRUtAKlYe5Ow8C5p/YU8zaRnvUcwn?=
 =?us-ascii?Q?XMFLY5dLs8WZcAmhJEMnzx46qmK10pelG+DTnCoPuk1TU9AB2fef9asyJa2b?=
 =?us-ascii?Q?ZlDR/BedhB6PJa2jAJwgD4qK2fg/yDhEMkukc9fy0/0PDXotFS2oKok2gNsh?=
 =?us-ascii?Q?lDCHFWeeUDNdElra8piNok/mhVdbwyKpg8Gz19s5YsCTrpaY7GYfgZyHE3k1?=
 =?us-ascii?Q?FpJPmNMNpIwzb4NfzxecEwThVKJffiuUJKwtYEiDuf/jlIJjqj4a5YyZQfC9?=
 =?us-ascii?Q?uAETz8PQ4i+gsy4yJOkDb4W0T7aBH+iR5msCQ6CXxybWC6ti6uBDrQy28eBE?=
 =?us-ascii?Q?2HNj7dsv0w28wdb5K7Ma1XUFsNc5in+cNy9JVwwmKBot+SENCItfJbXjVH2o?=
 =?us-ascii?Q?ibbDQQd/v8wIcI8vKA/xSE0aVa7Dof9SaiBKi49Mpq8ThprLSme/mJlIyyrf?=
 =?us-ascii?Q?6tRaKKQ9vuu3j1jjqkEdq0GYpN5OealRRRaRxI+JITRtLtkTzdyBGwnmWLKI?=
 =?us-ascii?Q?3nGKEUOoW4X175tFnJPGgJfda5NLGMSbuUN7lIieI66zRHoiNpLiUVwef/sR?=
 =?us-ascii?Q?Ijlr55dncx6RbFfXhkXKrRHMvwoAQ2b5Mzwdf1uRkAob8bGvv1TihHYeo+R6?=
 =?us-ascii?Q?+JpBcsUfdFHNYTkRTAeIX42XsRI4JkHiiUrN+721eXU6bXUrV++yRUbnQDdm?=
 =?us-ascii?Q?0TrrfPBbPbU3G2TWIv8UdgZEVEAmyidvO3H+7rRjf7WUdll8VQsmM/1XLDlI?=
 =?us-ascii?Q?ddyUSWqeYuugXW35fXx01TusRkHnkbKmvGY8S9uBON4I90Prslwp2dtZap/C?=
 =?us-ascii?Q?0Oq49rshh7R3YsMogulI72OWE7kyX+iPQJS+YZwhG7Em1hmDiHN3kBSgT1Wp?=
 =?us-ascii?Q?ZEVP2dOUKh/uVZKQ5t4ZX9yVcN+oDjI/24kprIjwYIiTyfUX6NGqboo99iuY?=
 =?us-ascii?Q?q8Y2MAjGmTYUgny5xWfpSSO8e1UgMIv/SkPX5q5nI5pVnxLlhA7KZ0kpgXbz?=
 =?us-ascii?Q?LX+sVS2IFHi7dtur16qXT50yVe/UXFpwtaBZLdVmXYwcPXGbHWxlcvwypMHW?=
 =?us-ascii?Q?0wGdIUA1v0hsCtEBUUmJZ3NDTMGiILzSrpWtuFwdiJH+jkkG5nIeG0MD7HkP?=
 =?us-ascii?Q?v50MQztRmvwubs05QNuaVTNX5ConBDt7kNFCxMaW6nLMIqrbR4zIPnz7Lfc2?=
 =?us-ascii?Q?Ij8W9JVOT9Z7FR1qsulMWLksc/HTFPbtNkfCMXk2Wraw1DToYU/nkOcQjS6E?=
 =?us-ascii?Q?Swi8/n3YIHWFgBQX9sk1sp/N8mJyYs5EndKujhSxMbJIsRDECsWNI+IEwp5h?=
 =?us-ascii?Q?FZOWmYl/oiBfO6sOBXypLqipLi6VKTory3YpL8QEMp0dciDrx41nGdcnk2p4?=
 =?us-ascii?Q?3fjFisxd0qkNQW39kGJp5VM054tTsjPxmUVGQDOwqVH0HSXaIYZ78ItYQR3y?=
 =?us-ascii?Q?S9ARw/yxkxZp9Cf+L2AxHDBpnZF2HcqB31g+uVdKmMremteRyDTWI4d/UeGe?=
 =?us-ascii?Q?r/z9xu8ERBfL/4GnEALQzH7mC9EOcveVHws5l3Nu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb7482c-ce14-4246-e4d6-08db9709f825
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 05:48:47.7830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7F84H8/WYHCQ3RDsIMiNJb0K5kI6JRBrGFM07oM+TwaSHEffO1g767dgyiy2ExGLjiSkRZE+d7zRN4pn83lSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8259
X-OriginatorOrg: intel.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   0ee9b91ba1abb722c6a2b8846775f2db048f6a1d
commit: 0ee9b91ba1abb722c6a2b8846775f2db048f6a1d [28/28] CHROMIUM: drm/evdi: Port evdi from github.com/DisplayLink/evdi.git
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202308060735.Q4X7kqjf-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/evdi/evdi_drm_drv.h: drm/drm_framebuffer.h is included more than once.

vim +24 drivers/gpu/drm/evdi/evdi_drm_drv.h

    15	
    16	#include <linux/module.h>
    17	#include <linux/mutex.h>
    18	#include <linux/device.h>
    19	#include <linux/i2c.h>
    20	#include <drm/drm_drv.h>
    21	#include <drm/drm_fourcc.h>
    22	#include <drm/drm_ioctl.h>
    23	#include <drm/drm_vblank.h>
  > 24	#include <drm/drm_framebuffer.h>
    25	#include <drm/drm_crtc.h>
    26	#include <drm/drm_crtc_helper.h>
    27	#include <drm/drm_rect.h>
    28	#include <drm/drm_gem.h>
  > 29	#include <drm/drm_framebuffer.h>
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

