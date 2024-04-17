Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B67566A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 02:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713322132; cv=fail; b=kIdNnRoaeRgSD41H/A2EVmsBLmyyLdpJTvfQjY+6e8UgZri3WxmmhWM2/BM8J4LfwdqSlRXSnxSpVfsjAJqSKLtj0p+ERZwIBtjKf6HHpR+jbMSKd6mlFm5WKv0T6qtXTnpjWsxy9JZFslxsg5jHutwBt/NLwCed4DwMzqZz4NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713322132; c=relaxed/simple;
	bh=+U9LliVer+i/Es8YgxmHEik6PTKNkQ7MYfq0fk1m6zQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mM1yFZWn/VQbzZxbSqep4tJdYAHc2nqlXH7qKtTpX6amoyXTMQTTRUpk77ymhzUXrTLapcaV1GmUaok95qaRdGz+XGP2sS/qpwLjqH0J0yu5tr7MB214rNKtPM/Nv1+eimvpEC58RtnFiOtaz0gOYh5jR5com9ZrSzpIE9xPHjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OafdEIKU; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OafdEIKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713322131; x=1744858131;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+U9LliVer+i/Es8YgxmHEik6PTKNkQ7MYfq0fk1m6zQ=;
  b=OafdEIKUJh2aKrcz0IMpxEfGjq6LmNVrC3lW7TMWFWjZvhcOYXWN3JZe
   LUHQWaDf0NUTWeFGY8GZybQjbHOdLSbqWuTmHNWwoaEF+lVoeImV+mbMZ
   mTiXNrgdb4E0Hl32MNKx2yDQKv7oJm3gIy0DTq0KOwwEWCaAp/rQKhU70
   gW9mrdCxRXKoGbnZHLCDpHZYFlmn53D3BX1i6X3sheEpM8aA6tSTj4JJe
   dbacMx0sIKn+A0z3FnpVwQ07cdo10B85r+FnyXy+Nrn1I7+tClxAz8XgY
   8PtM9LAtEwmNgWYo5NBuS1hghFTfZ5wnlretuOe8kDrgnUp3+dL615ZKZ
   A==;
X-CSE-ConnectionGUID: aTFIEwMKQ7KY2BeLaARjZg==
X-CSE-MsgGUID: gWj0ReSqS6qwp5P/f4+ibQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8966293"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8966293"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 19:48:50 -0700
X-CSE-ConnectionGUID: vZZbKkHyTWy9pEwUA+ZUeQ==
X-CSE-MsgGUID: S0TF++hNR+iSSJnXHWNf/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="53676250"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Apr 2024 19:48:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 19:48:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 19:48:49 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 19:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qny6pnlyq9cBYYUNhD+YPt1p3ffcdi5KpSrTZqsZEsp6FyuDn4yEO9ASZerebdvSMvQKiHPf+Zd33tdaGw12GaO8ofjI5IUOvQohSfWODubCykvQJpfmFfOHYrsKR32DBA2gtsV76w3XePKPovlzXquZ3HGP9XZKxf9VgPAhm+pBfUAW8SgUlOmUTvqgmqS7ke/jBBKYuTTfz3dbpyc5n2Jy+8k5EqZWJrYT4VwcQsn4T+1aC2Zq8kK2PsiZHWXT6SZmqsqlgnjUo/d5rz4/hkl3EI2I9xZrXzBgPAvP4f3fIFWhPSgOjNFoJ0xC+2vJfJCoIWJiZnGKKqOoJuUKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1CNeQZZ3LdChfDwVDM8s10jQLEj6keFiUXBbAtxL+0=;
 b=ebLYb+jN0PdupzNmShMbrirW58XOHpoGJjhe92LPcjiWxPZTPkuX/M+TJ52w/3Se8BRTS/MFZ6nsSgct99haFm1MSGhPuWFXjQCjzKFZ3/w0d8zzRjpBPUjFP9bM2Act/4El7QFUVv7t3pxilnW9iUAdD4asth/mEqzSdYp7mOvjLw31Iw1eRvjwHz9qQZOHwEMccowb6sRssr8/xw05jlqNrXt+522V7WO6Nya+PdFKb7bqyra+z5uevNFcBiK+3kkSVp0ywqa9cmxxbNwOAi68pAxniRur2XIjZ2hScDHLvv7mzG2Y0CG7awHGN1a1MrZmEy8cjrtUPBOArs8gxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SN7PR11MB6602.namprd11.prod.outlook.com (2603:10b6:806:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 02:48:41 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 02:48:41 +0000
Date: Wed, 17 Apr 2024 10:42:07 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Edward Liaw <edliaw@google.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5507/6266] ../kselftest_harness.h:1167:9:
 warning: ignoring return value of 'asprintf' declared with attribute
 'warn_unused_result'
Message-ID: <Zh82/+COncH0SO7l@yujie-X299>
References: <202404161023.K0EsnDmF-lkp@intel.com>
 <20240416114439.038054b9c33986a13f4757c7@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240416114439.038054b9c33986a13f4757c7@linux-foundation.org>
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|SN7PR11MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e9e468-aaea-46ce-9baf-08dc5e88e401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9z4B16BOZg/Dx+qfi0sAEpS052W5VDEFKvMYi9ij/7IEF+DNVkgXMLCcep+AOwIs06QKh4E88CVWbKQIGCdoZ/c+WWylvXUVsRx0b/qQ3l7RXisBz4c9pLgMA07GquYHkYBQ610s6icBt3aSLgK1H438EVYmeFSUxlN7FloIU91brg3P09XqoM/bfq2vv6iykdVGY72WTegtN7ewtZljWxacf/wnaGp2i+R8ZuWUqYVjerTXYtScPV8SyPAKpDz9g0Nz9PPCBDQGcds3HW1V3XNRLvD+hYfVrvN+Ndqp1ifXK0DKwPCo99PsH8zc1UMDCBRodwOt0tC8TTaUtBc/Ruq57cIKl7T+Ed4lSegT+xcywJTtA0bLM5wZWVecXOQDgCuSgnmwaIgg91OcXW7v5V1ipaBbOiyWIk4MjNr6BA3ZrJYxoB57/s+WQ7gK2BIrQG8MIMXK9nHqo9kJ9xL/1Dq5EQIcJr/frqwT0HK5FWb6e1Uw2l1/bhDE5SgcCXDIudUaPTFGEg16nv//Jkz7ISAFvt+6KtacjejO74potNVbMailVMK4yRDycUBxtyqpJUDEmNFRIJZktFtJuKZf0R7pIpMz6ZZFrDGCzJMYK158XnA2/d4fN6uBkZdgQTr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OZAaycV6suRcvsYPnImugc+4KIlpOcV33X4MYSia8Ir4UFdzknWj0/+nUb74?=
 =?us-ascii?Q?/1l77xa1oNgFsXPdHiZerZ/clKV69cm8EOXJ123mXvmA0nGipw2KM/tCaivP?=
 =?us-ascii?Q?Htamx/erYJbjQbXdPqTQ1eAJTj6Dj5mEaFsgdpTOPEnuR+hktqummOzrmOJi?=
 =?us-ascii?Q?gPLpn7+Ysc8Nn7jk168i094CtDsQ4tGJ+ZJbCzBjE8SqGuzU0cmnV+pVAPSV?=
 =?us-ascii?Q?XVGvWgCwlnrV4SEgk81Lps4a/AK5Qx4SBFFX4CO5RcFE+l5HWhELtd/r4udQ?=
 =?us-ascii?Q?wEWrPHNrldqXSUPJBruymJLFdUZQV1NA6IxgjpoT3Gs/KuP9RL4mW9ZPePfY?=
 =?us-ascii?Q?+28uYIOqalRbg/dFDdOFGNg2nPEnuOSMcMKBLPM6EQlRUVPYmD0vZYiXFCnf?=
 =?us-ascii?Q?9I7eVCVGcw3pylYdk/OyQQPnW0L6sz5ONZ9A4IR90UUuIb+fPsen60uOaHyW?=
 =?us-ascii?Q?vPBNjo6W4GlELhm4UM0qnLLIlzwPEnBK3IdM1HuxmsiWGPlGe2bDjFoV027T?=
 =?us-ascii?Q?uPmh2ZtI7+DHcbnnE1tqyf6sBnEmIhrJn16SrDAS/6VtCh54ven4h6M0TQRC?=
 =?us-ascii?Q?uEv4mu2OP7HRtHFYhk9/93Gt04e21WSBanDBs3fdZXOac5rsxMp8kaxtUtsR?=
 =?us-ascii?Q?DugB/8mBTAF7bzXvUSYnvT6F8k7GQY0gU5oIbGNl8cbThM/H3FC1BNw0K7Ud?=
 =?us-ascii?Q?QGqwuXIwsHrH9t/aADOjaXUmQ4Q6CsOAu7+FHM3OEkDgpzyzSd2nTY8CPllH?=
 =?us-ascii?Q?uYaN466D9y8ED2O3Crwrtzn9M0uhKaYgeb36uZstfQehGQR3+1gW50HYzpJW?=
 =?us-ascii?Q?hMfvKglXD+PH0OwRjsrA0Oi7I0N3CiSmUv9oXSJcKwyaG96RpE0CqqY8LoAB?=
 =?us-ascii?Q?oPWVG58kzQ0F2V3fFXP5NCNtpl/58QtLQHGBhfj9dIrLcbgSx7xLDx95aIhm?=
 =?us-ascii?Q?nZJfbEtzZKeKBWUzdyAOMqPuCdeqfgApmB+Xq0qjXOJ98dtf7NPAz5RfswKY?=
 =?us-ascii?Q?qost8MXuw3a+iBNrcCR3xOkveL3YrDE/ySO/jzl1z4j924EMsV8h2YrQd/zG?=
 =?us-ascii?Q?ugr9qzUPqZJQlz35BKuwXA5/RqFYRNtrInOKClCUX2hCwYX/SuJNE/h1016h?=
 =?us-ascii?Q?qzoCaha3nq20RPUIVnAElt/fty5K0raoDXwJwzldtnMO0DTi9XcsUtEHAyu7?=
 =?us-ascii?Q?KNuMfXRLw2+l/TlS9pIGjgPpq+waOCEL2692NcDGMANaxvz2Z4622EfScRQO?=
 =?us-ascii?Q?3xSWCpPQ1KLoIlf7x8jKJDNkqUXHTbsPpVD8DjlnVSgpT8cclQUfItsIEvRI?=
 =?us-ascii?Q?8Ng27DNx/SaEkxloMT4Ifz7BvPFUhAJbENo1F6gREFRo5fWF8ZvbRSCJ6a50?=
 =?us-ascii?Q?mYP0NMe+4vPgAM3uoENuLQSkbd12PfAn7fWjY43V7x8NN6EW3tuc1c/PXv1C?=
 =?us-ascii?Q?XxUFmJojjpQ3Mo54DjcvvInonpUo2j4pTJEIbSdfDj5zR8HoPOHPrdlkLWGR?=
 =?us-ascii?Q?bR63jyhOCNc/srC2KJrkedquc6NTsFh9IZ6aTH/uC5oBaotLBkDqkVsXbm4Y?=
 =?us-ascii?Q?DWS2TkxgazU9sR3gqlvm/oIhUv7QPBon/wBTTyTc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e9e468-aaea-46ce-9baf-08dc5e88e401
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 02:48:41.4513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aHPpbNIVCqR0szfZFVX6GLkAI/G9AQHd3SffLQzcgJ6CIgz2qmmkz0sBW21K3OBZkmCz+yrOOnw+ECyOm4rwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6602
X-OriginatorOrg: intel.com

On Tue, Apr 16, 2024 at 11:44:39AM -0700, Andrew Morton wrote:
> On Tue, 16 Apr 2024 14:35:18 +0800 kernel test robot <yujie.liu@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
> > commit: c19377e23d4cb45f69c5d226ae3436f7fa818c8f [5507/6266] selftests/harness: remove use of LINE_MAX
> > compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161023.K0EsnDmF-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <yujie.liu@intel.com>
> > | Closes: https://lore.kernel.org/r/202404161023.K0EsnDmF-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from tls.c:24:
> >    ../kselftest_harness.h: In function '__run_test':
> > >> ../kselftest_harness.h:1167:9: warning: ignoring return value of 'asprintf' declared with attribute 'warn_unused_result' [-Wunused-result]
> >     1167 |         asprintf(&test_name, "%s%s%s.%s", f->name,
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     1168 |                  variant->name[0] ? "." : "", variant->name, t->name);
> >          |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Thanks.  How does this look?
> 
> --- a/tools/testing/selftests/kselftest_harness.h~selftests-harness-remove-use-of-line_max-fix-fix
> +++ a/tools/testing/selftests/kselftest_harness.h
> @@ -1163,8 +1163,12 @@ void __run_test(struct __fixture_metadat
>  	t->trigger = 0;
>  	memset(t->results->reason, 0, sizeof(t->results->reason));
>  
> -	asprintf(&test_name, "%s%s%s.%s", f->name,
> -	         variant->name[0] ? "." : "", variant->name, t->name);
> +	if (asprintf(&test_name, "%s%s%s.%s", f->name,
> +		variant->name[0] ? "." : "", variant->name, t->name) == -1) {
> +		ksft_print_msg("ERROR ALLOCATING MEMORY\n");
> +		t->exit_code = KSFT_FAIL;
> +		_exit(t->exit_code);
> +	}
>  
>  	ksft_print_msg(" RUN           %s ...\n", test_name);
>  
> _

It fixes the warning for me. Thanks.

Tested-by: Yujie Liu <yujie.liu@intel.com>
