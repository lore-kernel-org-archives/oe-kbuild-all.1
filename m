Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE152306B1B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789814830; cv=fail; b=JzASLL6k0ZxDRVteHD/YYvnRvUOCTBDxgyK5cTWfUHb0baDRaInWr0xsap9viuWmvXuqGeXAbKQ9nEXBgERzX49DpJUfGVoVAC1AF9VaZPYADKkE3q00AGT7sPm3AbNA41bTSds+CQEbyyj/0BGvjWGFPYBRR4CgI80d4lqvHg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789814830; c=relaxed/simple;
	bh=M6vz3ur3el3IY+uW0W2AMEgJ9pnyfy3zd0kkwF5/EVU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pYIxz9lMCBL31/ewk2pA0Tyr8JYil8gX4INJs/z9gsa8eb55VcAKK2TDIrQhC2EWik7fLGCcyc0NLrMVVzEU7SiEmvIvqquK0XLV6k6muXL4NFY8+AFV7mI0UlIBykvj+T/sd0Jpakz3JgKntUohdzvyCfkg4BYNeFaGL2wbjZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIQbSPlV; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIQbSPlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789814829; x=1821350829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M6vz3ur3el3IY+uW0W2AMEgJ9pnyfy3zd0kkwF5/EVU=;
  b=AIQbSPlV5kEpRCimYOu0GNl6EzivaAANGASUwIIu3fDrK9oLtnt8Xlj8
   CiJ1xwV3g1ih56uk3kclTExAueSaf25M7pKJ24Wdj0GSOlCn/6aVKGFsv
   tVNYpk450jeT9qv7H/lID9S4UN2Bx6dZPgG31c7mVGXDhCVcBNZJjrOvJ
   Fejx3o3h4c5nphurltSbOki0dZqvRXm7mCtxdqyu6j5ZsKgCOG8AYXlDe
   Flroi0lJtrUpHmuafCWBZ8T9DODn3+ddVnN/bcTb+k7UBzkP1Eu4aKeLQ
   XS1/3gBGEXS7mKoX3In2m0DMbM7F2xpmf4pyJ08XP1y4ADXeKo3fatPwt
   g==;
X-CSE-ConnectionGUID: mM3dZZ8VQyK2C0dVYTWEjA==
X-CSE-MsgGUID: 6C3NoHOhR9yscdWTFWzVFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="92848876"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="92848876"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 03:47:08 -0700
X-CSE-ConnectionGUID: 35gaALZuQuCvnJIwc0ccIw==
X-CSE-MsgGUID: R9IGKKF0ReuDcWcYT32iSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270489879"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 03:47:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 19 Sep 2026 03:47:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 19 Sep 2026 03:47:07 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 19 Sep 2026 03:47:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDspdT0gZZ2xhr1JfJAgUYW8wlc+WB+reoC8S+sWo6taybPz1iJcIZS47vbm3WRHHCTlxg6TtyUWn7uFRNShOZ7708iNawVEoWmZDxWfg4GBg7T5bJKhKFzly8+bShcF8E8wSCd1wjsVb31N/SmyV1+nHKcjG1cmgWF509lf7t7fPsZxBY+C65MPx9GXqIH5J2f7kb18pnj5YPNGSI7cQekIyNB9XXPsxyEFVlF4WLps5tLVRzpxqg3GPyvqDX/xSIpCJHvhtpjDetmGup4Y6GgINxsRQDDEwAtD0kd3oJxaQgT5dL+Fhz6gRgn7yM454FZeoek7Z+KdgPKuPs72XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HBpdbY1qgAHpKInz1akGdO1K0Za+l15afHhQLCoABk=;
 b=YlrZDUACDecsAPc2i6gbQCr9L0sRjeF3ImQAiEJmW3LScgsSL9D3kNLSZnfQWD668eenwM2elIzYtGkEzoXseGUUGDc//PL/AZyGiFDM3uzT1Yyq9edCH2kj1B+/PRRDi5ql5S1OajKnh+lxgg/22qyi1caXdwJwBc/BJvhtDjyV4A6CDRx4J2avntXZ90ggQfGJI6qxjTt3vNTLW4pXq+E4R1KK9qjMw6+9QEJIe9NS1QLAJi6wDDawfno/degEuwYR1gA/hA+7bF02F/1fL6HVK98Wsq7FS6R2Zj2Fn0tHhBxig68/bizX4Pub6tNETrMRx+l6+AD6HxxB0103MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB135732.namprd11.prod.outlook.com
 (2603:10b6:208:620::6) by LVUPR11MB9567.namprd11.prod.outlook.com
 (2603:10b6:408:39e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 10:47:04 +0000
Received: from IA3PR11MB135732.namprd11.prod.outlook.com
 ([fe80::3a42:74a5:4c6c:8d2]) by IA3PR11MB135732.namprd11.prod.outlook.com
 ([fe80::3a42:74a5:4c6c:8d2%5]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 10:47:04 +0000
Date: Sat, 19 Sep 2026 18:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android13-5.10 1/1]
 arch/x86/kernel/static_call.c:19:17: warning: 'tramp_ud' defined but not
 used
Message-ID: <aq5oIOUQJDUhgfvP@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0055.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::15) To IA3PR11MB135732.namprd11.prod.outlook.com
 (2603:10b6:208:620::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB135732:EE_|LVUPR11MB9567:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e45726f-99aa-4b2d-e7d4-08df163b57cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 9AdkZZlY8YRnTdf+QfIt3ML4eLW/7NK2x5lMX6iqhHd9NGnBeHK+prSIfR28G/7BDWIE4dKoneSqNxQO6JPq+ugSV+95gC0Ri90i6SDislsdThXSQCViOvR8ncHQcdkqW1GIBZpfKaIXc518AZo/Bt+yMOrtr1UxAAKKXnWoDisJbapMshPkx2eZH3gbe6VhgfIsoK+ruhgFycLS95cMkuUHGZ/sckxlDM2a+dz4j8IIRYFuqE7FlI05QPiyUoV6jpGlcAKZ5HBZdHD/RW0CnCKYWWOMiCVDfgSEZfPbUDjD4Sm3n4vMO5YLg/vurVkFZzeNBaN+H4GuUESXgqMB+p9gIKoL6ghumnzQx2CfpfLcX4X1ChxNbmhuDjjZRAkBHuODvcYeCaFQSRqYNRaQ7Y4wvQvUewhGmgGzwttOgNTvmajAnO0ghEf0pBECbsFN3TThFx6IxPJ83ofzlbRDWko9ElU4+sinpGI2mwT/OV92Cepcif4APFD66abnB0LarjCF2wWNZvveer498xHAKb5RnqQewkn+eQusD+aoq0fBXN+kPNyEcbkVgYkX15DUYJFz21Zz+MumWogahDB1xnJziXr6fYxAVsz8REJzbxtGDXv+RyK4RNrLXmdeIHk2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB135732.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hrl+SOL06hzdAO4WiMeLFU9IWuHLy7h7JhV/V6JhT6aHvxD68JxzdW0xSSHl?=
 =?us-ascii?Q?YEzz6oOAwjWoHcYZSc7kNeSq448BDeLXourEMKWpCVe70RpaH/5XFJZUxpLm?=
 =?us-ascii?Q?AQJFesFk8wGx9OikJiA92CE6JFX6paUVJ3lYKvcOox8GeH3CSShzi+9HhWme?=
 =?us-ascii?Q?upZJ2PBO04PlIKZDDz/NAxx+VG0SlgAB9WbmTCJoKh/uh9gvNlnCoYN9HVCE?=
 =?us-ascii?Q?19ZLMcZY7GYyis/L5ZklfdMm5LnqmneYBw6XsFELzfaEnFFHFGR9A6cmiRaQ?=
 =?us-ascii?Q?0V1FmghxzbsEWuYOUS/ClmfBpQYTMf1HNvFOSR/tf1xjekqLcAMG6skR75TL?=
 =?us-ascii?Q?0yBB/4j11NKzvXRHbEobak67TiazNkryftoXJvLoC3MgrqV5lcLazkvKKiLP?=
 =?us-ascii?Q?Yw9Q5yCR5rZWEUlkYMmIBTdnd0WSCCliatySeWb80gFI8UM+nQkZiROXzoLO?=
 =?us-ascii?Q?2dFIoBSbCzLvSeNL08JIfhMzH3JAIT++qNtwki8Af5+nvC+IgCapxgrbv+cC?=
 =?us-ascii?Q?HJHCPEouAXBAnDWrjBI37qJzsqNe9JTG9ThAQZwXw/24BvXhPotXysxasKcy?=
 =?us-ascii?Q?Ur5VPfu80Xjez9ByoRgqpN1gW/qaLFHw86Gu8d8fAMAT+rh0GYfQSPZfO4Lf?=
 =?us-ascii?Q?3v9485Cf+S1zGj5ZhATRaDrhi9tc5X3dgidCIr4dM3vnG3Vt34YZNJ2VXrM3?=
 =?us-ascii?Q?pXhbCiNaZ35TI7CU9REigwa5EYQFTKABS48et8LntXcN5Ovcj9ekQ53Akp8Q?=
 =?us-ascii?Q?FwSKomw/owiLFjD2j5cZBvZagPnfxVRnRRgdqjf462k+EUpHKK2X9DkjdHh0?=
 =?us-ascii?Q?y19+HNiHYyhY1dHf9ez9vzRywpFGSzAYcxg1uLgTeXNs9R4p6OccMQoaw7u+?=
 =?us-ascii?Q?fhWtPc4oPRA91U4XT2VBIu1oCQzoAdXSEFCB8nEmSiO+rH1aUcxV49XqK2qG?=
 =?us-ascii?Q?Q6ErG7W1TUgnjr2QTCxHcF+OABr4SI47azff8BE+WWjztnp+IT9UfFWQnlB0?=
 =?us-ascii?Q?hu7835JjmCRaizVUtxulaGeP61co02YTYtqlLzv9JP/nNlxLZyuLMROA/14M?=
 =?us-ascii?Q?DCLBlcETY8jbiUZNwwWQv4QklwfGzg2GCKjGOp5CZM4JuTHuJX7/WnlfuCRN?=
 =?us-ascii?Q?WlrOHRes61qL6MKU2WtNFH32UYnpALuH99unEPvaTY+L8cxOeE82vrzB4RVt?=
 =?us-ascii?Q?HnIdeYiBjv2+pIte6yW5ZqIkn6jtuoeIyq2PSWDMvER1xmH2IL4S2rK3B0o0?=
 =?us-ascii?Q?qr7Vx5ty8pYhy19S9egIkobBy7S6vMHyrtJEKDpyX6p4kWcYxqJ6M2LwFUI0?=
 =?us-ascii?Q?gWRfq0QkwEZbtdnzXzb71gOjlq2UtadWnEk5uI2iifuhe0YWhfuu36/YHNR2?=
 =?us-ascii?Q?ND3Z4fX5Wzs8jvv4IZsECyHZCeqX1TWTIO+lGofsX1Rfjsrw1vx2XSNnE2VV?=
 =?us-ascii?Q?HaqibErJ4CrUSidWq+qs1YiZP9VDZNjuNzGFhSy8EOcZm9RHPkYRIw6q8vFi?=
 =?us-ascii?Q?iUio85X5aKttbE/j92aWb5axQ8D2XltZzDQJdtJ8PiXvxIQxdhb5YAtmva1Z?=
 =?us-ascii?Q?OBHbI7eRTfSHg0q9ZJdlMCunyZH+8CugyvLsi2TLmXjBhu3FiFoB8fmzvq8g?=
 =?us-ascii?Q?U/ZVV4A1x8H6c9Cx30DJbHd+bAa3xwq6jnXH9mDyrB063+yJf9DvV2Inwj3u?=
 =?us-ascii?Q?ZgFM/JKFgMImOhmRbSvCFO6k+auSoZZv6kU+Fz3+JNbyG/t5LUDIkZnsJc5o?=
 =?us-ascii?Q?XRPyQF6mNA=3D=3D?=
X-Exchange-RoutingPolicyChecked: S6a5fUqQSGlOKHRs+j40KfzQKAcHNmZtks3YMISoMCf9Tz7S3R+huc0NwP6HRYMSfn1HwgUAknHUAqPdvYRVEitqv9AY3DsdVBzxsxKWA7EhWrmPEK/j6WVu9Kg2BszxTIXxyzGBXdc3oko60vhGxfYuwkrwkQFP4nc1Ezvh4t8OM67CFmueyM3DJkMnVsCN1xC7IcsfHvMDKiFv7y1WxnRK54K/sVBaKGPlHdUxkVmgOcu97H9JbOaxAtM2kf30zQth7nvDhbbXMYKWozcFXzAdWmfm5LmDWKYEaEuGe/Vz8DpUSsg4ifbCOaCVGlolobNg/MYC8LcSZrs4RnJs6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e45726f-99aa-4b2d-e7d4-08df163b57cc
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB135732.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 10:47:04.2907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmcXwNn5ODLZsB+7/HTTSEDgxhNFkkbwIPafDWjN9nIblJVu2DdWGfBGJl5K+7JSNfs2ZH2DGbYdSY3ndDKHrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9567
X-OriginatorOrg: intel.com

Hi Peter,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   428b47f4651829663d19455bcf5132040b155e86
commit: 7723edf5edfdfdabd8234e45142be86598a04cad [1/1] x86,static_call: Use alternative RET encoding
:::::: branch date: 33 hours ago
:::::: commit date: 4 years, 2 months ago
config: i386-randconfig-r1307-20260917 (https://download.01.org/0day-ci/archive/20260919/202609191635.PJEhAHNl-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191635.PJEhAHNl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609191635.PJEhAHNl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/static_call.c:19:17: warning: 'tramp_ud' defined but not used [-Wunused-const-variable=]
      19 | static const u8 tramp_ud[] = { 0x0f, 0xb9, 0xcc };
         |                 ^~~~~~~~


vim +/tramp_ud +19 arch/x86/kernel/static_call.c

452cddbff74b6a Peter Zijlstra 2020-08-18  13  
7723edf5edfdfd Peter Zijlstra 2022-06-14  14  /*
7723edf5edfdfd Peter Zijlstra 2022-06-14  15   * ud1 %esp, %ecx - a 3 byte #UD that is unique to trampolines, chosen such
7723edf5edfdfd Peter Zijlstra 2022-06-14  16   * that there is no false-positive trampoline identification while also being a
7723edf5edfdfd Peter Zijlstra 2022-06-14  17   * speculation stop.
7723edf5edfdfd Peter Zijlstra 2022-06-14  18   */
7723edf5edfdfd Peter Zijlstra 2022-06-14 @19  static const u8 tramp_ud[] = { 0x0f, 0xb9, 0xcc };
7723edf5edfdfd Peter Zijlstra 2022-06-14  20  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

