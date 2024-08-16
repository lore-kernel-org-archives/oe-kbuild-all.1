Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0071E505
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816309; cv=fail; b=AlIMDG07kgYhTPVcEPNBWwJdMKrgO/UVuJyu7zhqZgLthFaewFvN3eGuwSPBe52i+Peo64r4SbmnpVwa/Vso0OdhhMairY/KllLlEvJtyBErRSZN8up9aBpqHXZQnZ7rgcPqFlDsXUGrS8Eapbw1Upt1fEx+laqOtWRaEQNK+kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816309; c=relaxed/simple;
	bh=SWvfJurgfLidT6f6tOvFJ/5UI55x/t3GeKm74ofkxVs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=F1KltPtoGQG3cGLxVdPFkcAKvRnfQdVDJSorn4UAeKHFGV0iS3esfbk8AULI9+zzMGYVR1bIiluzEGz6Xyo6/dvkiiOtj/ynSzYzFM2GF6iRuw7Y3F1agpWqfPtcZryHIL7nMmavcJ+nDm8SZd3KrbAqmkxBKrNfhQ+BMeptz74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7+JZE8n; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7+JZE8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723816308; x=1755352308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SWvfJurgfLidT6f6tOvFJ/5UI55x/t3GeKm74ofkxVs=;
  b=g7+JZE8nArxzqpgJAc8j+SxnQ2CN3U2hn2IutO/PCzfUdX9d4P8jrdZd
   7hfyBB6FZOna7Ds5q1YvunhI9ZNFiZnIullilUtsesubMT41Bco6NLIkP
   n73G3axpaKhSzRPEF8NZ3nqMXMuMU5Z5sJuHj75vhk4G67ZOBrc5ZRY22
   bWDXYHKeRR3Dje8PDnToRcx9R/nC5too2oxbK3CLG2MV1t4Gdk/UWBqpb
   VbRQ4BKZu9FWVlHYsJmABxepTEZtELesonK+216LhFPDXFG+FKFoRH3bm
   AKv3rYVzPhziPd9c2b1eikwKwmQVTh5lF+ZhkLjK4qt/nGsy+dD164oY4
   Q==;
X-CSE-ConnectionGUID: n7MQRpmaS8KJsAUeXlhaRw==
X-CSE-MsgGUID: vwJAz/9cQQKy18mUpD9Pcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25869787"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="25869787"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 06:51:47 -0700
X-CSE-ConnectionGUID: DdfghVC2SFSu/Bui2wR0hw==
X-CSE-MsgGUID: 9+txDMIZSEKKrf3OG9HRuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="63858056"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Aug 2024 06:51:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 06:51:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 06:51:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 06:51:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMSIOZOFkGBHPDZS0gAQXyL8m828HOP43pXN1HRIkLiYbDGyMEBG6lmxKKgKxlnQJxfoZU95kfJn5l9vNVg80owm41x7om9CM4rcNwJrbt2h26WVkwQ2l1+4u3OrJJF1hpinTWi8uKo457Wxzm5/Bujgp5s6OJHHGvFOUonfCFEBjFo4yPxWx1jK00QcBLv/JpE8sst8WksmQwlM7ZY4zBI5ll4P5cEulPvxocUm4oo+4AiQCY/4DCn3n3ccpPf8Loy+wQy9zeh8mqa3myjNiMG+y6nrzTXbLYQcvgOAIC0pLMzEVXCmnW/4IBYFIt/ynYpLpFq+/Lh1szQIbbVHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftVBrHheBrTlBX63l7iyT7wzFZGnuxYYJiwbpgbjJok=;
 b=ACU1Qlf7RAcUkXIII7qkIWoF65HfHGe7V7YhkuIX50pTXx1mY7RlJRxfUpHNBYY/O4KtKxMMHLjmH/P2Wo5pXz0gPJhIMz6xqXEeD7WeKVOHed686dz3VRF12vc/euJZSYQrvQ3jjRCNm5UVJ7INJVQ5f4krmSrWhDgkWsYkCL1fu4W7AHkZbovpZO51B+pUTeaHHJK/kVyXxTQy1G858/W6rBYNpJYihD3w3ty5fkcnhoejPF5Die7qSprnyL/tWP4+oBDviH770vtKzyskslJf9yZTU4Np0VhItEOu10OpKNQsvp/NbACd53C0CQW8MkKDqZw++iN0QYuna/Tpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 16 Aug
 2024 13:51:43 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7875.019; Fri, 16 Aug 2024
 13:51:42 +0000
Date: Fri, 16 Aug 2024 21:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.1.y 24/91]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /efuse: failed to match
 any schema with compatible: ['amlogic,meson-gxbb-efuse']
Message-ID: <Zr9ZZ9jURE+AUMKW@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CY8PR11MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: cac0c5b5-61a7-460b-a4c4-08dcbdfa8f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pGN7xC9doiA73wAtoFEE1hpI6OzzXKApKJSdD0Y85dAn83msuVxnm8Yf0Efo?=
 =?us-ascii?Q?9ltRmNtSWPu0FtSG1VLsqA+b8jaiCQkp7GoGv4U591PREQjA42qOwDyZBbCp?=
 =?us-ascii?Q?2FYR0JmAwOreCLpuv8rjozLcIWdM2g/o7+LgR5YHJDgLlcg/vyYqalQ2oASq?=
 =?us-ascii?Q?Nc6hInuwt9QEf2L9Pcd+kMkjR4EI7V5xHuzf7hffD39Afc661eKXag0U8PrZ?=
 =?us-ascii?Q?tn4TaurLzd3Yve5siXzKZfaD8l9F+OYm51yWBvtON40KI6UsG53ZwxB3UnuP?=
 =?us-ascii?Q?shprFN2CE66j0/X/QT6ttxxIOf0XR/IKmjRrKZJXIzjHiKaxiakYUCEr7Pyk?=
 =?us-ascii?Q?B6z1Yzq27VdbGVN5PVhKacHFU2cEqXrrLiu1cdwhXYQGSyOGJh6efZkuBR0l?=
 =?us-ascii?Q?nQlnthtjL6chXPq6T1ZbDfuFoB14H2YaSReTXicIDhByssXFwEp9sTOugTkZ?=
 =?us-ascii?Q?aG4TCkJqF0RdoB7L/+78jtStWHugbqULlEwsB9Ay3sx8m7HMcasYZtL6oHDF?=
 =?us-ascii?Q?zKk53RTWqKBXMMx4O31RMQ+DUvv5rrUbvDwzm7FKlI+n9EW1xhCj5d+qnaiI?=
 =?us-ascii?Q?21DYuWol/hsiDG8Ziun6o3N+0hGomY0JX6VI2ynIY3lqzm9U0480NA7VHrXR?=
 =?us-ascii?Q?oNEeMRPAn0e05sLPuZ0CHH5cRW4W2MBMxeKHnBfPrgfT0UOjzoNqUghvxTWq?=
 =?us-ascii?Q?4S14Vgwvad9qnJ5PBgLATtR5bEMAxRXsbOWV7khe/tAwxNJ7z6UszQ/mmU+y?=
 =?us-ascii?Q?8DHD6cEZp22hZqI4dYXUdHdVLF0IovYZLUL239F4wbDmo69mmFx9UnuGTBtb?=
 =?us-ascii?Q?1OzDUBN4CmVIT0OqpZJqzgy8fgWVr9eC6ex3G99ApZRBcxUIp9P/LRUw9hPt?=
 =?us-ascii?Q?dOLuvnHFBC6HLCMv+/2cPrx2U+7/YlngbGzM7Iq2geDhG7fvdaFp1FgJZw6M?=
 =?us-ascii?Q?eLPpT0ultM3ksVZro/ijfYvIP4qSjAmUj/KD0VzG0TaRG0VzfJL4JT1sA2YT?=
 =?us-ascii?Q?12x3+fFMD2WAqDJsE2P174FXZOfipZBNhV6qaQIeLZNWhh/lPmKT6R4JB2+6?=
 =?us-ascii?Q?9a9cvkPas/wcUkjYtPdikdLLuPFrugvRL5ZIhMLJMrT3+vKXAhS0EWuyuBx1?=
 =?us-ascii?Q?8LGxmNYS/Jqy9YibWeCdXn9QXv0EkOBxxWzzgwABtGPzeYFDy3ow0r46zqbo?=
 =?us-ascii?Q?32mL3s642E4Q4f14XuXNTHK+sKtpzjHI8CgDBqcaRFFU8H1pP5ByTZPTWfV7?=
 =?us-ascii?Q?zvgH3YPDTfLbhO4WC6V/t/WOCPX92y8pU6iPJ8fZ9HsNcelcIK0onTyxWp+A?=
 =?us-ascii?Q?tUw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2RZ47+3BBO9cvciKFRUI7TvhIyi2/NPmn5Hzw5X0YWV8fH6N8V/4GsEtAX+E?=
 =?us-ascii?Q?A1eLEpWPf4OH8Id+TvZSQJ8KAxSkWPU890MgxMMuBli1cwDvNxcHA5OfN0lO?=
 =?us-ascii?Q?HMSWFUtWMqFpewqXqqG7KVyoPGerDQD63BaB0rmibteXZBTa3aem9wp3Y+9f?=
 =?us-ascii?Q?geJNuVoxxyYJoM7baG9pfqeAsApzKEVgE4FV5aRcjEXD87sGIxR3p5atMZ2A?=
 =?us-ascii?Q?8+THU5jKdq1etTxdTHEGXuIOcYcvWdl8xf8p6X3y4JPh0UqazFgghd/TpQMT?=
 =?us-ascii?Q?i/pLbH1LhPyLZo8HcuzvyXcfDCzY/4WecfTE72YriLMyq3pT86guUOd5XJmh?=
 =?us-ascii?Q?UWD8ABlImL0metfO1V04eLl2JDAg3RJ0OH+SCfwjsj/xiC47SpctVn2UzwLg?=
 =?us-ascii?Q?h/2mZoy2uPmfybRbbV8DwjivNRp9qHRewshiBBGrQf5kEg9Key8Bc+DT04Iw?=
 =?us-ascii?Q?+LaU5lBneoFGPmHs31FA0M+2V/SW9TpLoRAWqqjLcPwrZ2luoojOj5POOtU6?=
 =?us-ascii?Q?AxI2xvMFd0EiDOx0YHnwbSvlkaJTAdIo+dZs9UQpafunAOQEXVpwHDVriHQo?=
 =?us-ascii?Q?gLtcAGk7NN+fOxJx9xHQ1dKmfD8afENgv5O3B4NxjYpbe3yeXGo28/7zezQk?=
 =?us-ascii?Q?qRrzU/IjLMhTMIwm7LYqBVQU/Eu0j5CX+ycczkvt6WL2e/liBqaw+n0TkLSi?=
 =?us-ascii?Q?SrdxViKPX2MOVV88feMwMvMI2Ivowp8uAyQtgI1uuMCBPYVOP21152kpuuY+?=
 =?us-ascii?Q?NEPvn00GeEXIpl92QYeLxj+vm6jVRBZWZG9TQ6Y1C6l5wAAxbvoTvQRqyh7n?=
 =?us-ascii?Q?2u+gx7kOn/DjtRvDHCyj7sflyArS/r1QNV2NfqdfObVsT0m5gYD0YQXGpCya?=
 =?us-ascii?Q?HYTkUyu1U3zh5bvXDiHOP9coAui0eEoFtfHWb9sp7+ZY4KgTFPmdCWdVQ+Mz?=
 =?us-ascii?Q?IlcOroLKY7JlvuF9E6t+mn3/y54/nOpl4xka/qeXCvAzhEDTNx2GWCDlXHUZ?=
 =?us-ascii?Q?vJeGHgr5/Yg7MI/JPvcQZw2wbGMrjUSQcrK5k8FaEu7D3pZqUz9ux9asNskR?=
 =?us-ascii?Q?hGUxUwA9qcwQ1FgzSSxAR/Pz7+Wun+R+jKHlLQra1YSBexisneoFsmUGilGn?=
 =?us-ascii?Q?U+/Ox53oCkPADUw4B0BFQI/Shyg4qmwOXp5vBGDjlAQ4dEBWNttPUKoe2CP/?=
 =?us-ascii?Q?Hj0vLEkX67Sm6VT8dZ2O9Z2CrHRiG9mWqGzWu8unHe46gxZzkvJ2dMX3GyvX?=
 =?us-ascii?Q?sDZBOvy3ZqWOpFZr9n9W3q16cW8jhOSOrbCNoIUI4QuJYkVMZJCxpIlIBuO7?=
 =?us-ascii?Q?3t2t4jcCj61fZk5INneA/oQhFyC0/YkismcKR/hKOJLUotXU5GWQOJ2ASuI0?=
 =?us-ascii?Q?bGC1wZ+bqryxM29dOIa8sq2HKc4B2U44NY+p0JV5KkSIpbM6fEwvgEkFpScr?=
 =?us-ascii?Q?kbLycDezk0EwoHbsriUiMexpMpOIGoLNCuusQTACA+o2prg3ief5Rt8295hs?=
 =?us-ascii?Q?3vByM1T05piuTjQWz+q1fWvLX5L8/zTuQKFHTRKbR2ZCuKT/gyaApojaogx3?=
 =?us-ascii?Q?ij7+cQp/rRyRVigNw4Qj11O0OQsZ4/kc7HixXQJz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cac0c5b5-61a7-460b-a4c4-08dcbdfa8f4e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 13:51:42.8783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGPyVZmXJ0nBN8wt7gZ/XLe20XoQU8LRCwb1ExAv7MfVNOJNYWOnn5pPBuii8JMTA9RPRg62a3npCXstfcBcDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   2ab07fb3568ffe3b7e17805f28619cd38a41f370
commit: ee5c9c2db6a7bb0c38aba7e5aea83a20d173fb47 [24/91] ODROID-N2: arm64/dts: add 'meson64_odroidn2.dts' for compability
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240816/202408162052.3z7FE6dm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162052.3z7FE6dm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408162052.3z7FE6dm-lkp@intel.com/

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

