Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F6747F7E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714981489; cv=fail; b=OAfPclMCeLDx7SXN41FSFb30RTGRDVROr9+1HRvIyHeT8zB39XIy+hOvfNXHyUnkIS4wGROkaEcrum1inFMLTGfUIL01vlmbi7rBhJMf+OGZEo5/s7I3jLxhbCR2BPuxRjae1SyHKQbCvxvqY/sj1ksHJVKs1dLU+csvxCPZxAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714981489; c=relaxed/simple;
	bh=eU6rBzZ0j8H1Rtn6TQ+lrnRs8LmIh5g+9Xd8EljP9gQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=abo6N6qKSQnlum1dFbc3UMf0viJwldMn9hAFd+m2CFV8nUeIMScRPlpMD+uJgkysAUOwo0yrHd2g/cxL3cq0jBgpAxEnW0qcqKdYShbgPFebPc6bv2kY0RfjEmaRSAUZZLmYndvklyok1pZSmyPtCEb+SETqjZOrGq/MTSesCJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqX1mznL; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqX1mznL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714981487; x=1746517487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eU6rBzZ0j8H1Rtn6TQ+lrnRs8LmIh5g+9Xd8EljP9gQ=;
  b=DqX1mznLNMdgDGpsQcvsfg5STvzy602gyQzzBCK/RMRz526SFZDip676
   Vx3EikEoOLZSGoL8Sd63DpNEViTCrHFtIyS+6cGwpfJxVTTJdcOGP+N42
   gpKwoLb8+UmNmFf7sV23SppfLQtZqDEJJ/iRTGHkGEu2Iw+mrD75g+Z3U
   WaAZmxpfTQ4z/U4JEPPIYyj9KoBHRA9heSx4NR1+VsJgW+yv0qB1wmWGx
   6L+Aw6kjQE7BeyrPHHBF4Ws9zXurE56AfLfEqr80yF0JtbI0iNjLEaJnO
   FsLqXqPJhdi1SYlbA9iyITYB4uA6bHUMdd0jtoJ0nsxaWlhTsdFRWLFLh
   g==;
X-CSE-ConnectionGUID: zhKc1IrpQr6LZqi4q1+9dw==
X-CSE-MsgGUID: huepzc23QcuOsZkbJETJdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="22122853"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="22122853"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 00:44:47 -0700
X-CSE-ConnectionGUID: MQwAC2acQAu+T3QlMf9NSw==
X-CSE-MsgGUID: LydqmCQlQviG1c7h59BJ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28166375"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 May 2024 00:44:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:44:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:44:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 00:44:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 00:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOdmEaJ/dCtgqXUaMepDhSJcFKfn8H53MJZpQti1w8CbdOcPfPnRTRakily3fAOmwPLcJNmGKbXgRsJcHPhrvje3APd0sRC63tcVPZeDf40feNFWQNCwkUYM5Xaiv/QvYn7dbKrALWY9dfTp1NkuTm4Poye0PywMCXqwzZKikcDHrQ3Z+MaI7SrzkmpouR4zD3dhTf+Tt9TB+j7Fy5bWV+ogyPXLcyWGSmQBJoTnLkKfAzdK6uZP9O9qwWUP4xsctHR97udW3lQPyMXt5YIjYTwhAbPSnUU9Lo6Wd2yRanLaldMs6xSCjT88XuLjl7ALDeSw2K7g5AArnBlyxXpDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEaz1w/WeelzjNcGl4KhyKeoVLtt2df8rU5zHqHK2dg=;
 b=AdzKSUgXSu/nxoS4hoRcRocpFk5QSB9cYK5PhwiXMRW3v/xWpUB4/B/zIdKxhsK228vHBmEtq5z1QI87MT0hkS16F4xYuo/b+G+ePOahviXAPc8MT60qDmw5LsDN3DYYJfV2TtuW8QAyMN9PGmmO4hWwSBqUlLF7d6BoISXomHJ0avjk5tvWyJ0iDEsPgur3RBguTcvookTJvxDIWl6dAJdy7c3tfmX0A2+fIw+yWZYdLwDq+o7GgKg8djc83rmWFVacvYeaq28IdHxvHCYZPci7ER/1XCJaW6EYOlx/3iEJwTele+aqv/U0IRaciK6r7m5lFLeWju2VX0tb0tLh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 07:44:44 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 07:44:44 +0000
Date: Mon, 6 May 2024 15:44:40 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
CC: <oe-kbuild-all@lists.linux.dev>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>
Subject: [coresight:next 26/26]
 drivers/hwtracing/coresight/coresight-tmc-core.c: linux/acpi.h is included
 more than once.
Message-ID: <202405021512.LWPwzJtX-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|MW4PR11MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: afe29da5-7d9b-45f4-027e-08dc6da06532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ouZ8RoPU1r0oKPg/M9PHSr5oMcoB0JOToFwLyFzpHjTaqW+XLSn5UeD2iRzQ?=
 =?us-ascii?Q?euhaBSEa5GIVMRlCCaKj6HthoXiLLRuaDiZ6PdtlnAQXeypHwII607JMSy9t?=
 =?us-ascii?Q?SYWwVJzYSu/7/FheUIygYFQzAu3LpNTd+6DrdbQdtplFPqANQLUjcqhJPgm/?=
 =?us-ascii?Q?TwIm0dXM9w/GqRNCHq4QNIJiqXWK4QWUa8pQ2A5LZ2KB+4GD1PO1K7pdFHzQ?=
 =?us-ascii?Q?IHbzXvohWftuy7TgZF0fg+64ZUS4s6lBVwUMpGXO1ML22d4QX7l3WrW8up43?=
 =?us-ascii?Q?J/Nr6wGdV+h+hg1f+0sUcF/7PSJmogV9u26f0kg1OwwxNKJiLQhRPn5Q4RLn?=
 =?us-ascii?Q?NsrrtaEIOaL92Sa7BMxcbNG7OVZAFinOVq6b8jmSesAEPOlcd9w+OWBPOlIZ?=
 =?us-ascii?Q?YNlIi7lPXKllze7aGSJsooo/orI61rAXkI1FfsjFuntrgJqRTynWUIjz+jNR?=
 =?us-ascii?Q?s5V2w3GNE9elAkmq27u38SI8MbU75odX5il+6gerGBHY+qnHOJ2Qtwdh7noj?=
 =?us-ascii?Q?k6skr0yjjviIhm30sd6qC4oAFEN7k/+RpW6k4faQDTM3Q2tCKYX1RsO8+0Gk?=
 =?us-ascii?Q?B7fs8KIZcbStDpXkUq1k1+6taxb9h/ErN7mAbhyz0RvPJLKE0dAGJWujR2VM?=
 =?us-ascii?Q?PKLBPZwu4NpU83EF0vCT4nQazKPGyqzz/3xIouCl/H6Qvq4O1d2Qf0IqYi0C?=
 =?us-ascii?Q?93QziuZOelYBcu1pUsgZIhvqwqLwSSuzNnquxQDcXcm54RWFIANamsswR5Mq?=
 =?us-ascii?Q?OXSwHHphO11Fpe0VrGr9XUWBujDrHFahSYYfTLEub4vHpllPUwx9hzJvACaO?=
 =?us-ascii?Q?fe+Pbghk6+mkZtqbBi4JTb8Yq8JORT2p1QdZkPcoFCVxhZ8JwDebSkNWSQDR?=
 =?us-ascii?Q?f5kthqPlPOLJahepnUEYC9rQQb9X5j9U0gJUxuIy55xO186q7hQwhFClU/Un?=
 =?us-ascii?Q?soFhQVpumFDeJ60/OW5oFrtLdIGnSvKFcl77TWLvQDd7vX63hmDfoqR3FVif?=
 =?us-ascii?Q?0TuUqi8nqWArMTQNmFgrd9BUOhsRyE7mnCmrlsXCAyaC9DCLi9NHdKuoCRHj?=
 =?us-ascii?Q?52Vzf74q8ecWO/i0WsRIJIHsrvMHNdXCRhlaC/byanY5U5tGO1P4azkN5J2t?=
 =?us-ascii?Q?WvzQuKBT8TzNdApOPyad0IBMNQJjodyOEVba/w7jJTGJZHPXGHj1iKNhUkWB?=
 =?us-ascii?Q?3DED/dmcpiSORkblKM4WMglgXT/H3DULEDvWSJGBVd1GB7615SAc3MjHXdk?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p3ZKLDH13aWH0JZp+zQeadwPU+ZFsGk+Cgmp4al7grqpWTiripz+gtxaJmXu?=
 =?us-ascii?Q?IwKiOkM/Bwi+yrXCpGsPa4NBSwe3Vj3IS0OInJ/sL15UNbkZ+0+ezJanrBt/?=
 =?us-ascii?Q?v+OM5lcUGv41fmmhMXvQPkwLG5gQI9WXv8PaBYDgserq9r3Ep03/Ljl64Mz8?=
 =?us-ascii?Q?KKSizZrHbsfsvuCD4vM1nY+yApL4sX+Fp2S2U0M3DfbJ3Y+13JwfMb1GXq1J?=
 =?us-ascii?Q?HO4kldulSQ7WlcRmiLCnxSUr08MZbdnnl+Iqa9k8kPpHfVIDTEWHe2ByvQQ4?=
 =?us-ascii?Q?avFIaSjihlxgi2ygUth3EK3gRaswDSfml2mCyuiiUumL4gDxwaSVqMog9gKH?=
 =?us-ascii?Q?4+jzMW6viGF7Ys5b2S1pmSb7ryVIL9K/199gp+ihHAl7MwMA2rC3wybqmfiY?=
 =?us-ascii?Q?H4WWypRhQ1diT6VJnSLXvYf8qlcTbF9HrBjzBd9T6MufAqm9zDpz6Pfrob6Y?=
 =?us-ascii?Q?ysfsGn8ogAywGCw5zXY0u/nap6Vu/I/wVRVMHhoVZb3RUU1wYmKBd+8UcWUC?=
 =?us-ascii?Q?VdoIfo1Me1oZElzeHp4u9p4rsjSf5V4Nt3g4kf3CX1rChvSE6x0xfZAPMgwT?=
 =?us-ascii?Q?RU3pyp9rcRZtcyoEjXXt3JeogG1LndheI7xTqtb6RlNceCt5BOgRgyis2biz?=
 =?us-ascii?Q?mDwB0hII8g37D/M74GpFLT/+RNPWB4CFe1nlQ3NPhAB4xuJlrw54sXd4ddVY?=
 =?us-ascii?Q?wG3el2P3K7avZpwR7L6gVtk4CavTHDU2S2c/japAegmADs8PE+sI4zhy7or8?=
 =?us-ascii?Q?1mKNb63UQlr7QO6xIlAjMYBpWdaVQE1Df31bKnp0hPCxH0IoTPLM66LOOCM8?=
 =?us-ascii?Q?e7OFxJyaGx4x2jdPvdy+5ZZj3dlv3EdHMNxiIlknUnxd0kNONXaUcwQVT9bN?=
 =?us-ascii?Q?FaxR1dv+o3HvPvwvBOP7YuoxJVaVw0qcr1DMXow0v2LeXTls3T0KUUzp1v3E?=
 =?us-ascii?Q?tbX7ILL2kuigkrIkxVZTgV0nga+g03/psXjoNAnBcKNWF2g5OXxfvDvB9CdM?=
 =?us-ascii?Q?RoMHyAMtXgPxBQN0EIpRIzaGyCcDHd6SGBcZu4hCP+G9G7iu47k8o6ovnVvr?=
 =?us-ascii?Q?enqKAVueBjFcHdn88jqduCbtgnBcUjXRQajvQiazvoIlAxKmQMMfA26e1+oy?=
 =?us-ascii?Q?MCJ2H8b8+zisGriRWOMryZ8Zrbf8NAFpElVPiS17B4ZcOs2MimiaZvYi6puA?=
 =?us-ascii?Q?XrtLUXpGQR/m5A1ejHlJo8gxk1FVAirl0fniL1vzcAVw9qgs23i0HbMOrQcZ?=
 =?us-ascii?Q?IxZjfu9thgToAzEOg2r8cJWrqKOBJUJ0PMLZDh1Eqc67229KZgfZKYNZrKiT?=
 =?us-ascii?Q?vW7q0bwZxcl2y7MiN/OMS8iWWCxA6gQIKUpvWi+AVgWM8rNqp9vyDiFA9k3T?=
 =?us-ascii?Q?6WZ99OUUQch68UqE4qmFVSqi/mR1z4Ohnfgci2nfky3A9HwrrGkn3o6uakfk?=
 =?us-ascii?Q?QXjk9DmisB3KhAld07fp1cKWuQTwojJJepRkYMKp4ghmo6mM6n2VzUIu5F4m?=
 =?us-ascii?Q?DWLS3DeIs4ZZnCLFYaF1PkD8HZk8/gMuHbWqmCENPXUBR39cle2l2PuRmYcK?=
 =?us-ascii?Q?707JMLvdEBwUGqil0LXMAl+GaYKB+rhebmQacE4O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afe29da5-7d9b-45f4-027e-08dc6da06532
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 07:44:44.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkc0360tm7cI8/R7PFHGcBuKm76O09QR8T382Okp0vsKwdYrDa7era1/6lwUhjPJGiSybjyIepCCtka+mTMf/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git next
head:   8877ef45ef9ec281849870d88039f8dc84cde774
commit: 8877ef45ef9ec281849870d88039f8dc84cde774 [26/26] coresight: tmc: Enable SG capability on ACPI based SoC-400 TMC ETR devices
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405021512.LWPwzJtX-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/hwtracing/coresight/coresight-tmc-core.c: linux/acpi.h is included more than once.

vim +7 drivers/hwtracing/coresight/coresight-tmc-core.c

   > 7	#include <linux/acpi.h>
     8	#include <linux/kernel.h>
     9	#include <linux/init.h>
    10	#include <linux/types.h>
    11	#include <linux/device.h>
    12	#include <linux/idr.h>
    13	#include <linux/io.h>
    14	#include <linux/iommu.h>
    15	#include <linux/err.h>
    16	#include <linux/fs.h>
    17	#include <linux/miscdevice.h>
    18	#include <linux/mutex.h>
    19	#include <linux/property.h>
    20	#include <linux/uaccess.h>
    21	#include <linux/slab.h>
    22	#include <linux/dma-mapping.h>
    23	#include <linux/spinlock.h>
    24	#include <linux/pm_runtime.h>
    25	#include <linux/of.h>
    26	#include <linux/coresight.h>
    27	#include <linux/amba/bus.h>
    28	#include <linux/platform_device.h>
  > 29	#include <linux/acpi.h>
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

