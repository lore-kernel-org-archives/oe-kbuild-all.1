Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7052D8387
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768740125; cv=fail; b=rKF+Ci+eA11B1kDpIuYX9Huya0LwRuTCMouWahTpO2LvdujzU/bbUSOvUuNCfv5FuAaGriwJAQj7VzMtWzQmQVfBqL5Tka0umOCVlpirtYBbkwUJx55++nGXjsQ6h1GzIQ22X9Cb18W35iqPokvmiSxh0xNrlMIuBxG2sVXsbx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768740125; c=relaxed/simple;
	bh=Vc9ebnZTv+UPo51mnEFQq2FaXHVlG+3eN20mcUt2sao=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=YtkD6jiRljyMJ8gL5XBPwTsSzkESfPwNOt7VYtjnNGl2xVFwiu9waN9skxdgPjJh2XvVqe0dFNz4KItv0MpRhrIChW+QIKHyNI0Qq0iYazRscqngKpPdDmQsOyrVcaqsO1CuG7LrJzeVVK2F/OttX9h1ZPkuojjyyIOxzfVmabY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQkAEd8s; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQkAEd8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768740124; x=1800276124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vc9ebnZTv+UPo51mnEFQq2FaXHVlG+3eN20mcUt2sao=;
  b=ZQkAEd8s20QmLyuMGfQK5uB7Lzypt7rn+mCzZtSRIYeF+ik4GDi7F50t
   zeHIwaqyoFs9vWXVeO4N++811L1Tl38SG7t6tXN06lS3O225dPViwrNBm
   PMr9VMDw/+z8ureb3QYqZOVjdn9fokXp3Sm4nBM7OBbPSO2tcJJpW6+ta
   XC5WsziqgPk6nVqEkI4bWEpfzbmb73Xl4eHk0j1tQLVi/ls78hFDxxrJz
   sD8WgktBjC5X0y9z/MzlG0uJxov7YLF1sZ+uFXH+6dtzhIRzh7yJcXpbd
   X5XpFiXZSV5LfVFkgxGxhphbluULXjZ7OvQ0GPcZWKvFCVQfTUyj0VmfU
   w==;
X-CSE-ConnectionGUID: aHFlx/IgTHW1xsfgOhH6qw==
X-CSE-MsgGUID: BMUCpPNlQ4WhoYqtn91LAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69951498"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="69951498"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 04:42:03 -0800
X-CSE-ConnectionGUID: n4Hbfn3HQOelhMtE/CF/lw==
X-CSE-MsgGUID: 4V1II+oITo2pP9xO5Pt8Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205694111"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 04:42:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 04:42:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 18 Jan 2026 04:42:02 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 04:42:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhFferCOsNRSkSgBHfskwRP8FA4A7PBX3CJxc5hp+N7DCJChA+9Gnrj2+d8dzuuGQiVlHJW0YRZ6uIxy+EyZFSzasvSDGVFHkmYAiyvtk/2klXWQA4nWxDnFBpaGLX81JXmIYGAwg7XkH/O2DqWWhli8fhGDD3ukjFeF3lkWR9d9KwbtgkGcq5k+FUJhuiUhHb83fTwfYPZ0k4wxjbd/UoPDgfnBCZ6BC7cRpSsj3VpFz1w9QraMW2XzHfYXrMwEpuEhWN9eLftasIEOD+aVsN8zc05ZS+k94brkGULjoth78U1SQBMC5QfCxiQpQDLcOCGo7FY8DA+DY+aRr+Ps7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDc1Iye453bqphFhcqaRdJksPHCrfJ+gxVF//lY4YQ0=;
 b=FoBosmiOqZfcuuTTxw6vG6kqXuoLVsvkmvzpBVfGyxYc0bFZA/TPjrFPsm8z9IiF6P0jYtksFbIbU2976Mq8XmSJLhG2e6fkKUabCUBsqAbdxyawxVeHtMBntC0PXQQfAXw7Z89i2UnlJf+Jl17/CH6YZOhn4CJgolczHdDhWJACqNoHw+fjaBbRg/0ck0Xw96js5o5mca0CLVBVXtBUAU90I5B07v5yRQMtuNsN01jeNzCIzj+8KD1dNKWoxQP339tQX73HfOSQRPLYOmS4ewf1w3VEaNJbC7sB32mqCJzPXxxHXpkPN5tjUa+pofqINfVlkjuIQo0YUpZJiL3Z8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by LV1PR11MB8852.namprd11.prod.outlook.com (2603:10b6:408:2b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 12:41:53 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9520.010; Sun, 18 Jan 2026
 12:41:52 +0000
Date: Sun, 18 Jan 2026 20:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [fustini:b4/ssqosid-cbqri 1/20] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Atish Patra <atish.patra@linux.dev>,',
 should be: 'Atish Patra <atish.patra@linux.dev>'
Message-ID: <aWzVCSAZYczqcLwG@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|LV1PR11MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 2538b48c-85c4-4ba9-be70-08de568ef495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QhTn4V+mTh+aRQn4RMto3nCqqmw6SjAM3Z/MX1Q3eb/+UT72VhVa9+17Pv5b?=
 =?us-ascii?Q?39nog62A7bexQhWFYNdJsPbqW4sgkE3ABElW89nMp/ONirxMKC8VMrh2Er1O?=
 =?us-ascii?Q?Cnv2BmecXMv+/owKJUkeG1e/BCzKeimEgddWvlxl+g4MLlPhsPYQEr7xyk7F?=
 =?us-ascii?Q?dHS5b9eBwXz2iGy5ArTe21Ozn1igY+QLs8/OV75Y7JiqbsISnhq2q7ZRt1XV?=
 =?us-ascii?Q?v0DFm1iyPkf3U1kxB3DNcLGWv79Xu114r5R4uVzgFM/80uFu7LtjYUAImOpS?=
 =?us-ascii?Q?pmcG2Z6XvKSbsGhibEZFvmOiz0qGEwRypOl5DxCCV7kVJ44avwh9HUwMOyhD?=
 =?us-ascii?Q?IpoRkIQE+xbzSSxb2xbz1jk8QB3mlxyGt5dLQ1CC/ddAifdXzK8MsK7bMfX5?=
 =?us-ascii?Q?H3IpHt9puHJk+6/1sT1JAjOwmXNk1MCQHWEWjbLLb3NnBNQxo96ZwgW05pcf?=
 =?us-ascii?Q?pFkIKNR2JID8weHSANKQCBdT2ShOIRq0azwtIC/ptka9PNZJW8cztXtKFx4e?=
 =?us-ascii?Q?ac/WKf4JwUI+G+N3ajV0C9ciZpDioNENDPOLKerffg7v3QDa/WNWV4U93aTa?=
 =?us-ascii?Q?o9nCQ5HxPEBdXpJoYbihTkMG7GTZ2ntS67Vk0isUS/WuwtxL53JiAf2IMSuS?=
 =?us-ascii?Q?vb4yVJxlfmvGbtA78GE/IXJ58Cj+3kJpo4uOW9GXB7chUuSCet7oL/ugpJGz?=
 =?us-ascii?Q?iDg97sEjOzxw1FkVDeMH6fF2dMP9OJ2WnZAk8NkUgsRBUhp5JAK2aKBTOHJg?=
 =?us-ascii?Q?kRFnsq9pK11tT6gK/67qN1L1DdF6s6ozAuNlo/PUrl03g/qQHb8K8T2h5yUX?=
 =?us-ascii?Q?MKgvKY0tzUyGEfJ2cXIb5Y56P6s6nlTdw5Vmg92EaL5kiken6wKxzSMED6rw?=
 =?us-ascii?Q?gnWzq8e0j/O6/OMjW2egPw7YeHdv5qG1r/2WgilN3QKk4zRLHvVMrBnuXorO?=
 =?us-ascii?Q?UzlX0xqoJhoUgdBsm//aR0j0SRjkVisd1rB8m5GOGu076HmSGIlhC5VA6qbK?=
 =?us-ascii?Q?CGqGlFRuxF4M5CqBmc6k5AssQEDHeFUwdE+tca5izrN949QeN0v21sf2TYaf?=
 =?us-ascii?Q?r6YhSB/mCEmZ8SfF1vUaok/2MJUm4ydpsPOZs4eJNqiqDCZMzxec5+KnKmkr?=
 =?us-ascii?Q?6R/DyLs/zXnQfDNIZNRnCmLuQ70ILDh2JdrlLUMgr2ZHHSw+uk56cE3BaVLN?=
 =?us-ascii?Q?hFxjT6RNBqUNOhnr5Ml5oteCP9xux29iSMiipIfza14u4zhfSYZWir6e1VI9?=
 =?us-ascii?Q?eOdb8mcXnm7bmg6tPiqIrcxhPlpw4he06IEc6wJWsNOFVYG0VIR+IA52Qvx5?=
 =?us-ascii?Q?Kl+JaljQ1Qnx0mTA5rFqxzWHa0pMchBv5UCUXkjKz7YMrqLjRLBrKg/I7ZC8?=
 =?us-ascii?Q?9JXx+hqA00ztxdPmrvUd1ix6j9ceC26IjhJqWv3Ri6owPCJIkhCekt80d6xX?=
 =?us-ascii?Q?rmm1xZydgnH2+cvFyJxdG9PMg5OaEsxjV2isIeEmQg+L2TMHNC55+/ddTP8o?=
 =?us-ascii?Q?tjshOQHtHABMcZpsoLe0xOrj2M9Gld/PohrO7EqL1G/MsHv+HZ8Wx93+dSq4?=
 =?us-ascii?Q?khBxUx9xZpmaYLlrq/qFMPTGqiZCHdExA+HnfsGo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vnDHYNVp6JheYZJqhPbIYpePiNIKWk8vumZt9ovfDTwquvxGwzqtMi7dD6X1?=
 =?us-ascii?Q?bl8kBg7whOLVSXbOLndjGlgG9dqH/DSGWV2M/7nisVMrSwuNjj03CQzi82yn?=
 =?us-ascii?Q?8tk5PX4ffL7DZmT/CJqDr4h2iC/0TLLquKbFmFkoBcrhHCxrkTvnZewTA0I8?=
 =?us-ascii?Q?iQVOeUs8Yhg1w3YAkKny8gg5bfrG2avommFbQuAQR3nspLli/Xv/PtJaDTBK?=
 =?us-ascii?Q?vcboZegu2LyYdTRuWCjReiD3UHBc62C74qHSozmey1coPoXT8+AWeKGCdJ0k?=
 =?us-ascii?Q?tr+VyD8Ewxf3PakGi8321ekRhw+tnxm4IMNa6ZyoHuC29DnjsTfeVyQ2k9wU?=
 =?us-ascii?Q?MgDYIZVCMRkqPrHYfXsG1OdGDmR/Paq1WdpESSRHe9rybxd6TY+MXiktEKZF?=
 =?us-ascii?Q?ncn+5/BX9G/Uc0gxXmj3iZiGxmPsGbCldNG3g3fQv/YIpn+oadCgH5iRseRj?=
 =?us-ascii?Q?Pf1QmV2XKg7+xQbf1g5pmIxGcOnF/B8hg+yPHQ/WhtGhPSXTq/VALVNR5ccQ?=
 =?us-ascii?Q?R8eEz0cGV5um2Dfo4mK1TxsCSiqWIQ3oce2LSrRngUVsD1H9PUjoTUr/XQyU?=
 =?us-ascii?Q?DQbm4CH8WY8x9kQBB6ncE0K42GeoDJ+CDpMKssEQYbd0b2gy6ptHyEp/tOr3?=
 =?us-ascii?Q?Y9N5staERPZYJttlB7UjZh/Z4/QjzyAxDdE5JaIptWSKb0DqOjR5ajcKEubP?=
 =?us-ascii?Q?KtsaXyyg9w71ItHMBlNFJ90AC53W7e4HvJZcPLCV9IKAzUEgNDY+IAUsKBZY?=
 =?us-ascii?Q?tmo2EnyztZoasSR3DHEikFG6CVJUOktHzObEi6pcjEyLZ7gFbe9YGhuRRx7x?=
 =?us-ascii?Q?NPyI2B3DSokn/DUt4ubJGAjDM9oHf40C6ZerIFOqRMq9hRbSw/nP5rq52JVg?=
 =?us-ascii?Q?LXD2XxB+6kSkw/jtp12BCZMR668wJQBBMNVqNR7LF3ulSoHBp1gyf/4iPynN?=
 =?us-ascii?Q?pLqG8oa8C7eculwY1k59d8DKZrhlv6tCyCWCY5laRSlmsEn0WGR36fzUlbiq?=
 =?us-ascii?Q?E1lYsefZ4KZW3bmFw8H06ba5D7lAkPrGZDfROws1VFDL4o+KsjE1NijHvdo+?=
 =?us-ascii?Q?5zDO9K7QcjQbB3lpnheJ3YaETpuREUXoDaCQiCzXbjZyBs4pOIVxUyr2tCr5?=
 =?us-ascii?Q?uLBSOns7kZkKs7r5o4pKIMQX2pJLbmUvYQveePWwFgNaN1yH4wqNjeUKbP9G?=
 =?us-ascii?Q?dSencz/YieMlpQRLsiQja6cJRcjNBR1E8e6q/Nl45c+lfVwdiHgSUEz284XF?=
 =?us-ascii?Q?85szhmATIeW4Gw9lkIhWpnkNh7tKALaBAjeqHPLJzfr4OHVD+a4/tj1Of+lk?=
 =?us-ascii?Q?RmSvnYLifiX40HiU+0g53mdDKg+AX+SHj8xU/qcQYr0Iqt1ozsJuMMttYW82?=
 =?us-ascii?Q?2JZaFj8DynLt77i2HoiQ/aF6xpcUJpRqv0CuBWI7rEtSbwiHY1BLRSBWTBpi?=
 =?us-ascii?Q?iYB7RhZttCC2I3hGb7IQtasyNJcG/v91id/V4/nQusYc7YonOw18Rq6jkhkY?=
 =?us-ascii?Q?BfXGLH4RLlEcn9w7NdhAeO+xdLTxoKHh573r5yavKOq6MpjjhfJE9YKmpx3x?=
 =?us-ascii?Q?hjc3ZkgQRStXaWiwgqa521szvbE1NSRjbMBhKemC/Eygcu721pqhKvzjtbt5?=
 =?us-ascii?Q?iYbtfZkQ4LUXs5U+CVrDaHC1vuv8maoNwNqC/bsRWcHz5KoivvJ1f6QOsYqP?=
 =?us-ascii?Q?nfYoPsrZhZtRxa3H5BzR407Cln4I6T9iL4UoJhuBD3/+emUsXlESzJYXs2mE?=
 =?us-ascii?Q?4Ui1T6as+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2538b48c-85c4-4ba9-be70-08de568ef495
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 12:41:52.4633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmPiaM/ESEOVeRcpMhcLN6f2HrdZ7UXbHN1kY/TWJ90TQG+m776JWNnjR8KPSyy+o15zzHH6+fyHbGHTFk2DMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8852
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   b34c2f7cb87d02f5b712e9e35ac9b66d21ce07e9
commit: f7864630e49c56fc226f26961c1f49007118469a [1/20] RISC-V: QoS: add CBQRI resctrl interface
reproduce: (https://download.01.org/0day-ci/archive/20260118/202601181104.5Kr6l9E7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Atish Patra <atish.patra@linux.dev>,', should be: 'Atish Patra <atish.patra@linux.dev>'
#203: 
To: Atish Patra <atish.patra@linux.dev>,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

