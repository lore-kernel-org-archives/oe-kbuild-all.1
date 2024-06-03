Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64C610FA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 01:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717376774; cv=fail; b=iSFZ+u+vPR9OShqjK0GTmWorN7/MIx5meMjT01qLdVpYhVNNwHQuwDKNeNLwnPC7ivdZ1ckdj1vH4NLFlHp70tGiKYrU+H8C63Qob9UvIjl+fwEy7lVzWfX8LLSPiDdfrmK02AzYbZJIIk3tOcHk34lV4P50hiORmGK5pzoYreg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717376774; c=relaxed/simple;
	bh=58wPMmnXs3AKJQk8xhsc7sq61XB/csy1K3NMYBGBNYE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=SXskyvbsq8FCvuHtmEwhK+GHsSKnP+X7R+2pQr/ujlOKGZ31ppf+993p0sS6mf11b+ZRpf4swfINwCV4MCDJBQ8opOIqKPlSB1jlcCCOueCCOjOKu2xcyDWKAXaz5BRVMeXiXRNFsWxFbupJrEocvCCmAVGs5I3wVsRgKm4zf4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VckguQkU; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VckguQkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717376773; x=1748912773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=58wPMmnXs3AKJQk8xhsc7sq61XB/csy1K3NMYBGBNYE=;
  b=VckguQkU05Uq5WEjJTP0MrujRhwh3EB93IoG1piApTJ4S94ow2h0QO16
   X9NTVTWd6L/V2C3r+j/v/h4r4Y9zX0F0qo7s32cRCe4o1xguolWI7LI31
   buCnzLkt+YFouLNkjtPBbldf1TMHLqlts5ksGnDs5yjgUbFfs9gN409W3
   KRjUeAR5HxRiJse7Fi0quTG4sYZ+2jnVvFoF9cCbNZVz+nphR3XuVrTfr
   8+xd21Sick5rqCN9jdbLPHVh2gNYKRbfkM9NLBBhJlKjRrOUS6TKJ7LmO
   /JFgn2in5tNzfPJmN+C1+tBm4V0SE5rhXlo5MifKNAsqeBDZcwY02vzt0
   A==;
X-CSE-ConnectionGUID: 4/KoiQ9/TQKObg5qqKCc3w==
X-CSE-MsgGUID: 5/AiUimfR6O9g4NfvkdOtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="25260122"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="25260122"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 18:06:12 -0700
X-CSE-ConnectionGUID: uJCfvCoPRFW+hhWr8A7B4A==
X-CSE-MsgGUID: 6jhNq4LeTLWI1LnEJSb2pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="41643644"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jun 2024 18:06:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 2 Jun 2024 18:06:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 2 Jun 2024 18:06:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 2 Jun 2024 18:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmwyeFBeHYgKV4Utx1OO/UB7tfI8lze53mXx1dpm5mi72K3F27HRCEn+4FXdHiyd9Rz5vkKfMrPZZS+/a46msAM6sIZyJaEPBkxeW8b0rwwwHWWzzBIv3oTqZBO4qbnN/Q8jCYtyJ1JzItEWQzyAKumUAjxYuLKHgFbBV8L8R7AQ7bLWGD2wheK9Q7GmhN8zvCfT38uU+Bwy0vsHGAirCmJ5XDpUPC9qk3Ux0Sd0TpvTKxZySHpOPVgZe4pGR0brR1uQXd1Vv5NsDiMEkLyKmLQfUJe0ta18A0125taFuPv5/FmNZRnlsrMKkV9ZsrSzqqm6dYQYidNfNgyGUMwAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B8WsNDPI66H+PH5f6qehychoDwSaZIsgsFeXKN0Oho=;
 b=k/2l86XsZBHvXlmzUCePTw+bymBGr27/yhxkVWRAwvl1YLjsQ/tPa8T2VjH8Pd3a/QCEan2O9x8hhmKP0SdxJP/A8YG9fOwVMGutM/a7iZLcruVUcQwTUAgvuVLPTwwEghlyXt+a2NFzv4KlRB+olXQo20mQ216eNvxvGRW0mlAzkruEk9Xrc8qPE/mpnj8ZpIs/biSqcXXi+ZXSQOfZtU8eUpj5WFdwOvsVlOZ0d39VCAtOsqXQKiaFhSH1NsFMmgxuNn44SnYjLVzGTDXOICk7zl/iFg4EHTp9czbsTB+HrQg/S1CUoWf5uPJLQPbxGIzBeAdLyaiS4qaBQ6EEew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by PH7PR11MB8057.namprd11.prod.outlook.com (2603:10b6:510:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 01:06:09 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690%5]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:06:09 +0000
Date: Mon, 3 Jun 2024 09:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [omap-audio:peter/linux-next-wip 8/42] dtbs_check:
 Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error
 parsing file
Message-ID: <Zl0W+T56Tzpzo/ZJ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|PH7PR11MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: 930c5665-2cd0-4b67-e0e2-08dc83695a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5mXE2ePMuI4V9Vc1aoxL+WSMiL9FnaPXtiEVTTD6fh+785/XDVCRuFtjIbYV?=
 =?us-ascii?Q?Fuw2B/Z9EiTxcjjzdUj1x1o/g45hf2jo9OxlDqUCF3+p2oYMnc78VO7AbNUr?=
 =?us-ascii?Q?+0WwIe2hZjI1uqfUTx6Q8048DzgKcxCALRjrLctGxjHWGd4fNi70xj74xVgS?=
 =?us-ascii?Q?ksa3wsBHcEgO8kO+Euxhsalj9bVnC3f++V5ZE6nRq+IOTc4tUj9eoTpRACPN?=
 =?us-ascii?Q?XM/iLqDpyOsfVI9qi5u+AKpmiTx64THpRruURR0lKLnaoaTmPlaS1XPyWWDr?=
 =?us-ascii?Q?fWw/5lMXAJb3mIwJwCfn0NC9ONiixONU1Kroba4UbO++cV4eImNubOCe9kCe?=
 =?us-ascii?Q?qqDJ14z4Vj9x4DTA9CU+SYGvuq6xyb/2Kd7X0AaQ7j7yU7KSHh47LxIN76p0?=
 =?us-ascii?Q?+rin/RVcALqRa6nyZ/w8tOgkiV0dNsdAEnXPO7heze5+bgo+NC7L44OaLXGS?=
 =?us-ascii?Q?G1vK6vtJWUipud6VHWUmE733o8h1Ft+aLyhXBsNMIVGCvrdk2e3sVDNBS5UW?=
 =?us-ascii?Q?IoLkl1Iq201cqYVG7Dp1uJrClSEqncKZ4fgf7eh9zTPNrfJl8obJoXxuVurT?=
 =?us-ascii?Q?fc5DqKKisbz6NvCRBX5zxzHyMhorvwECKmtdFVO3bjB3Bc4l7bksYr0cNFHi?=
 =?us-ascii?Q?taLwsncNFeOuV9Vhcm6SjzHVhGekaAAKpouISfCZSF/OFj/qy+qSnWTnUSdu?=
 =?us-ascii?Q?vlx5L4V01ulDFbtFvbAUQr67MldiC5Xj6sLNlbQ3j9PnV7gORrosZk1ZNnHb?=
 =?us-ascii?Q?+5IHuEuekPbkdc3TCOIeT+x1Ccnz1cdk0Zj8GCfQQRvRa4WqQcrIFW7R38sN?=
 =?us-ascii?Q?0PgdqGFh3CilaIRh7RS5LiANyJ2YOYyBhDKDCrSfovQms4slk9ad044AEPez?=
 =?us-ascii?Q?e9f9AHPemCDFLbfVQJnR7tu1n21x7zfhuVUS12BqN7u47Qg+exm0GGms/qyo?=
 =?us-ascii?Q?dAUCi6CoR6N5Va20y7y0Ri/gltnE14QWl3mCz+/Z2Y4HqhFFBBONhBoiVfqW?=
 =?us-ascii?Q?t7bVSYYgYHtkhwRqioOes5YstXNdHHt8/V1GsSM4F8kJ3mNrhevWflcZzn+e?=
 =?us-ascii?Q?jB7WxcaiAZO2oGR3zFsC7Lwhe6OYkoQsxSJKPUKwhWd1UPVp2JBTHUiBLorV?=
 =?us-ascii?Q?Yh0ObdonhXKUICST7x7hm4zyZ6woqFlcjx9uQP5ph1JABZK9tAndiJj/FBs1?=
 =?us-ascii?Q?0w1z1iBcDPK/+7Qv+YVcNZrZYO7f75XcIhBUvUQq1CF0Hl9MvMrKf1uVfF4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kCB+OfI6bJjabnV59mwMEciNyWZZ193iGjjT9mAtwfeFTcOrf2INe6fDNgMg?=
 =?us-ascii?Q?gwzGCZQvIBRU2zwEEh8BAtYBBTgLcCzLYknsjnHV4i3a/xOQHWyNG81XeZGX?=
 =?us-ascii?Q?ptB9vO9ZL094+NuqEar4d0zxGyumjd6Et6s9PLVsIpH4MmDd2xggO/6AI6WE?=
 =?us-ascii?Q?47j2p7Ow/JbpKzAXa2tfLpeyn+C2SzOqLlWCWNbRvBtuB5dyxrz5PL4Vqizf?=
 =?us-ascii?Q?3I2U9JOo58moF1IVoMdkKkDDoAK2dTc5h6qpaEFU+NMNM6YazQEsYToKoTi6?=
 =?us-ascii?Q?q0SOatnBVcAca+UhaquLWRsWQXS+Le6rx7jicOsaO8q+jVjz4lYmO3ba9IWZ?=
 =?us-ascii?Q?iA+v96vw93WM8/WkyGn+jX2BeLuteN+rGj6F/n21uleJk/Ok7BrImi+DjDKS?=
 =?us-ascii?Q?1jZVFrpvqBxp7VcTDqxjEepn5SZnNdfRfIQJBTx6/jbA4eCi4WfYZ1vrkZii?=
 =?us-ascii?Q?9U++rIh1MMO5n+5k5Y1i1NbkQCsEx9Dp8EWCASba8/gepk9zuQfYMViPpQkf?=
 =?us-ascii?Q?ZjNRwsWhJiu16JBetmzkCGp+3buAMuUUEjz6kJoPw41F3CgfReDyk/fxfjRL?=
 =?us-ascii?Q?oBtfIeB5CYuDjd20hFPt77GIdEQmwyaYrnjnu2PzzHDNfUqazl3RWApxwPyK?=
 =?us-ascii?Q?uDse3MpuSoTajsYg2ByxuKT/odHkAQLaJfH8aG6uKwZchpH2xFnYG93TkCm6?=
 =?us-ascii?Q?UQ36GwmLy6DXvRPsWq8dpzIoueXkfkWIsZhS9GdYrd1sCMvkZzyoO9W/CzPD?=
 =?us-ascii?Q?yMWli4QLG76XYLur/+bXol6L2jYinzXmAMGfVZ7CNCf/forAUgEBhv8TJtZg?=
 =?us-ascii?Q?COuctkfDL/94fvbcgBfikFLgiDI5x8EolrjhT8ggAvPyRirtcRk/AdCFw/qn?=
 =?us-ascii?Q?LraTswHRPTCmpfOYgDAisRerQgIDyBesxEPQaEV62s/LA+BqnnF+3f9UdIxR?=
 =?us-ascii?Q?6r49n30vLyM9A2Ug2/OZMtKfHquQ1qcvdQ0kR68trBjxEKS6C5JAlRyOpVq4?=
 =?us-ascii?Q?/OxJgW+WtYDQsQoae53jiXudxHwUkouukwQsdU4jzSG7T5zgFzQjIl/vK3gc?=
 =?us-ascii?Q?jzWobTpZaTunqyFz4lr4rAgInZI6AzXTCbGHrkMu42zHCR1AwDJAaU+N/D1H?=
 =?us-ascii?Q?yH+qwIiSfOfg/WAluMCkvIEvkFjn+uCByGZBXig4XRfQtwahzIzbOGp286VW?=
 =?us-ascii?Q?pnGKt6Vi0mNqUs7CmmUp4oP0sS83CLuLWA4gbRTtlN+5xee9Fn1CHLYcDWm5?=
 =?us-ascii?Q?1qtLcSzGWNKWWLqbueIk5k1T7UC3N3PkJBg7H94d3TR/DXLvo5OLh3laLFru?=
 =?us-ascii?Q?erH7ZQP9tCL6eVbNZxNFlPSz+9OaRIFPs19jJgrVrJNHSRX9dXddXC6gk/OX?=
 =?us-ascii?Q?Bz2Xah5TwMGuS1ezFCFZNpim+WZ+HTLcs8zIf/NhuQIiaqSWZ6O2n91paPNX?=
 =?us-ascii?Q?vqXGXn6RhBVuMbOsbTqQY5uNu0CSDBGyJYFZhGLonkbqGKRvrRZkbhTLwkq3?=
 =?us-ascii?Q?8sSHqbmSmuTuJNbcd9c5EODfM3/3bxrGVygXkXUoGQkyfOW9Ztsex42Rxqmb?=
 =?us-ascii?Q?aoxD5WbRflSDpjDOebS3OkTWT49AJoAN5rupgiUI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 930c5665-2cd0-4b67-e0e2-08dc83695a33
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:06:08.9433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30KSxlljRTQvsnfgIDTePMYdA6ryyjU23i9M9hlarz51UdU4WDyrk8MOpmxzvcsarxJtRGehIh/DZMy5pSpWfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8057
X-OriginatorOrg: intel.com

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   b34596fe79684f3e27fd8479ff54d83adfd18d56
commit: dd51370bbcb3d3bb85164c12dc4956804696a444 [8/42] ASoC: simple-card: Support for selecting system clocks by ID
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.5.dev4+ga5bbb3e
reproduce: (https://download.01.org/0day-ci/archive/20240601/202406011430.N0BkuKDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406011430.N0BkuKDj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error parsing file
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml: system-clock-frequency: missing type definition
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml: system-clock-direction-out: missing type definition
>> Documentation/devicetree/bindings/sound/audio-graph-port.yaml: system-clock-fixed: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

