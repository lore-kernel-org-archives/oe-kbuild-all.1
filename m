Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E21917CD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730878239; cv=fail; b=WF5DEDzUu+NO8HezLFltayFLRPuIRa15naqgcfirJUVj22w0lHeAHaKBv7WgWFAwhzCy+KRdzYclQ8huinMi9yd4FFTyBuqH6OaaLXtXGRy+nyPSpxVyLBxlqtSQU1CVcc2P2SDqCIgSLX9cNjE9LGBfQnYnPzoOACrxHPU4AnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730878239; c=relaxed/simple;
	bh=deM76fBPAUhwDKmb97L7M/157xCgCKpfTClao40qihE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=E52pNiE65EB1rk1LyAl+IeMgad6PCwegl8kX2XmFdaBVfXHsccXNC/A1TGAQ+xPmfC2qMUZFjCSqeWtEOzpx3xGYBpwSQ6Z42G5vYPdpej1xhBWZQld26p/urI0a83b7TEWh1KMLZMJvaH/5iAqCBcs2VeonPy82v1AaKxSgpsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ia79J2Sq; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ia79J2Sq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730878237; x=1762414237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=deM76fBPAUhwDKmb97L7M/157xCgCKpfTClao40qihE=;
  b=Ia79J2SqYvi3riEGl9q8OHzIXbFRPYnV3De03j/aCUVhYll/dI0QCeZS
   bhlcpO1G9rwE5g+Sm/qiGAcz8E7E4mpa1kkpyoqXEilZEq43McGCECZQQ
   clml1r4Pt2DCEo8bKqPrWS2cYO6SL8PUFUEBE3kpLTYQJRcAfNL88NDWL
   A5dRPbDoPOV8wBXJsanPjBq5iDErwFPl41hZxrQ4/z7qI/I4BlHkkMR4x
   skGgC0Ydo80iUybW1vWCB0zk77GyLkrOFDkjhwyMnNXUusQu1FeYFPUGU
   AuUeXfekoSNesfavJRgw9jLlCEDXrVmjqm+glBqVUHjm1N9Gozbg9EJNE
   w==;
X-CSE-ConnectionGUID: ssX9MHkLRT6bO2eX2XO8qw==
X-CSE-MsgGUID: n14sL9wmSUWZ6O5TI0G0cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30838545"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30838545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 23:30:37 -0800
X-CSE-ConnectionGUID: tTIxZoNhSbGn2fzxLw9jOA==
X-CSE-MsgGUID: gbhnRy0USz+/ycXARWMRzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="107711455"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Nov 2024 23:30:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 23:30:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 23:30:34 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 23:30:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ub7+GDsOu7VPaD1xIdpbuy3aTzPaCOgNEqNsWMoOwPnHb/3KKbA7SySBlBJn2VRwhgrs7FQDTo+hqvst5hbbDegqmqOJcHvSe7JP6BJ7w/AP8jVwPByOlpgK/MLZ5UZsE6pUvtsuxzzpJKNLi70XYwMU7kAvU1RnpPc4XlDBkoik3GNE8MpKPs7kKIoPXz2cvdRMBQ+Xj8n5z+olzfvy3b280u4XuH0QumEogm3wj839i3yKQ1790GlpT2ZyIa3oyqZMnA1TV3FQ3LhFMmUTl9LC/eoyHlXEEp4KocMCZr8m4imn5Gmig+ghud3gcWd7a54BnOpcNO5fB6VN5lXgDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWPdCKllEfYHgPbi6ayfbtB4LrqEAC9DEbOR+7P2f5k=;
 b=l+FCaBIHuEjyCXPXI8O/dwi5m0x+JOZDVqreQGK/+2CWCePuqcsP8r9yuFcGr/haHbm9COiHp6Kcdv7TmJ2w5Se8eVV2D5m2g+b81mlwDkR/+eYPJHGZzhtnDdRxhwUa9yTIEKc4tM+rd3jXZZXxrRweDt439ir+LPpOP72ZE9iXKIpaeTgO6I9TWcC/7i913gZaq8kCNQRqJWYhSJ6TiGZYtGY8+kbINADyjcXi3wjSqxHeQ6qfVXx35NtIRaSVIuUSdZPOLNxcWh6Nh1kAs2kZIfCCzvuZIhJawnRNRzT/Gn7rEoIHF7BKvZ8xGUg+3YOtRz0n+Ek+KSiXAzbfYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 07:30:29 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 07:30:29 +0000
Date: Wed, 6 Nov 2024 15:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb:
 gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names',
 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <ZysbDXf6yMrhf3Sn@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA1PR11MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c24ab1-2de9-4a5c-c89e-08dcfe34e393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?99bK6k1fSoKr7047PIPQ6gXvBxRCVHE9a4VcYhO4fljBc4E8nXkUDeiBd3mw?=
 =?us-ascii?Q?FGXwcL0hDDFTx+nHeOKmIRv6Blp4h4djNIkVtv1ZQJ5jyBe62s2nr3WMLVBO?=
 =?us-ascii?Q?PP00Ls6f1AyhzlGlrjuscJPxc51sMYO8Tmn05lkHssmanX93uyi5bnluvNpM?=
 =?us-ascii?Q?KLDCBmPI6NuEsUzVIyBO/zQ+MGgwykGljrnKG2lKK8SyU2YDbve2r42aQZb+?=
 =?us-ascii?Q?71cKbOmiOY6fW7lInZl3s/Mp958Y+/1hJqMndVf8IOgAstm7MfyOhEVLdb0K?=
 =?us-ascii?Q?pFAombOpjXgFDW46XcAc0skPqx9Y546+0ubK7J6bSiEbOL+z/PL8tRpYZZEV?=
 =?us-ascii?Q?lgr2CmyRI8ng/yBBZirA60vvNpTbeZpc79acTCMK+sFHVLH1OtSoDUDWKjDT?=
 =?us-ascii?Q?JUPHtTQ4lFvbiVhLbvIIECI+IDsvYF83kABc1L7YMSMnIjJxEJ9dAlgCdfbI?=
 =?us-ascii?Q?Q8+Q+k79tHWgH6FSzfGzZy6IEzpdr2rkE+RT/JskZJYyP/XbbczRaxgGhcp5?=
 =?us-ascii?Q?uTb0eKnN2gvcwTCjfa+7X33w1wd4vVSQkZ2AR+9sqGlQajQ/qiRJMGazz7py?=
 =?us-ascii?Q?nDzgBtx9lmX1a2s9uGEERs6yDwF1wAVOpi09snhksbWDEqbVx/VuJaM0KUJ4?=
 =?us-ascii?Q?tS6f4Ad/17XOnur7XIMOBws1g5mgBy8E78ZvTVFUrRs4Rb3IHHxQexw5fICL?=
 =?us-ascii?Q?man/tSLrfbPe3AVEWo/POFz5qLxFHNlNd83YWCwQ7ZKoIUe+9GmlNPgflHwo?=
 =?us-ascii?Q?nPD8IMU2xj9GtKTPERADyRl72VA/Gqu7vhtqUHos0aLPSQcflA37ITDLWoQb?=
 =?us-ascii?Q?/PYwdz0JnyvpJeIrr2Yd5k2jrb1+67C1Xd0ehYHRFs/BbHkpXjM69znp88mq?=
 =?us-ascii?Q?pPQftimJwXaTMphlHL3tNExqRgjVeD/FnfjuspVHnoH6C1S+wGkSd/RtZ7bO?=
 =?us-ascii?Q?4N7Or+66OSy9xN1nnMGoIvoDJLfuo1ZgiDLri0doy/5DjFRXa8hUj5ETlsKW?=
 =?us-ascii?Q?D3Xg/YDQabmDXFi+5c/owKC1v5WB39nI2xpnMojAYNfOSap4eCQ/Ug4D7Nah?=
 =?us-ascii?Q?Qn8hO13eyg36c9kLgM9m+gsNqmrgS4CVXE7+nBeiSKlB96S9jro5nl3huHGg?=
 =?us-ascii?Q?RvHowDqccxoKNKMDQgJ68dLY8rsYwriVGX6caTNo8RVjsyGlm7OafWw3Vj8A?=
 =?us-ascii?Q?oZVM14Sw5sCS99imYnXLGw7Y5xuG9ZRrT6al3womdIMXRJwqaE6mSXyo1yLn?=
 =?us-ascii?Q?4CrU/CLDa/HYAzKN+3lEBf5GNTCtKBJjpxLKU+FBS+hXBJa2GXTcFArVVkRL?=
 =?us-ascii?Q?l7Ow05YI84JLQQ31eAF5b9kD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qAY8hmgCMhfvsPvABTS+LL2fYH1xIm1qXouC2SEz8f921ZCi4yxc/rRT4134?=
 =?us-ascii?Q?66Qu94iJPpKB1bdhWcm7o/A1PiQaROSb4CsK9KduWV6sWtPtsRaPp89lsWuE?=
 =?us-ascii?Q?mRe/D9Cy5WeKMfps409Mkjg4mFYEWJ3tTIEqpBh06VEJpFiXXnn8bUJ0oXLc?=
 =?us-ascii?Q?sbom4k/nIEGpTwKrTCcLi9ZVVo/BF0Omp6TI3tGb5HEpKbq9hQ+cesubML8g?=
 =?us-ascii?Q?k/3epGOeJuxL22708SgymZnMmv+SG13njlvvg7bIU2rzdsMGqB8rZHF26jlO?=
 =?us-ascii?Q?vcZz+P54hQICRFntsFarZGmM9/uyHG3BGjNTCA3vAP2wA93ouj0L3A8DJT5M?=
 =?us-ascii?Q?MxNd3Rt4NG/A9k5BNdHwwi+G/PimdbXqvA9t4xrfvFotpg//pS7+n0AHZ7AL?=
 =?us-ascii?Q?O7AoJ1SfBMgjrJB1UoHwpLQjRRtkkCTBheIKAt7YrgBawBB+e8TramLILkZs?=
 =?us-ascii?Q?Ls8Tzsys1+3UFwaG4z0etPRqCc6JVA9qtQpWjDHbg/pLBpss5jUf74KTwWuj?=
 =?us-ascii?Q?H/hA5SvlI9dV8y9T7iSCy2+rMn+ICIfttPRZ103CZ7UTQgwvguuPl3WVwj7+?=
 =?us-ascii?Q?gB9bVnsAsnerV2RVUPrGAURDF3W/03nS7OEAFkn8tUEuHPEYERojNH7nXmY6?=
 =?us-ascii?Q?18mv+Y5kyYcFw+a00ceAMG1DRFbbw+n4fbpOprQeDDRrXPkOO/ImsSHm+Y8V?=
 =?us-ascii?Q?zJpQZr8TfjCCZqA4bZvJ1tGY/7Zj5DzeEYpvpBPsCGswN3uc+AUUvizzQTAv?=
 =?us-ascii?Q?Z/HVMPWx8uaABoGBfjQtinXayNRGexOXw4YKJwtPJlRxa8PQpsPZO7t9adDA?=
 =?us-ascii?Q?M9jLzVMgMw7naMYX4UJW0V3vEeZ5tIUsCEDEtESNnv3wylNwjDyqLs4MZYwo?=
 =?us-ascii?Q?NkLrqnwSrYuyRX0PtD4DgUhrBsBrxw1uzPq3IBmsNqdAhoBKQEZ64aQ777Nu?=
 =?us-ascii?Q?7V80dtWjuqEFaRBug9a+D+5Fejz8FnZn4MAUwtBEuo2ywWG/Vr/87e6h7GA+?=
 =?us-ascii?Q?nfuPB07sAA31b0Ir6eLufQ+tN278wnPIqP9NYwmQpvd01nWXoDZIgZvp6o6K?=
 =?us-ascii?Q?C4CsB/X9C0tU99vMxEq2VjOBGeW5G3EThYC58qTiNPdivEyCrDOIEBeegqnj?=
 =?us-ascii?Q?r/PE1GJwuSkPLfZjDATZkpHu32d44bX+13pdTo/8bo6WuLlmWKvkrHpAQSXK?=
 =?us-ascii?Q?bgVu9iK2PbLh1BnsjBRSJAcrqyubOIiLjWUFWGfnJlTZX8MgAajle0e5/cFy?=
 =?us-ascii?Q?XtvLLDCB8CpdxlarsOODXy+8/jxcJCUuJb6dBPMVGAMXPqWATjXareD8K4Da?=
 =?us-ascii?Q?e6N/08q0IfdtIxR8X2L2DKuecWPjFXdetcu3ehBIZNiIxsqr+0MavS4e4kY9?=
 =?us-ascii?Q?/iZY0J0WH5ujyeYHBn1mosOWIoT5106rN/XR3aN6V6VtRQXfdGG3dMnEYsYV?=
 =?us-ascii?Q?Nk3w2WusinWxwta3Ho+O2w6LJhGXVyxSInry+Kc+PtHXV16xqkKlDipeQ12U?=
 =?us-ascii?Q?2Fjwvo1+f3KX3+mkD0wEanAE9OQkxsgXAERUFr4wHcX6+C6rW1vaynxWXqM2?=
 =?us-ascii?Q?IuSDakj/hWi3nOgiB6KTfTU+TK1UK8FDubSnt+/5I3d/NU+PyhrgLXGEggDF?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c24ab1-2de9-4a5c-c89e-08dcfe34e393
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 07:30:29.4637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11lL9G37pHQ9jMkYqpx7sG5X1pvLyBQRNZD7/pQcMzUv3K8VZF0cMu8vsECJGTjRsRx0gMcCJaNGAw0AKiULBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   cefa8bf9f032171eb1be08266aec68726ab8e8e5
commit: cf0657f4c63837090d22ee50cec185af40c6cfa8 [1/1] CHROMIUM: arm64: dts: mt8186: Add corsola-magneton board
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241106/202411060702.BLTeo5v7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060702.BLTeo5v7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411060702.BLTeo5v7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: gpu@13040000: sram-supply: False schema does not allow [[127]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: gpu@13040000: sram-supply: False schema does not allow [[127]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

