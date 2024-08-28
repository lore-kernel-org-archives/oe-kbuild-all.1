Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E6C199B9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 02:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724811199; cv=fail; b=oj980BGAv4D8pqK8K8e0CFy3Gf3KyQOMXMdcbxGI10eNPyBe6ffAoW4t8i+XbdoMcznti+3XYhZtonYp0a0wnoLIQQ5thXxIcGGXqTwk9olS3o3IlH2CEtJ1aIYKIpyji8a/Fzmf3qFlErs/oZwpsXOYYs+jC80WWNXF0M6/5Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724811199; c=relaxed/simple;
	bh=sEkUUXwxJPNwwWRTEdp7LNsutQDQ9dlxibgewIW9hD8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OYl9p3EJHoy1XF3g7d1W4q4xXTUmrWu0AVfB98GOGh4oKpYsERqPyZBnmfC1UZ5sVWbRr438NDHJstCOVAnJyc3oRWOLIc7V73B4/CsoUBxRwwHzhz3WiHuAMqrpu5bd7f51e0RpLgsG1ewlfaRUrZyNeeOUikSlr3hM6YMuMW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8anrimG; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8anrimG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724811198; x=1756347198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sEkUUXwxJPNwwWRTEdp7LNsutQDQ9dlxibgewIW9hD8=;
  b=L8anrimGUZ6KR8Q8LS/8sY/bKlUxWv0WuULJFFew+vHKzftvnT4R2hx9
   r7jxUKhR4oou6r+FxsYNcsWEeQaBDCz7JshzyCTxMrxRnC1/8sbzlJdnh
   y0768dK5QReBP3WajuPTusTnqcSDwa2dAw0bZd9KXQwhKFS2mNoobcqGB
   /p7AQi/2epIpstnM0pZJq63aAYst9gnfwLxn7gXiz5za9e50Tb0Mr/7yJ
   6EUzWDgTROQ14w8EUamue9osbW0I9JJaCBs63bJBP6vqivct26X6888ke
   Wmxu013qaV1gQyBIklJ85Veqj6In95o5yQ3xt8N0v56h5NK8S0RBqv3Sd
   g==;
X-CSE-ConnectionGUID: CaiSOF51S4SNkM0/JoCbUQ==
X-CSE-MsgGUID: W6Jx94JpQg603ZawBFTLZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45836957"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="45836957"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 19:13:18 -0700
X-CSE-ConnectionGUID: r9xf6BviTwaEuXljZujYDw==
X-CSE-MsgGUID: Z78SlDm7Q7GaCofKJawLPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63582224"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Aug 2024 19:13:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 19:13:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 19:13:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 19:13:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 19:13:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiot08TRbvWby/60ZFm5SPpMQbcT7z1PR0UDSKsP1k09XJ0nIbZhEksmg/rl2AiSWKwZ6zx5eh3a0swincHoCVTd+8jsfhynTe6LryuEtdQxDhFQ9wClJ6kelXNlcZRHCLM71j+07LNz2autHh4m0DvDTv8QMRa/Gq3CwQLix9OvXzPJxGv57ov51tTjZEy3Oi3H0b9rnTq+B04md/Vrmvt8f8gXufc3Ql3qkUQOytBsZ6lAeW7+0M6QktNvSSSnf3iFdifNqV3x2+atVhDF/05XgTCtXPKT66Mrej/Ew6obK/XcQpfWmXiafoMY7UhaKetBeOregu8g3jwZIqjOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8d9Fi4iCOh6Co0IXnGvXeOCH6zVBDNDpOWB1cCj1JEA=;
 b=EyLLaF1FP7EQoEp1rWYB6qEdNSs7L6205Ia3MqihHPMmv2yPmnx5CwoYYY6Yp9X5XRrEyz6/HmlmAy3p4/KMtS4W+yQOVhPeuqCNHl+0/QDa+5Q6Q74P0JxmHNuNcpXcu2pQIWj+5mlPVFRU4F2r0g8iXi7DOWqTa3Ws4WcI5FVG1Fwi58B6GsyUIrK4NkNl2QXOTOyCPpAqtYO2Dz9z58ISRxdApSb5KkjXz+69U3ov1eUD2vOo+mcO7EaJTbEYS0Zy0SVOJIUq7sgG71m7bk+L8WdfQwMLI+WRBWbMO3aNI0oj0NtlYI/TP001EpceTUMQbuTiwzn3uvCZjgYiKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS0PR11MB8136.namprd11.prod.outlook.com (2603:10b6:8:159::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 28 Aug
 2024 02:13:13 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 02:13:13 +0000
Date: Wed, 28 Aug 2024 10:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: <jasperwang@tencent.com>, <kaixuxia@tencent.com>,
	<frankjpliu@tencent.com>, <kasong@tencent.com>, <sagazchen@tencent.com>,
	<kernelxing@tencent.com>, <aurelianliu@tencent.com>, <deshengwu@tencent.com>,
	<flyingpeng@tencent.com>, <jason.zeng@intel.com>, <wu.zheng@intel.com>,
	<yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [opencloudos:next 10/14]
 drivers/thirdparty/release-drivers/bnxt/tfc_v3/tfc_global_id.c: tfc.h is
 included more than once.
Message-ID: <Zs6HrgxNlfWfBrep@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS0PR11MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b11123-f2c3-44a6-afd6-08dcc706f85a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eifryw8BPWehHXW0VEHMKm9uaz66GTZIraGmhlHBgb/blpQHJu/MAptVwSmC?=
 =?us-ascii?Q?o/H1sTpXk3V3o8cc0+hXw/Ev/pTR1OnwZbquWi0/wkOqE+at8STLnUEUXmeq?=
 =?us-ascii?Q?Z+WInfl4j7HIVpk69Azr6BjistzZpaMbzwBUdJ6ZW8uaINmlJH9l7iZI8+KI?=
 =?us-ascii?Q?bzalvLhNO20Q3L3/o6Y4awNEXkaj6DEhO+u0FoAyQVHdwYKrtaSUKQMMN4ts?=
 =?us-ascii?Q?IFHPa0HeuXhwF4xbYaCJft1GTTcNZJgpNv262GnlJ4IJjLmBAks9qzq9ic3i?=
 =?us-ascii?Q?7TW9UnTldfGN9bC6e5cHG2kZWenKqVr07Rj7Sp2o3D/LDiq3xZ8hmDGQb2b/?=
 =?us-ascii?Q?mL6P1DNFumrCvX5Qas+B1468Dk0JvNuF8AMrKll8Za92zSHjAFpyDNwujCbI?=
 =?us-ascii?Q?D9Z+ZtEeD9Zdrm9mUIR90jSoqbKXEIWXDPVw90544yEtCFPPYpxU9vLCr+Eq?=
 =?us-ascii?Q?IdW3lrZ+9JE+L3aARIgUT2FAeEm3FHjuAyxWbk82VJ82OS9FFPkcgestRp6b?=
 =?us-ascii?Q?XSYP0NFb1lrMVDIoH32HxIwDYqKycD4CUpnmxt2PXupLCv8di7WlqHhk+ua7?=
 =?us-ascii?Q?crbN2Fdsq4XETzTAeoI5ORDxscsu3xhIhw5xuM9PRaG0W/h98cuqRE8GXkz2?=
 =?us-ascii?Q?d84Oh0LjOLpljUs4/y0pWv9vVYclLyO/ICdzEOmBHy8AyBgdc48LDw2Ey6nA?=
 =?us-ascii?Q?adgwf4rwigfpX0b1zz4ZZSWBeZ5vqhKBh1UvyKSDyOdr22+1EpnuDTeuu/hH?=
 =?us-ascii?Q?JPteWTusJd4nS9JDmeCMlWs5UWNt6GOAYw1dJl49LPoDskNICYWJuIzvG1/c?=
 =?us-ascii?Q?QeBOid6j8T5qfOgzHC8HSRdFLuMnB66OQygOxoCAo9I1lEk+Trp34UAkBNtl?=
 =?us-ascii?Q?VkVf22W6VGLbhZ7tc2cEI+Muzs3wmpyTWrNLspr7oJC8YIzFJ/khmkWjSjCN?=
 =?us-ascii?Q?vxMjk6vYYe9DHvLXUcFq8B5+CBmZZjdMxiOxGVJ58C69xdSAzbH5L+TeplRZ?=
 =?us-ascii?Q?atd8CP5N922Mbx0FTFRMx++jqsIMO8v1utfuJG8osaPmsPD+mO4xhebBR2xZ?=
 =?us-ascii?Q?Ue7UnuFXK8MIiCxm87Udu2YWMR52v0t3cNwIyGCr7Pi7/oA2CcZeCnH1DCi9?=
 =?us-ascii?Q?RpLUm8RrqQZJD1E1GIMl073SxX77GtThiYOHOk4EqoMXdmLS0+Bsshz90rPv?=
 =?us-ascii?Q?Uqv3+bG09uXO76p108CbNVtEpqYBu3e6eJCSwLMQt4WHhr8jkkfxdMs0IIsP?=
 =?us-ascii?Q?zhJiIHrUo5utAy27XkLUqlxfcsITMfk2l+XC/8FKNxzZAABAAnpHbqFypEQB?=
 =?us-ascii?Q?K29jaxlsL95OVSrx00qWWVs8LIoqUWbyS9hcgDsUn40oYQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sjqbz5U09t5zuGH5VcMck5r4FzPxsFhhiAdxPF+dXOsA1uRII1nsQV5J4dKo?=
 =?us-ascii?Q?qOf/ujK2iid4XlRI22692Og+y6bOjm1rDS4bRo9tKOwPBbVVV5IYX+Pp71F7?=
 =?us-ascii?Q?WucP25sY6t58QSwVDseOAhJoiR7z38igszLaBdnCPzRYYXXic18sw9IyKMhD?=
 =?us-ascii?Q?qAA5A2O3bJwbb16rE3qzwyiYP3h6D5FzmjpP4zRQD5c7Fz9u8489W/lyRauj?=
 =?us-ascii?Q?/kVMq5yDR6M/xA9yERiBfYUIJaXBk97WwLJ/feY9p27qkE3eSrDAOsJme9Ct?=
 =?us-ascii?Q?kyNzVAjA2Y3lYW6MBC/L/eDB7F5hDODI++bAHNnlwltrZc16OBhL8KqpYFjP?=
 =?us-ascii?Q?dkDZKa9ungma6qBome0mXZwjX1gc+2/J7HBWuCLylM+66IRjc0AmeP8aIRTk?=
 =?us-ascii?Q?SEgW0Y78TGk6J0MtiBjioHQIk6f3uC+TMaJUri/ZLsl/nTu1upLVxy9h379g?=
 =?us-ascii?Q?vZM2Y7JACFUycLeCf5ZLIuVDH/LhH8NUO/1PLezIb2Tp8d2R9z3iiQGgPZX/?=
 =?us-ascii?Q?DLYdUxAqLXf0VfLTNOFwH98ZzFDMwMh/+gkvAv786jF7/kYR5unTFmZiUWTl?=
 =?us-ascii?Q?w328KdLSW+10YGdNCpfUxeE84y64p9AT8zSenvlVCm78uUc3G9kKAFjXoRzA?=
 =?us-ascii?Q?Iuf+Oo6PVMq7Xzw5P92GZ+zY2wDdH/w08KjkZ1cjN6nLgVdAP3Gk69zt4fm6?=
 =?us-ascii?Q?XHZ2gT1dhhxi513ZbLwIOvUCPTbcE/D/PcihSerJJ7FXNTN+/zfKTw3aHQMg?=
 =?us-ascii?Q?vOgfPme+Zo/2EEBpqBQ+s4xidf/kGdI4RsXrameKnmqhGXeSdRbEn4M3Zz6N?=
 =?us-ascii?Q?b4Ah0CVOEVCCtRNafIlgfQUHnfONfpmrR3VmCJkAAncdBcHdwxto/HKZfLxm?=
 =?us-ascii?Q?rWj1w5NIfG0/0p7TBEv0iu9Dbo0jbV5VXgl1Na8T6aM3t/bfgpLYbKejBr+B?=
 =?us-ascii?Q?3H7Sex5EcIDalHnWgwevCPPl0Cbf+0IP3SwlgX3BxzS4gv8g8i0c+ANm9iXC?=
 =?us-ascii?Q?ghNcvP/qsPtfMEV4V4fpJAmP4B8N517EFc7+J8GOJPB0L4rhor4QgTIC2s43?=
 =?us-ascii?Q?SFbHExIlyVN6xn6hCvEOM4BwCo6LpqFbXH5YaP9sQW/5+A8tG7IYv8RkFPNS?=
 =?us-ascii?Q?3AWD0VSDHC8G0JQ2nGtKZk4JYmbkJRlgOY+imbaZVeKu7Vjq7WFDPE3Xz6+B?=
 =?us-ascii?Q?KgIAyjG0uPngUnMiGoQFDsKJLvPICEvJFlffQ4Ap1NyCi5oO4UqyWQeN57ZM?=
 =?us-ascii?Q?nNEp5hZD+axp9icjrZuCkde+j3o2M4vnidGlKwAfICmzAy7NI4XOFq/a24Vq?=
 =?us-ascii?Q?lfzrBoMKTDM2ZHyEOGWlmCNliHL3YRzS2mwz6htkQSD3bB/kfpUJIzAv/ebJ?=
 =?us-ascii?Q?sEC4N+0+LC6pKQgEk64zlDAHU6YM/K+KmTs6W2MJhqFxaPpWTOZP1BZvD5hF?=
 =?us-ascii?Q?/PX7vJBQgjcPjCCoWB92U4hg62DP6aa6wsXtNDPwzBUBHFDcQIaUBXfz6fCy?=
 =?us-ascii?Q?MOp9Tho1Jb/MmwPgEwrQf9V4afqLIlQ/MtV2vztVm/91g++iDCA3CshQrrdR?=
 =?us-ascii?Q?3uyf4MXi4rSdY6Ahx9ZJA9Ezi+7QfvOKWH2SgmVy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b11123-f2c3-44a6-afd6-08dcc706f85a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 02:13:13.3625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWzDk8ZRTdtbK+rDPWsZQANbRWStz04hGyuNR7f0moAcIWBLydMr768KKquReV31N6a5+CfLK7DU6vIOUmAMlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8136
X-OriginatorOrg: intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c99409f7fe0f14dae19af75e7e896e7a17b92946
commit: 3db1e8157ba7d83cb745e12ed27871d83ed045ce [10/14] drivers/thirdparty: put release-drivers in tree
:::::: branch date: 8 hours ago
:::::: commit date: 10 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408280334.QApRMuws-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/thirdparty/release-drivers/bnxt/tfc_v3/tfc_global_id.c: tfc.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/tf_core/cfa_tcam_mgr_p58.c: cfa_tcam_mgr.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/bnxt_devlink.c: bnxt_ethtool.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/tf_ulp/ulp_tc_rte_flow_gen.c: bnxt_ulp_flow.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/bnxt.c: tfc.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/tf_ulp/ulp_tc_custom_offload.c: ulp_tc_parser.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/hcapi/cfa/hcapi_cfa_defs.h: hcapi_cfa_p58.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/hcapi/cfa/hcapi_cfa_defs.h: hcapi_cfa_p4.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/bnxt_auxbus_compat.h: linux/mod_devicetable.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/tfc_v3/tfc_tcam.c: tfc.h is included more than once.
--
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_identifier.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_tbl.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_if_tbl.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_tcam.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_em.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: cfa_resource_types.h is included more than once.
>> drivers/thirdparty/release-drivers/bnxt/tf_core/tf_device_p58.c: tf_device.h is included more than once.

vim +7 drivers/thirdparty/release-drivers/bnxt/tfc_v3/tfc_global_id.c

   > 7	#include "tfc.h"
     8	#include "bnxt_compat.h"
     9	#include "bnxt.h"
    10	#include "bnxt_hwrm.h"
  > 11	#include "tfc.h"
    12	#include "tfc_msg.h"
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

