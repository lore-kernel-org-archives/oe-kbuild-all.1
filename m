Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C962D661D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 05:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763790955; cv=fail; b=O/q3Ts3H2zcm1VtK0A8dTCpklahsT85h+/dfXSfUwRoBqKYSaTbVw5AzAat4J+fLCo+PpU+E3Pg53KUxSKzh3Bd2MhmOLvrQgOFQwmCRinXl7bsRpLHq49SDe9O3u1xbjJKgUJsgN/J6k00+B+8hEtWxIXb81/4OLT6lo02IDBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763790955; c=relaxed/simple;
	bh=cP24dt/xdQkkTCsE9/1f/jkTP/fnn0bb6MhfbL2yO5I=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=n0622M9gCMUp2oojvN8sjJfsNxXz+wMBhmk69oOaErRW8ygCvirPfWsjNVenU8EcEbmrQMxnXrd0GpEGA8c7pGXwFOEF4Cvh23lrt/W1kJYrRxIucIAPodAaZdQeI0QZqTlSjjrCtpcfcx/iYM+G3eGwazwZOmjOaCJ5PkkvDi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guI2gAMo; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guI2gAMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763790953; x=1795326953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cP24dt/xdQkkTCsE9/1f/jkTP/fnn0bb6MhfbL2yO5I=;
  b=guI2gAMookwev57bkCJYmHcsHkVp8DQY/FWK7eZOsGFECnP0p6Ixj3fe
   WAgb5Bcco+w3QBqQqEjHCyt73qfUNqDllzNoL38YeJimbqWxdsb8pUd80
   ZuIU2YTsvJ3Mgb334fJPAv6ySUkpqirq63KEsaLLIuzVQ9KWGy9S7rEni
   dBqeKwJWmDs06mKJ0Vera3FcAM8lLRstYxGhJ2yXnVPLI3SJK/JJpfUiE
   JF1FjC8yiC0g0z29BNr75LyNZ8RGukU8KrZDfpLFekSJRNe5loS6paTG1
   P3wcZxoDVD+jfVaSr5/vJECPMFvSW5xoR//Eyg7KBMgfWVIE/qpbQAfLj
   w==;
X-CSE-ConnectionGUID: PBJ8xagdQaCFm2+rFpk3oQ==
X-CSE-MsgGUID: dD7WGUVjS7eXtfCTo7aveA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69737424"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="69737424"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 21:55:52 -0800
X-CSE-ConnectionGUID: ZHsSdFp0Qz6VzKLBlTgw1w==
X-CSE-MsgGUID: eUn6avQNTC6Xxf52OQm8pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="192337761"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 21:55:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 21:55:51 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 21:55:51 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 21:55:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSni32FfSPffpsHgfOmtE3DqRoRwA5xq1a4A+G6U0ka4ERLxBXSjhGr1LeCJcnj+VWHQ9whXA7XjcUrA8iXAzC2N9DXrxtt7KMZDSc3GAhpfmVXI94onpWuyWwsaxeppdjaejjxLf3VcciePyntLqk7gItrXjNrQSio+zr2Cht9zLr+3rs2vfMXqDMlbexdV3r5v7p/ywSYa7uEvKL7/naH2yIWat6VGTs6XtjBMkrhwHy7S343Gmu3TDyZdIkXNaB6+25xCVNkQS9BI3Va8f3RWBU0osx/1E14l3AJ5QiQFG0m4rylf0hhz3Jtt4pGeEQywPT/LSqfzxmaiwl7GDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP+VpCBRMlsIBL7MLhkM1uelIN5EhbLfGTtx6UtVqN8=;
 b=Ca/OBU+XpHZRMrdql/YOYtWIqQVyu9srBmm5SxRDJHmlp8TIGR/UCBZQOHFPM5yEmwio27a488i1UXCeo3hlPgqJ0zW1fUNio+4vZwECh57rPN9ueYrZnHKqRGepQ8mmyJytiTxnNN6hhbfPFmcj6SMXmqTrDXsWgn6jtwXpHbzzhqOZkxMAYN6d/wgX2ZecmhzBmoaM/82dZJKQTW62XX+7awIg3n6oc+D1UHAdrK8JZSEsVhQVEAE53Ncg9s+UYXxxokEUoU44cBy5U1Yx4pPCoQuK433020ZX86iE39sFBpHJT4QavmD4vdK7RPnU2vQB5vx2GYPdIEIdxEW5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 05:55:48 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 05:55:48 +0000
Date: Sat, 22 Nov 2025 13:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android12-5.4 5/5]
 drivers/power/supply/power_supply_sysfs.c:111:57: warning:
 initializer-string for array of 'char' truncates NUL terminator but
 destination lacks 'nonstring' attribute (32 chars into 31 available)
Message-ID: <aSFQXA2ikZQcqsPx@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5f8057-5e25-40a8-ffd2-08de298bc8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zLTFpzTNZ+uLZRoWDZv9QvLQ3ivadeCErGC7Ld2RZUpoMnzBPGsZLjLed0Zk?=
 =?us-ascii?Q?OY/+Qj21W5b6tpCLvODvOEDPGCwQLxgfYf8R1uvFlt0/4QNVl+5tXYV8bDra?=
 =?us-ascii?Q?8ZAWCgp3GAZh3e6ho6QtnTJr/IpXgQOssyrqKFdnwmUs72KL855uo/ceU5XP?=
 =?us-ascii?Q?vSmrRuydABIchLHsXpOM9zjUlcfJTZ4v4n6zTb3m1ykZj2Ow9M5CKEEFFe1t?=
 =?us-ascii?Q?FiSDfYka7dskiOd5MxbUGbwkUq85hgzLi3LEBISpF1ZH5lgnX3LbgRMh+vmu?=
 =?us-ascii?Q?70OQJQb1ki8mjUCWmYNlENeMetxO8Be+0w1HABmoThqmMf3TOjHgU2+k+9io?=
 =?us-ascii?Q?FdOkeEL6i2xgzV3zZAwH/eY5X+pxs9ka+uuzWwRjVn362cKVRN3KEEvqKd+3?=
 =?us-ascii?Q?lMkPbZC6YmqA/5Vihl0YvQv9iqAMKZNFQKa7DWJItlZZQ230rOymc52Ic43C?=
 =?us-ascii?Q?fSDzM4C6eRephbwbf7mTsMFmjFiWvc5IgpDtwJ8JnW5NcPqMFn/h57TN7yka?=
 =?us-ascii?Q?MuwJYrMbhDHDx9Swo+h9yg4sNEcE+9z/aSwn7QiTmHXuBZO7mQi/pwPrKum7?=
 =?us-ascii?Q?VObqTAIzrVEJi5nz8OttzPekkuvSl5xgK5Yh3aneepTHNbXSQrHYfUYR2dQL?=
 =?us-ascii?Q?vyIGSlEDL91FEhnPYFrZ9/sdG1hx0o5J87KF0Xh30CYm3DNEBh+A8xsP/v4s?=
 =?us-ascii?Q?6LmXYer3FMtm6GoC9rU3MnYDw5+uPi+KP4IIbKXk8/gizh/mi11zahm81DE2?=
 =?us-ascii?Q?LveubWf7ShljunGpaLaNyR/rhJe0QlONKYoLZDWPyRFjnGvMFWH1EAUlznJA?=
 =?us-ascii?Q?4cMbGME5onGT8OAbWiA1ejEa2Ea1RfFODdObMPvEUfQVwdPBX2DUiyuIz2RZ?=
 =?us-ascii?Q?lUo2PZvg2bV+AdcGONqmKL1JrScioII1fgAxC1G0NTJFqdtZrjIr+VggmSp/?=
 =?us-ascii?Q?+oHCivBC1azdBuLr7MLJOt6etaZYvuG2kRV9oILxGCxzhNiXjna2SysFcXeP?=
 =?us-ascii?Q?l4jEq4xrU+tLs/ywf0Cke2f516CP/cSEmfH3olOs17Zl0/1XO20qS8xRBqnp?=
 =?us-ascii?Q?qVadmpZ6bcf+hu06sK0a//1ZFtbeRhCbNFtHhSnFK6ZfgeFhiX29OyR0M8/6?=
 =?us-ascii?Q?AjAGAdR69gY32gCHC2VYPXkf52rRHlGMBdga8cAtXumwN44El45H5vg/u6DY?=
 =?us-ascii?Q?yDGElLTOrh5qPkPe68Oaw3QP+zA8VOFddZ7cL9RaFdPLT9N3vtG9MXbzMqrJ?=
 =?us-ascii?Q?XtN4+FFeEKYI2ock54O8oj/lP2a2R6jPgc3MImCZsGYMOpR1rL8YbsBR29pP?=
 =?us-ascii?Q?65CI0uz7Kf5FFRfo3/geIIHO+ysItn7pK46se8F/uHqr7rcVOxqEthXrEx5x?=
 =?us-ascii?Q?lAAcXSJHqBkVvC6qJ1ZGB0YKk8LkSoKCH3jfHtleOC/BFtg477gDg/Kcf2cG?=
 =?us-ascii?Q?V7cp9Qgx3Mi0uuGPfSjcHqDv7QtLKE4Y04TunofK3kO/ooQtfyvrVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?plZVyVNuZmlcMJfbpgFhF+IRcNo+Ga/Txy0EkA8FNclW7tF4Xg5RIvz7VTVh?=
 =?us-ascii?Q?hu19EmdzwuNdtetTlEl6Q+XXjeo7yXxhAiftFdMd8HamZrWPD6juMq56HaGO?=
 =?us-ascii?Q?z5yf8YbmWdzcSuFkVJLopYkLaTzOMVe74tu7wPO8ZVntmIMlKHSx/e91f06x?=
 =?us-ascii?Q?sFFOX6v8eix6BHAL0S9ITq/D/gHnG6ZLoaN60lODugJ7au3+6WG0LpYCVExz?=
 =?us-ascii?Q?73FaU/fJUyfgtFJLU2GWnZARCS70MtVGv48i/5GeCT73Vb5+1ajx78w6pQxS?=
 =?us-ascii?Q?tYnEPkNFTcGeVh8vA1o/ZDvCjutvCYEFGtrZCnReUh/V9LxEAu8Rz3PEZpAa?=
 =?us-ascii?Q?GtCizjpuCK1zr5gMr/5CqOSuvLR+tG3ofrctrhaQWRz3N+edYSuL2T3Xkf+b?=
 =?us-ascii?Q?ozssi7JMeQ328xkg+Nf5tmQt0t84AE2ulL4l+8Eew/vtj02AoxVv9eaGOj9g?=
 =?us-ascii?Q?fYVyih1JvJoPxfSLqUq4FM/NpfEEALYaSf7swwyXOmiLvynZvlUkJ7Yq7IOj?=
 =?us-ascii?Q?iYAQuPsoBjpNrjRGpZ46Y9ojAm1oEWJ4bMbwLQLoe9tHJVGOkqU7HMde1Y8k?=
 =?us-ascii?Q?kb6mGULab7X08Tfx3cNFkkefm5BU7shQqcAi5W3ygfk+qEAM8Qxi/i+1DJ7N?=
 =?us-ascii?Q?fhs5EtQaeWgIZ6AkdAg0rDSbjLjKikJLoz7k9JzzUIL0/K2jpimU6kGhPT+6?=
 =?us-ascii?Q?QZK19hzGnmqxbB9C5DxJgiwU9xlchHX9ZG2F4sbV39cwPUAp5g6r4xHtKD09?=
 =?us-ascii?Q?rVWIywSJQ09Z+qJrST1vrd6xL8hxmjH5MQpdiMkwB0pTVz1iizHvqGsIm9QS?=
 =?us-ascii?Q?VDwuE+5/IbZzASDXOCCl8uNE9nIWgGEGgJPj3raHgpuo30w1BMiVj3o6co2N?=
 =?us-ascii?Q?aoru5T3T6Odd8zaJmIl5MhrRyCfVFEemi5Xink3vc2x5L5xAEeMkS9QP/MgX?=
 =?us-ascii?Q?mvq8z9JdYDqIdKHHQdpIyhcetJruk8tRH+TGYKaqqelXRFnZjK8lMzJUSwo5?=
 =?us-ascii?Q?XT0AWSdcFK6hHYLp1+qsrSD91gIULTPQOAIYj9r/XIVnFb1XI8UOX0NIPfyy?=
 =?us-ascii?Q?OFHY30RSfE4ePS+vTWqArfZuDQzR+PGcP8xwcMe91b/9v8RrO3xh1wFEivxF?=
 =?us-ascii?Q?GvGoKrifuNZZFvpQ0DBa2M+MbW+rU37LOipMxGbdBqZLHkOTPXfiCHW3qjMZ?=
 =?us-ascii?Q?Blh+h8A4naZS8RlVIo7nr1KrUH7wqjlPJDB45dxK+P4zPwWagpBFI4tEC5fo?=
 =?us-ascii?Q?YGMLgUXVYx+2TgjjcEhZwSGf1q2TTzQp5FPVrFguuSP/8jztU0NPjYnaYTmi?=
 =?us-ascii?Q?3cSH2e93WFCSnKBd8eP9E4/Ux1yqcGWkFQqIRMUkydjWeY0wjFOvGM+IS9Jl?=
 =?us-ascii?Q?GA7vDKrH4xeBo/n2AYA2uWm2s7FGPkXaHxb0uSG31enCHLknO7oyUyzM5gp3?=
 =?us-ascii?Q?OGS1VeV55XsKVbdOkOIcO5PzUGwDepXcaRmJ0gPZsHniWWN39EALsuN5enCt?=
 =?us-ascii?Q?xbyms2AZVCQU2Exf/vwKD3HzdwFMjV5lGXoWKGKnKbkoGBFAOavqE6bAOZWF?=
 =?us-ascii?Q?PnXcqni9Nul3WDKKSLWu3NE1d9rHot25y/om/YA1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5f8057-5e25-40a8-ffd2-08de298bc8ce
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 05:55:48.3900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IN9RUs3pLq4p83/+1KmNsaLEuhR2pOHm/N9HkuiL0/JmKnccHfScumxVy2WLNff0jQ3JByUmfqwx1zC5OmTjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   b2957a0ebc3b9949475a442f9e8ab64ccaa6e087
commit: 34b830881d43fb698761c1c45df62cf19c6aa363 [5/5] UPSTREAM: power: supply: core: Cleanup power supply sysfs attribute list
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511220439.HR64VCt8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220439.HR64VCt8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220439.HR64VCt8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/supply/power_supply_sysfs.c:111:57: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (32 chars into 31 available) [-Wunterminated-string-initialization]
     111 |         POWER_SUPPLY_ATTR(CHARGE_CONTROL_START_THRESHOLD),
         |                                                         ^
   drivers/power/supply/power_supply_sysfs.c:33:23: note: in definition of macro 'POWER_SUPPLY_ATTR'
      33 |         .attr_name = #_name "\0",       \
         |                       ^~~~~


vim +111 drivers/power/supply/power_supply_sysfs.c

105df60f207301 David Lechner 2017-05-15   73  
34b830881d43fb Mathew King   2020-05-04   74  static struct power_supply_attr power_supply_attrs[] = {
34b830881d43fb Mathew King   2020-05-04   75  	/* Properties of type `int' */
34b830881d43fb Mathew King   2020-05-04   76  	POWER_SUPPLY_ATTR(STATUS),
34b830881d43fb Mathew King   2020-05-04   77  	POWER_SUPPLY_ATTR(CHARGE_TYPE),
34b830881d43fb Mathew King   2020-05-04   78  	POWER_SUPPLY_ATTR(HEALTH),
34b830881d43fb Mathew King   2020-05-04   79  	POWER_SUPPLY_ATTR(PRESENT),
34b830881d43fb Mathew King   2020-05-04   80  	POWER_SUPPLY_ATTR(ONLINE),
34b830881d43fb Mathew King   2020-05-04   81  	POWER_SUPPLY_ATTR(AUTHENTIC),
34b830881d43fb Mathew King   2020-05-04   82  	POWER_SUPPLY_ATTR(TECHNOLOGY),
34b830881d43fb Mathew King   2020-05-04   83  	POWER_SUPPLY_ATTR(CYCLE_COUNT),
34b830881d43fb Mathew King   2020-05-04   84  	POWER_SUPPLY_ATTR(VOLTAGE_MAX),
34b830881d43fb Mathew King   2020-05-04   85  	POWER_SUPPLY_ATTR(VOLTAGE_MIN),
34b830881d43fb Mathew King   2020-05-04   86  	POWER_SUPPLY_ATTR(VOLTAGE_MAX_DESIGN),
34b830881d43fb Mathew King   2020-05-04   87  	POWER_SUPPLY_ATTR(VOLTAGE_MIN_DESIGN),
34b830881d43fb Mathew King   2020-05-04   88  	POWER_SUPPLY_ATTR(VOLTAGE_NOW),
34b830881d43fb Mathew King   2020-05-04   89  	POWER_SUPPLY_ATTR(VOLTAGE_AVG),
34b830881d43fb Mathew King   2020-05-04   90  	POWER_SUPPLY_ATTR(VOLTAGE_OCV),
34b830881d43fb Mathew King   2020-05-04   91  	POWER_SUPPLY_ATTR(VOLTAGE_BOOT),
34b830881d43fb Mathew King   2020-05-04   92  	POWER_SUPPLY_ATTR(CURRENT_MAX),
34b830881d43fb Mathew King   2020-05-04   93  	POWER_SUPPLY_ATTR(CURRENT_NOW),
34b830881d43fb Mathew King   2020-05-04   94  	POWER_SUPPLY_ATTR(CURRENT_AVG),
34b830881d43fb Mathew King   2020-05-04   95  	POWER_SUPPLY_ATTR(CURRENT_BOOT),
34b830881d43fb Mathew King   2020-05-04   96  	POWER_SUPPLY_ATTR(POWER_NOW),
34b830881d43fb Mathew King   2020-05-04   97  	POWER_SUPPLY_ATTR(POWER_AVG),
34b830881d43fb Mathew King   2020-05-04   98  	POWER_SUPPLY_ATTR(CHARGE_FULL_DESIGN),
34b830881d43fb Mathew King   2020-05-04   99  	POWER_SUPPLY_ATTR(CHARGE_EMPTY_DESIGN),
34b830881d43fb Mathew King   2020-05-04  100  	POWER_SUPPLY_ATTR(CHARGE_FULL),
34b830881d43fb Mathew King   2020-05-04  101  	POWER_SUPPLY_ATTR(CHARGE_EMPTY),
34b830881d43fb Mathew King   2020-05-04  102  	POWER_SUPPLY_ATTR(CHARGE_NOW),
34b830881d43fb Mathew King   2020-05-04  103  	POWER_SUPPLY_ATTR(CHARGE_AVG),
34b830881d43fb Mathew King   2020-05-04  104  	POWER_SUPPLY_ATTR(CHARGE_COUNTER),
34b830881d43fb Mathew King   2020-05-04  105  	POWER_SUPPLY_ATTR(CONSTANT_CHARGE_CURRENT),
34b830881d43fb Mathew King   2020-05-04  106  	POWER_SUPPLY_ATTR(CONSTANT_CHARGE_CURRENT_MAX),
34b830881d43fb Mathew King   2020-05-04  107  	POWER_SUPPLY_ATTR(CONSTANT_CHARGE_VOLTAGE),
34b830881d43fb Mathew King   2020-05-04  108  	POWER_SUPPLY_ATTR(CONSTANT_CHARGE_VOLTAGE_MAX),
34b830881d43fb Mathew King   2020-05-04  109  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_LIMIT),
34b830881d43fb Mathew King   2020-05-04  110  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_LIMIT_MAX),
34b830881d43fb Mathew King   2020-05-04 @111  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_START_THRESHOLD),
34b830881d43fb Mathew King   2020-05-04  112  	POWER_SUPPLY_ATTR(CHARGE_CONTROL_END_THRESHOLD),
34b830881d43fb Mathew King   2020-05-04  113  	POWER_SUPPLY_ATTR(INPUT_CURRENT_LIMIT),
34b830881d43fb Mathew King   2020-05-04  114  	POWER_SUPPLY_ATTR(INPUT_VOLTAGE_LIMIT),
34b830881d43fb Mathew King   2020-05-04  115  	POWER_SUPPLY_ATTR(INPUT_POWER_LIMIT),
34b830881d43fb Mathew King   2020-05-04  116  	POWER_SUPPLY_ATTR(ENERGY_FULL_DESIGN),
34b830881d43fb Mathew King   2020-05-04  117  	POWER_SUPPLY_ATTR(ENERGY_EMPTY_DESIGN),
34b830881d43fb Mathew King   2020-05-04  118  	POWER_SUPPLY_ATTR(ENERGY_FULL),
34b830881d43fb Mathew King   2020-05-04  119  	POWER_SUPPLY_ATTR(ENERGY_EMPTY),
34b830881d43fb Mathew King   2020-05-04  120  	POWER_SUPPLY_ATTR(ENERGY_NOW),
34b830881d43fb Mathew King   2020-05-04  121  	POWER_SUPPLY_ATTR(ENERGY_AVG),
34b830881d43fb Mathew King   2020-05-04  122  	POWER_SUPPLY_ATTR(CAPACITY),
34b830881d43fb Mathew King   2020-05-04  123  	POWER_SUPPLY_ATTR(CAPACITY_ALERT_MIN),
34b830881d43fb Mathew King   2020-05-04  124  	POWER_SUPPLY_ATTR(CAPACITY_ALERT_MAX),
34b830881d43fb Mathew King   2020-05-04  125  	POWER_SUPPLY_ATTR(CAPACITY_LEVEL),
34b830881d43fb Mathew King   2020-05-04  126  	POWER_SUPPLY_ATTR(TEMP),
34b830881d43fb Mathew King   2020-05-04  127  	POWER_SUPPLY_ATTR(TEMP_MAX),
34b830881d43fb Mathew King   2020-05-04  128  	POWER_SUPPLY_ATTR(TEMP_MIN),
34b830881d43fb Mathew King   2020-05-04  129  	POWER_SUPPLY_ATTR(TEMP_ALERT_MIN),
34b830881d43fb Mathew King   2020-05-04  130  	POWER_SUPPLY_ATTR(TEMP_ALERT_MAX),
34b830881d43fb Mathew King   2020-05-04  131  	POWER_SUPPLY_ATTR(TEMP_AMBIENT),
34b830881d43fb Mathew King   2020-05-04  132  	POWER_SUPPLY_ATTR(TEMP_AMBIENT_ALERT_MIN),
34b830881d43fb Mathew King   2020-05-04  133  	POWER_SUPPLY_ATTR(TEMP_AMBIENT_ALERT_MAX),
34b830881d43fb Mathew King   2020-05-04  134  	POWER_SUPPLY_ATTR(TIME_TO_EMPTY_NOW),
34b830881d43fb Mathew King   2020-05-04  135  	POWER_SUPPLY_ATTR(TIME_TO_EMPTY_AVG),
34b830881d43fb Mathew King   2020-05-04  136  	POWER_SUPPLY_ATTR(TIME_TO_FULL_NOW),
34b830881d43fb Mathew King   2020-05-04  137  	POWER_SUPPLY_ATTR(TIME_TO_FULL_AVG),
34b830881d43fb Mathew King   2020-05-04  138  	POWER_SUPPLY_ATTR(TYPE),
34b830881d43fb Mathew King   2020-05-04  139  	POWER_SUPPLY_ATTR(USB_TYPE),
34b830881d43fb Mathew King   2020-05-04  140  	POWER_SUPPLY_ATTR(SCOPE),
34b830881d43fb Mathew King   2020-05-04  141  	POWER_SUPPLY_ATTR(PRECHARGE_CURRENT),
34b830881d43fb Mathew King   2020-05-04  142  	POWER_SUPPLY_ATTR(CHARGE_TERM_CURRENT),
34b830881d43fb Mathew King   2020-05-04  143  	POWER_SUPPLY_ATTR(CALIBRATE),
34b830881d43fb Mathew King   2020-05-04  144  	/* Properties of type `const char *' */
34b830881d43fb Mathew King   2020-05-04  145  	POWER_SUPPLY_ATTR(MODEL_NAME),
34b830881d43fb Mathew King   2020-05-04  146  	POWER_SUPPLY_ATTR(MANUFACTURER),
34b830881d43fb Mathew King   2020-05-04  147  	POWER_SUPPLY_ATTR(SERIAL_NUMBER),
34b830881d43fb Mathew King   2020-05-04  148  };
34b830881d43fb Mathew King   2020-05-04  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

