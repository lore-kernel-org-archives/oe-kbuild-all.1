Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E880718CBFA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723207776; cv=fail; b=BI1RosYhnJqFRcKX5Lbu2/q97QX4+VPjeIQ8w11d5klzyawVvB9IgIetb5Vt/xqpN+DRkLgqbKZXjf/E9wmVVLe7vy9AqXoqAafZTDXX0oz+8QqKV/dxJvFcTc6JaBbsk8NadiIshDquwYjeSEgT4JdH7O5iyYY3G/bdlAxSMBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723207776; c=relaxed/simple;
	bh=bYhE1QX+ZNtyVr4fB3nL09UaBCQjPRy/c+IUWEu0FA0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=U17NZkgEhM+zzCLULk7ac3XIcS/eLTmRzUp4u++C9/dZXWGwQhUWN/t7BdCjs4J8ha4tMfFCdyWlQFfW2Fzrg7EPJDUWB1LSXj07wYOtC/Kf1Le45pvCorZKuaobPQQSN7EsOrZJX4v/hZIv+5sPmW2eNTVZaPmv08r5Eha1HbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giVGLTI+; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giVGLTI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723207775; x=1754743775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYhE1QX+ZNtyVr4fB3nL09UaBCQjPRy/c+IUWEu0FA0=;
  b=giVGLTI+HhfGqgyxHjMGPE88SWBw6dnXo0AO1QldDSvLPkMGyWf9yOvn
   H59SjTsqeK1gZo/BebiFDiXwFhhqXbu1CimTkj1K7sdQHjSO6h7QL0ZKY
   YkUsMpQkPJ02mdI2pg2Qw1+GNEVAisAJLuAdLbKPlzKX883HS0ajuTDl4
   KksbQYmiP3E/XF9RafYX9lu7DRyTdf1ymMltPA/XM11h1otMzOHcix6Vm
   PL+NNM60E/5oTo3kuCeLWViHeMOIflCUJW9kSWC18LVfi/ANq64i/yNMn
   xsjp9WLGXh9s9nD0kOp0+2gtL6+mOkuV201dGD2nLalRNtibbzEv86Iq5
   A==;
X-CSE-ConnectionGUID: 9vH1E/RgRly98qPUM2BDpg==
X-CSE-MsgGUID: VpuaztFeTJqfd1c6RfDxOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32769264"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="32769264"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 05:49:34 -0700
X-CSE-ConnectionGUID: 0+YOsoajSjayp9NGYb1n2A==
X-CSE-MsgGUID: 0dcNb4I0Ty+UXXyV0fwEdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="57474995"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Aug 2024 05:49:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 05:49:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 05:49:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 05:49:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 05:49:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4KC01dka7HRYKaHIQ3k9zs73Tf5CANpwYUh6V1E5IhKqrZE/jTvl79T9DtNZXHG4olDMMicAiJbIJycSmPeLkSNUbqZGnQFxvIfWajpFskODUsdRRD3vbkRwvafp/WU7p41nBXaDiyphB1LQ5YJvZjNuUMGNMd2PLK6TjIig9zJr/m2onElVHEo7IGjMrMZkntAYI+eYGhYgS3bNmSHSadtHOHB8zo/D8cB3j/hTqHx/p0XrZVgKfT9lddyumbZWaoDBJ0MO6GOWTq5nOvBuaueGDiA/aI7M9Cp30i35/i74DdkeBE238aHM26sTjieGN7VwRlmrD3T3ySEJGkVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fby75X9a/N8XSlS4Sh939F5mWd7M3f57sjOf2I02yoA=;
 b=egOlgJjapwzrUuGKrXqFtL4fmdotNLd90esOTJiKHUvQEKJee+HAdjTU1onpxOXcJ8peeg62ymKOf/Eb6o/IEIZLluA8Y1eF5Mk/jR/7XsxrA29qIpQunoTANyEyWolwny07fCUw15DU6KVPIO3qSC9k4CWpT9tIgGsBwmSreBMa1D6WR9VZ3CWjM1oA+wbM0B5M5QU1fHtXxREqEe6uC1FPHfvnK52kNzJicHWT73UfOBPhdmGxD+nvKoVMnQczPTOyfzfvFXqUpcbgCWpASGJ0/BIqy8xqU5LbJuJLGs8SvhyWER5H6MQGbpx/2ryBh3r8CTqPMtIP0QzeT6ho7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 12:49:30 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.029; Fri, 9 Aug 2024
 12:49:30 +0000
Date: Fri, 9 Aug 2024 20:49:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.6.y 30/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: ethernet@ff3f0000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <ZrYQUm4ASXAoGZBf@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA1PR11MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f92895-5e58-450b-282e-08dcb871b5a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ggRpEuwVAkqVmwU6jRrE/lS3yS+Groo0iK1k+uAxJwASWs0V1tJCVH4Yjk88?=
 =?us-ascii?Q?UVFLVDiEirMgNKDMluWe/0CgOHIw478tUzyxLdVAtQCuSAygS0985fT1Z+DB?=
 =?us-ascii?Q?o4OtwKvItPnXcgBsWmkS5lI16JXMNO6EGG9vetYq5HNfNyyAzXPLWWAOkctq?=
 =?us-ascii?Q?Re4/8AeyQB7YVOFDQ2AktRm6jYYCzfP0AEQuKdwq7RRzw7k96OJSIGgDTwDg?=
 =?us-ascii?Q?aswI5vStYL3/ttx5li3AbW2qh9efh3weYAytxZsPvT4hqI5QDvcX4XUh+BOz?=
 =?us-ascii?Q?1BeyJQOzoxHtNjKZT3D9lpdOEcpRP9JSdI7M6quj9ZBrIPzhjppGu2eoDsiq?=
 =?us-ascii?Q?5weYCuTy5c36NbgfE0IyEx5syhByCy+rYK7BGLtEdz50aAuTulJEu+6Zz0uv?=
 =?us-ascii?Q?3xUwFpRlYer1fK259w1r3vaa0YbRYaGzE0HXtFsKE47aOmoRE/4fp+YgIw42?=
 =?us-ascii?Q?eEcS2C4mr16Xnz9WTsmEsv0JszG+VqzmSnvhTTksZk94qQ2SfXLhZwSGuEEK?=
 =?us-ascii?Q?yVHCgEipkVQB0IL7cQhqerNYhXnh3UvKx1fX6SMAYNU/h2GVc/EEQ3Tvt9A5?=
 =?us-ascii?Q?cOI3DL+aJtZX5UbJDRp5JYdD2rZqEB46F7CKfKdUKbRd5XSEMyG5Vm9rzI/R?=
 =?us-ascii?Q?niVpPGiZ+36Ro/Qp9J2NCxhrXyiGTKo7HTN1S7Eb9m2eif72+bBVPHS+IMFZ?=
 =?us-ascii?Q?29DWAlJhI8wLfCGnYAAs4ErX9e7PlC7842FzHH6tSOX1bG66FJ6pectqSqXr?=
 =?us-ascii?Q?Z3tSfS/H9oRhYQrA8ITIDYjvTZL3Gy6fpSTxwImsbnBBt/HT6tR6rHWCz4+L?=
 =?us-ascii?Q?eZF2F8t/TJ5ivK592LycNzh8pFKw0WbCf2sz/OC/1M8bvyUrSonEC2h11qBe?=
 =?us-ascii?Q?76n4hssv4PeFmm6tU92ahgue5zPR0RmjpJe29UammWVotoQL5G9ixlQ+o7Ro?=
 =?us-ascii?Q?SbiOhwQxQAbo1fCR5WW16W/t8E+SJNY+Ba2y46zjULBKMWQ+TuZFM0GReFn1?=
 =?us-ascii?Q?y62+14ezGsw90Hzq2Ay9ndCAu7eGVMtWYasD+K8ykL+RASsZGEgXoZWn9/Z+?=
 =?us-ascii?Q?ONl9eVNEhVkuzfsRspIyJ4QeK42TQ0Yc6v2ecmw0wv28+3ZyxY7iG5lATl4c?=
 =?us-ascii?Q?OdX6N1vtl0rDKYqV1JpvTCV8l6rxSuxlRnFVLDjqQ9v2g0VAm+bNKD80VKdb?=
 =?us-ascii?Q?RFqZgPOdxk70KSnv1hlkgaMZLceA6TmXjsr9P9FD2hqJ8mxUMGJ41xjvFeAy?=
 =?us-ascii?Q?k+46esEjlPRZyLbSDWdHzvHv53j0+U8nwPGXVydfQjOCFeqCYoATFGeZimby?=
 =?us-ascii?Q?AhGJ3fYYiC3J7Oi/EYJsowjjoWzNxdKRr001cM+RQ9swTf8PYfeMK7VZyGAa?=
 =?us-ascii?Q?2T5bPQ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rbleRTOQN/XDKZdfIJUIPz4qQvJh/ii5MnJjgyV6ntUzWOO04Jsc5yXNRbMG?=
 =?us-ascii?Q?JDdEf66tdm6NF9xvLE4rZN4+4JNxRhlF7OJs0jWkKR4fPxBIKq0VjkpaaYL+?=
 =?us-ascii?Q?OVFXNA57qTqBH6ySaxjNjEuEyo55GjA8KfyS4hsyGEIknJDJTiDViF3Hx/tq?=
 =?us-ascii?Q?/c8H5CMVDov8VnwiED6O4Dio3fPxChEFsZjlLXtPfEhwj7q7Shr7CxIWAIdX?=
 =?us-ascii?Q?535BbXjlZpOaf6wVDwZzA0KU0JqM52CAHGljp5+EDkJYyT1/5h8Eg1ag4eA7?=
 =?us-ascii?Q?5QjUG/xCFnLKTK9YkQ9A2M2hY79YbQ45APmCDIKqVNDD9D58bXYB9xTXmkWC?=
 =?us-ascii?Q?VgO4sKANLo0sny73Ee7YzaQ+9Lu2f4S5usLH4/xhnUUN89Fl5hwxFOAy9Pop?=
 =?us-ascii?Q?scUpW1k4qURd7PXhYzpXOnnPHWgdQPHmjEepHOC/t4HLVfenmFerL8NigAwr?=
 =?us-ascii?Q?uuQAHrPyJ37in2dQJt2Q9il3H3QKU3SmmmoY4dKgQuvLwxlve1+Up1n2UNmH?=
 =?us-ascii?Q?lpXECCLDs1uukxi4UUxzR+0wd12/ZwADgF+gYYhIkmhAmgbEN9m5Nt8vwS/U?=
 =?us-ascii?Q?JRYfeA1Nof+zat3BcrZEItcAqdUyh2Y2Z7LB39M5EM6TEorsW98uPt5K0hmS?=
 =?us-ascii?Q?+1ye9LyYaqHORNqW06A5sDBeSJLgQwK7+18T5saB2AYU+j2z7CtxQpLpov+B?=
 =?us-ascii?Q?NrlrMJUhLY/7zRPiZWW6NPxEu/AI9k2/rcBEkd9fKf5GF9Q0mfsye4+Nlbai?=
 =?us-ascii?Q?x7kvwrutA47xSq2lVzHgEb4Dq7/gwy+VeJmTi9p2LMiNv2GrRRId53aO00C4?=
 =?us-ascii?Q?91RlLfT76ryC5ViSCWS6orK2OwRbhfNojfx8a8hstIW+m4M3JwGw593t8HvV?=
 =?us-ascii?Q?yg+9ja8rTIJErbXaNegvyCjp76NTitjuLWzgOe56ieNtYryeiaxH6DlpBsXK?=
 =?us-ascii?Q?xSy0uVQRmSjAxKCMYIHJaIiv+x5jDqeGuPQUe+HlpT3L5qdyZAsjMroXZdB7?=
 =?us-ascii?Q?G6DOMIKh5+VQE9yWX6J7393xKd0RC5vMgsqHdDrqoDXnSHHubtQmUMlRWcEK?=
 =?us-ascii?Q?kCVS4O8XtRqVcqAaPn/hiBfKzsCk6MbT/ie3wrwRzK0myjTAHJXpHCXqs7NH?=
 =?us-ascii?Q?woeTWaJieM+P6Md4kPk4h27GbjptmQSFYwBE99aCbt/65IihFnfrEW9dOVv7?=
 =?us-ascii?Q?7BkiGYJbVdzgldQJD+3E5Uq2Wv5t1W9tHU321Qoj3rsD7MaSv/hIRqQcWanG?=
 =?us-ascii?Q?d8kZQeLc/IWANOUXSVIsWUsw9kbOND9WS/RTcGyzKnUij8KMt+poLfCDiNxK?=
 =?us-ascii?Q?2sMBNbBm1c8mrdxW3gCT8ULf5+MA1BcCFOSCb5uLqzRTt4p8xDPVIn9XqNw6?=
 =?us-ascii?Q?vpI/iS4Mt0jDf8hS1UvEFfb+330o7M3a9t2LWa8YGZDd2hSRgPMSa6jD4z77?=
 =?us-ascii?Q?fSJ2WbRCfdZGzc2+ccL0WUNKQNoj0KOuqn9jD1MgE7SdI2S1UBlODbUb1whA?=
 =?us-ascii?Q?9cN7StubbGsChUgP5TPGCpYoPLTuXcuqPxH20nA02sa7u7HzuTjeu5xyeh1K?=
 =?us-ascii?Q?aW73hm8VCYtRIXiCFXk+zgRbOr/ROgOm2QN0p/wadpYWmIeF4iaF7b3Aowsx?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f92895-5e58-450b-282e-08dcb871b5a5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 12:49:30.2954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+aWsiLYj2vqvwKWafXLEN5+5fkjmlPYtMbyT3ldHN1v8AW5k2jaN/evivZ1MbpdarJOFBcY+rxpvlTjNInQow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 81da8950b9cca078a3a6d8c255e143871e7cf164 [30/78] ODROID-N2PLUS: arm64/dts: add 'meson64_odroidn2_plus.dts' for compability
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408091951.P1uwBtQr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091951.P1uwBtQr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408091951.P1uwBtQr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller@300: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller@340: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller@380: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller@3c0: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: thermal-zones: cpu-thermal:trips: 'trip-point@0', 'trip-point@1' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: thermal-zones: cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: audio-controller-2: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /gpio-fan: failed to match any schema with compatible: ['gpio-fan']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: /pwmgpio: failed to match any schema with compatible: ['pwm-gpio']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2_plus.dtb: pwm-fan: 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

