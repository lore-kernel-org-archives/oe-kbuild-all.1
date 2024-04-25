Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B03EA9B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 06:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714026464; cv=fail; b=NiVRbYITAVHNv/iDM+ALOBOmRK3be2llvlOiy2iZfbk2Gf2uN4Vr2sWYsk17Qn3+QizHT5srNDXjZLMN/5n+hYN7gCdQKBn/1DUtl/I2xz+rOdawJOLYAvBl0BfEuUJ70Uz3Q8aShbyFvR5Gd8i8ztXZyVQAHEXGbE6aXkK8hxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714026464; c=relaxed/simple;
	bh=48dTFp9eakuSZQnSbTZNTwr8yHpbEa9e8RtHjToW19Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZOIoeQuE6NgKl8LNdhbXpOvsv5N6vPzXCLfD2oSzQqrLaGX/XAbsaa4xKVShihCmX8RnqcaP5F2u/nkO87PPWO3ginFbHsOP1Ovt4eQrBJjrW2aSPPnbeRMOzxqHEye4iUgnida091rUcQ08PwtxVbmsg1cMm22IMEiliNTaHRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K06amOyB; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K06amOyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714026462; x=1745562462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=48dTFp9eakuSZQnSbTZNTwr8yHpbEa9e8RtHjToW19Q=;
  b=K06amOyBhNq2D1w0UI3aNpxX1jYC4l4FAojrVCC3s7x7c1Hy9eWxxi8o
   DNo+IKVIpGT5CjjAgijP+qM+MbJaKYwKQfu+ttDaC3+FOt++Ro/+rwv//
   e9EpcdgI9KB/ssu0l7rMmTqiKMc/bcm0IuFLkpnpzlPKRoDpJybvbfl6m
   BEb3kekG4QfyB6XQYNw3DNpz77tjfeFipTBVYUQQEJ7LGd0yJtYAZdoSA
   4N7Tu/RdLPGYOxiVYTdiliQaTcd738FVvn4J/Ty/t3pysFEndoEn0Yxmi
   g6Tz4pwoiafPQsOTDuEa7XGdOE6p0le/0g5ZbyVA7F7by7v0xN9nYtKCD
   w==;
X-CSE-ConnectionGUID: o+inMCFqQfy2C38mowGHLQ==
X-CSE-MsgGUID: IhslytWoRKautXCZMmYB3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="27205895"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="27205895"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 23:27:41 -0700
X-CSE-ConnectionGUID: kaphacEJTtuN+y3e6cBM6w==
X-CSE-MsgGUID: ykJbKe5aSyCeOiplPdBm8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="56136964"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Apr 2024 23:27:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 23:27:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 23:27:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 23:27:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 23:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZ3UYQAa/t9rQ1yNJI/S9pv0mfcWAH+TpbhMBmv8Lc63Ao88UH7al5Cdb0LXIgPvOSJfmiV82gSvfjIem7sr0OUknSOVDhVv7j0LV4VRZvnYq6OhvTcUlakpx0hsqSBUK5czODaA9mBUMjbApDk9T4HcHZ4Dn5C1SVTk/68nzuhmLNmnK4PDCY7vafCN2fTpal+SkNmKptIwSUdoGBus1FR7yE/XDJiT1Wu3rjNpozgqgl9uXyKBS9f0cCra13/02sqe10FN/nQlkZx74xFLWc+oRIj4SCjtQeoBWutLWVbGKLYMkpd/pz9WO/a+uu0GEpTkOviFAYgUghlBhveEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGE5yt1fJicK2mAhhs2LUVqOhycaTsISVixtdqWc7o8=;
 b=Ufm/5nXOX2FSvJbq/ucuTIEmfaNk6uKQfhA0uhIGxmsLZcmrw8Qp3Rt9Q70oqB+78abW0IopLzN8433gmncPLP5GAKoTo+zDHlbrhVJzDyAXKhzyh8uG9el9kw/mtxOC1a99tE/Y1j1CJIfWsEyTspVfKUhOybdWXcxi5yqlq0tNO/UEU2xA8J8b4R/CAEwa3PuoY0MMoinbf7ZeBW0Qyb1BA4iV3Ozt3XyWUqVBV3ugHoYzJhlJHMST3bqFlWjho0h7+EnB5xb48NFvfYl9UFryCElVGStr6XqFXIsb81/6AgWLdqnTWLl8Bv+Izcw5I6C3258ZLCgXFVWSWfoktw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SJ0PR11MB5023.namprd11.prod.outlook.com (2603:10b6:a03:2de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 06:27:37 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:27:36 +0000
Date: Thu, 25 Apr 2024 14:21:06 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [agd5f:amd-staging-drm-next 2021/2033]
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h: spl/dc_spl_types.h is
 included more than once.
Message-ID: <202404251153.Ed5aHK5H-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TY2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:404:a6::16) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SJ0PR11MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: b06befd0-1522-43f6-3fde-08dc64f0ccae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c/hx1NSqgD4uRDAQ8C+Pcdi5dbcLcW2cVcv6H9F4SE/dfr521KESq7M/5zWY?=
 =?us-ascii?Q?ye7QFfvZH937+SIB5l3ut0KoR55RtmIfiMYKvTlQPSjycGOsd5YT/CupDUtw?=
 =?us-ascii?Q?Izs5RfnmSL99WJju184udJ4JsZBm3K4ULHfLkCGu+qrVBXo9u8QuJ8kK/c0q?=
 =?us-ascii?Q?W0i3k+Pxkw/2OT5OzjINYPVycgyr8y5/olWcuU6AsQGozrFbBMxTUGIk9IXS?=
 =?us-ascii?Q?XShENRjNqGUzwIwW1q/OojlmaKNMlw/b7Gu59Ng2z0ONdJQWKdoEtqRMFIy/?=
 =?us-ascii?Q?FDvo1u8AxLZnAVIHqf0TrKsu8vFQspXXn7HhXGYXXVXROLbUoaurrlx+4u/C?=
 =?us-ascii?Q?AtmUzAZBj/+5j/HKr3COaFCPcGBGfpY+6vKOfLb2WgVnWLRXItVgQpvyJwcj?=
 =?us-ascii?Q?pNNzgcC+vvTsTvC6jJEYdnpoVz4LOUAHqJIG0f1noCwrU6Hgbs0gaocKLk+4?=
 =?us-ascii?Q?US9TdbZRmO6RbrR2zcnLJLXQ07H4SEk4f/BWE/+Q+ZvwwNpT1kDG/XUTTcfq?=
 =?us-ascii?Q?CzRsUSP7qm5Or9wKqGkHk100fCsr8D9WR0AP3k6eJHo9Hbp9gUsEayDbp+0D?=
 =?us-ascii?Q?mAuSkBA2cYzrd41vdW9LXMhSAfnz3xyf+mzluBtkTx0QpX2qrPprmTEPu2MC?=
 =?us-ascii?Q?46jspM6Muc31AiQdsILUZ2viz/7/8/DWB/F7YKdvJBx0F9QUuDRQXZ46pMtO?=
 =?us-ascii?Q?44lWvQeC5+rAkTSeCOnORVo1AX/cdFwBaX4phlTbz26wQrtCNgRgTZwRjYs8?=
 =?us-ascii?Q?DNRYhnnLhQgSAVydE8/MODZQ/uZ5E5ljuhzchuCubHb5YQlN0scMTX6PdeHt?=
 =?us-ascii?Q?UX/Vyo0CLC/Z/lLU5EC+we0tIAPC1AXo9ABtcnINjwxyln8mh9YU4dBzRAZ2?=
 =?us-ascii?Q?pBpez8/19WLL2HIvKUbCSIjj5NFeGp2taqtAvKsLC6acyAYem9UXMwJ3FV1f?=
 =?us-ascii?Q?ddXmvWQFHoet9k6457NlRGttmtl4Iy6ofxkT3ogeAtaNMTw1gy4l1APSfZKn?=
 =?us-ascii?Q?yNyMVb2RaNOUtg9j0GfVtSAbW9tJpIWPjC3QbGkHcDYhOeAe7AvAHN9GUTbP?=
 =?us-ascii?Q?R3Yi1kjsDl44rznTQ83GqRfcbo9RVRulQPBGEEhuhVUuRyFjWA9/cOdurCbw?=
 =?us-ascii?Q?cHPC5jXQP83rcp4MJuIellxB61pruOw1Z6EmLscJM9fBi3/TSC6ZUXthsDam?=
 =?us-ascii?Q?shkLa7F3ZiuWjAOr2uC+kmL13Rl0Dz4NxYXEbLhYL67GXJ9uykwpO1c9L6Q?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1w8wPrKI+/vhHTDXzUrNOJRPz4MJ+5Oe5B/buGZ1oStED355fAzqIV35P7o0?=
 =?us-ascii?Q?lXxSNHlW/qSLkB4VPHmwrKNDVwJ2CP+tz1wz/adyvcMPLYnQwX7TtJCMOo9k?=
 =?us-ascii?Q?469urLSDSW8nj9txtiFoY3kzUziyOewyxkDndxYIyfaucwPJURyUT3SrDeW0?=
 =?us-ascii?Q?vvdaOCzR/trogLWdNIBh929vCF/xV/UFGtl/U2Y88o/SIYkprhDOvvTLiDww?=
 =?us-ascii?Q?kx1IOE5PU2BGboDjoCzCbUSp5NKVXPhgOONeud/RZ0h7vlZYooPyLPsgGjSq?=
 =?us-ascii?Q?ybe3U1Ok42znhZDD8Mh1EjGNzFUQG8gtj6R8o6+JbwN2XUEjDRFbPrELjFhJ?=
 =?us-ascii?Q?LTe94aLvIkMChtv8jXNDaWdfYeTlUKSbvknsqBMorEPh4pmnt28igbAAk/zZ?=
 =?us-ascii?Q?HsVegBdrxc42I4Phc1niAZ1OaFyjovwMgNDVkPLrryk8TSpWFAdOW1GvBY77?=
 =?us-ascii?Q?In6GU7X3toZsnFpe6Cmh6SvtbRL1jY6uj4Bkrw1FPXDZKD1YZJWXpHdhk5dN?=
 =?us-ascii?Q?Yp6aCwt5/vzaGVdRzr9MhRNd74eCuzpjehdie/rBDzGwvuH2fv11fDmGvwd/?=
 =?us-ascii?Q?9xwm8vMpfbKb7EZWTORE44rnYuDm3EKa/resTaQFWy0aK1UWFoOHf3N6pxP0?=
 =?us-ascii?Q?WFgMRb0xQlAD+FstL8zb3UOO9wRO48PaKHCHew1fiPpNRU3x8NpeL2LO0p84?=
 =?us-ascii?Q?+JZ8gUMQHkcYXKziZMe5FI8OtwmqfXyvnxz8OSB2Cyi+YJBEk6tZr+selh1l?=
 =?us-ascii?Q?sHmnM2XpSehs6WouZJn5ks5XfHwx/zjHCJMPGffasKKMGa1vPgqakxeY9JCl?=
 =?us-ascii?Q?1p5I8o6UhDGs/tcsFlxuYaBHcZWXSB+I+6DSGuK0BZU5uDkSQfeJn3DqzLDU?=
 =?us-ascii?Q?rDns2CO9uxOPeWc9DfzwqTJ4ues012S+Gl7n+RIqB6Grj9gb2y/sJMJ26CQS?=
 =?us-ascii?Q?IzFQACrHOjHf56U93Vdr/dYllMHX+OBafFmcmnp3x6cJqLXNcCpiVuZhd5i/?=
 =?us-ascii?Q?OQLbt382blWmjFVRnW7BMCRTqDOXB/BvuW4V4mdABbeoER+f3BdIJsNqpdJI?=
 =?us-ascii?Q?VR1Aty05Bag4Gt1xg2zi77GnlxEQ7agJR4sjXxxABxBaKWmcLKtzDo2nLB1Z?=
 =?us-ascii?Q?Ee1zqljZTCxDuR3djeNUQAYZnoNBcolc+6LF3X8SOO1stfMgKko1296cFeuI?=
 =?us-ascii?Q?UrsiZUlAjEatSe7pTwIXvqGr1Bm1cFYtE2w5n2oVMZvNb1ZiwYbsrA5PrgJm?=
 =?us-ascii?Q?75x1vqcEPjAH6+xzqHkJ9J3B4p288QN6InaHw64JeMFYG7K7b4BFqFVPCbUn?=
 =?us-ascii?Q?O4Olvs7eDk+KW9CrAp/3ka7b+DTpARumOd5zAfRr03EcMobD3+bUBYrevxVI?=
 =?us-ascii?Q?+d4Mw0Dr71r98gzLuGMJXb5s/nom/4H/1Ae6JdF20ZDv78ruNTuz2Y+Mg7s7?=
 =?us-ascii?Q?HgDE7ELB2nGMH+hYp9/Mm7a1MtaUruCbkEqQ5OjOe9cU3eeey9bE25csty8D?=
 =?us-ascii?Q?oGLfUu0/lsdNSIt2LiyfntrhV0SnlPH5SzCXsYbfWYvDzCfJS5bRIZRgphNB?=
 =?us-ascii?Q?V36yzHs0bqxCktaIgu0lXtbGHLjtUIwf8Ry1el7R?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b06befd0-1522-43f6-3fde-08dc64f0ccae
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:27:36.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcjb643zSY+cNLgvlVoP8k2mSfMljEPJk9sWHGpZIo8phap6zJ00IwTl6XJvBQgwBI98bjJLqnInzsaj/d4YZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5023
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   5550c5defbdf958f2df459be74f87afa9eb0bdde
commit: 4331f4f5985cec71a0ca058d8e58d77016e1498e [2021/2033] drm/amd/display: Add misc DC changes for DCN401
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404251153.Ed5aHK5H-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/inc/hw/transform.h: spl/dc_spl_types.h is included more than once.

vim +32 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h

    28	
    29	#include "hw_shared.h"
    30	#include "dc_hw_types.h"
    31	#include "fixed31_32.h"
  > 32	#include "spl/dc_spl_types.h"
    33	
  > 34	#include "spl/dc_spl_types.h"
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

