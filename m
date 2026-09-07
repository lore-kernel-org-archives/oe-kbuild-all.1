Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3049449365C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783002; cv=fail; b=el8MOPBrJemJXbKo+WKru+92ZxX5hlnPi2nje5Yl+hEHYQFQZ6Yn0Z8Ybzhe9T8hY0Hn+Teu5/3Zja5NvnqDuI5y+8rVYCw82xbRfWskcI0RandyB7raiJBDvjSHZcuVV/AQrLwsWdu9NSlck5sG2TSywfjdHb7BzbNBIcssmLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783002; c=relaxed/simple;
	bh=GPo5WAwH7HJkL5g7ARMOOoYDkX1QS5SX+WcaLwewgMA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=YZr9bYl3PkOun33QHlUSakJ47iDrBDUIoWnsmp1z4RCnPvCLJwmTFY1MJ5Df5GP2tS3D1DlmU5gRbNLWyKVnz8alfi4IBvCApF+kMP3UVSZykN1rMiXEJtPfVCFGy/SUOeX0OQSflfsFP2NvVWcg77+H3YNX8zUl3oygN8VdjdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/ez7GJ7; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/ez7GJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788783000; x=1820319000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GPo5WAwH7HJkL5g7ARMOOoYDkX1QS5SX+WcaLwewgMA=;
  b=g/ez7GJ78uDBwjoQBJXzc0oqNwXtjAlKdZhnhUJB1s2+UYwe7/B2v7bo
   nFh88T8y395gm+2pjfUbsJzckVndoHBWXKCEfO5j8CEhe/fpIOKjSt80K
   1/iCht28n5ES8bORSkWOw5jqXciVl10oxyMyQ5qCAjrXDpgmTloWTfHmn
   U5X9TSgegFNM00oQ/Br9ysP2Ttlgvhq4cydDN3vupAdQRWQ8Fho0tQYdi
   r59alFCFVm3LUCd7Dta/mkXO30JogRn7wh3k6FzBntFiZOYI4riXe85WJ
   EvRRX539ff2QuqKwtz9zgOWqevGdVX3ZdjtO65KldzeIR/nUTm5kwtf2N
   g==;
X-CSE-ConnectionGUID: Jxk6liLRRN6XzYzaCyia6A==
X-CSE-MsgGUID: 5S9BCPO9QGGFoiwz+CCoZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99519080"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="99519080"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:09:59 -0700
X-CSE-ConnectionGUID: 04xexPYcRqqh7m4XNochoA==
X-CSE-MsgGUID: haXMgSB2QbmTbQPBt87wbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="270665214"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:09:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:09:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 05:09:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:09:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9S92j9fd/QWB+5jxtfy7jMJ26Tp6Rs3jB9v1Ef/0xJC2OobE1+0EIBDtxA/MIAy2NFy0R1wNYCtXWU4gRYGjdFBaDgTZjCoQO60+FG5Cjl0ifsWQh2wzF8K94ys/V0EWQzXtm1LTh0bfHfflmRrRNbzfuIFLk1Q6F90a0/43V5jE8euFzykB1elXyj/+N9JS6S4DoCA+sxRcqewTVzagEcjRoweal3Um99RzqLKy80u86Luvdkp2/clObsSThNeTV+shRTGD6XgC8TStgMsLRkQDVN3Vs2bvDqtlJSAgzIsnMQuWrMSkqagTqOKDqQzWD/jqnxLGMJpU788RwbolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzpyyFHmAmLSjlwpHzjZORjeo12bm8t/AJtR7qvVvDs=;
 b=yvRA3SViHejYkgeIcVElQo4AfP0T9SCnX8i9/gZqBQzGqIfW7OpQdcuOVCRLNaqrBhD1evrkBDPDcrjOiZEWjpe94UYdG/+oK1y5hdPyco9gPUep7m9jyV2LPStY1UVWOmT/DyKBFmNBwuheIvHMtRc2b+1+KvR3tQdj0DBFG3BbbRcuq4eNPesRgOuewUiBM2RWnrVtEBP66vc34TA+2ApraHpStssmd94YsAvKBDkFzF0a2Oojrw2U8yZEBiTEFwunnAFL0W88jAquqAlbedyNBaObR0QI+vyxigqxEXSvi41GqLlo9j7ddsuttxtdrTglJXORVrTtUXPi1GQ7vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by CO1PR11MB5043.namprd11.prod.outlook.com
 (2603:10b6:303:96::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 12:09:55 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:09:55 +0000
Date: Mon, 7 Sep 2026 20:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Maguire <alan.maguire@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: kernel/bpf/btf.c:8758:undefined reference to `btf_kobj'
Message-ID: <ap6pi17UYBer5ED2@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|CO1PR11MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: 532f47b8-3fa9-47ee-658c-08df0cd8edd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: MQEi5FlJsnXWMh+n/alqZFvoB54Q8OcZvcNQqB2InmSyGz308lKaaSyIttOmiaW7HDcvKDK8Ki3adB998vhzxtfeCSGt+m8t67so6BaHLGXsYbwPyqf3m16lV+GTkLu/4LGZ7tELk3irUafKRz7CKovkabokZEK/jLU2KGwNLfZWbM7AmYtJPMwdTS6YlbB+z/02v2nkCZuSElgxtCsRzWFX6b39IiJGmBcdBoAl7pmI5732L3WIjBkP7C2q4QHBM0V1MATnrkpIaPwmRiH7UGboUwQoZgCxugoaaA3iG0fa4wN1cFVWytzCKZ1UOb1MkxGZL7vOqNBgxRSH3F0oao2z7gs2cVgWuY1iECcsrrpKvVupT02yz9s02fsiJc7Slbl+PW6pYqQrUpRSKaP7qojEMIsvowaMWXP+jksqGO3OQny1JSXr4kI+9JArtJ76CcCPwdyx6dUSRcOQ67cW34z4EY7QgWIpFb9yytmfx5ldFlzQCGVs7D0nFK26ePDuhG00uEXFzc7gfXK/kjDFD4II/WXJcCDSeIMrlYneI6Dd+T06EZDKeMhaSzpFHlWHuLVGpgTAOwNGsrBEQd04k/HslwfFoIB3zr3q5C63767UH8H43Rx/FxBBTHucqEvB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yoqcMzLPP7/8F7kQlu9gbvcJOuPbDsSEQ+39TE867WHs/KaHj7SqNs9pbAOj?=
 =?us-ascii?Q?ac4MnJ9hjZOXtbLL7xT+YNTFhxEClcFsCZrdH6FI7YA3y242LFPmmz0hC1i5?=
 =?us-ascii?Q?Vez4OZhhvbZKwL6NwblfGRaFWsZC0qcAvn/Ow3YvGYMIXgpQ8y9jhYiyconq?=
 =?us-ascii?Q?GyuSaEDXIwzFthRLw+Slt0q9LFqTVqAr4Rz2qxuBCt0MU8G76XiFtYogPLWm?=
 =?us-ascii?Q?bxgu7rZ3ixlG+PE0bG27IV5lYiFNH6GLm0/5nM0BUflmdRLncauRbt0dtRBJ?=
 =?us-ascii?Q?Q1lu6r8mdm3ZLxFCnMPF30q1AVquBvWmkBjt/CTDqFAaIgQh4gdRwGmakb84?=
 =?us-ascii?Q?CL/Kjpqhn8xWEdsXYWjn9gfuRGwtauLHjvBRihTI9upcSS3qSDVl/kbUYmsV?=
 =?us-ascii?Q?Vtjq19qNgviN8JhFvTQUEBSJ34YpImKjDSOProiofI1SCbGUN9EZGdNuoNbq?=
 =?us-ascii?Q?T0m7fQcYe0z/8PidCMsB11ZFpwhL2OqSHWz96mJEe1xIWh1KojgBusLWy3f4?=
 =?us-ascii?Q?OZe9iCYy4FQz5F+kfEBhQVsEhI6823epCxa1dqUXulgY1IUhcUP2ZginwwA3?=
 =?us-ascii?Q?hdMslAcufKLRhT91lWsaobflgGTCJI0GNE5bnIVtlgIRmEFSaF0vl0yyi1pm?=
 =?us-ascii?Q?ov1ghk/Ka1KOufiiCZWRzV01SPQ/YPWPNRntQT9wQa1TSo97LsrOCDXXEEeY?=
 =?us-ascii?Q?KRdo9quKRPPl2dNKoBuxas9X08Uo6HoxaxF43ODYnlZpEtZf2PU3B/x9ubsn?=
 =?us-ascii?Q?Y3QGnYB45ra1H8iKeEQ1kwRNZxuw4DuDQMymOplh3K/H294EhYSMMcBz1KHF?=
 =?us-ascii?Q?+ctcllQoqdHVpopxdX1xQ//76PJq0COgfko9nrKBL1J5Wjf65YpcbJJtZam1?=
 =?us-ascii?Q?eMLkJmSMTf2yDyGr3UEFdTduIYFzjBegHac8bXEMKhgapgEsxfCJcvka9xYb?=
 =?us-ascii?Q?kqd82PCxdTfyrSb11JWUW7QBUOHy2y8lsvIt5On4/T5+p1dqvZ9DOBAZbDR7?=
 =?us-ascii?Q?1yq7+auxNQKppaY+jnO408pb/otfzhJJdBSYdxyeYTPeeXn6tJtPfrmRpgRw?=
 =?us-ascii?Q?0dV6PZA3XmWAGlXNUE+fSLsx5/fS/0n1ZSSa5Y34s632/u9tpXLAAZGDz2DS?=
 =?us-ascii?Q?ueFDgGdyQT40xIsH3hGqh+ve6jXw3gDW+kc/egjczgTtiZTkDsNxL26gAg5i?=
 =?us-ascii?Q?wteE2/rw5t2hdYURA6i8kDAVIGTA0HzVn+ptky/nCkM81FKlpgnYRNMIhRof?=
 =?us-ascii?Q?b9U1osmfP7gWDUWOL0Yv84g3gRCfAHLLkrW44ZyECjAfLN2s4x+HI5pdTxPi?=
 =?us-ascii?Q?HcC/oAjE8iTl4PsqQFL6OSQswlMFQorkZzILljstxkhmX/wMq7Vi5y2pCwhW?=
 =?us-ascii?Q?WOqB72cQYTLOJ8rZ8pb00UXgVWkqLHs5XeWKQXv70JKaa+aCi1gnLJSuTxL7?=
 =?us-ascii?Q?K1hzBHir5k405mQ4ZPjILBWRKFdmS6wpTdoHArjqJFmI+MdQexzOGEqU/xXP?=
 =?us-ascii?Q?R0yZ2IR/N75OJpDWb1x0MvBWj7cm66oXzMjAdQofaXJ2Aq7HWffSJ2yYHAag?=
 =?us-ascii?Q?mD6RUqiX5Gadu0QPwENXPO0jH5pNlqP8W6jiWNVPuGrY6w26MsqupxCfFDcN?=
 =?us-ascii?Q?fqzRt/hUnfeUjJhVIsky1Ws85OCqAUztlnnxWocs2uhy233ZECvPgytqCbMk?=
 =?us-ascii?Q?b1YLXwdfsxMV7ieNX5KlYR3MQTkmghnww3qWx+rY2mrzE6rGjMEhokfQmSNy?=
 =?us-ascii?Q?YNQ3RmH0VA=3D=3D?=
X-Exchange-RoutingPolicyChecked: tx7WTLdqfaBV/J9sgmCD2EoLo2FYVNqQ/Cza+7w3DNZQTXPwtJPZOFLnsMYdvr/wmVWK/E2/waG3Ss6f4tfP5ndkwHGiRKW/rZr+ZKhLF4Q0Ozt5o31umKiYmIiso9S81/p51POEK8jlqxYDiL57gfxhBuB1UHDilqjbh56h5IncJF5GTKLkmiJ5COX+r6NfVEv8J7Z2xZ0n/t7VIV+gyg2xPpalH/jmV+TFwDbdwLaeES0bbmGRRARAyUw0gkMjCCZpd0VeSC+4r8JbN/EiQ67mbCwEEkdG0BuqIKRo7XQ0lhu4Fbu3qd6gT+btxAG37Ty6LeXjhaDv/0XImvKhmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 532f47b8-3fa9-47ee-658c-08df0cd8edd8
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 12:09:55.5683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcLOn+VDIEVugrG4jkZfua8VRGvjK72k1A+rEstnmo6AMWmx307LyBGPK0mSiDykUpF3b8nY0Sww915kquKoFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Alan-Maguire/btf-Extend-UAPI-to-support-BTF-location-inline-site-info/20260901-175740
head:   9e05e3a3098276adea1e7277934c60598cde310e
commit: ef28548058e47e9c824316fe339f88dfd00c35aa btf: Make vmlinux, module inline info available in /sys/kernel/btf
date:   6 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260907/202609071155.KwITLv3v-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609071155.KwITLv3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609071155.KwITLv3v-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/btf.o: in function `sysfs_btf_add':
>> kernel/bpf/btf.c:8758:(.text+0x10363): undefined reference to `btf_kobj'


vim +8758 kernel/bpf/btf.c

18688de203b47e5 Kumar Kartikeya Dwivedi 2022-01-14  8737  
ef28548058e47e9 Alan Maguire            2026-09-01  8738  #if IS_ENABLED(CONFIG_SYSFS)
ef28548058e47e9 Alan Maguire            2026-09-01  8739  struct bin_attribute *sysfs_btf_add(const char *name, void *data, size_t data_size)
ef28548058e47e9 Alan Maguire            2026-09-01  8740  {
ef28548058e47e9 Alan Maguire            2026-09-01  8741  	struct bin_attribute *attr;
ef28548058e47e9 Alan Maguire            2026-09-01  8742  	int err;
ef28548058e47e9 Alan Maguire            2026-09-01  8743  
ef28548058e47e9 Alan Maguire            2026-09-01  8744  	attr = kzalloc_obj(*attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8745  	if (!attr)
ef28548058e47e9 Alan Maguire            2026-09-01  8746  		return ERR_PTR(-ENOMEM);
ef28548058e47e9 Alan Maguire            2026-09-01  8747  
ef28548058e47e9 Alan Maguire            2026-09-01  8748  	sysfs_bin_attr_init(attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8749  	attr->attr.mode = 0444;
ef28548058e47e9 Alan Maguire            2026-09-01  8750  	attr->size = data_size;
ef28548058e47e9 Alan Maguire            2026-09-01  8751  	attr->private = data;
ef28548058e47e9 Alan Maguire            2026-09-01  8752  	attr->read = sysfs_bin_attr_simple_read;
ef28548058e47e9 Alan Maguire            2026-09-01  8753  	attr->attr.name = kstrdup(name, GFP_KERNEL);
ef28548058e47e9 Alan Maguire            2026-09-01  8754  	if (!attr->attr.name) {
ef28548058e47e9 Alan Maguire            2026-09-01  8755  		err = -ENOMEM;
ef28548058e47e9 Alan Maguire            2026-09-01  8756  		goto err_free;
ef28548058e47e9 Alan Maguire            2026-09-01  8757  	}
ef28548058e47e9 Alan Maguire            2026-09-01 @8758  	err = sysfs_create_bin_file(btf_kobj, attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8759  	if (err) {
ef28548058e47e9 Alan Maguire            2026-09-01  8760  		pr_warn("failed to register [%s] BTF in sysfs: %d\n", name, err);
ef28548058e47e9 Alan Maguire            2026-09-01  8761  		goto err_free;
ef28548058e47e9 Alan Maguire            2026-09-01  8762  	}
ef28548058e47e9 Alan Maguire            2026-09-01  8763  	return attr;
ef28548058e47e9 Alan Maguire            2026-09-01  8764  
ef28548058e47e9 Alan Maguire            2026-09-01  8765  err_free:
ef28548058e47e9 Alan Maguire            2026-09-01  8766  	kfree(attr->attr.name);
ef28548058e47e9 Alan Maguire            2026-09-01  8767  	kfree(attr);
ef28548058e47e9 Alan Maguire            2026-09-01  8768  	return ERR_PTR(err);
ef28548058e47e9 Alan Maguire            2026-09-01  8769  }
ef28548058e47e9 Alan Maguire            2026-09-01  8770  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

