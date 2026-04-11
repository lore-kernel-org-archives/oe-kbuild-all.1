Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBB12C21F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775916945; cv=fail; b=LkFrEZlQFL5yJHJJlYjKeHrrRHvpE1haEBJ5pZHuBpB1urCu0DJeGfYe8/S3Ya0xZ99bJxtxJz3qZLIn3eQymzDrRK/j5e8va7g8Zbm5uUtU12BHCcFy1jhFJxqH4lFu4r+49/IjxaWfTB1UQhSD2Ji+q+8xXgoVLwGXaeDywgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775916945; c=relaxed/simple;
	bh=YYYR9dReDaSOeegXHmexdp+Sm2qdQBAloej5ioi+dF4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=D/WMRp2P9vsQb0a6EQf6YNxT9iu2paNW4mqa7SGoUa6FQO9h8EFx50AMY8C6X5WTtpK9EQKZ93j7bhzD/0A2ds4wpvTqlWTnBdh4o5RtTN+8/7HQK+CM8ij8hx94xPpChr7zR/fTlCCw4hPA+23QCNVa265qHsFf+yH9pCH8zoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO3gGEu1; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO3gGEu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775916943; x=1807452943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YYYR9dReDaSOeegXHmexdp+Sm2qdQBAloej5ioi+dF4=;
  b=hO3gGEu17UsrKSoHew9MvjcennT/x3CkiIQEKXF9HJ3OivtI3qnNfD3r
   AbdRFGpWS3jxZJ5UXaQ+1CXGRC+BHxxL53c39ZfBEnBrCSyCFd7vRgsPd
   2NqprT3WX/9DJBrA625NX88F2cVihcd/t3xRIYpIRhBRa9AZQ6nScglHq
   VIA00T1mnzkeFZRkH/xs/l7ZkHycO8NWhK1OXUluL3eB2Jvmoh4//8W7v
   aVHEatrTkXT9PUzCncso+bXOUo/pUw3wi1gNNzk+tbMupD9Xb97bt3Acv
   2sgLEKAxqDXV1QAb9X/1CwXGODsVs/QWmOQ9lgMLejb6s2LoB4p2TN6yb
   g==;
X-CSE-ConnectionGUID: eXzvJu60Sz68K+gX/yLZiw==
X-CSE-MsgGUID: D00o5HgkT8mn5tuFAa+ucQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80777763"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="80777763"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 07:15:43 -0700
X-CSE-ConnectionGUID: vFRi1GjXQIG14x7IQgK4KA==
X-CSE-MsgGUID: +xvMhC0tRJO8G7RBMeo2ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="222869731"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 07:15:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 11 Apr 2026 07:15:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 11 Apr 2026 07:15:42 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 11 Apr 2026 07:15:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8XZlKsTFapLDLg8bHw19sMkgTtOYUeX4Lwzo6IjKM2Um8gKwJwtNoVCq/z9ViDX2IzOeYW+X8CVXku/2sCfRQm4dSRhkNj11kjzzVOS8zh0G89BGoZiDU7u2WArijGpiIevfPTldPTV1gQuoJ84P5rg9d2nupAsDO2ZTDG/oROFt2bmEp82AtiswwgQOECbtIZkr3K1AkLEb2pay5JOzbOJTdJrIcSACnJPMwMdhOTWp4Jf//WZ5K0enVb1MXoZtXiJfV6kLZ6Ix15uxntLcT+09XcQcDDqyjVCMtLQm75AJuWZSHax2b8aNGse63cYDRZcAY043lqWL15Wham0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHTC9kbhocAL5JpeXH4qQXTYBnni5IWq53lwh8ELB/k=;
 b=ISEUXWiA12b1PefXrmmehs3H52JB9eVIcRUdnFtbDDUndWfByIAmwMdQumXoZYAeDirral5IwDTUFxfO+J/TcHWPfn/CsY6r0LIX5hOzIC9Z3GUfCRS4WHSIVlKIFl9abs9EO63hxELI42/46RAiEz3u5pMXvIYBxN2PwW+6OU5X4kK7b1jdfUtUW8iZruPLiMa2UWB8keOxypPflZco7m673rPs67ANEkEsWw7pMUMhOsG/utwZ4/LeQQ4kjGaj1z5z84Y369+gpNjg+PNrFC4IGN4mwbAMTRimSy9kg4pZGcIn9jzOTCVHpzWoOUQFSymsTdoPhh1Q2j42Gqy8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.17; Sat, 11 Apr
 2026 14:15:39 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.044; Sat, 11 Apr 2026
 14:15:39 +0000
Date: Sat, 11 Apr 2026 22:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: kernel/bpf/stackmap.c:172:42: error: implicit declaration of
 function 'vma_start_read_locked'; did you mean 'vma_assert_write_locked'?
Message-ID: <adpXhBRMT8Zz8B3E@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 132b732d-304e-4058-eb56-08de97d4cee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: ifG8lzaOQqKlSJ4ekqvG1tR5Y6Ly2uiPWtkTkFZ/vL5RNLooLoXsTgf93LDavgmrHXDCX++2kz18110a3EqFGTg+kUGayIg6iO3I5ZD3UexXMQbAoVDPKbW07kxt2gxBAwNNmsviJXuxtSYAt+5LtHUODSjfIv2Uwlir2qMkiBN5voQmo9D+Lh6+aYZJ2wVb04TETv20fGkdrg5AudNFDIlvghB6CRK/mKIa9zd3GCttGEQ4SnWe4OBVp65FQjQ7+jeGeDHr6K35FaeFNn9y+uql1PY3lWwwNGhbDlCUSq6qR0dTZoLI6Xd6hqWJ+GsnLN3WaQsfffVKQAoSQLF0IAgrJJ+U97rxgGpI5XBPNVtyDjJJ0jNdLfxmceF/d6iqiy5VRoVpGl9KpUcdO4J1CWT8E3x0f5MCXNtfGBgev+HRTzWcS72mlQvnH9JdB4ZWTQqStKBH03xhssd9K9HSx4d+HQnp7LJKsIOa7GhN8J4sv6wLirlvE0t+iwyk+/mCaqHcFcuantm9cmx8cXCgLbSt/tTaxkJ6Sw8BhrThu8sRQwzeWZKNB+VoILyI3AD/Ibj6/RlypyBejHXQHhyN6vgNU9Nf17XUyGiqArXNfpD4zxX3Uy6kcwASx3Pb7fAroMYct4AFJnS83iea0kF7wyaLo8WnPwbnrjKUcpg8EZYKT3vYM/wtbWdlIWKsgAeb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tUUkwv/gU5XEuz6xpTxLP67B7UtVkMYOOTYfjccJBcSKWP1QHwydEn/QgS1x?=
 =?us-ascii?Q?9xh1tbGRoDTmSmzk4dtTSAWflggNGCdM632SrMv3AWs/Mg7TWuJggumw1O4j?=
 =?us-ascii?Q?frqE5z/kEqUGD/79BSYMYACxfiLXMt1TC7hVngtYBknHEZ4LaxNdDJIyDoPb?=
 =?us-ascii?Q?oBUCKvv4nLknpZ9ClTabLG4pyxQCrddtelH/m8C2A9XrrwNf5dac1urR4/8C?=
 =?us-ascii?Q?q4jcwjrXIxGVmVFgjWpHV3oJInutHuwZOuOTBKZ5jWVKTDjoMVEUp/Yy9gPE?=
 =?us-ascii?Q?4mBFJKLhMWESUdqDfecwuqrJw6UJmAJWbB6nbcKVQmAtwdtszudzhX4+hShx?=
 =?us-ascii?Q?h6A3uzdlsiiUlqMeRR4txU29tu4yNBwlp7I5nqlpbcSg/OCzqnD9sWAIRHbW?=
 =?us-ascii?Q?cI3NeLqBuyEfnTPcJ+eAAJ/ZlyRVJlTSbii8QGPXo2wcv3bxCAhtIunnpueg?=
 =?us-ascii?Q?/NzDkmcXBHz1lOISERGe8iI1fCQ+XRUaHci0fLoEDlnC2klKwWlSInV7+u1h?=
 =?us-ascii?Q?x0Mnv/nN4n9aNDu3cSminDAL2M0ylHqJnx/frrU9AmNFxKGN8u2K03iTLnJZ?=
 =?us-ascii?Q?Ldgkef1jJ02lFbwSNMlVtz51oeqmTa82BiPB6u9OE7NsIUKsrMohHmRLeTRP?=
 =?us-ascii?Q?hIqci7uozYuMkfZHopVzlLFKKxxATgIHH3jbDt0bdbXPsHaYG1ByTilCpq7h?=
 =?us-ascii?Q?eUytPa37hZkmfWavO7wXxrIMiS0LHKWHgn84wIScRhR+5f4TC/Jq2cwiNR5E?=
 =?us-ascii?Q?2LBjqb742zyxctfNe6992iPfrjpDmm4YVT+ZSf1zZfKSy00fTN26V5r+LZ8o?=
 =?us-ascii?Q?cKH+kASED1QxVuqQKobNuQu8KoZKyyWS0QAOkHTYUGpWWZ1Ch1SV1SDCnTBo?=
 =?us-ascii?Q?ZBGHYJVQj0dJsD1gvZwAx35wKizpNcrggJJEMghRjaygF8ysK907xKGkq1sI?=
 =?us-ascii?Q?qfXNHYK0SdK2aWZjxJ/sIG10w8m0mts8fydKvUPDCVVh2kncV+3rbcWjueKK?=
 =?us-ascii?Q?5igY6f1jzD9AhHDtMDSJUqM63RHsJL9kXYVOmpW1l50MjchwucGYCnxTvzMx?=
 =?us-ascii?Q?MHKyMkvR6DM2Euj5pe+j0U+5ReauCo0ddtRkWVaBVCB5iexbXTPL2B588Lds?=
 =?us-ascii?Q?GV1mGu9txh3MmTO90Q/I4j9DqpstgkaeSc8iaf7zAuZoDmgoS2fOGBKy7TtT?=
 =?us-ascii?Q?WJw9uBvouwwyy/gaMqg2OvhXPej7hNMcOec5blBSBdn/3iFhuDdWPaYDxc2A?=
 =?us-ascii?Q?bJTuoIeV+iDJDbasmzxLpMlDLKR6C8LubafjRU+AfSRbHQIDsn5H1tQRIuKA?=
 =?us-ascii?Q?B+pg51T6lMnEzdI1g29qvbAH2Wm6m9dYNtZIsVyyKwy1eC2zegakQgCY5MGK?=
 =?us-ascii?Q?tX+QYNAuDTEMYiY7Phhp2CIkWcjE+ZLKwMZr1XVbS77IrQf/MdmfRevyyg3B?=
 =?us-ascii?Q?Px3cQpMV7PTWT/8rJEasQJoUT0/NyEyakuUmW2PPZHWTmkMZfoL30pzcsqDv?=
 =?us-ascii?Q?sE8paQRO9DvtZV8RLr23WlIZdWGNvq480lG9Vdhli+1MwvhQS/7HwQyHFs08?=
 =?us-ascii?Q?waObbSlHHEyEpL2m+vnL+LY0VnD9b7jLKlIj4naOhWADOI8EBXL3+KZJq1Nq?=
 =?us-ascii?Q?v9nH/vQUIOB05j28d+FdH2jfp1kEhgRfYZwB36cmegvy0ewuy5djYSNEEEiZ?=
 =?us-ascii?Q?SdyVHF/i0+UcPx/Av5oJk5tL6lufkPy3uF0EPJ2xb0QKS6MG/mflQPDrRIc1?=
 =?us-ascii?Q?4fl6U5kFtQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: KqybQe8kZmTRYxkLyFkI3FfWlmWf3FVTziOa+RgjUQHXXVcCZFdMbSfvOFydVpQkirpRg65SmDc5kHK1H3gVBseWN6jvXRVHS6GVuXmuVZj/T0VtvmygjBptF0/jWJI7x9wXaboQUeem2mii5gbKC59LvHp9h42syIrKoC3kq74pRvfNj8ls0NGX2KIgcgRr3cQtTHh1QcfkMPrOdghtvl2qUf2JRYxdRUZVArk3Xq+VM7GH6Es5LFIr1bkghIZ/ec4MbV6r4vh79TwfMXRPbXdzAb7TJbFaL7U7GieBwJxpZr0AuYOIBIcF2u4Ow+TQQewZjzsv3KLYAdkXm/G9yA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 132b732d-304e-4058-eb56-08de97d4cee0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 14:15:39.5330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr+p7nir/XA3O/Xh7SkJTUhlgIpHPhDJSdzHi3oz+O290GVzebd8Qm/iin8RR7sCYQzT/3m65Qv02OXtKuSfyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Ihor-Solodrai/bpf-Avoid-faultable-build-ID-reads-under-mm-locks/20260411-130435
head:   f8deb0e1c083c7f024a2e93514e2715c37899388
commit: f8deb0e1c083c7f024a2e93514e2715c37899388 bpf: Avoid faultable build ID reads under mm locks
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260411/202604111343.uFEJZS6D-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111343.uFEJZS6D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604111343.uFEJZS6D-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/stackmap.c: In function 'stack_map_lock_vma':
>> kernel/bpf/stackmap.c:172:42: error: implicit declaration of function 'vma_start_read_locked'; did you mean 'vma_assert_write_locked'? [-Wimplicit-function-declaration]
     172 |         if (range_in_vma(vma, ip, ip) && vma_start_read_locked(vma))
         |                                          ^~~~~~~~~~~~~~~~~~~~~
         |                                          vma_assert_write_locked


vim +172 kernel/bpf/stackmap.c

f8deb0e1c083c7 Ihor Solodrai 2026-04-07  161  
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  162  static struct vm_area_struct *stack_map_lock_vma(struct mm_struct *mm, unsigned long ip)
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  163  {
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  164  	struct vm_area_struct *vma;
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  165  
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  166  	vma = lock_vma_under_rcu(mm, ip);
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  167  	if (vma)
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  168  		return vma;
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  169  
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  170  	mmap_read_lock(mm);
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  171  	vma = find_vma(mm, ip);
f8deb0e1c083c7 Ihor Solodrai 2026-04-07 @172  	if (range_in_vma(vma, ip, ip) && vma_start_read_locked(vma))
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  173  		goto out;
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  174  
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  175  	vma = NULL;
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  176  out:
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  177  	mmap_read_unlock(mm);
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  178  
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  179  	return vma;
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  180  }
f8deb0e1c083c7 Ihor Solodrai 2026-04-07  181  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

