Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275561428F4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 03:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411064; cv=fail; b=ZRPDmU8OCsvs7Vw7KvtsHCwk293EDn+6q63YwEkr6uK6iZOIuEp7tQtyDXsXgDnoDKWfAeENeEBnyhgi3Q7FRGfUkuF0ZsU1myh9DzpYoRzK2H9+shpJnIYJLLilBW8ZbeUFouvS3V73ycL9aOPiHJblr35Mdm29W/1UcUNyWy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411064; c=relaxed/simple;
	bh=44hLeQclDP2EtdZojmFcFj1K2Ag4JLu/5Ij63hODukc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YuyDWQNe1tzQlM0Kmm7d9mlROhmabsLDZigYwbwZcup4vP53TOt5F9DgJiz7sHKDo4n/RN0Xffu0zW4BA7tK3WLSJ9UeXW7lGBZyWrphkGEQt4mun68bxIRBCq9cn7w7VuQfRLcZe+kl+kzOB7AwChb5qZmmfHxOvyVCiT7AJkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFHQN/9m; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFHQN/9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774411062; x=1805947062;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=44hLeQclDP2EtdZojmFcFj1K2Ag4JLu/5Ij63hODukc=;
  b=cFHQN/9mRdeDEgWob+Z+3N/IoRkVO1KJFBWwK8lpxGG4ofP5VerFyCDc
   nJ3chTEmHAC7UoZoSKOyPPazTImbhyqo30ZndjIjaLp8dN362VKXlWnzn
   TrJq0GsWKgJDoVTJ1mEFNxEgiSHv5Ot5mclIhkrHOyBnxMqxCd6ATRV/m
   Vut/ZyT/3ZfMVwFv6lqfgPcD/VIWE6Y7yIBPbytBSh3jvtq4noftDgz85
   Xb8ugGk+/E+3JL4MB+kxq43vNU/W9i9a4o8lgqoWDs0pAkAGId5r5v8YR
   x+MQGZrN4uG5RwPemBZjKDoDM9BYjjhnDJ2FETVqO7eHhw6aLOz3fJyzG
   Q==;
X-CSE-ConnectionGUID: /S4iT4jUR4+Bn5kxnx5Hqg==
X-CSE-MsgGUID: l0qUE01KSxqOaUKbfPrqgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75407553"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75407553"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 20:57:42 -0700
X-CSE-ConnectionGUID: iMMf1TEOTHyJ1+BIVn+TSg==
X-CSE-MsgGUID: cU3B3pgsQsqX8nLv4rFMsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221664479"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 20:57:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 20:57:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 20:57:40 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 20:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+jUj9cPThnz+divwbSYqAnzt5n5xQjGAagjKHgDO8AiCTVhjSEh16n+JQnUFYObv4K9ftfo1rvUSHT9nPAKGvvgo72RhrlvGrzpdvpWWGYxCKLLujhdt60uahq3ZHhoSxDQosorz3Y6DcYyDHALF1Rh5J7aD0nscerxJaPc6l1nuL8dzPM2NQMsI9Z6oF3mQ/SfdXFCIu8M0UOrCkISXtOhk3ReQKQqP0gSVgpD0ErxGqhR7o8T+p3NpmmNR4zILaaFAI+z87SJsgiP46FAKrsm88E6qYK+pXgbFPqck9jqS/woPhZdRTWVc+x1wpR6Ix/ghM2+KzOKWKzbKCVa5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZ8IKRPNkB92BwyT+3cXJI5kX5lZkA7T6u8w9dZXzoE=;
 b=Lgx/4gmeQ1TUx6IgLD3vDuoKNJ4VuIO4oVJhk8Rx6CbYx/pr/Z5z6dYVBKo8LVKkwSlU6dHrE0YJ3An1gcp7mgpVbAErSZuoivbEJe5dOjSeRkAwEigJRlNZV/Amvbvo9GI+QjzR1TRHkz3Fyje9BC5gnQqKfcbNJ2jX7lsYrjiMsmelT+ikcyzl8DUKNm0gUBPDrDmcKeGd4jBs7/8CujsVQY4GBg47jTv0Cx9eOngTdKr9sBxyuWAIQyCckXJbwCNrHzUjguerZucVARSg/5FNPwLhujmyu5frVWOZ8IaF4oQXI82gfQyiMQat8lHXZ/R1J5uek1N1JiilJKR09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by LV3PR11MB8481.namprd11.prod.outlook.com (2603:10b6:408:1b7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Wed, 25 Mar
 2026 03:57:36 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9745.007; Wed, 25 Mar 2026
 03:57:36 +0000
Date: Wed, 25 Mar 2026 11:57:27 +0800
From: Philip Li <philip.li@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: kernel test robot <lkp@intel.com>, Chengkaitao <chengkaitao@kylinos.cn>,
	<oe-kbuild-all@lists.linux.dev>, David Hildenbrand <david@kernel.org>, "Linux
 Memory Management List" <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-stable 72/140] arch/sparc/mm/init_64.c:2582:16:
 error: implicit declaration of function 'vmemmap_pgd_populate'; did you mean
 'vmemmap_populate'?
Message-ID: <acNdJ/q5tNB0nNjp@rli9-mobl>
References: <202603251147.CtgepAeH-lkp@intel.com>
 <20260324202754.6f29c4f6530ec7ea9d1f753d@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260324202754.6f29c4f6530ec7ea9d1f753d@linux-foundation.org>
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|LV3PR11MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da8f3e0-09fc-4964-52d7-08de8a22a6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: iCaOfd0YHNiXHoz7JDHJfW70tYOgjjwTeZfJA2LwjKtpuIwUWo4F/bIzyh6j+oA/qbYx2QMCqMd7XgkbWODWwKfR4PPp9WtE+C/khCMZ0dlU3Sctc/euxU/AAee0zURy6WDkdS3jM2blwpYe1aC7NucVjK4PUT7saNXZuLik1Y2r3+HbKPXxMQ1f9g2C6UojQzVnDMRWF6N5PrLU0o77Q0u0V3UJbGG3gA5xpyco7CzRl2B+Lpwr2talpAqKpwhYYyJNiV2RiUUg7GUovvgzYNCcitLoGkOyu71fcqYAu45D0CLsOqjWK2i2UWax1c5Pok2ogmnSQN676ON6Drv+mN0J8IJo3w1wKACcls+khRlQ3XYltv8x6j+EQl4JyNTbwkDZ8q6V8DZb7pBEK3FroiI3MHhT5SqDnoAm+V8TqNIXLL/A+B7yBm56VdyY4XOrNyB4FrDdvPMlyivtdugyeUt6KOWzgqBpyE4Wt2derE9Eu9967fro1nGBISrcYzzmGZuUmUXewqn3Zo+bUoy+tUyBooy4PTTIX0XR4HmXqy5c3SgxMonqA9HKejGeU98xAStMBl8fIxJk6Ikiv/8iu9nTiDcD2jxr9VJDlb+qGG73hGoLpwhKSu4zDnUewFAinNwZEOsg65uz0wuznnz7Bz3u8cuVzF7MUdFLz6RXKCY4hJIby8Z21stzMGwk835C/ssixNillh0qBjBDVklTw5JGO51ZQwR0MhckmbJSIPuxP+BazGKBB+EgyAh/jp4t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?flejxzlxK5W8MfwAqZvV171DfPKeXyUBraYUyRE1d5LfRkYnFro0hbXhdZ89?=
 =?us-ascii?Q?b/7OArY7OX9XRaHOAsJqexEZSMidQOcf8eeZ7irvmLv81QYVJxlMM6zfIHSV?=
 =?us-ascii?Q?maMRV1SmxeTgLw/BPQUbHViJSZfjLlVKRsLisspqv8bXorRq+kb0jKO3C362?=
 =?us-ascii?Q?/aRfjFskl1eOBJDD1GRR7s4Hlkk9VUeNLYMX9xDa/1NLDrj6rr3dxzrEokZ9?=
 =?us-ascii?Q?HlGlJmhcuvADU64F47hGNhqj8m6ye9RbANlj4MLDkco975uyio5oeCpVNfi9?=
 =?us-ascii?Q?Bq+W1biHuag0I6vTonCJ5OTkLYmD9ChOmO0md4vuAvOnM5ispqsEvHYHORK6?=
 =?us-ascii?Q?Flp9NdjmtbOXlEUX2wP1jr8+FPSz13CyoDWZ7bwTUL5hOauw/TLpBR/ElKR7?=
 =?us-ascii?Q?+GQV78uYpBeLZm5ifbyfqwiO+bwTG8Yi9QL6SRWaI2lZ+aHSkm2UMNGEw17k?=
 =?us-ascii?Q?OhOmsUkvXVc4UOPHZjoI+cdy8AbhFS6GYOXEqTswxmC9DZVJwaoNHq0ZrEhV?=
 =?us-ascii?Q?L4WsuagJtTDQeflBzi1LtygBWiyau6G/O4lIG0zFnT0amQPevdcW0Rvt1JoN?=
 =?us-ascii?Q?pPlDloYds7GnpdRVfw/mFSHzq1VDKhMVbcIc0qzK3VfzNE0xoXteTQOGjdTG?=
 =?us-ascii?Q?VihLcHxh2QV0f+PtDcV60Gt5NrX8qwMANuSOahCNBVe144geAivLDdB+QgMh?=
 =?us-ascii?Q?tTJVpEnu9quWnPg510/e7yMblehfjBLENhYl1atWS3IqVmvM0IEUZ5M+xdJy?=
 =?us-ascii?Q?qGCftsvlfypf5GKV1/HWA8Fj+2kVETUtNsmPTbwrOcgu9d2CHALb485vxgE5?=
 =?us-ascii?Q?VLOhyQhr/MyacFQVymADyumDOMWahvtOlLEoMEXdzfpvbSSRcMdOzbkZ5sNT?=
 =?us-ascii?Q?LK3N0eSH6Y0Lu+BobDsiIoe4hvFpVPvF614BD7fi7Ou+pULvVr5hG0QJgpxP?=
 =?us-ascii?Q?HbVeUj2VC5BULl4F/Y35WF3kydGie6B/ZnOjuzrDPev3K3eiBTHamZqMZ2fo?=
 =?us-ascii?Q?Ak2ZCvD2TrdCsz9+byGyPmtg0OzAIXtuOsGhz8sgCMd501OgLfAq3nB9VRHC?=
 =?us-ascii?Q?1BG6Yt4Q10UVtROaEtgWLahtnBCOXmuFPXGyq1Wj5T+bvuaz55kIrm2NOBAf?=
 =?us-ascii?Q?c58myeW5hNzw3E1rtQBFDRoqXI4VZ0OHZvKKd2RScPr0/Mpk9ANlYp/RLnb2?=
 =?us-ascii?Q?XbNdk7HOKmQlOSJZ4BBn7blQlTyIv9XsKXDMPAHVPBCJdr/0Qu3eYvEDqVGm?=
 =?us-ascii?Q?jPqewdbOj97oiTRzNWSeSsOomqbq6A5B9Ps2DrRARMvm4AcUQHugNJfc6BVB?=
 =?us-ascii?Q?tesuADS6ZxOUr9L5USz5gK7GDHRv8ddbQIIDHDdQp3aKCXO5YBEMmgNOKtBu?=
 =?us-ascii?Q?Rk9uYQPwTiifoxa3DOVec83RxU61vDvYH1RQgFbfnOJjGEdJIGIX0R+8aTYi?=
 =?us-ascii?Q?3l9G6E6IvM52+WBJKIDXHC31sMasn2frvYH47tqiMPsQLPqP1mW7Ru8Tl/DE?=
 =?us-ascii?Q?TYU78tsvt8ZA70Td6gIzKhx09cUgpntGkhxEWAPMLR3Jcb8vPl2NM8DWNOsJ?=
 =?us-ascii?Q?fNuszmeCc2fukMYlbAzSAFf5LSiayzFJt7wuP8XRzaM84bkrNjkwXJ4/FErm?=
 =?us-ascii?Q?9BM+2jay8NmZcLTmXjG5qLqhN5yKNs4UAz0k7J546t90OzkMj9/iCg+kApVl?=
 =?us-ascii?Q?Q9Y39tzACTkhjYPUEqrfrTpN5W8LlKKGaSaSDFjyhw7s7x8xf7XyCgtZknOX?=
 =?us-ascii?Q?PYLlZrJJYw=3D=3D?=
X-Exchange-RoutingPolicyChecked: XGGyZSAMC9+AKpso2nkt0+ALkPqaAGap9xdp1dbEhor8Uhms6ydi+BHYIDvWhCgp5Iv6OM0q43p7yLC5YYYXXtxuZlK1coPDhIV7eiNW8BRZVr2AhPl5ykShWlMM5qmk1qSDbpvXZp1Dbk4jArAFgxa1FvaAYw5vLcAusgT1S9HQboYfiU8QogTnG1Dw0MfHZ2x9bjh29hjYIW2824u8uyVQYKQgwWRnLYJcsz50GfXIvGXDF2Nl8+q4ISpnj0O4Mqy9N05hU9xXDyhjX9DIGSgP5QL/QLAWd+7jRxWUW8cFhQLO0br/6vWA9IRA6cSdJ/BV9K6kt42PqRWdL9SEHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da8f3e0-09fc-4964-52d7-08de8a22a6b2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:57:36.6259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNSi6+TDyu8eWsfGuRV019WAW71taQQmtZP36b1RZjCPz/1wcQE0wZwNgY+cILeRMYopncwSo3rR1m4GmsPC3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8481
X-OriginatorOrg: intel.com

On Tue, Mar 24, 2026 at 08:27:54PM -0700, Andrew Morton wrote:
> On Wed, 25 Mar 2026 11:10:49 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
> > head:   e393ce79b3cf63c2810be882eb6e531a54f520f4
> > commit: e504282091c8e4dc4f945c89d9b44ac2e0bfe504 [72/140] mm: convert vmemmap_p?d_populate() to static functions
> > config: sparc-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251147.CtgepAeH-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251147.CtgepAeH-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603251147.CtgepAeH-lkp@intel.com/
> > 
> > All error/warnings (new ones prefixed by >>):
> > 
> >    arch/sparc/mm/init_64.c: In function 'sun4v_linear_pte_xor_finalize':
> >    arch/sparc/mm/init_64.c:2202:16: warning: variable 'pagecv_flag' set but not used [-Wunused-but-set-variable]
> >      unsigned long pagecv_flag;
> >                    ^~~~~~~~~~~
> >    arch/sparc/mm/init_64.c: In function 'vmemmap_populate':
> > >> arch/sparc/mm/init_64.c:2582:16: error: implicit declaration of function 'vmemmap_pgd_populate'; did you mean 'vmemmap_populate'? [-Werror=implicit-function-declaration]
> >       pgd_t *pgd = vmemmap_pgd_populate(vstart, node);
> >                    ^~~~~~~~~~~~~~~~~~~~
> 
> Oh fecal matter.  Seven weeks in mm.git and then seven milliseconds
> after I move it into mm-stable, we get this.
> 
> The coincidence is too great.  I assume Kernel Test Robot is somehow
> treating the mm-stable differently from other branches?  Can we please
> not do that?

Sorry for this "coincidence", the bot does treat all branches equally and
there's no special handling of mm-stable. One possibility is the randconfig
is just generated on 20260325 "sparc-randconfig-001-20260325", which is able
to expose this issue for sparc arch.

> 
> Thanks, I dropped the patch.  Chengkaitao, please redo and resend after
> 7.1-rc1.
> 
> 
