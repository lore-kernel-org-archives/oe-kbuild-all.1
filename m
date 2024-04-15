Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2A946AF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 05:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713157913; cv=fail; b=Kw7uSM2sxv4lf56hbouNdsAhauO7B2uwehwKDfrPO8r9UHAP+x7LJM7XezcsS7mzjBHLR5gtkrhVe7Z7hDJl2ZlL/f5gjDw5AlLCNXUFv/bdrkDPDC1Fg8ulV9wtBapTU1+pppCnW7P80KdIU1et9w2SdgOFUQ/CBq7iQh0r774=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713157913; c=relaxed/simple;
	bh=YpxoTJC4O9/waB6nit/Auj9/5QSiv0jtws0NQc8ahCs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qmX/4voaKCJvUeM36UZzZ6lXvsa68x81a8n8Njz6pGhZ5KgBkU8wnija/oSFxpz+2vzM+sIlV9IG7HAaa0REQ0vKlmUlaS5U/f0j1p6obRSsFcjA0yGCVwqaLvr4FsWZzDxmwALF2eSSn6cyDzWEpKIqST/MyUyo5GSHTZxXulg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qy/ngosV; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qy/ngosV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713157911; x=1744693911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YpxoTJC4O9/waB6nit/Auj9/5QSiv0jtws0NQc8ahCs=;
  b=Qy/ngosVVhI58du/9iewE/N5+C6oLjVBCynU2kLIKhkjUj2c1P89TPOC
   HdDnadi3t5jcdCSOmC+idPql+4D+0MVt8jbUFoFEvQUsagGip2cCADrt1
   9eIIY8bQDOvopgRwfU7AI7FT5A0IhFK9VVpXqCinBXtzWcZe3541fV6QX
   2REe0c4hCGi/MXEhzmhp1I/Y8s4lNm5HXLRvUGKMMtSzjhBrNH7hdEsT0
   jVjHmKI7H+U7KK6UID1u9ZsjOF4pTMNnw+P2XtRqM/TokOGm4jMPeyBwU
   bmLDGV+xTX0YC5t8aZITWXpEeteqwfoIuIADK8lc0p030wN1hbH2Rq2xc
   w==;
X-CSE-ConnectionGUID: GnGGcgfmQEGb5D8MyURqDQ==
X-CSE-MsgGUID: g36GuDioQ3WklD2+GmGJAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8653091"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8653091"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 22:11:50 -0700
X-CSE-ConnectionGUID: 3Kcazs9zQju7QIsS4x3kJg==
X-CSE-MsgGUID: y525IvMCSxqyD5SsBJyvew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21719677"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Apr 2024 22:11:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 22:11:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 22:11:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 14 Apr 2024 22:11:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 14 Apr 2024 22:11:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6AvybLvYpgUHqPzjoF4TACg6Iio96j8mE4EFLZKrnCPTeHPgSGeY8/v4OSY/vExREBLlBBQm+/tZOav8OQoVFe+v0kIcA3YcRy0T7+VoKSSqkrDZrNd+oAO45NfFS1yBQOFbbOOWOmbBkNwSL5RBrCMmyE4czVkTCv5L/VyN9uYP/87fHSUFVoz8AyZi9bZuhUCcLL4Ff+bTn6Cxhe/nIyuQjeAz2web+JCBg3bkMkKjhMBcQPefNxTsksWKP6lWxVWrEXJ4FlEz8/JLWtirjTnr7THR4HWFwT+v49dTsGafKp0Kiw2QSqf5VjLo+zm0Mh5izGtPp2bdyhgcoMK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BV1VcBaH6rj3BTFW+TmGENlJYjI9b2h5OdDh6d1I3nw=;
 b=H+iKmcLYt7fO4VEh9w9zY+P2y0hIjbeWE8oXer41w6gpXoDFFf32kgdnDNpDxt55ID/k61BqyrF0+RKNWcEkQBK7rKAHV0Sqy00h7nzQtq4R6XXVBORGSuOrCE2JWDHrbJk6lDKk1/q4xkSshJvtLWkJVgH2RPnBLvpejNlZQPO9ebB6bwwyyYIN8fBrp0RkkNG09dvQLaYs7z95s4HeBW0b0TCwLb8JJKnQiXl4gVaoKUq/pBcZ06Pxa1Q+G23QjqTTVgWgAxh9JrsYXxDAQHbfMeh9uc8arJaZImCaEFQSHKJibi/XBOOO68XcET9HKIAWWbFjqpbQ3jAXD0ZgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by CY5PR11MB6116.namprd11.prod.outlook.com (2603:10b6:930:2b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Mon, 15 Apr
 2024 05:11:46 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.041; Mon, 15 Apr 2024
 05:11:46 +0000
Date: Mon, 15 Apr 2024 13:05:09 +0800
From: kernel test robot <yujie.liu@intel.com>
To: <jasperwang@tencent.com>, <kaixuxia@tencent.com>,
	<frankjpliu@tencent.com>, <kasong@tencent.com>, <sagazchen@tencent.com>,
	<kernelxing@tencent.com>, <aurelianliu@tencent.com>, <jason.zeng@intel.com>,
	<wu.zheng@intel.com>, <yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [opencloudos:next 4787/4792]
 drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h: linux/sctp.h is included
 more than once.
Message-ID: <Zhy1hUyEI8jqvSXn@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|CY5PR11MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e55cf4b-74a2-40ac-5e6d-08dc5d0a8c53
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sBduWvUGPQ9DZrByvj/ULRsz6TtwQOEQki2Y873Ivvt9fp0l7rxSW7xlbKEr6mlwSusGSqxNn3lRmmhBSKrWpvGdpifZTHvqbuEfuyo4ZpL0uWdQJL4sfFLQFiOdEywCF5TEjJpxfVAYpp/pQ9ZYCGLwGLiSX/CPWz8PrV383YcSW23FR+3YnyMCwITvYpEDuubPdN2XL+9WSO8XwLh/mOuvGjteSKp74mKsyVEbP/9Xnbpe6mq4xuBYCZ3kHdezQuItJIaz9oVwGOTT49ozx6SBShVFkhyr35gNS57jrfNUGmI3V5tWZfH6Cj4avjgLLPiMjsjpnlJbqC5/KEzHw8F4cRtKfUSVMcbW5/vzLMvuEoNQ2c+mFrtKJnVVAa+4hrbGddqmfwlRZeencos0TmVnw6aJOOscGfKnGa4GInHuXONHdw5d61dKpCov+XnFTbyoNoOubY/JQyGAuZGt9OQctykzxcZZl8iOEGURold7rvMEUZcUCglIlqTpEhYT2hTrKJzUjHEBpTk2hYRecYTetTChKKh8lStC9pCDD6bUHPaAEZ7Umg4orTRyzuP0hMLp/ptUqMI8JIHyepPLdldec9TNTO31V+EMQLYTfd3vFmGwrMmwsI1VoUnbwl+pHoMCjcIZAe9ZpQ+Id7OufQLNHMu9im/KXk80MzYXEwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fTZ8Lg8vlSlh2PqCqw1tjb6EMAQKvL8STZYq+QKKO8TNMs9Jzaaa8OFb4R2H?=
 =?us-ascii?Q?P4NzOq9lsO5fjIMtwEDkVk34/xU34BwfiKlOteKjXBqUg6cf8GwIQVr/RF92?=
 =?us-ascii?Q?efZc1F6Zcp2QIF8nnTfWkmYQ0xcI1/TlHaE7xuo4BgPLXM6mqDxehrhSWR/t?=
 =?us-ascii?Q?PNg5iQusNe/qOi6ZwbPklJg5qJcYPFbTSqQX0wI78r6WQp7MhvW9FVMfHd9I?=
 =?us-ascii?Q?C8Kbeo4IDan/fx4kjJm4AcAU6GXgtuZXxZavulpETEp97L0U0nz7qsWmh+e1?=
 =?us-ascii?Q?IkagUTMTwa1mZPM7ssHg3at01ke1BclnwLFOkQrNZe/g8SWmWCVeL8lvz+js?=
 =?us-ascii?Q?+82XBCWNpl5ZGmf8GOh1frZFWJFuz6Ko7fyBExl5RvSeighZy7qTfQHUiSG7?=
 =?us-ascii?Q?tPKq9K8wDyZStRWD2qVmiUV0j840N2DRdUM7XBXaUe+EQGA3RJMAnF2M927T?=
 =?us-ascii?Q?LXJHcAlvQPXXHcoXuRSIa7Rpb7PN+6twi6g3CJ+fwnteh1uGPn6pdQFTmK/G?=
 =?us-ascii?Q?rTN6XTvnlmd0CfLNttb5gdxZi5c3NQnRGgC0+2Eampzetu8YgHppEHC7gGkd?=
 =?us-ascii?Q?OkoelTMFIQMVc+BXUKcITcKwMAY94UXFiLbG3JpOe37AeOLUuGm9P5SGZ9iN?=
 =?us-ascii?Q?Yt25QupAPJvKmrdJ7m2YLZMumEvQxR02RZHdYrTr+v6sU0t8H5zGXGqogh4U?=
 =?us-ascii?Q?6QotLja5GCFmhi1s1BhwRTBHSU94C4GoTq06rXSI3FCzRsflo/SPwe99gT7w?=
 =?us-ascii?Q?1NB2bmUtxhbsggybWOTVQ+ThiOevsSm9VKxvUMlneCUh8j32fjmE9OhuY5tR?=
 =?us-ascii?Q?z+8MGpMYFbvwXrCxpZea+orYzxnm2L0sOk9zJJNi5pfEZuHlIwyLqVjoEX7K?=
 =?us-ascii?Q?+dImWR9BmcaiX/9X5TAn+rzrPIIYPWlWESNlw0YAyy5WoGCs3WcqyoRDkX/v?=
 =?us-ascii?Q?nQ5y1elTy7jFh+TOvcWiNt0T1C4Og9ijihH3kQUYgZXUKIB2wegLxwizNmgt?=
 =?us-ascii?Q?uyWTc5jHCaeswFLBEE9Q5F40+5WOQVYSxd2sSya4wnzDB3CplaBxnrOtnm8u?=
 =?us-ascii?Q?NcjO4lhDAiYmMdUCi4b2tz/Dwi6WPevznDqNMUnc59FpUuGkpYmBwgAeMMXT?=
 =?us-ascii?Q?oxqONrCDFS7iqEsK7mOfjORSMaINzlomzr79hLFpy+0Ixafb0nCATTd8QOmf?=
 =?us-ascii?Q?pqtnSlOnf9HGZZylSdoywto34QKY5xK2sbo4YV4exMaDyMMOLetDvOQV1VLW?=
 =?us-ascii?Q?aYv5ZxYfqahX+DQ6si+4aq76WVUy/J0Q6Sda+95Hm0uIF9aJVbIcj88OinpX?=
 =?us-ascii?Q?gLalr00xPriJq2OY9/qfM+ZAIfVjvutKQFil/TcVD7ME/HkTtIhYbyBV/SwR?=
 =?us-ascii?Q?fQV7LCFd5AZUrNWLmZ9fFrytsKPSsZG4IZwrk8rgpCg5kX2FItiyNauSPD0/?=
 =?us-ascii?Q?kjCvtH81thhSKCqk4uvfD0J8dAabKMYGJa8VjkXQhAMGMBjyz66UUuJtjCtI?=
 =?us-ascii?Q?2Ln1cQSdTKJjLc90iqzyxidLYus15tpo54pEmyr64FMOfeSpIU5YcT2pW4Dk?=
 =?us-ascii?Q?gzSQjw17T0FK+pLxUMlrvw2ajG7EBI6zBPCnucch?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e55cf4b-74a2-40ac-5e6d-08dc5d0a8c53
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 05:11:46.6187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oE6Ix+vtES7O1sFHHWEs9wjbhlxwpZWLTlgRKW1zTt5Xf6pcr4c/qWlt+C+hUdtOphdwB/bF3adpNn5cm3o69g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6116
X-OriginatorOrg: intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   5a4887e84d1f38cdaa7d82d911ad735fb06009fe
commit: c783f7daed8739b9497e40656bc220d2d17c9c10 [4787/4792] drivers: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404120217.hu9eX7F0-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h: linux/sctp.h is included more than once.
--
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x_debugfs.c: linux/fs.h is included more than once.

vim +17 drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h

     6	
     7	#include <linux/module.h>
     8	#include <linux/pci.h>
     9	#include <linux/aer.h>
    10	#include <linux/netdevice.h>
    11	#include <linux/vmalloc.h>
    12	#include <linux/interrupt.h>
    13	#include <linux/ethtool.h>
    14	#include <linux/if_vlan.h>
    15	#include <linux/ip.h>
    16	#include <linux/tcp.h>
  > 17	#include <linux/sctp.h>
    18	#include <linux/ipv6.h>
    19	#include <linux/kernel.h>
    20	#include <linux/bitops.h>
    21	#include <linux/timer.h>
    22	#include <linux/workqueue.h>
    23	#include <linux/wait.h>
    24	#include <linux/delay.h>
    25	#include <linux/gfp.h>
    26	#include <linux/skbuff.h>
    27	#include <linux/dma-mapping.h>
    28	#include <linux/etherdevice.h>
    29	#include <linux/socket.h>
    30	#include <linux/jiffies.h>
    31	#include <net/ipv6.h>
    32	#include <net/ip6_checksum.h>
    33	#include <net/udp.h>
  > 34	#include <linux/sctp.h>
    35	#include <linux/pci_hotplug.h>
    36	#include <net/pkt_cls.h>
    37	#include <net/tc_act/tc_gact.h>
    38	#include <net/tc_act/tc_mirred.h>
    39	#include <linux/bitmap.h>
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

