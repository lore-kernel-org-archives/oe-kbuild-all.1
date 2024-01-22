Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28743D392
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705933790; cv=fail; b=cLJWD2HekDBWavXNbXaLXrn2i7XWgckHMoxDGHqkNLIlj5BdXmLQ9aVBztShsonn9SARxpr+phG6It3bvJyBI1SmT2qVwOmwroqxy4T7oN9+gxzEwVYtsKpMBDXoY5MUL+4JrqRzJD36RukemhvFKDBSEr9jABlIHfrGOhLbOUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705933790; c=relaxed/simple;
	bh=/KWvzsHYO3+IoI+wdAfZeT2R3Fd/cKHWhkKoS2nhVOk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pKjyovFrRHvZRZxjWWuxHTfbhDUPEjg8wV2fRafdiFitjTPQoKsp3JAaU+t8n4gDPBPZFzzQctAbsAluEOr9cXF/vPH4aduUwOeGZJf2QErL/+eAekM3bny2wy348ME9MCPNl7F1lFyRmjzf2Ml6+Ng56QHpAgabLe+zQnYck3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceMcoAAT; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceMcoAAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705933787; x=1737469787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/KWvzsHYO3+IoI+wdAfZeT2R3Fd/cKHWhkKoS2nhVOk=;
  b=ceMcoAATmR6ORb0I2aF64cSfg9GYQfFuQF8UBvztFcjxszC+gCjG3vNb
   NOEYotvi7q/9RMr71hafzYUcDkhKiIxCo5IlIiNBpEJf3r5WyKICF6xTc
   f1je6HApyLxqLEBTPljurWpKShFO3yELP+PMl52p5v/6+bTvXyMLur9hI
   HgUCGVd/xdXmT33ig0W/WUQ+pMUEj1Ai50qFJmCxS54KK6iCw87xrV2l2
   sa7J04OLgpGmYnVFPXRuv1KVqbWTxYMKt+ftHXFjbWaTjBQ08Vi1dUfvP
   nN8Z317INBeD5Mshj+2q9gfm8P03UQKkEL/6LfEG99za7wjirqRSrgdbR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1109168"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1109168"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 06:29:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="904867477"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="904867477"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Jan 2024 06:29:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 06:29:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 06:29:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 06:29:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 06:29:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3nnfS7M3/+1cirym+vkKZHnh/rjTpgeQDxpQPfJSRcgDZD3X3PX1dQosXyvfSXToT9weMt+5N0+y4WGLLdxK4kO+Q8xCdpIjGwb5phHJByGSMWZdjmgX5eUy1WleZ9/klAzZ7we0p8qS6eyKBsvuHs2k3ffpg2QtkFCF6SgDq3rzeM6WD5kOr7PAU4W+KPjWImTEla/Sj0cY5hXCy2+e+GrX5SAHYgJPQLizXvc2m93AeGpxVVDa8sOgBAGg61v6GBN4r6/Wxeh/czbOD8cKlyf0x5WhXCOMILoVKH5yrOBjWxncPngVL8IXrRkuKt+SIEzd/8rj3jZ9TQOJ5tf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHi8M7WS0HSbHNFWQ822RyIq0/sKHr96pxhNZMr98m8=;
 b=Z/wX0++pokXV+BMkIdHsriSU3rMguoq8+SLtPcJgg4ap5Ux0NQk59Wn6LtiEFMEI+A7Q4d1VreyDPtp75NR+7Gj/mvb33c/TWNmOFIYgcKtq12ZgYRlPNmwZhENE+SBA19ha8FazwniVj99KHT89Dnijm1Elm0gMu0X3YuKg0HI0v7KlYxSOVjfeFVHtTX57qHhbj1v/XOYgXMYUYY48Ibw977Rpye1g7bRhMNtICC7AxZQHK/qCZ3ObneDdFbk9Y6Mi1vgNwu8O+zRq35z+p+HugRLoTwbo+YzdFh+oezi46wONlaJUno2NSGxt01rh4ENMnePDuV2N/ilWSjRTGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by CO6PR11MB5668.namprd11.prod.outlook.com (2603:10b6:5:355::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 14:29:44 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 14:29:44 +0000
Date: Mon, 22 Jan 2024 22:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-5.15 1705/27545] aarch64-linux-ld:
 v4l2-mem2mem.c:undefined reference to `v4l2_event_pending'
Message-ID: <Za570dFBxf7qLJCg@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|CO6PR11MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e6ad64-3468-44e5-788e-08dc1b569388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gACjL25E36WvTk/xHg0mfaILvmlQqPNGMj9COtVaToCtnybtIEFE3kkCeNnYbBlJG8imU6/gKNRGyjkk1WfpwNacr0+UtcxgU6g/otS7wCcvDz2j3AnwH+KOtloHfPdZyXu3D1O0UTu2Siz0t9SqFSc6ajSr+d9RWH2m9r56FEQw4vxV3I9Kpt88of1b6dfwWWAMg+nYN0OmJsgvmdEUsVdF6ZnheKfigQVtcNqVd4ILH5iMgBkzm2VsxdP7z4xd6L44zHBqS9tR3ePKrrG7VjaCRETVgBLSnt780FRIZZfxT9rA7SWrx2M3pi2kv/y3ki2xKB6H2NEUXZlbYUd7ygxlSVi2Xr9XQcfYvbYlNO0KwVfOicz86zXqN6rbkECdAfOTDqwnScAWsksjjIWOgA5fX1zFRfJfTDom2CfaWNU+Ls5T2ouc1fwd8PFkbeVX24m4ulaOkhGRME6JmJjDkfG+MLHeubowZQjD+Xm0CPALgvgo6AJVU2+R5td362B6jelDmcA8/BLyTM2Cpc8I/oFBz1u3fGnD/zXu2+LyX/Z6rxPqAYwCXCpkcb65VGtSf9M8B2Q/e/2P9xtL/nNlDjEqCSp6OjFFkYiCStY3kDVDSgXitskxz9wO8jbfe2bKWhnJFLiOQFy4uPdnEeT6Sf/qgv3tQXq92f8OGb44hG2KSg9PSFsqZeRvbZ9unICf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(136003)(39860400002)(376002)(346002)(396003)(230173577357003)(230922051799003)(230273577357003)(451199024)(186009)(64100799003)(1800799012)(86362001)(6486002)(966005)(478600001)(26005)(33716001)(83380400001)(2906002)(6916009)(316002)(9686003)(5660300002)(82960400001)(6666004)(6506007)(6512007)(8676002)(8936002)(4326008)(38100700002)(41300700001)(66946007)(66556008)(66476007)(81973001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DSquDb69ttdsBU0z57suCLixAmQBFPC9OrpTAmt/dt2imfWSOEeWM36mkpZ5?=
 =?us-ascii?Q?miT79ajNiL6JhyIVsdv5cNc2620piVabc3sDEAeFXcmYsunDjCXBYHTT43tk?=
 =?us-ascii?Q?IljzTMkurDINx2f0XZEHBTngKGc8512feJKrd3yCg/mWkMwQ7p2vUIOD113h?=
 =?us-ascii?Q?tzWBz2A6pBQRBPrKy21CmAMUXGrtafAiuupmNPkICjT/c+3/0KNt2LrwDBuh?=
 =?us-ascii?Q?BI/wayfvk7Tq1cpns5QXoL4Ng0ZDgQLJcdrKQkqnTQ7UWa++VrbqdQHkKXFb?=
 =?us-ascii?Q?vU60JlclOMRCfCQAW8Ef/Fy9mBHkGCq1EMSq621HlK/d/OD1YtsN4lPgKnv+?=
 =?us-ascii?Q?Jac6BqYSJJ39TRvV4xnCICOeiZIO/l0ei1HYVlisop+s4Kna94PA2zUwg7sJ?=
 =?us-ascii?Q?KSk/Xx84GTm+ZAeW4efhxuQeNReDDxfw3MYYP7XibyqlrxUMi5qXWZsEs8eq?=
 =?us-ascii?Q?iARFbpHhesy5U6j+TH4Y0MKjqDJFm3pnjxtaI4egrsU4c5y8i+a9AM84mc5m?=
 =?us-ascii?Q?MfI0mn0yR+O5Mg3tHYQ9uBAaDmtdwv/3VDLrlG2ScQ9JBp2nH7tvWnBiLyAj?=
 =?us-ascii?Q?dbxGEyMPZsFn8VmqPgC1l3uIYDc0YDXA+e7XBTLmOHhN3fpwDhsHI9ts4aRu?=
 =?us-ascii?Q?7AUiZIUjNvaTrJZnJ4M32LaCF6QJ7t0wKYkb8SqWTw2raJX6uc0VLeS5PuA1?=
 =?us-ascii?Q?XxRdu4outk5Z6o2OX5UjAgctqVMZbf/cy6Kb9RMOi8g7uS73jSoJPE5vGS3y?=
 =?us-ascii?Q?/cH74f6jCjlPPqcWuEKOJpidOPWVHV6u5CLZgwLhp4CuD1Th46y7khfasheq?=
 =?us-ascii?Q?Gg8y60w3trx/vBcQRRvEQWX6R/7g0jkzHYDcaTz7+pQoQ8dUEy3iDWcQkjzn?=
 =?us-ascii?Q?xhGeKrgnnZb1uUtZcsi6Qd4dt25uW43i+5m83TVK9T7qSmI0noCcZoLLbmd5?=
 =?us-ascii?Q?XfRbvEyFNO2nZyLFYLDAQpHjbFtU0yqEX2B3c1WXrN+6YgUhlW4w+WC02WQX?=
 =?us-ascii?Q?FPLg47/X3dbLhBdqXf5iNudPlCXBaQizggsUG6hghkGcgUA9dz0VcBzGRoJf?=
 =?us-ascii?Q?aqBO/7Ur/QMD1dbpRvQguDZgzlkyTMjqkTaSY7tKArWQUIHbQ1S0DqiaECW4?=
 =?us-ascii?Q?VfqPjWOFhfFI6nccZRC99wNvkzVawiNFycEE407bJty6SnXJNPZop1o24RmE?=
 =?us-ascii?Q?ar7zdu9Hy0H/gAWrY6dQOEd0d43RZhQ2+cNaZexz0lxelX/UAeVArOdhEdgB?=
 =?us-ascii?Q?kI59DAJDyO8YpsQUCZnw63/f0OzyJJ8qXv+ZYh/wxykLp3ZppxD5uKnMtYgc?=
 =?us-ascii?Q?A2FWjZE8V5gbl2Q/f9bB+5/nAa5t5X0aOS2roKDKkDJ7Z0z+Gg3yd/POHj82?=
 =?us-ascii?Q?sjLty7chOlRCSo0LuIYBNKG/HlHu305HMKZxSjpY3GvahOMhYJL0zmPLUuAS?=
 =?us-ascii?Q?fTAwNijQnwrmrZGwsMfLYbO0XUaptlSt8ZyNfCX1QA9jVos29cb6m4jdTKEB?=
 =?us-ascii?Q?TWo5vkfbm65dc++adA6frV+Zx5y9ZhPLZT+mtpRzFFdy1AdFJ7r+TPc1LaL2?=
 =?us-ascii?Q?uNpRahtEZLHkbu4vNKg69XK7FfTKbjt+Ixs+G7qERBo/XfFfaa7RVIlYA8wg?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e6ad64-3468-44e5-788e-08dc1b569388
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 14:29:43.9048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAFhHhD7LRDln/Ebw3I9XEGhTg3UspXpB+LmUH+kNjZvIjcPbJmmMWq07u7mzyO3f7rzQovI+yQGRq1Iow17Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5668
X-OriginatorOrg: intel.com

Hi Maheshwar,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   57ddb1ecd70e0e064b8dc36d00140b131702f0ed
commit: 1d74cced13c8a1bc8c2808697d4ffe73bdab9b19 [1705/27545] ANDROID: Kconfig.gki: Enable media controller configs
:::::: branch date: 34 hours ago
:::::: commit date: 3 years, 3 months ago
config: arm64-randconfig-004-20240117 (https://download.01.org/0day-ci/archive/20240117/202401170835.Q3zpvP0y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170835.Q3zpvP0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401170835.Q3zpvP0y-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_poll':
   v4l2-mem2mem.c:(.text+0xe58): undefined reference to `video_devdata'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0xeb0): undefined reference to `v4l2_event_pending'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0xfec): undefined reference to `v4l2_event_pending'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ctx_release':
   v4l2-mem2mem.c:(.text+0x1374): undefined reference to `vb2_queue_release'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x137c): undefined reference to `vb2_queue_release'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   v4l2-mem2mem.c:(.text+0x1884): undefined reference to `vb2_create_bufs'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1894): undefined reference to `vb2_create_bufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   v4l2-mem2mem.c:(.text+0x18d4): undefined reference to `vb2_expbuf'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x18e4): undefined reference to `vb2_expbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_expbuf':
   v4l2-mem2mem.c:(.text+0x1928): undefined reference to `vb2_expbuf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1938): undefined reference to `vb2_expbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_create_bufs':
   v4l2-mem2mem.c:(.text+0x197c): undefined reference to `vb2_create_bufs'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x198c): undefined reference to `vb2_create_bufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_dqbuf':
   v4l2-mem2mem.c:(.text+0x19dc): undefined reference to `vb2_dqbuf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x19f8): undefined reference to `vb2_dqbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_dqbuf':
   v4l2-mem2mem.c:(.text+0x1a48): undefined reference to `vb2_dqbuf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1a60): undefined reference to `vb2_dqbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   v4l2-mem2mem.c:(.text+0x1a8c): undefined reference to `video_devdata'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1abc): undefined reference to `vb2_prepare_buf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1adc): undefined reference to `vb2_prepare_buf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   v4l2-mem2mem.c:(.text+0x1b34): undefined reference to `vb2_reqbufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_reqbufs':
   v4l2-mem2mem.c:(.text+0x1bbc): undefined reference to `vb2_reqbufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_prepare_buf':
   v4l2-mem2mem.c:(.text+0x1c14): undefined reference to `video_devdata'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1c44): undefined reference to `vb2_prepare_buf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1c64): undefined reference to `vb2_prepare_buf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_querybuf':
   v4l2-mem2mem.c:(.text+0x1d70): undefined reference to `vb2_querybuf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1d98): undefined reference to `vb2_querybuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamoff':
   v4l2-mem2mem.c:(.text+0x1e98): undefined reference to `vb2_streamoff'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1ec4): undefined reference to `vb2_streamoff'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamon':
   v4l2-mem2mem.c:(.text+0x26a8): undefined reference to `vb2_streamon'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x26cc): undefined reference to `vb2_streamon'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_streamon':
   v4l2-mem2mem.c:(.text+0x2748): undefined reference to `vb2_streamon'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x2768): undefined reference to `vb2_streamon'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_qbuf':
   v4l2-mem2mem.c:(.text+0x28f0): undefined reference to `video_devdata'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x2944): undefined reference to `vb2_qbuf'
   aarch64-linux-ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   videobuf2-core.c:(.text+0x4d08): undefined reference to `v4l_vb2q_enable_media_source'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

