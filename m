Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B1D46B8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 02:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725762079; cv=fail; b=Q0oHdNR9whus+0uCJ0EmWKlH0sFfZn2f4RZaDJz9tYSfvy6kYPb3D+muSdILcQKV+VTWj69SvbFA1KYd69sBU0lLgA11AfFwhtvpTNjn09jH2DWj1wnU68aakVzP4V0cCK5CDBUr7TBP/ihn78aA3hdPuAkngqtChv0PHq4LVyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725762079; c=relaxed/simple;
	bh=P/7m5HdGHJflGMMQRKRoK63XN3HmOEKzDXNUuqjwh3E=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XhKpkN5jGvB0WctnmogUaj/OxBeBu9mShlSUPrkRrNNpPdQNQuF4XTULM9B13J8vxpF9hcuQea+Di3c1qdPeifD/ZmthbV2A2z3dKhQIGdUrwdzr64pLuo/gQl2qPfMyiVmNWi0dUt+OzYvo3o6pYvPPqTlp4AVfXWoI/HqcXqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9aZMzJS; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9aZMzJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725762077; x=1757298077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/7m5HdGHJflGMMQRKRoK63XN3HmOEKzDXNUuqjwh3E=;
  b=W9aZMzJSt1zOWoPbKC3kPh4gq/BvK9Aop8rHteoujHVQpYMih5ZO3CBH
   E+BDpXL+tqhnOXHRDOdn+iBRZbO2S3QK6vWkg9trsxE3BRW9W7kALoE+v
   WXGoTgkubtxyNXzG5SPHr8kPydM7CW/R+T0U6cFtla6gw6W6Vn1VDykmW
   edryiw+LXJLqGiqbB5Qwz7I1upywO8E2cJkQYmw7fjz6waKe7al9Xn7Hl
   w5txeCq/9ROP3jO+J8T9PKfjznjGyrTGa6h3nGq+cAVqEkh/84hB+GQwU
   DQTIZX3Cbadb6WYCak9+wdubu4LfFMsLlift8iYsAP87qHjZEX8qar2qz
   g==;
X-CSE-ConnectionGUID: RCL1QKD0Sri2jehzV2yDUA==
X-CSE-MsgGUID: RX1zdLtPTsePl1m6qzxxKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35627578"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="35627578"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 19:21:16 -0700
X-CSE-ConnectionGUID: 8G5vHiFsS3KbDgKU6nAxxg==
X-CSE-MsgGUID: xSYM1iprSXGBQl6w1Uks4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="66008749"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Sep 2024 19:21:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 19:21:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 19:21:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 7 Sep 2024 19:21:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 7 Sep 2024 19:21:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/PqJp3uNFL/q+iVJHsydtJsqqdPLkdhzNPVHhES7O3gWW7iMo2b2FMkEqReDoS/TULRX5tYo/sXJSRcnEjHHW3iPH32c/xsVrKWApHC0u8CLgBhBQ0fp8WryyAOXr23cxBaTvAyT870xtxQJR0D7RqdpLIwQsj0GJVYNme92gJYYD/jI1MKog/66eIVs4+irokp4PYIQt+/2O7BmH7oB5uPuQAOZA3m4U+vuiyXnTsRTyC4niLmEb+NihRWj9f/O5QSn2IJPcUSG38QEooDd46zY8wKGmsXsukX1PUBjIwhIcldZBJ06NuBRh+y/LIp3VzRJ09f729vAzO0rYPJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w8s6/WTPH+eC0bxd3tziYIKHS7SYWvrucGBsyI3ZWc=;
 b=PdvMDDZWIwz3OPOTonuaBB4pqhiiR7Ztp2RgvH5DdmX8Ac2+fxsTIw7KEGGthVhAAFVwHZtM2X+8zpWXcGxNsNZ0hscFqXle3rmdiSO80EWC+LFwn/yOl6b3VKybmhULpeZiZGhpNcYyxasUDgXLkAk089vO8LW51fvfbi1EcIIzuFQE+bUfLwftaGLxYS+dWmcZoMbIR9cN5c4czfz9ox/ax+HPdE4/c6oSOG5G9dNFnARzJOQeYW0FYHP2MfQBVyMTRol5tay2Q+BKQl5UChr7XqDigbJ70NWcOXmiP02vrnwHCOp1vaW7vhyN5J4xskbNDEuL3vLgB8uXc7xERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by LV3PR11MB8725.namprd11.prod.outlook.com (2603:10b6:408:21e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Sun, 8 Sep
 2024 02:21:13 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7918.024; Sun, 8 Sep 2024
 02:21:12 +0000
Date: Sun, 8 Sep 2024 10:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chrome-os:chromeos-6.6 86/93]
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:456.11-465.7: Warning
 (graph_child_address):
 /soc/i2c@1100f000/dp-bridge@5c/switches/switch@0/ports: graph node has
 single child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <Zt0KEOHg5OxNdrQT@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|LV3PR11MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ea57de-cb49-4e42-d4bb-08dccface8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6JWYvU0sKYU2UfVBXrotGOwxVkZrXlwLbvSa8HZJdPUXCb9liw6yHFhuywbZ?=
 =?us-ascii?Q?gnmFjeQeb82N6/bOOLD74kuuD1ohV+ruxd9yS23CVgscvSWuPYLRCgSJir9I?=
 =?us-ascii?Q?/sUnXoYEBLzo+UycKldJAVPLdmzTeys8QuQe/pzJLtsZ2cbQJ00UA+72nM45?=
 =?us-ascii?Q?VrHUX/BnmtAFHfHUi6CNzsQWaiBssfISKmmV3BlszH7t9YNQB5MAiG+VdfqN?=
 =?us-ascii?Q?j7H8mWhqDEqYZAKgq7y6z6DP58Y+8MnB3DUEWwiPSGVLNGm+tcHUqNMyYyly?=
 =?us-ascii?Q?ghwqQhrAuUAt5CcEVXEAuJHuS2uQ2pUIfC1F/zhiVFIysTGbXgDDI3JemWCk?=
 =?us-ascii?Q?9Tf8Ir4cZA36yTom9l+gib/lzwhlVcPzAoi18zocBY3rkpuTkg+9By5cd5Oz?=
 =?us-ascii?Q?dA6iLORxzEKl64ysMRtdpERN/hlWbxqeQs92OI3/PSxaA8z6Jm/tppS1oLUd?=
 =?us-ascii?Q?5/g+dLuOrhFB+fZbIlrFg/ySC+vwRSPhu0bQrlZu03O5rN3QY1ZgsCeNJ9Su?=
 =?us-ascii?Q?SzTiCHgjO8rZSaCKiLK6E+N2LQn+uENPN+FBPAfRQ4UfDYGsgfNwzhJWAtX0?=
 =?us-ascii?Q?HjaBus+rkNBt+INyb/QKm3C9sMiARjiSB+3YMz8yNoKfjdzE0TgWXwSQ6lnh?=
 =?us-ascii?Q?TakxcqMGT/nRjVjgHpz0BMRVau7W+bWqnUwjLiBNk2IKZtmUVPywt+H90uO9?=
 =?us-ascii?Q?JmQnVbXwmQTfQ18plo3XelkWM6OGL71jMAlmdd8da9qNF4f9Blp6cmiMafzS?=
 =?us-ascii?Q?VHYKmNW02sye5jCpl4YkDxqfB27Xt2UdmR3dtXj/C/oEss7b+ODEvCulU1lT?=
 =?us-ascii?Q?LB98sz7NT6SxxVZIrhwNs78pYmX+acq6TdRZbu+aBQ8kvW3Ojm2CYoDrmF3A?=
 =?us-ascii?Q?FQCfYy/aPKZOi+OAWheJ/QSyhdeY7TJlHVvrdzgqC4+rqqcntXrLRn9ay762?=
 =?us-ascii?Q?BvDfSDS1bwPry9G2Ohv8aEM5zHn7BwyR5fhGqootUQ8WuXdfEFFV6ZOmuGcj?=
 =?us-ascii?Q?yMMdvC/N7j4pvaYCKjMItAoyIn1vcgsqzeGRFb7iKLHgSkSH4MTimWZMASou?=
 =?us-ascii?Q?DnpSfVtcBEfUU6JWz7H5jiWYVwT48vTL6D68Mng2TRwshnnDOIjPqTi9fdgT?=
 =?us-ascii?Q?VQ3ugi1PpxmlkupVPTZN/nLf8TtuOpVcTnMAhNlebBGskmc8xfvhVffg8W15?=
 =?us-ascii?Q?6Ii+0wHt8BsGwFhXWlKhgaxA/eabD8/kMdaZcPY4sGbE6Xp31aXu1yk4EF3D?=
 =?us-ascii?Q?gSEcfeRVqDpxdMBjDnL0OBJg0ENFOk3k1+QslwIx9DQbVClgi9yH8zMPCPN9?=
 =?us-ascii?Q?SGpB7qJz9fY7hA6tunGs8uSUaIN/6j5tBEWrc2XbO6o0AgeXf+/aSLZZsYeU?=
 =?us-ascii?Q?pJXW7//jtdg03JZYlyft88xaveswOvmVWmgJYnIVbhRi7cpo3g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9oFoQ4vL69xuaJArGuBY9ecZstb4Gg/3PRhfoibTEdggf+/rq11qOF7u2zSQ?=
 =?us-ascii?Q?5pxvnm1DKJbBKvOtWqlbEoQBMwQV2tCYp9Ui+78MokhF8ufAlJnNzf90DSlM?=
 =?us-ascii?Q?NzToXM4z4klsPeJXyWMMFeji/n4BYD6n++IIzGL1xmDCk3ycLVyfN+F5SPJZ?=
 =?us-ascii?Q?GEfZzF4EGJ6GZf1PVpbzk/Sg8R/t+EO53o4Vg4ZIqY8V0KqWhDHakLkupXXf?=
 =?us-ascii?Q?jksTGR02ysyMVJ77KFwGJcgXwLHpUyiTRqlUvnn7TtaPTQD3QPZjun75BoQr?=
 =?us-ascii?Q?hMHHmgz3K628mDF3sn7qjz3jUir+on3bMC2b2iBAUs+L81mczfMEiYl3Z22x?=
 =?us-ascii?Q?Q8fgMSwu/0PVQ0UTBPfX6LC4I4mJeBjPF3CMEQfiut3PuFyAI8Uuc0tuENbt?=
 =?us-ascii?Q?v+9/6UXBgGr3l4S2kHxg4E8UOSzWhzbVcph2xwyh0qrNkc6dRLxgN8uXBnIL?=
 =?us-ascii?Q?lD3De/jk272917xun8CiebbLYYE3zqRtTz2Fot9xucaa2okIbLrNez7vC9To?=
 =?us-ascii?Q?fLFw8fmlpjwx0oFwyZa+F9Q9JLn95bzODrdqv5joP4UhjcDXVoPTjugvSVbv?=
 =?us-ascii?Q?oWfG0RROwl6c8L+axqn1/VumG+L12/4GksIxkzqTpMI5wgeGkJFwxzR/PSHJ?=
 =?us-ascii?Q?9rSW20+xSG4viva0/176ltgIL2SQ6jqonOsCTUhDQ9dA+7EV7mjiQAnlUAEy?=
 =?us-ascii?Q?bKcuKu96JckD8M5V9xrhsOk0gvPDYRl0SdRFv2BpHlJ3ONia4WRCS2vpWRFK?=
 =?us-ascii?Q?xhTiFls9D5iyz0C4EIH7c4QvufnODr4Hp317/zjTutUVHx7st8ijdtbOWou+?=
 =?us-ascii?Q?FWL+DnNUoD6D3qnhdwas97vHEGLCcJOtk4CcRc8iVgqhA1Ozj2+lVMcBPffK?=
 =?us-ascii?Q?F8C2I/Nx53+NvHfFkbfA0sJet1yRm+DII4/zIPhSXXKxs9B5IkwNyQaQ7eNy?=
 =?us-ascii?Q?J1RMMpRXjDUGbvjT0EcEqXluDJ8+koq/ZbyB3OSycVRjOa21UTHQQ3d7aT+O?=
 =?us-ascii?Q?kgzULI5WXEoS6ECIRoK/aU1YQrs4PevsVo3+TjMGuotaKa47fgHEzNFI/uaY?=
 =?us-ascii?Q?4iIzuMPt13JJ106nn0zpnFTp1Zgd2j1VJs2LOYsfr4VmGcKO9xXX0CnH3dqc?=
 =?us-ascii?Q?Qae9au6D4V/XKJ2Q1cMhpIGMUodW+5eWqyQNbibVhAwg/63xxdVlpvaL7vEk?=
 =?us-ascii?Q?rkTcBPiL+RVN8Pwse+uBzVtwp1iH5JN2oNyH/857MSc7ZdmEqVRCIq3csdL0?=
 =?us-ascii?Q?3Eo4PthCCNl0nW9djYNbDcTL1ZB5QCT+iOGWp78Kv0tmtzWkE8EmstDkLsEO?=
 =?us-ascii?Q?48SsbjeXmsp/u0781dwxh6rPZfOOQjpCvRx3HSpP2rm7gjSY7F002T9hqTsd?=
 =?us-ascii?Q?opitBsc+jPnTDkrKBSy4AOht05EUp1lAma/3dRkNKC1HuwlHH88uecPKa3RB?=
 =?us-ascii?Q?XrTFRxMWdItWYlAairwAPsGaOom6tr1OJ4+efm3Ir6Qr9ZZxVJ+2ws+E4O77?=
 =?us-ascii?Q?yt8XIhaw0QN6IK5/NUEkHfOW4UJft8WvhpTIUVUst8lY9CSQjzLkBW+XJSPg?=
 =?us-ascii?Q?3nrNHSuoQMsWJKDXxFfXe3w1juLpcnHUyOe0wr6F+Y5o1MiOirRjVXXPQKV7?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ea57de-cb49-4e42-d4bb-08dccface8ac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 02:21:12.7470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOi7sBcmLt+JpBlposjaFw/i8yLSOJzrY2r8g1+TC4bNRvm1x4EdGkgP0LvQ5RJ45BvYHeeP1rDHmVMcns5t+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8725
X-OriginatorOrg: intel.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   9160bf23e2a5e493e48977aaf614963966e2784f
commit: 8d1afcec79f28ed381a4187e49c22a15f62f25a7 [86/93] CHROMIUM: arm64: dts: mt8186-corsola: Enable external display
:::::: branch date: 22 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-003-20240907 (https://download.01.org/0day-ci/archive/20240907/202409072102.a5nGTDvx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409072102.a5nGTDvx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409072102.a5nGTDvx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:456.11-465.7: Warning (graph_child_address): /soc/i2c@1100f000/dp-bridge@5c/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:473.11-482.7: Warning (graph_child_address): /soc/i2c@1100f000/dp-bridge@5c/switches/switch@1/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +456 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi

55a526935aeae0 Chen-Yu Tsai 2024-01-26  409  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  410  &i2c3 {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  411  	pinctrl-names = "default";
55a526935aeae0 Chen-Yu Tsai 2024-01-26  412  	pinctrl-0 = <&i2c3_pins>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  413  	clock-frequency = <100000>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  414  	status = "okay";
55a526935aeae0 Chen-Yu Tsai 2024-01-26  415  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  416  	it6505dptx: dp-bridge@5c {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  417  		compatible = "ite,it6505";
55a526935aeae0 Chen-Yu Tsai 2024-01-26  418  		reg = <0x5c>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  419  		interrupts-extended = <&pio 8 IRQ_TYPE_LEVEL_LOW>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  420  		pinctrl-names = "default";
55a526935aeae0 Chen-Yu Tsai 2024-01-26  421  		pinctrl-0 = <&it6505_pins>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  422  		#sound-dai-cells = <0>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  423  		ovdd-supply = <&mt6366_vsim2_reg>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  424  		pwr18-supply = <&pp1800_dpbrdg_dx>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  425  		reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  426  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  427  		ports {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  428  			#address-cells = <1>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  429  			#size-cells = <0>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  430  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  431  			port@0 {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  432  				reg = <0>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  433  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  434  				it6505_in: endpoint {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  435  					link-frequencies = /bits/ 64 <150000000>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  436  					remote-endpoint = <&dpi_out>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  437  				};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  438  			};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  439  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  440  			port@1 {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  441  				reg = <1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  442  				it6505_out: endpoint {
8d1afcec79f28e Pin-yen Lin  2024-08-27  443  					data-lanes = <0 1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  444  				};
8d1afcec79f28e Pin-yen Lin  2024-08-27  445  			};
8d1afcec79f28e Pin-yen Lin  2024-08-27  446  		};
8d1afcec79f28e Pin-yen Lin  2024-08-27  447  
8d1afcec79f28e Pin-yen Lin  2024-08-27  448  		switches {
8d1afcec79f28e Pin-yen Lin  2024-08-27  449  			#address-cells = <1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  450  			#size-cells = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  451  			switch@0 {
8d1afcec79f28e Pin-yen Lin  2024-08-27  452  				compatible = "typec-switch";
8d1afcec79f28e Pin-yen Lin  2024-08-27  453  				reg = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  454  				mode-switch;
8d1afcec79f28e Pin-yen Lin  2024-08-27  455  
8d1afcec79f28e Pin-yen Lin  2024-08-27 @456  				ports {
8d1afcec79f28e Pin-yen Lin  2024-08-27  457  					#address-cells = <1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  458  					#size-cells = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  459  					port@0 {
8d1afcec79f28e Pin-yen Lin  2024-08-27  460  						reg = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  461  						ite_typec0: endpoint {
8d1afcec79f28e Pin-yen Lin  2024-08-27  462  							remote-endpoint = <&typec_port0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  463  						};
8d1afcec79f28e Pin-yen Lin  2024-08-27  464  					};
8d1afcec79f28e Pin-yen Lin  2024-08-27  465  				};
8d1afcec79f28e Pin-yen Lin  2024-08-27  466  			};
8d1afcec79f28e Pin-yen Lin  2024-08-27  467  
8d1afcec79f28e Pin-yen Lin  2024-08-27  468  			switch@1 {
8d1afcec79f28e Pin-yen Lin  2024-08-27  469  				compatible = "typec-switch";
8d1afcec79f28e Pin-yen Lin  2024-08-27  470  				reg = <1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  471  				mode-switch;
8d1afcec79f28e Pin-yen Lin  2024-08-27  472  
8d1afcec79f28e Pin-yen Lin  2024-08-27  473  				ports {
8d1afcec79f28e Pin-yen Lin  2024-08-27  474  					#address-cells = <1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  475  					#size-cells = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  476  					port@0 {
8d1afcec79f28e Pin-yen Lin  2024-08-27  477  						reg = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  478  						ite_typec1: endpoint {
8d1afcec79f28e Pin-yen Lin  2024-08-27  479  							remote-endpoint = <&typec_port1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  480  						};
8d1afcec79f28e Pin-yen Lin  2024-08-27  481  					};
8d1afcec79f28e Pin-yen Lin  2024-08-27  482  				};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  483  			};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  484  		};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  485  	};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  486  };
55a526935aeae0 Chen-Yu Tsai 2024-01-26  487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

