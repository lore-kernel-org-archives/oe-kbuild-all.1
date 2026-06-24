Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9DD3264D4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 05:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280382; cv=fail; b=hvpJfraiBCnEUXNFlEGIArNtnR1goZMYtKjNOcFcbnZ/a7oF+rf8qh4Ecnsq7bSAgwnXHtXlUgBxW4FS7HH97k7iFglUi/zkkQvOr23sFSq8KFKeaLIDIuQ6eqU0FRGb7UAXFcOoDev+ywY5yIudjQU3VV9fCPp+10/ndVC14Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280382; c=relaxed/simple;
	bh=/bOfPNW1C9V1Ycv0595QoXUsQMCojo6ftrcrWYSzHPE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=KwTFAS7WxjlDAVq1htlpU5u3iR+wGquJIrNAoDU2n6AFNd7dZqqt9msYO3xgNY1Tsu9UPUr5aGpkdU3zhDHBnRfp1X1jQRFIzFsbIrZXTADdats14/8ALJraYVOrxoGYZATLJ08ujR3K4hX1HNjzs9AP+FXUx0PmkVcPyYEUiLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmYLhXNX; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmYLhXNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782280381; x=1813816381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/bOfPNW1C9V1Ycv0595QoXUsQMCojo6ftrcrWYSzHPE=;
  b=CmYLhXNXN1m40OpvGlIrewxat/mGaHHDqAyATIMajpSCtczwdj/bv27w
   gYiePoBT9A3jvSoLmCgmZ3Hib0A8f3aY2GHoGFyb/gECdsrWz97S8DcA7
   vw/2tM+8kjkQs0qp9VDu9IBaJRiWSjHaquWcDHser1QvESnh0/NISrbYR
   W5aIdm1P5qxHzIfMAZSR9BU1ey4ICZZU7WebXfQ7OP1IBzzYRG636lH0x
   o/EdK50GefsG3S3qb/46LQHc1sn8SlsXlsAN92k6/2MrqmRXqrNmdnsTb
   i0YdGngc5MLEEtwz4gm8TjotpUIXtYZHe88LqB6xG7cP5hXfMVswnv2g5
   g==;
X-CSE-ConnectionGUID: xarkxYtERqKMkw2piWcZkA==
X-CSE-MsgGUID: pQ33T3FfTOK+YZGBMQUEgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82147816"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82147816"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 22:52:58 -0700
X-CSE-ConnectionGUID: pAePKjluRN2E7HqRMZhiFQ==
X-CSE-MsgGUID: cfvK54QMQUuMVVjnj0OfDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249583246"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 22:52:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 22:52:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 22:52:57 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 22:52:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgYXcdV+mbRsddK7tx5WSuC9feBU6evX3n0+LCpw1EGQuCQyyeeT6cHoEPBYQ6Fe1JgdWowBcD61uu27B2q2EUKMGEjTyH4Yd66RAA6cOIEhl6tW1gXbrKS1zVAOofhaxtd1vNart6MmqdcEJl7cPuDbMM7rbS69ahqvwgwwvpSZ6n0rh1ka+2aJkXGtTEmHBmHh1DDFvb71hnlrh9yXq9BDXXa8xawoNYC4kRoEMiDAwlmdZrTR/SHIIZHxqGQmGNKbEqIPpO2tQwJduz5pNu9OJxdXUg8OSLwxZj3C/D4e1FmsbXQgmD/9G9mWYT2aCKoXhZ4X4wCOmd6k4zPM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpNiyqynRNra3e+gn1PU03uyeS8N9ttgLKFFiY50nUY=;
 b=HBDN00YaVB1r1ORQlrtW/iTfPwXfamgRRdWkH9e2tyJi0HZNdFh1gheLSz8rUXEcIVkZVmqiw4JZxT3Y1aiTsPex8ivWDpftN+Kq08e2jNnxumUpHRRl3My4H0Ld3jG3T7DOFW8i3UPmXdSdUf2PsCwnHd7cehPiBJwPkZzfXe3ulV5CyZNCQe0EMAH1dPc9vQKQNV6CtyrIDRlVFeMbxFm+H0vCWQjvgB0jn/28Shp8IJN5AhcKk+7ycf26OFcqljVu7hxuI2lu9pnUKmZedr+9EKDIEis+kg40sFFL1/jk/QNqolzK/PWOdAqg7Df07PE49y/h7TkgdSEjihU7Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3493.namprd11.prod.outlook.com (2603:10b6:a03:81::16)
 by SA0PR11MB4606.namprd11.prod.outlook.com (2603:10b6:806:71::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 05:52:50 +0000
Received: from BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259]) by BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259%5]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 05:52:49 +0000
Date: Wed, 24 Jun 2026 13:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: arch/x86/boot/compressed/acpi.c:25:1: warning: '__efi_get_rsdp_addr'
 defined but not used
Message-ID: <ajtwqbmk43t0iGaA@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU2P306CA0042.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3c::14) To BYAPR11MB3493.namprd11.prod.outlook.com
 (2603:10b6:a03:81::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3493:EE_|SA0PR11MB4606:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3b0d0c-535e-4ce0-31b8-08ded1b4d2ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 3DSUfYIuDPnYGhZBupTK5pztvHjtS9VB0mnKKgzAv6C8qBMcG8o/0uHsz66IMPoT7NOxCxxvxI/LCcayjdiEpyN2qrFuYIWYL0oyvh2mfkA9QRy2G5f1hsbM9LpJ96s+MrQtm5A4PoORKKUvkPKfCnAf0HDAWOnom6ieJ1gdNzD08491GmxZ/nDQoVjUrDdkHUoaod97vLIQFFhKbl5FqhaP6NLZVe7lu/rBe/LRGaP7hsZHfw3Nwtw5yuO/Laj19/r7QPVMzSVvuIT57RpmL1jBfyWcTY1stSZecVu1xHxk9SwGXZMDUi3t0g3Vv4KR0pGM0JiSXDX3do3MIILEc0WpcMp9uqIKUuOB+jqlM6lRfemTYR4YjiXgzQS1rxUFIVlDbEvE2avv6vngoD5suEhwU/DIkdTvekrnsI/8rFMN46lfLcCOT4xoN8amvf7p+ofJvHBfuZ5WTD1e+laJ2zcoefA8cxyNXpy+wq50CmgvId+FGKFQmANqk1S5o/uAf2zZi6ymaMKAtPwuMCUYQFCmSRSx6lMqNAPultzlX4pGch2EijYplgAlgDIjc7RTxZbP6uegYMl3gjJeR92oxuwezlx/x1+itOQJhlcS4MuYLWBor9O7SQY+m1FXnPzmsiVbBP2uxeDLYYz6URsQMOVxZo0roY4gPb2pKdTxT78=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3493.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eOEbxjb+EeRrcjaRYiey9UXuT4DZiUU6jMUgFFHgi7DTWNEFEs1C/jh4Bk2P?=
 =?us-ascii?Q?Pg2KbQDPIRuZCdjLt3Z6fIPoivm087gEHkQdDIB+NJCW+H0tKJDjOnSyBhYg?=
 =?us-ascii?Q?8VDgBsFdvRUlOL6PuoLYWwHrpeaYFxg8Zs6v3vCT3Dr7l0g0//uSEcI5xeVS?=
 =?us-ascii?Q?faEQm3tZir1lj2wsT7+IT1PnbYbQ0mMwQFczofFPrx71nTDqmFMfbRLf3mOA?=
 =?us-ascii?Q?93oQq5vICCwyLc9TsR/tMQ/foEQPFGF24NXYW8Ncmrz3ASvUDyObX8cGYZFn?=
 =?us-ascii?Q?jtdefN2GS3RYfSsA5u7Da4gD2OApeAr4nTJJPRgDRmPYbaeHRoh4FUFmA7Fu?=
 =?us-ascii?Q?3CmuBPcwB8usf897lxBoVu9suQCNhEui7AJZXcuB2mRnkA26NZ10/vUEBHb6?=
 =?us-ascii?Q?sj25iZvua3oKKVOhFcSJd/ovSL8sX1M8+O6cN61t5JR3F+n8PZ9I7J2va/HC?=
 =?us-ascii?Q?XYGd8vzdz5ZtVR4KHGvfWHOT66YAtooO1m2K707ZYUvNFewMGXlBuM2fVMOj?=
 =?us-ascii?Q?BIo9mqEq97qd+NdU+FjQVnBNm/PpgmuVLbX2/DY2asZZYndmSfPR3CuxXIF1?=
 =?us-ascii?Q?Z/uNLfHaF8VWfVhqrYdzNo9uqbbgpaTYy+0WH9PqinwQCWDptre+K+Wkrggh?=
 =?us-ascii?Q?OVIZORAoiDeGZS34i20tOe09KMB37Lv+cW0k8+VxuHkBkb38c/4cH26dANxI?=
 =?us-ascii?Q?Bnw9Gy+7yXM9rvGakP3uULINuixGF8nMamULGZLcNVJ8z1aF3Jzz525XjKiJ?=
 =?us-ascii?Q?Wbiejo4Kj9fTeDJsYV2c5hLndEamSktpawgzoRWuLSoDxMAEs5nITsqky6FZ?=
 =?us-ascii?Q?mV94m/9BtWxFeNK0/a+P/nLAdGu6eFwUqEPdFJZJZif3YSo4kS9t9qwh5DO0?=
 =?us-ascii?Q?gZBhXUBjdzbMZ7GV8QVN1T9+fyyi/ZyV7WQOsqMPfpUmZDCDkYljn7cZpl++?=
 =?us-ascii?Q?4/vLHt1iylSXChgikCoDAhvYDwOq78YpJ/dVucyNaA+FDfWBvtgZ+H+XRkFI?=
 =?us-ascii?Q?KzRE7LpcAe+8Dj8mvGeQRAPPD+GxVVluwlh6BhMrAIBRn6rwJ9MatBqbvJ5H?=
 =?us-ascii?Q?Yv2iS3NrkmD0TSND9nCeCgzjVq6Qm5ytNn9wy18X5sxId/HHs4VA2icvjuZE?=
 =?us-ascii?Q?LnzRIPe6nLz7kyi6BqECdyMI9/IGuSHDDm04t1qY5P2Z+hoiO/ZcElJGRn2A?=
 =?us-ascii?Q?0CfMglUxQSTpYWFVDxxYAN9U9v0u9uWwph2LvpKTLSjUrLbvmVVDp5kLPluH?=
 =?us-ascii?Q?ph90T+t9NLQ5sYBXZuMMMMWRsfCjxz+v0GHz6jg8JmJlMzoCvbvzIRCQk7g1?=
 =?us-ascii?Q?t7OuF9AgrMWrSDKtCzXnmzb4vjn44dyCzpVYfVFszMHaeNillINpLQ3JbAp6?=
 =?us-ascii?Q?IHnxGDx9AIvxusAB4bWAZ19jnbYXyuiApH2oL419Dvm7GrwAxHQGmqylTfDD?=
 =?us-ascii?Q?KxksnbObHpi4MMSvqav/8MIJ3XasssgIMe3yErdA/2Cve5Tz7XPjeS2crIgk?=
 =?us-ascii?Q?Ucgko4F8Q9iNx6EwQCFxii1btG7Q+MPMi2VXtZHr2h2yrhov49YCc9u3iWzC?=
 =?us-ascii?Q?jvrs0o54NViEQ6NdGiTMZm8q5X/CE0j6rBDFjgBQ66p6ac3EiCzd0hcP6Cx2?=
 =?us-ascii?Q?oznwft9+/bT6chtQ/czmfe0A1IFjWRB3pFAgE7X0XqvOVa+r2iLbZYb54FU6?=
 =?us-ascii?Q?lmBRrvqrmFrzwCrSwtXiBkIYS+W/nOcnAyRt42aOPU8ZSWW6WWm/RWfQfJQe?=
 =?us-ascii?Q?0Fq37oNc/w=3D=3D?=
X-Exchange-RoutingPolicyChecked: MA0XRGNsszdkDXYqJRbd0hAG03V3abqcWyWXOOz0QEKN57AXcuzxkjT15rbLsP4hRiucRPrzfy6xL9L06RTdX8RdYTU1p9vlt1pJZ6oeOls3/8W8il8YoGAIjb/Q8YM/5aXi/VbrsW3X6yZOOTPmO4bina6Wm4qZAeekaw5Bd4l8q/Jt9oNwPEkdwYteAKyD+E6jH688rnmtHgn5obeat+aN+mW91p478IkDZqaWdaRu7rdcNoX/uytjsuLSSL31rasEuksQ7/JL4kmh5GTsOADT2V0NrWNadtjafqY6E1kopNMFkMPTa3vtIroZfnWri7frEy2afUUlrb2BGsH6Ug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3b0d0c-535e-4ce0-31b8-08ded1b4d2ce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3493.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 05:52:49.9000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: topgA3Bnk1NhRpl/ekqiw2H7z0SnYfhyO07p9xMRspfQujOCyLcQ2kUehy0Dvb4iWUc97jvxzt3tq4pRvztXtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4606
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Thorsten-Blum/x86-boot-compressed-Remove-unused-variables-in-EFI-helpers/20260622-190409
head:   0836935ce0e87c942b3f02ea8c134c1116593ebc
commit: 0836935ce0e87c942b3f02ea8c134c1116593ebc x86/boot/compressed: Enable -Wunused
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260624/202606240416.cXegPpiJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240416.cXegPpiJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606240416.cXegPpiJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/boot/compressed/acpi.c:25:1: warning: '__efi_get_rsdp_addr' defined but not used [-Wunused-function]
      25 | __efi_get_rsdp_addr(unsigned long cfg_tbl_pa, unsigned int cfg_tbl_len)
         | ^~~~~~~~~~~~~~~~~~~


vim +/__efi_get_rsdp_addr +25 arch/x86/boot/compressed/acpi.c

02a3e3cdb7f12f Chao Fan       2019-01-23  23  
0a23ebc66a4678 Junichi Nomura 2019-04-11  24  static acpi_physical_address
dee602dd5d1489 Michael Roth   2022-02-24 @25  __efi_get_rsdp_addr(unsigned long cfg_tbl_pa, unsigned int cfg_tbl_len)
33f0df8d843deb Chao Fan       2019-01-23  26  {
33f0df8d843deb Chao Fan       2019-01-23  27  #ifdef CONFIG_EFI
dee602dd5d1489 Michael Roth   2022-02-24  28  	unsigned long rsdp_addr;
0a23ebc66a4678 Junichi Nomura 2019-04-11  29  
dee602dd5d1489 Michael Roth   2022-02-24  30  	/*
dee602dd5d1489 Michael Roth   2022-02-24  31  	 * Search EFI system tables for RSDP. Preferred is ACPI_20_TABLE_GUID to
dee602dd5d1489 Michael Roth   2022-02-24  32  	 * ACPI_TABLE_GUID because it has more features.
dee602dd5d1489 Michael Roth   2022-02-24  33  	 */
d55d5bc5d93774 Ard Biesheuvel 2023-10-17  34  	rsdp_addr = efi_find_vendor_table(boot_params_ptr, cfg_tbl_pa, cfg_tbl_len,
dee602dd5d1489 Michael Roth   2022-02-24  35  					  ACPI_20_TABLE_GUID);
dee602dd5d1489 Michael Roth   2022-02-24  36  	if (rsdp_addr)
dee602dd5d1489 Michael Roth   2022-02-24  37  		return (acpi_physical_address)rsdp_addr;
dee602dd5d1489 Michael Roth   2022-02-24  38  
dee602dd5d1489 Michael Roth   2022-02-24  39  	/* No ACPI_20_TABLE_GUID found, fallback to ACPI_TABLE_GUID. */
d55d5bc5d93774 Ard Biesheuvel 2023-10-17  40  	rsdp_addr = efi_find_vendor_table(boot_params_ptr, cfg_tbl_pa, cfg_tbl_len,
dee602dd5d1489 Michael Roth   2022-02-24  41  					  ACPI_TABLE_GUID);
dee602dd5d1489 Michael Roth   2022-02-24  42  	if (rsdp_addr)
dee602dd5d1489 Michael Roth   2022-02-24  43  		return (acpi_physical_address)rsdp_addr;
dee602dd5d1489 Michael Roth   2022-02-24  44  
dee602dd5d1489 Michael Roth   2022-02-24  45  	debug_putstr("Error getting RSDP address.\n");
0a23ebc66a4678 Junichi Nomura 2019-04-11  46  #endif
dee602dd5d1489 Michael Roth   2022-02-24  47  	return 0;
0a23ebc66a4678 Junichi Nomura 2019-04-11  48  }
0a23ebc66a4678 Junichi Nomura 2019-04-11  49  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

