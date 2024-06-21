Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8EC824AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718937166; cv=fail; b=VSozxbmGD0u+cO30djaXBhacjPSfqKhp6osWsOQKRiT1KkAt9uWBbx14xS1RYEtmGKAbaLc6y6mcmn968L1a5ExDU23QPnAs1u49tzltYD+WBySNWKwy1cp6TL+K2TiqIELQxjzaYyFN/Wp2Vv/U/PhfWPxsnc7oA4zB6l4C+PM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718937166; c=relaxed/simple;
	bh=nCYBfoqEzPfGxBnTYpaoRs2doYWLPl7bZN47WgKB0vM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cv4w5///iCTMXiWvh2WpnehRjD+Yv5X3jRatsB3TEgJ26j3DixbNYjFqII/7sqc/UbhvoghU4IkHDBge34IvR8nb5DNo5+lBl7dVzB2FNChpHD/ZwV8E5TvJak2bVeVTBsSll0igIn4ILA/mLG4xUykDKziv8Q5I9OB5r5buo2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcqIOjkp; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcqIOjkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718937164; x=1750473164;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nCYBfoqEzPfGxBnTYpaoRs2doYWLPl7bZN47WgKB0vM=;
  b=bcqIOjkp4PZ0Exxe6gkDbYycFVKqGo9ol5aG9HkXw4FqHqVNH0pzoie4
   R6fT+tCBlgGTH9TJPp7y/3f+QJbddQn8Eqend6kQ9ac3SEzXEEFNg4AE1
   0Y3snUc0tmLA2zSso/QBu5gIGA5X1vvabRSwNc58z6SHIXtNd2p5jXtdu
   sRGZ9LEQfJYM62qrSbiCx5q+Pwn/mJ1uRm+66lawIsGBKuDOKTYIWc213
   clmyV/YSNiqBLXS0std0rNKpp9A/LposPa+H3PsrPuaNO5Hk5bcaZrzqv
   9/S7P46TjHDy+P5oDvQx39nCn+4QTHj0gpRYWGdlp2+8PYCfL7YzWFkkZ
   A==;
X-CSE-ConnectionGUID: bHl+Xp2QS72QMwnuITvXgg==
X-CSE-MsgGUID: ZlX/LXVpR4WteqFSTAvjgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16098288"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="16098288"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 19:32:44 -0700
X-CSE-ConnectionGUID: MtnQE+CTQWqpYW50z/1HBg==
X-CSE-MsgGUID: win9MLQBRrKaFFGjjylODw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="73665676"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Jun 2024 19:32:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 19:32:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 19:32:43 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 19:32:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADsuS4Bktap7Zqyf5tiatmK9oD44gRcMa+GlyO6YXdyWFqbMyJX/HQUk4qFDtoUJRlmgJp3P7Yeo75jZfl+3oeWhVRoWfLUTXO6uvQek28LQ2mZ5jA49dPQQSP3qv4seshOXsN/sB09sHgj8XpQiXGbMqXZxakYUMGV5KTFeQl3sPsr+Euuj4dJnUYnB3gltCY+jnIBWVzxCYg1fXu8vuycx/ayGx6EXm1JinPv4GAxhQRja9P8EoxuNR1ULai8bfPiDcJLpR5B9X2dQb8ngjFWGLFMSdaEsmYY8E1jDe/nBJE5VxbVF0NuGNBplU6ZtmTqNFknKjw6IiSpEb2wRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ5Lkf4ebWXCXxCI4SJlUMyRbqB9px9GJEvLvu0j8IM=;
 b=jPfNUbHKThv3k+uDvb55pIN1HVIqcrvze6DDLHj0FpYXs/Eo7a6R7Lbobrl5sTIq1U8pkFMzzUVXdJz3pVwUJjlUK9C4ab8fVzFyeylEYakekmODQcotQAKAlm6qs3yjxUt7OOIxutchlOuoKZd53Cl2xWpXVeT6wHkk6dqB5J3oXdwuhYOj4DZcjDzDl8LHC+V+V0lgEZCkUhZiCAT5GAlQkw0+XSARCeS7wv21LE3gllkZx2spnT0xeGdbtu95xNfIpOMsr44c6Bn2kz7+c/zcx/+h+ViLFzRHMLhoDlsnKHwcGAoM501oBEZP/twCsxIUiYOIr3fMqYzXYAlo4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 SA1PR11MB8327.namprd11.prod.outlook.com (2603:10b6:806:378::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33; Fri, 21 Jun
 2024 02:32:41 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7698.019; Fri, 21 Jun 2024
 02:32:41 +0000
Date: Fri, 21 Jun 2024 10:32:33 +0800
From: Philip Li <philip.li@intel.com>
To: Kees Cook <kees@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [kees:dev/next-20240618/kmem_buckets-v5 1/6]
 include/linux/slab.h:662:78: error: subscripted value is neither array nor
 pointer nor vector
Message-ID: <ZnTmQUyY1uXCxTb5@rli9-mobl>
References: <202406201723.BsMQJXcF-lkp@intel.com>
 <202406201222.BC51BD41@keescook>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202406201222.BC51BD41@keescook>
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|SA1PR11MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 74bf6597-4740-4185-92a6-08dc919a6c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pZ23O2yPM0PFtZPt9Zxwwc5GhpD0PLK8qvWGU5G60/N+wyKDlJJ6hzPcqQov?=
 =?us-ascii?Q?ArH/2unFBe0+piB1XEvFw7sj641aJ6C4Gt85SChsjNBw10NSAUsmaNjG1U25?=
 =?us-ascii?Q?8c9SR039Jqhrl6sQtlVWRczzIZ7Iyde4U0NcYMHlE9tjuLVG7B4NLSge8syL?=
 =?us-ascii?Q?DLGoIAVytYulonJDdIT0Tj1TyTW8DGv0/M8BTgfXSnAaElO7A0nUHNGVWrg0?=
 =?us-ascii?Q?M+ezo44yX2kZM4nb27Gjs9UOcnBpQtSBkrGSt0wpG5fisrEvNpwSlI3hNyEM?=
 =?us-ascii?Q?1eW3/si7cqb0g5pzele3kuCtOTUwUql4VlnE+ox9uGn6XbUQqgzybLgKm5Ol?=
 =?us-ascii?Q?Zh3vbsf0KS+U/bCpyT3SpsSwVn0VZFnwPi888j5RrdNSxh0M4YGUjBl1IOJk?=
 =?us-ascii?Q?RyLu8J16I18WNCernD57ftKa+01ggxmGupzzHdqELA251+RYo3V1SJVR8Qq9?=
 =?us-ascii?Q?VTGS7df9AGGwTydmZV32nWhfQ/ZhKoJ6BDYqwbwi3lS0lBylkobmFZMy1qFn?=
 =?us-ascii?Q?BhIn830XCAW6rP5JWjZ05M+krObh/Cx50EpSiGtYFybPkwryZttpoWwT2jJO?=
 =?us-ascii?Q?dP1CeS+1KsStkIn1pA+fdQ1D8ukBfZkKYA8jawAxMQyOO/IUdUeM0lItCAPY?=
 =?us-ascii?Q?BXFUG4C0Fw1pJLs8AdA+3tJXaHJyrxPyLJIypYLkJ69N/DJ5AJDElrmWvaAt?=
 =?us-ascii?Q?HWIJzlfLmw4LdT9Z7fVBgxpToSzl1PPZCrGNGbZd3UGoy1okzQpbP63S7bfV?=
 =?us-ascii?Q?at9wdJqx45E7lU2z+/iBjfkBIkjy1CHj+/oEsvwN5uJVjtJOwm+0TW0mLxDG?=
 =?us-ascii?Q?tWMYra8MK8/GMslSqTwmZdL+T0ixmK5XFcczIPqV4XFhVOmXF0tluY8IaOdr?=
 =?us-ascii?Q?jxMMyyty/JupZqmb5x0kxbaqKiGHHa3VVCzjkHwiQZelC8UT/KTQkcafVPF3?=
 =?us-ascii?Q?hZSwPBbjP64M08fnR6s1QZamYQyMEcdLYbEeall59xYZhFK4sGZft+oa/hA7?=
 =?us-ascii?Q?aMWUstHehDO6itVO6ChJcd/piGY59qEBQ2NiCuErAZp41GYF/783BlXKLNW1?=
 =?us-ascii?Q?tzKZxp7KXFaRuBrwmj3NprFZilmJD8NUiWDLpBiBx9sS9nLiWL7nXpjh4hGM?=
 =?us-ascii?Q?TFVnL4uro7FBsyjHt4tTLU6P0zPXBfeB3uT8+lhYnAOYdlAynC2xxmiKU8G4?=
 =?us-ascii?Q?Q+oN2T02o1EP9a438fcfNXaNP+sGtoTHn0dFesmdnYB3ZBMx/rLrrm/98zwB?=
 =?us-ascii?Q?wFPwKYq1s5CDVX2BWIMl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kmoxCIvOHA3NZmD9QotM/MQYKk8/G73Ymi7ZEQBvIpAt3oyR2CVcjCstBgaN?=
 =?us-ascii?Q?DnoHv9wUkjSY2gUSrjHSHeo2Nxl78FdPWRbTvu0i/IDwEg5CRamBI7h2eOw8?=
 =?us-ascii?Q?4ICg3ZMja05xWtJt5DtMTe3HG4U6GFpAAMziZ3NtTYyxd7VmLFQp7ARXvYSJ?=
 =?us-ascii?Q?hK2KQj4Z3+ZC+T1k3oz1oTnVymJ2btBzMJx+N/vYqWTMGPLTn8Wnggfyp5yE?=
 =?us-ascii?Q?HehwaC9Zn6ujTQ2kQIjO8ltrLF7HcSGg2ZQIszom69WsUDNpG7PT2Ur4fXRj?=
 =?us-ascii?Q?Xe9kJicjg/VyDV5xBGS08g1VTCwNxBKUvK5mf03UKGtIHJtglExRqv25ZsJu?=
 =?us-ascii?Q?ttoaa2WfvVSkC+tZTN9+qMZnVIceRW53EVFwZDXtbNAnlAl1TbZlYY5Dud/J?=
 =?us-ascii?Q?DduOAE6wfvPlcTANJG/jfenbNEUNMKopxKQNaBnD+n/VveR4sn9SudJyoP1t?=
 =?us-ascii?Q?M5NA8Xbafn83UsIzHf/wqMk8tocMrbZfdG5mdKB5ZtU+iDznftpln7JP+XKs?=
 =?us-ascii?Q?6ndCWhh0IgNZ9fB6zyGA7EJ74x/Gn1dlrScTmOEuu7xeC7ZsenkxmMUOz46h?=
 =?us-ascii?Q?UaT5gkwar20RRAem63EPDKjgo5rMgCHDFS08Q+z5SvGjsBRHZBihc9vz3Svq?=
 =?us-ascii?Q?v5UW58Gla/8VjBS/9QerEWT68reQMW19V2GjvLbjkDMiCtGS2zT0jzTEbyMQ?=
 =?us-ascii?Q?ThSXGj+e0UdpRs7gvuEsTxDoa3nHROKjdHj3Zh2I83AKnNW4eFPewNopPhUi?=
 =?us-ascii?Q?XQZypPd/K/uHy+Ar5Me1RBG0jsDHTjdjywXevZPpSuzsxIy1BrC6TYkVIejj?=
 =?us-ascii?Q?SkXrrwM+AwORZoqegBzGZCU7xxV3TxhONgu8u9LpLRRfprt7YeRVXx+CD4pP?=
 =?us-ascii?Q?2Onv5hFQggd44g2//8Pl2ajt07DT9WmhOSO5kL/Nhp1TDDNr7fHAaPYu1lfi?=
 =?us-ascii?Q?XZR+ZbjFV5R1inj5YNqbXj8nseSd6uxAUormGOc4MRFUqrZ4NrvmYa7z5Ai7?=
 =?us-ascii?Q?0foXr1UorOfasS9cFoHEM8MUy1RdSoeAXA6HEFDDCKI+N3NkK9DRqLEu8aPB?=
 =?us-ascii?Q?i07nodpD3FVEUR+sxQK/iqH7USKDF359XZfYoXLvGRfN/Q3g0xGCbTyfaueX?=
 =?us-ascii?Q?xMS55SdMwGy47KYFDZLRXN3hXRHMpX1ZP1zP8VR2SWPkhsCNzlo3gMy8RDxb?=
 =?us-ascii?Q?YivXHLBTmNQBC0kzFmY00T9uk7ixr2pGfzGKCnossm1hSTpOsN5PxCWgsOqk?=
 =?us-ascii?Q?aojAHkZWUNhWgN3e3a2+uFRnwvHlKMDLkTcKflDB5XmzNnjdsj8mHNp2CDwV?=
 =?us-ascii?Q?RfYXhJRlexLNgHtAB87Pn1XV1mlaGzHarQgMrdfJG8XBZnx0H9Y5fWpDIeug?=
 =?us-ascii?Q?WKKfDjDDERvWZzYcaOcxNqT0GGdQF10spdrluv94KJDjHlha6CKb7azi9XPG?=
 =?us-ascii?Q?upsyu8jEVyiJJph1waXpMjgsLMIedvTFINPwBj/tnC1QHWm2QNGDFILqKc8R?=
 =?us-ascii?Q?p8G5u7N1jO+QcBJrGR13MmMY+1XSM74H99GFe68zJg2MZIFTOhxC8fMInhis?=
 =?us-ascii?Q?edrTiXuBsqXXBk+M6nI4rKpDyaxDkwefCmL6KuqZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bf6597-4740-4185-92a6-08dc919a6c70
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 02:32:41.2969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daUxSLOE/qSp0H0vtuJiEUk2/Mj9e2MpdQsl90Q4k8C0cYSxbq+HN7gJSGbTZZuVLCLJDk09I8l3jvF8dgmlGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8327
X-OriginatorOrg: intel.com

On Thu, Jun 20, 2024 at 12:23:30PM -0700, Kees Cook wrote:
> On Thu, Jun 20, 2024 at 05:21:23PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/next-20240618/kmem_buckets-v5
> > head:   c823e15736071e9b694fc62be0c80cbda6a4e344
> > commit: ac6eb1f5df288a356e73ab40d393a52cc2ec3ed1 [1/6] mm/slab: Introduce kmem_buckets typedef
> > config: m68k-alldefconfig (https://download.01.org/0day-ci/archive/20240620/202406201723.BsMQJXcF-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201723.BsMQJXcF-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406201723.BsMQJXcF-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    arch/m68k/include/asm/page.h:10:25: error: 'CONFIG_PAGE_SHIFT' undeclared here (not in a function); did you mean 'CONFIG_LOG_BUF_SHIFT'?
> >       10 | #define PAGE_SHIFT      CONFIG_PAGE_SHIFT
> >          |                         ^~~~~~~~~~~~~~~~~
> 
> This appears to be broken (-next?) build unrelated to the
> kmem_buckets-v5 tree (when I revert all the changes the build still
> fails).

Thanks Kees, you may also check below one which is introduced by this commit, but for other errors,
they exist in HEAD but was introduced by commits before this new series.

   include/linux/slab.h: In function 'kmalloc_noprof':
>> include/linux/slab.h:662:78: error: subscripted value is neither array nor pointer nor vector
     662 |                                 kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
         |                                             

> 
> -- 
> Kees Cook
> 
