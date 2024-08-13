Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470D0370
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 04:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723522596; cv=fail; b=ObjiyVc4AocvbPzCzIchdRA2qmEQQXvxkIh6I469GX20KFO4i8MeWkyN1s63ees+T0Ah4AotayB/2e7E1QWa5DZr3Q1WOrG040S4s4uZqbTkNlD691fGyqzaGXl4h/2sJy+3mZ+BLW+FooLqjM37RZKplotK/BrOCNGWcXM0vNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723522596; c=relaxed/simple;
	bh=s4cILxNZ1xV2hU3fi2gcUKTGUlP2hMMD2khotYqazIM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kPrF5YHRz9pLNOQWzLLZgF2I3iLBqALYOhGnq8n56jh0QBbDrW26bBHR+BdP6pMaeT/H+/ONRDIIIWR/Hyi0M3pj9nBtcR9cRM9/291Lufb+XRaebJ9uju4Yj2grryVATpmT8q87qQCUICRnJNvYLoEnWxl9X7rtoHrGoe+7/1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rwvv0z/A; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rwvv0z/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723522594; x=1755058594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4cILxNZ1xV2hU3fi2gcUKTGUlP2hMMD2khotYqazIM=;
  b=Rwvv0z/AeahEnlO9jOTy1PKgxz5oPIedTv2DrmJ2fSS0wnmmfk1wQAZD
   G5UkqOqnEwo2Qq6dlAoNNXfRi1v4lPcoZiiP7SOdIx10iNj1EV+HMiayB
   ktysyW5CRCPjAPHLTQmw+x+MheUIitcdjzrA/1OMlaTZxsa2h+1fZUtZX
   SOmbhUdl0blzVAB6Kjn5wlPuLBq3xwaV6YtP+Xk3khJofuBrbXseAjylO
   W6HXaoO3Kh58/3DsgZOj4KcO9rdSWeSQF6/jg/B50Aj24uhoPNeemNqx2
   rIJ6QzCHlgHQedtFRmnDSuAKfm7pzBEUOZO0ZL4B7GAXx9NWNcDuZcUg6
   g==;
X-CSE-ConnectionGUID: WSbo782/TZmgX6ophIySbg==
X-CSE-MsgGUID: yUjwTNvaRMufOs3fghnaTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21821878"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21821878"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 21:16:33 -0700
X-CSE-ConnectionGUID: IJ8U6PXjTdS2sjWwbB2Gjg==
X-CSE-MsgGUID: WztUvEAWTdm6NZAQ26vXIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58462719"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Aug 2024 21:16:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 21:16:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 21:16:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 21:16:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 21:16:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mur1ArAuYYa/cb7h0daYHvrHtkwfiBZuh+/Aan25ULUtTRctF36KFOEpY8CEZXk21WC76Klq/q/i4QPtvz2l7SxAa70QY6KWMMES6PFkGINYfgFGFjWBwEa/d4PVqqOkTJ9NlIl7RwBESPAkiQ3R3sW+oofqFqgReEyvTB5STNSMHRZn1uYpzKngHsqi/21MgxAmrnmmxHCTfZ8pHfusU4BTadoVz6Xx1kJdvVFLFKqu19AjHVTQN8JYwVeEk1hw2qa/B7vUMaIQtdHj+DeSWbK0nA8pM/xMF6XAmkqwwA6xGeJHp8Ya9dG1yBuQ2cJ5fLhWu2fnHl1bRnlIGgjFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7Z4h/83JP6fMOjXd07AdBSO+qWXXwN5EqVEU5F8mHw=;
 b=hUfjYUUG8HTwTB43EgDylfkcYag/pdyUhcd0ZJJQvmWNhdN5OZ/rKtldaeNEg/z3oY5Hhu5yQ7JgKDVfQHjnf7M41VAqB74Vl+0iURMbBCTnHgPQlgbNsCFD4mdgoxSr4/WdMx6SB2EZT98U4jC/jo8NnYDkcZq0h5nLa2BBICT9/+XEO9qLTqk6C6vCFnNpffJEx6kW93fFjjnLeHTugAnjfpdEEkbfKSz5PKnUtMAojXWFMjaLEPgOs8pcPp/vXfO71I3oHytM8VNY8IPmHHtr5OtrRPbCRLIqIunqDcwYymez4DD3fKBbZuwIvMwMgbD1YOT6MQF6KAnl+uPP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 04:16:24 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 04:16:24 +0000
Date: Tue, 13 Aug 2024 12:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.1.y 24/91]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /efuse: failed to match
 any schema with compatible: ['amlogic,meson-gxbb-efuse']
Message-ID: <ZrreEMrPX4eIS16u@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a234118-d3b4-443d-4ad6-08dcbb4eb1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IgjI6wDqf1SAsRZmEDeXPljswuQe2c7iA5W13bsIzWi3syUGgQI5h7eH4n+6?=
 =?us-ascii?Q?UF+8FXZWqwH2q9yo1wF32BUoRfCDa1kMuSrrbZYMZSL5HArY5ax8NXwphrDp?=
 =?us-ascii?Q?tsANfFUyubZgu4o2RzGixS3bQvb8X3Kb/zF/FvNNHV1LuaDihHcZOfR7EYUZ?=
 =?us-ascii?Q?WBLZbL5fTGG/UUQIL7Xexfg9gPNhFgawN3bj9rG/f4TuRjBtI+EHbIvXgvlv?=
 =?us-ascii?Q?a7GvOU0h0KSSnuADA1drToBuA/RVpVXZewDIKQVe+5Xo7/r0fciPMsD/0dt0?=
 =?us-ascii?Q?W3jLqezbTzMbhAu/UMCtuhxySBcrpbTzbx0BRAcLAs7YZ3Me9ZhirdZzi4NC?=
 =?us-ascii?Q?WoGoSpUqtjgrfPIGYaHlbR8NDmmz0ekqfK+/2zSHYncSqL2mebAAy76OCFbU?=
 =?us-ascii?Q?ACwlqJwRgkhY5TbxbAGZRYClOM3FqhGJoNuGrFqv2EJLYbHtx7xoBPgjhydQ?=
 =?us-ascii?Q?sKJ3J8Es2TV9HDMKxqFzvsocppa2gzQVkNml/6Vr5tGdT9AIhFztbA7bL2QI?=
 =?us-ascii?Q?pILmpr+EePohnKLkSzqq4Acovg2uD0OguxWprwTiR4n5/4eeTz2gzv8B68KA?=
 =?us-ascii?Q?z4hlj2vQyG+OuYYspOfGD4QPpKSz4gJbkhw0rQJ1iF8SUU0XI9qklymQYPi/?=
 =?us-ascii?Q?TW/PbRnEUYXMn74S5ZJAZ5xwnMlKwZHU5rLYKD4iFr8uBB0tGg5v+enqfTGF?=
 =?us-ascii?Q?rP+gif6uGS3enFsdRuD1BVzwz1dCemyyr+oImnFpmxnFijsZt4s9SNsVKOLX?=
 =?us-ascii?Q?PzC6X4bS0jr15bbwd3Np/1V9ctpwF5+MEgsOMVOcVbA5L1pgNOJmSNiV8LSY?=
 =?us-ascii?Q?LGhDHp4KIqWZcnDBbr/6QKUeRKOieokQ9zQZqIdjzy1uYXCLA7i35hzpX4as?=
 =?us-ascii?Q?htLUOKxxuQXRde65jj+CAjGQ+Dr0aodkXZhBaXDE7MEWufQfmm1TXwl1Fg+2?=
 =?us-ascii?Q?RxEzveHcPQaoRi7X10MnN+ldRgOhrSF8Uv+86R0A9la6qXrgA++reTTIz8kh?=
 =?us-ascii?Q?HZZ1NnJ968F3wfCOpO7oL8d103ugDBW8HRAtnX4jW/DQvbs+Rr9ZYzO21jWJ?=
 =?us-ascii?Q?+y0lR2cjv+xqoVz+RJ5Jr8e3TnQalATpPqv4LsIUEq1DYm81BIbZxMOX12zn?=
 =?us-ascii?Q?IhTNK3458rfzEijRBzZQm3FKe7NFXxr5qWWf7SmLmdaQAqqGuR2S5enpl3tb?=
 =?us-ascii?Q?dOm+z/z1Un182gfQI8NWFkc6ET1ifdERUgo4cJd6dDY3emXtJfYBIir3pnFx?=
 =?us-ascii?Q?8NizLXtoGm/BDGhG/d4UrUFUUWlxk8PLqbNpL31U6s6GBmXRQPWNRx6zTTL0?=
 =?us-ascii?Q?Veo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9zbwRqyH+gY1BXYjjGeF57uNdVKy2yJVyUCjTFFh1/mLocX8PEe/rWAQ7SG3?=
 =?us-ascii?Q?mkAkZeOSbHMJArhVSiLj+itm8KgAUEvbAjB24266zc8EXAprmUTHzAYLtTCr?=
 =?us-ascii?Q?PRz262TwBqlsHmVD5XWwifhtxcqiKQt6Jky+jms4O3JPqSIOGqb44RmcfJp4?=
 =?us-ascii?Q?ZR9XkOzhZo5pf/bY19iWM+uYG0x9s1KDpTRB5AAA90IIZWNU0A42lwx+mj1J?=
 =?us-ascii?Q?pY5pWNj2AhJnOrEW50Nn6H125U73g9LiZMeLMzWJSn2gSJ85hkeUbqYzbsuY?=
 =?us-ascii?Q?CSXggAncTUyqM+UcNllb1XZ8U5UQnBeIb/iOOSl7yvCCGEXNsw7kICv/PiX4?=
 =?us-ascii?Q?JG0PMhV6aKq8o0XMshIpPpbDsJ2xcwU5IgyVo6Dwlb7v6wHYIZJ3t7Hr4W6K?=
 =?us-ascii?Q?vk7NKhBWEWoSzgq45BP7cALnyv2CUVflIW43DJM7VUYOkCUoXxTqFmwRxVrV?=
 =?us-ascii?Q?PRGjr2a1OR5iaqGRn71GffJMVgNQHVhJ78CEjwy6ll1UHe82FoZ3mpPw4u5L?=
 =?us-ascii?Q?n2/rGDevRUUZ5nqd/0qURqgxg/Xa7Oiwx7C2L53odUNveUOYj1yhMYi177UK?=
 =?us-ascii?Q?CIYK7ZwVpj008V8wtRhCiLYr8jj8tamRjx2kLMaHSRp3MhUoeZbR/NPergy/?=
 =?us-ascii?Q?DuwkYqyrRCc5zvmAd7CyVsMS01VH9V34kAVnrI3w8mlgXaiGSegxzfU6HGsj?=
 =?us-ascii?Q?cIbYYJrn9/E2EUj8WFws4V+qZ0mV2GmRbA+7BVF1budUxfDuawlEck743dwT?=
 =?us-ascii?Q?1fj2LaIzo0OMoa9fBdaR9fLkQTNhEqGg/mIkDbAvTUDEEldTplQNneZxwJ40?=
 =?us-ascii?Q?iqbKONeWt3rC+qhHhUC7U+jkKubaAkIlCl3o7+a2c/+exU61HLsofVnyne5G?=
 =?us-ascii?Q?s+EYKiPJbMrB6xeoCXzQcnq3y4vaMlniJ25PmRr0nxegyZnpbru6Lv1KLuVl?=
 =?us-ascii?Q?rIoqQYRMZ3vcCObv5MnJP7WbIb3ZUXITkiSSipQZ6ehGFcD2ofdPbEROO7SA?=
 =?us-ascii?Q?ORAasnFTYNkEQw9bDEcxCXrvWnCpcWSERLcrogisk91nC4qouk1TPYE2qLMk?=
 =?us-ascii?Q?7V65oIfBdkJ8zOgZgJ4EUe0b5GRk7ILWJDDyh5FovXMjbAVwoFaKE94PKw5d?=
 =?us-ascii?Q?m/+MskOEIjspvwXlsRpLSUgC5yjrNTF7wHi7vYaqXspyTZrBmrg6/Cwo9dcl?=
 =?us-ascii?Q?imNt/ThkSfV7aFnUoujejeWnDGZ0SzOlB1yabihqcIhE84NaUJkm5U6zi5SM?=
 =?us-ascii?Q?GQsxR5itcyzI8jMbVqSVJ1oinRvip19O77/5ZpaG8UcKpouRrFT/mv2UMmHS?=
 =?us-ascii?Q?3Wp2NCyERjFQGIRu1CPbArCDJ/sCwW1PqLahV7EjADyZGLhBPPHLmHhlq2UP?=
 =?us-ascii?Q?edpJ8TiBQF/JC2rFX+UPmuxsSpLKrrukHaPYbhtb2w1gL9O60jya/Z3oR2El?=
 =?us-ascii?Q?mQ820zqC83Zc+Wrxei/SPzFXXt2k+O4pZPModGQ+IS73d7KpzWu9rcNZB4L6?=
 =?us-ascii?Q?UJw4RJ6lv8Rcs5jUQsnVLeKLIhi1rfO7OsmQqqYDny69kVwzPgRGiNNU3tla?=
 =?us-ascii?Q?ntoE5DZjvZ/4PRnWDAuw86qrs/L5tv4rhlwfdxpaF/CzAcPbASQrK2uJdHTN?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a234118-d3b4-443d-4ad6-08dcbb4eb1d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 04:16:24.7904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zt9QCzSfHiP2lbYkEYbk1yvzYIkoegtbt09KxBAIlfKgrJxPMhveP3T9e4ajnNlDLzxexsPX8yvsWFQ1YY57iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   2a5f985c90ffd8f4e2de3a2fd76f00c3e322aa6f
commit: ee5c9c2db6a7bb0c38aba7e5aea83a20d173fb47 [24/91] ODROID-N2: arm64/dts: add 'meson64_odroidn2.dts' for compability
:::::: branch date: 6 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240813/202408130404.o4DXrIoy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130404.o4DXrIoy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408130404.o4DXrIoy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1731.28-2003.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /efuse: failed to match any schema with compatible: ['amlogic,meson-gxbb-efuse']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /secure-monitor: failed to match any schema with compatible: ['amlogic,meson-gxbb-sm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/pcie@fc000000: failed to match any schema with compatible: ['amlogic,g12a-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@34400/pinctrl@40: failed to match any schema with compatible: ['amlogic,meson-g12a-periphs-pinctrl']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/phy@36000: failed to match any schema with compatible: ['amlogic,g12a-usb2-phy']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/phy@3a000: failed to match any schema with compatible: ['amlogic,g12a-usb2-phy']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@3c000/system-controller@0: failed to match any schema with compatible: ['amlogic,meson-gx-hhi-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@3c000/system-controller@0/clock-controller: failed to match any schema with compatible: ['amlogic,g12b-clkc']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/phy@46000: failed to match any schema with compatible: ['amlogic,g12a-usb3-pcie-phy']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/mdio-multiplexer@4c000: failed to match any schema with compatible: ['amlogic,g12a-mdio-mux']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/audio-controller@40000: failed to match any schema with compatible: ['amlogic,g12a-pdm', 'amlogic,axg-pdm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/audio-controller@40000: failed to match any schema with compatible: ['amlogic,g12a-pdm', 'amlogic,axg-pdm']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@100: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@100: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@140: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@140: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@180: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@180: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@1c0: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@1c0: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@200: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@200: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@240: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@240: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@300: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@300: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@340: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@340: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@380: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@380: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@3c0: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@3c0: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@400: failed to match any schema with compatible: ['amlogic,g12a-spdifin', 'amlogic,axg-spdifin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@400: failed to match any schema with compatible: ['amlogic,g12a-spdifin', 'amlogic,axg-spdifin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@480: failed to match any schema with compatible: ['amlogic,g12a-spdifout', 'amlogic,axg-spdifout']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@480: failed to match any schema with compatible: ['amlogic,g12a-spdifout', 'amlogic,axg-spdifout']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@500: failed to match any schema with compatible: ['amlogic,g12a-tdmout']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@540: failed to match any schema with compatible: ['amlogic,g12a-tdmout']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@580: failed to match any schema with compatible: ['amlogic,g12a-tdmout']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@680: failed to match any schema with compatible: ['amlogic,g12a-spdifout', 'amlogic,axg-spdifout']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@680: failed to match any schema with compatible: ['amlogic,g12a-spdifout', 'amlogic,axg-spdifout']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/sys-ctrl@0: failed to match any schema with compatible: ['amlogic,meson-gx-ao-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/sys-ctrl@0/clock-controller: failed to match any schema with compatible: ['amlogic,meson-g12a-aoclkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: failed to match any schema with compatible: ['amlogic,meson-g12a-aobus-pinctrl']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/rtc@a8: failed to match any schema with compatible: ['amlogic,meson-vrtc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/pwm@2000: failed to match any schema with compatible: ['amlogic,meson-g12a-ao-pwm-cd']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/pwm@7000: failed to match any schema with compatible: ['amlogic,meson-g12a-ao-pwm-ab']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/ir@8000: failed to match any schema with compatible: ['amlogic,meson-gxbb-ir']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/interrupt-controller@f080: failed to match any schema with compatible: ['amlogic,meson-g12a-gpio-intc', 'amlogic,meson-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/interrupt-controller@f080: failed to match any schema with compatible: ['amlogic,meson-g12a-gpio-intc', 'amlogic,meson-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/pwm@19000: failed to match any schema with compatible: ['amlogic,meson-g12a-ee-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/pwm@1a000: failed to match any schema with compatible: ['amlogic,meson-g12a-ee-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/pwm@1b000: failed to match any schema with compatible: ['amlogic,meson-g12a-ee-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/clock-measure@18000: failed to match any schema with compatible: ['amlogic,meson-g12a-clk-measure']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/sd@ffe03000: failed to match any schema with compatible: ['amlogic,meson-axg-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/sd@ffe05000: failed to match any schema with compatible: ['amlogic,meson-axg-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/mmc@ffe07000: failed to match any schema with compatible: ['amlogic,meson-axg-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /audio-controller-0: failed to match any schema with compatible: ['amlogic,axg-tdm-iface']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /audio-controller-1: failed to match any schema with compatible: ['amlogic,axg-tdm-iface']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /audio-controller-2: failed to match any schema with compatible: ['amlogic,axg-tdm-iface']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: l2-cache0: 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /sound: failed to match any schema with compatible: ['amlogic,axg-sound-card']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

