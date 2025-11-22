Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3AC285CB3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 10:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763807163; cv=fail; b=X5NuX0U6SxpYF+Q3DRzB66LPBA38ewxNOcBohcjKKJ46bjAOZ1fWaVuWQK93NqDIXyKAwMwwefB5WrxEQo20ELNFQarqAWoBJ3oHCNczdknkmaeDbXexZLHyVIJQpaEa+HnFhgE6x/+ndc6F4kVjz52Bn0gSHFjHZ4eNz4S/icY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763807163; c=relaxed/simple;
	bh=gXNmuFoJ0oDO3SzDIeH8xqooXphhqG18HEXqnwySVRo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RQKQ9aEjxc5eSsDA5k02NZqpAJEqfwn+MY3gZ+3uXAA8gnrNdznRuX5ZgvACIwibwNpoCxZwyVZMfCoyIbFobNq3dCPwXiL0lDU+IrP05czQqZKwKfpwPlrqTUCd945iYIrFvd4sZE3uWhM8UTvzFT+elb5myk0Xh21hFHVFe6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmUa5Zi0; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmUa5Zi0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763807162; x=1795343162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gXNmuFoJ0oDO3SzDIeH8xqooXphhqG18HEXqnwySVRo=;
  b=XmUa5Zi0RHjZI9461O0Gvkh3pPcLGeUfhVZlE7KpHvlAMvIofvG4MHm/
   fsvcRUpkzWhsYfcv6lepXnjEzp5/aWf9AKwJaG5xCKHROBJO0dNjJ8QdQ
   cldLaeeU9tFgUHySLbLRDD8FpqEwdVFy/VU/qtfyUR3+fhQnV7PrI4L8b
   7PIRNQYALgYbKAMgUPQEIDrPV9gJ4az/022FlogOARiqcXWlc8A+8F5Af
   7dm9+KQYh9EbDPeSCQuAUPoTWzsn3gCksEIQQEeHcgnQowyCUwxObylSg
   DJE3HzrnlvVnCzYmEXn2zgfb/QLsVb1jCxd3Q+MtH2MXlHAXrlnFsDbNP
   A==;
X-CSE-ConnectionGUID: HRb1SgJzQ/K5LXRFquusdA==
X-CSE-MsgGUID: uKlsTUGtQ1mUCrjx3lSZdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76214829"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="76214829"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:26:01 -0800
X-CSE-ConnectionGUID: gT06C8VvTtiOJXSFGN09zA==
X-CSE-MsgGUID: 2QfmLxAnS8OStkgtm4gxCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222851718"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:26:01 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 02:26:00 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 02:26:00 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 02:26:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNv1ZfqkuIyMX3TpGhMyggXXU2RdCKr5H8E48q2gEKtBaxL6NM/th7ISBP2PH8erIA/dmfKia6pOUE+Rv66G1pEo2panyV5ZxEE8HDmxInL7EP0SWQeIneO5yMqCXZkjp5NGY0Nfiqe7Cu/kBB9fT3silkRHD+Ethz78d13S5gvP1su9PGcXL5MGDamb6zJUFPi1kTXYTuyaG3Rv0ZGpE7LLTBy/JvctSGG77dBvZw62bqqNGkxALgfkGoQFPFFugfxfjSEI8HAOhRDa6L/KPgZSFvhsLQHPiSFyNOby7bCv9dr0QzXvnPJmrAON5deF7TE6gQNK8FbZMoQqN+vqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jpnh+xiGWjc0NX/XKuEs3X1i1zZsipGzDc1UKLUOEoc=;
 b=EbGi8xwm73PZbDYO+ZF3gDDrQ5BNgsVuV+IBVqj8JndNVPiWSk0viDPZ3NwG1CY3zX1fVhHun2tc4BYZNNP3DEvuHl8hGf3+gYuqI/jEJrzEfkM+DN3uNqbQGCW17HMpL9I0KTEKVROlGat6jzMCDGF84Qw4MhANki7vNDDvJfJw9sMGeFOUfkTTrmth2R3RZIwoDri6COmUxPLOd55EHtuZy2yiqawvbhqht4DWMuHCuak1Sx9MYjjNEnqAjHjkUDlm1GGhXtfOwdayECX7O7laviC0juO88FNSD57a//hAVDbINHcYdG2OhI2kmvYv6D0/Q59TdoWGiwPxg08y0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4172.namprd11.prod.outlook.com (2603:10b6:5:19f::15)
 by DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.14; Sat, 22 Nov 2025 10:25:53 +0000
Received: from DM6PR11MB4172.namprd11.prod.outlook.com
 ([fe80::f86d:a320:27b7:afcd]) by DM6PR11MB4172.namprd11.prod.outlook.com
 ([fe80::f86d:a320:27b7:afcd%3]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 10:25:53 +0000
Date: Sat, 22 Nov 2025 18:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <menglong8.dong@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [linux-review:Menglong-Dong/selftests-bpf-call-bpf_get_numa_node_id-in-trigger_count/20251116-094327
 1/1] checkpatch: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email
 address mismatch: 'From: Menglong Dong <menglong8.dong@gmail.com>' !=
 'Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>'
Message-ID: <aSGPqe3dnQP4P02x@rli9-mobl>
Content-Type: multipart/mixed; boundary="WedifKgKNl+4J9AP"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To DM6PR11MB4172.namprd11.prod.outlook.com (2603:10b6:5:19f::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4172:EE_|DM3PR11MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e49903f-e210-4749-0e06-08de29b183c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|4053099003|4013099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OtWu5NuYe23WjtclNj/3C2LXZXahNZ2s7eqfJ2HxacV67e9rhYTBLB120CvT?=
 =?us-ascii?Q?cs7Fqh29Wzvi/H1yNohOkCRThNwI8k/38Oqsxk2k1loAuHu2KFtdWIAjCyXs?=
 =?us-ascii?Q?aAD+6wl4sZiGBn4zAf/5Vw2hL2xoh9BatW0WlPQ8F4mpoI2k4eiiAEtCI+Be?=
 =?us-ascii?Q?853QqBOE9vLiQ2iMZkPMYvdeei9qSYh51YIiB76i4K0fkBzUyBaXo09ndiYC?=
 =?us-ascii?Q?t9C7x3OEm32Tf3qiQHJcDJPr6wqAxlMlztZ4l4YL4ug59NmDFeWtwai0dhkh?=
 =?us-ascii?Q?KClnLdDbHZUnkfmj8wUxCBsHva6v/bgpKTlz6SVflXU1eW1tvxuHFsYNHqzA?=
 =?us-ascii?Q?9STSa7jlnEnbmmYEIV1tGBF1/t/lRsbnfJduTorrosqV+hhFmNcFdd0Ukc4V?=
 =?us-ascii?Q?pPKM5asPDpnvF0G16HNIqcKDqDe5u0uDFsMPmXYScky8qSq3vhHIpVDyY8V9?=
 =?us-ascii?Q?57mOsiZeFMhxR8OKquAm3ljDi8CAsyo/YOWtaGzIj7w3u1+GVLi1EY7NSJM6?=
 =?us-ascii?Q?HMaBRrtshBuoewoJEq85ZGIZ4k3PXSNUdSA+9zaMtvKhdI7pRPCSmc02fs3b?=
 =?us-ascii?Q?Pey1leVH8nOUdlm4Ay9NP1HjM4E+FEwRYfIHk/42GB0SzBGJ3dzjmaMIQ7pe?=
 =?us-ascii?Q?cJgfdYixjqzzccTeq9kR5UCJkSo3/jLvgP3qaRoc2M44M6/eOfEsCsXVihVQ?=
 =?us-ascii?Q?DUExKBNMbBvyMf7jKyNCyW3DqYfQvWNr9UW49kuN6hoPR3LnJkMdjS89NWws?=
 =?us-ascii?Q?wYBKPFrqWgIItIVNxeDQKG1v+ltvCOgiPsTONxWEi1jrdD+wi6mxHsqc/coe?=
 =?us-ascii?Q?6dO8EPN+MU03qhLvAhdcipuAGn14KDXDgVt/qyc+bGKBI7UoS8HuFVpv9/rG?=
 =?us-ascii?Q?C4a/SVtMMBXgmDmpjVRQPg9SByWXjL3otZnkCpH2s+ihwfocDioer3IYItrx?=
 =?us-ascii?Q?9Yl6kO+lR9GE0f3ZlLGE7mWUpfnpM8fXAFCRqDEVki3nIyIaItLhWODyUQxw?=
 =?us-ascii?Q?989zIGKs1x2QwI5RfI1RtwBeGAhlkwNExfNdAAI/+5F44ulg1BzzB+T5V9+W?=
 =?us-ascii?Q?2Ogy4IK7N+4VS42CbOPL1U8tHhjNHmYEt7AHt2/6Yb5zXrl9IcQ0ovjbBqya?=
 =?us-ascii?Q?VfXKGrTsDPWxqOwvGPqvQQnwmTYUlaRzsxqkf2jjIJL5PEof9fu3qzahCOFs?=
 =?us-ascii?Q?3WsuQhhwE9naYfEXJiBTCk45h/cDfhwXN667xRggOIVvquAXdw1rHuEYA0IM?=
 =?us-ascii?Q?I3D5jBn4nhbZUxpN+hX8EfYV5ydR7vygqHJLdey3rusFz7yNHU3aPm2GB20L?=
 =?us-ascii?Q?qlTvzYiIZdFv6c6uA+jQplfsYK31u3G7OykcD9BPbSXE7MjOupuroRvNg4B/?=
 =?us-ascii?Q?iQNz79sGOO71VNeH+Su/X36rYI614y99mInns1lSUKrYXcn0uT7veSnZWlMh?=
 =?us-ascii?Q?iyKwCNKRVKw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4172.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(4053099003)(4013099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B2vRLiufzcRG0FJbuQXHO/lSCSVv9x4dE7rYtkdwrSaeHCNBZUyZ64UK8wXt?=
 =?us-ascii?Q?ZWJDXwKPHyixDSaMCARmlINcZDOipYW2K06gXbAmH4DY28CZqnq6IpKseuzv?=
 =?us-ascii?Q?KzXjbegzF/phyApyTjzahKlYKu8fKwHR2KEirgb5dyaCI3XZucvubncnh8bA?=
 =?us-ascii?Q?95oMlvqWIcsLGASGrfSJTia6JhvsckctzAvC6DT3HOpX2nYAUJRqh9S6LdoT?=
 =?us-ascii?Q?LlOAtgg9q35A2hvz6qKwV8UVIejyzXso9/jptZA6V0VBcuTULzHqzTh0DNlE?=
 =?us-ascii?Q?jpNZmNSsrlNAAZxlLBpqgU9QsVobHMOW5U5C/1G4epV3Qqjk3temsHYVAx5R?=
 =?us-ascii?Q?oT7Uh9WmOas6fZ0koU+kNmhy/DDUgQ7+DfG/K+r9c37GH8gIM8d/+EjgNt34?=
 =?us-ascii?Q?naq/z/zrtq+Tw6kALutAeAel2eXTDoYDYWKspV4Ahdet7sl1cn/V66U+f8Rb?=
 =?us-ascii?Q?po/Ve8z33/b0IVOth/pB18MEqZ/nCrHVrApAi9TMDZ7I4PaiwRsCHvkpdugm?=
 =?us-ascii?Q?tfM/og98ArwSBfD1hjSqG2cMeGw2zTXDxCJAjhfMkIVOEcjjVezGhAMlHAmT?=
 =?us-ascii?Q?4a1o3/UNEQWcDBuPf3y3ABydVrtqwH93feR4hRxbwgHVM1ClcglRJ0rKpmz2?=
 =?us-ascii?Q?4/aRGfBLeuOAUPyCAMyNxAJbyzhPbzZrNyI/Sfwa3pjF6Gj1tMalv38a7VFR?=
 =?us-ascii?Q?pwAypcdqSNAclf5615Vc/o2ENM+a1v7/+42qbH+0m/Svd9u4nuV8ql24ugEn?=
 =?us-ascii?Q?plnTgudyvfMDnsqzVuNQUsPWi2pUcw2M/5HRrvwTA9gIlKsGwq1sCZ4iGqpD?=
 =?us-ascii?Q?LiLfvaCD/r++tUkTSEFFXfEqq6zfJXgtqyAU0R5HXiAkxF1WKsHVo+ZNiu7I?=
 =?us-ascii?Q?Xe9KjCtFnVm6N4mMVDHwQli1bC6bMfMv2brvGKdIltwwM979nNj1pz54Rmon?=
 =?us-ascii?Q?l4lmgo23Rcg01T3nVL/D1KLIvznt8uVYufuRWzcZ5JgR6gazeag/61xIyBgB?=
 =?us-ascii?Q?4ApJvqMGcvFhK9bB6f3n/yaI0MaVb375sED7wbkxBH/T3lm2DhgC61GVkQXC?=
 =?us-ascii?Q?xXFWJdnkRL8Bxl0Ho2bAMhN6dniBoP6BKLcuRq67lpq3Gqu9PirgFG+xIYJl?=
 =?us-ascii?Q?01QbkZUesZmwIvsfd/FYhwMUWbJ1r+rmAMy3+UwojrTkAakSDi4FGVSX9ag2?=
 =?us-ascii?Q?P36LHFsvs2++QGA9Im6sa8FMKBk2ZQdgknr9DLrFgpCUk65zD3nwGehW6XLH?=
 =?us-ascii?Q?ChW5BzqhXvQVitOCWjFDBsH3BvsNTzdcAbDbHFSOyc9o1X6JfGM4FMXbMEce?=
 =?us-ascii?Q?DvfIZ6xxg9Kss0FqT1cbaU1dYMmIyey/MnB0Em8YpDRXgg3ZDogsaY0i/uCV?=
 =?us-ascii?Q?BGplX3P0/Ug+KxunwFUgH7+yvcER0GBi7liC8C7Djk17FO3pKl8LvF/UxTTe?=
 =?us-ascii?Q?7vRv1OJCdt+wEObD2H5oATqzd0RQDJWMsVqOKFqFDW5YmPTPjZ4I/esZ1CcV?=
 =?us-ascii?Q?+k/co8OrcjK4rtI8zU8gsrKkTyk05y8abRQQKj+hVaCDl0DRg3iBE/16M47G?=
 =?us-ascii?Q?daA3s1xbZNSKZ9hRrIzg13azrsHQyx0HMyb9aw8QSpGLwHDcWovjr1SYNIKx?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e49903f-e210-4749-0e06-08de29b183c6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4172.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 10:25:53.0835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9yDnCN9Gu9oHB7Qv1aWF8g5+tNjnZA7V9tYHEIDmuYeK6aMEDCEKD7rgkAGctBLLJuZNV8JZCM1upWmc0aGeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
X-OriginatorOrg: intel.com

--WedifKgKNl+4J9AP
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/selftests-bpf-call-bpf_get_numa_node_id-in-trigger_count/20251116-094327
head:   53f178da95122d280cd12c619766ce07bf34debb
commit: 53f178da95122d280cd12c619766ce07bf34debb [1/1] selftests/bpf: call bpf_get_numa_node_id() in trigger_count()
reproduce: (attached as reproduce)

# many are suggestions rather than must-fix

WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Menglong Dong <menglong8.dong@gmail.com>' != 'Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--WedifKgKNl+4J9AP
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        scripts/checkpatch.pl -q --strict --no-summary --show-types -g 53f178da95122d280cd12c619766ce07bf34debb

--WedifKgKNl+4J9AP--
