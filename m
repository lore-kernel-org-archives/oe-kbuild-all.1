Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD03D29E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723389446; cv=fail; b=S4eWTTgQNfX1LXZdZKpXTww2KaRyopFiroxAu44ufNBt0GslOFhQVciymz1U1b6T/sq4U1lDx2VrfhDQ/bkoqynANhs/LQ6YTw2Zf1IDfOlHIHy9n7Tcblm1+IAQl0Wwu0UnCg3l1hXvcrTIHtpiEb5+Gi5G77K2WReEH1/QN48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723389446; c=relaxed/simple;
	bh=dbpOgqotM6j78vsfQHwPNkFpRfITdgQ/y7/J0Xbu7Zs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VT+PdxH1lKYYHCBxkq0AX0vwoGzd+STZqNmu15Bgln5dom+cBoKTtifKVYSYHTL6jo0zXamwzznaMPVIEiMSosUa3JLqlf9SIVInLmFvbrUN4HiEGVNfu7uV03gMh7rntGENJo9PnvL/wfpvhAe2jk6K58I/hDHisXSirsfy3YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rk/kfyfr; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rk/kfyfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723389443; x=1754925443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dbpOgqotM6j78vsfQHwPNkFpRfITdgQ/y7/J0Xbu7Zs=;
  b=Rk/kfyfrw3pKwo57sxUZJYHyHECJXcJYxhr6Cemaeha+2IiGjZALojAV
   qalsXTJ73DMvzpaePPplJZ8o6A3JJiD0ntFhfL03zw8HQ7poI17OhlJWq
   4uCEV2gKsx28FF/ZtvbWgXBJaUuXuJ5wRvtnMNrbikMsjMToqoAr1ydhw
   RpaCOKg3YSeDju7CU+fqep8R2IA7MPM/A9UGIC2EuNymo7INeZ1bO/NzE
   fKbSFx3Ue0Fvq+tQVuRd6UN1XiLX6RwM/cUPqRM6oGUtExA/GS1dx2kNI
   PlTd5H5d6UmealtzR79gKxEXHtLkdR4Pdxfz3DlkjgZ2VfhGzQpD0e7jZ
   Q==;
X-CSE-ConnectionGUID: 83HYrTUaT7KwXYdWToMhfw==
X-CSE-MsgGUID: 851HesqPRoerK2vjeoKMaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21064607"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21064607"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 08:17:23 -0700
X-CSE-ConnectionGUID: SLdaG0uHRYSewpyMgO4dAQ==
X-CSE-MsgGUID: ngK7l5EqTd2IbYFc5OcBIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="62425628"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Aug 2024 08:17:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 08:17:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 08:17:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 08:17:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 08:17:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5CpiZa46PlFjxMNrR4ELtUdFI024Mgc9E8ss+u6a02/G36Csh8ugD7WKhzPeHhvoni67vhvF3oqQsUwVBicJ3PnYL/Jr3wmYOz8KIoRlOHdzn46Xtp6cIN38v1dxz86PjGzi1uZeXWuC/AVXdGrwiM9tQt4Tp7VJeFWM4PbM6VK1sej161nlNbLZZ1QPylIFlBJmXj3O8IjcKrlg8PLjS5bLr7RukJBCUV0no/wT6LrfEnVLjZogvEPP+kiKWrRseDnQcq+seuXH1ST7t5IjKH0YpLMZpr1Z4BHGCITFQCi3qwjt5MAGhVGgnamZ/l2uE4wzpDOFhw/w5Xu06yaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2dRe0o/uwQdsCf7FpEGpaKOg4qZSZuFM5PnAvoKu9c=;
 b=hRV4+VzNgTi5ZkIQwo/ZHHmbll84SGQ9XBgq33iu7S+iELYaSC1CwAXMLnLNW3HrRrFzv1AsyetMuTVBmIRMgszAVHxwVJq8YIklEwv90TzD1CMFbKR77NFzRsZ4bMncst6/9r/qP+GAneNzNPyER2uKAxCVLB6jCAx1CqaIhWNUiR4HopQlkl4k7dJ2RRQP+sLztEjCqrKIIqPYDiJo35PaByzpB7R0qFtmgLoQs0tqodTi/y/EJ4zPWc0fK5HeFBJsBGFDQmGsDq9DMO0GeXZn9/aYPpK+XC/ivwf4Yf4nOWGQi5QFGHRjJEm4KXpoRRM+zlyaQjEFef1vSfPOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Sun, 11 Aug
 2024 15:17:14 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Sun, 11 Aug 2024
 15:17:14 +0000
Date: Sun, 11 Aug 2024 23:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.6.y 29/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: ethernet@ff3f0000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <ZrjV8lC4uenOI7PR@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: f84a6b01-74a4-484b-3360-08dcba18ade9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z9Sbx0vQhp5v9orPwcQlvrsAdbtUD/PFWhpIs9sLuRCb0dCuUsxNkjulFRQ4?=
 =?us-ascii?Q?4mV4dKAPfz5NDTC1vWCRRzDRMx6UH970sINf6mpMtQ8kflRHi9SXqP7SP1LW?=
 =?us-ascii?Q?URvHKdVwXNqXd4wa8k44bKQsAq3VsOU307osw7fs7GzJyDXXzq45rf8RhOeo?=
 =?us-ascii?Q?ps9BYp7umoqSDSeM3xu1M8HyBEdJRdKw2TAodtZh1k7mndPXnqDWA39fMup+?=
 =?us-ascii?Q?t8PHPuKrQD3m5JKhaPu0O9aX9wO2G/dePqmk/VLHB/VB56eORkV84QD4GPjl?=
 =?us-ascii?Q?anjxDLmfHyHtxkjJ1j3H8rq9ccLgmAr/HXnKQuD1Zop7DisSRo1WozMD5CrX?=
 =?us-ascii?Q?QTRjVdVDnw3oNs0jRRA91SJOCpTHSkKZ/Ni1vFqc3BfbJdrh7+sqRLFwLrjc?=
 =?us-ascii?Q?ee6uy59RG1Pau8qfXainkDUfJl44GAHzhSjFNnyf1PrypBqlJbDty7n5ht4H?=
 =?us-ascii?Q?bSF8DMoPUlBhYNtOJvv6p22YMSFl1Dm3YaeggDxs0tqexosVddEHLJiSQa+v?=
 =?us-ascii?Q?38yPo6/WdNjkuNV1PjR/BHIc+Rbxi8dB199dVQEkNhh8SpRsnn8dHUoYcIvQ?=
 =?us-ascii?Q?KeHEdWYV07F6KT5CMd77rcu+kYj5R7szmzSR6cNtt0OThEV6qCngTV4xdSSP?=
 =?us-ascii?Q?6Irwrj5Tu3o00ONNTc9oxzTxpogo1u2M/FfcrmL8dCqohbREGb8m4vFWYHkY?=
 =?us-ascii?Q?RHzNjtoLGFtQUC0CMT7cV72c/E7JSieJXGKQYJ3Ot3RoGZAGT2wXkvu+12FH?=
 =?us-ascii?Q?4QCSj5o51e5dghXjFi+P3k7GvjrDBlBVRrzfvl8xtCgaxI8fEPVcwHCwTr+1?=
 =?us-ascii?Q?rJlArQTWt5x0WSeyQRw7YuNzjb5wYr1baWSGvXXLHKfiveeJnDgyaGrGZ6fB?=
 =?us-ascii?Q?Vj1+0D9tMFnr2EX6N/LJQmisvevL4NBPf9MmoI0rt7HSh/biv4znEJ7ifWJb?=
 =?us-ascii?Q?Os3chwLPEaHJ+apcFD56la3VMXL7YbnVJpj5oB8TsKJxAfme63i01+1zaTv9?=
 =?us-ascii?Q?cBphZnvcoJfXAcSzB1DnaNtE5+dlEBMouK6ggIzpXjOMkyN4tO1INrL5Vjbz?=
 =?us-ascii?Q?852lazJFp3jTq84i81H8ceBe2QG8pQNr0sbTFTTh5WKC6QSdFdEtpl1pspT2?=
 =?us-ascii?Q?FGfl2rJIhFzPOyKh8AnkjWV0CTJuVvGUEEViH4vrYp0IINiZXtnrfDm1yhFk?=
 =?us-ascii?Q?+RubRY3m/PmC7WUa8Gq0Vf9AbunnHfP27xSQBqOU4D9kByiyZa6eMeXDzXdC?=
 =?us-ascii?Q?hFyn+XXT8EvYkgYXnMocWvzwTDTn5P7wiiizfQSNqk3T/9Pz5bOs7kD2BA5C?=
 =?us-ascii?Q?JN0lcmg+4wZpBWG8IQrgB+Iw3S3ZIqBHxj0SUWQiWyzwilnCaiAIoSGGA8g3?=
 =?us-ascii?Q?57Yj/xg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q/PoP71yfUYwqgUGCwsA6/1nFO6t3Ioi44AcBXUofjUNy6XXrvOLSlP2VEZt?=
 =?us-ascii?Q?lG2PItiM9cdbJgyVJBvZv57DhcfAtm/wsA6J3IHZA69SSkDqzIoajGcP80uQ?=
 =?us-ascii?Q?XPnAC5/fRXUmLnpGhcq5dS+H7rNbcLu3e8MmgkWymVQjOHwqHYcc3ai+wUMW?=
 =?us-ascii?Q?/tFWCw09zIMsAQNlOPz9teQ7I6dVFurCWDyUrG3WyjxwVgl1ZIhDE5l41FTD?=
 =?us-ascii?Q?puxqPF1TE8KFy5IshBsqFutXIH7d8SL5/8diby90eSRfKvTmWjF8KpeSEil9?=
 =?us-ascii?Q?PuB6NPNL4uIi+XDwqbHN2DR7i5wKXHcaH5kaxpZe13F4T9AMWvJF/8Ilk3kP?=
 =?us-ascii?Q?A5oAHci6fY7K0gbMbcIRi64OuqWz4o77I+uhmPbKN/X7f8ctE0Jwt9Vb+iGB?=
 =?us-ascii?Q?Q2PWMDmUuZw06jvoDthtOID1L52fNbP9Rp4InUfChlih5ezr9x4u0f/jPrZ2?=
 =?us-ascii?Q?a033xhZDEs8ZCQ6JO5N9q/O5eCfcOpWVMFp3Gj3JpJXTWuq8SUlzzdwQzGHl?=
 =?us-ascii?Q?y7EEKutT0QL9o1G4KrqyjMWWBBGE6JTr2aXiCNEQvvRGAznnqEBLZ21N1/Y8?=
 =?us-ascii?Q?VYEnHpIvvtII+K+jTlL+En5hjjz9NW6lQeWRpePKbRNULdoMflQt+ZzPt7zF?=
 =?us-ascii?Q?tH6bp29rCamzJACSAyk8NNk86bn9tnoHboYUvzj5wTnDfS+z3d1CwASBfeXb?=
 =?us-ascii?Q?vJgQdwNRNdNZ6JnwtOLxumIv8ONT5u4Urrw0WfSjeQ7HUdUurc7DN9NVwmKj?=
 =?us-ascii?Q?rVit+/kZcc0JpYoUt0zzM29YqqHBVlqsw0oKs/6XA708qHcoUDQsvL3W3XZi?=
 =?us-ascii?Q?H5Do3XhZUUowfPloFCwcxNqw743jzEelpz0ciPD49GCLW0tJrGs9R5aVypwQ?=
 =?us-ascii?Q?qFNsF01j92G+FuEps3I3q5zaaOOd392CX7/nMpPoJvWZha/2Ld0lo3AAg1ut?=
 =?us-ascii?Q?4t2dO4qb8LE0H6f0LCPS+JX3NxthKmX0oZPJONchM38p7L9Q0LPhztZXHICo?=
 =?us-ascii?Q?b/DfEgnjVSEhQzy0XW0x/+FVTiRcOOgTD7SPeI9FLrZHRMEvR4xeDpuuav7R?=
 =?us-ascii?Q?O3PhEzyUKU7MXaGJWdYGcvMuHd/25wPKKS+wMtSTE3xgqZIqt6tyqzuD3xJO?=
 =?us-ascii?Q?Z2duVVRAsf/55GO4pYgMYkfcoxy6GmwzDrXFCGNqjzo5MhvCkvoNAL1P48Gp?=
 =?us-ascii?Q?9/5oB6n/zYSPv+HSsyVPb38okORfFCu1l4Vi+HOjI2n1d66+5uNY+zHFnRdo?=
 =?us-ascii?Q?F4WvOwVz83hCwAJIkzmfe2ArFIJIi3gWgUzPaKny+JCwapCvpgx1mPsatXa3?=
 =?us-ascii?Q?wFIEZ3ewc9TUNMzlLvNsdk1oxgFnZqz3FtyGLELFoAXuYh9c7eb0EAo7/Ynx?=
 =?us-ascii?Q?YXEYCxxUGA+G3UqYEwVJLSsYDpWIItWlUQTiitFARjNuaGKyct9RSZxuiGZ5?=
 =?us-ascii?Q?lj7+eS5hBCGQF3kH3nI8f9ZifS4FP6+bV+t8XfIENoq2uCeO3igEOdZVxbV6?=
 =?us-ascii?Q?HnyPfn9nRBuxmawFMpM6Po3fAEKuYOyjMa1aiMgKNI+WbzklYJ3Mm3AcT8Iu?=
 =?us-ascii?Q?+yHRzZ7rGol+YEwkEaRXL7wwly0JAZvMAvm3JMKU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f84a6b01-74a4-484b-3360-08dcba18ade9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2024 15:17:14.2837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Um3zKcQ2on6szIITQIbiwgQSyOQ3V62kn56tqvlTHeEeX/yuOx7WuWxZbpiqpOBT8HYLP70RMUCvi1NZibOfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: c3d8c1ec682c52028a7764474f78b754fd7a07af [29/78] ODROID-N2: arm64/dts: add 'meson64_odroidn2.dts' for compability
:::::: branch date: 4 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240811/202408111453.KXPkeIh7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111453.KXPkeIh7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408111453.KXPkeIh7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:154.23-158.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:159.23-163.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller@300: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller@340: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller@380: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller@3c0: compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: thermal-zones: cpu-thermal:trips: 'trip-point@0', 'trip-point@1' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: thermal-zones: cpu-thermal:cooling-maps: 'fan_cooling_map0', 'fan_cooling_map1' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: audio-controller-2: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /gpio-fan: failed to match any schema with compatible: ['gpio-fan']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /pwmgpio: failed to match any schema with compatible: ['pwm-gpio']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: pwm-fan: 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

