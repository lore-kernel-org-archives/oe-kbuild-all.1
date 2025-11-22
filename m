Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1359E4C97
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763820368; cv=fail; b=lcTUCN82v3LZqcsITh1MLFMQPlwaxLDrS6XFRjyifsYHBO9X1pNnxq9oPwBITEkFa61hXzGRrizV0wCFW/XuBh/s4DSBX+MULnm6wYQex/66q3Rm41wTAJX5kz4FvevDTAlMHZv6cIwAhj8BykOm8e8Dnv1fOGsmQ5YXvVl791Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763820368; c=relaxed/simple;
	bh=OrjztBM2Je3rGXAjArlZK0Gu7na1JEOqzuV5JZqzOQQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uDS3odskEqjXi6OxyN2xYc11INtsIR4c/iKTa9fD/Xx7onzJTkXmoBq14KOObIJ9SMhRGlRYXLclf2wNB1E4A9AD21wmy6EwVeepPpE3XnIROo2Lp2HnyQOoy5M71GVsEGqPtQKepvxMl7bwc5oLMnF41+2m5btGGVJrESmonjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBme2bdx; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBme2bdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763820366; x=1795356366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OrjztBM2Je3rGXAjArlZK0Gu7na1JEOqzuV5JZqzOQQ=;
  b=eBme2bdxA3uPqWib3MPfbgAgwRVyPDZiwRYJP8V/kSWWt4gv1OBZMYU2
   xG1/OZZq9mBQMmziC/4lH+JE01S6UhEoR4yyvI5mS13xmCTACQwtSojfo
   nuiAz4yl+exMEJAcfOEH2cBlWKoiThK7AcJqPaRoI0Yfdhej9Gifew+Wb
   5YhCf9X/ZZti71o81SoAwsGwjZ1e9N8eB37jkpEe+aH9FLzQ3BYDJ8KQe
   Xe1uTvJU5aNpIp8hhQfx4fMVNes6l1Y/1L/muKbZgdH9CupGMBr6gS3tr
   0vIrECqJurx+hRNHZ8PUmdAcbr4GwAmh/Lu5aEiGEhsQQTkGa3Vif0KVS
   g==;
X-CSE-ConnectionGUID: QrewZt6WSXSTceFADk1d1w==
X-CSE-MsgGUID: Y5L5t7nfSbidenpZvP5g9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="83512965"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="83512965"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 06:06:04 -0800
X-CSE-ConnectionGUID: Eb9016GJRR6JYz75r+e8ww==
X-CSE-MsgGUID: x/xoE1d3QnWy1b6UVMX/ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192046614"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 06:06:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 06:06:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 06:06:03 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 06:06:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlgJ64hyHdHJTrS5hMI7iTItv8X0UkH63O4yTPjIRRjaalA157nbPKHqk3ze8Z56ETeNg5QGPqEUkVoetWnIrLmoPTba/a0mhqeU22gamm1gaTpXmX5+Bdhs+jhyY2ejTxOz9QEN4thn1gY1fvzI7FcOAfyBqRAqYUYNMo+7zsmXQEsN5Y8SOSf+vAi4HS0DQu69I16nZNAGvgNh3TmBoib8XW9l1QVS3Ulc455YBHw2eNJqmBJ49NFCYf1KtCR+hnQcJ1e28/8tMvnEgEI0gYfGLG4k1fCiOb6f+FdbGoTRuxWu9OooluuktCxZ+pYbebOxQNmw/In3Pms3cvzFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TQlvazAqP6ApL7qc6+Hfg38460E2PvD/gFPHl1zjeM=;
 b=Hp3qkFITw/du12tehDoHdqq2RvnOrz74uTR9DOnJPhN2UwMVpgKO19TPT5VA640ghng4PesNq9LqoflfcxmWxYojsfaOA9bAOuSWhtF4IChswXtgxUCr4cYxckU82x/Ak6gSoPnglEwV8GHF+AlmSj7a5lCvp0MaQ4Q7Zz+eQ+z1td+QMVsLuXVSB5PGVwD8gl88Q5DnLw2W/6cRhA4mJD5/p5wi7LMLhS5EcuHQHE4HFVT5TYmVKxig78Dx69LTg802px2qvv//C6yfDB32NpFdPdQARw344j/YEWQhpSPCoZcxtxKRcggVFcV3uHbeVHh8SJqmcdU7JRQdTji+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 14:06:00 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 14:06:00 +0000
Date: Sat, 22 Nov 2025 22:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jolsa-perf:uprobe_mov 4/7] arch/x86/kernel/uprobes.c:1457:36:
 warning: unused variable 'sub_xol_ops'
Message-ID: <aSHDQuSUQHOiD2GN@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|IA1PR11MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: a2271e6b-8b55-42f1-f90f-08de29d0440d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rO3LOItd+1FL/vzF0vSgkjlqJanOgZTwYi3FQ2OKtVt4S29Rxt4TMjjTKm1j?=
 =?us-ascii?Q?kYKUvCdasgnfBaPD+RuK1Jgeyp2NafsggAVMWACZDqUAfi93+EmENdkifkGj?=
 =?us-ascii?Q?1270KdDfHbiwoCZ9MYfpd67ILENKA18uT2S9DL/8Q7OK5imZ6r+9962amnj4?=
 =?us-ascii?Q?nfziFuC2ltJE63BS7wCB8WuB7WfjgU56sX5DLk3IkzG2ZUMXcmaX9B4e60LQ?=
 =?us-ascii?Q?abZ+LX0AKCJp9xGXF/rJiwuWbpruDHexP3c6x1AHdFEAKEblh798yZUHbEbF?=
 =?us-ascii?Q?lafUZOJEdC4orIr9i9JdEV3P4IqQWfreq3zvSHZWX8cOtDj0Z0ZxtkoPN+bF?=
 =?us-ascii?Q?lO+O0FaIjeQ9zCMiIIJELbs+w7VHiF8BN/yUtwoDbGBPKG6b1Y6MRO5Rzdbu?=
 =?us-ascii?Q?or8NE2zL7AvIZaazDprid67wMFtFVQxVCNhBs80Q+9ic4Z61VNK7AEGZZvy2?=
 =?us-ascii?Q?7+It8Vp4+35MJBL86+SzcIIwMtXN2xWmh7WMW7B9XP9skpoz6g1hINlsZZiZ?=
 =?us-ascii?Q?3IN+qtKg653LLEWaRpuxrD5XgwzuJiyu0ppmwH8HVFpUUbxcPlz87gx/uy2K?=
 =?us-ascii?Q?m3dXTB9LoYZox+WyTbqqBEuk9DFZImj8qQ9QG7O7CcConLDNGwpPrxr+qmbK?=
 =?us-ascii?Q?cpvHXdMgcR0IhD0LyiJrjjW2FHDMPgFCaCLk3JBM3oJqYtNLVZmOWxYoiEkT?=
 =?us-ascii?Q?k70Lzl1/i4nkvnky4JgH3AEFyV5yvjxvx6RRYV8KKQ8/vXwx0nAN7NVTPbdq?=
 =?us-ascii?Q?WM86YxXO2R2k+VBfqQ6AB25FVaWxDZ3rNJe1Ej9NAFNG5dQswXzq3D6R26PL?=
 =?us-ascii?Q?utQ+SvJjyNd2Pfopm/5Sj3TjBe5Gf+YcC5lzhSXBSclJPBMVspnvjxr6Ze0o?=
 =?us-ascii?Q?uJfnSDMYj+qmyLpiD6uL4N6lB8I/M71d23sUAg7luoS0YtDAHGxXg5Dzf49Q?=
 =?us-ascii?Q?zRxqycLn4BUmf2T8amRGZuVLJzuSiwfoJfBUb1TDnunb46B0l8dwm2gsoCqo?=
 =?us-ascii?Q?Dvz7k9FHnA9sEk+cvFFeDAafzIfkVN3U+cqGhnndOBqepwG8qm58uvDLkR/w?=
 =?us-ascii?Q?Lz2307IJaTOZ8kAIPeEYd3UDVag2Fxcgjh+c2RNLVslW8dXm7Nv0rCOfWw2Y?=
 =?us-ascii?Q?hbHKPY45cfK6YmpChxohN6GYpVp/ufozCGeMRgt36GAllwyAKWfNeD+ZnUmL?=
 =?us-ascii?Q?+LpAIK+6Txxlo/I52molfsVPi6oFLT070eqJ3WJtK2j7OI0i6MIj3Zq+nKNX?=
 =?us-ascii?Q?y001yGIPc9J6twTgox87pV3U6S0br6Lq03KQKkS84wI/qf9nafcVXMDE5b5F?=
 =?us-ascii?Q?7flyQCUn+oSTlVQwNYaJGV1Hn01v72PKSi9B541LynRoeY1aJkBP2dABOMVN?=
 =?us-ascii?Q?4jpFjwSlf2uyR/SGnzVS4M1/zjWipyYZwndA9CyQSPqB4n5xBgclGzqQxx81?=
 =?us-ascii?Q?tCxyF0yIMTH6b/AbOMslIVZ+C1r8XhZwhwLRKwVLpjerrtVkmKDHZQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?svlbiJcdfOyFCFnKC633rrk6bkAWt/BMEf8/brJo6GM0lGFowZHjbcUp7CTw?=
 =?us-ascii?Q?moNo0UUzODj3rn3UjRCvuuyk1h2MaJ+dvseossb7EnWJcRnwJtgop00/eUES?=
 =?us-ascii?Q?WyceaLZhXMKh+ZXaF9Rys+tf+ud7Kr/RSlLWyGceNyARV8O02huPbBgdosCr?=
 =?us-ascii?Q?hibweaHBsAenIDF2xLgzoRpUgFpgDVDBKCg7PAcA/zmFVzeTcyPpkShheKq1?=
 =?us-ascii?Q?2/e369iaTNQMmcfXgsu+AvM/TF1UOf4W20It5UHmkLXxL46pdv6fEvsTBrW1?=
 =?us-ascii?Q?tJFFJN5Ziwi7UUsOe09FvRpZzlYlSSFbcZGtNGzGbmq/74sq5cK9yaumyfGz?=
 =?us-ascii?Q?vZR5gI2rgSsEdim3k38n64H/3H1TxBTAm0Y3TZC9OrstWe5u/KZ11f7jaDPv?=
 =?us-ascii?Q?uwemIlKBVBcaRMUwLMLy6C41lX4h/FQX4qCBuqC1Z9sB0eo6oDZVVHwVCml/?=
 =?us-ascii?Q?jTGKVFD0ihT2kJ+erhFFEE3jObPc1efoR3/Ah1S0mdoJzG5kkY2GURA7nxDr?=
 =?us-ascii?Q?JB/xDPi1FVDBxg9D8IMIo5GgFcjlJL0Fpn6+isZJEPO6hBgGQkuK4m0xh5V2?=
 =?us-ascii?Q?1bG0eIu9iYa9eItDQjW7QPTRsp0Fhuof96a1vVN3wHMqOqu9AQsbTYfFP4ZM?=
 =?us-ascii?Q?yR7StPly/lXA3cFqp+iq80kVmDq5CJYEoHuGLp+CmrZC/NIRQI3VLt3sZKdK?=
 =?us-ascii?Q?n+eXN0TWv8YLABlfmHmUhSPLQfF8vCxo+qY+3bY0jL2xzGx6wBXJbkM3MYgi?=
 =?us-ascii?Q?HMUE/GWxtVlSZxKExVW27kFSEXfUKQ6fC2LVd92P1XAgvoZirB8rG5++/18N?=
 =?us-ascii?Q?OHNbdqkE1stnr6oZOSnNNh5prkmgntiNsT+mXguYFqdt+mIDKzTypk+vaKmH?=
 =?us-ascii?Q?mFZws23PVnmSuokVCT3fmAP+7My6eFHKlcfoZqodK5Z10UCkpZraNRxbSCxE?=
 =?us-ascii?Q?mSWtDclPOybFKqJeKjcGzjPgBk5KH3cJSII5qzOn57YkmbJnLDjbz814U9UU?=
 =?us-ascii?Q?3aoci0wlqyKy8gi6Z4yWFUiJr3uncXs0QShtFshbwPcjyUgFddizOkw4FAA5?=
 =?us-ascii?Q?VIgN/fVb7Hj1K6GXzZdS/4nXMrBAYCzR8MNhmfj0fchkdBrrGVt+4aGMFBm4?=
 =?us-ascii?Q?JEGYrayBlHigAEN6WNuv89+vCq7HasEPHg8s/npGPZcZPDCdXoGw0llKD60u?=
 =?us-ascii?Q?NKFklrOXhfh+eUx1jrzNSoDXF/Ore8O2B3vLSb5nkgK3fRsf2kdCYoAER70Z?=
 =?us-ascii?Q?DPdjT42Ecm19a9pr92AsMOW0DjEj1jxGfwmznWXpHqu0lFKhuG0b9J4tseEA?=
 =?us-ascii?Q?2gqpkJg1DGw/zpi1a3J6+y7CO88fSOPyOXQR/38/KMRDiRbXATytZN73IIHp?=
 =?us-ascii?Q?HLW+/YNxKN1+Kgw/jHHGsOv2EgsiqQFZtqQpyHnhNK89MBmIB8uSu78JGMo7?=
 =?us-ascii?Q?pQzebX31IqjMOLWKXgVgMBu8LlfeNtBWVgCtoNMchY1749E9o5G40qNGe/ZR?=
 =?us-ascii?Q?7Veu3YRvnVtMmPu0YCmVI+5daN8CmdxqUKxIztu1JW4JMFcNTDMcL0kf5Cp9?=
 =?us-ascii?Q?p/SQPDIHhW4kWuUlTVkHDD+E4WEUGPN3ljF/rn7GTbIH/HC3t87GWzaunk9a?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2271e6b-8b55-42f1-f90f-08de29d0440d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 14:06:00.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8Ybs2UsZMFBplKB/G4I+6UIqJI2z1tKkdkxC96Vf6iu94bJwXG3r1WIdzqxEaVr3HrqkWt6ryxYYZyGGoCcIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_mov
head:   a54768cce1f5e7bc78f6e0278b90acdb53f896fc
commit: 8161bb24402c28a52494bb46faedb338c57449ac [4/7] emulate sub
:::::: branch date: 2 weeks ago
:::::: commit date: 3 weeks ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221318.vMFXAyMk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221318.vMFXAyMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221318.vMFXAyMk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/uprobes.c:1453:36: warning: unused variable 'mov_xol_ops' [-Wunused-const-variable]
    1453 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~
>> arch/x86/kernel/uprobes.c:1457:36: warning: unused variable 'sub_xol_ops' [-Wunused-const-variable]
    1457 | static const struct uprobe_xol_ops sub_xol_ops = {
         |                                    ^~~~~~~~~~~
   2 warnings generated.


vim +/sub_xol_ops +1457 arch/x86/kernel/uprobes.c

a6c17d2dcf5977 Jiri Olsa 2025-10-31  1456  
8161bb24402c28 Jiri Olsa 2025-11-01 @1457  static const struct uprobe_xol_ops sub_xol_ops = {
8161bb24402c28 Jiri Olsa 2025-11-01  1458  	.emulate  = sub_emulate_op,
8161bb24402c28 Jiri Olsa 2025-11-01  1459  };
8161bb24402c28 Jiri Olsa 2025-11-01  1460  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

