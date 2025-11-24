Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD46182D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 00:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944750; cv=fail; b=f/QQaB5gl0ycjUTImqSxG+NtSYrwuGiXpBpXZ349FEXR2U99EwllxINhksR/ykhwPm5UprrxIVkVL7Y2t0ASoX91++gi5sJKkaQC4JTUsZB+XiUu0fZ8Lels2/+eRt6LZ6EhQUHqRNLrD15xzyH7no3HsRBxd0PE7xfg/MOzDaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944750; c=relaxed/simple;
	bh=1zwDWYUi8kIaA6hvuaeWCOgB+OUQXgEiMQitNBPGfTQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HjbFVN84qOGkok3egmvba1prnG1S//bV2E7ziuYXswneyXyyr61nEvlk8dBhSHZJ9fQSLNJx6+vANZ6ie3YTds5ctbh2DXRn+erl6Mq0d6SfzDZ6PFc8hUTV0CDrifhUWjmiyXbQf01jNC0Ix5Tb+qU73nrV10nwHLqzXADXGLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/GUK2kA; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/GUK2kA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763944748; x=1795480748;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1zwDWYUi8kIaA6hvuaeWCOgB+OUQXgEiMQitNBPGfTQ=;
  b=A/GUK2kAJqNe9OWHNrvrLgoMezN+m7zN4AGkZahtvOgohksz9v90tKkZ
   6PqkRa0FtBPKvy3c1hsjLbXnSJB/e4Re1XAiQXCyMJhgET+DdBrSpzwjr
   smdXNPl8kxbgHHNU4bVggTrzg0I3VIONAUhiJ98tsYPggYjpY/gak3sn4
   Oaogh50gh679PJ/J1UOn2GCtDGH3EX2A2p+s1uIut9arcbJZJZDwO7ogU
   63snStPpjvQ/5D4dE6ofBRA6pcUvfAevigGEgbP4BM51w/zY8/TDLpCGw
   aWilcVdtQGvCsOz00B1MlZ9ovmrcaOmpfJUhpeEmlEcRZ+Kj3ip5LnpKC
   A==;
X-CSE-ConnectionGUID: l4kdsoquRvSy/khKvPcT5w==
X-CSE-MsgGUID: H75botzeRzmF6Xc5iAGwqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="53511635"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="53511635"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 16:39:06 -0800
X-CSE-ConnectionGUID: dLSj0jxDSA+Z5FKPcsu8lw==
X-CSE-MsgGUID: ws8yZ+RwSqiWvUINDyxYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="192210552"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 16:39:06 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 23 Nov 2025 16:39:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 23 Nov 2025 16:39:05 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 23 Nov 2025 16:39:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7vZrQ6WBhO0SqcdUsCqy05IFsP7aTrQbv4YDLoQ7ZcYnCBCrB+Fj4vlOBdeCAzsjpQMuwbCH+OS+LRtsBrV9nPmLGSa+U3JYDWxhvnLZSL/HZLLKfMXHWE5mY+G/4QYWtPm1K0eBrPu2pSS9VKs8WcOUHdp76CVMlrccUXSXUFFrSFEMaA/QhSJM7BuKOCebfWbWNzA4TX7VGUqzbqwHd6vu2+cJJuOu0xwqNkLfGtrOGU0vXVAR0yk04vVgWuGB0f0QMWv+IYNGdqnWAeT+GE2lTvqGq/QnlN9MsQxkLGwWvRsh/X9U4C1kdBlq3IWwTalIPwqXOVq3AM5DjNwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aLR5kVmB5SC8l2XoZjp3Jw3fbb5x7HRR9AYdLNyTZI=;
 b=DWxyab9k6hC8pkKZS8rTkYpldwFDZllumk9Wc4heWAxA4xsn1T52ZGAzQnN2CrZmLmXMHDe/Hor0EoTlo5e0fkJ7opiI/3U/3Pugn7/xICC1PMF3gvm/qbTwP5JgMHIJPY530T++LbPAp33aXnoPBKyxojvEfnlBeiPCXTdj6e+gECTU8cmM/RkEtoCYCEbt4JA6f+oRCoSnyDw6LZkJiHInu4Co+2JWlQAtay1TnYzJYYXsiOC9dCeyB7wjOP6eNwc+DtR6cF/mDFPkRg8tGxicD82a5qIlygeAjumzp/4NCHL2gndDzZu1A6plb1MW1lguUaruS5DYBhubz0bE8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 24 Nov
 2025 00:38:58 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 00:38:57 +0000
Date: Mon, 24 Nov 2025 08:38:49 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Eric Biggers <ebiggers@kernel.org>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [ebiggers:more-at-least-decorations-v1 9/9]
 lib/crypto/sha256.c:237:6: warning: no previous prototype for 'sha224_final'
Message-ID: <aSOpGTMZNkO4oi59@rli9-mobl>
References: <202511232200.7DLfeFhG-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202511232200.7DLfeFhG-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SJ2PR11MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f4843f-e1fd-408e-ec0d-08de2af1da85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z8L9seZJO5cPNKLX5wrAFWYg0ZJ8XYWpExq6fFyqh+GZMRk67jBvIXqi8Iab?=
 =?us-ascii?Q?YtcUDbwHYkD1m1bWbdIBs4DMfbVssLqeq7nn7EH6dQK6eXjgGHuqf4B4z8u4?=
 =?us-ascii?Q?fzOTQG06MtKOhbPcqgTXGUEmwvPFWenzdHAw1BowuyJ+Xh6ICaOWH/C5EmtF?=
 =?us-ascii?Q?y2nOhtM4dajw4B0t6cDE0L/npLohYVMkcUp4Mt9FoR1GibEgmXvAXZ8+NmAK?=
 =?us-ascii?Q?8XLPBBjMV36iXV6KeeHI3DeePTH46Z9EG0yWFSUYjg9xacw3SXYUXmY6LWqs?=
 =?us-ascii?Q?FmYEyeduKCTGTxZQ7A3gvSWt2eBCXuPkTgIt1sNqn/ZT4eC9gfR8LCqR+NzF?=
 =?us-ascii?Q?0B8oEcJKBhH+pjplyEC15kXSgK1Jhx91myfurf+iAzlu2EPDfSqz7kfsQW3X?=
 =?us-ascii?Q?URxAADW+Vr4fhRMIyylV1T7l/xm7HH4JXeK3eOUK870kHC17OgwyV8YmqpxG?=
 =?us-ascii?Q?e726JcMrMi76C/7nH38hpyduomfbQxa2M2TG8XbfsVGnlDgs5Gze3osRz151?=
 =?us-ascii?Q?YORabmZH4CUhhdZgtKXiWf4xCnfM1hVikZeKfVMZKQUeDlawIoPdSp+cbXXd?=
 =?us-ascii?Q?xCsjEqQHJ4cTib5HEBCI8rHOeoBjaxZD1p0J7a5GVeKxrAtXfaRSAJId4Q0V?=
 =?us-ascii?Q?WuUGu786D7+IBFMciXq3jg81NBwlVfHyG2bm4uBW0BdR0iaJdlk54b+V2XAi?=
 =?us-ascii?Q?t+IdXsC/NEtcxM+F6d8RKM3kXSqow5KGkWdHPXSyexiVE3BHDbFaxE7J6eE2?=
 =?us-ascii?Q?yn3uGAcXK3QZRLYB63fMDk77iebXpGQJr7oKG9oEJqQHAFSoeC3laoUxKV7H?=
 =?us-ascii?Q?Gf9YoY/A2ENC9TWiogq7zLPeMDAqtZ7h8cv99rik0kobUOA0Lh9Wmmgr8GmM?=
 =?us-ascii?Q?xX6RQOihQKY0lm+bs96fJZju9WhAnA8suGvqx91VVGC8X5qy8f0okx8E82Y0?=
 =?us-ascii?Q?1MqKkvzb5rZo0d1JNBYP+UwRcnuWAEVp8yngkMBrSFdIY2nZ1bGFA/+c9iMB?=
 =?us-ascii?Q?t/G3FWuiMcfOV/9UgRbDbJL1+Onl73zV6plDdokzKTIUV5RxW0jFfgkcf1gC?=
 =?us-ascii?Q?jXJwTcdtPji7nMQSxtn3uEn3OOQBiZMsJJurIbCMja5ADE+8cGUMqGGtYyjm?=
 =?us-ascii?Q?pOF9vw0qPSCSGdH/naQDP+9k2EWy8mEmO3K0S0WQsJJXhNpR0Cj5ePftGXjX?=
 =?us-ascii?Q?G4PjNld2ajduyV8fiJwx+c1VmVYKA7v4Yqr7DNw/WdZISTKe+7tETm4jjHIT?=
 =?us-ascii?Q?A6cvaxcrSE1wAkcZykCyroVMRFZujgtiUyBvaba22Ml0MZNlHLmBXGkA41D0?=
 =?us-ascii?Q?TUeRmuZNbiYhkYrPZaafaex12gQhQ5ZZMOfV0+4MHprIheReIlgdh1IDecJ3?=
 =?us-ascii?Q?C8bFe59Qc9b87KrX3+fQe9tftqO9xS2xc0Ur53LrMDmR2BIxMM/392wY5Xsb?=
 =?us-ascii?Q?wS+oyjKn/Fr/YC2xGTV6sGfa/0L4bOQ3puhqhns2/bROTgGGbBphIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?17ZrKT9rF6J+OPHE82QZzD4BjEblw1K/Wr7STuMEXe3fD28ZryemgdvVf4Vf?=
 =?us-ascii?Q?gigTYTaUvhAovVfB4dMtghfKyTXYQd8VnJJNgjW8kKZSB2zu3lFmVmVV940e?=
 =?us-ascii?Q?HezFhuIJu4y+qRuWM5nbWEiyVpRx2KmA8LJWyHOSil7RIqCBidELgvnaNZG5?=
 =?us-ascii?Q?365RFRp58UXPN7+VuvmsHvo3oLkU2Uw1REkTHmnrxhXaNtZ8agu9JVTCeDFT?=
 =?us-ascii?Q?/0ZUQOI961CLIYmkTwF3zsqIaMsdriLHmCXpUjYVzhEjjYbmqKpLDCazOz8f?=
 =?us-ascii?Q?5aZj8parSrfXwIZeduPm8BXVc2L1gmrAm2dH1yktEbSv1Bc+MN0Ajgx9zUko?=
 =?us-ascii?Q?GzdZDva5KpZRC8mU+G5emKUUUkiZBQoxgwCPyK2CoPQgxxYlmlQBADCrK1Xy?=
 =?us-ascii?Q?FxZGAZ6aQWbdGLbCgxQhofrg46mIidLRKuccJ47Nn8uIZ4hX5AFeJlFnr0zm?=
 =?us-ascii?Q?sjQFLjsCub3S9m+ehQmnFkNdXZfDJhSxVuwpdcG4X0185zY8i7FCfM4NppU+?=
 =?us-ascii?Q?zqL0zJERtdSoWaHe6tCyMD848wvyyoR8m5qqt/9cvifeH3TizneEsaPGh3uZ?=
 =?us-ascii?Q?lAmy4uVxhczMOdLeJxGL4IJHA5IIKxY4yD/DGlm9VaVsuA/SWUnKELnRZ656?=
 =?us-ascii?Q?4JmxX8bVosI6PAvc1pOHJ+i6mS5TD3i8U/KSNWR2WQBkmsiLJMv51PMqOldq?=
 =?us-ascii?Q?SzsCZW4p6RKaq0BzELTlJWMJiy8iLYMH+QdIFn6Fv9C3xbXiMWFNvjZypy4y?=
 =?us-ascii?Q?PXGqPzVzwJAUkgehkDWHw0JUM2YOF8KWAKuY3aTdvdjbuYsw96Dbwazg4ktU?=
 =?us-ascii?Q?rhxdWWakW5Q2dZMhplJFD5F6ydZvl1drISoKE0hLs8YfGCyPlRSugRkiTJSA?=
 =?us-ascii?Q?TuFVKRDUMfTivy5H0G2q6WQiSM61fNNJjpokof1sy+1YWdDcPLDhFxZ4vYw3?=
 =?us-ascii?Q?rIf5NiMMmxPXpnvrw5MgQRuUKYY//qzllYbbK/u/l6IQOoUfX5vZXbx9XAj5?=
 =?us-ascii?Q?KB0M66HYtuno0Av9zEmEYHtwtcqe8nVRILLwEFuMNS6mfCnlMxEUi5ewhdyI?=
 =?us-ascii?Q?vvi3EOZ8WwyrO0x565ZdyKeXLqENW6E1CexCW4AahoDMwk31WDtf7vYan4h1?=
 =?us-ascii?Q?6+npDfQtCntkEzFhy08JSyAooFoO45ymJeRu+6hSaiAUsv79iWJFwOKbQW3y?=
 =?us-ascii?Q?vYZCcAy2mdmISVtxDdpVWdrcZ6EUwEbJq0F2TwLu4lJN6w9z46Yhk4hhyMtx?=
 =?us-ascii?Q?Jjta11O+O7twdKYGAHEtVXKB7sz2dpJVsAhgN4XyDlQIo+zpdVAhS7hcGhMl?=
 =?us-ascii?Q?fPw4TUeqcuW/wxFUKpl1cMD3ajbuIiu91RhZLb5pZpsR+JZMwqWLyhYPNtSn?=
 =?us-ascii?Q?VcDk2UGbV0+zLFQh5fMsx//1A91BINltkkspFB10X41MHPwz8ckoNUx9T37L?=
 =?us-ascii?Q?clKrPDmsXf5/wFxY8ZhMzF8k2i6fJ2/zBtt6dJAG74kxplCT16WnAKMKLRNa?=
 =?us-ascii?Q?S80L1DH9Udpv3rEL9TZbRaKibCrYfglaqimR2Q/NsTrm7d8buOsbX5enIgT/?=
 =?us-ascii?Q?9NR8MbkO7Vg4azAFk7g8U4KDn5iu1kvLDKosz4Hz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f4843f-e1fd-408e-ec0d-08de2af1da85
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 00:38:57.8268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVSXsIY7zNONka7Uv2smWFScipSkrgxRe4+slGDKL8qiHpKSO0EsTN9QHP3hyumlZmfyCeEMbhByNE86qwFKOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7617
X-OriginatorOrg: intel.com

On Sun, Nov 23, 2025 at 10:30:29PM +0100, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git more-at-least-decorations-v1
> head:   da707520ed1dbaed0ef9666f7adfac8910423a1f
> commit: da707520ed1dbaed0ef9666f7adfac8910423a1f [9/9] lib/crypto: sha2: Add at_least decoration to fixed-size array params
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251123/202511232200.7DLfeFhG-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511232200.7DLfeFhG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511232200.7DLfeFhG-lkp@intel.com/

Sorry that there're already a few reports on this commit, i will check this case to reduce
the report number for a single commit.

> 
> All warnings (new ones prefixed by >>):
> 
>      396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
>          |                              ^~~~~~~~
>    include/crypto/sha2.h:396:38: error: expected ']' before numeric constant
>      396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
>          |                                      ^
>          |                                      ]
>    include/crypto/sha2.h:397:22: error: expected ';', ',' or ')' before 'u8'
>      397 |                      u8 out2[at_least SHA256_DIGEST_SIZE]);
>          |                      ^~
>    include/crypto/sha2.h:495:31: error: 'at_least' undeclared here (not in a function)
>      495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                               ^~~~~~~~
>    include/crypto/sha2.h:495:39: error: expected ']' before numeric constant
>      495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                                       ^
>          |                                       ]
>    include/crypto/sha2.h:510:25: error: 'at_least' undeclared here (not in a function)
>      510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                         ^~~~~~~~
>    include/crypto/sha2.h:510:33: error: expected ']' before numeric constant
>      510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                                 ^
>          |                                 ]
>    include/crypto/sha2.h:527:37: error: 'at_least' undeclared here (not in a function)
>      527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                                     ^~~~~~~~
>    include/crypto/sha2.h:527:45: error: expected ']' before numeric constant
>      527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                                             ^
>          |                                             ]
>    include/crypto/sha2.h:606:50: error: 'at_least' undeclared here (not in a function)
>      606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                                  ^~~~~~~~
>    include/crypto/sha2.h:606:58: error: expected ']' before numeric constant
>      606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                                          ^
>          |                                                          ]
>    include/crypto/sha2.h:616:48: error: 'at_least' undeclared here (not in a function)
>      616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                                ^~~~~~~~
>    include/crypto/sha2.h:616:56: error: expected ']' before numeric constant
>      616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                                        ^
>          |                                                        ]
>    include/crypto/sha2.h:704:31: error: 'at_least' undeclared here (not in a function)
>      704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                               ^~~~~~~~
>    include/crypto/sha2.h:704:39: error: expected ']' before numeric constant
>      704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                       ^
>          |                                       ]
>    include/crypto/sha2.h:719:25: error: 'at_least' undeclared here (not in a function)
>      719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                         ^~~~~~~~
>    include/crypto/sha2.h:719:33: error: expected ']' before numeric constant
>      719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                 ^
>          |                                 ]
>    include/crypto/sha2.h:736:37: error: 'at_least' undeclared here (not in a function)
>      736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                     ^~~~~~~~
>    include/crypto/sha2.h:736:45: error: expected ']' before numeric constant
>      736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                             ^
>          |                                             ]
>    include/crypto/sha2.h:781:50: error: 'at_least' undeclared here (not in a function)
>      781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                                  ^~~~~~~~
>    include/crypto/sha2.h:781:58: error: expected ']' before numeric constant
>      781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                                          ^
>          |                                                          ]
>    include/crypto/sha2.h:791:48: error: 'at_least' undeclared here (not in a function)
>      791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                                ^~~~~~~~
>    include/crypto/sha2.h:791:56: error: expected ']' before numeric constant
>      791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                                        ^
>          |                                                        ]
>    include/crypto/sha2.h:879:31: error: 'at_least' undeclared here (not in a function)
>      879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                               ^~~~~~~~
>    include/crypto/sha2.h:879:39: error: expected ']' before numeric constant
>      879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                       ^
>          |                                       ]
>    include/crypto/sha2.h:894:25: error: 'at_least' undeclared here (not in a function)
>      894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                         ^~~~~~~~
>    include/crypto/sha2.h:894:33: error: expected ']' before numeric constant
>      894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                 ^
>          |                                 ]
>    include/crypto/sha2.h:911:37: error: 'at_least' undeclared here (not in a function)
>      911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                     ^~~~~~~~
>    include/crypto/sha2.h:911:45: error: expected ']' before numeric constant
>      911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                             ^
>          |                                             ]
> >> lib/crypto/sha256.c:237:6: warning: no previous prototype for 'sha224_final' [-Wmissing-prototypes]
>      237 | void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE])
>          |      ^~~~~~~~~~~~
> >> lib/crypto/sha256.c:244:6: warning: no previous prototype for 'sha256_final' [-Wmissing-prototypes]
>      244 | void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE])
>          |      ^~~~~~~~~~~~
> >> lib/crypto/sha256.c:251:6: warning: no previous prototype for 'sha224' [-Wmissing-prototypes]
>      251 | void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE])
>          |      ^~~~~~
> >> lib/crypto/sha256.c:261:6: warning: no previous prototype for 'sha256' [-Wmissing-prototypes]
>      261 | void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
>          |      ^~~~~~
> >> lib/crypto/sha256.c:307:6: warning: no previous prototype for 'sha256_finup_2x' [-Wmissing-prototypes]
>      307 | void sha256_finup_2x(const struct sha256_ctx *ctx, const u8 *data1,
>          |      ^~~~~~~~~~~~~~~
> >> lib/crypto/sha256.c:421:6: warning: no previous prototype for 'hmac_sha224_final' [-Wmissing-prototypes]
>      421 | void hmac_sha224_final(struct hmac_sha224_ctx *ctx,
>          |      ^~~~~~~~~~~~~~~~~
> >> lib/crypto/sha256.c:428:6: warning: no previous prototype for 'hmac_sha256_final' [-Wmissing-prototypes]
>      428 | void hmac_sha256_final(struct hmac_sha256_ctx *ctx,
>          |      ^~~~~~~~~~~~~~~~~
> >> lib/crypto/sha256.c:435:6: warning: no previous prototype for 'hmac_sha224' [-Wmissing-prototypes]
>      435 | void hmac_sha224(const struct hmac_sha224_key *key,
>          |      ^~~~~~~~~~~
> >> lib/crypto/sha256.c:446:6: warning: no previous prototype for 'hmac_sha256' [-Wmissing-prototypes]
>      446 | void hmac_sha256(const struct hmac_sha256_key *key,
>          |      ^~~~~~~~~~~
> >> lib/crypto/sha256.c:457:6: warning: no previous prototype for 'hmac_sha224_usingrawkey' [-Wmissing-prototypes]
>      457 | void hmac_sha224_usingrawkey(const u8 *raw_key, size_t raw_key_len,
>          |      ^~~~~~~~~~~~~~~~~~~~~~~
> >> lib/crypto/sha256.c:469:6: warning: no previous prototype for 'hmac_sha256_usingrawkey' [-Wmissing-prototypes]
>      469 | void hmac_sha256_usingrawkey(const u8 *raw_key, size_t raw_key_len,
>          |      ^~~~~~~~~~~~~~~~~~~~~~~
> --
>      396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
>          |                              ^~~~~~~~
>    include/crypto/sha2.h:396:38: error: expected ']' before numeric constant
>      396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
>          |                                      ^
>          |                                      ]
>    include/crypto/sha2.h:397:22: error: expected ';', ',' or ')' before 'u8'
>      397 |                      u8 out2[at_least SHA256_DIGEST_SIZE]);
>          |                      ^~
>    include/crypto/sha2.h:495:31: error: 'at_least' undeclared here (not in a function)
>      495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                               ^~~~~~~~
>    include/crypto/sha2.h:495:39: error: expected ']' before numeric constant
>      495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                                       ^
>          |                                       ]
>    include/crypto/sha2.h:510:25: error: 'at_least' undeclared here (not in a function)
>      510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                         ^~~~~~~~
>    include/crypto/sha2.h:510:33: error: expected ']' before numeric constant
>      510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                                 ^
>          |                                 ]
>    include/crypto/sha2.h:527:37: error: 'at_least' undeclared here (not in a function)
>      527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                                     ^~~~~~~~
>    include/crypto/sha2.h:527:45: error: expected ']' before numeric constant
>      527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
>          |                                             ^
>          |                                             ]
>    include/crypto/sha2.h:606:50: error: 'at_least' undeclared here (not in a function)
>      606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                                  ^~~~~~~~
>    include/crypto/sha2.h:606:58: error: expected ']' before numeric constant
>      606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                                          ^
>          |                                                          ]
>    include/crypto/sha2.h:616:48: error: 'at_least' undeclared here (not in a function)
>      616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                                ^~~~~~~~
>    include/crypto/sha2.h:616:56: error: expected ']' before numeric constant
>      616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                                        ^
>          |                                                        ]
>    include/crypto/sha2.h:704:31: error: 'at_least' undeclared here (not in a function)
>      704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                               ^~~~~~~~
>    include/crypto/sha2.h:704:39: error: expected ']' before numeric constant
>      704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                       ^
>          |                                       ]
>    include/crypto/sha2.h:719:25: error: 'at_least' undeclared here (not in a function)
>      719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                         ^~~~~~~~
>    include/crypto/sha2.h:719:33: error: expected ']' before numeric constant
>      719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                 ^
>          |                                 ]
>    include/crypto/sha2.h:736:37: error: 'at_least' undeclared here (not in a function)
>      736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                     ^~~~~~~~
>    include/crypto/sha2.h:736:45: error: expected ']' before numeric constant
>      736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
>          |                                             ^
>          |                                             ]
>    include/crypto/sha2.h:781:50: error: 'at_least' undeclared here (not in a function)
>      781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                                  ^~~~~~~~
>    include/crypto/sha2.h:781:58: error: expected ']' before numeric constant
>      781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                                          ^
>          |                                                          ]
>    include/crypto/sha2.h:791:48: error: 'at_least' undeclared here (not in a function)
>      791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                                ^~~~~~~~
>    include/crypto/sha2.h:791:56: error: expected ']' before numeric constant
>      791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                                        ^
>          |                                                        ]
>    include/crypto/sha2.h:879:31: error: 'at_least' undeclared here (not in a function)
>      879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                               ^~~~~~~~
>    include/crypto/sha2.h:879:39: error: expected ']' before numeric constant
>      879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                       ^
>          |                                       ]
>    include/crypto/sha2.h:894:25: error: 'at_least' undeclared here (not in a function)
>      894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                         ^~~~~~~~
>    include/crypto/sha2.h:894:33: error: expected ']' before numeric constant
>      894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                 ^
>          |                                 ]
>    include/crypto/sha2.h:911:37: error: 'at_least' undeclared here (not in a function)
>      911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                     ^~~~~~~~
>    include/crypto/sha2.h:911:45: error: expected ']' before numeric constant
>      911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
>          |                                             ^
>          |                                             ]
> >> lib/crypto/sha512.c:218:6: warning: no previous prototype for 'sha384_final' [-Wmissing-prototypes]
>      218 | void sha384_final(struct sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE])
>          |      ^~~~~~~~~~~~
> >> lib/crypto/sha512.c:225:6: warning: no previous prototype for 'sha512_final' [-Wmissing-prototypes]
>      225 | void sha512_final(struct sha512_ctx *ctx, u8 out[SHA512_DIGEST_SIZE])
>          |      ^~~~~~~~~~~~
> >> lib/crypto/sha512.c:232:6: warning: no previous prototype for 'sha384' [-Wmissing-prototypes]
>      232 | void sha384(const u8 *data, size_t len, u8 out[SHA384_DIGEST_SIZE])
>          |      ^~~~~~
> >> lib/crypto/sha512.c:242:6: warning: no previous prototype for 'sha512' [-Wmissing-prototypes]
>      242 | void sha512(const u8 *data, size_t len, u8 out[SHA512_DIGEST_SIZE])
>          |      ^~~~~~
> >> lib/crypto/sha512.c:348:6: warning: no previous prototype for 'hmac_sha384_final' [-Wmissing-prototypes]
>      348 | void hmac_sha384_final(struct hmac_sha384_ctx *ctx,
>          |      ^~~~~~~~~~~~~~~~~
> >> lib/crypto/sha512.c:355:6: warning: no previous prototype for 'hmac_sha512_final' [-Wmissing-prototypes]
>      355 | void hmac_sha512_final(struct hmac_sha512_ctx *ctx,
>          |      ^~~~~~~~~~~~~~~~~
> >> lib/crypto/sha512.c:362:6: warning: no previous prototype for 'hmac_sha384' [-Wmissing-prototypes]
>      362 | void hmac_sha384(const struct hmac_sha384_key *key,
>          |      ^~~~~~~~~~~
> >> lib/crypto/sha512.c:373:6: warning: no previous prototype for 'hmac_sha512' [-Wmissing-prototypes]
>      373 | void hmac_sha512(const struct hmac_sha512_key *key,
>          |      ^~~~~~~~~~~
> >> lib/crypto/sha512.c:384:6: warning: no previous prototype for 'hmac_sha384_usingrawkey' [-Wmissing-prototypes]
>      384 | void hmac_sha384_usingrawkey(const u8 *raw_key, size_t raw_key_len,
>          |      ^~~~~~~~~~~~~~~~~~~~~~~
> >> lib/crypto/sha512.c:396:6: warning: no previous prototype for 'hmac_sha512_usingrawkey' [-Wmissing-prototypes]
>      396 | void hmac_sha512_usingrawkey(const u8 *raw_key, size_t raw_key_len,
>          |      ^~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/sha224_final +237 lib/crypto/sha256.c
> 
> 7d2f5b0c43e0bb Hans de Goede 2019-08-17  236  
> b86ced882b8e66 Eric Biggers  2025-06-30 @237  void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE])
> 7d2f5b0c43e0bb Hans de Goede 2019-08-17  238  {
> b86ced882b8e66 Eric Biggers  2025-06-30  239  	__sha256_final(&ctx->ctx, out, SHA224_DIGEST_SIZE);
> b86ced882b8e66 Eric Biggers  2025-06-30  240  	memzero_explicit(ctx, sizeof(*ctx));
> 7d2f5b0c43e0bb Hans de Goede 2019-08-17  241  }
> 7d2f5b0c43e0bb Hans de Goede 2019-08-17  242  EXPORT_SYMBOL(sha224_final);
> 9ecf5ad522e09d Hans de Goede 2019-08-25  243  
> b86ced882b8e66 Eric Biggers  2025-06-30 @244  void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE])
> 3135d5be7c2784 Eric Biggers  2025-06-30  245  {
> b86ced882b8e66 Eric Biggers  2025-06-30  246  	__sha256_final(&ctx->ctx, out, SHA256_DIGEST_SIZE);
> b86ced882b8e66 Eric Biggers  2025-06-30  247  	memzero_explicit(ctx, sizeof(*ctx));
> 3135d5be7c2784 Eric Biggers  2025-06-30  248  }
> 3135d5be7c2784 Eric Biggers  2025-06-30  249  EXPORT_SYMBOL(sha256_final);
> 3135d5be7c2784 Eric Biggers  2025-06-30  250  
> 6fa4b292204b15 Eric Biggers  2025-06-30 @251  void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE])
> 6fa4b292204b15 Eric Biggers  2025-06-30  252  {
> b86ced882b8e66 Eric Biggers  2025-06-30  253  	struct sha224_ctx ctx;
> 6fa4b292204b15 Eric Biggers  2025-06-30  254  
> b86ced882b8e66 Eric Biggers  2025-06-30  255  	sha224_init(&ctx);
> b86ced882b8e66 Eric Biggers  2025-06-30  256  	sha224_update(&ctx, data, len);
> b86ced882b8e66 Eric Biggers  2025-06-30  257  	sha224_final(&ctx, out);
> 6fa4b292204b15 Eric Biggers  2025-06-30  258  }
> 6fa4b292204b15 Eric Biggers  2025-06-30  259  EXPORT_SYMBOL(sha224);
> 6fa4b292204b15 Eric Biggers  2025-06-30  260  
> 7350fef56b7629 Eric Biggers  2025-04-28 @261  void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
> 9ea9c58b40a441 Eric Biggers  2020-07-08  262  {
> b86ced882b8e66 Eric Biggers  2025-06-30  263  	struct sha256_ctx ctx;
> 9ea9c58b40a441 Eric Biggers  2020-07-08  264  
> b86ced882b8e66 Eric Biggers  2025-06-30  265  	sha256_init(&ctx);
> b86ced882b8e66 Eric Biggers  2025-06-30  266  	sha256_update(&ctx, data, len);
> b86ced882b8e66 Eric Biggers  2025-06-30  267  	sha256_final(&ctx, out);
> 9ea9c58b40a441 Eric Biggers  2020-07-08  268  }
> 9ea9c58b40a441 Eric Biggers  2020-07-08  269  EXPORT_SYMBOL(sha256);
> 9ea9c58b40a441 Eric Biggers  2020-07-08  270  
> 4ca24d6abbca5d Eric Biggers  2025-09-15  271  /*
> 4ca24d6abbca5d Eric Biggers  2025-09-15  272   * Pre-boot environment (as indicated by __DISABLE_EXPORTS being defined)
> 4ca24d6abbca5d Eric Biggers  2025-09-15  273   * doesn't need either HMAC support or interleaved hashing support
> 4ca24d6abbca5d Eric Biggers  2025-09-15  274   */
> 077833cd600908 Eric Biggers  2025-06-30  275  #ifndef __DISABLE_EXPORTS
> 4ca24d6abbca5d Eric Biggers  2025-09-15  276  
> 4ca24d6abbca5d Eric Biggers  2025-09-15  277  #ifndef sha256_finup_2x_arch
> 4ca24d6abbca5d Eric Biggers  2025-09-15  278  static bool sha256_finup_2x_arch(const struct __sha256_ctx *ctx,
> 4ca24d6abbca5d Eric Biggers  2025-09-15  279  				 const u8 *data1, const u8 *data2, size_t len,
> 4ca24d6abbca5d Eric Biggers  2025-09-15  280  				 u8 out1[SHA256_DIGEST_SIZE],
> 4ca24d6abbca5d Eric Biggers  2025-09-15  281  				 u8 out2[SHA256_DIGEST_SIZE])
> 4ca24d6abbca5d Eric Biggers  2025-09-15  282  {
> 4ca24d6abbca5d Eric Biggers  2025-09-15  283  	return false;
> 4ca24d6abbca5d Eric Biggers  2025-09-15  284  }
> 4ca24d6abbca5d Eric Biggers  2025-09-15  285  static bool sha256_finup_2x_is_optimized_arch(void)
> 4ca24d6abbca5d Eric Biggers  2025-09-15  286  {
> 4ca24d6abbca5d Eric Biggers  2025-09-15  287  	return false;
> 4ca24d6abbca5d Eric Biggers  2025-09-15  288  }
> 4ca24d6abbca5d Eric Biggers  2025-09-15  289  #endif
> 4ca24d6abbca5d Eric Biggers  2025-09-15  290  
> 4ca24d6abbca5d Eric Biggers  2025-09-15  291  /* Sequential fallback implementation of sha256_finup_2x() */
> 4ca24d6abbca5d Eric Biggers  2025-09-15  292  static noinline_for_stack void sha256_finup_2x_sequential(
> 4ca24d6abbca5d Eric Biggers  2025-09-15  293  	const struct __sha256_ctx *ctx, const u8 *data1, const u8 *data2,
> 4ca24d6abbca5d Eric Biggers  2025-09-15  294  	size_t len, u8 out1[SHA256_DIGEST_SIZE], u8 out2[SHA256_DIGEST_SIZE])
> 4ca24d6abbca5d Eric Biggers  2025-09-15  295  {
> 4ca24d6abbca5d Eric Biggers  2025-09-15  296  	struct __sha256_ctx mut_ctx;
> 4ca24d6abbca5d Eric Biggers  2025-09-15  297  
> 4ca24d6abbca5d Eric Biggers  2025-09-15  298  	mut_ctx = *ctx;
> 4ca24d6abbca5d Eric Biggers  2025-09-15  299  	__sha256_update(&mut_ctx, data1, len);
> 4ca24d6abbca5d Eric Biggers  2025-09-15  300  	__sha256_final(&mut_ctx, out1, SHA256_DIGEST_SIZE);
> 4ca24d6abbca5d Eric Biggers  2025-09-15  301  
> 4ca24d6abbca5d Eric Biggers  2025-09-15  302  	mut_ctx = *ctx;
> 4ca24d6abbca5d Eric Biggers  2025-09-15  303  	__sha256_update(&mut_ctx, data2, len);
> 4ca24d6abbca5d Eric Biggers  2025-09-15  304  	__sha256_final(&mut_ctx, out2, SHA256_DIGEST_SIZE);
> 4ca24d6abbca5d Eric Biggers  2025-09-15  305  }
> 4ca24d6abbca5d Eric Biggers  2025-09-15  306  
> 4ca24d6abbca5d Eric Biggers  2025-09-15 @307  void sha256_finup_2x(const struct sha256_ctx *ctx, const u8 *data1,
> 4ca24d6abbca5d Eric Biggers  2025-09-15  308  		     const u8 *data2, size_t len, u8 out1[SHA256_DIGEST_SIZE],
> 4ca24d6abbca5d Eric Biggers  2025-09-15  309  		     u8 out2[SHA256_DIGEST_SIZE])
> 4ca24d6abbca5d Eric Biggers  2025-09-15  310  {
> 4ca24d6abbca5d Eric Biggers  2025-09-15  311  	if (ctx == NULL)
> 4ca24d6abbca5d Eric Biggers  2025-09-15  312  		ctx = &initial_sha256_ctx;
> 4ca24d6abbca5d Eric Biggers  2025-09-15  313  
> 4ca24d6abbca5d Eric Biggers  2025-09-15  314  	if (likely(sha256_finup_2x_arch(&ctx->ctx, data1, data2, len, out1,
> 4ca24d6abbca5d Eric Biggers  2025-09-15  315  					out2)))
> 4ca24d6abbca5d Eric Biggers  2025-09-15  316  		return;
> 4ca24d6abbca5d Eric Biggers  2025-09-15  317  	sha256_finup_2x_sequential(&ctx->ctx, data1, data2, len, out1, out2);
> 4ca24d6abbca5d Eric Biggers  2025-09-15  318  }
> 4ca24d6abbca5d Eric Biggers  2025-09-15  319  EXPORT_SYMBOL_GPL(sha256_finup_2x);
> 4ca24d6abbca5d Eric Biggers  2025-09-15  320  
> 4ca24d6abbca5d Eric Biggers  2025-09-15  321  bool sha256_finup_2x_is_optimized(void)
> 4ca24d6abbca5d Eric Biggers  2025-09-15  322  {
> 4ca24d6abbca5d Eric Biggers  2025-09-15  323  	return sha256_finup_2x_is_optimized_arch();
> 4ca24d6abbca5d Eric Biggers  2025-09-15  324  }
> 4ca24d6abbca5d Eric Biggers  2025-09-15  325  EXPORT_SYMBOL_GPL(sha256_finup_2x_is_optimized);
> 4ca24d6abbca5d Eric Biggers  2025-09-15  326  
> 7941ad69650691 Eric Biggers  2025-07-11  327  static void __hmac_sha256_preparekey(struct sha256_block_state *istate,
> 7941ad69650691 Eric Biggers  2025-07-11  328  				     struct sha256_block_state *ostate,
> 077833cd600908 Eric Biggers  2025-06-30  329  				     const u8 *raw_key, size_t raw_key_len,
> 077833cd600908 Eric Biggers  2025-06-30  330  				     const struct sha256_block_state *iv)
> 077833cd600908 Eric Biggers  2025-06-30  331  {
> 077833cd600908 Eric Biggers  2025-06-30  332  	union {
> 077833cd600908 Eric Biggers  2025-06-30  333  		u8 b[SHA256_BLOCK_SIZE];
> 077833cd600908 Eric Biggers  2025-06-30  334  		unsigned long w[SHA256_BLOCK_SIZE / sizeof(unsigned long)];
> 077833cd600908 Eric Biggers  2025-06-30  335  	} derived_key = { 0 };
> 077833cd600908 Eric Biggers  2025-06-30  336  
> 077833cd600908 Eric Biggers  2025-06-30  337  	if (unlikely(raw_key_len > SHA256_BLOCK_SIZE)) {
> 077833cd600908 Eric Biggers  2025-06-30  338  		if (iv == &sha224_iv)
> 077833cd600908 Eric Biggers  2025-06-30  339  			sha224(raw_key, raw_key_len, derived_key.b);
> 077833cd600908 Eric Biggers  2025-06-30  340  		else
> 077833cd600908 Eric Biggers  2025-06-30  341  			sha256(raw_key, raw_key_len, derived_key.b);
> 077833cd600908 Eric Biggers  2025-06-30  342  	} else {
> 077833cd600908 Eric Biggers  2025-06-30  343  		memcpy(derived_key.b, raw_key, raw_key_len);
> 077833cd600908 Eric Biggers  2025-06-30  344  	}
> 077833cd600908 Eric Biggers  2025-06-30  345  
> 077833cd600908 Eric Biggers  2025-06-30  346  	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
> 077833cd600908 Eric Biggers  2025-06-30  347  		derived_key.w[i] ^= REPEAT_BYTE(HMAC_IPAD_VALUE);
> 7941ad69650691 Eric Biggers  2025-07-11  348  	*istate = *iv;
> 7941ad69650691 Eric Biggers  2025-07-11  349  	sha256_blocks(istate, derived_key.b, 1);
> 077833cd600908 Eric Biggers  2025-06-30  350  
> 077833cd600908 Eric Biggers  2025-06-30  351  	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
> 077833cd600908 Eric Biggers  2025-06-30  352  		derived_key.w[i] ^= REPEAT_BYTE(HMAC_OPAD_VALUE ^
> 077833cd600908 Eric Biggers  2025-06-30  353  						HMAC_IPAD_VALUE);
> 7941ad69650691 Eric Biggers  2025-07-11  354  	*ostate = *iv;
> 7941ad69650691 Eric Biggers  2025-07-11  355  	sha256_blocks(ostate, derived_key.b, 1);
> 077833cd600908 Eric Biggers  2025-06-30  356  
> 077833cd600908 Eric Biggers  2025-06-30  357  	memzero_explicit(&derived_key, sizeof(derived_key));
> 077833cd600908 Eric Biggers  2025-06-30  358  }
> 077833cd600908 Eric Biggers  2025-06-30  359  
> 077833cd600908 Eric Biggers  2025-06-30  360  void hmac_sha224_preparekey(struct hmac_sha224_key *key,
> 077833cd600908 Eric Biggers  2025-06-30  361  			    const u8 *raw_key, size_t raw_key_len)
> 077833cd600908 Eric Biggers  2025-06-30  362  {
> 7941ad69650691 Eric Biggers  2025-07-11  363  	__hmac_sha256_preparekey(&key->key.istate, &key->key.ostate,
> 7941ad69650691 Eric Biggers  2025-07-11  364  				 raw_key, raw_key_len, &sha224_iv);
> 077833cd600908 Eric Biggers  2025-06-30  365  }
> 077833cd600908 Eric Biggers  2025-06-30  366  EXPORT_SYMBOL_GPL(hmac_sha224_preparekey);
> 077833cd600908 Eric Biggers  2025-06-30  367  
> 077833cd600908 Eric Biggers  2025-06-30  368  void hmac_sha256_preparekey(struct hmac_sha256_key *key,
> 077833cd600908 Eric Biggers  2025-06-30  369  			    const u8 *raw_key, size_t raw_key_len)
> 077833cd600908 Eric Biggers  2025-06-30  370  {
> 7941ad69650691 Eric Biggers  2025-07-11  371  	__hmac_sha256_preparekey(&key->key.istate, &key->key.ostate,
> 7941ad69650691 Eric Biggers  2025-07-11  372  				 raw_key, raw_key_len, &sha256_iv);
> 077833cd600908 Eric Biggers  2025-06-30  373  }
> 077833cd600908 Eric Biggers  2025-06-30  374  EXPORT_SYMBOL_GPL(hmac_sha256_preparekey);
> 077833cd600908 Eric Biggers  2025-06-30  375  
> 077833cd600908 Eric Biggers  2025-06-30  376  void __hmac_sha256_init(struct __hmac_sha256_ctx *ctx,
> 077833cd600908 Eric Biggers  2025-06-30  377  			const struct __hmac_sha256_key *key)
> 077833cd600908 Eric Biggers  2025-06-30  378  {
> 077833cd600908 Eric Biggers  2025-06-30  379  	__sha256_init(&ctx->sha_ctx, &key->istate, SHA256_BLOCK_SIZE);
> 077833cd600908 Eric Biggers  2025-06-30  380  	ctx->ostate = key->ostate;
> 077833cd600908 Eric Biggers  2025-06-30  381  }
> 077833cd600908 Eric Biggers  2025-06-30  382  EXPORT_SYMBOL_GPL(__hmac_sha256_init);
> 077833cd600908 Eric Biggers  2025-06-30  383  
> 7941ad69650691 Eric Biggers  2025-07-11  384  void hmac_sha224_init_usingrawkey(struct hmac_sha224_ctx *ctx,
> 7941ad69650691 Eric Biggers  2025-07-11  385  				  const u8 *raw_key, size_t raw_key_len)
> 7941ad69650691 Eric Biggers  2025-07-11  386  {
> 7941ad69650691 Eric Biggers  2025-07-11  387  	__hmac_sha256_preparekey(&ctx->ctx.sha_ctx.state, &ctx->ctx.ostate,
> 7941ad69650691 Eric Biggers  2025-07-11  388  				 raw_key, raw_key_len, &sha224_iv);
> 7941ad69650691 Eric Biggers  2025-07-11  389  	ctx->ctx.sha_ctx.bytecount = SHA256_BLOCK_SIZE;
> 7941ad69650691 Eric Biggers  2025-07-11  390  }
> 7941ad69650691 Eric Biggers  2025-07-11  391  EXPORT_SYMBOL_GPL(hmac_sha224_init_usingrawkey);
> 7941ad69650691 Eric Biggers  2025-07-11  392  
> 7941ad69650691 Eric Biggers  2025-07-11  393  void hmac_sha256_init_usingrawkey(struct hmac_sha256_ctx *ctx,
> 7941ad69650691 Eric Biggers  2025-07-11  394  				  const u8 *raw_key, size_t raw_key_len)
> 7941ad69650691 Eric Biggers  2025-07-11  395  {
> 7941ad69650691 Eric Biggers  2025-07-11  396  	__hmac_sha256_preparekey(&ctx->ctx.sha_ctx.state, &ctx->ctx.ostate,
> 7941ad69650691 Eric Biggers  2025-07-11  397  				 raw_key, raw_key_len, &sha256_iv);
> 7941ad69650691 Eric Biggers  2025-07-11  398  	ctx->ctx.sha_ctx.bytecount = SHA256_BLOCK_SIZE;
> 7941ad69650691 Eric Biggers  2025-07-11  399  }
> 7941ad69650691 Eric Biggers  2025-07-11  400  EXPORT_SYMBOL_GPL(hmac_sha256_init_usingrawkey);
> 7941ad69650691 Eric Biggers  2025-07-11  401  
> 077833cd600908 Eric Biggers  2025-06-30  402  static void __hmac_sha256_final(struct __hmac_sha256_ctx *ctx,
> 077833cd600908 Eric Biggers  2025-06-30  403  				u8 *out, size_t digest_size)
> 077833cd600908 Eric Biggers  2025-06-30  404  {
> 077833cd600908 Eric Biggers  2025-06-30  405  	/* Generate the padded input for the outer hash in ctx->sha_ctx.buf. */
> 077833cd600908 Eric Biggers  2025-06-30  406  	__sha256_final(&ctx->sha_ctx, ctx->sha_ctx.buf, digest_size);
> 077833cd600908 Eric Biggers  2025-06-30  407  	memset(&ctx->sha_ctx.buf[digest_size], 0,
> 077833cd600908 Eric Biggers  2025-06-30  408  	       SHA256_BLOCK_SIZE - digest_size);
> 077833cd600908 Eric Biggers  2025-06-30  409  	ctx->sha_ctx.buf[digest_size] = 0x80;
> 077833cd600908 Eric Biggers  2025-06-30  410  	*(__be32 *)&ctx->sha_ctx.buf[SHA256_BLOCK_SIZE - 4] =
> 077833cd600908 Eric Biggers  2025-06-30  411  		cpu_to_be32(8 * (SHA256_BLOCK_SIZE + digest_size));
> 077833cd600908 Eric Biggers  2025-06-30  412  
> 077833cd600908 Eric Biggers  2025-06-30  413  	/* Compute the outer hash, which gives the HMAC value. */
> 077833cd600908 Eric Biggers  2025-06-30  414  	sha256_blocks(&ctx->ostate, ctx->sha_ctx.buf, 1);
> 077833cd600908 Eric Biggers  2025-06-30  415  	for (size_t i = 0; i < digest_size; i += 4)
> 077833cd600908 Eric Biggers  2025-06-30  416  		put_unaligned_be32(ctx->ostate.h[i / 4], out + i);
> 077833cd600908 Eric Biggers  2025-06-30  417  
> 077833cd600908 Eric Biggers  2025-06-30  418  	memzero_explicit(ctx, sizeof(*ctx));
> 077833cd600908 Eric Biggers  2025-06-30  419  }
> 077833cd600908 Eric Biggers  2025-06-30  420  
> 077833cd600908 Eric Biggers  2025-06-30 @421  void hmac_sha224_final(struct hmac_sha224_ctx *ctx,
> 077833cd600908 Eric Biggers  2025-06-30  422  		       u8 out[SHA224_DIGEST_SIZE])
> 077833cd600908 Eric Biggers  2025-06-30  423  {
> 077833cd600908 Eric Biggers  2025-06-30  424  	__hmac_sha256_final(&ctx->ctx, out, SHA224_DIGEST_SIZE);
> 077833cd600908 Eric Biggers  2025-06-30  425  }
> 077833cd600908 Eric Biggers  2025-06-30  426  EXPORT_SYMBOL_GPL(hmac_sha224_final);
> 077833cd600908 Eric Biggers  2025-06-30  427  
> 077833cd600908 Eric Biggers  2025-06-30 @428  void hmac_sha256_final(struct hmac_sha256_ctx *ctx,
> 077833cd600908 Eric Biggers  2025-06-30  429  		       u8 out[SHA256_DIGEST_SIZE])
> 077833cd600908 Eric Biggers  2025-06-30  430  {
> 077833cd600908 Eric Biggers  2025-06-30  431  	__hmac_sha256_final(&ctx->ctx, out, SHA256_DIGEST_SIZE);
> 077833cd600908 Eric Biggers  2025-06-30  432  }
> 077833cd600908 Eric Biggers  2025-06-30  433  EXPORT_SYMBOL_GPL(hmac_sha256_final);
> 077833cd600908 Eric Biggers  2025-06-30  434  
> 077833cd600908 Eric Biggers  2025-06-30 @435  void hmac_sha224(const struct hmac_sha224_key *key,
> 077833cd600908 Eric Biggers  2025-06-30  436  		 const u8 *data, size_t data_len, u8 out[SHA224_DIGEST_SIZE])
> 077833cd600908 Eric Biggers  2025-06-30  437  {
> 077833cd600908 Eric Biggers  2025-06-30  438  	struct hmac_sha224_ctx ctx;
> 077833cd600908 Eric Biggers  2025-06-30  439  
> 077833cd600908 Eric Biggers  2025-06-30  440  	hmac_sha224_init(&ctx, key);
> 077833cd600908 Eric Biggers  2025-06-30  441  	hmac_sha224_update(&ctx, data, data_len);
> 077833cd600908 Eric Biggers  2025-06-30  442  	hmac_sha224_final(&ctx, out);
> 077833cd600908 Eric Biggers  2025-06-30  443  }
> 077833cd600908 Eric Biggers  2025-06-30  444  EXPORT_SYMBOL_GPL(hmac_sha224);
> 077833cd600908 Eric Biggers  2025-06-30  445  
> 
> :::::: The code at line 237 was first introduced by commit
> :::::: b86ced882b8e667758afddffd8d6354197842110 lib/crypto: sha256: Make library API use strongly-typed contexts
> 
> :::::: TO: Eric Biggers <ebiggers@kernel.org>
> :::::: CC: Eric Biggers <ebiggers@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
