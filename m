Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794878872;
	b=FM+Nbnasa2ByuFi760k6VJyXRLPAKftoDQz/WjkGCQVp4YXoIcbZ+iFoWzcF4CmyD3xy
	 vn1RRVPpfVsBZZXUcfNh3gW6mo8VHim9g3h6/fLsyRoXxIBwQHhN4DY79j6l7lso5ULks
	 29hYUFZzJ2n3XBd1YLEKCWuoyw9/vFC8CaTVPmLvLXJ3YRc3TyQX6whi2VCZx56Ya+lrH
	 IWUf4fEKI+6ItI9f4B2720OvE0MOA/XmdIIYRg2fF2+tubvD76IuyDiqhDUiJBOSqHDkO
	 Qg0WZyMuEj8ah3IspbRwhkdkxskgLVO5qk30G0sNo2l4S/6eiuAK7fxA0VuHyG8gJEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878872;
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
	bh=FWdXbscS9n2MuXpzdbqsHRMEijMO0VoqBYt3Po0IvYQ=;
	b=kVp0+RFnoQdi+9EOtflNllJFEu3N8g++tbLredvjNjXB4xomwwddT2tzHzMdZ7wZm6m2
	 wfddlffepopOOeuqaFePDQM1Sb3tmNpDJGlc01e6u3o1W5HHHcU9CQnxI2q0LHclarfLn
	 +smkD/PL+GMoknDJG0FZJsMgHZPaa2znwB/JLPWsMYe9YIhzLrPgv5a1PcY/RRoj1nBHX
	 zZZVYfJ+5TSmM3/03PO420f/2Qtbq6wIH3ExMltAyjnP6enYwDX1yfXsIxs4KDwuMrs1r
	 T6v5fu8oNXKCM9PIn1kgj8+vc+DqKxEPG3oMmU45pYKF0/hyhdEeyfIFjai7TTFKOeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T5+99TL6;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Bl2zCkqs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ED3606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 01:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7ED3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T5+99TL6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Bl2zCkqs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794878871; x=1826414871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mMuQ8sf7D+kDgdfCpo8nrlDSWwJCGP68GvEL/NfF6vs=;
  b=T5+99TL6EItqJFzhJwYZJn0UwAbezERDrQ7NfBli4PM9DHItSJELhjfr
   Zx/v42JAiO2O2F0XEB7swIOL22gcVvZXOyH0GUHnUaGmUebab51OomhOc
   n6Jsd93S0M9HXmggDv7iZSCxEhDzW1qenjD8R6vwTeF/2hMT3dwaUZ2hJ
   kGSLcNAHoGCcxMeNFr9QU62sLWdNpZQk220EvK9e8oGra/qqtE9I6qHpg
   6kdYOECh9P7FQ60A6SQ6dV6ra8vbdHh1Bu4BCwtsjq4YRWhDIum3zlAFg
   /oaXYzKWqPmhUgRywU9mJVkCYwpWlvZn1Z4zrDy23U/ITIrbEnMQ5Axqv
   g==;
X-CSE-ConnectionGUID: JfT06NO3SuCJUg9RgTxy4g==
X-CSE-MsgGUID: zJi1zUCbRjCRYLqD287wGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3514449"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3514449"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 17:27:51 -0800
X-CSE-ConnectionGUID: ibYAf/xmT8S7T9qJwCG1ww==
X-CSE-MsgGUID: kWmhSsF9Sxu944AeVere6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="11428294"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 17:27:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 17:27:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 17:27:50 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 17:27:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiyhW4cg00DT+aQ/uNLQIwUAaFoRryvibl3OcTITbUYynSf9TOjuVwU28WBRL7UMwye5XdhenSqnSjq2RwClqq8bngAVfLSnzuym7UZLMSOwjpxpaChfRSygpeEzqsZsf2YwG5csZqVdgau47gMj2fPpRL6De9+egJbxhTPp++P3os/PWJGnpgBLTUJjSkL1iWH5C1KhyKNmRS2iqaa9QXsNm592YPw0FyA9vtzp0GkiG50b2cutS/NvIDW8lhWU3vJmgBgEEIynx6P5LOpmK623KrFDzViQd/9TKJ8unhrQctIZfBl0Wl4TPtaD3Et74GaQgRRd42wJ4HoR7YdU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWdXbscS9n2MuXpzdbqsHRMEijMO0VoqBYt3Po0IvYQ=;
 b=cHpVdHH97h14Y4AwVyZuS9TDwIjlj7V79NBgmp4gQL2qn6O7gQKzvPEGXSTpCUsR9hGfiGbQqaiHuUH5UllFs/Vq0f/hzC05Tz9t3d1A8+u6dhPGiwDbr2/fZ7wElcgwloesgxqbRDck+YEm837h3tfn57GqOykTEVtZYar+gof6ig5hUEdmjgmyLHmlTxuq+XnfImbNMt/lIKHUem+39qmuwLdgkGN6Zyn5kAD2Oc50O/ToQTa0Fe7FTcBxsB5BFWgu4Lg3VPS4qRz6k7pZK8UAR+Fp43JqUDWpSG/8QaKYzW9Rgb9ioggWGerhZCAgfSzPFvl4su7MWjoD+BoPNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWdXbscS9n2MuXpzdbqsHRMEijMO0VoqBYt3Po0IvYQ=;
 b=Bl2zCkqsCtBbyIxMJe76Mvcu1MqCNktUwVRHnH3EdinPiHyQw+Oy/rxAo0vwEXZq4k6QM4omKUisOpKjkp5iKh9ebmp4ZvBAbd5+/Ei8InJ/tZv9oT+AeYgS+3MB2wcpOJHt33Nwjoh7HLN0HJsrbsKegOwhLeS8lTmqCc6HNiU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 01:27:46 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 01:27:46 +0000
Date: Tue, 17 Nov 2026 09:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12-lts 152/152] khugepaged.c:1195:24:
 error: 'KSFT_SKIP' undeclared
Message-ID: <avutizluGa/eP6u3@rli9-mobl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0190.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::11) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
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
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d67383-e6bc-4f85-ffe8-08df4449fc44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: hkyJ02itQ8yBda6wFnHlEEYyK5aRDJRfqXBfv7T03/7V2zYMvJaihERliwi6bl0mokWLEgUuDufqeiTVW502CKLZE1IuYreG1omdmTUGUThF+FUotopgp5KWk4jv75PMyZBmx/SVcuUyL6HXVgOSxLjW4QW/rXV/MmPL3nWMqif+6WhCsOQ35qFbKQFOGd7wyOckMTGNAeG+ZdX+VY8aJ/T4pD6qoJ7aEJYzp4/VHorIcME+mYQBkdfDVxouhhyXwkDjpj6cHjZhcrPnhPSrHX/bRBLsg3AwzMdyhOvCpON7g57YNAUBSu99qSc4Nonc9F8aiEzITq8a95gwyoMTpMetyZzKel36IeFgJRZsa6oef8OtksIWk9mxp0w8yhSjkKTV4RhvQTvpx6eLL89/TcpgEma6dTVxxqQz+pL7AlsEOtkTTkxbvkZ2G3+Wy+L0EAczG4s6NWMxtLSnB4qP9cMG7ScTRQ0/cDv3Ai2O/gfSWOKuaOrdBhfV2+yh6s2Hacank4Y8X7/N1nWFPO818bTI4nS5QdvBcTLDXXxd9LqWpuZztQsPOUcqwlAptp85ShBLRkDjYR/GCaQJd4VXph0ZrraUWPFXJ+BAqY2U+X0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Mzc5f5YyFDjoYxg0XeaxOeSv1kOq4Frx8BrIDbWWVxIQVg0IdP6TLdnafT+?=
 =?us-ascii?Q?7bpRM7iBfxUeCeR74SNfMx4rS+vHluVQmK9i3XUsiiC8USesoYn7HHyZ16aM?=
 =?us-ascii?Q?eU/C/yp1gJDRWuNeQCBaPTBHisgdB7WemC0ZtK5rpuhrG8Po00xyu0QU8hVS?=
 =?us-ascii?Q?PkRTiP0tx+/8L6TZUyyGOY7PTFUCCN526h5Tq4ALqhL+vJmPqbZDWHyjSufW?=
 =?us-ascii?Q?XBr0cZT+S6bni+jZ83X8B+/oKZwmQy2f0bwm9QdHPQnPMkMhbsu53inImGfX?=
 =?us-ascii?Q?ixJE1SXfJ1fhneu5ZL6sr4eLgK5yvcAp4NBRUl35NAuLEfk/qslkTzYj7qCy?=
 =?us-ascii?Q?kWnkFqyNLx164PwFphiFhEpLtqwsUxgpJDW8ISCbUIesfM6WHulQm28gH42B?=
 =?us-ascii?Q?w1ctZLeQxiTi8rubYaxMb7po11zbrU3Sdnss/QQ6mI53e0sVri2QJXic/K8V?=
 =?us-ascii?Q?Ww64IAb0NPseLv1I6nEgWExMu1BzT4JTM7T0I//6xfCde1yGwgqIlIeohlLG?=
 =?us-ascii?Q?Qb+rIeiu6tHobYbNIDJjHnLXERW8Q3hxm754+hYMnUAJPhpCPOGv+FeP+2WU?=
 =?us-ascii?Q?kJoADpC97aenVPZAcqALV0EHvZJWtpzIpnrSIjlGKO6VDQxXVpNN6bfJ/wlq?=
 =?us-ascii?Q?xq9857AVV+sk1pYpvDvkdRVwsBzenF2GhAN6RbMuIxUfrgTL/fkejIaSlH4Z?=
 =?us-ascii?Q?+0u4Lhncyf1umNjsTByj/DXzvu/UhXslIR3r0DgTkQ7sqnsoS982a80lZG7k?=
 =?us-ascii?Q?6y4fAhoCDlPWI7nrQ1ChbecZ9C8B6qXQclQq52E2QZhTbQ2QccCrifG3n935?=
 =?us-ascii?Q?ZzGrAcBdvz3o6Vu+eiuhkpv9CxYzJSUvW7U/VRzoCoXzk56VXkCuLEsDSmPR?=
 =?us-ascii?Q?WwgXEkWfdMdGHS13OVfxTr365ovRiRY0n8NFjYmtEz/N2VUOoG4ysymLbogQ?=
 =?us-ascii?Q?LBBk/2ExExJ8ZNqy3ftU9lHHDPQtemoJ1+paqjt1wlQEIiZQsK7QuBNNEMb2?=
 =?us-ascii?Q?oMIMyxOp2PmFIDlVui952djKMQSC+avj533Yvqc2EYGPlg6+/uor+kspijZA?=
 =?us-ascii?Q?RgVgIKFZdsiG4jdKY7VjBUUYMCb9GnOfWIsH4YJUAobAxrcWP/YueCa9lQ5k?=
 =?us-ascii?Q?tDs2AgnMVfKbJVKRZtY7eTTK+cDCB7iMr7z6bsEZSc7sP79l+f2Ep7nqWMs+?=
 =?us-ascii?Q?tN/tKm6RRVjp2R9cuKCjk5k/XIRwdQ6j0PrBT8Sf4tES8VrrmJGOnl6Yn2c0?=
 =?us-ascii?Q?4CCYezXF26wZi6xLSxi02yFPWlKX32ZwxdHqCqLXgw+fl4AhRVtrEGh76JPf?=
 =?us-ascii?Q?FZxMS1oabiZAU/CeEjoJB9mHNq+wgeVEy5IzQm80/9SHypCTIkhwaEPC4jvs?=
 =?us-ascii?Q?sprqLZvvfUuxgYLVYT4gcl7A+9DmocCBIl83tlEcLPI9jATvGLF17+psFfm7?=
 =?us-ascii?Q?a4G5Z05KGgTTJpbJcU4SKA9mykpDlI1vUYetkTRbX9Uz0pG1Mhmx1Ba4S69q?=
 =?us-ascii?Q?/Wpr40NtpsZxCHJJn2PLOscnp+y5kz+8VuV8a1tsANMxLpYzLF+3nn4l3lH5?=
 =?us-ascii?Q?X+KZuJXhw6j/8ebSrumRN+YKPxpQh6v6R+Qannczl901yrK8vSumCWaCX+oW?=
 =?us-ascii?Q?EMmaIhwVq5tPcpIbJsiyeNdpM7tdaAQqD+AnlbaZTJi5Mps3PFce3JP7x9kw?=
 =?us-ascii?Q?tH0ivie5yYsnqYcFgZtK3METJvEogdAhFAq7xBD+WSTeLm3p6h3UKuLKLbio?=
 =?us-ascii?Q?2n+B+NaBNQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: L7bANNQ6vBe6y8dfDOIIKmD1PvLWzsLxBcfSI/L9TOSOGbjwabXx6ZxMdcqg4/3WnKKzQJjtltRRY7X9ZhsOw9BooytGq9uX7Yhd28RTMZw6RXq+KoNj/TgDCASlG+JH3FBmxRNrndowakAWYmSSt/6wDhLaQ/q9CGuw/K6ttyWRixux7kNJyzYImCoXPX0fAXWs1sHIy/kikc/zWoAiWi8MHFvAJhfXfcSZprS/fRrIqd46v3q5LX3NH9qwtbf5rn0xqKY9iGtvE3MazsdxCo6zuzbk/UJg5aDTrTcCKCRvmMoP4QJuN01qA+sW0dtjJ6GD5gJ5JBKs/BdII3j08Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d67383-e6bc-4f85-ffe8-08df4449fc44
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 01:27:46.8532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9WGL34qmy1LC8LdgYoOYwuIMaRHdAmMztO5OaEU/SgsXTxzuBDPlvw1K/5q+S+Gp8ZdS79YHYu9v0JfDf+/Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 6cd1e92981f88bb67bc6c76773de0e3583c6a8cb [152/152] ksm_tests: skip hugepage test when Transparent Hugepages are disabled
:::::: branch date: 2 days ago
:::::: commit date: 9 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261116/202611162124.bpk871Bw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611162124.bpk871Bw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611162124.bpk871Bw-lkp@intel.com/

All errors (new ones prefixed by >>):

   khugepaged.c: In function 'main':
>> khugepaged.c:1195:24: error: 'KSFT_SKIP' undeclared (first use in this function)
    1195 |                 return KSFT_SKIP;
         |                        ^~~~~~~~~
   khugepaged.c:1195:24: note: each undeclared identifier is reported only once for each function it appears in

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

