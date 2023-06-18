Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C5BA21
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 06:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687070164; x=1718606164;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=G06TDS64qOKhEjP7XvLiwietnTFnH4GigzjmJXBdoQg=;
  b=bgfwopXeHcg0Lo4CxfFglZdIR2b0d1GTy/L4mE+rtADXMu0OZmz5iHYg
   h6s45QFVxI/EdNhK/v0ek2Fn8XhegZoByRMPeqdqJJm5gyfbK8od+ebLM
   IC5xG9D5U4zCOafH/OG0QpNQYTzwFFu5W378Z2AA1EgS8lX9HmscQLJ+x
   UQVl2sTxfdRQSzlSLEzwi89y+XWWKL/OpwBINmQGFkgBQucPH5QSNAIvV
   0JQxwmR2VMaoJjaLiwpUwe9mqp8TEzumZeKsIKWg7AS+AZ54CL/RdGZWk
   F6s5YJJx8M6shBfgB1NiKqk2KZM6A4MhmWRxC2kMUUtc1YRExqKTOrLQG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="388375332"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="388375332"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 23:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="1043534832"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="1043534832"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga005.fm.intel.com with ESMTP; 17 Jun 2023 23:36:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 17 Jun 2023 23:36:03 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 17 Jun 2023 23:36:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 17 Jun 2023 23:36:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 17 Jun 2023 23:36:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZqM2DLvzUSmB2ebkokGG3u2dbS5TlMJCS4TaTj470bNSP9sGo1CG500sNp23EWS/ftB0Q8zs5v7JxmSvWALTpsmjVo3uNN+ys/5R/lBCCfMrWtpyRlFj00dXZfKllXulGU7l2rijWK5u+Glxf0sU2bqoOP9XIdODkGKF6zPyd5bRc5YOWCcHOIy5/SQoxTrKPQkNBsGcV6cvUGJ4qfEGlxjKKf45MwJa3ARQNXuiopqAinMl0oe0ROjFitgeUu4ZLnQ7Nb7nInkAJ9zhDDGCt411Bt1IVN6BhNmW9tiR0wHQb7PQU4X1JiPufNQixxDaOBZkaWTCUooR/tAdtFvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4e8BhPNI5wnlBaGY+FFQqafHtJcurHYSL/MsAvHdM4s=;
 b=UWTTeC6XVS1g7zc+MYDmm2gTlGPTiNCSegwnWUAIiJmvvM7rimEFog1513MU7aWRFoFbEtnPZ9LY064eQP8WzjFvSTnvFI+VvPXjP75Nh7E+9nbh+7FX1XBVs1LpsKu9iVZNe3DlzsS64wYaRau+MyPMlMfjMFT6Z4JTspxqBD/XDQLVp4UOuqjSuDBS/rjRCyDs6xFhTHQ6Ik2y0lgtrUnAqkhLW7p5E++hWGaU/IkAsTIZ4mx7w8caGmiQCQjqeLnUCO7fPcxZndAiGyQrrXuErMVwwRHWFq0zFxhtFhhqdAm+ALCe6mWHaaUPlHGuaBmCZeYMG5WnjpfhhdaTNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by SA2PR11MB4922.namprd11.prod.outlook.com (2603:10b6:806:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Sun, 18 Jun
 2023 06:36:00 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d549:ec18:45ca:2786]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d549:ec18:45ca:2786%5]) with mapi id 15.20.6500.031; Sun, 18 Jun 2023
 06:36:00 +0000
Date: Sun, 18 Jun 2023 14:35:50 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Hector Martin <marcan@marcan.st>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [asahilinux:bits/210-gpu 227/227] /bin/sh: 1: rustc: not found
Message-ID: <ZI6lxlcTOFkPf0eN@rli9-mobl>
References: <202306172349.xtgwHQvW-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202306172349.xtgwHQvW-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|SA2PR11MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: f35b9d18-daf5-4a83-fefa-08db6fc64801
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nsjd4TgEbuBljAci8W+emupIN96fRkEOmzZwH6qtWN04Qzps6OUzQfxtPRn66pFkNEveUAScYfsWNjJMmfBe57i7kDEREAe5/JXGqDOxo7L17/h4Htx6JxOksht+rS3cD7pJivAK0aVM2oqHFlRO+kbMS0uOjrRfz4owv/+xref9gSuC3idcbuKhUroLp0RhGSxIA1wTYLcyqRY/bx4DFC8YJ+cH6ULKVVwx7XnQsuwvk1fN4Yck5QLZfdha8qT/MkECpEiJ6OUiifX3uc4a95qyH5TUcPZ+HE5Xm3ftuoaqw3OQgCrPvH8tvp9fs+LnuotHGMJ/pPfSSrZpBWwN9BF7iofUCs8kTTqAoQWeoQO7kf+ElJkE2mmC1Ob4BxIlmjFu2mH4KzXUUcTGrdpxm1iqPgyLYagKI+v1AcpbGxxRoCFrZAgUNuqcEF2Im70Fmr1Tk92+cu96m9UIlLYHqytg4JTqbuhamYGoXGsAKXS0dtPJ9Pxq0shJgEbZbG45zu5/V5Jl7o7u5uairPauzLo8EAVzNHI99LFoeBJWoJ1BfjDttluYmSa8iueL4coZvA+ISydDbIIzjx1+ZXmN8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199021)(9686003)(6512007)(6506007)(26005)(186003)(966005)(6486002)(6666004)(478600001)(83380400001)(82960400001)(6636002)(4326008)(66946007)(66556008)(66476007)(6862004)(8676002)(8936002)(5660300002)(44832011)(33716001)(2906002)(316002)(38100700002)(41300700001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?itUdKOPxpYxzPQMIzkgroWo2eCUeRZ/H5U2WvCZa8h5V9adDf/fI8qiakoMv?=
 =?us-ascii?Q?i58tcvbYFjyTLIfUcbz4YqtGL8/5OtdFy5InVHEqG1iAL1DGK6fRewWUhe8r?=
 =?us-ascii?Q?zPvHXJfIU1gWehzhimJzHtXKhRAeQV+zciaiVpe4GPuB/bKwfBokedKo38OQ?=
 =?us-ascii?Q?ARED5KjNVbw4xTKmyoPs9EwkKjyJD1Gc9+i0S2iTlUQV6NQgpGGR3kEBcbuE?=
 =?us-ascii?Q?jAzqvuisa2XPYL9x/TaV974yEHFFweWblGJpO2Hok+0xQ0//a2gxrtAGkzBy?=
 =?us-ascii?Q?/1f+5I4Tr/JjzhGj0/8bcydM18OvTFU1K94FxhaZLOQR5TPiptXOFP9eemeA?=
 =?us-ascii?Q?mluXPhUj0jHQ0uPZvmtRI18oX98guE1fzf2u4X3VfCiP/Y40Bm+5GO63DZjs?=
 =?us-ascii?Q?TCSUoHMeAyPcms47Qf1WrhZnHFcr4rIFr3bboaEge+RUZdwWOAGKYblgAXvW?=
 =?us-ascii?Q?uQ9kIQGm7WdC7/u4xr3Vu03vrd69kI6Tj8V7CtHSoPP5rws389O/Qd/EonOa?=
 =?us-ascii?Q?wLuF5XswaqTeE8h28xeXcV+9ktSx8GZY3ovvRFOF2x0uiZTUkWAhFI5MY3ac?=
 =?us-ascii?Q?AWls6gQFOvyt757SH4nUr9afXkjO92bVh8tflj2Anu4WRW9Orf78T9i6hy9l?=
 =?us-ascii?Q?kMWMvnEjq7/nbZrkAmU2ATDgW2bt1OwbrDXkcwbEpXxsr2WsBDFygJDfrVTm?=
 =?us-ascii?Q?sN/dFzVKG0Wed8Ia1azhhAapTk8xORnbWU8fPZ0wuPoQOMp367CBQ9nwITr/?=
 =?us-ascii?Q?7MRj3HrC9SwmALMpYEGiPfjV4bj08RSf6QUpNbe1JS9eBehHPuGO/89t9LkW?=
 =?us-ascii?Q?sTXBGPYIhXCiMSjBM7KULWPRCYEqB1Z9kZvSgZ1EK5Vb//WZt0nTe9nOHTkV?=
 =?us-ascii?Q?LEIcZsyVXLbHn1UYzUhXFDUpGhAfPvBSY41YkfHzHlLyqOugN7q+OZSv/q29?=
 =?us-ascii?Q?/LkhjKuQmxtrN3wfUymYTzRDQQB1XO9hcZTtjsmYzGbteM9FaXdE2gBLsDHj?=
 =?us-ascii?Q?PQ8/0qrtEJPk968glKWQZeSu1UvJUzljLc3BNzdHN+k+orKSV16Ez8S0ZTv4?=
 =?us-ascii?Q?rtkNjLZDqllFn9NAAz7SVkmOLePgGpLgxdHuEV65oJcW8Rrzmgo3tYO68T2e?=
 =?us-ascii?Q?4eEnKf20NQfVX93eIaKpfC5TAYXNz3QV9h8RM70t01OpUm8CLTfcjOyP0tlU?=
 =?us-ascii?Q?WtkfOwMLaDoyhhkhdgfRWqMWhR0Xy409alHtOaVZHtuNadxmLIIBY5y28/5K?=
 =?us-ascii?Q?eAkwQO6hy/taNJDc4Rwzw4Jsg5/L/lDZiUgy0tkKaGbEUPCfS8SPQYX2SehM?=
 =?us-ascii?Q?7AkNApdhhrBLLPQgQyzSjpLgUSJ/iIqCxgiPGdC0AcJvCZVbPn2p/cUIf+b6?=
 =?us-ascii?Q?ELJrafoO9npduLd5HDkITw6nCNHED3p0qnuH1d9wZpH78bnFi4oUfY5v18nY?=
 =?us-ascii?Q?ezOx2hrkt9HPdHoSA37w2Ve70JkG35WqbPRV8cthI1aQOZQGKM21o6w/5mbh?=
 =?us-ascii?Q?zeka4Q+Y1YaWBdx+2Wj0XTx/mHzH6a1+Q7h4ez331HFVczY92lzZ2vTefL+Q?=
 =?us-ascii?Q?TuO5DIqNaTfe9CvNcoy7xERLSMakzWdnoOnF5u+g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f35b9d18-daf5-4a83-fefa-08db6fc64801
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2023 06:36:00.7052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyEsqV2ALxwNZdWtsqhYCEYZmQxzyFxYLvKVRIzJJI0K/eLfVqbtiH/SdfJTQ5GNBj8C8fc/RYsJnvzfhslosg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4922
X-OriginatorOrg: intel.com

On Sat, Jun 17, 2023 at 11:54:27PM +0800, kernel test robot wrote:
> tree:   https://github.com/AsahiLinux/linux bits/210-gpu
> head:   496a1b061691f01602aa63d2a8027cf3020d4bb8
> commit: 496a1b061691f01602aa63d2a8027cf3020d4bb8 [227/227] rust: 1.70 compat hack
> config: loongarch-randconfig-r035-20230617 (https://download.01.org/0day-ci/archive/20230617/202306172349.xtgwHQvW-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230617/202306172349.xtgwHQvW-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306172349.xtgwHQvW-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> /bin/sh: 1: rustc: not found

Kindly ignore this report, it's an issue in bot side. Sorry for the false positive.

We will resolve this in earliest time.


>    expr: syntax error: unexpected argument '1.69.0'
> >> /bin/sh: 1: rustc: not found
>    expr: syntax error: unexpected argument '1.69.0'
> --
>    loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
> >> /bin/sh: 1: rustc: not found
>    expr: syntax error: unexpected argument '1.69.0'
> >> /bin/sh: 1: rustc: not found
>    expr: syntax error: unexpected argument '1.69.0'
> >> /bin/sh: 1: rustc: not found
>    expr: syntax error: unexpected argument '1.69.0'
> >> /bin/sh: 1: rustc: not found
>    expr: syntax error: unexpected argument '1.69.0'
>    scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
>    scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
>    scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
> >> /bin/sh: 1: rustc: not found
>    expr: syntax error: unexpected argument '1.69.0'
>    loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
>    loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
>    loongarch64-linux-gcc: error: unrecognized command-line option '-mdirect-extern-access'
>    make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1 shuffle=1532226975
>    loongarch64-linux-gcc: error: unrecognized command-line option '-mdirect-extern-access'
>    make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1532226975
>    make[2]: Target 'scripts/mod/' not remade because of errors.
>    make[1]: *** [Makefile:1285: prepare0] Error 2 shuffle=1532226975
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:226: __sub-make] Error 2 shuffle=1532226975
>    make: Target 'prepare' not remade because of errors.
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
