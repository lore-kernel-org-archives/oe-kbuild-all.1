Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB24A48167A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631258; cv=fail; b=SHLDKShu7kRpfdp+YUwPdwfjKeaRIVPmGesFDplFlCUtQnUqM590aYE135BkLHyBJmmOBk6RVg85WmjSf48mByA7Wc4Oj1EWn2bsi+FRf4oK5CgwTWHXKqhpm/3jLdLCGKPtCSbNuNiv19t5IPs57EXcN59Rd6tY28dIZqBxMZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631258; c=relaxed/simple;
	bh=Q92uvGup3QADUIucdieWRI76JW5HnHUYBy+DVwE6e24=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ctYKj2k7XudMboZKj3qmXzdk1F9JpGoonJN1X11BvuKYFwFALs9nmDtHi9z3LV8YamF0a1nx5ICc4UgyaYwG2MZ3qfMiaU1jK7deSYEO8m29SWuWMck4yJnqcFZTdGSE7Q2LOve+sYnusWxbfaPQjNBO2BguWBV+zBS+yI1d6ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATV7oPD0; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATV7oPD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786631256; x=1818167256;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Q92uvGup3QADUIucdieWRI76JW5HnHUYBy+DVwE6e24=;
  b=ATV7oPD0uoWfF5VLjLglhQ82oLe3iarJtlj38lEyX6WVZM9ycy5r3lzV
   xezGH04jZVB0NSV0D4EeR4xZY1B4sV7gOzqKF3tzwh9dvgXAd3upQOt0U
   8VxBpQUIbJRBd9C9ckPxFjrIuQDPxXgvWMbFNV8g6upXn+7hNTp0cy85m
   jy4I4LNm8C6YYt4tC8W4MV2lAGihNjzT4RbFN1sgHKMhqht7h4vMbcZoz
   4C6JBeMbTSqt1oqvpb0lHoiHRz9x/fYEWVNf4ufmXNX/ePrLpjBlBr2C3
   cJs8GgTKp83KZrDmufyc2ALEuEpTyyAZQL8nxp0DMwGnS2p6BIaZMvKxv
   w==;
X-CSE-ConnectionGUID: pNG7CKS7S86WB+m1tvNqFg==
X-CSE-MsgGUID: IedPhSrXRfSDHnNE4uqRpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="74743023"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="74743023"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 07:27:35 -0700
X-CSE-ConnectionGUID: bglrjUniQVOkgK3xP1pmsQ==
X-CSE-MsgGUID: HHCRIy6cQR+lOzLqhreVDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="264535243"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 07:27:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 07:27:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 07:27:34 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.48)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 07:27:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypxc39NyAgy0J4UVVdsA4TVTJsMhZDY7qnIppkwSIeAysLazkFoZX88RszrLBWTr01z0rxrCkltFrCrpG6y4f1/Z6XQJxXyH3pILT3CsnZf/UjdWbXN1SdlLRnXEQBpASvJG8x9/KnU74n3rDQbyOApX44wez0l6iLagMu2GjlNg9IXND0BCs9lDLrIkQnzSNRdeUrnudPoycNmedeJRKb4Fj6y0T26ABTycfn0VZhFeFs4jrTJswVuvbmSlAVhriHmk+yotzJ32PtYWkXwaeHrNXDux/QcjT2YprELMnEqWA1xad0ujaKWMuQi5sh4200BstSIPQoz/pXWzJsYH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+3hCsK0nbYFhTYLn5f/pXOzpEjXbsjx2JavdHCDUg0=;
 b=MEPYc7mQK9Q60+fX/ix8T+N3JUrY5tcTlSXMJjXlnrHhFeZI2niMXi351ci0ntdXGW+0GSR7UKAsx/G9MRrwyAc/SFdIDklzx6SY4DFCUkWPFVVkOqXpa9eyE7dQOYB55b0KEycqK73aAAeeWhX0Et5aCAXFkC7kxRKeTK/k49ZzzRTy1BsnrQoDM0vAcmoBnRgTCR0WjmkFlSSBMdEFFWiYKqOcruhKFQUliirpcEQiJQNXgiGXvwsD5k1WHQedOoy+JIDU3doHjfvXRp+46MWWME4noDEjuNmqJg55rws5oOq8IFa4MvVjAbw5aDNNBmLCeWK7PJ+YKTOPtw5zrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by DS4PPF7551E6552.namprd11.prod.outlook.com (2603:10b6:f:fc02::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 14:27:30 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 14:27:30 +0000
Date: Thu, 13 Aug 2026 22:27:21 +0800
From: Philip Li <philip.li@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Greg Ungerer
	<gerg@linux-m68k.org>
Subject: Re: arch/m68k/include/asm/nettel.h:60: undefined reference to
 `ppdata'
Message-ID: <an3USR5ENYDEM82i@rli9-mobl>
References: <202608131917.ZNBnMX82-lkp@intel.com>
 <CAMuHMdUyR4iHO_L+nk+Ut4p0dO4Yv=2pe3ovb+Tqo28TKO40Yg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUyR4iHO_L+nk+Ut4p0dO4Yv=2pe3ovb+Tqo28TKO40Yg@mail.gmail.com>
X-ClientProxiedBy: SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|DS4PPF7551E6552:EE_
X-MS-Office365-Filtering-Correlation-Id: d0968db0-c2f9-4819-0b64-08def94701d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: d5jatwdlzYXdkY2SUe1qiYYnU6+bncYBLhRPf4pkG5aBCkZ1CIZ05sTEazt16x9fsWUpIAFOAAuv2xdKmvZIznfJXdKnr/wHZyZQN7pGaIwUDzri9nUfZ04nCqhp+TG0k2WWg/a1RIY+JN4Mn2iTHj3SBfwfA2txIJNrzdjrwNTU8HGYiHm+hhTgy+JtzaZyNh+4rRvzhK8v/oWcHRG2UevL+fSE4/FSeR4QRJxHA24Y/qGXIHttxQxMY5ZiT5QIO/zuqREB9b5n0HgZpehtL4IUYkJMj1bu5ydqD0ABO4QWMkSWBV++loIv4XkXAeC+4/e5CIHGA/9RweAWMXkLLOch3jJsiOf6bXRqNUCkJJXFBNvYg6kXtHb4LPcCh5UcNkdbNce82fO0MNOFyvCfyVy2J2Gj33cZrQUNG+cHPRCQ6sIHAQGn9B3qI0e0B2hWLi0HOaL9/vEl6ToXngfjno1JzEsz9+DIqCpAE3jMqileLm/bLOI4xrQaCNMVjT60atUmisaWOcf4c9gGpmnOPLrT85v2ITrfxckYa6689ce6mw1KcNVpkbQsSW8SiptBKeG/nO9qBADt/V41ZHhN8Th8XNL4qB/5sYy1/8wM3KB+Xs8pcdlbVDMDdwQrPuNm+7dCEDDx1gnCcN02Inub8HkKGxdp5K9VpxjV0JOKFOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fckqof1V0HyJH5OZg3EgGTdwKi1stUEG5JTnWZBuLo/kS6uNpf5WZi3aigDo?=
 =?us-ascii?Q?dL7dEM0E92B2thkM0jxmOpcQ6eMRBogjOx2UtTojGURLbkjal7PUwDhXRdtM?=
 =?us-ascii?Q?XDfzCaNNu+MEZWYYYjlOhpupvNGw9pnKrZun0r4oPoL4hmytUYzwlY5JzeQE?=
 =?us-ascii?Q?IgWZX9cd+70cdf6AgA0C2UYclkrnICT/ZSLkPgfgt1IDqIDf9ABr23Xn6yl3?=
 =?us-ascii?Q?RbEpvYmy8+UAHTDQE00y+nvHQ0qEaoRG0kC09m4zgwYamx3QWFkmDArbPQyx?=
 =?us-ascii?Q?jkdniamgSTS3FF0xDdAayiOopVA8uVnUBz7hnepZ0VmaKrQS5d7tPiTMaE3l?=
 =?us-ascii?Q?CsY60lRYGK6NiD305J3uzhiTvSUdYd4PP6DOc5iznP+u0Y77sbNvfnAN5P07?=
 =?us-ascii?Q?i7JgTHmIt7G+7wlW8sUHQMw8HVOP49RYla5fp+zLDwUtzsElPyGHY4vgt15g?=
 =?us-ascii?Q?YSTcKtFGOVz9Aisx42F0mqACAMFeVqlfaVI5MEt3T44+3a55llGxfr+Th59d?=
 =?us-ascii?Q?kdrM+wsNffreTJkat68APpDF1cXtG4b+g+hjLRtZVB54tBp+sn1uzaQjXEn8?=
 =?us-ascii?Q?vNxLE2e/EyYLl2GxAEplpELLNEvUO2RgoXVtjcasKPxfF29e7hRmHXfAZ1MD?=
 =?us-ascii?Q?f6GQkw37fCdJR1LyauHaZ2KC648gruYeVXNwG3YiDidQBwxRcnIZfO5MPubi?=
 =?us-ascii?Q?bPtXOR2SgapWzEj/o76CtAt4V+xvBaaq/TpaBczBuDgPtUhHVCxMOk9cBTJ8?=
 =?us-ascii?Q?4wP7M+hpUq7THZh1rCC/gl2aIA2FssB2dEdPZthgUstHT0Wv4edpHUQzfD66?=
 =?us-ascii?Q?kt79fNa8btPb4HYe6lJTgd85W2qReiDzIo7cf5cvD3UyoNONwYloEQl/aF3f?=
 =?us-ascii?Q?UJYG7dXRHYeg3cfIuI8MiehnwYsfLIWGh+NlJnV8XO56EIgC0x5h3pvdyhoR?=
 =?us-ascii?Q?Bnt+e/1JjwXaY8OLN2masvQtIOl9icz1oXd5N/x4WL9kfpPbAR+EBA2f0IEZ?=
 =?us-ascii?Q?2Cj0iMt2XiErPyunVqxIj1X7j0Hd0VH6blnUs2xGOy11rio/z/5djcLB6cNt?=
 =?us-ascii?Q?yUCJmoIYnjvREQ8VBaOcP0GQgRiV0/YVlHs3oDNX/1U0B0ST/x5xBuhOozSE?=
 =?us-ascii?Q?TL7xBN2UgDLfC95f+58mtE0mRjHH6YjuKrdIAFVB5/LiAoX+hBl3FZnp/y7f?=
 =?us-ascii?Q?5Q/HqBMjZ/xhQRIkJkY4XT+cEa3o6ksUTb+Sb5YRvHuIZxXBmCzc5Grg3xvT?=
 =?us-ascii?Q?eRvaUvxXFEzi1mA/Jw7ok+7Lyza4gIZv32Sq42q62xb1qEdzEdL2LER31cxB?=
 =?us-ascii?Q?o9SaK5FD6Dz7pFNcTlvX6kVwhPU3dAILotCLjZ1avGy8Vj0lAfR3DUnmhMmI?=
 =?us-ascii?Q?e1Hmioo+dllFrT36lcAjSHJglJhopjAJZ7IuAEBXliITOjH4JeOrk3Ho/Ji4?=
 =?us-ascii?Q?O4YTtgxfS5Oli7TnNOT5N2IUB2ZSiiMKggtOJEsCxCOJmPRY8VFmBYsM6N8B?=
 =?us-ascii?Q?OcNs9wwD+0Zxhmi32iB71kqMr1tYZUQ5bTjQ3uRrPSQJQ6j12EEvtc4KxcT/?=
 =?us-ascii?Q?CKY/QBJoqOOfl1wJAByTbvyWcE8sO7qbzez8ATYMFd+3HY+S22vyLiOugWbs?=
 =?us-ascii?Q?8PsbDIGSdQElpI4R4bqMiEwcDQcA4AoCpaFWt0sSH4IrChfoe7TKZAAnDT/B?=
 =?us-ascii?Q?VN56pewyRbzDBS0GzqcMcpYvqW1pzi3NZEBw59M10jAzX5LAoXFbWJOUu3kO?=
 =?us-ascii?Q?FvO5yBCjHQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Jmm8w333Rmg8DkUq5VWdCxYjAsL35D8BGtbMfVpGNdt2fbxRyv7NV8HZT59l2oZR8VK0N3TREZna1mkqlorBFcyUEWs7fUfuTyYu319ipTKdVCs6c1s+E7DNojXU21tS/YtZ4VhU/FOmqXCQAIr8nCQFpGKb2R16H9imkZQY+T9QSfLUb+YOv2YM/XCMDOPd3ViTIjhpHqYyo7v02SfMupIy5Lvjan7zVIukk5mwnfo1CeFIzyIpszdO0MNTykNmenAP+K7aaTvJGPEv1yh18wNCxP4TuSBXkig1tWUZsEqzaJ10vlA9uWsPkuGTcPlx2WLWGswkJIxajwMvIck0+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0968db0-c2f9-4819-0b64-08def94701d6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 14:27:30.5023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvbqrdnnylIf1NWc+MvqixMUyNYGOF7gorTXj+oUSXTk9DHNRPX2DLJMA3mpmg75M8mRcCJGFrPqlLeuXYGY2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7551E6552
X-OriginatorOrg: intel.com

On Thu, Aug 13, 2026 at 02:11:33PM +0200, Geert Uytterhoeven wrote:
> Hi Kernel Test Robot,
> 
> On Thu, 13 Aug 2026 at 13:36, kernel test robot <lkp@intel.com> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   3d6d817622b0a9721e3cc404df3469171582be13
> > commit: f47c1b77d0a2a9c0d49ec14302e74f933398d1a3 clk: Move clk_{save,restore}_context() to COMMON_CLK section
> > date:   7 months ago
> > config: m68k-randconfig-r071-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131917.ZNBnMX82-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 10.5.0
> > smatch: v0.5.0-9187-g5189e3fb
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131917.ZNBnMX82-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: f47c1b77d0a2 ("clk: Move clk_{save,restore}_context() to COMMON_CLK section")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202608131917.ZNBnMX82-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    m68k-linux-ld: arch/m68k/coldfire/nettel.o: in function `init_nettel':
> > >> arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
> > >> m68k-linux-ld: arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
> > >> m68k-linux-ld: arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
> >    m68k-linux-ld: arch/m68k/include/asm/nettel.h:61: undefined reference to `ppdata'
> > >> m68k-linux-ld: arch/m68k/include/asm/nettel.h:60: undefined reference to `ppdata'
> >    m68k-linux-ld: arch/m68k/coldfire/nettel.o:arch/m68k/include/asm/nettel.h:61: more undefined references to `ppdata' follow
> 
> This looks like a false positive, as this commit cannot cause these
> additional failures.  In fact the parent commit doesn't even build
> with the provided .config?

Sorry about this false report. The below analysis is very helpful, I will
follow up to fix the bot bisection logic to avoid the false positive
in future.

> 
> > vim +60 arch/m68k/include/asm/nettel.h
> >
> > ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  55
> > ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  56  static __inline__ void mcf_setppdata(unsigned int mask, unsigned int bits)
> > ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  57  {
> > ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  58   volatile unsigned short *pp;
> > 732c611e5bbb76 arch/m68k/include/asm/nettel.h sfking@fdwdc.com 2009-06-19  59   pp = (volatile unsigned short *) MCFSIM_PADAT;
> > ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16 @60   ppdata = (ppdata & ~mask) | bits;
> > ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  61   *pp = ppdata;
> > ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  62  }
> > ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  63  #endif
> > ^1da177e4c3f41 include/asm-m68knommu/nettel.h Linus Torvalds   2005-04-16  64
> 
> The provided .config has CLEOPATRA enabled:
> 
>     arch/m68k/Kconfig.machine:config CLEOPATRA
>     arch/m68k/Kconfig.machine:      bool "Feith CLEOPATRA board support"
>     arch/m68k/Kconfig.machine-      depends on (M5307 || M5407)
> 
> while ppdata is not provided by M5307 or M5407, but only by
> M5272 and M5307:
> 
>     arch/m68k/coldfire/m5272.c:unsigned short ppdata;
>     arch/m68k/coldfire/m5307.c:unsigned short ppdata;
> 
> There is a similar issue with NETtel:
> 
>     arch/m68k/Kconfig.machine:config NETtel
>     arch/m68k/Kconfig.machine:      bool "SecureEdge/NETtel board support"
>     arch/m68k/Kconfig.machine-      depends on (M5206e || M5272 || M5307)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
