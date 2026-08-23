Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A0F3D3488
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488414; cv=fail; b=P6pRn4y3stHn/bzeFY1E3qS0OpcaQAKQYtn8NwYTvABolrfktmXglEEUVO4U9+djmPWYDGOHX4crGg0d0z3Lz+k3n5tp4G88d3lUYTq42sTM9hGrF41+v4gIUffsHNlSlRogL85YvdC5ZPjf0qoFGTS1+9ehlLM+CZsPRiRzELY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488414; c=relaxed/simple;
	bh=/1kSDKB5/WyVFCNVtJXUbo3Lp1QYu4ZUjLqDyGYCvkc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=KvEEPnMNY8HUFhwdMoXf0vptBv+OaId+PkNEiduqZCuZibLbN+0tx1gqRl/QgIDjviZnW5gxF2Lo7dNAxMRTtz7SI17922bSkIWPnrlJa5+mEVllbX42ryD+LkpihCrth621O8BMUFQ1QJLoMpD+tsqcIX1EQcGGWjRXGRhuk5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EamWFdYD; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EamWFdYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488412; x=1819024412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/1kSDKB5/WyVFCNVtJXUbo3Lp1QYu4ZUjLqDyGYCvkc=;
  b=EamWFdYDrHUL/RmLnq6gZ5ayL+VsnUPCUgotPfe9fUNHFsKB8S2iaugk
   aUvCXNyE7tZK2cIfo1vvCkZK3kChuk9CvR3kq9JUPwNH55zsmI3XPpXwL
   kMgk7XeEb2kwiWsX72Hike+2oZSgNqtWxxTG7d4nLocaNrdorRy+Yxat2
   vtjsQhwSxW+d7VTQ31qnJlD/3nLdWhM8sIQ54KZ9Y020hP/m7izPaxTZY
   KGu+lBg9rO0hT/8fpiUPdnf0SmfntPM9Nwn5yvwB99bnaTm4VfjI96U1J
   4TWMA5cKTNEE4rcTK58gvXV5hvo6a1u4KZ2dWyxLwyPYx1uyCDmRgWkMn
   g==;
X-CSE-ConnectionGUID: 7x0N+y2HTbuCeOFTJHjv+w==
X-CSE-MsgGUID: sJVZEc59SLWTe6pyU1PHEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="113496877"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="113496877"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:33:31 -0700
X-CSE-ConnectionGUID: WyIqocLZT1WV0sH+b2jwEw==
X-CSE-MsgGUID: xi5W4d86T22QhVMzRBvlkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="260604986"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:33:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:33:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:33:31 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:33:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNMl2Kz2ZYoHu0BKIV4vNWJJ/mAxsSpnv2zQHUjwb+z1IJzF+g9R7NyNdd6EwwZKadymY+DZxpD/EURS+IgYQx87GaHNrqbF0TdzLw7+RuSWdiQmL9gclSzgNS2nfDUipmflNt1Ozq5W/e0fNY5BSJjAgd2qGU/wi0oo8CLcOBcY6jwplKvA6jiRwBiPLxbR+x+xYnGKBgBMFSIYDHVfVUMC1zz53Ydg1TlWKDqY/nhCcu5Ym4Y/TV0hVWxAVJDBhxU6yneAiX3MRuRiqD341ddRtg+oxDGsCyIqTDlA4eQI1vC6PxUWV7N359tgfpdtvCyYTyOWcd3iCMtju6c5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4W/yQcxCnYyKKYgTccXGgMdidnjBnj2JBzviFxXHj78=;
 b=dwnAbwz6yUmVyDM6AUrB/lXaKIIJc+qw3YYdnAdY/Ptso/WG5H+iT2SwikP6JZ0QC/5o7JHEzUEXJ3m8KxxdQZxaDBXByQvB9gRDuDFdtQp4aY1VBebafFxV2FAsNFZj3U5nmnIiMY8S93BzrQs4U39Q7hOctLabsDSPo4zGZMi4LzmGU0zJ0nrS10Bh6gJH7tDlPm6rqI0IDyXk0frwecsMJO21Je17s58DchzbZjx4YJWkb8f2u/Ey0lREXN6MEon6DjIK8LkWMAjGALa/Io84Taw4Et3PTfNLNVQJ6cBDJHnZgvgYbRs6RiH5Lzg/UMlJUyC64w7sQwEzXH3Q5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:33:29 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:33:29 +0000
Date: Sun, 23 Aug 2026 20:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12 2/2] ERROR: modpost:
 "kasan_inval_dcache" [mm/kasan/kasan_test.ko] undefined!
Message-ID: <202608221856.ks1buFak-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:820:d::10) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd1ed41-cf46-4b20-b4f9-08df0112bc46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: UnS2YpfgnZyrUnkBGgDULioX9w8UzSku8fR/AlENzew3Hg11LfYISmdcoatNXR0l7jV/lzv9Un38Y5vpi4lPPrTTzJL6QJlpsE9B8/1Y2atqTq4tEn3NKCODTf3qQmTaFMr2fU62iShFyRHp7ZKNZ2z+P2LFQzCm6oHTaShV5jqegGplOI3nfBaYyCQhroFaW9oq+ALDP6LfWgzw8mDZLXH4sctMdFEdaubTKoCkO66oW4jZR5f4tTqkCCDisetBGOfOE1KPTw72yPTwq84iMugHy58pPKhSIB6RmL6p2lKBa47BvmwNlR9/i0ETfxbfYjidLlMhG7uful3/vpHbvh4rxmnkzLLF8vpYfK/VMKi6TppA4Hq7zS63itbK/C/7ax2AHPjxlHGr4jdeDnAtjeOyLXHpKxpPxmTnmIG9Dih24OxRHTfC3br0ska9BThTWx/BB4ekunfXKwuWDk621nfSxPbk2Jj1Ied+ygqjao7TeNE/jgpS7ymUCC2fX/b0lo9kUtbcqb+/RezQeAJMGv3Xr0wHCvi/k5IldUM0oxeyVYxr06TlxDK+WDhCH16/QRjqwYQTISZq1jdCnnRaAotA4GPsmtTJMd1Tt8rWD1dXqdtHY0juN3HyCuSoT0FF+xNU+Bux6oBlrQICiDE95K4Rh0qEX7pNFMeIAoZ+k+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z19PU7ag3hSBCZzK2r2LIvgVnSawc5J44WIg/2ABgL7f1FSULGGCVzm0GftH?=
 =?us-ascii?Q?ooHMVP4NX29/IZ9gXk8xnYdcFxc7fgD/jUL4DaPfyB09XObMw9vRA9aeWUza?=
 =?us-ascii?Q?Yj0pmpV6eneJUL7KG9NVNm16q767HnOHYynJqu0IKWbL2+9ml8QTYlMnCNDA?=
 =?us-ascii?Q?D/Un5nYEFpUPvMus81GqS56ztsMrDWWfZXq+DB3/8+VLJALYlZMDIe+CNJwE?=
 =?us-ascii?Q?qlL9JpifIKBhYdB+NxEl4Ey4LqcOG0QWv5uz8AsIhmw+G0MMbOTgAKQTL+L5?=
 =?us-ascii?Q?2GHLaGGbREFdnUzQJEpa4FdeqiddYj7NgRb1yEtOxfVl4ckDPi12l7kpWma2?=
 =?us-ascii?Q?+W0A+bJljyshhwhByk2JdNNaICWf5P0tkSdufEbcxL19uTe3uYKzTua9nnPJ?=
 =?us-ascii?Q?l/svxd6MrPATOSoXZyF55XAQvl5ERVPiEOYUgrRlJgWKUZvtrrR7C7+RPtK+?=
 =?us-ascii?Q?YawmXYrsn1iu4Y/d62Ogcc77gCkmW4gqoJ6uD/PbtDzZOKY638YxVg+SOP4o?=
 =?us-ascii?Q?iCaoWbzD8hz3Cv3DLRK1s+KqFZTpVTwj2BnpEzXXgHaMHbdjhNbKiqe91aYV?=
 =?us-ascii?Q?6Qot3EhtkL60gU37/cbLMCp6eFEZYyIdy3qQFjm1Ro1RkfTltdTDltdihCgO?=
 =?us-ascii?Q?oITyEfr8lfrdedkH6RlS7vnrg2FjF8cCkfTBEckL6sVYnCIB1j0bZ6vT/qc2?=
 =?us-ascii?Q?R67DZobo7q66deGB9b/5QV1gmRm+0fOvQFJq5DG2YEm8BeehV2SIyAioWU1k?=
 =?us-ascii?Q?w5KWWTj+GpfMs8927V1c0NSrRkcYUcb5p98htL9fepFPBIIBWdBgu7RC3UAJ?=
 =?us-ascii?Q?3LRnN7Kt069XoN2IM8lvnNxPlkTVjgz9h45CQu6icYKmMKnvtuIkc5uyPQzE?=
 =?us-ascii?Q?tUxwftR5KBSUeffUzZRh/Ob4KzVuAxfq5QJMCvi+MQWNu30P/8xYZ2kEysHj?=
 =?us-ascii?Q?wvf5Gmbcyr++MRyNKj3tyknsaTc/6/gLEvVYpo5PYXTxtVYeJQ3h9iFRwr7U?=
 =?us-ascii?Q?Wv7cGRTJfblFKeMP878WCB84nGaFtPEbPBXVaTKI+qwACP9jZPaGo2+V0aIJ?=
 =?us-ascii?Q?3oy3qm6c/M4czRomwIQMNe4+lHOGaSHFMmixbsuXux5TpMJBXPlH/qSA58VZ?=
 =?us-ascii?Q?PZujR/hhf1tV3KbPVSwOXTrswR0wqBCpJFwcT4SO+eIQhr3Sx0ARwX/OXmr5?=
 =?us-ascii?Q?hf9QinsK5+v5oBqGAAmgT+7UvMEHtzI9TBo9zx1y01aDWjuIWO/m/1dv/rU9?=
 =?us-ascii?Q?RgtIFI7xwyET00quvkeP+w3Y6xnc5wR2K6NpamlTyDO8PSDZj05t4+tlG9x7?=
 =?us-ascii?Q?6t4h1xJ7MFvkdRk3Op/S76d2C3Zn6NYrq+gVF0owS8NWdR+2AJiFWL3h/hgV?=
 =?us-ascii?Q?dQREpTebYKLgEexDge9SDQVCB1OGH6OHBVef3rOgIOYeOAFXlh/0Z3z3sEvP?=
 =?us-ascii?Q?giFjj0691u6L7i/nX8o+4uGMIvyHO1IUmONO8zcw2Mh/LBKfxP2CYXJIi+B3?=
 =?us-ascii?Q?OAcUafqvpub0mOuQdtInhZeqce4XEkyRRkFL+pAOf9l1rtUpvR1KvaKaCBL/?=
 =?us-ascii?Q?xAkqA9SR8G4/RW1DSkikKs/mV3XA2WjMkFnuC7tzv8aMsBPoE9qkSum+HT1x?=
 =?us-ascii?Q?PmclmThO0xzmZpo+sBDOdZDlePga01Cg9qsMYJVk1ZwwCjgh444KiQiYzwvr?=
 =?us-ascii?Q?xT9c2rJvZft2ITVs1EaLefSgshxNUGdmKIWA2XWObTgRffu2DsQlnja2lPx6?=
 =?us-ascii?Q?zRpyVwNWKQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: D4Ict7e/zej6UNbp0d/p0KJ/Lva350H5untiT+0vQBqOulnWQs/aaWeyTJkHCvfwW2/Ccq3JXJ9pKScmLR39isoDGZ6j8zKo/P8bxLRi+kaZUQpEwi95F1PjZHQ3TMNq9Dc1htvntt9U0xUmXhpnDMU46GUsR1yUuz4lP0w9oqSFOHs0QIAPHcmUDFfRJj6jLK7uNzmrFTo5zpsmE2JdU8qh/T1nkaJnzEN/o22xHpoSnEpjC8r9yMZuH4uxPR6dQO82nslL7nY0mXuR2xVOCVZvwV2wSQruHJCQDJjdH8cbBlmuSu2XDdjToMXzhFhV3z+1u0FIGrJF5JfGuxFbCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd1ed41-cf46-4b20-b4f9-08df0112bc46
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:33:29.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ai10IyPQ+gQYEURmaNB3uBL6xGjfn3PBph0H6n2Qfkj/pspzIqlmUwhCoiBkpZf+8yRyaVidmwHyf0WWeWSTqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

Hi Hyesoo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e8c85685a629de4d09ae447b4fac9bfd315d3674
commit: 8d99997b19ad09073cb0bbbe68bc6ac02ef58ca1 [2/2] ANDROID: kasan: flush dcache after tag writes
config: arm64-randconfig-002-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221856.ks1buFak-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221856.ks1buFak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221856.ks1buFak-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma-buf/heaps/system_heap.o
>> ERROR: modpost: "kasan_inval_dcache" [mm/kasan/kasan_test.ko] undefined!
>> ERROR: modpost: "dcache_clean_inval_poc" [mm/kasan/kasan_test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
