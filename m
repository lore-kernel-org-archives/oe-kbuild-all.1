Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B65128389
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 05:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725167825; cv=fail; b=ayEr+o5/makO5XejTh/Mb0+Dwu6fzwbhls2NxJzo2hTgqYO90KwxgTbPwhE8Zk8L42iCukCQjfjTN9bNs+GMjjbHHVEF9w5Rrz4tAZ/WQ8l0m8B+y4C3i9I8HV5LhKTfau4Ub0wVxHEuGme1o3TEXdVIpc7EqZf7GTniqjwS49k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725167825; c=relaxed/simple;
	bh=DNR7417cEW2c/r5+W3G9r463PpDHEzLC7hd4aK4OxI4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=AUYhpBmmKE/CdaBCRjR+0/egIFaYZbLxz7rwExSHBjL3z05pZnaQsI2xMuD04p0xKJM+1TGkyMbglmS2YFQIyyElcSGTSbK6d6FWo52QCsYrxS3wO44WS2MsaQHpUywkwrebovBqCSYJl9cSNN+Ig7C43OV8sse+tJaiFzrHj68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eb9vHA3B; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eb9vHA3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725167823; x=1756703823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DNR7417cEW2c/r5+W3G9r463PpDHEzLC7hd4aK4OxI4=;
  b=Eb9vHA3B54R1Ik/U22kVhmhB4sqH99msw61OydpUtge8BO08XCDc5oHP
   bRb9w3DxqJLc8ubYfZuB6knLYENZyrP3er3qxUH8MrO/AniKvza98x8YP
   OeZ7ohiWCrALXBUIRD55f8zxrloJ7vmkhQRA1emXY+joRz9di6tDnIjmW
   VKjGHHCsOVVOAguRv/1/Cr2tqDpci/pLMJpcAKRgSk4l2+mJLwyOm9724
   SRDJEfJz0gkuWRB31kD4z2L2l3VWqrGGNa0bUZ5AFuzO4FRe1i25XVsiM
   0wE6fKlfl+P1g7dzlVCdtOIwIiLP8V7GxkODd1x5GYuQXbRJx17Qrs20+
   Q==;
X-CSE-ConnectionGUID: NA4q5LlcQYefz6If6Xt8hA==
X-CSE-MsgGUID: ldn29R68Rk2u3WUVGPKHvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23345294"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23345294"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 22:17:02 -0700
X-CSE-ConnectionGUID: u/Z/5CzPRFul12SqpQGxaw==
X-CSE-MsgGUID: ofGf4IJdTK2+9viTqK9Phw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="69172162"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Aug 2024 22:17:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 31 Aug 2024 22:17:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 31 Aug 2024 22:17:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 31 Aug 2024 22:17:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 31 Aug 2024 22:17:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTrZdgAG4ieHQRioHLOFSGQnPbPcyxu+gZXLZfqqAkL7NXUK+FPi4327KMRR9H83WwwGHfPFq4hebgncclRQRN1aLmou66nMjevXTkokda9gswoya/ezkEZNV5YDmShLuqz/TcKpEqVrYe2I7oTPxTSW8tjdfX7s8o19dVx/D2XXB+GXr7i3kZvKC21hnPNIE+zzIhybCJwcmduszOw2SwKd9jyBsqb2yvQeTYl3qG6cW+wlinOnlN8LGL21vZqO9acR7dYd+D4QcfDOSjZpFwOFVaHWQp9qTgXxYphFKI7KJTQv3ly6fhgvRI+bxvQ0CgTIs4d0ahgUxWgfMEE7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFliuz6JZrGgfpHvgEcPdqJUn+o5d6kj/60w2wr6Qhw=;
 b=chBjLI+++7D4AkZL4bx5kYanQUbo1qOIQqrNzp93JogKfd5noxjU1FSTte6GtwMHsEv3etYHogZ0+Hidb+b/94fQvpWY7XhV2VGTG0fwFLkyRPwDAbNBkebLmUmuuL2Y855enE0CVZStgW6T1WLOZPpAU86RFnmt6PMg61aDhbIaaYS+XQKS7tyGokShfeu/7D+eWfbwTyB4fkFMxtlcOKUr2AKGwXcDlw7dQZo3HveiYCTxSTSyaCvtaylKdNRqsST2yWLPpPW7/5wqh/l9ja6vIlYdlS7b/W15ms3ScVinDmsG8eMvLCFp3WoWFiY9wXELlmGP6J42FFj9C2Cgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB7478.namprd11.prod.outlook.com (2603:10b6:510:269::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Sun, 1 Sep
 2024 05:16:58 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7918.020; Sun, 1 Sep 2024
 05:16:58 +0000
Date: Sun, 1 Sep 2024 13:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: <oe-kbuild-all@lists.linux.dev>, Neil Armstrong
	<neil.armstrong@linaro.org>
Subject: [amlogic:v6.12/arm64-dt 9/10]
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:65.7-76.4: Warning
 (unit_address_vs_reg): /sram: node has a reg or ranges property, but no unit
 name
Message-ID: <ZtP4wlOdg0noioAp@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: e08d14fc-7cf4-4dbc-4853-08dcca454db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TEEvQHnL+v64b4UG2pnfG82LiaCnnoMljccW6Wi9sxcjgGgojuqPEIEHlnwP?=
 =?us-ascii?Q?DhyI4sPeHzICOJi95GqP3rFC4yGjOBg/103Ina8wYSztAttS+YtQQoh7rIL8?=
 =?us-ascii?Q?BFfm3Lf7F5O2bOU9/2m8YVQNrHK46T2XOmwHRyoLAlnqBMTJuPdL9zqAw7MA?=
 =?us-ascii?Q?4EjzTuBgxaKkvIUqFYrodYIuXz6umb22VAm7p/tDYeuV4SXxev19LMuXTln3?=
 =?us-ascii?Q?4/XWMM3D1LSI1XO9Fn7FyA1Hk9fDiRXJrKO+QMvmLIrMkwqihrqBePwJHFgA?=
 =?us-ascii?Q?ufPUIAmLEE93o0iOLotv32P98cujAqGqvdeCUjPznDzJFosKEvaY1nWvmMNK?=
 =?us-ascii?Q?hXj4eLTdOAZoROnCZ9SFnb/pyE4MDe9ZZZyEEtbiw0RF+2tQqqRYMkI68Thp?=
 =?us-ascii?Q?+iAzLon0Zmc0Nup8XMKVxHS0FM1uof9YWLLm0GszbqSrv5Of9GnYSkKoD2ns?=
 =?us-ascii?Q?Iu8VKz5L2mx/FShd9PcOsgUI281zzwFYxThl+wuxb4GiddxHyh2vQ8ZJxAqX?=
 =?us-ascii?Q?Hkvy6exRrtja2JnKcAwecDEtsn+pNiNem5DS3LDNFs6Rs4F6tJPku4DytGCi?=
 =?us-ascii?Q?3Qwx3A/9Gob+NrhrBolPqezwBk1mDDRziQLLM/oHto0sH6U+6HOFn0kF7UgC?=
 =?us-ascii?Q?6uGCcMsOv/ySD6UBokh2w2htXUOvYsK7zjgeZvj1lNTHzNDlEktTyWUj4wjj?=
 =?us-ascii?Q?T2w8irBqSCMsyZJ+Kp2P7mrNgCq9irQKyCg5D9HBAHDFZjQbROOB2QX2jY/M?=
 =?us-ascii?Q?e+m9g1qYBApp1q7b0SUrAM5DpoIZp8xqWSrFFqi2RjL/3iGNP5hvt1zuc/30?=
 =?us-ascii?Q?fVBbCFNMyepMT03Os23v5BAhCIiIpbsW7lJrih1YZHd5jkMKEl1CMV+gwHw1?=
 =?us-ascii?Q?6LBVqH5qvE/VlbqdiXe9AeZjKdEkRWxo6yXGphvFLoVasj5/6prbJsr7Rp/i?=
 =?us-ascii?Q?bpCNF533PHAHN+pPgV/NneVWyD2F/klVVmNlTvoioOjpd9/PSnfip7pXPute?=
 =?us-ascii?Q?m8QtiP76Ij/tc9OlpJkOuBPfgk2upDMa+cISWu0oLtXD7k5zJhQqSm2B/E6i?=
 =?us-ascii?Q?riwYjmlot1/OBzsAE6U3hy6BUY9rB+poJoEpWj01GcJlCRHykGiaAx2vYfbq?=
 =?us-ascii?Q?SWoXHyHv5Zd36bXngZdy7Bd+pG0rMX1k5ManXORwWx0KSibTeAVF7poAPxTQ?=
 =?us-ascii?Q?PFWwK70AlBDn+lhZujpmRQUBtNVWwZ62mZAZXb/RlcphkSI4DrVgkZRX3SA0?=
 =?us-ascii?Q?NByfQidkjpfAjPohMB26gYJM3VQr1JUowtDZ4b8tU21TWdeXwAfQjBrhp7xl?=
 =?us-ascii?Q?IaaJigs6qtg6fFiEjY/X01TH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UcVm+ULim0rgupOIqnZJf5T9z8FidRa3wPIeJD8DDZEudUYbK9XQfXMgHC2Z?=
 =?us-ascii?Q?c+VK9yS30j6kvDP1TojtDH2CjFEglPQ/zT/FJcF1JU7WU/NJ4QmCytPv7QYf?=
 =?us-ascii?Q?H8DwHvpXjxY0yMSziNivKiU3HP6C7sXlRXWqIWrGMwz0+yyNIvsZYC8XuzgB?=
 =?us-ascii?Q?uHwU9xf5yeI6V5H4oDMmlkxPsmQaAqoTon/ZCpsN9zHuals81XoHIE1JNWdh?=
 =?us-ascii?Q?ZATgZ0WeMcnRHnXbIRouIM4d2ZkLxw8ahPu40IaCE4hEkWoCva+VMwCOrLVi?=
 =?us-ascii?Q?dNCAgsUcAGl+LeMQxzVP+J+S6W9P5K1FgMgABmcada/+rpngVFqCyD6CqYRo?=
 =?us-ascii?Q?iL4dQ7wVy8vE6nEg8cwWFYsB3AGk8nQW5+nQScKmQF6lfB42H/PMWscJ+9Fs?=
 =?us-ascii?Q?3D82YDA+n26GHoln4Yh61jJ7uK7tRd00YsTtKyP1OwNSPeI2lXLJUX/14Smb?=
 =?us-ascii?Q?Ci3VCpGb0SueBnzylP+SmG6gh80gmofXwhVhaxz1lPCh/swKLKgMZc1XDUNv?=
 =?us-ascii?Q?Vs6LTJPPEH2VJBhaAdwAkEkdf6yR/hknSIOHHDGnG7MZSPhmtL8cQWxFBR27?=
 =?us-ascii?Q?KZY4PoPKYbsAyW6xwlL0biNwEXw0J983bQUXEVuka1HIwjk+dV2XMnuZJzNO?=
 =?us-ascii?Q?06Zk9+BWnwkSsjf1QXXKDWFi82zzdsCr04iiUBMzAbanEhZYE9fra4ua9ugx?=
 =?us-ascii?Q?9Z6PlHcNfz5Yg1Ww3iay9Rsv97Ddc3MSzF8iomi3ObPBUxJOpNdDuknWE87t?=
 =?us-ascii?Q?kLg7+j5g7lvcAgZw5PxKEKgdXxiSRdpAUI9xonEGgHVipzrvfCFlXrV4CMDS?=
 =?us-ascii?Q?0iCNzF32TsxmFzj5Y7hNAYQ67dJEVAl0hRmgjR0wt0JM15VxiZGQrT5YfYTy?=
 =?us-ascii?Q?QF2VmiQWcG+6euq8nnRtQwVcfUPwKlvZSEjRtznuxOafRM04U3kgekgJf+/m?=
 =?us-ascii?Q?cjiVTvTOprUyx8N5bX29IYE/Dap6TTTa3Wya4XwXMDGvFxjIBUkMzE6P00UB?=
 =?us-ascii?Q?nj4MdqmOFIbvcY10yZ3wVfUnHlAV958ksUb+IALo9e9nNQRKPKjlefbd8mVb?=
 =?us-ascii?Q?mjAlibKTS3PI1U6AzVEtBqeVCFtzP7KfnUI2ilCZmXuCyDzcZGeY4NkcQaRO?=
 =?us-ascii?Q?4yQ2Msb/JvqYFpRBuZSd2up4ClHF95ABfSkQX1xc6YCnHtyMsSwcdQAkJN3z?=
 =?us-ascii?Q?K/vGJ49gpCyC1zKmI0t5mP83xlOpFW8RUuAAEL1suX1XcpkX5s9ByOVHG3Uy?=
 =?us-ascii?Q?w9Cr+rlvz26s703veuClidIWI4evc3mpI3H0or3yPg5p4Dw6bW11hjIPHqQ8?=
 =?us-ascii?Q?QHhKg05nhfu9+Xu96suI54//vZAPYjNXlvQWm5FaI/+hSisaRWm0S6T22CVH?=
 =?us-ascii?Q?n1Z6qTZWNQ3O5a/GCcOrfLhrn077N9KWyAOdBqcAYiFMkkTw0IWMFN4hEHI4?=
 =?us-ascii?Q?/IDiACcZBvwWawD7xSlxbgWvm6SbeWDzOl+hXCWkJjzIhIdpWr3JdnYouqxQ?=
 =?us-ascii?Q?dcCsg/QAjx6U5njJLk2R61E6en/S1KQbEDCf5FAS5drNU13YqB4/DrisCjA8?=
 =?us-ascii?Q?T19WGZ4r66ZDCLqsbzaX51Sad/i5nsPnxiER7oDwmz+5s1kkDooNBZ3MskCt?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e08d14fc-7cf4-4dbc-4853-08dcca454db8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2024 05:16:58.7197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHkmGs4aa0Ww1ciemh1547QgdHhSy02TRdTebb+nxTqnZ+xUIKnD6FBlkYrOFqRgtfryr7+K7X/CuSuSrNt6NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7478
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v6.12/arm64-dt
head:   d4bd8f3023b68f72431e05ec6cbc793519b449cf
commit: 520b792e83171efc8ec0b004412b44dabc044de0 [9/10] arm64: dts: amlogic: add some device nodes for C3
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-003-20240831 (https://download.01.org/0day-ci/archive/20240901/202409010005.A7tSzgEn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010005.A7tSzgEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409010005.A7tSzgEn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:65.7-76.4: Warning (unit_address_vs_reg): /sram: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:168.34-413.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:168.34-413.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts:205.9-245.4: Warning (avoid_unnecessary_addr_size): /soc/bus@fe000000/spi@56000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +65 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi

02310be6f08007 Xianwei Zhao 2023-05-15  15  
02310be6f08007 Xianwei Zhao 2023-05-15  16  / {
02310be6f08007 Xianwei Zhao 2023-05-15  17  	cpus {
02310be6f08007 Xianwei Zhao 2023-05-15  18  		#address-cells = <2>;
02310be6f08007 Xianwei Zhao 2023-05-15  19  		#size-cells = <0>;
02310be6f08007 Xianwei Zhao 2023-05-15  20  
02310be6f08007 Xianwei Zhao 2023-05-15  21  		cpu0: cpu@0 {
02310be6f08007 Xianwei Zhao 2023-05-15  22  			device_type = "cpu";
02310be6f08007 Xianwei Zhao 2023-05-15  23  			compatible = "arm,cortex-a35";
02310be6f08007 Xianwei Zhao 2023-05-15  24  			reg = <0x0 0x0>;
02310be6f08007 Xianwei Zhao 2023-05-15  25  			enable-method = "psci";
02310be6f08007 Xianwei Zhao 2023-05-15  26  		};
02310be6f08007 Xianwei Zhao 2023-05-15  27  
02310be6f08007 Xianwei Zhao 2023-05-15  28  		cpu1: cpu@1 {
02310be6f08007 Xianwei Zhao 2023-05-15  29  			device_type = "cpu";
02310be6f08007 Xianwei Zhao 2023-05-15  30  			compatible = "arm,cortex-a35";
02310be6f08007 Xianwei Zhao 2023-05-15  31  			reg = <0x0 0x1>;
02310be6f08007 Xianwei Zhao 2023-05-15  32  			enable-method = "psci";
02310be6f08007 Xianwei Zhao 2023-05-15  33  		};
02310be6f08007 Xianwei Zhao 2023-05-15  34  	};
02310be6f08007 Xianwei Zhao 2023-05-15  35  
02310be6f08007 Xianwei Zhao 2023-05-15  36  	timer {
02310be6f08007 Xianwei Zhao 2023-05-15  37  		compatible = "arm,armv8-timer";
02310be6f08007 Xianwei Zhao 2023-05-15  38  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
02310be6f08007 Xianwei Zhao 2023-05-15  39  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
02310be6f08007 Xianwei Zhao 2023-05-15  40  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
02310be6f08007 Xianwei Zhao 2023-05-15  41  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
02310be6f08007 Xianwei Zhao 2023-05-15  42  	};
02310be6f08007 Xianwei Zhao 2023-05-15  43  
02310be6f08007 Xianwei Zhao 2023-05-15  44  	psci {
02310be6f08007 Xianwei Zhao 2023-05-15  45  		compatible = "arm,psci-1.0";
02310be6f08007 Xianwei Zhao 2023-05-15  46  		method = "smc";
02310be6f08007 Xianwei Zhao 2023-05-15  47  	};
02310be6f08007 Xianwei Zhao 2023-05-15  48  
02310be6f08007 Xianwei Zhao 2023-05-15  49  	xtal: xtal-clk {
02310be6f08007 Xianwei Zhao 2023-05-15  50  		compatible = "fixed-clock";
02310be6f08007 Xianwei Zhao 2023-05-15  51  		clock-frequency = <24000000>;
02310be6f08007 Xianwei Zhao 2023-05-15  52  		clock-output-names = "xtal";
02310be6f08007 Xianwei Zhao 2023-05-15  53  		#clock-cells = <0>;
02310be6f08007 Xianwei Zhao 2023-05-15  54  	};
02310be6f08007 Xianwei Zhao 2023-05-15  55  
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  56  	sm: secure-monitor {
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  57  		compatible = "amlogic,meson-gxbb-sm";
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  58  
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  59  		pwrc: power-controller {
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  60  			compatible = "amlogic,c3-pwrc";
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  61  			#power-domain-cells = <1>;
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  62  		};
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  63  	};
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  64  
520b792e83171e Xianwei Zhao 2024-08-30 @65  	sram {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

