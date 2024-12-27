Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86224A1D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 01:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735263105; cv=fail; b=C9r9v76WHBU6+4TVwoiLN+SkwLARfD3g7fo0r3EK6g5ONW/ZdwVAx9B+ujc8CLI+t02PffJTOPopXmtnvffUZyIeNbF2+rIZp3dtQKAracR5XDuSlgKE+vXLq+vACH89+eShgC6RBndroWJ2QfRlO86QlV3Q6mjVl6DV8TfZDoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735263105; c=relaxed/simple;
	bh=iH9B9XCl0XE8Js/d0tSmk5rd8VylXyO4Xr92Vu1Sq+E=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y/6xX5B+hfxad8NTpkxJZRUn4yQKH9yUHL5FzAZAU+IwVYF3Lq5+gOcgPMEcj2zhP8NdFlmHyvo2DLphuXHHe23dG/T+h2Xra8alKDFqPCM8RFoZJn7fj1+m65Mv7mL7VRvrqsbtKWLcv2x0Bf3r7PLveY8TiL5VWfM5cm+XXIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2tlYrtr; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2tlYrtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735263104; x=1766799104;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=iH9B9XCl0XE8Js/d0tSmk5rd8VylXyO4Xr92Vu1Sq+E=;
  b=H2tlYrtr5fbQDc4wpD7cOBoRhBSxJJ2/nGInfxs6JGshnoaDLib4W22c
   EYzxef9HfbQswx1FOuV+E8lZqQQlNaw3Ku1Ja35v9DcV4/FKVXq9lQaYq
   OPzhM2/PojQ73fEVB7OcN48VsDmce/xu7H7i12ApcpOpwaG03e8B234ZM
   7t/iQSOen9uImvVcsHfOsk91YtmkZna86UZvdc/GY2p5wcl49R6dbSyrD
   SxHEllguO+8B+w1eO+OnbfpXxQxVtqB8lXNl7fq0mZN2E4SJ8vmbU4rm7
   FrtGAiFo4XNeWcarGQthDWfn68vfY24133JKB/g2S+o7PuGLRzqhPoFHU
   Q==;
X-CSE-ConnectionGUID: zFgUFm6STH6PvoLIHph6Sg==
X-CSE-MsgGUID: FlWevKIDRWeZdRAddQwTjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35581321"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="35581321"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 17:31:43 -0800
X-CSE-ConnectionGUID: zbJhlAxgQ522EjfyqApb1A==
X-CSE-MsgGUID: cumjkpbiR2yV1ttxXbI5Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="100162936"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Dec 2024 17:31:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 26 Dec 2024 17:31:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 26 Dec 2024 17:31:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 26 Dec 2024 17:31:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sr7r99aGnDJLN6rg1/tnv9XnUqFaL1GE4DZNiuS+LnQ6z19gzdWbyTofJ8WkE9EGLQSigY1mq+tt/GnWI1RHgOYYoh+6UCcI/GxwYB9e1QSfkIOVWuqpcg2VnxaVbNz1Iau4vYnYWqb3VbcRg6Z9DGeSHPVpLOWcSSSTvbXwE6yET5A3qJByAduxWkMcwMJAXAVkGfzxAmFWJ9C/fvkIjalc27cInntt7W1FyUgc7stvRKhs9OXxzlpJSYTKaa5ZWG+mZmgZT+xUgBio/RRWFa8n97Jfxh4mVNrbYuUfK6CL1ivl7Io+Si+vwjegLizj9TkKANL4wCWUKMySDi5Qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zo1tvudEfQXpFyJQKJTeXoy3tCmUhH5UDE1A6m1drno=;
 b=sR2d+zitqaBJg3NmWcDa0lTu3ositUX7OADLMLWJTt6scXrPGKtvpnEpNoFci93Q5r6TeVebqreJR0UrO+CV9fXL2gqurY1bxRkgMsDDyF4zQBJMqXLeEIx2xqraIuE4+mB8iyg0NDZ7P80e6MiV3hfl63JLDtCObzsuCP/BLgiJg0ZYhR7gqDNnO2p3eVGgoCv72L6LcQ15vQk3ZhbfN1ClGXi8uElzSGGTUHRd8r/5ZahwjE5u5ILtpx0yHXxHJxdd2HOdfRGtIiM9hEQS2wAHfCGeYYDPeDdOk/LXjINnpjVaz2xr9DdwgcSQChgUfT9kU39SZsIucU99UbC5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM4PR11MB6287.namprd11.prod.outlook.com (2603:10b6:8:a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 01:31:17 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 01:31:17 +0000
Date: Fri, 27 Dec 2024 09:31:09 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Stafford Horne <shorne@gmail.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [stffrdhrn:or1k-rseq 5/5]
 tools/testing/selftests/rseq/rseq-or1k.h: rseq-or1k-bits.h is included more
 than once.
Message-ID: <Z24DXSKP9VYu570T@rli9-mobl>
References: <202412270840.23RVr7Xf-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202412270840.23RVr7Xf-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM4PR11MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ce5551-1a5d-4640-c2dc-08dd261628d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HLWTHXfeF9BTAqh1eLox6GygupcXzHBRIIhyF0PzDuVGvwu0zYjZIkWcxUoR?=
 =?us-ascii?Q?l9ftH2RialmYlttay/13S6bwg0Ewjx/PayQyRiphBBPhMJmXllJkD0MnOc/Z?=
 =?us-ascii?Q?LJcBzDm8aR1FoKJazx40FCwQ9teIoWtqVlttQeJHpbof2cgAI9MMBCFr5GWZ?=
 =?us-ascii?Q?lVuyqjzKRij9T1SYk2jfrzDs+u9ljBBw7dEf8bgepDhucRV5ad+4kgsX/GPb?=
 =?us-ascii?Q?5pMVk8iat300ufjIXPdSXm6epABYQSwDr6FKEOlB1OJjJ81AZJyDQqHL8bXa?=
 =?us-ascii?Q?za9IWANcPMAGEHXqbn9ywB7Mjy9O529FaJzpUo8IMokec8JySft+70zKFJFH?=
 =?us-ascii?Q?+wb3DNUvEqfuEcN1FnAoVKuS1d5ohVXhUtmncU7jNbKpIfs5R3OwcN/hW1Am?=
 =?us-ascii?Q?yg6ujqgqKdi33PEb5VsnZ4V+eQhZhmNY+a2xESHNTYlp/0YVYC7g6dmc8uRq?=
 =?us-ascii?Q?zYTBdrcRUdIxN54RvCK7WCDhe5k7tNqE/3+grzfsgASGU6t/IvNC2qW4A7E6?=
 =?us-ascii?Q?oYMZdLpAfBf2XATFyRRofLYoxS+Au5XWORmMjHBckilLJqXQCjEwhA3D2Jl9?=
 =?us-ascii?Q?GviSgMgVLHvebq5+Pmz9fqsllO8BNeKpGYzqlycF+595ozt0ibqk9s5K46xN?=
 =?us-ascii?Q?pacj/06ra8RggQM2PVh2333dwhX/3BDcOd79q7BtfUPHLlGaJtkae/+yfrNd?=
 =?us-ascii?Q?WwJ/bbwvB1w88MASgK9bl3UX1EOFX7qkTXScl72wrDp7LPViVbLa5HolTgu5?=
 =?us-ascii?Q?sNzd7u+vYbifQsm/+viwKiucj6WMQ0BXNdcZy9atuWiN8IqsKLgJruP6QOha?=
 =?us-ascii?Q?f0tDZXoezzYxjHUOSkdYL82Gkh182wCkEzjgDvcuG4sV67ozHrx/uvKWR1+6?=
 =?us-ascii?Q?22oAUTtpGkbRKv0K+a689LUi8dcSg4GCQobRnhKRWNbDL+VA1Q48woBtPSi8?=
 =?us-ascii?Q?Rhg128hz4xdm0rYgJxvEgN1Qcw1CO05A1owBereDFLdHzqLKIRLuFlu2clFK?=
 =?us-ascii?Q?O//NxGljbNF9OxGZjMsPAVpeMN1CiV5KSdbJ9Zp4VCIzuou5jSii4XkCzRXt?=
 =?us-ascii?Q?CFCFlVpEc9UuffuaCYDNGnBve4egHtPHaiiEz7MptanNpfdxcj7G06HFfBqY?=
 =?us-ascii?Q?gl0yg/oluOU1KJWSWxQutUJkhjn+HAQcZ4YdhalFJFMlyoG+l7PaP762BR3z?=
 =?us-ascii?Q?95Tr+ZB4/KpqPJUpUgMY9nJgZ0G7rTwz7N2z0funXeITDhaqziTPdkaOSpzX?=
 =?us-ascii?Q?ZBgO7f/iL3n9g+yAoUHYI6OjtTVuEL6PDIhbaWBT2gJ4vRqp3SEX6RRiMbjW?=
 =?us-ascii?Q?O7w1rrTGlVO28JdSH4Ib+fpWEIGSBybgGVuN8IYxQiteCi1UM5rdIUImgxbf?=
 =?us-ascii?Q?nkZmk884gS7bGgFCMaTGKVPJoxMPvTGmUq+v/Nv67oVFOfJtvA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J3rPIfgsxtxcuib6G67uBLQAqrpcEG68CWUc8U27Q6k63uUMnyNYZFyKbNs7?=
 =?us-ascii?Q?m3+jo2gWHnTaUOgPtRiJeQdjyOkYkscwaQsnX9zcJK77hmK3CWbsjdBo1H6u?=
 =?us-ascii?Q?BsBoUqmvvGfhSLLddzfbT3KcOXg+ikut7WODVRavDfVvNRwfSqcqZa7+p28c?=
 =?us-ascii?Q?4vDFuj5Lj/uELc07B87P/AwlNNt5cINvZZF0wabCTGoWKg+gp1eHon6oyDFo?=
 =?us-ascii?Q?9gzyVl36c/Z5c1AW+H5gfVnmjsn/dz4wtId5Z/t7GaVAvpph0MTD0tTSAK40?=
 =?us-ascii?Q?stzdCQJdYV0MTxyOMBS9MCxw/GrF114oHi+a8gn7Fmm53wSWPX4tI9JRt9un?=
 =?us-ascii?Q?ExiyvxZuI98C+qoiU4H+lsUWQBRM/3NccbbVmKw3eg1b7SkULF0oZZn5rDdd?=
 =?us-ascii?Q?Dcc43gBt5jH8nlxV4viWi7AIBWNAHGXF2UZi6GJKuaS7EtfmRws6ZEjKUTcP?=
 =?us-ascii?Q?wYixgVH4yrn/mtR9tf8tZGHUfqwKqpKs1jSrmy9oBNh4zEYFG2WbGyi74+WZ?=
 =?us-ascii?Q?E2LJ7Thdyw4/mxphNUXpTc5E9arzSjRAPwLJdiclVjN88i3hecE4qLFYeOej?=
 =?us-ascii?Q?9dmvUN8aMQzmul3uPsHT+ZT7nrfbaljCT8RbHR+NyugL45IsnveYFA/4T74N?=
 =?us-ascii?Q?NPi5xy5cCVZIH6q9msE42ZEcSwL//c0obqbpgex1bJIz1gRV7rpFuTQIzoHG?=
 =?us-ascii?Q?hebopwLcpJ6uPPiEJxKD48W4FgkUNp5y/vGl0wkVNkN3tSrdLK+OyQkaQoFa?=
 =?us-ascii?Q?gJ2To9qNCLdekKkDVMGn2Xy+kkcVhI2hY6cA+OvDItgCK60w77CfLoW+X6L0?=
 =?us-ascii?Q?7uLP28/2za9BdnMaixTjqaQ+bNVW4ruaWkb5TbjCvNsx83cgoi0ZxV5fDvgG?=
 =?us-ascii?Q?oV85wjXZSIo2lOL/GkM7TfRDdv7vsk8Wl3aTi2ly1WG4f70mF8a9Zj1LuKpG?=
 =?us-ascii?Q?Ie4ETf8+98wu+A9FzLwmpM86QALWHELbZ1N5O+lEEY5p+YwWBLHfWoO2YY7r?=
 =?us-ascii?Q?0D54tNE4tj1y2Y+cqfidyn6GsxZf5CRotJhQx9Trp6I92QiY+xyV5CNZrznk?=
 =?us-ascii?Q?LzVPGfGJOX+f+c/xiW1TrppdlqWfzt+TVSuA299VkkJMVJKiBqxjEZ4S+slg?=
 =?us-ascii?Q?3IUAtdMQ+yyXZqhdJYQFJFjs6N4HdkCTrUQsGETTl6XhMSlsZUGJeiC8RRlS?=
 =?us-ascii?Q?jjTtQz3kQA51sLs6okvuVESTjngtr3fdcTEbxCL7+imIKvXeO4YgYssCp6Tk?=
 =?us-ascii?Q?5H8lf9dheFSI14cStoS/8SUhkuChoSJvuG5ssRN38fI4SP9/66y3b9dK7BJK?=
 =?us-ascii?Q?MswKb8aEnwBsG5DOG1UuX9ABVntGEO16lAT10el0Vc8CqZqn7BXbPyoMfNhv?=
 =?us-ascii?Q?Kim2UhTkiN+1QldWMdbYNW/XwdN0pII3PkFfHSLMvVcO0Q0UjLTD/dX3JIvW?=
 =?us-ascii?Q?M6cAwRgD5cQRhsUDLFaJttmc21DCinI77uuPOAFKh58hEH1yxip9OUehT13R?=
 =?us-ascii?Q?eg1mk2aqoTVOryRShoJV9FV35kAg+V1KXbfSawq0On9qpdffa/xB3ox6oQu4?=
 =?us-ascii?Q?LnrU+dMQ6LexKdNgsSOWA+e4ANXJMQp3YQ2RNx7c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ce5551-1a5d-4640-c2dc-08dd261628d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 01:31:17.5379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gy5a0tMWurGhTLGFHpxL9sJpPPOO/WcqKVy8EoNtFFdTt29Nwj2WyGohZiAqcwmg9yOjP/R0yhB9CVp2Cv8frg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6287
X-OriginatorOrg: intel.com

On Fri, Dec 27, 2024 at 08:56:31AM +0800, kernel test robot wrote:
> tree:   https://github.com/stffrdhrn/linux.git or1k-rseq
> head:   1fa73dd6c2d3c915af3f33929f8a9b437d7cd112
> commit: 1fa73dd6c2d3c915af3f33929f8a9b437d7cd112 [5/5] rseq/selftests: Add support for OpenRISC
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412270840.23RVr7Xf-lkp@intel.com/
> 
> includecheck warnings: (new ones prefixed by >>)
> >> tools/testing/selftests/rseq/rseq-or1k.h: rseq-or1k-bits.h is included more than once.

Sorry, kindly ignore this report, it should be a false positive.

> 
> vim +158 tools/testing/selftests/rseq/rseq-or1k.h
> 
>    155	
>    156	#define RSEQ_TEMPLATE_CPU_ID
>    157	#define RSEQ_TEMPLATE_MO_RELAXED
>  > 158	#include "rseq-or1k-bits.h"
>    159	#undef RSEQ_TEMPLATE_MO_RELAXED
>    160	
>    161	#define RSEQ_TEMPLATE_MO_RELEASE
>  > 162	#include "rseq-or1k-bits.h"
>    163	#undef RSEQ_TEMPLATE_MO_RELEASE
>    164	#undef RSEQ_TEMPLATE_CPU_ID
>    165	
>    166	/* Per-mm-cid indexing. */
>    167	
>    168	#define RSEQ_TEMPLATE_MM_CID
>    169	#define RSEQ_TEMPLATE_MO_RELAXED
>  > 170	#include "rseq-or1k-bits.h"
>    171	#undef RSEQ_TEMPLATE_MO_RELAXED
>    172	
>    173	#define RSEQ_TEMPLATE_MO_RELEASE
>  > 174	#include "rseq-or1k-bits.h"
>    175	#undef RSEQ_TEMPLATE_MO_RELEASE
>    176	#undef RSEQ_TEMPLATE_MM_CID
>    177	
>    178	/* APIs which are not based on cpu ids. */
>    179	
>    180	#define RSEQ_TEMPLATE_CPU_ID_NONE
>    181	#define RSEQ_TEMPLATE_MO_RELAXED
>  > 182	#include "rseq-or1k-bits.h"
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
