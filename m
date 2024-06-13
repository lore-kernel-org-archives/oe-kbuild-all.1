Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9893C1EA87
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718283628; cv=fail; b=lenZJUQ0vuEwEAV5cYh5mFvmccVma4QX33d3VK+GShGeRtH/FDYdjmlZtaIZ/pSE3tU7Z58lzIs+oNWsEnyUg1GmWRYR03pqFblZq54XQu+Y3WQohCDfbOSbWyoY3F6b6DLceIZNgwcfeR6KDTXdqIKaZWCkIOiuGeX1iocUpAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718283628; c=relaxed/simple;
	bh=M7sE0sdlsKVI1VzYiO/N4slGG+dUE1HAyx7sdJ5+iQw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ky+NAmFvdAxyGGMe9VoT0YjQboeXlyIbWfUb4YQyicQrSAmJl9/TbqQUi7K8ZJP3f2Txv0VP8TIwannh0bbaTz0R2wI3mP3eZh/eRE0hXutWnLfnIbM8u2sk1DEXE1J7vXYi6zJ04lrZysI2exSVMo5+Laa6L19l7THotVSsgfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kG1eceki; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kG1eceki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718283626; x=1749819626;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=M7sE0sdlsKVI1VzYiO/N4slGG+dUE1HAyx7sdJ5+iQw=;
  b=kG1eceki2X64bAAyepWgCyQwf/VT+yZKWnnXDiDcjEgAsMuU/6Rky3RU
   jmUGCSqO+GpI1qVy060XyAYxfp/5LgvbTrU+MT1fH7WK3iGqQShAizQNa
   RMPws+ctTjRLNlaR4HtRmYhfU6klcG6KqLRJfVP11lyfGczySl14nBDqt
   ia5py5aEODg/VA2K5BIOsSyCaTaMg/ku8ko2wSyjJI4c+YUpN430HwnUO
   NM80voEeoO4B2AlNGdUfST43KRoBmTkTbOUhvGnTg1EiezmU4x/eMneeM
   i65WKN+9nsaj0Xbo3m5O1TmHWnWSXUgfj6la62FHk3KfHalOc57QEgA01
   Q==;
X-CSE-ConnectionGUID: EtA2H/WqQxOLpN735ndAUg==
X-CSE-MsgGUID: z8J2qyygQFWxdAWrPUSXTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18026265"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="18026265"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 06:00:25 -0700
X-CSE-ConnectionGUID: O4Cb/BthQIif+E6nDS2fqQ==
X-CSE-MsgGUID: IoJVlTkWQ+ikCHFNCy0XAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="45043073"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jun 2024 06:00:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 06:00:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 06:00:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 06:00:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 06:00:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTJ8M7aEDmkLe5kpADFbnJNWBlulXrgWO7sfEcX2JWkp6b1/g7OeYciIA7mnPhT88ns2xSmdLuxGsUzqcPHBWOSfoxWeP1AdYqVLgFmvGOUcwdLU5/BnfGj8iZOPEvm1FvxsEl4sfO+11yF7X/oVrrHo1ZhHVoSRE9Q8b1yq5U1poiJmPmg+G+MMvXxDy0YrQ5nVP1CKr6lbGzyeisXjG8PbrCToFn24vWGxcHLKIyOvcNx/KdnM1ziFBwb7jet3AAXNGMr6bjuoCq/nBy2KsP3NrHJTNDSzS1GrwRzsHvJoFiVcJFyjV5DAQj2jtGNvw1ZiOpE+hTyIKDUSzxj/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1acN7p0ZDYM3bfMGWZjadt2dgaMrM+qoo38Faa8KAq4=;
 b=oT+3RozykTpnyKH+X4D05FnpzoEF03eQo5vyTqctXOPZJwAavdZL+5b54aHKOo54Yxb6VH+8zP/KpEUQ6Yfa5x57H3LWO9kYG1pj5c7T9nIVNPQtlsllP7XiihytkW4QzPMh1lXQ/Y+WJMF6POcKXKMZgcG4sWkBJ8pb+4O2FE6QQbRAcfe8fw1G99sH08LeliXywF3cGq2iWzbyjo8tzfw/h4v5TwoxhGdjOlBI9FF6i3h6zxy26vXpxlfn3D2mE8z9s5uZlcfmVwqtV4Ag4kj85yd3S3QpGsuSntN3thVzgQaNyyllzyZDOnwsjlxSGD5TjnfWOVrJSL3922FtHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by MN2PR11MB4630.namprd11.prod.outlook.com (2603:10b6:208:24e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 13:00:21 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690%5]) with mapi id 15.20.7677.024; Thu, 13 Jun 2024
 13:00:14 +0000
Date: Thu, 13 Jun 2024 21:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Xu <dxu@dxuuu.xyz>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH bpf-next v5 12/12] bpftool: Support dumping kfunc
 prototypes from BTF
Message-ID: <ZmrtV7s4FxP4NgF+@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bf6c08f9263c4bd9d10a717de95199d766a13f61.1718207789.git.dxu@dxuuu.xyz>
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|MN2PR11MB4630:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e29b971-a763-467b-1af9-08dc8ba8c432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/zDUwZ1jfAtCyJhFxKYdkDmBj2vKzWV0ngpv2iocz0D9BZIMdi4zP+r6GEw7?=
 =?us-ascii?Q?e5tI/ehIkGa4FusRROfmdsgugWqnEImD7PtAj4qjYQxbdyuKEhgYsGEKovV6?=
 =?us-ascii?Q?tKMd608FUQ5DlnWQvZEbmCyyoLuswPWrElDLeIVR9HJTNszSax5cTTXsUf+r?=
 =?us-ascii?Q?8DesooFbSZutbE5jm2YCZ0w1FyNkBglxP7D/mXqp+ayihp04ma8k5vKuzSc/?=
 =?us-ascii?Q?+SgSumQBAhj7nZeTE2vnCLu95fl7po4Qxi6x0BjSp137LzopWc4MSsAtp/jM?=
 =?us-ascii?Q?QavIDEwGd1b+jZTnRpoFpV+6xrJlkekZsCyungZ6Wwm8G63RkYQc7FswBNn5?=
 =?us-ascii?Q?Y7b7kaCwp+a+Lsb2rZ1nxW3MS3Y3VGI7sDQwXVSHgMylc3xlWagV+QHvKky1?=
 =?us-ascii?Q?PbmYAkgwKIEmquB9HvXOJbC2c6xGnHwvNJNDYnptyfqhki0LyqJ0qqDifu5+?=
 =?us-ascii?Q?Bu3ZPTktAwyKGFdLhfbiSUykZoUWmFeH1gcJCLknQI4xUZ0vz3MOEHetizMx?=
 =?us-ascii?Q?jU0mFipObBtkxPjINJJHs+d7AxAfYztru7zQsx+vjgFGPANxVRYEViK0wGbe?=
 =?us-ascii?Q?QuHLMY1GOVdZNiV+i27v87kA5DZUjtrBEX/G/DvKrkwtR800sxabDT+GqRsM?=
 =?us-ascii?Q?DRzElHI8BQM+IESbuVz3wpxAinJJ4ql1dFyDZEiun3jxw1jm88bisqXC0Wlq?=
 =?us-ascii?Q?yIGC3aV4rjaA35s6Q+rn/bwJEH6+rHbgJvdUW1md/BN34HSEEhN4JvkojF43?=
 =?us-ascii?Q?Q0Qrti0Bk2/kbTgK4sAL48Qd+ES2fNIg+Tc3gr3DTPqVkzKaV4FsOXxD1tqF?=
 =?us-ascii?Q?/q8CaTjvIsJda8C3XGuVrQx4/OoEY7ICk+m8H4MVJOteFCxSvBdmQZTwqCvb?=
 =?us-ascii?Q?3XzIoS5IHRL1GNzd5VoNH9noUO2XxSVvxztT5Z/e9Ws/MkbC5kk5ZrheMSTq?=
 =?us-ascii?Q?kc86C4dbMmi/CYAVgC3ROV0euC/Tn4GZf3PMQOxA8Hxlbz3+d4kEL0S6uGkT?=
 =?us-ascii?Q?8yVdc6yBsfpzzyBtvw4Gac3wZQoXmsBi+Y58xTwOKzEqvXawAH9iL9m9xVtC?=
 =?us-ascii?Q?JLogPdDTw2LdroNQkPHwX5CztHoFpmT6xrtE3TuBayY782ghP7cFiBWJYXTY?=
 =?us-ascii?Q?Zc7/UPhiRe+IyJqYpV3lholOy8Xv+bhHk006n6Jftkc9oG3t90bj83c3UFcA?=
 =?us-ascii?Q?gWu6f+P6JPa5Nh1T8Z0FWbMATb6xtjeSCSBrbfDmhbrN3HROWD5F9WOBzuTi?=
 =?us-ascii?Q?zTNxVDGiFhL/KLaV9qW2e3qMc0FeedihsPen1K4w/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PX3gO5puuPLmtf00JBA101rKViaPdwaS9g9l3wNuT4b0gliJGG6Zisq+ZSfM?=
 =?us-ascii?Q?4dkt+T2jW41P6DUsyUwLejWYtPObwnG128Ee1VUBFcU2U/q5YwFSb42D9Q6d?=
 =?us-ascii?Q?O1aBE2dqZZ1dIDEsihxmq6ZM3s522Y61idkrmyrLsnZR5rI8l4DMxQFTluyM?=
 =?us-ascii?Q?z3zXLA9skuWVpOo28eK5vvklA3UigJZgirC90/1wzRsxYmQbAFReznrgY+qf?=
 =?us-ascii?Q?SqhoWcSvDt3XKQr8nHgRDMojIa4/WQwVNaGDUtanmFZMWSPIPganSEINwYJ+?=
 =?us-ascii?Q?1cUeuZlwzkJ2/4WoFltZ1NKPIe5bB6KzkUMShMrx28pBz6b6fS1VFsxUhRQF?=
 =?us-ascii?Q?qSu8JK4dHxpkJG4YL/47DrcHO9rrzD1EZO7mmlxIa2mzwgGMDUGq3qHH2XmG?=
 =?us-ascii?Q?Qwkjd+SdkEQBVTJdniOXTL/XyUhjNekWv+qh3uJ3Cf8+TaHM2oTed0pIiwKp?=
 =?us-ascii?Q?aMaSUFjZDIUGdBtMKHq/Ug64V4gAsX70HZ60xUDvSx7iXzxiVeuYaGEz3OrD?=
 =?us-ascii?Q?4dLbL6Y6RSaokKt4X7RvhSPnSOJHS1i4ZDvBVjHIHhksOPHwC1cqqRqacQ2p?=
 =?us-ascii?Q?l7Nm/skeDlDTDB237dAWBqWw7Affk/xMptcEpHqXFAhuvOKW5411y6TlNhF6?=
 =?us-ascii?Q?+qneZvGoF1zNv72D2ED4btG9OruwSYTcNOOjTcR7rpib96/DofBtYEO4MQ8T?=
 =?us-ascii?Q?e0cygDQwDMTG7pIaZf23HswqT6a6bfl3k7M4lh2VDlmEV89KKewEYvYeWQxL?=
 =?us-ascii?Q?S2Ox/AI2EzaYo8FNnnOOsCQpz/FiergxlsQMvs5f9OMugqo06qC/VJrwwpyB?=
 =?us-ascii?Q?9qY/VFPRNhPBKRJCa8937WKjFdhA36mGKRR9BwGCieL2SaDXP+fkSRCp4u0y?=
 =?us-ascii?Q?IA3AZb8a62oB7slZwx6YbcXxL+ui+XggQeu9GydzO1pCNTVroBN2/Wk4sTYQ?=
 =?us-ascii?Q?MlQ7jzK0FpYsNHCsd+Pan+0I9aMR8URM71sBH1LVw8ZlIz6+avMdk119B3/e?=
 =?us-ascii?Q?b+q4vNEBq3dr9T5Sr+/mIIdFZ49w5AfOizSmSmKP3Ikd9/eSXAHvnEIipKI5?=
 =?us-ascii?Q?FGoeBMuZMCQzaQwtnLpV57dlCG7HTRatWakWDjqpMdoxbD5Kra6ryZ/GWzy4?=
 =?us-ascii?Q?j4aGD+L1q4r6fpEQO2vvmIIwrt1Z86oWi9qIKO235djX4Kn1/5VZYfdvzOBi?=
 =?us-ascii?Q?IG9QMsC2yEqE4GWko+YFYmTkUtnPlIanzY8rwgdWebGpWfjY6rCeo6ioJ+X6?=
 =?us-ascii?Q?RXxkGPNPeqtJrygl3o/LwWropippfiDq0vxL3CzZ7QRp4c6XzJ264tYXYCre?=
 =?us-ascii?Q?saKsh8mBxRVJjTJzlQv5+H0go0j8fA2Cv0FOeabR6MEBm03PTShJnZ9/wWeM?=
 =?us-ascii?Q?luo/Pluw0K/xjtYsHhpIy4tBEl/Egjf2KbcZymFSv4fuaoq7BVLhz/vC2GqC?=
 =?us-ascii?Q?XN1lDpCd/bEalUf438cyEv7vHisYvKNPHc6aBRMNMUMv6hlTPcAbWvds21Z3?=
 =?us-ascii?Q?O8/NjUIBCa9uOE9OrJZi2H+MgZ/+Qv3dOhXHR1LOQVXaAdYUWK0Zv6nzdTpD?=
 =?us-ascii?Q?qkkP5kGviTPQJF5Kk41q1ZbyoUCdkfSArIoqzRfs+ziwp8l81ksBaoFaoKBb?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e29b971-a763-467b-1af9-08dc8ba8c432
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 13:00:14.6085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbvw7IyGbZu4L7X+dBEwLCkTZR7GSK2C095IVjuBzDc2KYodTR4/BdO89Ziz6LZRwzGG/WRPeHt4HocwRquD5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4630
X-OriginatorOrg: intel.com

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Xu/kbuild-bpf-Tell-pahole-to-DECL_TAG-kfuncs/20240613-000536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/bf6c08f9263c4bd9d10a717de95199d766a13f61.1718207789.git.dxu%40dxuuu.xyz
patch subject: [PATCH bpf-next v5 12/12] bpftool: Support dumping kfunc prototypes from BTF
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131810.c1B8hTm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406131810.c1B8hTm8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from progs/arena_htab.c:15:
   In file included from tools/testing/selftests/bpf/bpf_arena_htab.h:5:
   In file included from tools/testing/selftests/bpf/bpf_arena_alloc.h:4:
>> tools/testing/selftests/bpf/bpf_arena_common.h:45:15: error: conflicting types for 'bpf_arena_alloc_pages'
      45 | void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cnt,
         |               ^
   /tools/include/vmlinux.h:143359:14: note: previous declaration is here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |              ^
   In file included from progs/arena_htab.c:15:
   In file included from tools/testing/selftests/bpf/bpf_arena_htab.h:5:
   In file included from tools/testing/selftests/bpf/bpf_arena_alloc.h:4:
>> tools/testing/selftests/bpf/bpf_arena_common.h:47:6: error: conflicting types for 'bpf_arena_free_pages'
      47 | void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
         |      ^
   /tools/include/vmlinux.h:143360:13: note: previous declaration is here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |             ^
   In file included from progs/arena_htab.c:15:
   In file included from tools/testing/selftests/bpf/bpf_arena_htab.h:5:
>> tools/testing/selftests/bpf/bpf_arena_alloc.h:33:8: error: assigning 'void *' to '__arena void *' changes address space of pointer
      33 |                 page = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_arena_alloc.h:62:32: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      62 |                 bpf_arena_free_pages(&arena, addr, 1);
         |                                              ^~~~
   /tools/include/vmlinux.h:143360:54: note: passing argument to parameter 'ptr__ign' here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |                                                      ^
   In file included from progs/arena_htab.c:15:
>> tools/testing/selftests/bpf/bpf_arena_htab.h:95:16: error: initializing '__arena void *' with an expression of type 'void *' changes address space of pointer
      95 |         void __arena *buckets = bpf_arena_alloc_pages(&arena, NULL, 2, NUMA_NO_NODE, 0);
         |                       ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.
--
   In file included from progs/arena_list.c:20:
   In file included from tools/testing/selftests/bpf/bpf_arena_alloc.h:4:
>> tools/testing/selftests/bpf/bpf_arena_common.h:45:15: error: conflicting types for 'bpf_arena_alloc_pages'
      45 | void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cnt,
         |               ^
   /tools/include/vmlinux.h:143359:14: note: previous declaration is here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |              ^
   In file included from progs/arena_list.c:20:
   In file included from tools/testing/selftests/bpf/bpf_arena_alloc.h:4:
>> tools/testing/selftests/bpf/bpf_arena_common.h:47:6: error: conflicting types for 'bpf_arena_free_pages'
      47 | void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
         |      ^
   /tools/include/vmlinux.h:143360:13: note: previous declaration is here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |             ^
   In file included from progs/arena_list.c:20:
>> tools/testing/selftests/bpf/bpf_arena_alloc.h:33:8: error: assigning 'void *' to '__arena void *' changes address space of pointer
      33 |                 page = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> tools/testing/selftests/bpf/bpf_arena_alloc.h:62:32: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      62 |                 bpf_arena_free_pages(&arena, addr, 1);
         |                                              ^~~~
   /tools/include/vmlinux.h:143360:54: note: passing argument to parameter 'ptr__ign' here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |                                                      ^
   4 errors generated.
--
   In file included from progs/verifier_arena.c:9:
>> tools/testing/selftests/bpf/bpf_arena_common.h:45:15: error: conflicting types for 'bpf_arena_alloc_pages'
      45 | void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cnt,
         |               ^
   /tools/include/vmlinux.h:143359:14: note: previous declaration is here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |              ^
   In file included from progs/verifier_arena.c:9:
>> tools/testing/selftests/bpf/bpf_arena_common.h:47:6: error: conflicting types for 'bpf_arena_free_pages'
      47 | void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
         |      ^
   /tools/include/vmlinux.h:143360:13: note: previous declaration is here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |             ^
>> progs/verifier_arena.c:29:8: error: assigning 'void *' to '__arena int volatile *' changes address space of pointer
      29 |         page1 = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   progs/verifier_arena.c:33:8: error: assigning 'void *' to '__arena int volatile *' changes address space of pointer
      33 |         page2 = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   progs/verifier_arena.c:37:10: error: assigning 'void *' to '__arena int volatile *' changes address space of pointer
      37 |         no_page = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> progs/verifier_arena.c:44:31: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      44 |         bpf_arena_free_pages(&arena, (void __arena *)page2, 1);
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   /tools/include/vmlinux.h:143360:54: note: passing argument to parameter 'ptr__ign' here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |                                                      ^
   progs/verifier_arena.c:49:8: error: assigning 'void *' to '__arena int volatile *' changes address space of pointer
      49 |         page3 = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> progs/verifier_arena.c:68:8: error: assigning 'void *' to '__arena char volatile *' changes address space of pointer
      68 |         page1 = bpf_arena_alloc_pages(&arena, NULL, 2, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   progs/verifier_arena.c:86:31: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      86 |         bpf_arena_free_pages(&arena, (void __arena *)page1, 2);
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   /tools/include/vmlinux.h:143360:54: note: passing argument to parameter 'ptr__ign' here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |                                                      ^
   progs/verifier_arena.c:110:8: error: assigning 'void *' to '__arena char volatile *' changes address space of pointer
     110 |         pages = bpf_arena_alloc_pages(&ar->map, NULL, ar->map.max_entries, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 errors generated.
--
   In file included from progs/verifier_arena_large.c:9:
>> tools/testing/selftests/bpf/bpf_arena_common.h:45:15: error: conflicting types for 'bpf_arena_alloc_pages'
      45 | void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cnt,
         |               ^
   /tools/include/vmlinux.h:143359:14: note: previous declaration is here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |              ^
   In file included from progs/verifier_arena_large.c:9:
>> tools/testing/selftests/bpf/bpf_arena_common.h:47:6: error: conflicting types for 'bpf_arena_free_pages'
      47 | void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
         |      ^
   /tools/include/vmlinux.h:143360:13: note: previous declaration is here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |             ^
>> progs/verifier_arena_large.c:27:15: error: assigning 'void *' to '__arena void *' changes address space of pointer
      27 |         page1 = base = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> progs/verifier_arena_large.c:31:40: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      31 |         page2 = bpf_arena_alloc_pages(&arena, base + ARENA_SIZE - PAGE_SIZE,
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   /tools/include/vmlinux.h:143359:56: note: passing argument to parameter 'addr__ign' here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |                                                        ^
   progs/verifier_arena_large.c:36:42: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      36 |         no_page = bpf_arena_alloc_pages(&arena, base + ARENA_SIZE,
         |                                                 ^~~~~~~~~~~~~~~~~
   /tools/include/vmlinux.h:143359:56: note: passing argument to parameter 'addr__ign' here
    143359 | extern void *bpf_arena_alloc_pages(void *p__map, void *addr__ign, u32 page_cnt, int node_id, u64 flags) __weak __ksym;
           |                                                        ^
   progs/verifier_arena_large.c:44:31: error: passing '__arena void *' to parameter of type 'void *' changes address space of pointer
      44 |         bpf_arena_free_pages(&arena, (void __arena *)page1, 1);
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   /tools/include/vmlinux.h:143360:54: note: passing argument to parameter 'ptr__ign' here
    143360 | extern void bpf_arena_free_pages(void *p__map, void *ptr__ign, u32 page_cnt) __weak __ksym;
           |                                                      ^
>> progs/verifier_arena_large.c:49:8: error: assigning 'void *' to '__arena char volatile *' changes address space of pointer
      49 |         page3 = bpf_arena_alloc_pages(&arena, NULL, 1, NUMA_NO_NODE, 0);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 errors generated.


vim +/bpf_arena_alloc_pages +45 tools/testing/selftests/bpf/bpf_arena_common.h

80a4129fcf20da3 Alexei Starovoitov 2024-03-07  44  
80a4129fcf20da3 Alexei Starovoitov 2024-03-07 @45  void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cnt,
80a4129fcf20da3 Alexei Starovoitov 2024-03-07  46  				    int node_id, __u64 flags) __ksym __weak;
80a4129fcf20da3 Alexei Starovoitov 2024-03-07 @47  void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
80a4129fcf20da3 Alexei Starovoitov 2024-03-07  48  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

