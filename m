Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D85126FA5B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 04:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774586148; cv=fail; b=el2lrOGwZIqMM2TIq63YqEwSiO2/89ayl39EUw60ZiGsVmL0TPqMAC1Nq2zIcKRST7cSrRCCWUY/DGW30Gx3FiPG79vOx225lhHKfzPqNEoGWQMFQ/ATsfaxVIqaMnnTPrTgaJ+YLtk+L8DFW/CBa+9Y9k33zcohWhiQspaFdvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774586148; c=relaxed/simple;
	bh=xLGW01aeidfoxj9DMf/4k886VuAodUN6Lr9oxXg3pvM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uS+a9/ByA2XYRuSO7nczQkEk9EuOctS21kxumQLBvXioG4uf1muMIW49KdN2TBpTAqipzXFXXOC1Ype1j0zlDdqa0wWDWMoVlPY78dEcv3Z8Nc9P6y0EN1TeyzHjgO3NhoC0SU9BVp4Hs+E2swxiB1+HNvpA3q/dCnoWTmkGCxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvCMx0Ke; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvCMx0Ke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774586147; x=1806122147;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xLGW01aeidfoxj9DMf/4k886VuAodUN6Lr9oxXg3pvM=;
  b=WvCMx0KewkB0cvyQEoNodLGlDlKAZuWQzdzv3vY3lLRMKovYoDYDwLTZ
   CtgId9SHBGcD4ktYLm2hVQfi15bpeWalLPx9NFGMQS69z7VxoCNhGBCBc
   dtBlmVZecdCWVGi2PnF/WqnQNNFw/+p7LpiKjI0GU5lEAynv4FjtstaQ+
   ueFOeLII8BPqHl44AlFx93Hb6KBUvMBjvjzVDJe+try/gkhXEWjWJU5BT
   Q65fWuUPHoji099i7t8Rf5Jx1dlAJEF2bC/B6mZi0+Nzzynn/u3t0nCel
   NdF5oE9IOnklXkbFVGfcFWx21RNk2VOQBDN2fmy2HbDdBOrXJoewKtAiV
   Q==;
X-CSE-ConnectionGUID: 4vFyI9uJSf+rVdhjf+y+rQ==
X-CSE-MsgGUID: /7XIyhLjRe28jKujAtTzDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86278053"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="86278053"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 21:35:47 -0700
X-CSE-ConnectionGUID: 3aVqYVoYT6iT4+tmhhFY8w==
X-CSE-MsgGUID: ghtvPGNGRmSrVqNLYOQexA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="263112691"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 21:35:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 21:35:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 21:35:46 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 21:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMLDwtu+jPpKLd6QdEujgCAvJlUEn3j7LrDszmv9HjFtBzPakF+3IYHbQ/nb0KufVLL1UjU1+8HqUGumiCbOvJPWM69D0+WArbyD0VQz759dyJz1hkDphisYx54qu2/lvVP0Lqi87GJOvmcRDdaPsk3PJUVO1Stj4hQfS1pD0Qu4/RIEvQjuTR0vbyyjcGNPiMRK8bUbTxExDnbAbOc99Ig70RNvbl0LCSZBH3A+gDTREB5SGMmIjJaz/DXRsEQf74tF5HSzhRAoG8uv9SRmTZVXNt5fBZXqIGP1iDtGZp4UQGBv23q7kgBQIjuB16bvtSQJNduCKOrgSHqxBwDz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKniYUzvIxIeM7K6it/GEygKWPIMYsc/8djb9CIRbcs=;
 b=M91ejM+D7ZhzEmvwqlbeA6kdDdYYAdzrEv4yHehTRaCHXSj5dBG3zz1R7ruxreFDuaL9D3+Ic1Zmb89+VwiZ56lltGS3EXEzifi+u40vYalsNszvZXXJItisPKu9lfVTAMYKBNj1IKhyXMyN7BYsP9g3OICpJzp2I44nsrfaaDqlKaUlFunEOkscmM+7iB7MonYngEIX47hQsrRh0Fjo8aQwQLQ098lCsuy+blFeD+9t9Op/iQA/QxIFYAdB+UNAH47esbfezMcTUX3JXrNMwTBr0jpFTZxkMg2Q+TTZbFCYtM+SQ9fY8Xm2tFhpVUCzPTRm7hOSLfl1dN/L23Kstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Fri, 27 Mar
 2026 04:35:44 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9745.007; Fri, 27 Mar 2026
 04:35:39 +0000
Date: Fri, 27 Mar 2026 12:35:30 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Steven Rostedt <rostedt@goodmis.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: {standard input}:384: Error: Invalid operands
Message-ID: <acYJEonqWHNtv1nG@rli9-mobl>
References: <202603270555.zPdpChGv-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202603270555.zPdpChGv-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|PH3PPF4E874A00C:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a460c5-e869-4d71-86dc-08de8bba4bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZDX5pYyYkmwNh3rUbOZ/I4y9/Q57wBfvRuHNgcw5kG55/RugpSv7K9kofUDhVGjiA6hvTzt14UeG+Q/Ri4G0uO1MRkWYkGRLD8J0AjAcd5YbpsTpIocl0CJAFO2WJwUjYjubTU8OmiynNQaY65h4zTbxRJcwDhC02U33kmaFh6vkt0c8UhDBpci6AtuYNoDbqvvbISu9mNUjZTjhD7Gb/Cq+P2EdWkjzS5m+HbytFatDjU57IIJk4wLoJ3X6NZswevXq9RBzcT5XXCoaIo1hADK4FzHOBRgzFF7eJd/LaYO1ywT/g5Yq8xQWNuNHy7erdN/n05OBRJmAV5sltxNbJIkOUQOmYa1YgrciD0dW4M05jm1BTf3j3I3NxkrAgXEBw37Pf4qsAHyebMjeYvZGgUNUW7yug0JxTu6BIA4kCn4xWGg9r4Yz2gxFkWWiJoefu6ITcxmti5cyXakvMgwdkgnVHNeCBP12iKG4Lfxl8GGYANjR+COkL3mpOfjhaVpNW8Ajm5E1bO8nMsTTk6BMKbkYzNknPsDBaxkWiG7ev48OyO8KVhICwLjxJz9KqvFMVtzR4NXPbhlvCls8XDJIZfzgzvNpNLDFTDUtZwgaM0+dWgewsgLI5X5FgJ7xCmrCvxBiGiTLLE4nLTDNdidbqMF0+vWFWaROMz1YJoidW6UJQR1RqxUsixthA26sCzJQyasCowLmGchMl7vhy7wQhcm7VUndMZoMPTp2hfdlp9itMxfbgPIdcaoLzM/9l7tB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wjfQDdGd7dSxxn3kdcvIrZE5hmUEsG6lVEHaWHWP22ZrBqhaHCmD+Tju5D+B?=
 =?us-ascii?Q?NSyd83MTtmbNx+evb7qW0Du1Zt1uwF8DDuGsbWQ5+bnt/bZ4saetY8qNn4+/?=
 =?us-ascii?Q?TZkc2Oh12Uijp9hP3+vrPiOe5M2ZQ92hHQmmcCCivTqltar9x5ROOX+jl4BN?=
 =?us-ascii?Q?/03m91rXPIgYnnjZFBcQmMrRCnfEvdOYG6lbUm+1N1RAmMPbMXm6w7r/DOcU?=
 =?us-ascii?Q?s8R50Q7jilUwy4wMJDnpaeXpeisDPnm5AbddKOclLnhH1oPe0B8WhIcWBrkA?=
 =?us-ascii?Q?NYg0UpxxE3WP7s9LDP/k2c7GJOawdkeXhjhIB8LQ7L77+pBRxca+nsz9h/bs?=
 =?us-ascii?Q?YsUYohjDP+7gn9HcGg4KvS7W1fzgXUZvIpKLKl2+WTEy8ZnIJ2aA1D7AiG/e?=
 =?us-ascii?Q?WJ0JEJ1feklwxVxG5mNvXMLVV/X0eZaZ0+CTmr5R6YbZvjMm0AdoP0JBbLPK?=
 =?us-ascii?Q?XsgkwXsQHcpFp2MayZ7ThcCFUpk/sQM++whjLfEIPBNAdvHi1P0a026OfR+X?=
 =?us-ascii?Q?BvL6fBYg/GPmXoZNL90Iyeh7XHs9PMYJMcRHQX2+/Sb6IRQsfVpZIQ3dF8ds?=
 =?us-ascii?Q?y9IpUN4mxo2YPq0Ysm7d6mk8LMSJzd1W6wLdQMyXfHAYvLHdvhZVX/hAxGcV?=
 =?us-ascii?Q?hN7je271FHydH0znnNKxO55xry/uqXhCXPGlz2SsPH2LlBdHiqNmbZ3koZu0?=
 =?us-ascii?Q?zjVOVDmel5zVYv2mW0xmsteNuSDH7S78bh9ATzyWvhd1RbN6uMeBizQ5CEu1?=
 =?us-ascii?Q?B2V3+RmeyMFnrD5qJHYLJ6MObgaDNgJnJYMWFLE4WzgabcCLaIQEyn91jalR?=
 =?us-ascii?Q?W93PsZ2LGOWvKInhNsBQYDPlm8TEHogusAseKwAZoPhQsi97We81ZQ+cWBII?=
 =?us-ascii?Q?HSZu7fYXao6TcX/1IgPIYKnxaX6c6FxAEXrSz5hEaMX2Ts6tB6OLZDMmzmrh?=
 =?us-ascii?Q?tDUr/HZatfpPdVNev4mvOLH8DML2ErCtbcaoQl9nHuAJpPHczFRUQksUO5xL?=
 =?us-ascii?Q?5R3smRtBQv5bhLT75nUVBkOlyI10RmUobP4BOO8D/6kcqwEjFoWgYqxMn0zu?=
 =?us-ascii?Q?ZAKbHmHHKQsKdrrWJKk5wld/s5S0ZzBVaYYOetNQDit8WHYKV8nr225SQ/VZ?=
 =?us-ascii?Q?LAwJe1qS0yNbU/n2hNdpHHC2S9egNYg5j5Fi6uoa8A7lxdJk+U4ajB5RGmz0?=
 =?us-ascii?Q?EhADXRDRk/qiAu1v3VxAGRiM+hpeLWZKR1qbSXpo7zzhSm1uh9tmfsgI3QEF?=
 =?us-ascii?Q?MFHS+JfdseO+LLmC3FLJFZMn77VghbiFDdco6hexIZyhDL4oBgyzX4n/MZit?=
 =?us-ascii?Q?ptCOu4EIza4RbwqX10Ey4Y06XPi55R7zogclZ0BlqsY/wLmukgNGU8NE8mWL?=
 =?us-ascii?Q?xRzfWK6dVnk9uvjX0PI9xfoM41T21I9+bC0CYolmtLdKMQa4q+mzb8tO6mMz?=
 =?us-ascii?Q?ERF8Eb1VehONEU46jC/NTkK5IZZOyIKyzcn+D6ZEQ9w07ERDE+YMbbmOBxv1?=
 =?us-ascii?Q?iYo7m6IAgmvhp0lcwqVqunmTGWDN1ppbWlx4cR8MtLzwRj4sXMsVsSjsToTj?=
 =?us-ascii?Q?pMv2NJD1fPhcDESjqzNZ2eNY2Gzci1GJ0PsOz3B/+T68uCrbF8qzD6oxYNmz?=
 =?us-ascii?Q?OijKjCS7aRV3zGsiEnyRuoLXlEydkUoSb1HtZaWcvmPWE3xRd00BMC7YHe4O?=
 =?us-ascii?Q?tYPJ/2MGW5GojO9mp3cGHKji8RZbfSFL4kA00n/1Oc6d+bBp6knZ+cdBJkKF?=
 =?us-ascii?Q?QnslLkfudw=3D=3D?=
X-Exchange-RoutingPolicyChecked: aoFpgPEthrPK3AZBUV2emsFjo816NYIbpQdJnv0+cCArfQa6lFP/d7IxLk/eZYtse3UM0H0KPcc9K5mn6le3bJ9mMgmDK9w67wn83al03yYtHwqJ3xaQ+V4UBWM2tzCir8gCr5O9f/Q4vogCwb4JxVz1CwhTj0h0xKfp6zFHxIaa7T58hsTLuJLruSM/5CvWRFAjifaF9ELBkH7UoIAfVJuTHDoDizlI7mwgzZmyeXzBN+QwKrrjkw3bpi5xBE7csYJWpDx03xvB5pUcLYxJTmAc32cToEJCdTpN4eBcCf3ku4905Q+BJCNYQ0T/e2462y3IhY/3vnSji4bNecfmrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a460c5-e869-4d71-86dc-08de8bba4bf0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 04:35:39.0880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bI2U/1zv8YLEf4CIH5J3zxW3Y23oh6ertC8wjFjVojsametV84wd4MW9Pi4rsNom1yYN+EbKHNdt3DeOPeKhsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4E874A00C
X-OriginatorOrg: intel.com

On Fri, Mar 27, 2026 at 05:31:18AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   d813f421930c5b01b9f61043932de02602dd6ae3
> commit: a46023d5616ed3ed781e56ca93400eb9490e3646 tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast
> date:   8 weeks ago
> config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260327/202603270555.zPdpChGv-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270555.zPdpChGv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603270555.zPdpChGv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

Kindly ignore this report, it looks like a gcc bug, we will further check
and avoid reporting this again.

> 
>    during RTL pass: final
>    fs/smb/client/netmisc.c: In function 'map_smb_to_linux_error':
>    fs/smb/client/netmisc.c:893:1: internal compiler error: output_operand: operand number missing after %-letter
>      893 | }
>          | ^
>    0x7fdfba8c1d64 __libc_start_main
>    	???:0
>    Please submit a full bug report, with preprocessed source (by using -freport-bug).
>    Please include the complete backtrace with any bug report.
>    See <https://gcc.gnu.org/bugs/> for instructions.
>    {standard input}: Assembler messages:
>    {standard input}:383: Warning: end of file not at end of a line; newline inserted
> >> {standard input}:384: Error: Invalid operands 
> --
>    during RTL pass: final
>    netmisc.c: In function 'map_smb_to_linux_error':
>    netmisc.c:893:1: internal compiler error: output_operand: operand number missing after %-letter
>      893 | }
>          | ^
>    0x7f0298cd2d64 __libc_start_main
>    	???:0
>    Please submit a full bug report, with preprocessed source (by using -freport-bug).
>    Please include the complete backtrace with any bug report.
>    See <https://gcc.gnu.org/bugs/> for instructions.
>    {standard input}: Assembler messages:
>    {standard input}:383: Warning: end of file not at end of a line; newline inserted
> >> {standard input}:384: Error: Invalid operands 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
