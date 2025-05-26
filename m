Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F620E718
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 May 2025 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268513; cv=fail; b=nTstn4VIrckvxiy4oitkjAutkGrbDsev8L0SdHs+l5KKJULCOOtZ/XN5HJPlQ3lIINzG2fb0gtFPa8IFKe3oxVNamn4VgaNcDb6kkf6OLq+qLUWKcGegwnQLZHf42e00S4AmTneXx7YvR+rY69xNvyAa/ltm/i29NQfJh3cgsbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268513; c=relaxed/simple;
	bh=wwSz0ORcXTYBNopc6SuXjZa+oiPxnYXM2iIUSkctMow=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CdlOTWvrBwMbvwD4MnvlTbfCbMqT4R0MyqoCHao1bQTO2rrfMYwPzc9dBaqfP87dBQvcns2Vrlyn9eKT9yxgXpZMSI7X6N/QXIq0UBtBpMT1oQ324wW7TqcVtisnTl8S+jdMsvmGR6Z9T9Bz48y2+6hBqJR8JvSyNUodadHYu58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sgxwq2MH; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sgxwq2MH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748268511; x=1779804511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wwSz0ORcXTYBNopc6SuXjZa+oiPxnYXM2iIUSkctMow=;
  b=Sgxwq2MHrwe62jgDPq18vk+q7brR6qyeeqxaNC5SlHJDqTQ8+ju1FPTM
   jAfYrpYrIWrpjJQeAiX+nqIyUP1ubMyJbc8Ya/jD6ZYFfu545x8ZSwpXZ
   oN9i1xdk0lXFrDtSOcR8cgHymyg60HWFmYmjU0UXLCVbAT3OVpiAFgtY0
   cWHhwoJslZY+Q/lgtIAc4W6xMj/b3WFfHHkFxgLEiZTLjbrQz3UnPPsAC
   q2mMDgwKImMgQ6xc3AJSVsYuB96t5jovtHtpYWPtOUsO2j1YUIxoNZlgY
   diUye1+Wi620/7f9xXdWmsCS4DMilqn1q6D3vq/eTM7ASYYxGBm4gtZ22
   g==;
X-CSE-ConnectionGUID: Zr8B1BkBQMy7sDpn1oqHPA==
X-CSE-MsgGUID: FceBUrfYSJGpVNrD8rskjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50170004"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="50170004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 07:08:30 -0700
X-CSE-ConnectionGUID: CxcU/GEkQJGY3RwUSNDmVw==
X-CSE-MsgGUID: Fm8Iuo60QP6G3kbbwvqOLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="142231912"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 07:08:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 07:08:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 07:08:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.57)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 07:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9igRKZnuNhVlCPaB8nDJHrPlulFlXmy7lM5vL8tFNwfuecPpuK2NMxUSPV3R92d8BKlgwR738xb4uZH0chzGcaa6oPvZyZMNoyJlcXpVqN04IOJVDS6mzHhFzTF5eZEOwWnE/XHRVJvktwgG95gDpG2Qp7TDST9bYuFoCPHd30PtJ995br0AhAkU4DdKuj2GFn363TIZ+Th3ZE+VGO4te5B1/bNm+xEiHaXYgPyUTEdU4nZNvWaX9+4ClRrgr5SfkllO8tCr2+RYWqhkOthYE/sEHZPmq5rSbd+05uA4Vjx18UKB19PYcj1MEolOZf30xFNZ7Q5ptzi8DPVF7YOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iI9YI/SwK2B0IGDUGchOjxbXNydaEk8j+C9BxZlyliA=;
 b=KVYE9Q9mzqwOzNR7yiSvDVOujot+F1K2FUL6BoAtu3rw+Fg/uJ2RtIvzVxkAuLS+bmDSetaqGjKrsjoBcWy6Iu/64A9gdAWB2diN9f84oY6S00pWY5Q2aIGCF8/nJ3qJKEyCqTV6U0pAN8W8wF+zRF7aNTbSq0eqMqdpMt4tRNwakPupoTe4HF7Ea4JANpPh6CNpt3KFFphA8diCZxjS6XDiB1IsUMfLYrRaeiMEruF+CrWRNEDxtkwpNZiR6sSJUvujv5Pi3YmkGfSkohBd+a8Snktn8kVWIwUS/hIwfMXml8Lmy00b+anlOyqsoUfAoi/9UTPA0fvUKMP+PGF6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5680.namprd11.prod.outlook.com (2603:10b6:a03:305::9)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 14:08:04 +0000
Received: from SJ0PR11MB5680.namprd11.prod.outlook.com
 ([fe80::7c8f:9ea5:5982:1a5b]) by SJ0PR11MB5680.namprd11.prod.outlook.com
 ([fe80::7c8f:9ea5:5982:1a5b%6]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 14:08:04 +0000
Date: Mon, 26 May 2025 22:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [linux-next:master 6174/13629] ld.lld: error: undefined symbol:
 ppc_save_regs
Message-ID: <aDR1vLf/zmjWQbt0@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To SJ0PR11MB5680.namprd11.prod.outlook.com (2603:10b6:a03:305::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5680:EE_|LV2PR11MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: b05d2f20-0fd7-4547-d7c3-08dd9c5ebb5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?igct+BFwRcj8Q0NKEgP5m0+PVQWo5eu+dvf8xIEeDZk4dMFH64DqRSH0A5BL?=
 =?us-ascii?Q?q8djRSA1dRK3ylDtJ4rv3DrIWg6AImbxfSxxyZeOzT+1jsEQJWq0uEsOycTu?=
 =?us-ascii?Q?GUuQXMUrfIcztIZiue6vaYMGxF1+f9v4OKMryurUvcst50HU3ysWnNBpN1Cw?=
 =?us-ascii?Q?6TgQTGOhnDT3KQDHfKwbnoR6cTQlQotiAdCR3bZuqXhtXJ0nY3abaE8KuRp3?=
 =?us-ascii?Q?5zPsu3p+qcpt7wHNaBSOhC64qv3VGdYUlsh/JS62EiyCbQK4tx2mHuhUhhAA?=
 =?us-ascii?Q?w78otVA3N9pGUAcsGj5A/s1pnLnh8EOFrmkNcb6nwJiLT49IUS7l3BPa3PZC?=
 =?us-ascii?Q?b3viM1KNr/zb24YtWcfsDXIDi234kv2HC734DQQPaenhWQejWAnPihw91Rke?=
 =?us-ascii?Q?LiP5qZ9elshj8J1UaFc1luYtjQ5cUCgqESd4ojbZ93LNksGEM/dJJ1saDbAD?=
 =?us-ascii?Q?3M0Pue8yYbdH6hp2FZepSCV8VA0cyweh0Psyqkmb2hKNWoiS/80Y0vS2F9W9?=
 =?us-ascii?Q?LQBJyEUQByH5dJB8+ZZoApsDdLac+2pJwpJp2SOVzdGVjsSFbKxv4QMYOKaf?=
 =?us-ascii?Q?tLTvNMbndHGytYxWfhcuy0Pkwns7lvmsQbnkqcFt+BfWUG/bdmLIqCzLO9ev?=
 =?us-ascii?Q?8+MMhDxXvqEQ0KRhiwVL36mF4eAwGTQvW8srl97yvy44XB4K+aOkIDMDjHLl?=
 =?us-ascii?Q?m87Fotug6QG4PMDUzOVqtApEp8Qx7ZexGVnnXedBWXireAYQYbBWJGdBsymd?=
 =?us-ascii?Q?t4cNCq6p0iEPZjrEokFx4gjO3t2tqoEsVGjV2GwfwMQiJbTmmJomtvEOigMC?=
 =?us-ascii?Q?hr7APbTzNYWHMbVxmCNbULl6dRPBMRjXor62kf3E56n+jr1AiiM7WMiVjmlf?=
 =?us-ascii?Q?1Ar8lBXaQ/6zu68RzZG+ND56iMGS/bGTBkCM519Ju/T1ZQTgsJl046h49g3M?=
 =?us-ascii?Q?g0anerPkmTP9+V1WxB/e2Lu4YDFXWjvDl5Hfnr6DbvfGDPpdRgeMZUUaC6eJ?=
 =?us-ascii?Q?NBTBkRai7Fy2EyRb7PrMXg7qdjQtmQW+6e1Jp1xAXkh5CiYAO/7xVap1L2St?=
 =?us-ascii?Q?D6zlLVYBm7dBV0x8oGqf1AEn61BbHjcMciKyyjBZcBgFHBEtmnF6lIuY9Wn1?=
 =?us-ascii?Q?iEirRWDUaZiAmyQyZ1uHshfeuHELegiVcTXlUnCGlVEcdhM4ogxB76hQahZs?=
 =?us-ascii?Q?d/zZ29yigargQJd2MsxFKfIApB6t1QUaE9IO57WnVPGLFSxBOcdNbqK/AYCt?=
 =?us-ascii?Q?kLUeNBISoIFEUAMGgCnDHdYJEiguwOi6aESNSRu5q/6loVJNYkBwinhvi9kr?=
 =?us-ascii?Q?Z3iN966IahCi19OgsLcjTbhe9Evamg3U6iFm8OZdLButgAPQZeKkHzC5YD4C?=
 =?us-ascii?Q?3pDCDUgt4jf4VAf5mG96v2ICBNZf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5680.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q+q+gFzlPZn/Cc4cYJP09SCxI9dJfeUIIE6zR3Vd8BI5UZtlADXLunLBW5+u?=
 =?us-ascii?Q?0uPDw7uqeskQ8rOIgFeT4K8S1kgvgX2XpNR2AmcZbx/S3bqwh7rQXTk5swQ9?=
 =?us-ascii?Q?OYJGrg3yq9HXTsgMLbqx28FJebx75jRUGdVP/H+ZMXakeQnRp0nJG4NUHyWI?=
 =?us-ascii?Q?DCWvNmjcsFTYN2D1ak41lcIQAe2ajECA2W8ULOgWzaHdp6Lfom8R32uQNWV8?=
 =?us-ascii?Q?nk+Dst7tPQqLMTBguYkg2q8BE3y2aCmqOzXUhEzn/Q1qZd+rPmfDhCTDCiRG?=
 =?us-ascii?Q?kB/vpMltIKVwBfpx9/YdGrAqRfeG0ZkGb7WZzFdCx5LRv45n76uCcMwhUksg?=
 =?us-ascii?Q?9ouW+AjAJL5vSk3dHrtBBJwP04HOla/fOEZqUgwM/7bmKVOiJMTfIIotrA2t?=
 =?us-ascii?Q?iuQepFVIsZ8VYNiLQFj9b6vVa7voQHkeBhnk8hfbjUKAs8DRK1UTP3t7bxdQ?=
 =?us-ascii?Q?X9p82a5arHsML+K/06GIrpyc/P4SaqJWJEL6PYMR/sM6SQGfI80zhiSCt5cB?=
 =?us-ascii?Q?7GddBrqZMJFiNXfU0LdFUA9XrcgysE8SGdMhBLwBffdHNiXWFcfuFXgDo8LD?=
 =?us-ascii?Q?NQeYXuNIGIDetzeHfdx3nOxmiEvU5V+N2Oi71sB7lvLRBkjJ1nUHrD3Jc7gj?=
 =?us-ascii?Q?SDLqQFh904ZZIAcFFgkBh1gjMnkJhbIQejA0vz+qQf/4cnrZOIOp2DdpZBG+?=
 =?us-ascii?Q?c1ZMCcEz28N8tLniB5+Krg8zwlnf0/cvGi9YCMR3kv+tQkYeczhIhWBl1re1?=
 =?us-ascii?Q?oPPJk/4iZWanNaHBCnM9DmrA3hCuvlmm26Ja8ej/6YILUICgxh3pq+g28yH2?=
 =?us-ascii?Q?GNDLFcLQ85ZlUD62Jn83trFJoi5Rvj9BcalfFUPZO4eMqw6eRkhQaf6uJHIv?=
 =?us-ascii?Q?I3waVG8e5we3WaukBqUy3pNujRSPOcsXFOhxoTbZkNjI5j+zYf947ttrE0PT?=
 =?us-ascii?Q?K2Xe/0QVd1oHpo7urMqSSK2bIVGmsQZkH2IAfnSiHEl2mylGGPnFxlNqpUx8?=
 =?us-ascii?Q?csf8QohaKY9MU5GxNNX8OETO0ehbCSjeeDFr5wW6WKwa5FrckURNRgddXuAf?=
 =?us-ascii?Q?OSeqgwh0fsn5tez3kIP/TYbfMV1Kh9Qej2b35a4LM0SG60crU95fgs/iN8n+?=
 =?us-ascii?Q?1Nm3NXhzYGsk7AqrsfQpH7dBflDfcRUV4J6T5Vcquv6BS3pxzzJTjFLcN/Mm?=
 =?us-ascii?Q?+T+8tN70rTELfBvFNhgIU7wZ4vKHr0AxYpfYzuQpf+r8hCxm8M7FiRA6KVp0?=
 =?us-ascii?Q?OduaT5MrWYuF4KmYuqzBNYOQF4tkrQTMQF0y37UpoMIwjofvQs8DR2XooBw8?=
 =?us-ascii?Q?8mEKsv8IqYLGc3VbiuQUY3cavWR2vHunBGFg8o5PDx2oFdWINTu5XrZS9IJC?=
 =?us-ascii?Q?UW1UfT/tSXl21HYWxof8bkDNHCql9AArC61ud9zfBy28vpeKsG+9gIKmq4Ec?=
 =?us-ascii?Q?FruW8XPJIIRTsjsnZKmm9Dj7bnPBKAZaNbiCLp4axh7FueX/MGvi3oVAbCkm?=
 =?us-ascii?Q?QWOM8hHOOYkAw5omqCxVdzH+AK0i6z2idI6K6twXhOjm+OUY/tfK/5bFVnUI?=
 =?us-ascii?Q?Zt8ovhWxxNojSUm7H466z35zbfthDUe+BH0KjvT8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b05d2f20-0fd7-4547-d7c3-08dd9c5ebb5c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5680.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:08:04.7048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4btfBsiVOXzGIH6QGZyHjKDjgikR/PZCh23aCCU4REdtLq7qFAbJ4T0wwyz9wNEAdrwKG6bfmbGh82nIyFMn6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3be1a7a31fbda82f3604b6c31e4f390110de1b46
commit: 497b7794aef03d525a5be05ae78dd7137c6861a5 [6174/13629] powerpc: do not build ppc_save_regs.o always
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: powerpc64-randconfig-r071-20250526 (https://download.01.org/0day-ci/archive/20250526/202505262126.S3x7rNwg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505262126.S3x7rNwg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505262126.S3x7rNwg-lkp@intel.com/

Note: the linux-next/master HEAD 3be1a7a31fbda82f3604b6c31e4f390110de1b46 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ppc_save_regs
   >>> referenced by irq_64.c:119 (arch/powerpc/kernel/irq_64.c:119)
   >>>               arch/powerpc/kernel/irq_64.o:(__replay_soft_interrupts) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

