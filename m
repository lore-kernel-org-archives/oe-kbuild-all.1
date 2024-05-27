Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEDC161
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 01:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716771670; cv=fail; b=o7Jo7KTsyxG3+ezp41vLDfjU/63Xh+tovCfNk/v2U3SkJF8bVvdZz2JvkMvEY4H0FUC+PGZ0zrqC/1WkZCxsPcFdwWY0cAh6mt7dXL2ZTWuxJPpZXM/cfECRM6ZXxbgFlFJVmKh48/v7ybl8a3UDHFfwVuO7/ArdAl53GWHZFVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716771670; c=relaxed/simple;
	bh=T2s5UtxYmtA1uC0CKSfjx7opQIqV+DD6QUpA7T95j/k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=L3MtWt9V8JwlEW50cAUvN3jnJWCJfAcgiBdHQhWf+Z7irzO0piVFj3g1b1Kx8VY+CQA23kyVGu7uY2Ob3TR0ccKG5xPh41UzgkrhoWf/7glv6Eu29NP05Dc/gBHKKpLjzBWqMwqYgSCEtp6Rd9TFzawzEyTBZz4n1sr4CZxXeHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9mIJ86u; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9mIJ86u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716771666; x=1748307666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T2s5UtxYmtA1uC0CKSfjx7opQIqV+DD6QUpA7T95j/k=;
  b=g9mIJ86u2PwN4GuJKG7xjkzvlXNN7u8gxcCAKagvw0aMTKuNbQoQWVOK
   qj7Yhi07vq6jYoHlBgJEjpcxiVtewCt9kTROERlHY8vx94NTrSO62aJTn
   w4my5mXc3fesfbzipRvkV7bFLJIPBzRgrBOhV6ucE91RRZn2kXmAVVDT4
   wBdjZojued8+g4BTxVfVhjhvydLscJ2bKAQp5Dty3ktMxPXgJVjTlxP2o
   W9F9Q7QnqUNp/KYFwDg3JAxwpO6TEjRZk3gPeERBwK8DSBGwSOogb0WsT
   Nup0VmCJwaMDoqsTewFZ4lJuWeA+CC+YxKqkthPxX6/CL6LNCZmHYFOTb
   Q==;
X-CSE-ConnectionGUID: uQFoZhj7TzWvz6mQubUUtQ==
X-CSE-MsgGUID: 0UxdDJTlQla8Fn6ec6/uBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="38453544"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="38453544"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 18:01:05 -0700
X-CSE-ConnectionGUID: sr5AojvvSqmpjGuPkxc1AQ==
X-CSE-MsgGUID: PXuKr3w4SnSjZT2M4HhkCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="65385822"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 May 2024 18:00:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 18:00:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 26 May 2024 18:00:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 26 May 2024 18:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U59dlXOXl+bO905eWMgoG1fFVZ0gXLNl1MBnllGZeV36Ku5qvspM6wnErKcE6XdwlD8E5qVGBNC1rkSk0GRBMZCaV7Es4uD6BCNsP/dPjvn9o9IhZKRTJZufvn22u/RHh4S9REx2xFsWF/VesXFndDDQKbtt0hM/OHfese3glwMCBFerKkWEZqUiRUXdbhMFrKVmFIDuWY0dUIka9gkXa/zl1bjhpV4GRGgzy8tddyY+Du/9aj/GVHOxXw87T6SNkzRYtccPdWTjIedmlCDfuyRrIUaP9bn/DkvBaIAcCj8GRC46GSvAvpKc3R3Xm4zMfxK0PbpGoOjrbM+gqKSeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CfyvvwZNWNC60TLKdtakHPPa3MEfwB24tE14AkbjlY=;
 b=OafHF9tekmtL3FXQKb4ObIC1yubBLioEmhRkfUstMqYOlyrgvACB2J/Iv50C0+2WeifNWTy59wrPF0zEVE8x3PFWdEDj7Y9fVyx5zUdMy4TPBC4lENNgGNTR751TI/eghTi7hjH7prNEQoSddZS4cy7fUFOYSIhlGR9ZZLEW7m5sX9bbUM7ymaV7DjHqIOghwdLUVA5Dyr/SfjaABqqenl/vVemB6E7log7TRxVBlnqrgpn3G4bpDskz2lyZYdQJHGUNREXRiWzFrS5daXur1ZMTKi5KfBdBRl3fG5PBK6llXIwdprOYaAL6bdiZqqZeBL0ToD7NJYV1mO3oRQfrJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 01:00:56 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7611.016; Mon, 27 May 2024
 01:00:55 +0000
Date: Mon, 27 May 2024 08:52:38 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Pavel Machek
	<pavel@denx.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-4.19.y-cip-rt 7456/30000] include/linux/blk-cgroup.h:
 linux/kthread.h is included more than once.
Message-ID: <202405261422.IpTAGHQ0-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
 To SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8a43c0-dd9e-4e3f-5806-08dc7de876c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+NEkAwsx+2x6KdGQpYoL7hKmLowCZewoXRBwh+Jb5pmvKpsxoLOCzE4fwB81?=
 =?us-ascii?Q?VXbuZbwH9bukprDebpHniJt/nnRpJ/3OF6jEuRB8TqGEJxLkewHXQKXHQi2Q?=
 =?us-ascii?Q?8ueVJCBZOU+z1VF/+yym1lhcFreVLQAiwvTBN9JG/gBenOmqAvfJfRfeuOBj?=
 =?us-ascii?Q?cVzG4pHLA6jQShAgkK1jF7NxvwmjokPuHe8ojMLt4xp+5ID7G/3c7RhU2XhF?=
 =?us-ascii?Q?wPv0hEw82g4aDFxEsRYrn35LadYGwQriP9u47zEF9QNWBP3Wsi1GvHzUFAZv?=
 =?us-ascii?Q?FYLgZFqn8kRHLk9LCCxP6dRjzsDY/iv0H4LtV5u2PndVTXFfgcuV5q7HPgPg?=
 =?us-ascii?Q?KTGycKnsCoJNTfwEyffKJhLCTqPTtZhAU1B0bCb3EsdGNgFUNBxGhH8AYczS?=
 =?us-ascii?Q?a4SpzyliKokayTtg8+F113cDtWSq5FfyAdRMhM7rxdHfn6bzCxNEDtVfvXh+?=
 =?us-ascii?Q?DxDoVTu5t00siUnqrLx56i9ZXQmBp+3KMqxJGRu+XdDl9XmJqa6zHrEWfHiH?=
 =?us-ascii?Q?ubzRaeZIGlotEaivhhlCvGedCdfqTW6VHF3im8oRlmpwS8NJjPVME615N3lg?=
 =?us-ascii?Q?QnxnfZUMCS2xq37AStuG/4g62qsqAF9NXVUUSFXFpnuZz8IMLM3J7SCwNecq?=
 =?us-ascii?Q?Y+60xjmwERx4mUU1+KZvQdLBsEc58rRp9KbAVRxK9ZwM65i87XZxAEgjw1J1?=
 =?us-ascii?Q?acTORaoS1AsvghqaDfifFtPU0bzgBHU/jryOjbYCPtUp/mhCaEaMbP0+h2+3?=
 =?us-ascii?Q?mpkFH8Z1fY4gqwtY3PbYByyrMmxZsVUGx5O4zbdtVbDvCMbUGv/2MkEgrB6j?=
 =?us-ascii?Q?IZp+07/n5fg8fTx0h+oNPvSUlSrt242MYG0nUBJZbgYtDh17TDU+t55jHVaB?=
 =?us-ascii?Q?mH/KxB3QW6b9XNn16YqMU1dEl1V/WCDIWAmBnvce5IAbNEoqP+Gv6GPzop5d?=
 =?us-ascii?Q?o/T2tfOZ6M/zoekBo5J0DczmxusvZnF7uxnv5MGNhTCfa/P6XRD4dJWnmCjB?=
 =?us-ascii?Q?3siFDC9vasXlWNRkRgCvdx1m6tYHyS2TpSjHPRVzzj8k6CunjM/ChTEUrIOm?=
 =?us-ascii?Q?pam3ctQoE5GJST1a1lnQkKicZZTsx5ON2FRHDYfo8we+4TJpyLnaU/w3j6ZH?=
 =?us-ascii?Q?IP0x/RPQB9FSlJ9JwC4+Gaqrqd+zMwoCtSx7/6RNV7NZvS8a19i0F8FR/xU+?=
 =?us-ascii?Q?lb3WaaXEvDGkfRKUMeYJjwnIfmVI4PxK4RU/zHOBtZxXa3T7PDetk3iQ118?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j1PyWwWqoPWtSwqZizlgs5vOklE+VDZ4wt+bE5+SNV5emU0C/WNUkKlsEUqx?=
 =?us-ascii?Q?NjyQ99LcWKNsrRDYSsnhepiiV+ucO0EMPiHWUck0KaPT0WaI7ZSkEKFlfZBc?=
 =?us-ascii?Q?2eIz1kQSj1aDawQQQibGgP4xAAxN+h/6dEgg1/5bCkBsmZy5HMxv7axCvNzV?=
 =?us-ascii?Q?BhMwS66+hcZmOilXciODvjJt4ROwX15VxoUfs9u62ghTgGMnjknQD/IrH91W?=
 =?us-ascii?Q?JFi8JjgOP+baZSXLK8WYGvcZ3JOSP6DFL2VZmxyk0kLtxnqstXvPkx/dlcsX?=
 =?us-ascii?Q?4n/i0QD/bZPNyVuHpE1n5imlR903H+H8QyZuN3cSuClR83gxk9jROcEmXCl0?=
 =?us-ascii?Q?JlMb/5xS0MmHI8lBERqVIdqW65OlsdLUvq6b0fF7Hm0WyG6ByH8KqOplKPmf?=
 =?us-ascii?Q?YQ16PAHBeBqsi95Wy4dhXSfH3Id9euR5NnGIFx5qQJljZ1TZvIFH9mdYevLh?=
 =?us-ascii?Q?664NjGYZc4oRBC2lBx5z4iJucWjaoy0IC6poIzZEun+ZkoGGfk0aVu1sWkvm?=
 =?us-ascii?Q?28hydDw5qG7D5arRWNQq6P9o8VMz1ObgYnKi7JtQ+4/QVhPcwApuyyBnm2gc?=
 =?us-ascii?Q?XcmfSOgrle+REvBWSwg9KB4Gr8GfRLmIl6WyqmlccAVfx9J2KIb2B3t/bT4I?=
 =?us-ascii?Q?MlWC7fZaJvSSMxa++VjrC/malHILKva3prbfsb/1B2gjR8GOrGZ3a3Ra2+D4?=
 =?us-ascii?Q?xdLq72RY0w7og2sPmS7KZtAcwGb379tcMN3bHGUhmpPZVT4aLUZvYPyE15zD?=
 =?us-ascii?Q?mK8GADCKOhBPP/25spKwHGOZwl5nvkHBxtwjGSWcBxDx4lVC3Ld+iOC0dj8l?=
 =?us-ascii?Q?vZH4cwC4wAA9VpZ0CbTz81ECqmAkRY1N13mADVuYPeg60f9GP72XUnFeSjn8?=
 =?us-ascii?Q?u4slgP8ZHGT3t77cyHj9k8ODdBxcNtZlrh6hYd//Jj1ujur+qj5oIY6kGotd?=
 =?us-ascii?Q?FT99ivydB/LLFglmRacb+If/eGjZ48RleMFe80bAzCHrqpV/SAbTZ5dkXCFT?=
 =?us-ascii?Q?BFk0lxhJuofP718o4yiN1+IyxYqv6M+/Peapiifc6CkaSoTqTrVKKBPstWnZ?=
 =?us-ascii?Q?JuWjD9Y1EYRnQttAiIpLeTCpP9QtUprwRBagT7PaVh6HJNo8gddY/4G7fBSS?=
 =?us-ascii?Q?RWJMqgIqSjFttiKw0Ep7X9RFfS5i7ot7fqX90MI7fUBaWfNtrygMihKsnxvb?=
 =?us-ascii?Q?NLwryflZRiSOqaBzYfHTOCMLhRZoFl5hSkiZ67t3iyugYQM4H5gVyR0FiT5x?=
 =?us-ascii?Q?4so/4Oh5towzcPg4c0+duMgWOTyKbHug4oj6f+H4+lgL0TIIcekBcc69Q9Xh?=
 =?us-ascii?Q?DmlLx77pl5VjbNwE7DpWf0GtfD9KYg8Pno9zvYvVo3Zr8lQM4tacu8xMsOCU?=
 =?us-ascii?Q?TAnBl4z12Ub9Sniyriwmofuh7nuB9ln+8ZQPJ+z+y8I6ewCshTw1stR4r9x7?=
 =?us-ascii?Q?+jvTY0N9wCd15JS1yni4t1LiC5PKt3s2Ybd9/dO8AQElHeNA1Zmuw8dZEml6?=
 =?us-ascii?Q?bV8K4L5B1O67PGZwQJRNSwM/EWKLPdWU826KMwgSdylIu9Yzohf/WiRpWLJa?=
 =?us-ascii?Q?sqpeL3qs5AsnaytDGliXl/AamGdThIVWbCfbuo/Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8a43c0-dd9e-4e3f-5806-08dc7de876c5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 01:00:55.8932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xf0NvUrP6D9tK53MpDdQmd3JX632s8G3vZ3I3KZ7zLyAaGwJYINVx+HZwWQyihGIst3wMw5p7xed6kUYt/FOhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   da10157ad010420d48b93fe1b2ea5866f2983bf4
commit: 827b6f6962daf2e13170c0185c0f7b51cf74a0ed [7456/30000] workqueue: rework
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405261422.IpTAGHQ0-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/blk-cgroup.h: linux/kthread.h is included more than once.

vim +17 include/linux/blk-cgroup.h

  > 17	#include <linux/kthread.h>
    18	#include <linux/percpu_counter.h>
    19	#include <linux/seq_file.h>
    20	#include <linux/radix-tree.h>
    21	#include <linux/blkdev.h>
    22	#include <linux/atomic.h>
  > 23	#include <linux/kthread.h>
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

