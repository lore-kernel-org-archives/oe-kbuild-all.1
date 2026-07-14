Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881E4277007
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 05:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008449; cv=fail; b=b+YhGMoSV9y1O1W+heG+hPB3cPyiGEn8i5rMzYkf3inGojmKawFAebsJ8D4096PMuxKoppIsondKNb19jqoU14p/a8BiKwIP446IOgTIz/7JkUHdKTJ34QtpiiQfP4CV3Zm1F93rlUn71Wo8cfQS0WDBagK/P02WF8ALmWJFT70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008449; c=relaxed/simple;
	bh=nCxgatx25R0P3LSVXGQ6DwuybrTvU5GBg8QfAv1QyDg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ORD/v2k3R2/4DizLbGc1WBvI+0nysUyJGRPfcLyEBW7c02+bYiNLiOiI/Yf+BcU6ySuu+lqUm1feapIGCB+Tt8zWVK/kdwUHjCyTu23hprq36/hWzz7Rm/ujVnNiHUUJ/Zz5zsVZHZiXg0irlLh1Ka/TSmDOXuDQ1/pZ0apjyGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgmpzCpE; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgmpzCpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784008446; x=1815544446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nCxgatx25R0P3LSVXGQ6DwuybrTvU5GBg8QfAv1QyDg=;
  b=PgmpzCpEjOrRWv8Or8NsT9s1uTdYxVpg1HUzLiC4eakLHVr+37DwCXCg
   /TfD4MbkuVZldezh8ueMpvjE7cuO2qIEJRdvnkKwyG/+qUopH8/R3Udlo
   2dcY6rIKhLRMv66dqlseoWx41tOESNodv3zqiWm5ZnJmQS/dYzHoGSFIL
   KReiVGf7aiX3USbZO7OEr8pUxc2qBkBs39dzP5An42/8NZ7DWhutK1QBQ
   nw8/uAMRDB2YCns01yA2IQpAYV13Myw1fFS9J+uXAFZKs8DTPwlvdNukA
   dac2JHq3g7tBP8mJEL8MP1AVVQRDXLNKFmOkI5FnaSBssWe0R72PdxDmq
   A==;
X-CSE-ConnectionGUID: A26KDM0uSRWd2b0WfNvQlA==
X-CSE-MsgGUID: HKOpMYzoTby8SrRYeCv/EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="94975701"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="94975701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:54:05 -0700
X-CSE-ConnectionGUID: ZKJa8aeET6267wK1XIv4cg==
X-CSE-MsgGUID: g+ZcnxdHRWK8MUXj9bZ5lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="285841996"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:54:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 22:54:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 22:54:04 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 22:54:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMIoFDwWgi/go4qSNfYCKDoYCg1Ou4vwQm82hvgMTz+4NE/9fliVkpz9ST+5USAVK+YVhHWhdCe05pTsuN51ZWmijarWjdcbHGBok3CRecFp1vqVB0sevvk2k+8iKS7QWSZiAGP9O9boQu9909F+h2sKo+Pg2gaMBn0E5mXD+JTeG6UT8nK3ltJpBpPexH71El2vJe9afKpTsdpz7phAI80x4sBO4P+QGN0UueLgvheLlKIQ6euj+rGE0pps7OGYMW4AGtQfQHFjZE8Gs8sT8Aj1B9DM7H7251A5d76/e0gJShHww/jxMMCRbAlg+TbgjPGn9pk9a1BNrvSkSjt5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRfZbdeE4whX5Yi5SaK2XsPwHnct9XnzK2iw5eY9YGA=;
 b=hrsF72pE6hXuHht9tzpFHFTn609qGLyCjRO37QRTqJnpUD9yIdrTB5MnCJb//j3cx4VP+vP26iAY5GiqDsFD5Ojuf1uNG1EBDX20RzSlqN5/FojSA9MsF2kF7bwE1MRRcih8FqOIUxmxohiqGLgjmQ1rz6MSJJQx6Us/l/0ZeadMP2R0irC651q2GShJ4Qs9+rnD1ye/h51b1c2jip7Y1VcO8SL+4zL19ou+xYuAkb8WY/Zgm2lAPqgywn3r20kRcDNAAABFxOZ1vX+VkDMP5BlXE7ylyAIX2/jMYypIsM9KgjL/8D38qOJghYoCOQELFKMbPh91dhZglqyHx0bEIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by SN4PR11MB9941.namprd11.prod.outlook.com (2603:10b6:806:4ff::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 05:54:02 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 05:54:01 +0000
Date: Tue, 14 Jul 2026 13:53:52 +0800
From: kernel test robot <lkp@intel.com>
To: Danielle Ratson <danieller@nvidia.com>
CC: <oe-kbuild-all@lists.linux.dev>, Ido Schimmel <idosch@nvidia.com>, "Petr
 Machata" <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 11/16] ERROR: modpost:
 "ndisc_parse_options" [net/bridge/bridge.ko] undefined!
Message-ID: <alXO8ACkVcl5eg7i@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU2P306CA0003.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::18) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|SN4PR11MB9941:EE_
X-MS-Office365-Filtering-Correlation-Id: 980f1ce9-f7f9-4935-b021-08dee16c4dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: y+2TuGuRAaK32r68TxPobR2i7zsDKsKCBpy88SlBmaOCskdniwEOIMICZlNr9wnNSJoXBpynJhCS/Pi2iyCM8lZOyR1wY070LZ338P+QYYb2za3i+PTI66usTOUagZrCOhhBC3DSWThyejwnWEhUbc3bksK/+ZPQw4YTP16+sAbpwJEpohbPPyKPaZrCnTHTihg6eIZymSY+8nLE0FCAPuf6CpSvaUHMvRfM1Hnfy+An01WM7xlkwRtgKj3uNopr58K9PyeCZr6kOXgeY75IlXU94yn3W0dS6bKLXVI6qSRLYyT5bDxxb7sr4p2dP1DSAA/T6jhFp4uoA6C1/iVAQoD00oVQYGH75MwhyBBMrsr21yVh0IJEBsekJ9N3Xjl+BL2S8e8zvF0sPUjGwYXrgVhRtKkGQJ42dNQD0ImTHXVwpzhxm52MQZ/HUEspsOPohKVdufVCT7uytnsc93X5vhGdPTSMLnRhAuQ2GwG5SSvj4e8nopDD6U30MV0s18cytkt+l1k7eWaPmvX/n4rWQQYyT7UJnF6SA9oIlT+5O9wJSQQ54pVV+Zom7axX6ryZrfgk8Px96BjizWEY1H7N89ukvEJzujMbpOSwABxSpUgFOJ8TqhNDssZOCvKXKdwX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jQCGAyLDHsw/Vzc5DDqcsbRpzei9FRSLi5yw47PAUcsxP8BESoMZ0VJ/9tN6?=
 =?us-ascii?Q?6ywtKZyD6PnzZKDghzhh72sypbJJeCf6eUWoxu9yw+93iEjKi8nQdL/6VTO9?=
 =?us-ascii?Q?3+hfq3I2aSFYBAxQmtZZ5kVNtyLV9qJY/CV2dADgawLNVJxfEShDlZ4mG3wh?=
 =?us-ascii?Q?rdK58o3Hxia6fFvSge5QiGnQMFJI5E3IfqrRZJU2y/TRD/Io9KUkvPoTRuLh?=
 =?us-ascii?Q?0oNxqtr97ngoWqIPTDF69CX0pq+PEC2QmI+ylVNS1jKnz5WBHRFya05Q6TK9?=
 =?us-ascii?Q?PQ8cP01jTQVwbvYCXBkqrRUWOrX7vVT9+3JQFvfx50RzZRqITTZka4qqsfDR?=
 =?us-ascii?Q?A5RoOmmE1koSWOnYY4aq/Dcujmv5i3flRdiQIg1q0OsjUOxlVuHyZU2GlBJ+?=
 =?us-ascii?Q?gEBi6Pq9XAga+SNEbVnqPxa44tBDaaXim2iM95chqtRUZCsN9rZCDtytlcBe?=
 =?us-ascii?Q?A6RptQ0xV8pZ4ktM/yIACrgJgaOxKvO6x6B6tY/3S3XCpsbfLQiemA0Ufn/1?=
 =?us-ascii?Q?HZY1ANDp1dUMtFfv9dDJjGo85drZ3FdHB5t6VWp+1E+r/p2SV/28ADItHs+F?=
 =?us-ascii?Q?srczCzBC9Z5bBvEz4rg4ASOtdMAY6ApBKysZPxHqVymR7nIKLDvXrlh2+RcJ?=
 =?us-ascii?Q?2lHpEm58BUWwFafj0QmB+DEAHb9LuRIDp9vd047JiQvl4e+41et9MKCMz3q8?=
 =?us-ascii?Q?Hj5gr8bmLdIrLKCxXDFOvnW3VffaswjPD4p6S7tuDvb+umVD8Z5HiYmlnYsS?=
 =?us-ascii?Q?/VrReDWBUjZTlJIxyrcFTj+9ZJI7IBeMVkTVV6qwdOr16GdgeePhFL/ozTGM?=
 =?us-ascii?Q?WlFOP9t+aYsjnnvZ3QAaauSaQwla0DpUcCWeelcwXIMpDa8U9PRwmLHJEx+k?=
 =?us-ascii?Q?/sf7mBNyv0UjnFUqQGAe/8TuC22j8zcAJasf6hdXcP7iilCgh1Ail0yDNe9V?=
 =?us-ascii?Q?xhSL7s2sR2ZLbWxtB4iY8fNtxwLP+QMakRRb3352C7iH+KT0IfsP++52VBCt?=
 =?us-ascii?Q?ho63a4L/RWVR+5fcXX/mWiVkx2FP3CmSH3kKyHCW+RDunPHeisWV08IPzSfp?=
 =?us-ascii?Q?FgSL0AwILyzb7H8RsBo/ausNtAswkA0h8BCyqOY3OLNJe8voBMqgM19qhQNI?=
 =?us-ascii?Q?V5cwX/vTlZP5MI8cQCXYP7SGDl6xuZDYm5krsXCl9FRoNoYi0lXOh4KRqlYD?=
 =?us-ascii?Q?hCeUFeWq2Cma9676GfZPXrweVJvAdoolUEF3dllfy14wYhekPPZTU1qacxCd?=
 =?us-ascii?Q?PLXB8zd9goqSrLgukoFSqHsZcln6TFP58Hg/4mDBJ3S2YqZNMozNa7qFshUV?=
 =?us-ascii?Q?kj18s2eshZMGpgA+g7pTt2vmat3WELxgY9rzIPqzKXVO42d56ns6O1cM9nf8?=
 =?us-ascii?Q?mDwHNwBWS9d9Jz/fqeNy1mOBcs5cmQcT1Xl9pFZ7/NsLJT1Ty1FMOCkD88I3?=
 =?us-ascii?Q?0vvyvntwd2+jmYhrKM2HU6ggrlYVGgQrlRr0XUrg2tmLpOtZ11iqM+zvPnoW?=
 =?us-ascii?Q?f0ZFiL3hWybttIV2mn4V09P6IcZqFQrZaNc94Vq0U4EedfEsUZLhXaap14fI?=
 =?us-ascii?Q?xbxlnt3v5bQkEX/DI5FuEqm2AS4XvAmxQDwCbDPPAFUMpadnbTiTgmOYlURd?=
 =?us-ascii?Q?m+19MmZMDCbxTIYxy26MzuXma1pkA/FRwCCKolV/YAqSm/QuqATDbnYQtupe?=
 =?us-ascii?Q?y7hh5+WK/NEYyVUC48C6b5JhFlg0i36vQDPmS9CdUkHXY3nXBZ0VN4tUHFmo?=
 =?us-ascii?Q?uQ2rChv00g=3D=3D?=
X-Exchange-RoutingPolicyChecked: IKzLzTap6BlqWNUNFFrNlPfP9W82x0gBlrg/PYE4GXws6F3ACMavhc/SqG9QYNu+lc/8SoYvf3XN+ZPIMlkxiyj6xNzM2SJZCG6XrlVEhtrKRsVkc5cPTVtlV7pV6PUIa949rsZrPLCfc+trlw8MaU5szAo1hSNUFYBaPTZIr/66Hj6m3PAx6LI7h2NMS1kmxvyoI2zPT/z7lXj46D4i3n+7wPfGdwM8bjvwfKzFP3pD9XjJaI3/ZYV6JHIllpMWb/KV9TIf8XhmV9Auo3Z8NAKquBNZrFviGedGkQcazih6dDjhSh7QbQsDwsXSo6eoVGsD5PxVjKgn3T9zyffIIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 980f1ce9-f7f9-4935-b021-08dee16c4dd7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 05:54:01.9456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ry5vmSKgVtaXfqArTiAr5e/cTMKyDowRvbggDWN+m2vgB0pynfLB5blbDAhSe1OGHQNGbcnYJ+I+uUw4Bb6aLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9941
X-OriginatorOrg: intel.com

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   ea22082e098921b64bf9ce5ec45e5e4d287cc1ee
commit: 79fac3fd1dab2e401035ac716cdee61200a3f3c6 [11/16] bridge: Use ndisc_parse_options() to parse ND options in br_nd_send()
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260714/202607140432.hiEzFnz5-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140432.hiEzFnz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607140432.hiEzFnz5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ndisc_parse_options" [net/bridge/bridge.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

