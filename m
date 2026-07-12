Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8C71A6807
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783862499; cv=fail; b=JttSC/2i+gCGP66ES5pVyeJ3fBOVkIA65uAvmN+zRIwOM6a2DjFzL5JuFxd8UQMVnHKES1KlTUGe18vtMIWRvTyOy4rKTIUZA1f8vnqtfwAflKOBoXzi/frRt/EHb3nARE+goKI4+nip+C3puHdtvKa0YTwoYJUl2nxoXc7t91I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783862499; c=relaxed/simple;
	bh=hBaOAhoTaHgucwM6KrXrxxL/77PXTYAIv6ijuM7eWiY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=k47A/xA5Er2BN1S5OsfRL4pOD7OYRimMCLarOQFaEp4ELxs3EAo76plhOG+cNiWUzPU3X8TnDvouuxpRqnrp0nhxi2g/DKG7LRtVETCqLsEeEEat4SSO9rAZJ1FdW6zeFd0PDJgEyeZIj23QNs8YEl+6yuqEKe1bxz3W24hRoBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvlF60Xh; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvlF60Xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783862497; x=1815398497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hBaOAhoTaHgucwM6KrXrxxL/77PXTYAIv6ijuM7eWiY=;
  b=fvlF60Xhbxal5c/HV/bz14+HcMJkHpP9UlsHjiun57lYlRY41PT1iFxk
   Zat0Gh72IG3BdtSMrdYqe1YgimwvMpgGud8xKIn1qNAHCT6aBziNMYYo1
   l44C/v8ehl44/puTrywVOjuYTLZoYOtrDz4I/96wzlOR0usO+1RmOgmpn
   8KAqZYzpeiHln+y/XvdvHrO3YC74F/5DcgWM1lwD6HJl4Rx8tLohC1ANE
   ElbZowOP5WU1k6Sztm0WrFd4pzXxAwJESVpvmTLmyjWQtPk+K5DbqF90N
   JLXfzeYGM/ZbtI7yp1AYfAal8ltxaUhr7gNBQxapu+xSAEGmgOscwRyAG
   Q==;
X-CSE-ConnectionGUID: LuGbLIE4QX6Mwbs3CX9YRQ==
X-CSE-MsgGUID: mOxSPnMMQD6qbEft7gFAUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95643060"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95643060"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 06:21:37 -0700
X-CSE-ConnectionGUID: H+VTzcXSSnCGaFCC1T1Udg==
X-CSE-MsgGUID: LKEP16aVSHy5AMZ3aOI6jw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 06:21:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 06:21:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 12 Jul 2026 06:21:36 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 06:21:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhdISqlAGLqOSAGxDLkWHOe6/5aMzQSIrqagWzyiqujhs6PPcq/OTUAyMUpf5RNg8hAOQrm+4jrDXb/+B9dR3E71eAag9M54bhD2rNG3JGgfWVBlBqXhIW1Bhe7q+c8+ggmIF0VbXpfUHWly+qn3HRbuoV3lkKWOlaqaZ3twmG5RotFGhZqKJYJ+fPyaOHwvERMCZv/GwmrvsprlY/bhndXsVg8Y9mKJkuxsXhc7Za2T80UhmpA0PJIrsLlTpMF1PuOz82oewLJFgvjXoCLIP2PBUlzLDU4y5M5uG2sFpTZN7uhYGgG/Ew5i02B9q5loAVUNz7RLeBfZRV4WIyp7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRz50BPLL5iSq9UGlQOspRfCExb/k00BOHAD21uOUx4=;
 b=aEHF9p4oBYEIQqJnUTl39bFr0nEwBLW0j8hKxIYSjyFmsaUnoSdggNlk5zFDe5CrDpG+EXm97VbjkH6iNhaDjxkyWuHoTKN4thLnTqvayVigW/flWddWJCmNa7oKI9c389mrvUoxH2cujWRan1ooFjDIoRJwasWqP+1/w1MxRnqPB00l6qnacQc9XRRhsvQ6iwd+DjMauT+FEL/F8aiDuV0u9bKYNQMKtCWvlTtkzSMgV/UJom6n3u/s5OL1YK9MJBQ+F1jaL3MqrA8qEOg98FnnIsk7caEyIrKI+6tJO3u9K3v4SCNXmHXV9jJH6sR1NAWHVnklNVa0b/nkl9lWTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Sun, 12 Jul
 2026 13:21:32 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0181.019; Sun, 12 Jul 2026
 13:21:32 +0000
Date: Sun, 12 Jul 2026 21:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tglx-devel:timers/cleanup 3/59] arch/s390/mm/init.c:301:38: error:
 implicit declaration of function 'get_random_u32_inclusive'
Message-ID: <alOU1OcHTjXfse8Z@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI3PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:295::18) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|SN7PR11MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd047c9-35b5-4919-02d6-08dee0187d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 95gQ7DeMd7TNXRIlgCzbxLoiMiM9ru6G004IO1L8mxfgyWCDDXDkGbTm/0gE8fGLKI9VZdsROfozemyH+deR6c6IyCWHtdIONYMyWNQ2x936exfGvYwclsWbsSymO9xpLbdHyTts6EYG9dRTztEwjIyKglwMtJcyTMK+9p830OlA3bG91183r1S5e3dm35La342ev4S0euwtSogstnSSfZvwPfB5TKeVsfFTMCINUl5YMMrC0Hqzr02J/ixukwkqbCOzOaS4XDUsArAyvpoHhP4W8zIAdpLcT5Hh6mCNJwOrLLuUvpa8C3bNOYC2mJUQwKiNBVII5y8/mrIidbiE9drlGKUyr2rM/ffUqzKo5DxRC9TO48HQ6j/KVq/5pajsLhqaA1u1i5VcW2S9HiI7Va3xnN8wT3KoKRhrb9C+hhViw22DxfY5VE0jS2HCftSF+x5acXIBCAOceteVh440oz9AwUlP7nqQ4sx8NAqM8pKh1rzQW7Zay3ewBrv+JzRzkE1FjQabYNWh9Z2FWQsgS2zJxFpd8GQ8ed9OjQumXkPPiO3wXJgr/SLPBxY/fh2e5tsE1a6UCHN5qgqVKXTFUIR2WZpaeahpRUbOagFng7ADhok/ik07f0k+EkCf1ll7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ciZfUQ++E5/4Mmk2XXIb2A85zubtnyCxfAb14gNpYC5/ynK/udQv94s4jfvL?=
 =?us-ascii?Q?oe9hHM/gG+awhXHzUUpwW0vwLi4E9WR7muExmRvxClhiRbolK2GdLwo3o5AM?=
 =?us-ascii?Q?ZjShNWWVTV7Iv8R0X0y5kBjiEY5zTBCFhXKdhO/sCVFLmP/PqaEzZrcKubdR?=
 =?us-ascii?Q?JlzBPtidT0f4i2H2nFKjrpjRLnkE1ogAO6eYrNrp7yspKUexmllCt8k2PwEt?=
 =?us-ascii?Q?rFqFIuMHa0faIiH4N68PXQGtmHuvuNneb7Tiy5+0G3u995aLh1hWqeEZbf8m?=
 =?us-ascii?Q?qR3Q3wY9kY5ZIhU1r7WOLzm5G8EGNi8geHrqlx6fAydAX7s96kCRgBUwrT/+?=
 =?us-ascii?Q?u5ZMnSwTaGyBSIl5j1YnfU0RdOWdmQKjPR64J04AvboVP4fOmZYZMqtdxmXe?=
 =?us-ascii?Q?x3AxP9vPkrCjvbAn3D0J1VQdw3nvQua3sBjZbKVOaJK7BZYISuE/gxGq95Aa?=
 =?us-ascii?Q?GFUh6wc4zxp2TOrZW5mjr9k5lISQ7+6Axw93Ta6uGStL+HX3ijQUl+KzafYa?=
 =?us-ascii?Q?LwIVyK1SUG3js/ir4HwlbqlL5tMjWAb0/Sz2R/yjX5//0XPKvHuUGqANKBv3?=
 =?us-ascii?Q?W3AH6XF6MLeYV/nRrTrutQVZ/zqbsSIQ306kAtSJjW2Baj8J6egVXp2nQOHs?=
 =?us-ascii?Q?wI3OVN7x0F8ctsFaWpe79Hn+fvgFAv74H8HnbpZI+4tKhfZc4xy3Qk3ZL6Wf?=
 =?us-ascii?Q?jJlVrBOpwi3OCSUXaAaKrzzGO6sylp12MTYrEdvD/b9XL8M4l0OwC2ekbYac?=
 =?us-ascii?Q?sLKF1IBxVgEikxKvL/MzYVJwGyYCaxcCyM7X1LzEla+ki2VMgc47qQjopwpf?=
 =?us-ascii?Q?aoRIFesJiJZUAey88yx5M82O7zagVVfyz4qEbuS89fxR64NzrdJSdKDNGbLj?=
 =?us-ascii?Q?ondBsiz1ElnvbVYIbP7W/afQvNLuMjj6AK3gL6jzaBNAI0HNNDhpv08UyZaP?=
 =?us-ascii?Q?ckw9SsGFpoEzju6A6NyS7ysWFiTTuShAbdNwzUa8+gBrEI0g6+wVw30hC6mQ?=
 =?us-ascii?Q?wrBU6MyvBRU/UJdfUZr8dp4p7XoWPVsLHmK1Bj50dghGvKoFtVMiUxI2ynYA?=
 =?us-ascii?Q?cZHIeQTNKiN3UuxnT+MgmBybFzWePlO0icIwJJ5KeUgH4Aqm9Qi9IG/w3nbt?=
 =?us-ascii?Q?PDqgeGnfnJIvKnzBKUZgI5bBrtioEPcuwMPfIJFG86lv03QWn+aF1NidHymY?=
 =?us-ascii?Q?iSBdNK88hH7ylqzimpDYZJol8gZNT5yRf2u7T7sykXCTfG8ShYdPCpu7QmT0?=
 =?us-ascii?Q?jAAGGUrmxeDEW2XF656c28SOcRzfqgjqqDbtDhAwMcTc/dMZ+BNPW9iWeRDg?=
 =?us-ascii?Q?Dnszr5uOpsMs9gTa95I3Xc+E+p8MVR/uivIFUvcQnu0OlkpQaziaroDdsjw+?=
 =?us-ascii?Q?nhszGQfh8cdHWyyFbAptAMyg5pB5SChKj6YTUs8L8sjdkqSBDmkbYVfN24tr?=
 =?us-ascii?Q?igPhP4woL0s4xhHU5SN438wEFg4sM3fOdpf6DCl84N2LUl6iwxhXKE35QiR6?=
 =?us-ascii?Q?dAtUkNBTuWNETs91PToNB5aciHx6isebiEL320GU0O8tRs2qY7cnn/Kihxpo?=
 =?us-ascii?Q?R8GZdpI3Q5PhVZwfF5TVEHbaG5tuGI1N4KUSMBra0jO/e4mwIcNNZmir7b26?=
 =?us-ascii?Q?AwGHSCkLETC9HlVJHhTKbht8e4NOGboLi5w5tTAdq++7n58otNHZhqmkm+uO?=
 =?us-ascii?Q?R8Rb1Bw8UcnPkt0MsSPjXD7TpdmS5dPlNDrX9C8wWRlt81MT+D8pB4t5uCvs?=
 =?us-ascii?Q?NnuC4Z+LOA=3D=3D?=
X-Exchange-RoutingPolicyChecked: aoVhByG/kT3W+CIELgjM2EnsBMtFDFqmLJT1geshVY7fz3ekGT7Mtic1MPxYttkvzxwkOkAdArvPZtbYfWIweQ660/xJFQ/bMNHmrujem+fru+o0+948T7/mIggrqY7NpvIHVu+Tkqou3+oU8PSyUpVguXqpqlDQ8pyJ0yG6kPiFrIjOfJ8q3RRb9foAHKSeO3s3SOmfaoPpjN8EVuTb1itdIdmoShFQvylcVaNWfk/OvCkTbpHVjURsdgQCOME6a77DT2zYqOdpgtgEe7AdmsFOywBMIHc2cA4WVLMQ6yg4Xii3zYKX+M63lszT2eq3Tvv2IGsPxiWg+AlepFzdrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd047c9-35b5-4919-02d6-08dee0187d92
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 13:21:32.6269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9J+5vn2/UbEJxdr4m2y6sJziwNUQWBH9yWcWqs0hHjJXGo87I23xwumP3rySVHTS/kjsRPpnLVMoYZqqZ81Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 7685fb5c8fe1aebd1a2202b2267a79d5b6775fd2 [3/59] nodemask: Include find.h instead of random.h
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260712/202607121139.l8pW3DHz-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607121139.l8pW3DHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607121139.l8pW3DHz-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/mm/init.c: In function 'execmem_arch_setup':
>> arch/s390/mm/init.c:301:38: error: implicit declaration of function 'get_random_u32_inclusive' [-Wimplicit-function-declaration]
     301 |                 module_load_offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/get_random_u32_inclusive +301 arch/s390/mm/init.c

0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  294) 
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  295) struct execmem_info __init *execmem_arch_setup(void)
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  296) {
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  297) 	unsigned long module_load_offset = 0;
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  298) 	unsigned long start;
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  299) 
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  300) 	if (kaslr_enabled())
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05 @301) 		module_load_offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;

:::::: The code at line 301 was first introduced by commit
:::::: 0cc2dc4902f425e346d46deeea2352d9fba75375 arch: make execmem setup available regardless of CONFIG_MODULES

:::::: TO: Mike Rapoport (IBM) <rppt@kernel.org>
:::::: CC: Luis Chamberlain <mcgrof@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

