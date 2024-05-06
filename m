Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF1F12D1EC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714982076; cv=fail; b=AoONFyenlZp9XEt0mj1EzwZza7WNGWsSD6M8VEU7apmaP1Xh9CEH7eke4+8B/iZcKqHZIeOCI+rXMe9EZ0GL6ZESiKTQr7XIyBbx4n0i0gfxi6Bqiryuriz06AzRc4CS71ms5mZdwm/EWvxuppBqL/XnNU6vay5t0iqjHlpZ7Q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714982076; c=relaxed/simple;
	bh=otJwFbXPt9/8an7CKrbBpkXTGHpE/ChGE4uaUX5ZC3I=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XJgILREu/aEN8Q71p5DcK+WyCxYPYSvHdoUyTqtL8KaOs73B22WO3xyk1Ao8pHDBhtuGGfNZVQLDPUjl59VB1gTIjqwOZEj2YuXui5rP/qzJ33Kbwaas9y7yXFa7xrmeLZze33RYl0OU8Fvtf55QmGVyRoqS5H8BqtHYofCzQmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7qE7vjP; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7qE7vjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714982074; x=1746518074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=otJwFbXPt9/8an7CKrbBpkXTGHpE/ChGE4uaUX5ZC3I=;
  b=k7qE7vjP+wa0Uu54ZZxMg+kBTHFFyLbBDI7/+9/ENFZvzP5PDnvM/n45
   GpEUDYN5jl4ud0qmbzKRfgnGaejdW1LssM7/mxdEv2f6uL+xncpjQ4PSI
   8SkXDrOBUD8+hLHL5rS+lPL+kKtSTuL4e/84i82vRSYk+BWirgbajI4UB
   fSTzhJmNqutOkqyd5ITM8uJQUFLsB/N/n4Uk8EL6BRx1Mi6MYX9EN0Knh
   cZt5GGjhscsqh2vCFyYr4Jf/+D4WX9LROiZQFv6vrdPQueAchKilGOxu1
   l0hBD1bgRSDH7kwWoheGQq+kAElEVkNdDvdHfggclBjNUUeBQQXTJ2KrE
   g==;
X-CSE-ConnectionGUID: 6/1hkuHjSneTz2yrgeNKPg==
X-CSE-MsgGUID: gRe5YNG9SoyPgPtpXXB9cQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="36104116"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="36104116"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 00:54:33 -0700
X-CSE-ConnectionGUID: +QeR/hZcT9Wo2RQgolLtmQ==
X-CSE-MsgGUID: HmFNoZDAS1GHyQNEuCHP/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="59272394"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 May 2024 00:54:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:54:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:54:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 00:54:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 00:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW4Z6NrkzHDgvYZW1dBJodhd2JAFC6VkeHPN8SoZRWX9A7mugY5C6ohVvNad1CHH0XrxDdEiJzGOENwtYgjyHukPDAp0qKMaTDQTJ5V7/5awgWlnt7ohuhdWKum1M9i1VxjqOAOTjhAshSUcH0F9SI4xEFrtfx26cIAPUBoYKeavQLVfNYbyjbLaOHR2mw4ZaL7XQH9gQ61u4FsJeWhgqG4kGVZ9k4sfgv9kv3TDUjBA1C5w0Lun+jEVgMeQWaeUQzTo8LyCq2VWM3RaU9Jrp3KMyiTDYrK1euCc4j+OWOlUhzDJ4D213Th1yf05Ii2BHmEPP7PwSbttDX6KOycbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Af7uDZUDwcLZ7oHf5dLp5qd/Sukemg5/OKYXaXC0fxM=;
 b=B99BV/bvSIw86cPHOomVwFwuhqyhKGBPLyHcmJ2h4VWp54b1O6YJ7hPN7nHz3rHg/eioYpaDGhBFvlfZEyFundVcilnDRSgXecoW2DdELPwvd89sJPBEri8hwAJlWcuhfzpjVyW2zMC5ItxLs6TMtivIjvRRlJeuX0UB4Jho3v7mDmdV9bbRRK8sXhpLjWfpYYfUylhsX8+oBZpQ8cwCfm0mpSqkcpI2dvP9Bzd6biiCA6PkCUaT3Ol0rNIfYWshcjryIPZYii6f6wHRuj47H7dutsQSdwszbgS8YJqI1UYd1eCYfC8ceGrN1ab/Zwg2Gdqtw6yN5PbJVOqpgiHqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Mon, 6 May
 2024 07:54:31 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 07:54:31 +0000
Date: Mon, 6 May 2024 15:54:28 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Gary Guo <gary@garyguo.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [nbdd0121:thin-lto 3/4] rust/helpers/helpers_combined.c:
 linux/export.h is included more than once.
Message-ID: <202405021222.RhKDre45-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 62cd3579-bcdb-4038-b284-08dc6da1c30e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MkBAROEd/GebcVD7VcHmwEhncP/mctB3MtBalyUbQeHB9FZhBdSuoD/6v7Gs?=
 =?us-ascii?Q?pRbuw0WWqUQM0vGz4OaRorYy8FgLPg8brv9+yk2FfFY7rh92tvv6BcHuGQ5x?=
 =?us-ascii?Q?K4iuOBLScJv7NXdEu0NYoUBLRKx6euyZ+Clb5L4AHUpyD2Ot0Ige59+irD6c?=
 =?us-ascii?Q?RkL5Ejs7w1BoybQ2v4R4snjtFo4zp+u8eHb1ckCal11dCo0B3P9a2Ld6OBoA?=
 =?us-ascii?Q?n0CXChE8CRkt1gvFGBuv1Vu8OunukyObawzEMP8o61UaU7vbqeae2Q1mrwnh?=
 =?us-ascii?Q?SqO0Q5oUCgQ1T8TWRsCzdZUHWp5dJIY1vaUmfhXR46rPuSO2lwUgnVESBuDz?=
 =?us-ascii?Q?uRQOEGAqJLTJI8QoG8w4sKEfKziqqMtS7HsFprcr/FPhfYWiZCBEfOIoLcSv?=
 =?us-ascii?Q?/EXOhDjSBtu3mHyTyVjrVoce62BZvBxPkyDpK6uqIJcx61ocDPjrm4N/SEcu?=
 =?us-ascii?Q?VKCOSsaj7Xb3eo9G90U2uZ1K1keiWsAD6U3bIlS90dIMV8+AA6+JekilvGHH?=
 =?us-ascii?Q?47lG6kWqtfdYmG/HjZuvTHXz5OwSKV6BrtKxtF4itWPG7g1igcD3VNgaw3/k?=
 =?us-ascii?Q?FX8YVkz2JznhZiNY79ET172gfJjgN4g94W1+7Yuge7w0o7Lo3BuDW8ujJayy?=
 =?us-ascii?Q?sMviARe9FohT0zvLfGtbn0BDJok2mffmeIRAiAAgUaeuSiabX8Y81eNYhBCO?=
 =?us-ascii?Q?KnB+d3jwHsglA1g0joB84yEmvKeJ+lYWGMWaLsMgdiNKiI6nZ1nFYsRs5J+p?=
 =?us-ascii?Q?2iUpX+/T8cxVsbRNFMinuHix9O030ziuZxRIJR5FBocThCzIndZY7LAv/Js4?=
 =?us-ascii?Q?wj8wltv1tu1Yl64MgMUj+eS+KabmlCnbfwPbu0/aDeAN/18Am89JDYSXfIgn?=
 =?us-ascii?Q?ANt2dzf/+eAX7mt8eYu2fyMTlpAfmeiAEBT0bqVNOUd4jOCTuxGw+eZ598O5?=
 =?us-ascii?Q?dC72z7VK80bBIJe43LWpMbkx59YUgJuxlZFsZI48/rTe7zb14Qv/roZ6UhFl?=
 =?us-ascii?Q?zgAgkCPDeUIi4VYuudSsQn/3A8ynKcoozXXT2sguLx2w8518Y2RxXLY8Z8xO?=
 =?us-ascii?Q?w7Xk4F9p8VAbjQUYxoLYRyp238zw5OwOOZmHN5qLq6AT4eguzrRvowCrphzF?=
 =?us-ascii?Q?ecJHPJMqFtE8i6VrnKWfTPwzInZIMT7ZC1RX5Bbtj8qy8RtcSsrqb++hW8CU?=
 =?us-ascii?Q?rUoE8bUbp1TBmgUensHl+FBTlU5zG1eDP0nMLQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P3I0XhqK5ivDzaDe/U/tWhhd0Fiw19urRDd4qhJ5rBUhX5RyR9rfPPiMxtNZ?=
 =?us-ascii?Q?s/br+ot4Ajc+uHKnXtD38IphPlITLaRJjlNC1e56VEiEoVwKIEbfu08f6sb4?=
 =?us-ascii?Q?acuuhWf5YQ2eBQxjczbYWRn8rthhtW1AWfFXM+Y6dQC+fIZtiwLqRHMr2yQ+?=
 =?us-ascii?Q?VLqFrwrjl19zCkn4RPIrkMSnULK5QWtVmwwdNDCUg0V2x17NGwrX5qZNYoTM?=
 =?us-ascii?Q?zxDJ00jgC7TvOM+/Ww+WLStMk2VnbIxS8cbNydGd19D75YMepA3MDl0sSv8Y?=
 =?us-ascii?Q?o15P1/4h7XIw2l3wFofy9iTadPNQBF4I1Gwi0CC6ZnKFdpTvX4jKrAH6CjKV?=
 =?us-ascii?Q?v/F4RqLrBue2FKSfQm3LgKbzefJQ5E2mMb6YVAu9e2x7mRgO7uwO43JGCcGC?=
 =?us-ascii?Q?9rnpl1IHssUiOKY7kQlh9tXn5XAfUFP1agUMMNhqk0Mq4W0O4jHYoj4vcL7M?=
 =?us-ascii?Q?xN5GllT5+GFHgvns9ZBaWJp0mRFNb5Er5cL6fH3Fxi32ogASR1vXZiQtMu7y?=
 =?us-ascii?Q?YffTzBDuxJzy70gkSTJTI+P2FV0siIsJsyOHfEROI7LenmHnksw3/xms6O7O?=
 =?us-ascii?Q?I4CYWBinwpH0JvslC0HPLVZDGzBDUKClaeRPeuQ2DZ6ArINGphbE6faabYeU?=
 =?us-ascii?Q?1+LEhqYI0hSbdTj4YbZMUS2KAipzai3lF1rArrUnVi6Dl6FA7gbUhHD3TYUJ?=
 =?us-ascii?Q?BLusqzLUPDNoRZM6gizUW1QHymNEObS1v2mBuRbu84QlJey53lGjzlR2pB0t?=
 =?us-ascii?Q?MqgNCR4qk7UmZkli93ooZTFxNpPz1iz//AF1YwgFfktm9FplPfqw3Pp1SkSw?=
 =?us-ascii?Q?kHSRjilgEHV5OSV0nOsN8rHeE0qJQN7sm3N0pRSPuouYFfw8o1wuvjQD169X?=
 =?us-ascii?Q?2z5Tnf/w73SXQ86OiFywWpwFFKJF8j0MTSfjtkoce8d27U1TXWjCMlC9ddc4?=
 =?us-ascii?Q?plwjRFM6cbY9KlylsNXB8vxonGC3cHy0S2PoBVFvfBFcgXy7nuPfGP8SpkV+?=
 =?us-ascii?Q?9jZcieL6tQyHjHyuOpWyoUf/7TXoUguNXwgPJZkSOgRvmG/wicdGAx50CqSl?=
 =?us-ascii?Q?1Qe5ezU1GDJ5VafLGVMEsLbrm9yN2ucZFZOcx1XIXwCMJbjNSw8H74Eu9dzf?=
 =?us-ascii?Q?jGyd9seO7Nf30IcmtIb0LXU6L0W6Tsz9pzjr8U/kcLZ21EY39NMPgthugnt2?=
 =?us-ascii?Q?EMULqtFKdO4up66tBCNtQx1e3cBV2qaVMJIIRmkhVyXggRA6R+rJS3PtDlqR?=
 =?us-ascii?Q?62391yDdpT9kouLHeBkAqssjIY/8Qh56DrcAFJHoX0SZ7p4ztgsGWDZ1K28L?=
 =?us-ascii?Q?XbXBzZ836wH4BsTLsIvlYVCwVAF8hpG4cxXy/M7wQWnCO7YtaudtawlEAUs8?=
 =?us-ascii?Q?XeUZjb5YM1DnbYDXWPu4bc0PUnvvM2jaZPqdduKseQFdwxUOI8ZqUTJh9KOe?=
 =?us-ascii?Q?V9WreOps9OVvtwygbJmoZRrFZvw4KylDhndleFap65BDLBHvL0HHLBArb8Pf?=
 =?us-ascii?Q?II13MHQXavvt23fQ/XO9TeHxBQpWAHqdgj341q8Ja2tmi7VadHzINX6+Ov4D?=
 =?us-ascii?Q?VNBw3YBY2JA7dLPWresAis6sGkFAkuQyiRDCnM8F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cd3579-bcdb-4038-b284-08dc6da1c30e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 07:54:31.2381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xE0fIMK+IAn2vEf+t7nx8+Yypflm7VyqlIP6r0+JYAPjVh9XRh475x8bHq/xir7gA58DKA6b8k5uLNrqQ6DzWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
X-OriginatorOrg: intel.com

tree:   https://github.com/nbdd0121/linux thin-lto
head:   98d45a070a161cc285a5aa8f2ab05159ff318146
commit: bf2d01fbb08533e84608386fe310bdd2cbe058af [3/4] kbuild: rust: auto generate rust helper exports
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405021222.RhKDre45-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> rust/helpers/helpers_combined.c: linux/export.h is included more than once.

vim +36 rust/helpers/helpers_combined.c

    35	
  > 36	#include <linux/export.h>
    37	#include <linux/errname.h>
    38	
    39	const char *rust_helper_errname(int err)
    40	{
    41		return errname(err);
    42	}
    43	// SPDX-License-Identifier: GPL-2.0
    44	
    45	#include <linux/err.h>
  > 46	#include <linux/export.h>
    47	
    48	__force void *rust_helper_ERR_PTR(long err)
    49	{
    50		return ERR_PTR(err);
    51	}
    52	
    53	bool rust_helper_IS_ERR(__force const void *ptr)
    54	{
    55		return IS_ERR(ptr);
    56	}
    57	
    58	long rust_helper_PTR_ERR(__force const void *ptr)
    59	{
    60		return PTR_ERR(ptr);
    61	}
    62	// SPDX-License-Identifier: GPL-2.0
    63	
    64	#include <kunit/test-bug.h>
  > 65	#include <linux/export.h>
    66	
    67	struct kunit *rust_helper_kunit_get_current_test(void)
    68	{
    69		return kunit_get_current_test();
    70	}
    71	// SPDX-License-Identifier: GPL-2.0
    72	
  > 73	#include <linux/export.h>
    74	#include <linux/mutex.h>
    75	
    76	void rust_helper_mutex_lock(struct mutex *lock)
    77	{
    78		mutex_lock(lock);
    79	}
    80	// SPDX-License-Identifier: GPL-2.0
    81	
  > 82	#include <linux/export.h>
    83	#include <linux/refcount.h>
    84	
    85	refcount_t rust_helper_REFCOUNT_INIT(int n)
    86	{
    87		return (refcount_t)REFCOUNT_INIT(n);
    88	}
    89	
    90	void rust_helper_refcount_inc(refcount_t *r)
    91	{
    92		refcount_inc(r);
    93	}
    94	
    95	bool rust_helper_refcount_dec_and_test(refcount_t *r)
    96	{
    97		return refcount_dec_and_test(r);
    98	}
    99	// SPDX-License-Identifier: GPL-2.0
   100	
 > 101	#include <linux/export.h>
   102	#include <linux/sched/signal.h>
   103	
   104	int rust_helper_signal_pending(struct task_struct *t)
   105	{
   106		return signal_pending(t);
   107	}
   108	// SPDX-License-Identifier: GPL-2.0
   109	
 > 110	#include <linux/export.h>
   111	#include <linux/spinlock.h>
   112	
   113	void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
   114					  struct lock_class_key *key)
   115	{
   116	#ifdef CONFIG_DEBUG_SPINLOCK
   117		__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
   118	#else
   119		spin_lock_init(lock);
   120	#endif
   121	}
   122	
   123	void rust_helper_spin_lock(spinlock_t *lock)
   124	{
   125		spin_lock(lock);
   126	}
   127	
   128	void rust_helper_spin_unlock(spinlock_t *lock)
   129	{
   130		spin_unlock(lock);
   131	}
   132	// SPDX-License-Identifier: GPL-2.0
   133	
 > 134	#include <linux/export.h>
   135	#include <linux/sched/task.h>
   136	
   137	struct task_struct *rust_helper_get_current(void)
   138	{
   139		return current;
   140	}
   141	
   142	void rust_helper_get_task_struct(struct task_struct *t)
   143	{
   144		get_task_struct(t);
   145	}
   146	
   147	void rust_helper_put_task_struct(struct task_struct *t)
   148	{
   149		put_task_struct(t);
   150	}
   151	// SPDX-License-Identifier: GPL-2.0
   152	
 > 153	#include <linux/export.h>
   154	#include <linux/wait.h>
   155	
   156	void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
   157	{
   158		init_wait(wq_entry);
   159	}
   160	// SPDX-License-Identifier: GPL-2.0
   161	
 > 162	#include <linux/export.h>
   163	#include <linux/workqueue.h>
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

