Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908957;
	b=Wwd2+EQMh+2GBbsCGX53JXmt5uENAYo9GnfUP/M7nMpmgdd4PPu2Ib9FTMBVR9VpreC8
	 teNGvCPAupojiWfF3Bvw4apXPmjwdg233YxlGpCo3l82jkzjr4AArw+IGxFEEsEj4FDGU
	 apht9gT0+HnXlcg41eIMD8vtrjf2jpnXOT5jiqXr/ev7sKBQMclOFTriWOLIMaMLfbGh5
	 zjCrPirYNVrQy0nwTc9JGXGE8HgvFhhOd6dJsgDZT9AX446/eyRS+BTDVbPU+//+Pyi/f
	 pyVlpQzTd1fxDlHNPulXdiJVWCLSn+RlpFFL1kJ798GnYBZjGA6bdquVQor+QQhAwuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908957;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:Content-Type:Content-Disposition:X-ClientProxiedBy:
	 MIME-Version:X-MS-Exchange-MessageSentRepresentingType:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=iood15NLWaiz1nlx+7COD0as0aCF1/Ev4+xhA+0rZBk=;
	b=4eLbFz672EGJE9sbpvJ0RKH4MY3L2x6Bu1o2kuVQbgYYHWumhUx5aJaBhxie5fskqKH0
	 fqnk9j/kuNKsbSlDPZCbLYMYTfL7GWgyg3oZVhIeWyVRh34wuQUgeeFzBD/Va8eBZiFYP
	 yankBz50H+SXC3pIaB3v6An6AmqO5CgpABZiN9ADiJr1M4gy5fsMjh41I96EkyuacAS/w
	 EnWZf5pbp1a1woOPfr52qJ3A2llm84KQ2wCGcSKi7zV2HaGT+Q14lub26/yhwN4QolLub
	 Jn8ETnsknkhLwdfgHp5C3eqfc9jdd4CMUQ8iSQOEOp5jriJa15cuZnXJs+0CZGSnBZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EKXgB10T;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=dTIbzrrP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB232606A32A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 09:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB232606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EKXgB10T;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=dTIbzrrP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794908957; x=1826444957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HZ5jCGaxVl/t2KQTyYL+6Ad2u7B/DkyuMZ6x3m75EXY=;
  b=EKXgB10T9u4ExX7Jx/tl3ZBuwX44lvTdXD9cnHAiDlHLNIX/5oGktx37
   poKq+3Z4mfWzO5EQ1IoM0abQ/o4spLkv5jPLN4CJvGTosw0HpQZHUegoy
   5qsaM/J9zjbOZrPgXCOm1X0YMWXS8EtCMUWcn+tb+c8iTWkGwtATpG2l/
   13xEMDGuJosBdtZFm/IjIwhsoENbGOadFK6vR1/9Fm6ALGZSUJsYNSs4f
   gjyz7SJGVROSj7S1MiY8IrrAcauk6bHLCz49vwK4c3mpKBKYYch3c1lpu
   M2sWOTPHIJwX+sGA6UFbt/y5t5QrMy2v3b9IsinWX279DlQH4pDZDbsOM
   w==;
X-CSE-ConnectionGUID: RZRcmICSQPa/hknH/5JBoA==
X-CSE-MsgGUID: dM/Zfe0+R/OJ/m7nOyCRtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3577689"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3577689"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:49:16 -0800
X-CSE-ConnectionGUID: RvkwBoWVQJW4J09Kr1q/TQ==
X-CSE-MsgGUID: ojtbUfECSf+wCsMAGqm8CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9581067"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:49:16 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 01:49:15 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 01:49:15 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 01:49:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7CFa7a4ayJmT1ksWj5J6pDNOyBrOIe7kwU/KVlcVj2jlXTIH9NPb0OA5KKjfKwV/V2GyFDDIpC/8Coot6BhVBY5JZExKTVHuEE1q5+JWDh9/tV/ukU2tUQqI1660XfYW/hzYA6EkC732jAakcqjwQWKDyyvgzGiX5IErC22JGnKHXLyFNYVZn7lOrWyiurcevEYnqzWUnzIMi1kjHMSZAbIBz62g4TUsIh/vmPaZXgDjGwTlzp6opmXPgudY/R5tj6/QEE7M5qIAMzMBUkC+CiTDkR8GDC/STmwoaIYIoCsqcMqJAQU+XkJ/xVRqNtxUFCLeSenkx9jDOhX51jAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iood15NLWaiz1nlx+7COD0as0aCF1/Ev4+xhA+0rZBk=;
 b=mexxIVIXuVLnuHykV0ql/nAArijuSxvcdJ/3djZsEHRzNFEVd96Y7TaAlHkpJvSvMrkHLqxV89DH3c/lGdnNCANsVllKekrVtpuOBsFOCHXxAz69T2yZIkyYzBxtMUjbdt40GPUIraxZMdbblAU6tdxUWE8ugQ1Sro3tIUnIo4piPd2mgJYic9kqzK8zOZdNtp8bNV4yCUE8C+PLDlCbzHFC8FI6rKhzER3FxbZ2VnZ5kPH6tdYuZXZjhz/375ktn/WMWdtiD30RN2xIFnQYeyWpJaUUxnPkroUsvgXtShENkSXQG3BaVL983OSh4upepSET6PbYucea2SdIr4MEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iood15NLWaiz1nlx+7COD0as0aCF1/Ev4+xhA+0rZBk=;
 b=dTIbzrrPiFh9VZQjrFb7OqPw8HBufy3uFGMH7EHq8Ne/WOOM0y8zBERZZ+xIFhDTBuX+nnLBOJ+L6uPflC0CoSPstQad7ptWZdJSXWSVuTSnODfpIvedANIrT7zfNZx3EK8JE9EcT/URMGloYw6oUkTCR0/6FxYPRCvTdfN/RTw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by DM3PR11MB8713.namprd11.prod.outlook.com (2603:10b6:0:45::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 09:48:12 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 09:48:11 +0000
Date: Tue, 17 Nov 2026 17:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12-lts 152/152] tls.c:1685:9: error: too
 many arguments to function 'tls_crypto_info_init'
Message-ID: <avwi07Y/2FwGaggP@rli9-mobl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) To
 DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|DM3PR11MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe765f7-3514-425e-a091-08df448fe495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|261022105027099003|11063799006|56012099006|10067099003|261026140227099003|261009223027099003|261026121527099003|261022075727099003|261028144727099003|18002099003;
X-Microsoft-Antispam-Message-Info: Owxv8YxXwyniB7MtKjV0gRJJ2JF8BtrpTfd1ivel5XYCHQIR4uMMvXRK11+xOODUqtPsqvttXZurnleJ9E1yLi/59CUETl0Uq/wrsM42aW8zINxzU9jaIpNiej4Pqmcvd559VnOEmaOArqWM6gGt6IegXbmEmDaCTeHNGnCKQdV/Oa/TjcSemKySaV/N+rAZSNJ4luo1VuFyI+k3Vpow4dJBSMhZ+NuKRfKzp5a0P/ExDDtI8Wvw6LQsj1cbv4TaA0AzYXhSaeJsDG+9xyOofgIrrTDMUpUfHM016URpu5MOytLgbSzAHHqIxJH2GmDuj9pfR5CMg3+EEKEQBW7zShaAYAnFHP9QvvPzPL5MfWbf1IP8Tk2xaCCH0XVupFt59t0Bgkzq/QU9YRefr5574eJeyMz9Tlh+gcdgNn/szw0hxPCPkEvDTC0y+4DhwqrRQ3CRlFuyJGZGzag2Dg6njyWZ6Bt7kCiL7EAH5FtdKF0O+TNo+X+m4udSxSfxxhI5/QVOP3uzSWJOMdC4k1TVpk/9OznEWvcTYLZzwbiAUaWzYcdMw38jw1zLoUzE88GomcqQ8srMiaoV2NM0wkzKXxgmi63orLc0yLYjAF1FHv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261022105027099003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261009223027099003)(261026121527099003)(261022075727099003)(261028144727099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BXdylERuLNhX9ZOBwMiuJMAssTze1VqsDpoZ+6ngBaoeW4cmLk4d1VEV+MRN?=
 =?us-ascii?Q?q7uLXi9iKCBnUso2WgwdvIWtgCMuN/fzOMpFyfue5HeVc29oVD9a4aAZz6bL?=
 =?us-ascii?Q?SlITKjC+nx22OZp4D4m9Q6qgcCSjh7viNTj6xPItY5nfYd0V+lAwxqufukVF?=
 =?us-ascii?Q?IJFU2EyVLEnqUSi6bHfR2p35P36Zk5GDtL0p2eFV6Slf5Y/A3VatuOU9M35b?=
 =?us-ascii?Q?rWtHGg86edFZrLbczoHW8LTvzuzq8+shJvlWySdNUaozB26mjoz6QQuyVXH+?=
 =?us-ascii?Q?GQzMSP2BD1NxKHrCgGIaiEsno6DuZEhdEqnFBTvskManEZ11iiaB1/wqLzq4?=
 =?us-ascii?Q?IBvXDlCHgm68KM+lCGFmB/27HSPdbtr3F4pxReoqgIHFQLUCKE/xWmXT947l?=
 =?us-ascii?Q?54h2KbPyJf2qIHuBVfslkq9N4ZmeaT17Yw+z6GZtngs55NCa7sHHUnqR6SFR?=
 =?us-ascii?Q?ebW+Yrp2QeHFk/wNgKHxeYDVG1I6/3y2qpNZjqPRhJb3bSSDKW9FOTLiG1i7?=
 =?us-ascii?Q?i9yP5qhcyuaebsXoRtbSAFG3uViyu7+T67I0ROi8zOHEkgw23tUCfsa0urk9?=
 =?us-ascii?Q?vBMDbhb6NKH+ferhpvq+3C8l+0bKfjaA9ejn/6UYb/rT5PN3u5gLbfYxuYgi?=
 =?us-ascii?Q?WVp5+8YYasz4aSlZ9lm6xUol+pMH3xn/AE4vgAGqINNNp02RwyHZN7kZvLPo?=
 =?us-ascii?Q?H0th9zwoJYSAGmlm3a1F2M5aGXwM59SY5AggmaojysvdUElNHBG63ABBPhF6?=
 =?us-ascii?Q?xju+q0j0TSdvHalO3EgImiKgzmFVopSvNGh8tIiwD5Woj5y09gCjjthbMzH9?=
 =?us-ascii?Q?GHzXU7H/J38E2PP7lFFbzecVxgBDz8Zcs7OqrzwrVvi9U5/vw90jNCV6RPMr?=
 =?us-ascii?Q?ICKJ4E9U+F95C1xvcLj5PH8YIGuKPhOP4ZIZUkIPcTTYrzfCvNCSVZvOm0FU?=
 =?us-ascii?Q?q8kp+hsaDtZRGedPl1TDcv9oB7OxaIsbuwop3BWpWRdWLWAF/1Cd4vHgyuJE?=
 =?us-ascii?Q?ez0nIpXKLms0i6rSbFg1jj1w53oNaJpqwYXUlpcnNixJMAx+EVzsHfzyFrYg?=
 =?us-ascii?Q?nqF4xhNs1TVfE/6aUBhUv4hhBHMPLr0KtGPUpw4hGg66Yfl6KdnA0YjfaA5w?=
 =?us-ascii?Q?bjKR1xwbVDv2v2L7PI1ApAKIe9fLiXucu0ytPX/M9pR6c8dGSkOCvTCZp4W3?=
 =?us-ascii?Q?9AnpxKUnOLMlZRcGvQXRnPbeetyIgm2U962cm7esLsUj8M7kP1sLaKgG1GDR?=
 =?us-ascii?Q?OizZa7KQE7k9BZZY+5qFcJr6sRjLVU3HURk2XE/qyr0c21TyuXmr7Pr+lD1P?=
 =?us-ascii?Q?3SHguf1hg1F8QK+1f9RtVfSel8ZVtxCr/e7lLHMUYVao1LNUu2HKmxjcRtbU?=
 =?us-ascii?Q?TwwkLginfxW+A4a0JSV1IYYPr1pjGmdpnIPSenf5gKB1RNnXvJjfuyJbpT3W?=
 =?us-ascii?Q?6z0Lgbow7ForBiQuj+igNW+jk1eYL9orCcSRYfBoaCiGxqy1HlgUknnII+cU?=
 =?us-ascii?Q?Rz6v72ub9b5K7hrKT6h9i6/rztb9aR9f34X2JXnTk7owRpIm+FBt57ts9yF5?=
 =?us-ascii?Q?3VlVWTIefOgQs6r/vj9RWqQ9DYS1GFlaFZHEZ1gGFy7kRsQ2ctp7d/l2pmRQ?=
 =?us-ascii?Q?3Y3qGKkGH0ROFsKxQMH/Dleqs3okNCrlJ+FgRTtQdo023QZtnree751Y2oDq?=
 =?us-ascii?Q?4qGksftewaJ/iuW1TMzr5Qlapm1I2CwdZnFQ8J9c8oF9yMqzIM+Q3ouqIFet?=
 =?us-ascii?Q?fsv+dBdxsw=3D=3D?=
X-Exchange-RoutingPolicyChecked: VdeCzYdlZZZpZQ7KEZGAAbjnYkdHbwEaSno7HN9YTBgjH6kZi0ubCD9e/TwZAXJ6ORGpxFqObwtlZNoxIAOpfOwdghwDzshwiSxO7uXKlc1QTxG11l3GuMLsoRzgCkvn/1IOxS7RgFaZY0XEBjRajTryX8eUiJrLSSvkuyQz0hyO+f3aucpwdAt/jBAQnaJWxTDg6RC35H2boGtlae++FPFu7h8HVbMehrHSadqraojaPbFtKrzjg7OY7jyZA815sVrvGlzwgCnYmFAWSIUnO3PXXtE3CAGG901ByMEhbHGJ7XwO3gsNcDovrITCHx5K7CVSsYVW2K8W1ScQcIF5dA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe765f7-3514-425e-a091-08df448fe495
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:48:11.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rb817cnOiskRfVto3EJ8y+Rqpp0CvEqadsCunXXcloaQJavQVugvF2ffqOsb4O7UCJXjweb/nW7dHA99WS7eOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8713
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: eaf1f4a5c38aaef9c1ff6c9e4fb062d9138860e4 [152/152] selftests: tls: add rekey tests
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261117/202611170607.BEtkxld0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170607.BEtkxld0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611170607.BEtkxld0-lkp@intel.com/

All errors (new ones prefixed by >>):

   tls.c: In function 'tls_basic_rekey_rx':
>> tls.c:1685:9: error: too many arguments to function 'tls_crypto_info_init'
    1685 |         tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1687:9: error: too many arguments to function 'tls_crypto_info_init'
    1687 |         tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_basic_rekey_tx':
   tls.c:1716:9: error: too many arguments to function 'tls_crypto_info_init'
    1716 |         tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1718:9: error: too many arguments to function 'tls_crypto_info_init'
    1718 |         tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey':
   tls.c:1754:9: error: too many arguments to function 'tls_crypto_info_init'
    1754 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_fail':
   tls.c:1802:17: error: too many arguments to function 'tls_crypto_info_init'
    1802 |                 tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1809:9: error: too many arguments to function 'tls_crypto_info_init'
    1809 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1813:9: error: too many arguments to function 'tls_crypto_info_init'
    1813 |         tls_crypto_info_init(TLS_1_2_VERSION, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1818:9: error: too many arguments to function 'tls_crypto_info_init'
    1818 |         tls_crypto_info_init(TLS_1_2_VERSION, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1824:17: error: too many arguments to function 'tls_crypto_info_init'
    1824 |                 tls_crypto_info_init(variant->tls_version, TLS_CIPHER_CHACHA20_POLY1305, &tls12, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1826:17: error: too many arguments to function 'tls_crypto_info_init'
    1826 |                 tls_crypto_info_init(variant->tls_version, TLS_CIPHER_AES_GCM_256, &tls12, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c:1849:9: error: too many arguments to function 'tls_crypto_info_init'
    1849 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_peek':
   tls.c:1872:9: error: too many arguments to function 'tls_crypto_info_init'
    1872 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_splice_rekey':
   tls.c:1912:9: error: too many arguments to function 'tls_crypto_info_init'
    1912 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_peek_splice':
   tls.c:1962:9: error: too many arguments to function 'tls_crypto_info_init'
    1962 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 1);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here
      46 | static void tls_crypto_info_init(uint16_t tls_version, uint16_t cipher_type,
         |             ^~~~~~~~~~~~~~~~~~~~
   tls.c: In function 'tls_rekey_getsockopt':
   tls.c:1979:9: error: too many arguments to function 'tls_crypto_info_init'
    1979 |         tls_crypto_info_init(variant->tls_version, variant->cipher_type, &tls12, 0);
         |         ^~~~~~~~~~~~~~~~~~~~
   tls.c:46:13: note: declared here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

