Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8E36FBF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 02:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730947795; cv=fail; b=WvfdVcczh+wKMDziJSNMDYYs/j+bymKTaR3BZgwyk8xTidNhVRONSTBATQNfouDAmAZ+7DgI5wOhmrvBBvP9xrExeeEyBGJ6XRoAkGie/FPWVuFe+dWSxIlvVyyCEDP6SOdb3BZJ8p7iG426vNyxMGBlr5KFfSOoQza6/Wr2dyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730947795; c=relaxed/simple;
	bh=XeVio/Ytf2ZnHu222yhCBBtZsN5pSXHz8lsUCHt6e58=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=c7qolJInyadlvoO5mOwga4o7wW06KevD0KSTPVsjZLWWkdk1cRmtG/Nn7STWAk9zpPJfOSb32xqqg8cH99VrDetS4ZCDqounk0SrPHdswrrT8xAZQMAddVIsKQ0TQ0TuNjAUWtziYZ9KhwCHt/IV0QtcBvXmxcpZtHiT3ST/V/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWuRacSG; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWuRacSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730947793; x=1762483793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XeVio/Ytf2ZnHu222yhCBBtZsN5pSXHz8lsUCHt6e58=;
  b=LWuRacSGOJjHczU42IsCka401/08FcDxqPblj+WgrfqXPorjLrcPb4yd
   Fb80VpLBK+KvthUxsR9OSh2s8+8lnAhdmd6D+n85KkQEkLOOLttlZHEZ6
   tDgJA0UeFvopEa3SeTQDCXhFajCOREmgOcs2/nhEJhA4sBaY3khDMu1RT
   +it2Ri4uWLn5t2d6pqQMxcfZ1cEUlsjIzakn+SDSuRHb0rqAluBpGra7u
   9tumaR4OgoCmiWm/jcS6NBhm94QZPQCOftQzP/RmzSOUPe828YRkyTdYp
   kN6inZnalq1TRLOn+95g4ec5qfoPYJ9uN+PfQQyVZRr6ZuofWbMsw9GdX
   g==;
X-CSE-ConnectionGUID: jE+ySH/EQBmKAZuurWKu0g==
X-CSE-MsgGUID: n6qSl5MxTESOlv+taLKTAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53329499"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53329499"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 18:49:53 -0800
X-CSE-ConnectionGUID: wsGHmW1cTZqNCD1nEMty+w==
X-CSE-MsgGUID: xxWNaVN+SZeVvKOgaASEPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="84433024"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Nov 2024 18:49:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 18:49:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 18:49:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 18:49:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOkx7N3z75Lr4KsGZi0DMC/viMfdMvY4o9rvW9Y349DzG7EQnaQQptOjVMn0if0PQZbeiMNa71KUzwmcIdjyMAu51UKMUn/+PnrWU1B6u6vOH+nJxBq1weBgwdz/nTzEUpmE2q3y8kAiH200lzCnII9GNBK407MTmhp0B/mbS2kps587ZHz/U/BV5B6i6AvTinAFTZK/sLeE0wxzIeMOdrecEPBvLfQepeIglRLp+WtywTsvVrxRZ0F+CRCamxFSjR/F2F1v07suv68hVk6/7jC7osSK3L9Tc/t3/BMLg5pJtvKOGcP6yezYYR/YVb/jaXq8o2f0560mPhcVtX4zYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO5FZPZVTm1p9XbRCEnKx9dV4rtJzPzT4SKH0nsViFc=;
 b=zAvvwQuV+gOIgJri0ldy0vHRR2A1vdX3LKZA9+RLsNQDRq10/gTBcx/Fseo+RRvPR5zX1x02QfpiqsA+1F5V30V6vTmmJnjAFY1In1h8aTGvXPNyg6MjCqfZEV+7F0Ovk30qOrCrnpSrUgYXLiPDWz1A1QcuXtBg3oOycldtEdZi59SaQKVGfqcd5WpsqxQAKJRulEswWM/qPoNCeDU6WYrwRIHb3PpYrVVZg0YbVDVSfAKWF0E3Xi1fZeIQIzlxWayZriqZVKPT9rLTDtUlma5SSPdHOmYBbDDdpOLfqhFTQLbDhJ9wN+AZNenNej1FpfJg/5OCmiIUrzITYyKH9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 02:49:49 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 02:49:49 +0000
Date: Thu, 7 Nov 2024 10:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb:
 gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names',
 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <ZywqxQFu6w/g4b73@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ2PR11MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9ced8c-54c6-4354-4cb9-08dcfed6d8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xq+9K6lz9Qt6/bTiPzZVJli/rBQnGf1vmXrEb2DyXt6JNe0nfoQr2NwU4QtO?=
 =?us-ascii?Q?ANrfikqmLUReF7as77DTiGVb+J7gCGASrwVQL2nidx1nAmeeFIR0ImuxAtwq?=
 =?us-ascii?Q?zlH/6/XGnsWP66GxEYFnIGHG0TdTm8JCHfDo5hoQt7CbLOe1JhHpvGmXJZnI?=
 =?us-ascii?Q?AjqDjbXkjPcVpRbeQIVcYqqRlvKhrKYlR5xto31VWVkqRBAkc9aHBAlJEhqX?=
 =?us-ascii?Q?L6oUaekTEzjNnC5QA5Zb/9P0a42vz2CXpLSQdieV0sQMw+59nm4pVIOeE3gH?=
 =?us-ascii?Q?CScuDhtm4RNAQIOKr37VtwmUnmr0HEdjcimxHBxNxRZmSj6ahwj190d5RRcT?=
 =?us-ascii?Q?FCKDg8wdYrYqS81kXWuNEXGmoP73x+QawDUUKIfxvJTqeWM4LW3XwYOHoJz2?=
 =?us-ascii?Q?GWn2J4gi5lnl1r1cpGjXp8AH3stFcoQbzyJtxizwEpVmt8o5+oRAeNW7wz4j?=
 =?us-ascii?Q?CRwvVXqH4yTW3NEkByj0AVuw6KX+VP2SG6DLs21fnYq23X0iEQ6wWb/QlKLe?=
 =?us-ascii?Q?PAE+FarQrz0q6GreeAiuiHrXDHzhebxRxMpW0asvQr3b9YrholzeTUI6IiiT?=
 =?us-ascii?Q?6sfa96RYEAzH4SYKjkz+rIG9g4eJ6qnnpTMN2uqjZiK3xcrcUaNBFSg2pXzS?=
 =?us-ascii?Q?dsXZLzpnQkMijSUujZAzd8/WvAWPODQqi9DScj4p1Atx+wnJvhVKs9gKzCf6?=
 =?us-ascii?Q?uQNfBxjaslbpX3Nlyd5hjhuuAnRO2X/UH2J3t0eQvE4VqGoWrMRmCF4y23to?=
 =?us-ascii?Q?Mqf131iXt+zWBoj+d0v7BkpCf1lJZmvpGXzQNc97LaDlAW4OFbGBvA28IzIg?=
 =?us-ascii?Q?i/TIcEgFO2WCRImfMlV0mSTTFvD6XUvMgseJe+RRU52sdUYFRyFkT/WT7Ib4?=
 =?us-ascii?Q?ez/5DOinjiMWhGP4bcGMIv05nBzhw9ykozNcJJGn4SjgFgv/V/5f2y6ZIZik?=
 =?us-ascii?Q?5+XtpzgVai3njw5S1L+k2SzbbukSvH84WHgq3vmWXZg9bwzBpVNxhC+hlUGm?=
 =?us-ascii?Q?Crb3zb5PYpRoneKrj75DOApRZvJOktB3Bqb8+51XosAudKOaVUVz9Yzm1x7/?=
 =?us-ascii?Q?mqF2q22wPbgF6ylgFjM7WIvnWNMgUqqEYutzYkBOiD3tdfm5iWX2bG1jH23L?=
 =?us-ascii?Q?zERe6H6YPNOF0hfH6eC9T1vQO7t8BPtu3wUR1cnE1QMd9lUog86Qox4ZPPzG?=
 =?us-ascii?Q?PvRM3LJsFXnwMhZOJ1pGOglcYLNlTKld58+ArSVjaqHGlSg6VyfUSlXShmy7?=
 =?us-ascii?Q?qFtbTnC3w006Y2c2p0/z1OUSYBlzmfIu780yRagEV3UmoZY0u9SyA6TMfPuJ?=
 =?us-ascii?Q?iTEQB9R7Hv9qxz0SV286QjlI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WZ4QdLKEM8fEK657EphnzQ1Plq/kbh00JDZoiV4LVjYHDZE9VKSZItXHiaxK?=
 =?us-ascii?Q?OWpFzq4eUuS6hv6gkexU5g+rsidepZmXrAaNkxPcZYeMqsvduNIs1MFrIY48?=
 =?us-ascii?Q?f9s+qioOgZ/tU1wl6MbdIt71DW2cAVQ4oqUrO3/jDC8DW/zfsG2rWMjOsY64?=
 =?us-ascii?Q?tLtK2V6G/4h8bxFJNTijIYCFtkWcg7q4KWSzBcPXCKpe1/TPzzw0Kxtbusk7?=
 =?us-ascii?Q?Py3quUzCuIVobva0nMCNr6dNV4ZKfYWMzSHpyEIf7hrjHiMrw3ed99uuM2Qz?=
 =?us-ascii?Q?lxEunJxR7JQzNeeXCKz6AQarzx9C/MHxAgBB/9OnMG4e8/BFuw4O1e1h1vC8?=
 =?us-ascii?Q?UnS8I2P9bmIiZrwo58SCqd5zVEmyZ/E+Ty1m6ymM51Pm5glqlUU/pljPw42V?=
 =?us-ascii?Q?bmBMdYz3djyYfW1ufQD8eO9BqDlWhZQMG67pKV5rHrPAacE93V/qSg+egkcz?=
 =?us-ascii?Q?FIBSPTROUwEhLpAE8Mv8xXME4q/MfvgVpu+Nt/dBiE2fTvgHdBuIMy38YAwu?=
 =?us-ascii?Q?7z/GY1LQ5HIZbdnJZAZwYMsdTcg3OkcrmfP//eKS920ZQKg8sxoSjoEfhWj6?=
 =?us-ascii?Q?LH4pA/jcKsKSv5NCm8YlBTZj2+ObaZMdQN0ql3AYA9uGaHjw/ho0Wjm6PJC0?=
 =?us-ascii?Q?Hvz9U1DzoRunF9RASvSTCnPFEQ7qHgxNdUwtPl6ZDT2AIKUMih28b6sujNQq?=
 =?us-ascii?Q?+lQnYpyfOclPfqceOJ6jaX8NadD2NHv4HhJZ5Ql8zssmszZ8geN5wdqpmjQO?=
 =?us-ascii?Q?vEG5v1SG5fqjkhAFeOot1WFC8wRXqC8Gg5D2FQoIDzGpFl3ZDBmL+jjz4Eth?=
 =?us-ascii?Q?3F4beF4cXd/avMsW9DC6ZnGB8r0ElSFw5uW8xuwbzXJBlVea/b9a6PpGK/j9?=
 =?us-ascii?Q?x605Bh6E9MckukD9vlIRbjQQ6v7q/sgFQ73n3c04/zR0I7Td0gCMCDfepyGw?=
 =?us-ascii?Q?jchMKAccJKgmQTIKVI/ctRsKYL9RLc0l9XER3FQpe31k/apgfisSb9Tn7Du8?=
 =?us-ascii?Q?Wv+k+zJNdCcTCW4tFQLrzPkYoNaogAxVq0KhlwISQopiiJFcIhTti3SMsSCd?=
 =?us-ascii?Q?nFG1ZJbDSaBX2lEvBhnKY1+mmU6LG2aBiy2jQh0hN4dnN+PX04ekFIEhIUVQ?=
 =?us-ascii?Q?Kj36guLNAMAssoa7bNhX6seD/nuY8ocYulVfyCDL2Dzy2YUEVvY1/NsLvmPP?=
 =?us-ascii?Q?OqX6YQw7v2+rR1MEUWGq6236jODxL9V7AbOZveu2yMZ9nEK4Ijw35PMKZ8Xy?=
 =?us-ascii?Q?S+X0Q63vPYKWi1kS7n5t6npojJkhsQmJNn3IdEmTTihlyvlDK7gGQA4nOsjB?=
 =?us-ascii?Q?6DFORPxo5oUiFRGjsOWak1u54VLtC7z4RqF3PxmNthHpbGl0+NsrJFfrTW4A?=
 =?us-ascii?Q?WkT74Y2YsFJR5AP8Bzv6yeHBC2CFF08YR/UWzq63xTA5GH7wLNlE3+o3O1tv?=
 =?us-ascii?Q?ECQNFfNmL++jyHCpj8BYlCojaHSMttPPJlh9T93qfvkkb9XW2/x54k0RzzYK?=
 =?us-ascii?Q?P8vvkrJU80oPGdIhKZVfA8SXerxUs7nqmINqE44RJH1EHvTmew3tJ0KfXYTe?=
 =?us-ascii?Q?RXmn/C+KcFOhQTS4iJM5NOfpOZUvjE3+X0zUKodgAQZ9HjA15+LIM9Bms8u0?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9ced8c-54c6-4354-4cb9-08dcfed6d8ab
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 02:49:49.5579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZJVw2sbBWXr4dj0c4Bqk+YEwiz+4XlObFpfugt8biabtKrK+jKd/nxiGtzT41Af3EtV3QTZLsx5wDtMz7r5HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   c9272c37b2b5aa8d04d7dcdb694b2caaf6b530ca
commit: c95fefb518d78c3a0852393e60d9163c4c54fdd2 [1/1] CHROMIUM: arm64: dts: mt8186: Optimize corsola-magneton dts
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241107/202411070530.kgA5EeIi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070530.kgA5EeIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411070530.kgA5EeIi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: gpu@13040000: sram-supply: False schema does not allow [[129]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

