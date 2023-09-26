Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3325EEC5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 02:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695694703; x=1727230703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AvKh2KjVwaP42ProQlh1YNZRCfYo2Ysqa2+hcLGGYWo=;
  b=KqgoJg1GGZ8VieuhdEnDfX1UtnAa2j/sh0RTjW0sBtoUIQP3Vk3DoOkI
   mM/P1IIzn0DdEW+QUqS/yloxmGoX3c63C0nBUBkP4Hjaetnyv0vH7EFv4
   YGBMzHilnYOdIrbD3Io6X1XzkcpjphZ6fo37LS42bXEPmt+QOv8L11XdN
   xVKX193cs1jSD+bch2tLCVUx0xQrj4DvI8qmpZ7TPoB5MjIfQlWvwo08+
   Tqrir3YbAsb1SBcZ5p0XIiDO1utDOcDMfXUD8skgADmGood2XrZVPHSCo
   +9S8YbopLZy5L8gwJqLyRykwGcBt2NWw65UPMcY/QAPSl3GJUWrSapk/c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445592668"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="445592668"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 19:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725273091"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="725273091"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Sep 2023 19:18:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 19:18:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 19:18:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 19:18:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 19:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMuKjN5a0YUr06AFtMUBn2Ngk4gOC8iDQiGTN5ijarJHRt842GU6t3ISbLax92moZl3NLT5YtMuOMsB9KNwumogCQ9IVcynonFwjPhKRp1JKKfplVtsX4YNmVRMLdTsDzfPxPh91Wo0566vuDggThOTKSDIjKRkafxy04PkvvGmOSz+GYDbgjcV5n0HnoPVWbM2toANelH8/JXi2gY6/0OuS+CsLAXkXvj0+QLEw9lHwfpsXwM4h9QaOzIyeHDNqNMGkofeUHrboDco+a0QFAj/90hq8BKkxWflaZ4KrWxxsOTx4CTScjNlV0ea19WbzisVCPgBlFJa0BWpfoSZFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pREigBrxoRRxrhSzX7P5vkLFcHSE/9L0Q6tqbuzkCno=;
 b=LPgvVBVSyxdl6QQqhwojT0wSaAxVuIe2AsMBbRXr6SXnd77vYtsHrNm95T14q4y28f188FlR/ga2UYoANNEHg21fopo1Zq00yZ/gNgnXmgfdM8DO8/7BoqSKaQbehDhBhZzR5c5Ojts49UY0QfV37V6TxB59aA2xxq7m4iFf86T7hGPsXtemgC6fyncIn+k3kopjWoTKca4kVI1E8Dn2bsfRXiPVumXy6zdVkce5k/QMMu85wpa/SfGPr33jdRrhlDkoDc++ol2cqsaPiBMoqj7WmHN1PFVk90IorQrWoxEWLN//FJNTc1sLjqyVftHHLe9+PteJ9NFocdrJbYk9ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Tue, 26 Sep
 2023 02:18:19 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 02:18:19 +0000
Date: Tue, 26 Sep 2023 10:13:22 +0800
From: kernel test robot <yujie.liu@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [djwong-xfs:rmap-intent-cleanups 323/433] fs/xfs/scrub/scrub.c:
 xfs_dir2.h is included more than once.
Message-ID: <202309161952.xAswNS42-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SA2PR11MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8ca06c-237c-4245-5a51-08dbbe36d982
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zje04dc6JwIudPsFtN/rRBkgsKS8ptgN3og8Xpn+dbqeq0zT6lYk0YYb0u7ztz+LeOIVLJWxyE6eq+65azxyGmNX2PtIt8jOtfzQtyFUuw+s6pEsaOX1wfg17zyQ3ZkmUbG2emlGFgJE0b40C50OaD67Jn6FBz+rq9GpHU4RF5heFNQG28K2zCT+e6LTCHBbJ5ESXF8TOI7J1a63yCLNzBm+vy8AE4HsZLHcIiuEq3NbYL55CXlX5NIH4DL3ZRBIXjT/0XuH65Kb+o3O8k/B0CSmm63e9GpkkB8oCDxmt43vC95wxTjbANxrCzFySvXSE+EQ+qZLEEY3J7Dk18KB6KN1sT7jKYFXr7LwjBKh87sUqoZKZcxWki93LD9uqcAD7dzC1utzPjCggd5x+ZCIeJeOlkx1LNhIIGPTjva1Bnl+466qjLPQv8M67z4hKmoweK5gzqhfJcWjN8o5OURCNsUkjVLP+50RoPNUHuBcs2gMiG0eVdHFNNSrn3IiswU2S0LZTaSe2uHn+6UZ1/svAXJe0mcsj8vvbzSkaH6NKRPrp7hADZk47hRytczuHv/jrPH5KhfsvSK+LTP1P+JAmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(346002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(966005)(2616005)(38100700002)(478600001)(26005)(1076003)(6512007)(6506007)(82960400001)(6666004)(6486002)(5660300002)(8936002)(8676002)(4326008)(66946007)(36756003)(66476007)(66556008)(41300700001)(6916009)(316002)(86362001)(2906002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eHkVV1YOw34+b4FAWhDohVY1xSzDzFmGeaOo7mKcL4OtX1TeAQ5OUQlcAkVw?=
 =?us-ascii?Q?7/N6bdDgQpWn/u/w71nS4Ff8ILf+8yFLM+SduZDMB6nHWXQt+prtsMxk930F?=
 =?us-ascii?Q?QZExkvlehhUzguZoGi9wjplCG2zWEkMR8KlVgSmqNSL9tJVkTwSjHyv3AKdK?=
 =?us-ascii?Q?5qW8sw63V8EKG92hLzHLrKCszP6ULcLUG/xhhPx/KTmHL+tVAxWO8iX9+pXp?=
 =?us-ascii?Q?9cU7Z98XN3dq/X31otVm0rhtdeUGHjmWMK+rykcBlEtDWx1+3OlDQPRUKWbF?=
 =?us-ascii?Q?UPyXyeglB12C1rwjzdCpc/LRcor2BH4lvYwTIi/3smZOr0eIaZn9Q6sarUgO?=
 =?us-ascii?Q?PNqK/3xkGP013OGIF9z+DFPx/a0lUGutQxsfsTb8br5FrHvqTius/7MwFNGh?=
 =?us-ascii?Q?BcJkuJy86Iid9gQtZ+aQwqFv9TOrls3ymPWQqM+PIihfUovUaqpMgJhF65zY?=
 =?us-ascii?Q?Q6G6PPWxusb1hDDXTJAB73gtk8y2jH4rw4KZwTWxFx3TS2J5H3KaCyoGtjGq?=
 =?us-ascii?Q?Q/p/FLSRUi6o356USQY2YyJsxvTo1tInTX/jRuwE85AWkwrwunJf3LA+YuCa?=
 =?us-ascii?Q?rqEkFpGk63BzCH/IHLI6J5NF2u3hsutJXCc0AvGxkMmZUGFq9tn7vfRvIBV4?=
 =?us-ascii?Q?pqkxZZjIYiCt+LriX8Y97rOmc0Zqnf0dRyrkZI0M9GT5G4JQp+X8xaWswOZ5?=
 =?us-ascii?Q?OzR7REk5kDyC5nXlFPKC6EPAHTPQyu/77LHHUW1B7rVmrMpOB79FYWXCZaSx?=
 =?us-ascii?Q?CYNhNRWaTECs+fHRROHcJTE6IlGzX5vBWQjzAFB9Q2by1q3afyi3Otx/0vH4?=
 =?us-ascii?Q?wzukjlGzRoTXEkTx39S7EQ/zfJKL9x4ajCSG38OCwb4BX5XbEIdPVhZTU5mA?=
 =?us-ascii?Q?JIW++g3U/+YturLSEkT1QxRN3FZR5ULOMzoB4vDUd+FCKYzYvqZutsydPl5s?=
 =?us-ascii?Q?LjcWYCbpawIqz/5g5KMOnuvgY+T1VW2cI0xClt1d9XMU5+fZtz3kvLDZ5uaa?=
 =?us-ascii?Q?e1lxf4bNMfW+782GkouM+ELDS7xGUpHg1Kmd6ZLdkzchkUa4dvSNmAT3CyEj?=
 =?us-ascii?Q?MlXMw11SDDfyYHixEEIARw/YYKjKuwHSHpCeNdX8yrqDpzTM5opqTibQvR/8?=
 =?us-ascii?Q?cnUbHh5bFZwLOiQBBvJxYe0X2o/vD6CFBmzcDafMKdNp0qHlooQQiJVe2d5G?=
 =?us-ascii?Q?6nvGxazjJDCefmZqIxvcihtQ1eA8uy2qQRMOpGnxnAmKH/285MbraMYLl5An?=
 =?us-ascii?Q?oNEr9txwXE7wy6SOa1bK7VRdkEpKfzuYTGvWmP4t7NlR8jNZPe55zERhkOFB?=
 =?us-ascii?Q?UeNuSQ1igq+3qiTL8HVgSGEoQyu5vsGTGqY+pCZwzft6WPRtrA7yx+FT/MzN?=
 =?us-ascii?Q?JJvuglvyyMmyAW84ByCexniW/A0++lBgRfforL80BTEb4U1s13wTUrK6weqY?=
 =?us-ascii?Q?HxatukQ8GS8jLqT0ux3r4SjBC4A3WpHV01Nz/FL2nQr1RmIX7Z0TSvKv++u/?=
 =?us-ascii?Q?8qvouQ11iz2phMm0OyF43xKnU1Iec3e8/hhjs0t9uvB+Oq4oHHxdttJDh90q?=
 =?us-ascii?Q?MqXnrxu/nEPtTUROAOhfIl9whBAQpst9jdgDUCyF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8ca06c-237c-4245-5a51-08dbbe36d982
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 02:18:19.2825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeuWxaV92J5/vbGMFH41qABk8iKsFH+i9c3yvqNLiszje/PF4Mdpmg8Zu1DspNIC1uupzW0IUCm/PdZWO+XtiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git rmap-intent-cleanups
head:   b406c1d86e7c84ed8d2553c0b4dabd40d6648737
commit: 892a798420f98a10bcdcb3ad27b43ddecc620ad4 [323/433] xfs: move dirent update hooks to xfs_dir2.c
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202309161952.xAswNS42-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/scrub.c: xfs_dir2.h is included more than once.

vim +24 fs/xfs/scrub/scrub.c

  > 24	#include "xfs_dir2.h"
    25	#include "xfs_parent.h"
    26	#include "xfs_icache.h"
  > 27	#include "xfs_dir2.h"
    28	#include "scrub/scrub.h"
    29	#include "scrub/common.h"
    30	#include "scrub/trace.h"
    31	#include "scrub/repair.h"
    32	#include "scrub/health.h"
    33	#include "scrub/stats.h"
    34	#include "scrub/xfile.h"
    35	#include "scrub/tempfile.h"
    36	#include "scrub/orphanage.h"
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

