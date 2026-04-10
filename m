Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67438278161
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 05:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775798749; cv=fail; b=DP+8w1NgCK3wJwTDxkmiWn75HOu63eonUovbyXXwHVB096u4SEpFAhotMd2k+urmgz5Rpn7MuwFcPbn5skAVFaX8+6VaTp7ViyxY+oHQGyIaOu0ak1Qv6jBI5MWgKXmO2XMbwynikY8mL1pLBzAsukPtxjIG3IE0z/+8FBIBtdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775798749; c=relaxed/simple;
	bh=v/RU98n2KVJNR6Nk7u9ZvnQwlX5uvJ1yVPMg7pLyoZc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JMA4JrRyU/0pzg4GaAKpW7/W3T+DSnpD38BeaB2AOFV31sjpKI16UJtitlQhtX6lgR/G9+K41jgBAZ3lBYsuqd6oW53EXgiY1QhZKLoCjZQG4lIFHacaC7bAK8OikyAb++0i7IQlkUUipMr96P9dcNl2dzP0rK3v5Ct0en2D0+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YK55nRyP; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YK55nRyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775798747; x=1807334747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v/RU98n2KVJNR6Nk7u9ZvnQwlX5uvJ1yVPMg7pLyoZc=;
  b=YK55nRyPSlSXFjG0KKO4lTd+G4YETWNkcKHio75PzJZPgYZqROT2HXvF
   ONP1DzW7V6Xxp2GTF+N4GCPqRVV8mEVkdHOiLkNPGuNS6/ksBQz7hEFnE
   FWrn7HB7xyjC8JPi+xqTNallRup01y3L/KhDWMOJJN853YUxo9b+TWy5c
   aE/2l0dtYdsuPP5LS6mJXOZeB8niVI7vrRLdloD18bWSSBo5DUB0s/EY9
   g061Axiz6gHLLADp5SVMQbrB/Zq8J1L/9eZySZJxjZTvakHGCujtAHhy0
   9FDq26jDB2tmQzJXPBlp9c6la/VhigIsfVyNNpF25bSghjt8F7WKCQJRM
   A==;
X-CSE-ConnectionGUID: i2MqoAdaQKqaSlrdDn5Y6w==
X-CSE-MsgGUID: W2HSiVZzTl25j7C1AkWvhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76529538"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76529538"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:25:47 -0700
X-CSE-ConnectionGUID: YfIKoGJRS2i/szEfqw/YPw==
X-CSE-MsgGUID: e7+SeVFKSYKzpj5p90RgBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233998700"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:25:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 22:25:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 22:25:46 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 22:25:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAlErckmlHDNJXbqdpb3AthATwvCJ60g0S/AKANH8fjJODpcQxCrArRZpA0i7UPqPjRaRCBhWUsY3LOExmdjPKQxKDF2NZn+oouNWo4ixV0G1GDtYi4aieka2XpQPjcc6PpkPkDEKYab5dfY+CvsSQ2Qm8IQiMqgIOgYrYOzqzZY1eZW3u1i4zrcGSeYB7eqA58zYXg8sMl2R3zsDbX0QBB3m9x0SJRCsO44SsPUklNgwFU2ZjvHbCj+BeBQWW4kliPo53UtQS5jXmfxFXxGDMSGJdAgMfguXpBQFJ8xiDxGKNqBI9kdELKI/XlD/eemxKrKBCATaKFt0I34+AtXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB+C/LktH2LGtSdpHex/TSyhnPkiNBWWxJlb2veq1Zc=;
 b=Z8rmE+1dfk1XigF7VA+F8wMteZo5SzoyKAsANmjwF1HEGkzOBhtJv85oeux1UIrnexyAS2F8amskLId2rlqosWTKtPSM2QPW7IAVM3fSjJPTE6ySH/zFTvahA9UYm8e3nBqL9COJHKikotxY+90e2WLdxEctSLa8uYoNt5XNReyJ8BOLgSlZ5SAgQg9+4uxahKHPU85itYjdLXTc1KlIhGXTJUWWucn6m4Pwe+1Sna97PRxWovEZEhdHQhBrKADrP+2AuUK8OfyIZTfTJU1AWLFaMGHWqcXB4+evWzI/XaO13iveWa9CUyBIqxyII5l8NTeZ4xO1/pARdSrR2zSVug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by PH0PR11MB7472.namprd11.prod.outlook.com (2603:10b6:510:28c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 10 Apr
 2026 05:25:43 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Fri, 10 Apr 2026
 05:25:43 +0000
Date: Fri, 10 Apr 2026 13:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jpoimboe:klp-build-arm64 36/39] klp-diff.c:721:66: error: use of
 undeclared identifier 'prefix'
Message-ID: <adiJz6yMmrWShcQV@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|PH0PR11MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f55505-cc20-4ffb-6f37-08de96c19c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: z84l56i9B1b7b8zj4GmWaV2JsInnvqhSg7XwB0x92dvHNTZn2kXhizzGzBieZkQYfa18OXQ95LVpuQkxvp5CDIR3f/QtoH/Z2NnpRLd1hve8kJBwr1Q2/dxoorUj/beICrRWtMTUhfaugZycYoY9lsyKdxi+vIII6F6fUgIHbYFvFUFUT418GMdM5qJZj8fVGWz5Hu0KtDAvYPG1J7rk6oEu4fmUG0BbO5XWj0jOAct7cCC5VXx/QZmjFwL2Cuq4go4J2njoQ+GF1pDOJd1TB3hWHqCE1kmGIn+Fqvo2Cw+Ye4/ZE5R6YrOal/mmwoHULDr/IkGOXVGgYtmUnEFLVVkgbkKiwtFglc1SmkZWbgOM7ZYK/wE8wRkP+z9w5EeouPl1t+l2+6FX5fk6BAouZilVvV5oN1B5MsPr0WkuNSGA61cIYcE8X1mogIHZMV+DD3VYdfmkMnEx0w5/TspKF7CZYR6QSC5wjixm36wU7MWi3TNDW+vvNsezSfBNzjxjOAxezPAHmGq+2mW5nlvRwhQg1HppGCMRBrhIpeS8ZUdnI+fm5zIlA8nh8cwPr1U/KdOsrtJ0AwoM9qwDqDPrOzpvJelMdLLkeyDfHsJw1iyNoLPrimdZlY97i803vL+MeJY4guA/YYU4EBONsqV08+R+GAN147JVvVJ4hskfTCpOQaqX7RX5GZTgvfMCRU10ZBpamzNX6Z35FRG/fLwEMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Ll2ciBLB6ijhGtOen/4Ta+7iQonSu/0x2nKnhWl8GZPmADr9flhTbIk5cuE?=
 =?us-ascii?Q?RrIbAmfophpIQeoNJmIpscSX44cDKfD+926mfO437KXnx5+Ceu8OEpL9zRmE?=
 =?us-ascii?Q?Jpv9Jtgbwa/VZ7W5YRCYkj5v4igylJwQBb2/QDJobu6CkRE72Ftz81d4x/ae?=
 =?us-ascii?Q?CVdurUbx8XrLxajZukzWuG/Cje0iO4uvgE2zu5oiPmbkEensSz8buuNw6zYT?=
 =?us-ascii?Q?b00PC7bOISpZlLmHl81Lq0UkGNPJsu+K5bmOD+mdApbuekD0mv/eLy1XE4GV?=
 =?us-ascii?Q?l4VxBBbl9oeGJ/VnpT/NlSzIvS4KE+VEdLKo5KZVzqL3Cgc7SUhpbcHJbjaf?=
 =?us-ascii?Q?0ddiXsgowr8Ob9zV4eLbxlA5meOBjOIBE2lZTPVYx8DsPE9WAB7EXH6aJG2B?=
 =?us-ascii?Q?kRZ4dRc31ulpIFF67KdsNgthafiebEk2e7DvheC7FARlFPI0wQELR65bhE8d?=
 =?us-ascii?Q?dADYz0pcGNNwhykNshX88UJC0UPKVvz4zxRDk/3MrNGqwNZUYT3ncqIQGTnT?=
 =?us-ascii?Q?35EJ0nPqXbZMCwbnZ/WR6U4uKX0nZldLbyaPA8va5W4jD+V/c/x99LA0UuSH?=
 =?us-ascii?Q?qnwB9vziWTBBhjbhXfQA3V+Dihl9G2SnNj8QCmRNzDS0vFcrz2bKCGhVwJ67?=
 =?us-ascii?Q?+apRlI0BWicuX8N2sQTJCBCnsv0NXtWkaqVYW5hgCVWYzESEgJ7EprAT48RZ?=
 =?us-ascii?Q?ptHQitwWMMtmb8pNOvgbr/2tZGgtFYUhlEYaDEF1qGk0bK+N2b+0/tzXe0qK?=
 =?us-ascii?Q?J1fFnOhV2SUnrupghHhFUq5HMsQENkuykeGkxOILuDi5b5MKC+8ogAC3OLnl?=
 =?us-ascii?Q?LFTjwflo+plSeofHRuKLEwx5ihlAf+aM4Y6C4eTlRswKxh/0fELdSm+6CzPu?=
 =?us-ascii?Q?PPAr1sa9AolaAmFp7ZuaMNHsHzPHImPbX1OOZIdlk08B3/atiYzRv6hnq4SF?=
 =?us-ascii?Q?3vc84yu7b3Y11gpEiLi7MFcZvFC+JQ4sAsuZRoNPIetxMc083r2+n8Vn+rIo?=
 =?us-ascii?Q?J5+bJGsj0Cu4rgG0b+mKexhv/2BOy+yDbLzaQe/xO/2fR40QUSfIFN2Znequ?=
 =?us-ascii?Q?jMkqNtM5w4cYN3XG3XiDxc2zaokYOAVST/k7KyPrmr/Qtz0SQk71/8PhTP0m?=
 =?us-ascii?Q?i37NowgFc98iU5DGLjALOnof5NG+JDcv9h5MadA1okhRdpskn0AcaNZ5hSUp?=
 =?us-ascii?Q?lk+hZrpP087nBRwyIlIHhBnqYa9gLR4PVBxKpn2Q51zq6qd219hy+a5+y2vt?=
 =?us-ascii?Q?PbRTChcEiB9ZBf7BbBKjrd2vvpGX6TnyvVPNFctAKjRs6fsD/FQ7ahVMIy8i?=
 =?us-ascii?Q?bbXzXHgtuHw1MhT7oYiW14xZykPDwB1BPACcb9FD/tgR/nMxERkFyOt8jh6/?=
 =?us-ascii?Q?yYN63DYtagfYCsIwOr2CfM0YmaJmrVqJwA/qyCr/wrKYOfkRKWwWfYmDyw/R?=
 =?us-ascii?Q?8kh8qVhghmiSzi20+upwkBmoCT3JZ8VKcBpV5Wm4uotmK2YEaORcdTy0bgv5?=
 =?us-ascii?Q?l4dWf1xnGadT/Ca1No192Pb1VCuFbxkoD9ZwYEwjPODw0xGOqYWts46cDqKe?=
 =?us-ascii?Q?J0M21PxidYFC6T2f72AMBbC7DQKd8uUGvAHXChZ2KfQ0LVVlKwuAvot528go?=
 =?us-ascii?Q?oa8EnOIAz3zh1kgrQJefUMmcdIY4L6kPxYK13m8DCAeKuzjrvIm6ZVXLbnnv?=
 =?us-ascii?Q?omKCKsWER7yrKcgGqHzttDELhpIDLOnd67/eSFoAkcUMyPuPGyZboNuNnAv7?=
 =?us-ascii?Q?NFtmT+WtCQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: YnG0DrUOPsL74/QR80B4c8m9mZc2yh+JoXHXqWWc4xUAO4YkgbbumNS84WmsdJDqantYCg38ZCkTc6++2ZBvAChF1DPbkBrGzLeqmjgCUZ1V8Ivcchn7WomXjgv0i8sc6Nmsqgo1Jc0GitO93eZH0JEg2voXBHIz5bDztinm0AxDpRgMHX+bCZvrnvoampHDCruByAt/W6FTNiW0ODjq0dHTguoUq6H6+rmIQD0YfGbYYNb11r2cSIeltJTJRu4SZQZdQnbL/+nJp2GaXxviWTzTlmMXkwbDUbIYhxshz92MxLAr8lDHAw0imVwVanBXdVafFxucqsj9lJVvcyIvXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f55505-cc20-4ffb-6f37-08de96c19c32
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 05:25:42.9102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bM90GR2AqGHAD5LETJPsXsXOHGNylVk4pIBpmoDIs+CHcpkJTzr33+HAypJWKQp+NnPpmfB32JoQAYXX2g0/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7472
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-arm64
head:   74681679b950d923bcf7d8f0ed35c447c447ec61
commit: e8ec3435bfebdc5dbed148c4f946969632005897 [36/39] objtool/klp: Add support for __patchable_function_entries
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260410/202604100518.H7rpJ4d1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604100518.H7rpJ4d1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604100518.H7rpJ4d1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> klp-diff.c:721:66: error: use of undeclared identifier 'prefix'
     721 |                                 data = patched_sym->sec->data->d_buf + patched_sym->offset - prefix.size;
         |                                                                                              ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

