Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DFFEBE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 02:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714875406; cv=fail; b=JkmToBthoY61m18Eo0O5VwXPghaQdY0deVIPgkuH+kji1JKUnI2BSc5Js5qDcbkd5wf4P4jNsNPWZNI78l8hzOYRygqjCQpl6wDP6bkMpAjDX/ANBhcTzRxn/s+303zkVlKc/vTlxtw0QWFBCsmG+rceBPxGQwyFLVrk5GT3N00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714875406; c=relaxed/simple;
	bh=Elu3XHzBe/qghFxeujOA7tJ0FXNva77X8ji1QTFMJCM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ti3L6t4+JUfYBu5aqV8n5IB4fjKL/kWlo/GMDtePHLNWlrL1OlpGdCTLmkOqCa8gLmfhKqvG6Phup05fQr94e7wb09TT8Oe/g7AhBkczfe4hiTVP3fS9QyS/dhRx09d4Wltf+BQdH4xcOfcnT4eqpXfoBh0C5hoPOJoXL1+jLFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVZ1D06x; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVZ1D06x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714875405; x=1746411405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Elu3XHzBe/qghFxeujOA7tJ0FXNva77X8ji1QTFMJCM=;
  b=jVZ1D06xik5GWOsH6APX2+88+JlL9qTxiQzy/dMjeousZSwlJRvUEurJ
   KpedT3nCbJctOJObiohHsfVxJUX5n8ifY4F8E0mTZT7XJICJ0L4GwYjr8
   JYuLamZ0C4fxJP8Fq/lYKOs2XVv/NdQuEH5/DUMTx00aRg7udb7w6uYma
   req8xY9iRsclfyu6+fzCwgBnQaakDlOCzpFjehmZtUnBeKOFVkHZJ6Pwa
   eKLDVS1q3kS4iQ59+XVRoP5kAF/Syd83QevGUYworBV5RPYkuW5plncct
   xTFhGWbBvhPO+/klJoSxrZtdTW6311iGYIGbeaudIA1b/ZaA3kENXhrP+
   A==;
X-CSE-ConnectionGUID: VUAckRqrQsaxblR/pMdVpA==
X-CSE-MsgGUID: oqkOcnJ3R26aAY0guzJIgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10480154"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="10480154"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 19:16:45 -0700
X-CSE-ConnectionGUID: NI/lN3SqTDmkAjq10l5D7w==
X-CSE-MsgGUID: j/UFBJLOQjucKmtpVabr5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="32630634"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 May 2024 19:16:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 4 May 2024 19:16:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 4 May 2024 19:16:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 4 May 2024 19:16:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 4 May 2024 19:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOqPU7E2NSASnQJ4IQ77P+LivAtAXkigWjZtOoTSNNyem/NNjyrtlUdans87pr3wOByibjzoD0nSlDyXs0+ce4T4CVPTIdEy8vpP756r74XoAS5mqygyLGvSPcT1EdFzlGjrFgjGl4oe5S94zYAo+jm6E77mQhd8zfjkjAiw9qMf7283K0VuSA0CDxFRhwbhXd8QXjmMqGUXCqj+CeCIT/khC+g65nSkt6G6QN62Cf4+udn8aUAZjerGYizGGDSyFfOeosJ8JOu7PHHdlORc90ioSTVIRIaozoJROCGXBjBVkobrQUEbUDPrrqSAYeqd4TQeYYS+pqoKBfmtKUOzzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4edJFrHNv0EAgzKEPnmwEnpLlQxYZJdGc3oR12ZPWJY=;
 b=SdG4OHWkgMTZCwRMf54ROprwBweggIKtpGjVGhL3afboV6lXX00Oop+6EF5qJVqVLWUPdoIOl9imhhxDLctS/A3OOd7ugd/vx7rotowmooR2MUAW8lqgeoQ8vf231DQscPgKA7E+2QrnDzbaPcAERhz7FPax3JlS38PnopoNZgSzjnIhyn3GAnRuiiDrVUPdFrvo3dLzwHCsvo4c4lzndd4ADAk66BOUm1ywv3KCiRdPOmWOiwHB2TdaF92gnovmKXwy+zbi5idc46ZclltgNCZMsPnhe+GlLte4OJmcGidWxR1Ip7s6Gn1nhe0z+duFDBhIY7cYGbqDlJQHRz/1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by IA1PR11MB8197.namprd11.prod.outlook.com (2603:10b6:208:446::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Sun, 5 May
 2024 02:16:40 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::35d6:c016:dbf5:478e]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::35d6:c016:dbf5:478e%7]) with mapi id 15.20.7544.036; Sun, 5 May 2024
 02:16:40 +0000
Date: Sun, 5 May 2024 10:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>, Guenter Roeck
	<groeck@google.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chrome-os:chromeos-5.15 9/14] dtbs_check: make[3]: ***
 [scripts/Makefile.lib:374:
 arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dt.yaml] Error
 1
Message-ID: <ZjbsAX0l4F2O/M1U@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|IA1PR11MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f6aa2c-c556-4e03-1b09-08dc6ca96677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tUZJeWzueexrVnlAKJkKZIhuPbyfGUXG2FqRRjvEMCyzU6d9XV0n1W8pzVx3?=
 =?us-ascii?Q?VDxJcVwxkmbK3bcmUvHB4GySwzbUzqNimGVb9AXaLN53p8usUu15RMO/Xv32?=
 =?us-ascii?Q?J8xbpjPH+FxK9xVpHXvsH29+UXCSOwLU1+ingev+tOUd30Lo9xTPcI7qw9TA?=
 =?us-ascii?Q?m6C0YgXFuRhc4cHJtErbNGAS8+Z1MIYnDQenUqOTirrj7M4uQcfDbA2JsWSy?=
 =?us-ascii?Q?5UL+rhcXH41QaxOkrQ6pL2cthIFBLvAeF8AqlJT/DUv6R976P1a0kyySB6OO?=
 =?us-ascii?Q?pu/Wqi4PypmNzYUWSqjKKvdvxmcOplbyl1Y3dYFwuPQw6e63TX2c8Xx7g7Q6?=
 =?us-ascii?Q?MgvPpayvIib1pkLCcvc7o9N4C2Lx61CW6/kRGEGuHqZ4IsIixD37h+SeF8if?=
 =?us-ascii?Q?WSSOlk1lPyGQ/FC08qL72df/mCnxQ53+ypA6ELrFeUuoVaJo1OMEjTM4S+Q/?=
 =?us-ascii?Q?1rpPvl29XsS9alHj9a62+6j1200QOdYjaxOFMlDdxx/mEns9SGA8G8lP+tdx?=
 =?us-ascii?Q?M0ft43CGoYL1wXAJKP9SNVILyhgbUJu2ALYOYQ0wkSuU33A4YQPY6aGlaZXu?=
 =?us-ascii?Q?joV4R/xHnlJMrJ0rH/G3GRKlOLkCOJvkxfm4cVzsNWb7WiyTANkqfszA4rKg?=
 =?us-ascii?Q?ydToJ4AFfK1lewKbFT7c+ggsPls0TaiXRBS5eO0tQmp9Hdd2jBcdOWwdAgg2?=
 =?us-ascii?Q?G9rcF9BrVXc0khrgJDXWc+eO+Mc9DvVw5j6saiP/lMreI8MnhqCfVKx07JKE?=
 =?us-ascii?Q?ZdYO7ttVveNAdB/DjRLdHI3yaYVU4K9lDy6qhjUH4v1hy77FHdIFdoIaJ5aq?=
 =?us-ascii?Q?xurJHRYZOnw3jnTgVLDBrNX9MvLbCFnSc8M8mj3e7BJNWLP07Szni3ENrrKy?=
 =?us-ascii?Q?DITy99J+tQUFxfrJhBO3VtiPhv+/gMNE0BCJelW8gCyEDkgwzmTfdizwsbem?=
 =?us-ascii?Q?n093yXew2tosrOFJzNNfEHO3JI9aF/3hu4i1bh1ffQ1KoJGp5Jc6rxmwTSSK?=
 =?us-ascii?Q?ybbmrUfu23jOK07ifPZaeNkuxXsI3fhn0hIbElktjUGO5TND3zmg+VbvCnp0?=
 =?us-ascii?Q?d2OEMpJ8S2l75ZPxJvIL92lL7rcAVa54gCT1aIxywhlyexezF7SMY/rHckov?=
 =?us-ascii?Q?hfA/s5W/HDVr8Q2eYXLmr2D0OzvhPaS9JSWcQQB7VZ0LBXEoXJ+K5blFkbhP?=
 =?us-ascii?Q?RZx6GrXxnJOMZ+NsVAnt34BDhI3KXLv3ZUpSs16FYNOoFupk2Qq/Ex0e1S0?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UROSRqCthGlaXlK/6SX09WvjvDh+IEda8F3qyyJlL5hasM6tr5vxuN1+lk3y?=
 =?us-ascii?Q?ZqbfBAzu6svR1Fzr+Pi/y8IGNVZ0+3nexxL4rSHe2M6Anxu29FMoV7qxUHg8?=
 =?us-ascii?Q?/jZ18h5/g9nLuTHBvyR/24M6TAsrIRN1EYLnCL5/G9evB+1rddH8N4RrXN2Z?=
 =?us-ascii?Q?vdmb4zAhHHKdIkM9rmf+e7Ir3Lfh27eS78jkMuvSiqjQz69GdbuABIjOxI55?=
 =?us-ascii?Q?18owJavtTKV4YClTadUCZmw2Y7vHsShC5P+BQoFBEPQbsRbaTUn0NTFbowND?=
 =?us-ascii?Q?tK/kaOrVXBxEvQSj/X4xdECjaV8y0MgFpiS/yJ3me4EGWiFxucQTaL5Bp/9Q?=
 =?us-ascii?Q?855ImICWVj7gdc1uH0jSSA1b5C9LOmDBQjleyylTZsDjf7l9lDKqAjUBIDlq?=
 =?us-ascii?Q?VAPAlecnr+JRz4FTlOkgHeJtnBdbXXDRzbpogQTHnKxyK842gz/6qgUm/jAz?=
 =?us-ascii?Q?q88EwZkpQCZ7OlbOPFyQ4bMLqIlimfQ+v4zpisdGgARZTgs2eFSqTK4W1qNX?=
 =?us-ascii?Q?6Zl/UPrBmVDNGcVBmQuDnALmGnPjJyP4yx9BpLgzz6qgY/rm6zrn318+7A+j?=
 =?us-ascii?Q?5JffCQAVf6ucu0nuO0bLVyqVrXRKwYNSnxPs/0y8kojwnT8krU+1ZSJ27VpD?=
 =?us-ascii?Q?8HQvugBgXe1HrPBthon8XVAVgy99aEOd2saY2bl1G45ImpjDjP+HzlskToR/?=
 =?us-ascii?Q?nGegGm7+AEx1L07V9eirhVTaplAdfGuD8IqyJoXDX9q8ySTSHYtgDixANVVQ?=
 =?us-ascii?Q?jKUtJe8AJopsqZRzbodWzNcBmIjGspDGYILlHaTLwnmKG9HnI4NN2e7hxCdB?=
 =?us-ascii?Q?GkWmHCIRx10rnyMi4SfGZE6LlN2h4RW+psLDqoNoBS5DSYbwQQvHo8AoIS1m?=
 =?us-ascii?Q?LxVwDGTtKC82KPhu4W0lO4936xuVQHHkHNNexn5ZFxSAkcqu/Jm130CDX5LG?=
 =?us-ascii?Q?CrdDzgThHxcj2SMbSIJkEn7Xq0quM0TVmJTPEjNh3a6I0xZhD3GjELDk4YuL?=
 =?us-ascii?Q?j+zZ4hvdcnNyrSQ7TM+NPREtg86YGZSQrJpl632/szKGjxMOpLpAaZ/LLfEW?=
 =?us-ascii?Q?pYFeO1wvV0Nhq0s3rFz7Vfl1PezSAN6/2s1DoTXUL9DCkoArORGVf8+NhXLa?=
 =?us-ascii?Q?goiVTPSYolABrJrBwAB+P/XnGiBAoxEeEvN7GszXi7W+2pMGrFdxhxFFOR7e?=
 =?us-ascii?Q?uKryEsKluzel2gPBNpSaLLtEG5Lwsn1Pc012exabGaF8vXXM6w1YuoP0g2cy?=
 =?us-ascii?Q?/o699hF6tvo81rlTO4jUYK8xt5a+iJsB/lSoJT5l10b/StqjtChZNYjzQerW?=
 =?us-ascii?Q?NiULxINkzcF7+5XleIa64EsLpIy0fp1MtYzDdBf83s9FenuHaolEtJAAoBAi?=
 =?us-ascii?Q?RMoRjx3Kuq/x0g1jl218WPG8Zyb0EKZ6HEWTdkv7zvN0srOhKp1lfGy4RHTz?=
 =?us-ascii?Q?Q0/aaNjCProZmITi39Xk6LHhCq77kO4Yj5Z5oZYDBHJBW1CxnvXHFCNPGIcs?=
 =?us-ascii?Q?XUo6VwtmlfZyUeZwGJVW0d9KXrzuVdeCjiAojnIOxVqVddZkfE7iZWK3Y4UJ?=
 =?us-ascii?Q?37yBToTgsNlkHYQiRKazauHwugOopv0TDQM8O02R?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f6aa2c-c556-4e03-1b09-08dc6ca96677
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2024 02:16:40.7067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNYlnVK9q2D8uhbk5iIZecB4yZ0MknS9qojd/Aj9cgKQkkNTuZ9QD7RauUkJ8Eo4djGUioy9byYw+we0i4QuRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
X-OriginatorOrg: intel.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   e931c5c3244d7ebba8856dc6aed54a5d1a85975e
commit: e9bf0d6e98d2633afef620f4d8cb76ececfb393b [9/14] CHROMIUM: arm64: dts: mt8186: Add veluza board
:::::: branch date: 12 hours ago
:::::: commit date: 30 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
dtschema version: 2024.4
reproduce: (https://download.01.org/0day-ci/archive/20240502/202405021347.vOexG1gG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405021347.vOexG1gG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-skitty.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131072.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-rev0-sku131073.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dt.yaml] Error 1
>> make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131072.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131077.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131077.dt.yaml'
>> make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dt.yaml] Error 1
>> make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-veluza-sku131073.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589824.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-rev0-sku589825.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dt.yaml'
   make[3]: *** [scripts/Makefile.lib:374: arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku0.dt.yaml] Error 1
   make[3]: *** Deleting file 'arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio-sku0.dt.yaml'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

