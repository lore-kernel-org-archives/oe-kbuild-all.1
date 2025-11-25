Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E1B16A395
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 02:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764037682; cv=fail; b=Hp6Ihi1BE77/Qt+i+FgHW6R6TH47O5GxDj5Z1ht6Q9snFgiKqBla2bnPQmLtoZjygfWkGJgQRH1f1Hbq1RNuGvzp0KD+ttRULn9Lo+9MyQSvSMIsAa5i/sCWJDVqF9vZAEnzhf57EkitfB5fUM5UgJaA0r9bCUyEO0nBmJ5TtG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764037682; c=relaxed/simple;
	bh=uElz84gPR52VCo/OwK4Th+SfvBaZaBFFTCYXuc2KiuA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=MCbArb5f4J6ssL0mjPNbnz/qfXAe7kpnJFpc2Q/tI1qqFO5PO1WQXKqSHHRwU/LEU7pa9LzG+6UNbbSR0/ms9CFn1Wv+RCdTFffSsOclvl5aNswJYb+K+upqDYqHsVKchdjzfDXE4sdSuRV+/qc2jPhtBsnCTDW01bRXSWZw5Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtqvoQaD; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtqvoQaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764037681; x=1795573681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uElz84gPR52VCo/OwK4Th+SfvBaZaBFFTCYXuc2KiuA=;
  b=FtqvoQaDcCQu3JgJ5YebO/IEOtd4R6N2PMRmeXxKJ0pSzUEeyZpH1LUq
   ViNttbRuR6tHIiULRYA3jG7aBCClB0pGsaNEro2Bv91jI6yF4+RGQFJro
   h9MufwugFfFesaye2Ukry5IF7ZD0Sdaql4fEpK9KvEvkrt/ibuDXchAHA
   gI+XSK1BzBHr3gIA1Is/+tHe2HleDIn93aB6zzGPULY65CHwM0i2+H73W
   7/oyIDxEIHDFg4nkpiQ3SShxwXSGgMlkIz8k4auvAlNLEZra9ujrBrZdG
   PzMEB7VokHHV96MApXOIyaSwIceaYSKtjs+yzx3xB6EtjObSWVzk50Mx6
   w==;
X-CSE-ConnectionGUID: YxkanelvQwu+6S1b2qG7bw==
X-CSE-MsgGUID: AysVLjy9SCeDEISmI6mvyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77524822"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="77524822"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 18:28:00 -0800
X-CSE-ConnectionGUID: oHF/8DlHT3a1WVXS63cYVA==
X-CSE-MsgGUID: iAu8n2LiQTiQVpA8NnkHLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192311309"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 18:28:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 18:27:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 18:27:59 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 18:27:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OT2jUNnQt4WZ+XIMyRpL9+H+6rjAA7dor/lwiHC5SbuU0qxn+7R1acF9jSN2KuDV+pg9xzU1LHPfifPtmEvTuIIl+e1aVXcaIvcnQI1F9vkImN/R2wGTID1OaqLq6iZ2JLIEyy1rFeCNZkbm+OzzEfWSAxfiWqqp93cqQ6DPLkLK81MDNtjIrKPwynwmqWpU4C+IAhHhjKbFp7qOR+Phd84ZuTv/bjD267ESLr7BeEYMqLBVsXzik0ZCXQJM8fVM1EPs0Vbxx22EfSLkiuHBlJcilyEj32nh4c5BwnV3VVpJLMPVcvXyYk9ehPAhfIrbJ/TDLKFo5LbLH5ClxMHd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmN+HmhGVYXhRSWVHIMKDlwci9kXnuaYSnUvwgCUyCA=;
 b=oDZV3YQzCEsckxmT6DTFGs04WI4z5fQ9WCf9f2B2xf9QTWfI2MWBIhfkyelqIHH0TjlgtStmlDD/PFru/mpC7CSi6Q4upTAMQe0rhsjIiME6dgs22vUYlw19OPe0B+365V4m7Oo0/3FhcmviwySGNa09+ZC92FrXgXOoqSeHML6wMtVt0Fq0jyDljgbSa4mrIQp36moOTxISY1vClDasj4hrKX+/VqzH297RfvLnOU/PnMfwnwanEAcXkbh0fDXzp7Qqcvx+1v1cFcR1LKDzP46CbCe9obL9FIR6bXd722GoiOAqNpC4h+HxKGt/d/zpdWwqec1KYeZS4666AQvVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB7895.namprd11.prod.outlook.com (2603:10b6:610:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 02:27:04 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 02:27:04 +0000
Date: Tue, 25 Nov 2025 10:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [kvm-riscv:riscv_kvm_nested_v1 14/15] checkpatch: ERROR:SPACING:
 space required after that ',' (ctx:VxV)
Message-ID: <aSUT8nI9+wwdG4nZ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CH3PR11MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d44ff6e-c4fa-4253-5586-08de2bca1fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?al9bCqRZyiwaLBPLkmAc7Bf75+Pjnz5x+QZoTPVEh248kpU80buEiWpaC5xE?=
 =?us-ascii?Q?sbmBI4rSNDDQGqrGn4QYeTzhLqAj2g1C5JSyY40aQLoAeLLd8WLmXuf871v/?=
 =?us-ascii?Q?RHjDv7ATFBXXuJccH5W40bm/qxCDE26d95163bz5HEWbKyafW2d9r4tBROt2?=
 =?us-ascii?Q?9BrchPKI9piNAUwuDs2cyKm3WcKBYNRn9n0IwLRHMdrCamWkhs7L9VA90q/T?=
 =?us-ascii?Q?toVhWC4UgRDsLntSqvfPc6GwFuE/C/se4wtOoyWbrZOkKPtuJOQvP9tapFVp?=
 =?us-ascii?Q?DcJyWukoLxYyTqh6tq+L39csANcAZuRLVNtWQfI0emM04u+FxRy7Y1A/VSaN?=
 =?us-ascii?Q?wk7qpoYaKpz5SuSYQhv/LaeB2QyXS0a2DeFTzOeK5vM2l1le5U3z7oJCdpVK?=
 =?us-ascii?Q?45DJJFYTb9knKTBjZbi7XlDCq6IPXeCbrqRVZ+HPRYuYpUXhTghMyzTUyIia?=
 =?us-ascii?Q?kgJpfUbSI/LxTh7BoBC13FY0+gM5be0ZYNGxCpBRFAHHR4mFf8/UH6c6ONDZ?=
 =?us-ascii?Q?brGMUOC2TsBgt/U/Fe/NI3GnIe7NxeC62zKX5sHtP00ocgWqcdt327o9d8n7?=
 =?us-ascii?Q?9/Mwuc+opOtC8G1jcLiworCjZHR37UFwb9dIbXmL9U4clGr5mkgHkjSFm3Zq?=
 =?us-ascii?Q?C5j0xEYn42DhtKus2xut1WEEqTViEJdH/d282/YVBsDnvC2G/GDUkILnE0tg?=
 =?us-ascii?Q?z7UQYJ2aJxlKXVH3hGMsKwjZmQtIVcKOM5Kj7/JLYuVMMHUYPbiesj/eZ3sO?=
 =?us-ascii?Q?Off1zCjZdYXuA9AS1N2RnNb6M0eIUB7quEruEwyfEugYaxQZZSplDS5bj02Q?=
 =?us-ascii?Q?Jnr/dVCbCFUMP++mpjhY2TuEFKbXM4yUwtMhslAjyJjHwLjvfNH33MSx8jQt?=
 =?us-ascii?Q?eKGLuRTnHqWnjN8qp20ivHic+ERabZ8/dW3TD/ssfzfhocEaNwA82fMu1KdC?=
 =?us-ascii?Q?QQOJsY8ZVnvlPPwte/6NkRMO3BssCaF9RJ+x44xGk1VUUCSgMThDQn4ung7p?=
 =?us-ascii?Q?4fs4tP6ObxGTRcVICaFXjGJAkMSi05yAs9U1fOR+WRXTlul3A3LOdYFmdtRj?=
 =?us-ascii?Q?onOLJHCUyu4AhtCq+s0MP5vfaILF3OKC5c3JtEDaYgHSAWCyyoK4jG2JK948?=
 =?us-ascii?Q?nE1eyzkLa6qzc94u9sP1bQPBTPpoikisnV2+8zOK9eQCDjrWb+NUA3Bfuh0s?=
 =?us-ascii?Q?5J4UFgihDtb/wIHLtmTvveyavScA/NpZAwMJpQuCQjIPQsx4TvyYJyCZvlIr?=
 =?us-ascii?Q?wu6RjzBS6ESRo/yr2kCHcgbLT6QSMrs7zAyL0KMJ8jRNtCTweg3o3x2KevXT?=
 =?us-ascii?Q?GpXI5hvIylOB/9FfVx1Abmn5P5Gy4D1jSBZBg0sgadvvcnAEjgZH3rtwniUM?=
 =?us-ascii?Q?56GxPZtmh9bjbCeruiBYEUDbsePV/8OBCQivcTlz8nvLzSXkmb8TXvMVN/e3?=
 =?us-ascii?Q?QMCBy5el1q7i9jWQN0Kc1vwejp1CvILjjaiDgj8s7l95K0sr7EkU0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qITimLp5GJ4eoEwFPylHD7Yz9flgqglx0XFckdx2eXdWeZaWyeI9Yyk/aPdI?=
 =?us-ascii?Q?kDKukAI2s+F0YZYu37Ew448bIpvaV119NnxNacP3738aGRwluiM1BqJPMeOc?=
 =?us-ascii?Q?CIwkaMzjgwLvTML0wRI2+cTqja2XnrHz1cou2OnthUC2TcJcmLapQN/XFICc?=
 =?us-ascii?Q?+otwTyOhEWhwe6B0hWcoDa18mwHMWhpS4SZ/VUBMua+IVyJXYQwVasCLzKSc?=
 =?us-ascii?Q?SUkNaLNWVyxLP1r9noDzjM/9HaVpu5d6zR01nfLFrfq+rdgkqvtmXeKnyceN?=
 =?us-ascii?Q?kVJjTkF11UIz9VBxECjUZsrJmvYJHO15RySjbGB+GaiJSKnj+BwaTO8XBj5V?=
 =?us-ascii?Q?SejhGWWv52FJdHeBLOJOlfYx+5o9hnkd66BuEVBysEYxcVJ3TTxrpDSiYAdO?=
 =?us-ascii?Q?M3ONT6LBxYoC5kc3p403APVI2ohvQy41syG9c9a5hFciUyseEZnG2396HqIc?=
 =?us-ascii?Q?Dt0NMKFyOykGJkRjkI2sav3Icy1hydvIcLt4WIvxMZgZJzoCcviyUn07M4Tx?=
 =?us-ascii?Q?ayJrbbr9tpQfFBuErTF8QCzpS3/PB9DZsziuDmgmeAn8SB1WRPWepBtkOVny?=
 =?us-ascii?Q?UXzDLFxFpwiFpDZFqaHSvSWxDE5SllNEqPAycxTBzDnkfBJbD6e6GpR7DcZP?=
 =?us-ascii?Q?Dgl9q5Vev0qcjcMfjqGFuu/BOJsWwDiSDYBmMp0jQtVlPK4Fl5ZmwpBWy0Yj?=
 =?us-ascii?Q?aqvqgK05eJJjoxCSb70Ck6nqEgJO2MCTmYZ8IqeJi+r++X+GtRmnvWtzpZWo?=
 =?us-ascii?Q?iMR3vlxQHTcpuzo2NHRzz1CG7k17vxneJ1YnQ3DoRXeOsgYUFsyCcI2bE00a?=
 =?us-ascii?Q?iuYFaarCo5vjQupwIGVpabpXN0qhadI3GUqcR5fXGkhzW7v6eJRLyJUCfwSy?=
 =?us-ascii?Q?3YSrzOGWDiht5ilum9ZtDeBDj6JTFE9HjSdouUUmIc8nOsKmIeh5ceshkldO?=
 =?us-ascii?Q?kwm5zKME4oJbfNLhkkwd1Ji+yn/sgwL+onMqXoE+4dQEyP/nzl9IbeKx5vfh?=
 =?us-ascii?Q?XueYz3vSOFhbASwwsBHYSizhMj+GMYhG/yLuH8UmfQS9dTTo0oMwBs8VbSHM?=
 =?us-ascii?Q?SZ7sZVyxm1Qq48ppC7tXQJrAlW7BPevPdpzfG1hzmmNYtlTcyHL9xPuhfpsk?=
 =?us-ascii?Q?J9+Gquvga9XPBO3/pI93CaM2HGDTozLVUff37GOZu/D7fKpgmNXG/5W454V1?=
 =?us-ascii?Q?A3gWoA9hL5T5NsCF/PqAhn12sRr6M5+RM4y0iZnN3wGqLzo2f2FS6s3Pp36S?=
 =?us-ascii?Q?ZKUp+o0mzLD5BYegc9kW2mVWIoH92yJ42xwpX0skVfZ6mlOU8xtgXYti7kTC?=
 =?us-ascii?Q?ByCNFGKtITG6WbmAMXT1kshphxSMtQoDxXmIkNZKHNPrEJkcubrP/Quq4S3+?=
 =?us-ascii?Q?fivHjAyiME6131sjpAFO1ouXqBfwMzdONV/QO55Bl/ePA+q9g+QuFsVRypAE?=
 =?us-ascii?Q?pjNbKtVUJ/hZ+Ch7SVmqywEHek4Et1E4N06oxAmWMDt41OyBYRfX9JJ+sHVA?=
 =?us-ascii?Q?ikdIkh/x7KboSex4TqMJDzJekD0wXUA3TH/IR0TBKkGHObbfk6A2SkkcJTyz?=
 =?us-ascii?Q?/gAU64K4laYfKYNQVuPIwkUxDu9NRSIO/V53rII3NUa1enm0otdX4EI+Yfd7?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d44ff6e-c4fa-4253-5586-08de2bca1fa4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 02:27:04.8663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyzx2wm9AYb/DpOlrwcOW2ADz4oMJY3lyUlAgwnmyUob7dl+fbEq7hvgNEc9lfqAwrqUS7PSY8VOvMTHdlKgqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7895
X-OriginatorOrg: intel.com

tree:   https://github.com/kvm-riscv/linux.git riscv_kvm_nested_v1
head:   ee90dd59d6044feb99891c354aac47218dd3e941
commit: 6e5f032951fccd717d1e5b7ca967d6fc20c8bdef [14/15] RISC-V: KVM: Add CSR emulation for nested virtualization
reproduce: (https://download.01.org/0day-ci/archive/20251125/202511250046.Tz9Tepyg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#148: FILE: arch/riscv/include/asm/kvm_vcpu_nested.h:95:
+{ .base = CSR_STIMECMPH,.count = 1, .func = kvm_riscv_vcpu_nested_smode_csr_rmw },
                        ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

