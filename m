Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C328469D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730731906; cv=fail; b=ZBSjSBkyv4w0W2THh7k/hbRkdZIb5u6PfPAtI5kDHLRkn6Do/WKDIyq8PXd8MHaezuM82uFChJS3Em1YLMM/ebOdzgUZnFx/rJuLvc36Rhash6uF+Lmn9f5sIorkT0cReuWK1jnim+6wgXZzxgndKpz8TxjMNTg3CYQpV/2DDcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730731906; c=relaxed/simple;
	bh=XbVD1+dwgieqMKmllxo7edmDaBGUkROWxhN+s8t6kUI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=iHV5LoACMcdVTTWrz436O5o//id+kb2Vk4nmEa3hM4K+TIflPpVs/GFDFbYULsulkgb7YbWSpzI5ltLDi1CStdvQZBm2YW0L0a30p0B/bfQjZEXLttyFL2HZXH43rs22kl7t+RXMFKPtcTKPP2ASvgN+xhv7bCsDwRU1OInsyoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYqBhP/l; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYqBhP/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730731905; x=1762267905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XbVD1+dwgieqMKmllxo7edmDaBGUkROWxhN+s8t6kUI=;
  b=dYqBhP/lmMHfHeX0yugep3iMOEhiaGkVB+1WgkiRrIQGxRvExqKoTLDs
   gQ4NSH4ZkcQ3S2ddnxbCpIVIC+Ed4VLUOGl8MCcJMUEQu3AhSEVK274iP
   GyG0Gl+fUFwulkZckBjUt+nlY7AhgKb1k2nMnm8HLA2Af2siRyYJXqsSh
   c0RJPUaY3VJiNgoGNqeN/kO4U2TMTwew788GZpzmuE8MrAajqJcRNENv4
   CMscD40UGiwZ/sIuORsL09KYlWevYAXR5lnGjt+Jm2dxmFrg5lJ4rTShW
   uLgrkbL81N8gHr/4sP1xSf7krm7fjfeFESiaZnp/ePPUnWjGJYquLplM/
   Q==;
X-CSE-ConnectionGUID: Z7NYe48NRm+CBvCUU/BDhQ==
X-CSE-MsgGUID: 8uNChRXXQE+4B76oX6ivNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55832714"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="55832714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:51:44 -0800
X-CSE-ConnectionGUID: /Yyt5BcDSZWAlBLV2xxMwQ==
X-CSE-MsgGUID: a30urobaSVq+9W34+fSa+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83357200"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Nov 2024 06:51:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 06:51:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 06:51:43 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 06:51:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHiayor0fQ5DM2/EFqlVRHtj5ko+CNjMrzlEXCHZvMQkvXAmyUawa8+lC18A0iYa5wGxDo4BCo2WYlubJ7xiNWEjLH07nKDe8g5bWEH0urVL1G3k0Yo5UiKtHg04q97hiBKYHRWVgoCKHhDM7+g3oN5+aFjEuYTfBdMIXeudjjEPOetoxb68CVs0gXwhHF+KPZjOmBtLbwTLOiInKa8CasU6vS+2MLk1oFz6EyPrAwgrK0hOP7Oas8sQm3mz9HY7oOArYOe5CFAhDdig/YLpQTLNpPRErpSTKvFm+NPtwsSeQUySWn3Cb2VILOAedq4v3eUj26hquKaAZLxn3hKTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRIsMSW+Jj/Pzgmjt3Ou6MiaQ3sSjNtCIRjJ1HV3A3o=;
 b=r3Y1DJpY/JuCymSgoWiOvuOehyaJUzIVFQ6Y8HrbwR+5bQxykOmVlp9pXMndc4lA9kWUPLWfeDL8LrEp1+fZc4ciqojKAu8fZ0U2FkUosw8UEBGGiMogPPZNTbeTePs70KUH+qMlwMXCNaoyyX5Z6Mk1VjH9puPBx7sHe+X83vsP3MrAyBMua5bv32Ik37vFlZyHCzZRf+tIXHYdxbiOjhQPs2B+qoHB5Mqtr/0Y0HNb8QHkvVvfK3T/zJYG/JPjGj9sd2bbD6i7in1G7cneR1mx4RFihjPEFvrshxQbJzwuDotCQGqcprLk9p0vYu2bqOU/HsH47lAOSq/pGWbqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 14:51:39 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:51:39 +0000
Date: Mon, 4 Nov 2024 22:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <ZyjfczX1vky9PR8F@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ1PR11MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: ef36196e-e603-4978-8214-08dcfce03026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NP0iE6kXDJx6AGgwrJp57h5V+LmHGma3zSX1jjX3H7XCM4umj5EMhHtd40yZ?=
 =?us-ascii?Q?T/5tsXdW5WQLCBVEE2YZ40Tbi5+5nmJx0cgw1RL/nPIJ/QsbcUyFDIng7qVI?=
 =?us-ascii?Q?oDvb4OYL69EkW0/dZZ4TihEIhRGR+ulWiodA3JX7QNXAAeC7gfy91WT0Y6rT?=
 =?us-ascii?Q?3tcp02a746SDug36HPlXxK5/yVhxb7YbYzok5D5iydy2SewiELVVcu660Ole?=
 =?us-ascii?Q?35Ums/Ly98o6b006YVYGS0I6rkp6/ekSDvnN8Ql2F7GMO4Aqv8gXhHgvlKEa?=
 =?us-ascii?Q?y/esNBKmbfas/+o08Orlv5p/0NI4enJqzCUcFVFttq/RjTXX6CbEobUIKURp?=
 =?us-ascii?Q?PMVm2sCLSlPwT8HYuXLLdtbvK6HzYG6/ZhtVM5svmUHA33nyCMD5CiFiXWxk?=
 =?us-ascii?Q?lYac1g0wrTB0JsBtvHXQSPiG+TA/hUWKmWOyLsi7Lx0g8guAR8wfw/xn2CB/?=
 =?us-ascii?Q?rw1raFXam9seyCkzFZD3OTj/22H6P//65rsCeG6SKaMPmjyrbL4mmzT1T1Sw?=
 =?us-ascii?Q?Hk91AeaUzFVaS1KXMLdLH6LLQxw+dU/hs8Wks+VVas4Fqn6YiMoj9xtnFP7t?=
 =?us-ascii?Q?G/cibYu9tE6UipCujFegDYVxUBWG2H7K9VIrMSIYKM8CBgP3hi0k8clrk6cK?=
 =?us-ascii?Q?IkDkj3xnbwFRecKj/BFMrwtLE1oPmDrtIw7VwpaG15X0rgcz858vx0UGJnxJ?=
 =?us-ascii?Q?ER4E7qmtwanIpWS5LM1xbQDtCVoWLHW5K4UwQH2BouNZ7ElQfyl246J4P5ct?=
 =?us-ascii?Q?ZvLLVsKanh9wIEixwp9/GnR758n/GATkgG/1CTy4hjkB4cMRYMrtZg1bd8P9?=
 =?us-ascii?Q?WzcgYFi3LBnRmaTdx7wGuQw04pJ+ipicv3hl+cyd9ThoN8mSAmDkaMQY8Ws0?=
 =?us-ascii?Q?zEstny5sFMJSHMgu6MGQ4LHLxFlcOJPgg+PO19/0EoLkjoDLNS1EjUvgzuqm?=
 =?us-ascii?Q?NykKwNSXFt0mmKP5D0zqOLTm4iPFOKnB6+/+n5Z8a/fIr0deYRlSomz82U1H?=
 =?us-ascii?Q?Nb3N2X9F7/cdjiyqifJrCm58lHSBmnuKg6aPVbvISGUdHEPXr/LXslTCmLkV?=
 =?us-ascii?Q?Kembsi4K32/onbudzPVVefSNOurleuBTx9KHZgdU6Ej7ayIP40qKJH8xDwRs?=
 =?us-ascii?Q?MmdNfDEsXYu8RTNzY3JQme8iXOuPi4Xhyrogel4n+oiNWX6HQV9JsukJOrh1?=
 =?us-ascii?Q?orf0XdAPsy98i7dIDlotpinxKdmlIETOAnoaRRPEmHYzP8oBeKpZODofJ1D7?=
 =?us-ascii?Q?ym/Wx6q/0eaGa3mVyxFvCC8bTrQk10sZFXyTyjX/mw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y3VHNjTFzhhs7slSI3ar+tQ3aSQSb+0K60C/VMIfNUI0RXwgFD+7WOEmICfT?=
 =?us-ascii?Q?q3qqjYbJ4CkHaKJGGKrsBAJqb1ikJ7FZLZ/NqDv3RxFX6yo7nGtLrvpwY9qH?=
 =?us-ascii?Q?D7Yd5Q2H7HATAtRjOCux258DapBkvdvBtcjjnNfsORb5hNDYSYTwxwm6mTfY?=
 =?us-ascii?Q?XpHlIOcx5YRw9kdd7VqYTRTmq3a57M+r1Ln5weiTIPRiECLEsIGHIpTqwOzi?=
 =?us-ascii?Q?cyIK2kiGGGoGu5oYPK2oPLjj2lTV867ceUy+0R6LKEgMQTr4NE3u3h6cyPib?=
 =?us-ascii?Q?TYycHc3idWE8BXVWxaL8Tlh5BVMF61c14yKcm39v2D2oLuMBnnrcp5JHSaAg?=
 =?us-ascii?Q?2nmOdH9xRKqeeWCC7GnP5k7GM10/GiX5ZuRB55t/ySyta71DHjY7c2tQsJYH?=
 =?us-ascii?Q?ZklOi+msIS2PvQ2SJsZmuuisnOhs35+lcNO2DysxeszpWENkdQ42HH23WdeA?=
 =?us-ascii?Q?gKayuyDl8t9gkff3BlXDMHul9tKWsQXA5G4YTUgyaBjtFsjnrVYFLOv9v/6w?=
 =?us-ascii?Q?lP8jV2Cry0qMx1ogbrRgzpsIpUVtjHuEkb/zXupktWyBUzegRXijiI64m5bd?=
 =?us-ascii?Q?S0EamQdZtPP1AE3qlA+iGYfUdj7/m0QJIsZS5Pqbxafbco5oYkwDY/EfrRue?=
 =?us-ascii?Q?t7paJlkZQR1xJzd/BPCmfgT6N4+JpXzF1Khu7YodgfCOltlMcziYSTxyDfFS?=
 =?us-ascii?Q?t/x/ULmqg7SDxCllNJu9Uj7qfBNoP5cCiD8XTTZXNAeVbih653/naYbMFoCl?=
 =?us-ascii?Q?TL/ib0P1fHN34j+bFVUz2Fxy/uQILfg+8loMZegXfBV4KQQzXq1q01bXvA1u?=
 =?us-ascii?Q?L1HvYquoii9WkhxvFzMB7k2XIvSxJU95QtT21ZVUTRhxRNPdSC25eG1yGAQV?=
 =?us-ascii?Q?PNkrfhWbjZxsoOkmCEeiyHRzuDqI0gUNfpYkAyHvx1RJUAw1cKweOo6L2Sty?=
 =?us-ascii?Q?EtZIOuNYSf4hOmy8zIc4Rjt6pxhn48X5So7PEYqw8w4S7+9wPB4wI9gWQLZg?=
 =?us-ascii?Q?a92ZeU6fWgpUXnfLeLAEZdyJnus5S201laDxZsqN6Mv56NPwuDN2ToMCtitw?=
 =?us-ascii?Q?v47h7SlFHOc056mRMkMtQztwgvbojtpMzQfhckR+YfDyTuRU/HxIoum+K21t?=
 =?us-ascii?Q?VRSfG09XEW6SXcMieIJy4Ngrg7k948fiSGpfIeWK073KlQ2CLyDm0UN+NBen?=
 =?us-ascii?Q?MnwQSGJuNaO98bYa7YR/uvOp7KYegPdiZUYdjEbT2e+CoSKkWcK7CrYmjnYh?=
 =?us-ascii?Q?VXiA33qynMfqfaOEVl/3WYOBYTDY58+Qf4u3wmCtTFG9i71u8yHFmVe48k/u?=
 =?us-ascii?Q?m8Jjy+0bHI0fibv0mWMirryoEHojORrijwMt6Wc2s7+JkH89g9cr9w68Sddq?=
 =?us-ascii?Q?FciulpwSuKwUTfr2zQwikEmEyqxNg5vZphhK1eu4HvRRaxDicURT4PQ+ZnwN?=
 =?us-ascii?Q?zaX3C3pAjYsBi/2LpSJWmCKHQXvZBxcDVps4foivKRRuQH9FNVr5v7uUNCoX?=
 =?us-ascii?Q?oIAIHYkcCTy40Zp+9D+Nfu4bqu6HBY0ci4fq1MohHq5VY/54r9xoubyZbwAn?=
 =?us-ascii?Q?dCk++rh7oGGKWXPMU/7EFnfaXkvKrRYve8oArmARuVv4EuBGEwQPZfbyc7Z6?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef36196e-e603-4978-8214-08dcfce03026
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:51:39.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXSOmjzHh8TYgcYH6fV5u+9FOjlr8XBsT0hIZ9Wv3gzYEcaADW38clMv4tCXZSAkKN9wLq5oOC6PZiIP8LIPBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   81bd1eb3862e37f2ce6e1148ed51ac214ab5c007
commit: 19a00cf1778a605491092b6b2ac0cf46687ff6f2 [1/1] CHROMIUM: arm64: dts: mt8183: Add pico board in kernel v5.10
:::::: branch date: 4 days ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241104/202411041213.HRKAus08-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041213.HRKAus08-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411041213.HRKAus08-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:523.27-527.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:529.27-533.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1186.21-1196.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1941.28-1945.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2055.27-2059.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,pico', 'mediatek,mt8183'] is too short
   	'google,pico' is not one of ['mediatek,mt2701-evb']
   	'google,pico' is not one of ['mediatek,mt2712-evb']
   	'google,pico' is not one of ['mediatek,mt6580-evbp1']
   	'google,pico' is not one of ['prestigio,pmt5008-3g']
   	'google,pico' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,pico' is not one of ['mediatek,mt6592-evb']
   	'google,pico' is not one of ['mediatek,mt6755-evb']
   	'google,pico' is not one of ['mediatek,mt6765-evb']
   	'google,pico' is not one of ['mediatek,mt6779-evb']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/pwrap@1000d000/pmic/mt6358regulator: failed to match any schema with compatible: ['mediatek,mt6358-regulator']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8183-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: anx7625@58: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: dpi@14015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: mdp3-ccorr@1401c000: 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: vcodec@16000000: reg: [[0, 369098752, 0, 4096], [0, 369229824, 0, 4096], [0, 369233920, 0, 2048], [0, 369235968, 0, 2048], [0, 369238016, 0, 4096], [0, 369242112, 0, 4096], [0, 369246208, 0, 4096], [0, 369250304, 0, 4096], [0, 369256448, 0, 2048], [0, 369258496, 0, 2048], [0, 369260544, 0, 2048], [0, 369263616, 0, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: vcodec@16000000: 'mediatek,vdecsys' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: vcodec@16000000: clock-names:0: 'vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: vcodec@16000000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: thermal-zones: 'tboard1', 'tboard2', 'tzts1', 'tzts2', 'tzts3', 'tzts4', 'tzts5', 'tztsABB' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_max98357']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

