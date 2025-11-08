Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17F92D8DC4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 06:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762585099; cv=fail; b=Lp3XcJzzB04b9xwTnpHGW3f6yuB1e0hEYeGQ7uVUsufYLhGwPys8pgHKVaC7N7Fp8qcaD1zGNBNHrPelOO6Q4DojFR643+AMwrNuqWDvi6GzeXyyya17DpEaduHh2auYFkSXxqQ3EQghBhe9snI0NlNUqKoab5fd2B9OUu9IHD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762585099; c=relaxed/simple;
	bh=5NyfvJM50n8+XqHIpywlYOwptNQBMe0FW3OQjb4ypvY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=np14lEB5tD07W+ewud3FhiHJPwd77+noOWw1XqjZYnbrsMlo7CCEc7+qWc2UAS67YodczG0QPMPqAzMNb8xcOtuDtg3N93sF482Klsuwjzzgcm//barKACMDyi44Sgwq9BWg16u2Kaa9P9XdbWkAXh2pbWOOKtjRv33ESbZl+qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPrCuxtm; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPrCuxtm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762585097; x=1794121097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5NyfvJM50n8+XqHIpywlYOwptNQBMe0FW3OQjb4ypvY=;
  b=VPrCuxtmeMUZSSOLL1KfPX2E/z4ws6MMnNb/IjMl/aNgcDexCMPKlUec
   a9z/q2/Sw6MNo8VooWSD9k1R3bYaQ+wX8wz67adqPov+87KJcvo1ua0I6
   EykUuxRi5I4C9bkaP6+X0BxntORkYTvLeUcHKKc8WtEeIgIKO756ypu4O
   cTvSFjYDMe7zG0PGrVlky45dqRgaMYD872q2Xagbgamd9UhiUptxynLkX
   HLRNgdIKWvf3rnb2ATYtQwg8r5xGLtuYxgaB/M5xjkL3gKzjfvCfDFnYA
   +kdSLcmo6KHFy4sPSqxFi1pBKB6IZNmNLIdotjxmjY0BfLZCvgrB6yyLS
   g==;
X-CSE-ConnectionGUID: ukP/3nwRQ3iOepQeucyxQA==
X-CSE-MsgGUID: xYAYEc6oRTeVdWgtudwHiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="63935071"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="63935071"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 22:58:17 -0800
X-CSE-ConnectionGUID: opMCNSLLQR+ZtNwd9JaWGg==
X-CSE-MsgGUID: KTfK0EHHTyii4mP5fOTQZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="187966799"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 22:58:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 22:58:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 22:58:16 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 22:58:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXXpKdHlOkmgobeG+wYySWuGtTokpXG+Zkv93Tu7TWQ2cI6MdjPM4+giiKmEqX945JaVh1fAga36itP6cm4NRI45Ogh9Cx93WLrbkSEFUH/zuOdEXvcabYIYG3YIdlIk0iXzBhoPIMxse+r39vSZTdmayWFg+k3WP47R32V+rFkDLTfyboZL4k0AQrICMV40+8NUCt1XpyA8XPNwIJuM2esvzA3t2xX+4jYTtI+saIRkqqhSG0c6/WyQMCwbVG2DFP5g7he8bjGKU0WgYjFbqAiUiYEbwHht0juNXHUoFCZu4XmPuBvj2nskyfpLhV9TXvyVpai8c+jrRUSF4X7w8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ikcqHWUInz1ZgzFVQC/KguPBzIMnN+TJQiQ0hj6Y5A=;
 b=YFKOn7Du+KIYT3mPbiKhhuK+oYzffH14ckNUfxuGk1HM0z4ELjMGsgeOTqAP0WS9B0Pp1w0NtqzItRoyoFxLyqqq9EnudYWkNLXp3gYxsTOSo/7/mGPE//JMKlqkhuiQhw86owuUKLSwjN9MA0NKPR28C3M01g6lpawIPCy68iyedIG0xF+07Sx+Zt09CCRgWePMZ4hYR/k8CjztwuOCAvQ4xQV1Ac7a6NapLJGvNGIUdiIHdGaGv4HpU508cpb/3t3C6RHf4bTwEpDRqRU7DmjtJToouIXd+1u/7DK+6+TRi0wbqDKnE+Fz14SzK3+7ZmXongN1CE/UqdW72U3CFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by PH3PPFE80710477.namprd11.prod.outlook.com (2603:10b6:518:1::d5a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 06:58:07 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9275.015; Sat, 8 Nov 2025
 06:58:05 +0000
Date: Sat, 8 Nov 2025 14:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Garcia <rampxxxx@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [deller-fbdev:for-next-next-2 2/3] checkpatch: ERROR: space required
 after that ',' (ctx:VxV)
Message-ID: <aQ7p9jRSP1EaeTjg@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|PH3PPFE80710477:EE_
X-MS-Office365-Filtering-Correlation-Id: eb895e94-83d8-49ac-e7c5-08de1e942ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W0rwkXjfxcnrZN1GdY/kNSGW1wtcsQkbknLjDjGiv/GC/C2KJq6ZwClGhvof?=
 =?us-ascii?Q?mr6ULbKHzxBVIR61oHBJo1yNLPE8nHua4VNnan1MT0qU+6nXtlRHrxg9DskI?=
 =?us-ascii?Q?mzW6uCZ+WVCeCDOrvHALnrTeEZViqhybWLGeytuMJcdk5A3ny6JCFJ43w7wY?=
 =?us-ascii?Q?UQ8zUbf6MX7ZatqSiz3rvmr7jRvT4XAqCktS54wzj/md8WDvdRw0TXh7RZ8c?=
 =?us-ascii?Q?KSmAXSO9T47BAaidq3Feje0O8v3R0Ciwdz4XJErQknE06O0bbMPh271ipMfg?=
 =?us-ascii?Q?WGqcNSBFEatKpeucTK3GHFV4J5002eIFDwI1dnVrLZy1ziKoV5MujH7h/xWr?=
 =?us-ascii?Q?Q0RHfmaXwkcSS+RGrHlhrVemDLB/KRefh+dqVIa6vbKMvarmd4y2mlFIE+SB?=
 =?us-ascii?Q?OwgB84/eoEFu4TiFzv/CfgXpwKt2TOxX+5V01Uf+yI+dPZH86iWgz4sjdKg4?=
 =?us-ascii?Q?ME6q99X2SRhGeOrv0dXeFBHMIKLLY1AJHIJ44Zft7OmM7+Az71iQYf3RlHz5?=
 =?us-ascii?Q?pTcHtlI5evFXsaJKWvTIMqxemiJkAan06Jdz0POgrqYeGHOZlT6HkWmpqV02?=
 =?us-ascii?Q?TcGBi9+rfM5b6K/hzLMj0u63uEd54nWEYh5NxDz1zA8ALqimJ0A8HBkBZzBT?=
 =?us-ascii?Q?P2hhTM9O5zPC0DVPpRMuYl/PKrZcImgd8RVuNcBwKC1UpGq1/gk5yRIkfyWB?=
 =?us-ascii?Q?3vHwuG/ktNPVkrh2upYEsRlz318B3SZsrKJXOjm8jLek0K0f1dMdXP4yvC9C?=
 =?us-ascii?Q?3cz6CXt2HUj3BfNQ8z3vgqIslwtrnv4ASfUERC8sFEcJQIvDRhyU9c7PM2F0?=
 =?us-ascii?Q?wNOnpY4LFqb4mzFmbIR0RUAGKmJGhfBZ04jUymJs27E3jkwXDW5QyRFCTxbB?=
 =?us-ascii?Q?JOkZocz+rVkXqp8HhfpRZOvwc7Foi0lVMObMF4WisgrZFw9nzPw/c2LrQxBv?=
 =?us-ascii?Q?CfjdDG4+R1kxAiy0VlJDrAFI90sc92JZD6yVfADwTIDiYY6vpH4Qd4GNW/zG?=
 =?us-ascii?Q?oTDccT7mOo5f81tAgRyQFxzBjsraIOHUmuzTA+TPXQdeivAPs8i3dkNCYxR0?=
 =?us-ascii?Q?8Vrs0CGh94voR6Z9NmueNNdQ/0dQkxyIu206l5A/9SHXOOBVC/gB/HEMm/QW?=
 =?us-ascii?Q?b8SbhRsPzvKcrn4HdXf7vWkXkzZUBuivgEeyO6+CHWQDMytQZN2TisHt1TuA?=
 =?us-ascii?Q?fP6PJKS8+H8nbMN3mn5fEY5mwmwBZ+8gd2mmkjSSvxgNet3vp04mH8MUK1/Q?=
 =?us-ascii?Q?ZImnhcLr/QPGu4z7mV5DcIshPrhn3gceWAag/oBrc7j1cxqwiWfRb17YSG1d?=
 =?us-ascii?Q?7Xb8ETscmUsMJe1HI+mhP945INsXO+gX4MNwKzS1RIZ/sh1y+YeLFXVUPAFO?=
 =?us-ascii?Q?SoPdsRsZSndwekwB/PaJQ1kgFp2xIiHEpC+GLiiO86vSCxF1LIp9nMWLni+3?=
 =?us-ascii?Q?sfM4CRbiZs0pJIKR+rxDvw8GGA+36vr3Kf/qzOJJ7Ml5OGT58Yo3xg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BnQ/0tsuyAfdxTVQPjri2+bzKAEKauTp8OtksYNKGHs5Wgy5Umsy414YTM+i?=
 =?us-ascii?Q?Z+huhLTCPaFpIsbe76bvNd5jS7iFEFoqNccgSe+oLNTYLScqVPLd/w9BQX+z?=
 =?us-ascii?Q?iD0LFvzfJjJbDjv39Rt0KKybqPnRtBBlh3E0aPtLV5fT2Ce+K8RFzRT6eM6f?=
 =?us-ascii?Q?CtJJE8oMWh7KTLb30F4mX9yKpPXyMhu1B9U8nlVlhIgyiAlwX4Ph9P1rhvC1?=
 =?us-ascii?Q?bqFlbeNXI/h4A3Pso2GGjQ2iJq6JmfbyirqJt9e7a+KQ21j+JuRbUVkwTRzh?=
 =?us-ascii?Q?J7vkK7jO8+6GRmrmDn6VbuKbW7IIb9j7yV+4XuTj+CwpCvkpZCpmOZiVBu+e?=
 =?us-ascii?Q?15aTvOL07wy7kBsteySps9x6UPAvcxp1Y/XJQVn0qlQpPFhvK4RIKSI1ciCM?=
 =?us-ascii?Q?oqso7gIZuFDc3uhgCExWM81HbtJEFrizvsIMqOsyxazMBD+aM8R1GQ1zORRB?=
 =?us-ascii?Q?D6Ya/nvD/oYrHqC+i+xd6nRfBCWfiOBHGbg5S/nSJbbY8Dl3eDlDAmHiaWW+?=
 =?us-ascii?Q?pJ4hFHYsmZpCpYvOiMbfLuGAhZK9cD9CFdRQhLMymsP49IGl8fQ2HM5jbDOS?=
 =?us-ascii?Q?VnVTSM+463rEadrjB+psDVmGtdjloVYJBh3vwkTPuGEV8KziHoSTivg3VZd9?=
 =?us-ascii?Q?jsJwz1XjZrjlWFfaUDL7H/sFhWo8k6DG+THw7XNgCB36zxG7ayVM4+GYAOuC?=
 =?us-ascii?Q?95iap7FyBjohYiPsmU307dEx4jkZHvRQKioi4ISeIrajxnwBO8SVniWhUbUB?=
 =?us-ascii?Q?FqyUth4G5qZh4WLyBeY0VtltQr95h+Y6BFYEJEOVVXCcfy3iZQ491y69ClfV?=
 =?us-ascii?Q?xruDvxHQ6zM+77w1jDOa2rw0xjhn8ChZz8BomnoKx5odFuleB72uDecdXcd/?=
 =?us-ascii?Q?gOBuXMUvHcspDzJHrcML92hyjiiEwqBYMyELShzoKdpQ852cPB8BgTdNgMyX?=
 =?us-ascii?Q?WglJsQYhKk7YKZJ/t16bQH7neM1CIPjwQOkxrV4alMLy2tXbw6TVIR1Qc+Aa?=
 =?us-ascii?Q?48opMplKxmWPVemLESyuYeSsL7yFE/JGfCa7ezyAX+yYXVja35YXmDXurTq3?=
 =?us-ascii?Q?MHjchEYiLDd9BmiaiGD7ST1DHt1TfbzyXJj176fzNoRN/XJkb/DAxrJLjLO/?=
 =?us-ascii?Q?k1gdrdBQsimMmiWMg9nTD6nijlKrP56aC5aefPOuZmP1CNLFk8xUWAVHLXg/?=
 =?us-ascii?Q?yZ1wX7hd3TLUY+OSxpN3r8ZhjS9B16GBy83Dr951I4sF2/fn+ObuecaPJPyP?=
 =?us-ascii?Q?3OPqI1SZmDtAZK/6zvSUvyiQf9DVvXPwovOpVeAyeUfDCZxItunkTw8nSU4k?=
 =?us-ascii?Q?7++N3fZeVZobJ/hh98kOqrWp3jFczmobkNrbk0fnVlqoQC3mkuVfnpzEpn2K?=
 =?us-ascii?Q?BDNqBqNwtCTZK83NigZ5v1hAEyE/E2AkZA4TXTU/poCREUtyTYTnQQzZPdnB?=
 =?us-ascii?Q?VKYsp7gHMp096GRvFYR9rijZUoT4NhP2P0G40CS4ecMdV/Prl3zwp848T3RQ?=
 =?us-ascii?Q?Uz83uqUa2smGX06gjLOyQkmLWMKORR+Jf0ODpDmsSOUuZwFa3OAR7xNDaR76?=
 =?us-ascii?Q?8oeV5DHg967giHdsobWCBMxeUl4N3X/bSWez+WsT7pYeEZvsRWx5OZM2QRG6?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb895e94-83d8-49ac-e7c5-08de1e942ac8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 06:58:05.6075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lW/piv3IBw8j0CA/oVHJ2uO0J9UQ9b0OqvS8mnpv2Ij+Nik1edCbG6PhASKvh7GmZQ1/3OeHAjKlGRpqO20y/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE80710477
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git for-next-next-2
head:   9c5ce80078876e17cbad3ccbd60209bef590e230
commit: 9b02fd28f4cde93fbf0126f4d3a49b45e7dd06f7 [2/3] fbdev: vga16fb: Request memory region
reproduce: (https://download.01.org/0day-ci/archive/20251107/202511071543.L0MYbmic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071543.L0MYbmic-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#29: FILE: drivers/video/fbdev/vga16fb.c:1325:
+		dev_err(&dev->dev,"vga16b: cannot reserve video memory at 0x%lx\n",
 		                 ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

