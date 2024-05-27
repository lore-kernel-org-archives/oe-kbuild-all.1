Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234F563B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 01:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716772006; cv=fail; b=n9z/kCuWWtZIBhfQp1DcXNgHi8b4s9PjGufRepXeeQGWK4kIQeeULd6cY0QJ9woznesC1w9d2bIFnk1GNWgcyVjR0KkAdCudyqRDJWMQ6Hb0f8v4kHNBHcUDryGl1CAYJO5N5CidHTdbjt7ZIsKAfx5eCjimtNbkINCDV5vXnbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716772006; c=relaxed/simple;
	bh=iz/IJV/HXEbQLMSPEXpJK4Awe57QpcTbhrZ1sCg/kt8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eluqh76H+pctXW+N/OAINzRH6YMRqNeeeoFA6inKIbtSm1ibGxHVUrRX6PW2vKpbWnCCAlYu7MpV5N9R9Aw4I3AXUH0WPNrazgz40JBDNgjnVH4vnfQAQRsdMzRjF0Ymhndfg7kJ8LV5e8kKWq/dsfyVR2ttgL9HZZTekUqO9S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FF8/tSPs; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FF8/tSPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716772004; x=1748308004;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=iz/IJV/HXEbQLMSPEXpJK4Awe57QpcTbhrZ1sCg/kt8=;
  b=FF8/tSPs07EpdKebL12XgiwUYBzzxHXt1+s7mTPNTPJg9wJpsvUM11MS
   J77IOuKVqo0BR5kg+6rlWM7RW1mpewHoyDXZApUGsR736OPf+Q8bWnRxZ
   uvu5bd1fgCb0Z3sIUPO5QgT9EYi2kAR3xNN6IuMPsN3FxItvCnI8oJsjY
   dvAuyU8B1pNgphluRPBkhbIWplSOSPBMSaEPGc567LzYrpYffOTMaShsB
   9kbxctlYxKT2qIF++F9o3Dpdcrt8b/Jwnn31fPH+m6CP13IR5FUQ0qX3O
   2lg/wJUdBk2wUbj7cniF+ULn//gRKYHAFoHSfsOf/iTuMnJ5ZFweyzRWE
   Q==;
X-CSE-ConnectionGUID: +ykYOOC4S3qGZNdZJML0EA==
X-CSE-MsgGUID: B9ozdWTVS/qPKgWsQvsFQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12895376"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="12895376"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 18:06:43 -0700
X-CSE-ConnectionGUID: mXvWP8QuRVyOq0HAuGkEMQ==
X-CSE-MsgGUID: nu93332zSY6rHBkFDnjMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="35088589"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 May 2024 18:06:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 18:06:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 18:06:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 26 May 2024 18:06:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 26 May 2024 18:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSq3Dk4ZG8+qbqEu/u6EF8RRha59SMxUfFPGsEGVJ32tPtIC0oxDzWS7Nsy+vwkQZiTV+np+02xWE4OEHPFLnsREN/oZhb0dwVUWTYkOFL+8mJfPeh1oa/GN/h3NfratDN8Bj7Ap3DupDhpKucM9PB8j4MV/i+2gmeDxNZ4wS6V17UZAPb+zbC/0+o8+xm7Nju241l+9nM6HmQQkJoeDqb8OOcOGU62Q/F6nclHo3i/P4AQghJiUKnAAc0F2d+GJZS2nW/X4/x5fPDe4mko/z/ycTCNgJUDj1OvyGKtMLK4eG3xkkMumLSKhMZwwfGc7vIoyUxGsWm5wYwpko6JAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1X4K3FE1FZnz/5mQlQvtJAEdYa+XoqR/LOVtdSJcHs=;
 b=Dt52DlJ1h6Qn3TdY/VliRtZcSEGGl0Ub/R6ZQF66HO+QsmRMm/yJqMkK/3xw3AejQg+09sUkPT1EvI7+mXoJU029GvwMFlT5R6QewGjorfd39ENOK0HHMaZQez7muaUY/cmfM9yohEO67vERNAk8bDNzb5mDgsqNvSjzeVWtHlvU2d52vNesO6wwuSnzFONeVIoHpOSKsDdK0OmM/B/DnwUtsa1v7SqyE/SKDYSC1V8apmoQF+YgxTSa/UPS/QHTbniZkS9c0Yp57RLd6brl1N0rBkdVhlffYZQhf9lrJkVnoRUgMy/fsvLI7ls9dfeDxIkqcY1gqHlm5ZXuauI0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 01:06:39 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7611.016; Mon, 27 May 2024
 01:06:39 +0000
Date: Mon, 27 May 2024 08:58:22 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v3 6/6] module: add install target for
 modules.builtin.ranges
Message-ID: <202405250226.GFChHcfz-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240517042839.544650-7-kris.van.hees@oracle.com>
X-ClientProxiedBy: SG3P274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::29)
 To SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f58ac8-bd12-4427-f910-08dc7de94369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oZOJbSI7h3ite+FDxZ8a8pq/ozuFOABqghc+Wlg/JwKMSH1d1yxu1MSgRhLP?=
 =?us-ascii?Q?YnKozsJ7lHLFjpXyyTp9DuFa8cbsmL737MrEOotEcLVOK/7e487MsrVj8o1/?=
 =?us-ascii?Q?qkp5MLWifCytcU18yBf+gQZXsj7xYSA/oP5zjCi85QHi8/JxmH4eLv2X+2jV?=
 =?us-ascii?Q?0S7/HMvzl0HabR5/a/ANKaL79tzEY9wBSTCRJf4dmMqnfMiRn53RmnbNXzCr?=
 =?us-ascii?Q?6sa6VBDWIuTPXt79uep7PKZ7U6cyLtAix6LMER4ujgvh8ZtyZ6HQC2vmkUyV?=
 =?us-ascii?Q?dK+YGdSzLA+2CIdGTizEOXEBabb9mX7jdz1AoquBVRk3pLZS6iYjsa6r4wSZ?=
 =?us-ascii?Q?jNPT3YIICK9RXD4klqXr2wSXIv3s1eIMYEsB+9z1nK/ZklKKWmKifvMPbJrA?=
 =?us-ascii?Q?EIj/N9oQx78nXKRR96OU3B6FVdV1yN95pIZcA/y/A+VZxsfZZhO8Vv2PNaTK?=
 =?us-ascii?Q?kbaNqQXFmefZ3uy1eo8dbhaRfpZ3g52/MxIauhQTwkC/ZaU1SU/ZzvVw9bbj?=
 =?us-ascii?Q?pti5G5wd3aVZZ6IkgX8GXTe7iNFEgh9ecdK/jIcP94pEdoSxcr2nPfnohp2r?=
 =?us-ascii?Q?L3D8e4hqyyJU0kmxbs5rosNN9CoJhRabp4FcwLNqyE/2e8lCS2goXR9mB6/U?=
 =?us-ascii?Q?l15CwPQFnaUOTBfa1ugrZRh7hvjwVsVirNSQRQwGRcYyhMN+kYihLbhD6mvx?=
 =?us-ascii?Q?stohicb/2vLY3CFrLuvcuqecPOdYcrQxAnghtZ4QBsK/xv3H32Mcr31np7Au?=
 =?us-ascii?Q?9NEh0ywD5pwp5dTq8UpYn6rEhbP10L1+noZ4E/qk13CYTE0DW7Oqf4MLnMY6?=
 =?us-ascii?Q?gCfEIrnenLu9d6wBvAurg50cnDB9zaq05tsIaZpWYNXz/kuNvwOA4kE35di8?=
 =?us-ascii?Q?/M9jr21YMfAs3mEYEEv1Swctj5ElbW+9X5Li79KYnZudvNPebQJgcYRJOrq0?=
 =?us-ascii?Q?/mHRBSGaKHVssyehf8bAw8FFGkW5YFHldt+/B+TkTl5dBI6NbAlSEe8RTyb0?=
 =?us-ascii?Q?7vgU+GHAhDzo5oGiVfC8eMKzrD4hKhLv4hV8RMn3LLq0UwgKl+U56lkPK5eD?=
 =?us-ascii?Q?PgfP+gxubEOfZqv4sQm5Bn6m4hOQ8FJ556NR8Iq7lbvTW765mQX2p4ZCcxq9?=
 =?us-ascii?Q?oj8TFJtuGy6fDgXw1ozXqneRDQdkUh+kNuYPAy+AEDw9hTi4jpXK5ETs60bp?=
 =?us-ascii?Q?r3YiEXtFD8szVWS4lHvmOzVYPTCrY2Jqsg5bryCd6yPA/7qTTuR0j0lTHJA?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HAn5E1ztx3hr+ClxokK/Rn1u8r4YKcj1mjWd0a0BlELPd03jXPuhdnkU7U2r?=
 =?us-ascii?Q?ugj/dQDinwAa4t1bgbYnUP6ocHOMteQlIjQ/RPp/i8IZDLf2dnsDDxs+eqma?=
 =?us-ascii?Q?nWQpphhotzxICsEFcVrsZyT4FsfoLURiXIV81KJs7h7+6SmpUuiDDJ52s8gc?=
 =?us-ascii?Q?QGayj3fGwRjTXCzwtHnW1QRhwCO4Hf7r8UVtsJRMy1FnqaykLWavQRrTAjSb?=
 =?us-ascii?Q?AZ1uGeXobSLt21oDNDrGtaArjn8kdILF8kE0RSDPRXOW3HtM6/x7rQD7GRLo?=
 =?us-ascii?Q?KimQ6+0ja5wc4xgnzh7qZrUJCEaddZcDRmvoD7dUoAJEMs2jTyr8DRntN7Lu?=
 =?us-ascii?Q?oUX2tMnENErf5muz1sLIIpSDjPChcVQQ10GYiTKOWtEIkGFPLz98/EfwTjOv?=
 =?us-ascii?Q?SqIFJkd/r80RdY3qxiqaXnOXlYBbs+tnX4WVDd0g24ORpcUVUpo1HFVl1Ifz?=
 =?us-ascii?Q?5AfnKerXh6MCrLQLZv4dUWNPxVSFjcmlw5cNOq8ntqtHDQTLwgu1zN/j2o7c?=
 =?us-ascii?Q?s3VayMkH3O9BiS0eEam22byGuFn3HboDl/liODYFU2R7MZH60TNVc5bcTFK1?=
 =?us-ascii?Q?WarPdToSdRyzReC+28Qwm/DEe6wEPVTDlJMi59/6Cs0QDsCT9HbtsmAo5nrl?=
 =?us-ascii?Q?/nj7JqdKP1Xs3RLUQsxucYJkOisseGcMsUucT8dYlY/lju/dVN3dWQOUFbTI?=
 =?us-ascii?Q?w1H7nkAuWHDIgndE23lUzGitAm8f0xP7o6O5uXkYLTfcf8NLGljU6MiNHQtT?=
 =?us-ascii?Q?F6xpiaUBC3exYhZ9S8I05p2J/7VNkq+4xisYbuDE41rQdPlA/zns83bxD2p9?=
 =?us-ascii?Q?jTSvyNv8ZWGOI2FVo4/EMZE7Vg4H5DeaupiB56FRE8Uix9dQJwOV4oYC3aM5?=
 =?us-ascii?Q?aBAkK6txjyRRZr0+xgJ1EyCx+PdQt3n5qonTGWAuRTaXgzKXE7tvcMEnjgJB?=
 =?us-ascii?Q?L1PlXN+KpHvqBqNaqJeOEWC6PRAIkfIc5aC0ar/Bp639Rpl9ki8ziMJ/5aLY?=
 =?us-ascii?Q?JdYtUx6ZuN+DNIIbA4c/cjGg5thEFxkbnRpCRJh5D2uaebJmkE+VlHvirRcx?=
 =?us-ascii?Q?hCtGMh7w0l9tIw+q+lqcCDeM8/cZsej9BYXHl9lhDYm348YnjthnaHychKZ1?=
 =?us-ascii?Q?WDYw4EFnxlqKxbK1iJdW7KGyTFdDXCkZRncr7DdYzF2F7jRI3lPUddgkd46+?=
 =?us-ascii?Q?e2t8ijIoXGQ2lEZGBZEv5NsG1yCNKtC8W347oeZR+BvjkfqTZnQHQmUMEJvY?=
 =?us-ascii?Q?U8UZWwcSSWPrONBH/Uvyq9EIHSufSaIyVta1rUeTJwqOkXr+eAORWqyQLQnS?=
 =?us-ascii?Q?1KL7VrwSkpi8o6PF6SEVkemOvy4GEk4A5HgBBWOg6iyEEtfu+1t4TJQZ6NT4?=
 =?us-ascii?Q?KZgDI1p9vrbdQDIoKQEekd1SJ1GHQY8IcWXTAY4U4Mz60oQ5I7elltsjyPYw?=
 =?us-ascii?Q?WMM3v3nVkyZ1dxrY87cjGP1gF1buTZ8FRhrlMviGO1JKewPrKf75bqoVy5UQ?=
 =?us-ascii?Q?dihdWq8/K5mo7cWAA+6BZ3Dl5WPk9FtdkyF47iD9XM27uuTjD+bVGqRCeGkM?=
 =?us-ascii?Q?tSMVUwEI0tO4cL+nTC44cdk44Cn1DMQuHlQABVDg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f58ac8-bd12-4427-f910-08dc7de94369
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 01:06:39.2581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8BQNsiegjxzYgyVd1jPJX/8emDgXR25ZY3YH0Tk9zb5mib+ADI/rckvJ+RZ6SDXYqDrwfwe+BpnsxhQ9sP5HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-OriginatorOrg: intel.com

Hi Kris,

kernel test robot noticed the following build errors:

[auto build test ERROR on dd5a440a31fae6e459c0d6271dddd62825505361]

url:    https://github.com/intel-lab-lkp/linux/commits/Kris-Van-Hees/kbuild-add-mod-name-file-_flags-to-assembler-flags-for-module-objects/20240517-123517
base:   dd5a440a31fae6e459c0d6271dddd62825505361
patch link:    https://lore.kernel.org/r/20240517042839.544650-7-kris.van.hees%40oracle.com
patch subject: [PATCH v3 6/6] module: add install target for modules.builtin.ranges
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20240525/202405250226.GFChHcfz-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250226.GFChHcfz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405250226.GFChHcfz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'modules.builtin.ranges', needed by '/tmp/kernel/x86_64-rhel-8.3-kunit/gcc-13/97130a675f5d4a72b7effe364f516c942a723ec8/lib/modules/6.9.0-rc7-00006-g97130a675f5d/modules.builtin.ranges'.
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1827: modules_install] Error 2
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

