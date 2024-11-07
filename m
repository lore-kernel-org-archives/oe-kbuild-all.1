Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367E41EE00C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 11:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977659; cv=fail; b=QTzm70m36xNxcekW2Hit7tK9ip8iCqmUduVeiUhvWb8kUecFuYhdbrMNXW7SaUIRg8aiecbUyjyEervQ3EW9FnN3iWYG+yOpQ34SCbYW9oKsCSxk69b+M8Qxpa5B9rf/LctBplc7rjqXXbMVZZkH5wTEB3WhWcUX+siNu0DTTRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977659; c=relaxed/simple;
	bh=z031jQaMvHnhcsoZMF5LBWBVNU/U6LY1ugiqz+NbWTY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RO6A8lOx78S6rN1yltWDj9mIHhy6wuIBfkB3Nde1gsxGeiTOAd4W5WVkX13DbPFEzLAf//6ZWcNPOjFGkyKrMBIUyr0etVpp0sTluerqLp5qHxeU3Ok4nY/PjtYzntJh5Hk2uJIIEn7t49ywjWSjNAaqPOMtrR4j7IO4LESSFwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOY7Hmv/; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOY7Hmv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730977657; x=1762513657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z031jQaMvHnhcsoZMF5LBWBVNU/U6LY1ugiqz+NbWTY=;
  b=KOY7Hmv/+1dQPlVd8T1LnBUyNQTAjbpnTwJDm9yZmEPvlfL7M7A43yRU
   pDLpx+1axQnbLmpP8lyromgww2yQYm8KA50RiEes0WQWLORQDlYkDB77Y
   HgUlQFKC7Rz9c5eU7qdxdRq517NTeNUbXS1b/EQroTScvpXFZtx0ketPE
   E7+vLRFs5Ahsgqx0th3dxMYzBmPCw76bWL2dF/bB2OVmEiqqz/nGi21JD
   byIfW2GO55JZ1SY/ZXqUZSHIOQzYDjITY2KhmYOdisnZvl9hROfcUh/6g
   HdNIwaaDPRy+54zmaBUV/p9it7AVNuwml87uBJdWXbhSDED21ovX2bKUY
   Q==;
X-CSE-ConnectionGUID: yKZJxYdARTGfDlDQZKuMKg==
X-CSE-MsgGUID: OjccdPMNT1iBTG5wUDKcog==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41919479"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41919479"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 03:07:36 -0800
X-CSE-ConnectionGUID: qWIbtkttQNiTYEpPWT2OpA==
X-CSE-MsgGUID: nxRhzE1NSHmfsf9/zEAcuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="89877766"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Nov 2024 03:07:36 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 03:07:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 03:07:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 03:07:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAGp5VCBV1N2W2pw3dRji1oZvyjdnJJBY0ppzM1rgpr6Z6hXXPHHMzneUPZJJ0f4OvtRDmAMr3/FO4pA+T8aBFhz2sIrvwvk/PjFRlriWKlaQnwYqmCDCxB2+rUZcLezHFYRug1663dl6l4qIIgINt1InQUPaa2apLkSpkjgdBOydHh3dkl/8SAr/LZefkja5+fcfHIZHtAuvcjiCEZ0YmkDYPs+upuRzNWSY+1OS5hTPUnz+wLGCZcL02Mam31C4Haf/ANEqGT74mMeeP/ATqFR27m57RyAD2jv0p+awDQ8TlffYHt7TMzAwrwWZEzr1lXgrzo9adwZ1kqcOk64hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEMRgylXJfzVglKrLwYeh2jh+679zyZn/pmaMKQlJLU=;
 b=QQJU89LKKB1m0sxhVjTChCyCBeMg1jFqI+evs36l9Uwx6n9Z+fVLTyVyMn8kQZoIoHNeTHGx+v7huYC5rNPousN3BXQ1DRJqkAMJbUrcEl3Gu+kulN7m4BzBQVEsf/SGXHjKocvBNL7/x2751wP5kwqv4PWYJxVblL0qG2fcBYeLaAnZP19SC94mDkVnNOEeMdi36Z0ARNzWWWs5l4+pEJVDxoy9miEIYLtuhIBvSxgW6Pjeue7lbEAoW3v/uYenwFc54jTHXHLfwwx8xEFfBqNJvMCGJ/j2w2KNZMAu6SIOyceDjfihMCt+N90HDmTCPdi5V0blC2PXK2fcMGob/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 11:07:27 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 11:07:27 +0000
Date: Thu, 7 Nov 2024 19:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-partner_predev 81/81]
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb:
 system-cache-controller@9200000: reg-names:4: 'llcc4_base' was expected
Message-ID: <ZyyfZRshTU9cSapN@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CH3PR11MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4fc7bb-cf29-4aa5-2f76-08dcff1c5d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MaKpWS/vw36T5UczQAkSFmt9XKtICD/G+FxBwRRocW83vH+yzrffJCIpdftB?=
 =?us-ascii?Q?xjkni+JMCIBqDC6PcDrf4Bj4UrM+AhrXhG73YEO+onir3r41eG62UXlrI2ni?=
 =?us-ascii?Q?NuTiDtZzlxBqn3VZGc/FXy3g+7qJDSDhxCX7HzYuz8lICIaHQj0ZOPkl/WzX?=
 =?us-ascii?Q?19Be55hazeM4SCpaJ4BYI7hXd30N4Tr0Zb9PkkoqY8E1kWvKL+9qTwFm4+lD?=
 =?us-ascii?Q?EJR7cnfMh/BOwzADYSACqIk8mrKdNPsQA3XNBB9uxoNrFhovMMuUgm0VCMoa?=
 =?us-ascii?Q?5DOS4hCt701cKkoAYAkank0/DHlzYgLwCH5xEDIwtRm7VLcW/dIhikw4rVZE?=
 =?us-ascii?Q?SPwisqQFvRfeUDe4iJF5reLFv9cklsPIXb7loQadN3NczeFb2jEWOUicDWK+?=
 =?us-ascii?Q?ta1uE8NdYWLkN+aA6uBguKB889E44zmh9NZNWn/1w/p6bB/9OOGa2UfjUBGM?=
 =?us-ascii?Q?LPNvWuR5SEGLBsB3OC5Rc7iz/qbgdIrdWux0lxaYlgUaKnOv+gQT9LN7W+OB?=
 =?us-ascii?Q?G1awfWYUsoXZv6ARz00An2VKwBWjgifCl31T+wjeWzuI59nrO9G+TKI+AT0X?=
 =?us-ascii?Q?aF56SpN0SfFImDoFMJxp8a2SE0oFXrKmzP2ibRp0eNR+IHjdgDEH/xCB38hn?=
 =?us-ascii?Q?uWLUdbIvk8kp119a+VQSFFhadPGqV1QCjt4Ma3EKKhOES4xu+L3gIiM+tXPH?=
 =?us-ascii?Q?BqR2uCAvv02B+WrRITDl++2cc5IO+OGLwu9+x9CScay4iRLzsFXceT9YSwy7?=
 =?us-ascii?Q?oKsjXLQYrU1prFWiDVWP5ogkFDfZ7P2cWNQwlYcD6WuwKznKTiPb1EVKe2Wx?=
 =?us-ascii?Q?SE6bBiWfVUD+Abt9t2W5SqWgHl/Rnk7rhqMx7n8kDqts8LgRhgDdwfkppbW+?=
 =?us-ascii?Q?+kA3L9RqxunFBC1a1Bwr4md2MOQu503Dx4Dbq6U9BZiCoozvwR3aGROiPIMV?=
 =?us-ascii?Q?zV6w1KQwo3W80yWy+afG76KDPydDw3jCK6vzlWVsHJuC8P71ASQhCzOzfbws?=
 =?us-ascii?Q?Pnm5omfcwrLYPUj7bIEp6dtmfsKdYShKz+iiE4utR3Sj+xvqGeIAMCIqZzV0?=
 =?us-ascii?Q?szPjrhlk/HhNvyiOafGpFCQIEnixw6iua2XB7dWoqxYmeJHJT3Qg4BZjMdhZ?=
 =?us-ascii?Q?e7ni7JHKz3VVxKMMB5yCjgefJEL0TS6Ow6zYhjH3EUTm367jq58W/8YcmsNP?=
 =?us-ascii?Q?tkPUKX4fpqW0AAY4ILzrFYGH1Nv6GpB5lf/bHfUV1rRAZbtz8DqeBx0CFGbM?=
 =?us-ascii?Q?lc1t0P4BN9u5KKjzgLlvvPgLeZhFhNM2y7QHyC3BeUAXZacpE2LIJVQ0a9FF?=
 =?us-ascii?Q?7WAWtJpFZY2NGJ5cY/HcCwM9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ufir6xAM8MAZ/WEn3cwdtj68KVEXLt4kil1cquwQu+/ZbsvNMPqhncSAY39L?=
 =?us-ascii?Q?xps4c4dNBlGtWlzfLpvbAHi2fgDttV24J8QkBtFbpi0wXwhQHBKKwufsYTLg?=
 =?us-ascii?Q?teq0oki5sIHnQruZc7kv+W4OaygO/MPg4LhFixqft8NjsJR0NQjRvabENdgm?=
 =?us-ascii?Q?8z4N9vtSZkOC1Ay1UbVZN/0RliJtOtQvWTzgj7HXwmgIJHvtW15gDAaBZ5On?=
 =?us-ascii?Q?STY5Tuza5aJkUYz0D1FK9Fn7LV0s/eeesbtVvrDDtePsct0qIcN9qGyr6KZj?=
 =?us-ascii?Q?rBtpWq7KWzfKimhSjV1H8I5ENhLbTVYR3cXQZz/HKDpLGBi/YTzovfx8VC7s?=
 =?us-ascii?Q?TdhG+woEHZe/MoLHhACfsAi2Djt75rB043IDd1elCIjhKyc6zt4UmGuNtoar?=
 =?us-ascii?Q?zc7l1Vb1QS1g9MQMbAVi6ww3daal92sGs1erelQfaWR2jyi1IKt9har5u0Un?=
 =?us-ascii?Q?Qps5uxf1IUPUk1rrihSXK3s01MIMOQHAR+ayfaeQAiUCB5x/K0V1+FP2wdGR?=
 =?us-ascii?Q?2URXFrb+YXu9UCwNYidWUiK4oACZNFfbzxr5enaP8RrqNYdIuFXYcz3qkfe/?=
 =?us-ascii?Q?ceTQX+bXbm1XNQ0w7oCfcrBMtBmetQqp6hWWQPER7WiCTXh+9kxaTW0MgRLy?=
 =?us-ascii?Q?JD9/RtO80A57jfzk+J7806t8WYmp0MXFrexmfzox3MYscF61i2owt8vDziFG?=
 =?us-ascii?Q?fQnPaITALsk94K1UPoWRucugV/AetOmajtn2QIfGQ45rZd96btakgG6N1A5l?=
 =?us-ascii?Q?0HvVwRvRtHSbpkDC4jrXiM3UmQO0Z4zW1fjJLju1eqqHSTZ2GZuWEQj/lway?=
 =?us-ascii?Q?oql+VYdtsM3R9V7ddI6niMpvvyXCaxki3sro5Z1E/b3pKkGBIgMgOUe76Ha8?=
 =?us-ascii?Q?Wfs0QPA66A+hvcTxmaJFMyg4/iZ5S+/Fprr6rcgRctLotIn2j9ZlmiVmvSKN?=
 =?us-ascii?Q?Httzj/TVtMF/+zoZdGH/yoGMN/4XsXHHnpcSQNExxyJjitDjDEfDb+BQE/vS?=
 =?us-ascii?Q?XIIfQWVT45ZDymE8y3Bm3hO46i64aGcTeoPKsxXT+xDIIbli0Xvv2hL6t7PK?=
 =?us-ascii?Q?hO2c0ExHu2Udryv4IRNQ9P/24vacE+JJNpuKlVuD/AYklv5/4kiscnd4us0B?=
 =?us-ascii?Q?Jhx2xVViRyUpYYID7k49GvLFxLJt6Yuc7xjfbro8gs5SGZ9sVcQ3xqEYGXis?=
 =?us-ascii?Q?SvO+gJOdQ+ejaHnzKA4JpRD3NaMmE6mgb5iKHMEPbsXWQcftO1suclL6aU1M?=
 =?us-ascii?Q?t9D+71wwq7bpfJRzwO0ROeplSsnCuw/LNRYbAtVYnGVfQ32A/+y74MMcZOeG?=
 =?us-ascii?Q?QpOSrvlwyB0ajUMfs1Z5OAuFKQAJU4OIsip6jG7jytUnpMNQ6LLMR11rEyov?=
 =?us-ascii?Q?eTa8QilJs2zZ8oT+m76ya+vrhecSxljFCC0D09GOVVqHPffsxqT//2TUVTg8?=
 =?us-ascii?Q?BNWpCA57nGI80cG0b4tOv23qda6dwlQnh1Styu6SV1iUKlIozoimmpUZCnem?=
 =?us-ascii?Q?/d3zd3ygGe5XDyt1eVKFMlIORbJyxQSQO+1gfX+WyTna4dbZLZm9rOxfwtqM?=
 =?us-ascii?Q?OC6g/Lkx4jQqbjjIdly/PTrCq81Uv4IgJ9QetovK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4fc7bb-cf29-4aa5-2f76-08dcff1c5d89
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 11:07:27.5961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7n65tgHMOiy8QNM7TYzEWgsM4LETsdBmuN6VSMbMK05KdzC6TFf/QZ20Ds7QGiJXCC6YDTRnSOUTCEtzqeEWkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   4f78c3d7bcf25a6712f168ec3e669c779412364f
commit: 74cf6675c35ec3034053a69926f4d98e52852eb0 [81/81] arm64: dts: qcom: sc8180x: Fix LLCC reg property
:::::: branch date: 8 days ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-051-20241031 (https://download.01.org/0day-ci/archive/20241107/202411071834.UJOmgPdh-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071834.UJOmgPdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411071834.UJOmgPdh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@88ee000: clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@88ee000: clock-names: ['aux', 'ref_clk_src', 'ref', 'com_aux'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: phy@88ee000: '#clock-cells', 'ports' do not match any of the regexes: '^dp-phy@[0-9a-f]+$', '^usb3-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb3-phy@88e9200: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000: reg: [[0, 153092096, 0, 327680], [0, 153616384, 0, 327680], [0, 154140672, 0, 327680], [0, 154664960, 0, 327680], [0, 157286400, 0, 327680]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000: reg-names:4: 'llcc4_base' was expected
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: system-cache-controller@9200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a6f8800: compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: usb@a8f8800: compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/usb@a8f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: dsi@ae94000: interrupts: [[4], [4]] is too long
--
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@88ee000: clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@88ee000: clock-names: ['aux', 'ref_clk_src', 'ref', 'com_aux'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: phy@88ee000: '#clock-cells', 'ports' do not match any of the regexes: '^dp-phy@[0-9a-f]+$', '^usb3-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb3-phy@88e9200: '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000: reg: [[0, 153092096, 0, 327680], [0, 153616384, 0, 327680], [0, 154140672, 0, 327680], [0, 154664960, 0, 327680], [0, 157286400, 0, 327680]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000: reg-names:4: 'llcc4_base' was expected
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: system-cache-controller@9200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a6f8800: compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/usb@a6f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: usb@a8f8800: compatible:0: 'qcom,sc8180x-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8280xp-dwc3', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/usb@a8f8800: failed to match any schema with compatible: ['qcom,sc8180x-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000: failed to match any schema with compatible: ['qcom,sc8180x-mdss']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: /soc@0/mdss@ae00000/mdp@ae01000: failed to match any schema with compatible: ['qcom,sc8180x-dpu']
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: dsi@ae94000: interrupts: [[4], [4]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

