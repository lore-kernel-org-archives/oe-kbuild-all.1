Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80581870
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 04:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722399408; cv=fail; b=YoK+n90c4Fp2/p7ZNsAjoCX3G3odawPK3UjvWF4LottVXRlIJX3AHa+7NMd+c7rtzCLkCDP2W9wMsXzcK37ZZWtXWZdPaRzTs1JGpA3rO+5GyPuwvgcCUSeKK3wLXWEzio1iyzOjzrtibig7EV0wDBjIwl7nNHGWY+YlFZf7k/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722399408; c=relaxed/simple;
	bh=pgjvKMvdDHZJ/Aul744Fzv9gqwH4KRw/gdaEH6jLH+g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tJIjPbyEexKzE56nYIG0yq1payH9zhoG2SvGYIKaH2oQXYfIXHICibAuBY8/syjlkfxw+O+/ZQ0kMyx1MDMEe71fhQj04Z44iL+8wsyC/r/UJ20W8fQnK9JVe5KTj+n2UIBvEEqVQe3JrPQxOCDLUWwk+ijfFQex0ODaQxmlW+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E34ZAaG1; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E34ZAaG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722399407; x=1753935407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pgjvKMvdDHZJ/Aul744Fzv9gqwH4KRw/gdaEH6jLH+g=;
  b=E34ZAaG1AuqspNtn9SIrxAiMAJz/6us+WdFNL0n6CrcsmjWpCPb2gpwV
   vTybRR9HCzOqmfrKP+UuT4I04Bj6aHFmMZbR5KYt2o1RgdU5QWYBkfbVp
   q6y+l5psYIdZf9MGEFKN23k+d5PNP41I8RpipKI/qckBYfq2R4WnwotFL
   2iI3WbuWXBSgomHV5ROwKSrtv3gj4xQ3SevSGmvF+HYGEJIj0+WKLrdZy
   IDY/ffkD3dDQOQtsRBIMZ3+lgLOx1/M5wdk2ubmZt5NkDuSyeL06fdIBc
   ju/NqfBzqIzekuMiUMTBsLlHP8Gm+cbLOH9kYp+GFZc/YIlA+u5jpX4SM
   w==;
X-CSE-ConnectionGUID: 0ull/rGTSaGMX3YSQPVEnw==
X-CSE-MsgGUID: jYNaeEKBSWa0wWYKy5iXLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37725741"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="37725741"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 21:16:46 -0700
X-CSE-ConnectionGUID: TMvT6sWITx2YWErtqjYwmw==
X-CSE-MsgGUID: vZpfp9dpTXKLvbNDIwSPOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="54474409"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jul 2024 21:16:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 21:16:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 21:16:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 21:16:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 21:16:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtAkhg45DSdhUej29buHb6F60mWqR942/t7jgMcAa89dx2+na8ZWiBP/U+SRG8A60rBn0QhKt6bJ8BnnSAgVXKV1Vl6ODAZni2EoZL0WZvPGRo5wEdKZ68aEWbPr/8ksYHlU5KVpejwZdZLiVVf1mwtnfdEl/xa7vDzdh5VtVyJTgFn1InsxWFlRlRNKQ4YpCQqlJTi8SZGhO1MVwTe54QGTKqr5zujxqfSqG+oT2CeckMJrOP2nkFWSrZKZQr/uJXol3JHzXkjBYRoZ3U3udH8q08s3fAqAHwHpv0eUfxvDuTx5NQ+lLd2l22VZ8a8fhWXgCC7YdJtxy5RYCB86gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFLA+Lmyhc9F3p6sfCoIIFT4T/JRfC83uyF0YOFvHh8=;
 b=pLTmOGKysJHsD6id6efGIzVZtwD/IcO291PBfQ2/E7Q4JyMk0pB1rInyYvfC5kzI8yK68LcGDI7vfxwjgaEtvD3QEkw49wk3+lvDzeVuew652+k7N9nQInV8R8kUBxbBmpVKI8HnAY7fx2jAgf4Rz6nyDRu7OxDHj73knR5QHF8QQJQk1gBO3ehQ9JXgVTZRt9PWz4eGh0x2qRkUOZosIhvMALBKz5e+pdqu0VMMH2+03HnczZCTgmojFNzuBGuC+REWW9KRLJRqMUa9xS1biE/tje6rUjwkAeW4qu4Wf/Zj+6EjcBv7Bm+wRknxZMF6wP5aDdKM91hU0FI6rmuAZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 04:16:42 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 04:16:42 +0000
Date: Wed, 31 Jul 2024 12:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [frank-w-bpi-r2-4.14:6.9-main 37/58]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000:
 compatible:0: 'mediatek,mt7988-xhci' is not one of ['mediatek,mt2701-xhci',
 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci',
 'mediatek,mt7629-xhci', 'mediatek,m...
Message-ID: <Zqm6oQvTso4tumUu@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW4PR11MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 5348d65f-7060-4096-ffb2-08dcb11794cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ADGMghGj3gAPVvZ5dH/1Q+jMbecNYZxmgpXYhOyi4KFV4iY9932ujxHHb5IQ?=
 =?us-ascii?Q?nmURFmvPawVAfNIgnGAvQknSL90oiVVC4mvjsIddd6nmEYfa3pOrvKRA91cm?=
 =?us-ascii?Q?ATIFMSM0BrzEUs0zgj+ZB7+bfTZ3LhsozkkGe1n8OWCBMytbQq8FXNYJ1P0W?=
 =?us-ascii?Q?qrBMvICKtLI36EETocdIJAOJwDPFG8B9Q2j5loHk29QXgiNPXzdHsA2HgdBG?=
 =?us-ascii?Q?n9UjuAvz5LoJy3bS0ZqHYoBOLvcoLo/KykFZdMnSTNM4M3NM/AoR+k3VeYsu?=
 =?us-ascii?Q?dxleAoYibI6i1RNmyD/YyRSOA9MqU8MkrDbLB6nD41XEbacM+xj448ekmZb7?=
 =?us-ascii?Q?YCFODDuPIH3JqCrRCfNRTGIFolXixFjOsyv7wZwvwlGUvQ/mwupV5Zml+8BZ?=
 =?us-ascii?Q?Oxhbvf2fngRm0pI3cekclVdATBasgQDEvXEsWrUDVyyyNxtazpPyvAKyU+4R?=
 =?us-ascii?Q?zLdgNKs1FehVnjiy/rgmpljC5HpYBC5kV/3i3krknhzntdzWEcwODkYwXuXb?=
 =?us-ascii?Q?UgJdpIn3tlECPK9xkW3LuWfR1GIAt6OdaAxSmBWlaKd0vFihGJk6oYHAi5y4?=
 =?us-ascii?Q?DZF+vbmFFSGRZE1V703CymejE9YQG1+At+z9CEK2+fSoUlBEgpeWCEbXhRQY?=
 =?us-ascii?Q?+yq8j89LbWF3coswu1m1ZBOpDOzhdVLtskn80ryY3J4S3675qcs4I0aGk2yc?=
 =?us-ascii?Q?WxQg/zvxc2AcMwSnkKMD2JH+hTVpXnatpuSlxJFjkIDBsdFxL/D6Lwm1rUKe?=
 =?us-ascii?Q?zz7UQN17lp+OjElJO/+UN2zT3EbMeFvoYySbed0F6NmcjqXQioSlsh3NKXII?=
 =?us-ascii?Q?h4Aj+SBR5wVdI8y5ORA2ZnxzmKCjgLhzyL7WVx4VQPDyts61WucwWxSgp3vE?=
 =?us-ascii?Q?uA49l5e6ZLHOhvUbViz7b7AM0Ufu6atuWOF0+0YdiasoaIG63iBL/z+slwAO?=
 =?us-ascii?Q?J4DqhL1qqjrmmd2rBLXKgwIph7rt5s7adqGDF5KY/nTr99HRDegT5cL9MIDt?=
 =?us-ascii?Q?FlAOAKPxz4WICBPOKH6mQdcv5AoMblBPjZ2jo2tPjYG66qWlIo+TK1OwnRT1?=
 =?us-ascii?Q?DEd0XSaeLl4BIiOaG3VYlTqwYHe9RSWDnRafI/7hpiiWxF9RafatBL+L4FFH?=
 =?us-ascii?Q?nfzghnV8PLLRdlaJDJclUBgNhJcB+YADfNwa5iHvZhqn3AoaZAv1e9Lh2EES?=
 =?us-ascii?Q?uEd+eN46SrjK/f/KS6O5POXx3+oVUERrNyIG11E2kt9yE1FoDIGjfhCPk3TW?=
 =?us-ascii?Q?UZSt487Q+mtwVeWKs62O6E0D/Iy+Kpm9eQYEx+15D4m/2SEBTvG45+rLClJn?=
 =?us-ascii?Q?okxMtX6O7fmwnzpYVYAv8C/FkqEKbcbngiwPosMiIpjm/7zC7C51PjD0X3YS?=
 =?us-ascii?Q?V2Ae2EM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IXtR8ps423pq4gmYbkapeEkCNPZJmuUNVRq51GzoaIYecFcO1wrcqxQzlYPn?=
 =?us-ascii?Q?otWGhxvDQ304Np49GX9b8YQirsvDNiS/Vg1bZFgvwcznZDgXelwj4yiBknPl?=
 =?us-ascii?Q?X7FOIFu/TrbnqurrHxrr1xfTglXgaV+aNROds8VE8Ekk/YjWnUv3PDDgApiC?=
 =?us-ascii?Q?yHHmwituLc62oJHcbyGRfBcW7BPLWQTYk0H4o4oV2t9TcEREiVK5mxbRnPzq?=
 =?us-ascii?Q?9uxLFcLdzkDxDtz08McWjKhEpg12JHZpWOVvjYXjCq6Y2GEPTo6yXMeeXYGZ?=
 =?us-ascii?Q?4xDzSUAeVhQCK6YYy5rTgeNNkj38yYTFKB2/UqJeCuXNOkKAE6tt6yCULUoG?=
 =?us-ascii?Q?4WuOu9dymo3+YWsVXKKYjZjQUH6SjR6xib92GPgGpxY/lrpEtelAWv6BU9T2?=
 =?us-ascii?Q?+hIYsTth3rUUHCmGXYgrnMta3Z4vSiMRi29ZEaWNQAE+Sr1Q7fdDFAGNiAK/?=
 =?us-ascii?Q?8+7rEPxteCBaGcloSp0V7Js2Ehn7TZ0H/VbY5phlSGsLmhAavPXZ76yrD2Mo?=
 =?us-ascii?Q?WqsAOhuGR6t3xedCZ/XXIeesOCWOEz8l2OL1+1zxRgXhuIab65B05BRsT2mh?=
 =?us-ascii?Q?97jO4yeVD68r5CnlyMUJlqOv+quJRj6YD+PbDyjd8XzvmARy+z0DftD18sTH?=
 =?us-ascii?Q?L3t+YR/jh/vYDWDCcEID2IbnUQOqSU/+u1zYwjS/OVM+3pUVjyFp3wKd45Du?=
 =?us-ascii?Q?IKbdR4PmJz3/Bb9THGAXVaGQO5XYbTeMZVoqtxyxmzgW0BYenctXpf2GOyPH?=
 =?us-ascii?Q?Z26+xnOcfhzQvBHsVfI9AlC/aPN8PONFHhZO+w2osZnh0dBPUvBWwrJG1R9O?=
 =?us-ascii?Q?WwclHNDL4Nc1CtcUKERrWa63z+eto3BCRCaNf/pIkzrP/PFzEDiiSJRsEVni?=
 =?us-ascii?Q?MQibo/sDy4NOO8aYLbxJmQPeKuD4xs7ncHNMRMlVXfcZdsh17GK+gbOJihw8?=
 =?us-ascii?Q?w2QwtzZ3hOIQKG/Dg6JIrDEkEIzHVcVHxjn9I+csFyIygE95YRxUaP18lprb?=
 =?us-ascii?Q?0JUmZNKmlrI+EeBLpNsarllHcvvAmAD5HmGOetPgKriRyDV0ymOO4kEXmI0I?=
 =?us-ascii?Q?CgA1IRXq0r6DCdjrT8jwTgB4bVKzHuz4y3C0Mr2ADYSIEqfv7LaILS3TuO+q?=
 =?us-ascii?Q?3AeVM8HZKMAAzWg6b/SYEjSqqjZ4D4yBGYQkc2zeIWBmfIrcWPsQlnv/Sby/?=
 =?us-ascii?Q?AXVdd0GT2NgB1YkKLtAhda9PR0eiSedKZ89xtno9QW9pm7sKmFWT3O9/HMtC?=
 =?us-ascii?Q?Z/K4A0s6mnng4soeTsfiCDo+givTwU8t95c9i3ffa5pbjGymDfBF0ely792V?=
 =?us-ascii?Q?tWENKTWpM9s8bPHksxFvp5xaUyqGalhk5sJHx9Ing1mbUr83PS4LkXSaiACm?=
 =?us-ascii?Q?D3FaiOfz4JGxsecJXcpFprpRIzI3RisDABHrpI01nhNeydwXM4OtajEP53ml?=
 =?us-ascii?Q?9EleF91XNo1hcYqVrbDpPgQru0+/lS+lWwdcSc27OVMgPC2jTp6OWgu8F2Dh?=
 =?us-ascii?Q?YIIQeyZR1v9k1hzVwtv7Y/wenJq2+uOyklktZN+YU2SuZWgC7vuPmViyloym?=
 =?us-ascii?Q?Qo8oRfCuY+96DMeFVkBs5pN+GYDou5sN4g1s0Dug?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5348d65f-7060-4096-ffb2-08dcb11794cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 04:16:41.9946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiFsxf4ZrObvg1d4cO0jEih/MMPZ+jeFvpAllHPZ5xTGOFOl3yhGDgAKsMmgACVau5m9aed4FPZ/6BoPjJ7nRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
X-OriginatorOrg: intel.com

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-main
head:   959c1ad797a5a85d12c6f551250af0a137f9f248
commit: d7acb897a81fb93e2c143d15e356a4ef82148c68 [37/58] dts: arm64: mediatek: add MT7988A reference board device tree
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240730 (https://download.01.org/0day-ci/archive/20240731/202407310103.nj1yCQwI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310103.nj1yCQwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407310103.nj1yCQwI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi@11009000: clock-names:3: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11009000: failed to match any schema with compatible: ['mediatek,ipm-spi-quad', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: compatible:0: 'mediatek,mt7988-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: usb@11190000: #address-cells: 1 was expected
--
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: spi@11009000: clock-names:3: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/spi@11009000: failed to match any schema with compatible: ['mediatek,ipm-spi-quad', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: compatible:0: 'mediatek,mt7988-xhci' is not one of ['mediatek,mt2701-xhci', 'mediatek,mt2712-xhci', 'mediatek,mt7622-xhci', 'mediatek,mt7623-xhci', 'mediatek,mt7629-xhci', 'mediatek,mt7986-xhci', 'mediatek,mt8173-xhci', 'mediatek,mt8183-xhci', 'mediatek,mt8186-xhci', 'mediatek,mt8188-xhci', 'mediatek,mt8192-xhci', 'mediatek,mt8195-xhci', 'mediatek,mt8365-xhci']
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: #address-cells: 1 was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

