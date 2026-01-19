Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50D13596E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835904; cv=fail; b=miAwE6VyXgDA8ItXRyFCNWOJtfFBO8TH1vWgyOA0w3LDV4IzwmYBiDwa+N9gLlRSTadrY52lAXdUFyfJzjbuunomBabITPODML9ncju/1bL6BW/RiuIzdcGBLwfo/VfDZihx3bmuRCYYzv6cWFPlpclTHkybj40W9ZKJgbgyNoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835904; c=relaxed/simple;
	bh=yNqB6Bc9h1+S9nIcAhjVekAKneHUixoxwLwPJM/SiII=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LDy/dqSd1SZEUOTswQMBKoaiVWdtFOyig+6oGMYqiJm2/Q9d7nCCZxA1DqjWa0bzQ1b+zVZH7QRQEZP1mbX4DJ6Ihkr8ymr6R2nb7MPr0MiBh4qAXjD7vi4/PifyLzlItSWjt8KZOdN/hOhhwKpfv27kJR5zggvIp/D2X9iF8Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YISll3SD; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YISll3SD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768835903; x=1800371903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yNqB6Bc9h1+S9nIcAhjVekAKneHUixoxwLwPJM/SiII=;
  b=YISll3SDz7qN56oZhjVZ8LJUw1sur9FGByRDYvMpBrx328BETDEhsS2B
   taUP/EHb04P4o78TFpcNHlFOLLhXYfJwtVdEondu/ob87QQiIVF2Wg5tp
   CpjFmLTBjPH74oPXJa9MDRQcUWTZHiIPo+828G4HA1Sp+1aeZMdQv6D1t
   u5EpdRaZfT7qoCYNimujUX3NiMe2aklzTDRaP/TWxj3z6XqcvlTdBZ40s
   pli8VZjdSOpYK5wY6nEfpz7PxhViPGfwfuLKg1AEaitpDZY2b228jhp9a
   I1sIavT46ifXTJTnXmjyZoigEnxaUQrI/SX95/i37U6jpdOjj3kQGzs5h
   Q==;
X-CSE-ConnectionGUID: dxa1OqnvSi28IQgDxcNzIQ==
X-CSE-MsgGUID: uGjGsBl8T/K8tVbw9/uP8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70020780"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70020780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 07:18:23 -0800
X-CSE-ConnectionGUID: vRmhJqa2Scqc20rR/kh1jA==
X-CSE-MsgGUID: 8gQ0fhDmTE++CAgqNGCvkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210905051"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 07:18:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 07:18:21 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 07:18:21 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 07:18:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dy9uzgAeOzrtQb0fs4lxfu74rF7xnph42cwJyJaSDPpKEw/9eL50LR4YhBSFsQFHJkAwJKrysoZJhpu7kRv3YYfndUK3NxYVqH4Cg8qzBpn0axun1eg+2fpe/n4nMbkMA2rC1ef2hqRtrlcGSyPpw1u/QWhyAZSKFssKGGks697fiT8aPnv6y4dRq4tzAI03BspXpLAqhZApsvo6wVZuFDuqa8qgMhxt6I7eV3Pna/iWauS3ceH+gVYQOzivILfY0gwG9CwD97wrf7aHbKdjmrYtwpI8GmdRBIzkFVl5asi9zGB3OdLRzE5+Ys9qvowNUzQCBgrOqyKGc4+i1uVo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59c+7bV9QHb9P33z/YgXdoTwkqf+7WcFPhBern+q+ig=;
 b=kkS501dxxFB5b+kEPJC2V0cPRjuBIokD7TPo/GYfXi3OH/U2EYabDsiAkI2lfJVt3JuGVZ8AfSHulU3ezTml1ZAh/3ozlXtqaaG93RdOZKSxw1WMkZyB5x9RkCO/FJJf3xdiq8MhIjvDQYCtDJzwLrn7f9T49bbZLaFA0mkApVhbZNj+OCD6SvhDByiLgMaBFDJNGq3eqXopgM/AFxzUSbcD21AUyuk02JoDZRwSOYATlokzEj8PsJfe0qYcv5EXINtXZLPcV1lrA0PnqOIyB5LBk80RFBKAC10vyIFYW4ALY4UQr7xs/0fezOycaddxEL2USe4z6yEYljHi6Hvmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DS0PR11MB7926.namprd11.prod.outlook.com (2603:10b6:8:f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 15:18:19 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 15:18:18 +0000
Date: Mon, 19 Jan 2026 23:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [hch-xfs:xfs-buf-hash 4/4] include/linux/lockdep.h:413:52: error:
 type specifier missing, defaults to 'int'; ISO C99 and later do not support
 implicit int
Message-ID: <aW5LMpyoWHu7SqK+@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DS0PR11MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 8819d797-650b-4c74-644c-08de576df996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7142099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tQ8VSSEuJ0P7LKBgDZWXN/CNwhpJcbeV/NWLBovfaBcOmpjsp5g/FzcWteo9?=
 =?us-ascii?Q?Hplrs617ldpo0//Of3rOPRyGvOVfrmTNCGfU+85noe4flcu8Kxc4gvU/kVIl?=
 =?us-ascii?Q?oohYyRfhLwWca2q7h7U60MbvP0SmOttqnvTiMq/pwHJUtqIRLK/HiSvuWM28?=
 =?us-ascii?Q?CK1ho9JXP6BPlQajQUGyM4nONs0GwFpwJWNa4LaRsdfXq1xyPG9ZrITyRR0I?=
 =?us-ascii?Q?hbcW6/pNGIwZG51O+v+GJv9O7yvus7+43kWfBRMAvNTVZ8Vh4sA7W5hcjS4j?=
 =?us-ascii?Q?sxKytDUWpDks3a54b1mBqmjrUT8NoP3GKZhyCKhUfMgCSVt7PpT9ane681o/?=
 =?us-ascii?Q?zIPPEJHeGp5xPO3jknTZqinDuoyjIEUQivkQXoDKhQVfhz8trBWRAjF3raSE?=
 =?us-ascii?Q?U67ck3fy2vxCvPVrX5ukUeWvWg1vPGcVVEE1q5+TK3MWOxZEKZi6WazaYcSI?=
 =?us-ascii?Q?a/Ty9qTjHAHcAJfnMpMAkmnAXjvzpUha3zztUgn+fS2daM2hYs4MZULg/gkD?=
 =?us-ascii?Q?jle1OaQtnbQFM6blTBojX6J2Q+P7eV9ZTn66NFW4KlOFnlgx/QSufTxihF/z?=
 =?us-ascii?Q?itx0bBnMls5wQl16kDqfN52xcOEUAgcmefW8OLiVzsRXEGuNss0l18ODg/uC?=
 =?us-ascii?Q?UFqN4lTPES6mQIsaHPOua9p98UNQG/dygPCPlxU/sgu4IzAaORiSdtZL0wcL?=
 =?us-ascii?Q?o6fjtk/jqmNkqbiKz8DstfjXBo/lDnlvbz+CfxwmzGMWIphL24V2gJaawzOB?=
 =?us-ascii?Q?hD4Ym+fnSeEWTJjrA2GcHMNeCwsU8wdJi2xtCHWKIjE/k4+0cpGvGY9lvIkq?=
 =?us-ascii?Q?OPpCzBDz+TkbknyBpBGMd+cRMXQCyjSs3X0dE5u9wCIAbY8LZyYTs5Ak01Po?=
 =?us-ascii?Q?HoQQtGij+t7KzhsVy3sGYnAHDz5sgBmEdUG1lhH30sWfRus4u9JRF+yuf960?=
 =?us-ascii?Q?jxuEshwSD3Is6uKqR0slvfN6duSNAoQzlo7gtKWDwk4I57e6KzWMKjHNAiXj?=
 =?us-ascii?Q?DPjfwv5T5QW6I8ftI1dkL6uMWrvcq/HWOmEPgsRFMHENuZhDLgSfqmf59MQb?=
 =?us-ascii?Q?Tat6ZiYvJ6P+MsR/n9zTf+MsnwVv5fb+ryF+8OqWmWe+CrsCMqjHyO0jghzN?=
 =?us-ascii?Q?RNHA/XMaqzUIV7QfR6NhLW49D+V4/8mwarBFUZz4i3KuY4jvU1r5H6JhWdc3?=
 =?us-ascii?Q?n1t8EZKhyv/fZM9ML/mQSb5ck+aOGPkp+bk8LTHUvU4NqdTrpLn1YW5uNKgs?=
 =?us-ascii?Q?WXiTwEkWU3K6oMAbaTDq7kPJ4nbIHIFaXiBr46PaM5VY5AEfYic06GSpZAWp?=
 =?us-ascii?Q?V9ZUclbclv3k6pKvkWqL04cCgs0nG5wRIoouwWmeAtnNF9aEydHjj81AnAwR?=
 =?us-ascii?Q?69fCeKXFTxujRLiFtNYiGvEtoYvZY+Z7EY0c/Nycdxmk6BAfNtdyPqvFu0ay?=
 =?us-ascii?Q?ds7QVV5J6+QVraYowGshxr6kJCLXUcg86fLMaAeJucZ1WFqDiwKaJo9++4im?=
 =?us-ascii?Q?X21UKGjZK2KifCjGC5cY2+g911TfdatsP+VpV4hn46Iq3rXTZMhUDtgKHhUM?=
 =?us-ascii?Q?QPQqITe5/sDg1rvz1gSsW7p2uFSk93RoDgS4Ajf4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k9RzFxjRpSDjfObyqx44rGYa+F/0BuqpTCPwN+GkHxyOnMuPA64TdFY+B4Xr?=
 =?us-ascii?Q?rNB/7UJfZFjWW4Qs1j8xTb/c6SBmDc0Hj1EqP4IjaSE6eZAVWtgoXCAKKbD1?=
 =?us-ascii?Q?lBfVEy6HZcCv55U3a9Lo9t7Ado/Xs2iA3ZJ2rgOnmS28lRXkcrhZRQT4TIqA?=
 =?us-ascii?Q?TGmF6o3aaC7wgke5vHzKDu5NVvZTaJliuHTmVjKwpcs+zwNqFq3Y/nmcix0h?=
 =?us-ascii?Q?o1uh/ICtkKRhD/rYateYk7av8VqhsGkHs9pUOSG2WIu4A0ctMLlCtbEuQadY?=
 =?us-ascii?Q?kd8MNDxcVjr820ARUqph4gInSHK52JhYr+uuYns+PKZAZ8iSer2hMaauIKK8?=
 =?us-ascii?Q?ZzgrKYWkVCChJFdJfe3c5nw2aY9nGVNflSNCurtu6yNtV+vhWAn9c7AL1g4K?=
 =?us-ascii?Q?oOSmhlVE7FA6sM4grP0Lcejw24tLebpT3UqhpTiogguRxcgFYZbNPasp9S0P?=
 =?us-ascii?Q?GQIzHcwFqkkVEksb7OEdzSFPJyCACH3xfW5dnDP9fwVoOCE+hfZ6F+eiBw+f?=
 =?us-ascii?Q?0xY4Yi5OyPF7IkBzwqOhRmyeOlF5fFaPGFP0KaTOgzHELmklLY0SajL2KZVX?=
 =?us-ascii?Q?/rvv89WI51yLPY6zO8jpit21oDPMzdJLVa0FeNUBKU8LqY5lkpeUGPNHu7zl?=
 =?us-ascii?Q?/93VYdBlhheaGsORscj7rUl1l5trSJzUYDF4nmSgVsIr4zXbQ+4vRjyWB8Tu?=
 =?us-ascii?Q?9oJyYv21m+kGHbRWIslNW75j3gKn2TbnnPoALpHjsr5kzbl+qmhZGd5bj2uJ?=
 =?us-ascii?Q?cmWKKhXo3F3qVbjiTLD3rZ0pvZTF4ajgPzJiYjratb7sdmJBpaQJ7OoF06JX?=
 =?us-ascii?Q?RkSsCXt1oNvVEtvJrjdZ5L92FY3hceP7oL5R6zQrDFVr+8QYhIlZ5vJMFtQ7?=
 =?us-ascii?Q?UMmy1EXZkIRgd+e65SS365oPTau8t+EW8j6f34Pi6wv5+gm8b0paYWoh5jlI?=
 =?us-ascii?Q?IyL/mstxgO57rwTMTsQPazCdwPSRPIeSdAoOdmJlE5oK14dI3zlN5mZo7+sJ?=
 =?us-ascii?Q?pyNWI3AlXF5Ya2HY1EhyqLXf59fEuxnA/S+OTRn2lSGuykMjzlSLQLUl7N09?=
 =?us-ascii?Q?0WM6NIa8tSJ/nSGMrYBhBqNIQgQLrmk79+XbcsH+iHqtHSQG9Zk+e/PRxWKl?=
 =?us-ascii?Q?1Oo5Rrji1CG0rOywo5DHVcxnVej4Ix9aGN792gr8ODRfCu+RYfNMeagn70+h?=
 =?us-ascii?Q?DohI0fBxqAWr4g28q0MScjkdFeTLCgQuSzz3/H9Mp6RGedbPvlzMX5vQxFCP?=
 =?us-ascii?Q?yo/L21LPjaWHRgRmJ4TA1mWjUIcApQ1+xqcGXg8XJ0z+HRpSWgOcX/cvaCdE?=
 =?us-ascii?Q?oLhD0yeVD3iS2SRypsVdfu9FfvyrDcxTPLsS0wKmxfP98nO5kKxMn/9L8OZG?=
 =?us-ascii?Q?qj1JiH5IAR46aRcsm4KtFXlWGCnF2++ytIhqtrdB98f7kIbirF9lBk3aadUl?=
 =?us-ascii?Q?OX7x2bg+n6zIrAfxmRT7ajvJ4oy/tOfBG86N1Knt8fFCOgT3CJYgk93R2lHf?=
 =?us-ascii?Q?vAKkTr1/SijjPAJgjtIAJhmDJW8Rlv2sf8MHfhTlz0gyvMVnn4xvDsN8W8N4?=
 =?us-ascii?Q?V9CW/6FeRhinzvBt+FF8PlR/vMdPDAQpLf6K502XuuNrGAG6MaKDbcMrH6dK?=
 =?us-ascii?Q?TCbo3bIBIi4rWY+EuLIKC9HDh6MfAp3b6h1odwr22wOUCMidJXyKNj2iuWd3?=
 =?us-ascii?Q?3UKTbf5rAcsjT6SgvZ6vVzXmZC54YDEOibAGyTEpmqKqKyi5PN8j/nFJ5Waf?=
 =?us-ascii?Q?LAexXHrPqA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8819d797-650b-4c74-644c-08de576df996
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 15:18:18.7721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFujm/o3wfcn9bPNfh/fJjWXChj6EGecq5sX9tnBC3UuDBmsGmuCyVoiLrYUR+l2QxGL2EljWoPpKYw27XzvPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7926
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/hch/xfs xfs-buf-hash
head:   9f73447f84e126bcdeaff55933254bf36fc33136
commit: 9f73447f84e126bcdeaff55933254bf36fc33136 [4/4] disable lockdep
config: s390-randconfig-002-20260119 (https://download.01.org/0day-ci/archive/20260119/202601192149.rcTFx0NV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601192149.rcTFx0NV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601192149.rcTFx0NV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:63:
>> include/linux/lockdep.h:413:52: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     413 | void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
         |                                                    ^
         |                                                    int
   include/linux/lockdep.h:413:65: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     413 | void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
         |                                                                 ^
         |                                                                 int
   In file included from arch/s390/kernel/asm-offsets.c:10:
>> include/linux/sched.h:2042:2: error: use of undeclared identifier 'debug_locks'
    2042 |         lockdep_assert_irqs_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:582:15: note: expanded from macro 'lockdep_assert_irqs_disabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:28: note: expanded from macro '__lockdep_enabled'
     573 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                  ^~~~~~~~~~~
   In file included from arch/s390/kernel/asm-offsets.c:12:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:16:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:19:
   include/linux/seqlock.h:68:14: warning: unused variable 'l' [-Wunused-variable]
      68 |         seqcount_t *l = (seqcount_t *)s;
         |                     ^
   In file included from arch/s390/kernel/asm-offsets.c:12:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:19:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1534:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:197:2: error: call to undeclared function 'lock_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     197 |         lock_map_sync(map);
         |         ^
   include/linux/lockdep.h:546:28: note: expanded from macro 'lock_map_sync'
     546 | #define lock_map_sync(l)                        lock_sync(l, 0, 0, 1, NULL, _THIS_IP_)
         |                                                 ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PROVE_LOCKING
   Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && BROKEN [=n]
   Selected by [y]:
   - DEBUG_NET_SMALL_RTNL [=y] && DEBUG_KERNEL [=y] && NET [=y] && LOCK_DEBUGGING_SUPPORT [=y]
   WARNING: unmet direct dependencies detected for DEBUG_LOCK_ALLOC
   Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && BROKEN [=n]
   Selected by [y]:
   - DEBUG_WW_MUTEX_SLOWPATH [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y]


vim +/int +413 include/linux/lockdep.h

fbb9ce9530fd9b Ingo Molnar     2006-07-03  411  
eb1cfd09f788e3 Kent Overstreet 2023-05-09  412  #ifdef CONFIG_PROVE_LOCKING
eb1cfd09f788e3 Kent Overstreet 2023-05-09 @413  void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
eb1cfd09f788e3 Kent Overstreet 2023-05-09  414  

:::::: The code at line 413 was first introduced by commit
:::::: eb1cfd09f788e39948a82be8063e54e40dd018d9 lockdep: Add lock_set_cmp_fn() annotation

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

