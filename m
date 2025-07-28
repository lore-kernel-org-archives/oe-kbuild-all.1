Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FFC20127D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753689215; cv=fail; b=Gnn5twApjNVWyEb52gqHaN/w8pCxQi42sOq2SNXLQeeQqtlfb7s9UMTFTGCIvfWYwDufI/7DqtZ8yeZPmMERX56gfZoPWCsFyTK2qb8O0iNqxgx3+R4r8snRmT7Qx0KlJqA4qkKQ0IQK1rhKr5by73FEFA50+2A5oMhn+g1BEW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753689215; c=relaxed/simple;
	bh=PK9FrKrR4/TR39RQVt/AQ3QUEC/5N4NsppV9jLnspMo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f0h8NQrn1HxDcG8AZ0ZVJvxHII0dAKMGljhjXruoKITHw+o+2DvrUSVPmnZ+PsNUTqJ4ZX+9U9UH97U1FOSFzv3nGv2YBUKbHpE8cz6wVuZ0Tta2auS1hsYmjaKhUuBqwKgYa7X8EzjV0cNQ4p6Poc1w+RVfq93KFXi/8Km7CkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyDIJ8Cj; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyDIJ8Cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753689214; x=1785225214;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PK9FrKrR4/TR39RQVt/AQ3QUEC/5N4NsppV9jLnspMo=;
  b=QyDIJ8CjP6AEwNtXpG1ZCYcgLVqJExvIRmQTZwa4MMBWVb1X9LV1nd9m
   qapIikwtgXBWdSBdClMUDnc68/hLJTGGPVrUy98YeVL0Lkk5NH5QM7Zbr
   71+ljWF1eTKeFZee2YY0RyLwllUJdiX5bahMQiTPt7keuYBuNQ1UgkGce
   oe7WIwnFUEq/M41hR5HClQHqIva6PqjCzIo8TWLUe/Pme+uaS/ihyECQ6
   PJootQu3rCrlKFkCapP/E7nczxbyp2Mf4FWjCBhZIPmPZ8t2eOCAPKGpx
   8mgqXMU0U+uLhkFrxG8kbpYdv4oqwCJkHiECHnDTqV/yOLJGoeEfU2wpr
   Q==;
X-CSE-ConnectionGUID: zAX5u/9mS5iLYHlbdjezvw==
X-CSE-MsgGUID: 4tlraBTISLah60wFZNooJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55140017"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55140017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 00:53:32 -0700
X-CSE-ConnectionGUID: J29OPQ26QnWrEewrluThbw==
X-CSE-MsgGUID: DErowxyiT9OnNjGswiBGiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="167762716"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 00:53:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 00:53:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 00:53:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.70)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 00:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHo5wk10ahxRxW9OqzGkGXqVVb0zsLF6ajZxMWUZfhad9p/ErtJXHOf5IpGTaoymhPD4m0ypvRx0MG0bHDVmNCvCBfZ6dOAdNZe5GxSmTUCMrpFDG5uAWDIio3+TIlzYR+/vkXut4GqwsPKyN5rDfyZZUJKIH1sT0pJm6zWqQ9V5CoF1JUkHSYCxIxzBij0HPJlKDN2gXWpHeo+7pD1EXH0sP71pZGVUysMxjcOCyaGZm6IalNbwwWOXYDIaCFJr0VLVZerck7gjenrixjBL5wuzW7h1wzqnEf0pwG2E+/iTp5/aPmeh7Va8SBEw9pCiMVGiWg9qfbGANWgq1mmang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKQdibwGYC8hBoRQzPJr8E5FmsbYqcxu3zjHINxHfuM=;
 b=vyui9cN2FQ8TmT+gFfnUSZlCWCVmqubO2uQVz8hdsf1Na1U/wkApLi9TYezXVpl0yQhv9hnXI7HICciUUZ1FCf3fgRsIRu15ZYX0zdeHALEXXzbWqG1qj7fyMxtUY+aQIsYW/oZ9HpOeBYuh/QRX9T5mtaGy3wh2ULgXqaBWJInJ6y6Y7o7/xJZDg2leCIwd56RQtUFO1zND1woJXu6dMC11G0i1TgwtXfldAHQ801YA2Ac8KlreL5VZWUItCAabfA5x3d/iObDxpz4jQ5m6mOrXZ6PrVStqjmWLhwTuAh21M0IvoOxA/tDQ9qBQ1osmA5Jrukrto63qQEXFOZX+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by DM4PR11MB6263.namprd11.prod.outlook.com (2603:10b6:8:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Mon, 28 Jul
 2025 07:53:28 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 07:53:28 +0000
Date: Mon, 28 Jul 2025 15:53:20 +0800
From: Philip Li <philip.li@intel.com>
To: Kees Cook <kees@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [linux-next:master 12136/12319] drivers/firmware/dmi_scan.c:692:
 undefined reference to `efi'
Message-ID: <aIcscLJE8GX3By4f@rli9-mobl>
References: <202507270258.neWuiXLd-lkp@intel.com>
 <202507272255.50254C0C@keescook>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202507272255.50254C0C@keescook>
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|DM4PR11MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: 458d3b75-448e-4399-cea4-08ddcdabd67d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9DGwrTXWA2HnucvzIE6mZmyj5QA6nrGLcxfnXy6vQU0R6nNrmMp5/DZG23iS?=
 =?us-ascii?Q?GBtCiJUbHcodttnennixRPGdrtyoges24yWR05xKPpgIe1Yi2saJvwFsfQzv?=
 =?us-ascii?Q?qxUywnFfy7PrlM61/DU5TJE6Og4NXcjJ1XoQRhStk+L+lk3uvCE8ML7cffU6?=
 =?us-ascii?Q?/DRJ6TlwF31dxB23cfRAI2zmcnHmO9SOtjMrFN0G1430znxOVf4UPIP4/Gpr?=
 =?us-ascii?Q?hgI372PvKhbYTWe+e+toetQXvk4Fa9BA6+//Xg/16bCf+S0OsE72OEKitO8U?=
 =?us-ascii?Q?hZ656NuIOCkGYpcdI8I5m8fN9EnK1w2ulKtth7PmLdwMnYkwHcUToTYJjR33?=
 =?us-ascii?Q?qZ613Jqn2/1orH8xuOBnIZsh8q+KHWLg5BmB5soTfgY3iHVJRkiSt3UdcfmJ?=
 =?us-ascii?Q?RkRryM6qZ4sJsj0eyuiEs7GKPdh6OXYndinzdm/XR1YxltRrVacUmL5X+PuW?=
 =?us-ascii?Q?uIhjDpagdJ8rQWeZvndEX38oqA0Ob2yLowCXZk56BbwkFSzmVU9rdn+LBTjV?=
 =?us-ascii?Q?eNRFQJlj1xcT7TnLM6VJMLHnR3RMDdG81CYgpYwSdV3TKlATxJfeirc3SMb7?=
 =?us-ascii?Q?Pfqu9zenWRkdfZsINTMPoew2pMMRvpQuZZqbeR/0HDfn95ymayhLdEDYMzLw?=
 =?us-ascii?Q?r1GJVQt2CwGl4M3S9lzh0tpUFriAbbW8oljc7Xn1Dk06uFTThQkDbnxWuzfU?=
 =?us-ascii?Q?7KgL2aU8IYYtlAwxkIcqDYPQrVK55t+aSyEjjr/G4PU47hJmsiV7y4MsICKy?=
 =?us-ascii?Q?Gsza5wKNMf9nmMfF6rv72bQ40NHZD+d+vAtdgdQf0c3Fgm64uKzzunMi/4jb?=
 =?us-ascii?Q?Uo6Sb2TAitGSbsd9WDf9v6GgDPk2jfq10L8awP4KxZDpm80uLipxLqUCkY9M?=
 =?us-ascii?Q?Fgs+1z0wIFMEd1v0AVfEw7+FoRF7+1UanHnx6S0vlGOBSScX6DpLlOEEHikR?=
 =?us-ascii?Q?Xq1WgSAYGsUy67MiC3JUGqnsFWH0ZMy9Jk6h0IosFRCPdgZOCXQyjBUfG45v?=
 =?us-ascii?Q?qTj07sl/SNj9wVWH2LIM7TW/wSA6vvDhNaq6KIw8t+GBkM1lZ8LI9mSTr7bS?=
 =?us-ascii?Q?snsvuO1W8JT+vvhAtDA69MIwWgcurq4fqe4GrBmACadPEuxLJ7i+jxJiNz6/?=
 =?us-ascii?Q?mWYDVRoI5xs90YO+E9mjijDYNsni5TQM0IISPgL0CEcDvEcNVO9DthHswQDZ?=
 =?us-ascii?Q?HSxSLQhGl3LFtwzdCgWW3IAOwdUjNFFq0buKV6Vk+E5UKCM3MlfMJf2bv0d7?=
 =?us-ascii?Q?xvFvVH7hx0h53nDQKoom+UktEeH3+QJ8AMbjkKeEOp5q+8afnSC0H476S+gP?=
 =?us-ascii?Q?QsRrDznXU5TVq2Zwrg0++7RYqOsZS6eycC08Q4kZu/QrWrqGZglZGxdwMHHF?=
 =?us-ascii?Q?g4rpcpgWD+iiPIKb2iM7RHO+nUaD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oSlZfIEABNXkoF2uqzNdUPpt+GQPwq/rzgrMFVr5GN27+N/KNDchLdybuztd?=
 =?us-ascii?Q?6XlRCWT5up0D74ZmOEOPdCGc7t8WAGJUiopYCjnU0VLPPLloXzZwK/gxwRhU?=
 =?us-ascii?Q?0UGRORHKm699+tclIwUotLgjabublybjqyBPHcivMhrVl/R2hzRJz0IxzoP2?=
 =?us-ascii?Q?in4EAR6QrOMSKCOrchqqNQ1zubcqWtSkN1WuZ1ACUB3wKmSuXxhj5jsdAHDU?=
 =?us-ascii?Q?mvgBRKe5Evcwp5b0QhqHodH1IWuulRd0OPnibLRr1YhNW/TmPFQdApc6aTji?=
 =?us-ascii?Q?cttrhVEcVEFatnxepaseZ84xJ2ZvY4eWGLSMcLMPrQXOSxC9GMQIsqXS7N7a?=
 =?us-ascii?Q?jl4Tr7AduXxqyhpBi04ckwl0fwMhglKAc4AHUdv5QU+u6j1EDvCectU3S3eB?=
 =?us-ascii?Q?f5jSohkA0hVzphg4lddJphX9YhxMdRRO0bOOMpgBLoawGwdCa0b4Zg70E2YF?=
 =?us-ascii?Q?cXxe+bhaYcxovu3Iw9p2XzD/UU/onf9qwF7fGB/jd4LTqgPXo9WM8oufu8Lj?=
 =?us-ascii?Q?FTW7FnV8rrrvBvoEixHcbqhZF00ZDTIh4neJRsTV4QBEZos0CpiZsGyvwVfH?=
 =?us-ascii?Q?s1pad1Hf8DZxKQvcHUsbvVzqG2SnYNJbCyZviijrd7yC08qjTPBel/T7Dxcz?=
 =?us-ascii?Q?Brs718r4joJTUVxV9BpfY3XsZgWnlATrE0ZWJy0vNgUo5lnTuPDCNDbXC1zT?=
 =?us-ascii?Q?mMIMBwIyzPP9iAT8e2jP7WjSN3iUibVRaMYHj5sLBnkplso7YL9XJgjiBuxl?=
 =?us-ascii?Q?Ak5KYglb2Hm5kNh77W5Nxeb6Cc701cRiKBzHzBLvEIRHW2Ghamtaeyimelng?=
 =?us-ascii?Q?CobuaGIJZyFzoRhklIl7F7gEk13A0RdiD8iNGIdI67+GLejfdU0d4AliEs0f?=
 =?us-ascii?Q?YwwjSML4yRayzyeZx92gRSj3whAF2QdBOtURp7U0JUYp3PIJ+1ZxfCTzoy4f?=
 =?us-ascii?Q?It0pUtMfH67DdrKX5DsMb+mkW67O6nXFdjnVcqUGOb3smJJNEMxHJ83aEPgp?=
 =?us-ascii?Q?B0GyJxDDDZkfuBGIfVUGqUFRl9zAdQKkcOQPpTGy+vkVttk2TP2uOuUmlsjd?=
 =?us-ascii?Q?e4XJD3W1c9UFeljLt713hFa7cZ9CH3eZnM3lhYG44XwpQuqRz2UJcsccLrRH?=
 =?us-ascii?Q?5Ky4I6KPFTV4B7icMUpjapnm7eM7dPztWA2Yv72qK+YxIre0Z/doA6/Q1lpj?=
 =?us-ascii?Q?TfpLd9VQnj9AOOYY708uA1H2BUpAvEWnG3bk4QwnRmetMUFSqXZFibv83bkk?=
 =?us-ascii?Q?EssDa2L7ScpJlaRAenZwXrGtcKtzjyZap7KxLdnMAcZK+C/U0CHYyyXIL8qU?=
 =?us-ascii?Q?owIH99qYshmIh9BQbdM7eHtB3glAzpfd7GDPyMaaRNCf+B6sxvihkY/ZED5/?=
 =?us-ascii?Q?kJ5+usiC9u416BDMeoAskQZz+IZDxcbqV/K4X2vgZnlKxWPxrC76+mqa1KQA?=
 =?us-ascii?Q?fzf0f2bIwUFxEYVhEZxQpsgH5lcwWKwnveqlTURleX4ixqfchU0BNQDEUgNG?=
 =?us-ascii?Q?pZAt13CspFEa5XnJivUYBwQg5RDAvoMqtxcHSdGqL7jeAt71FVxk6Pq8Y0Up?=
 =?us-ascii?Q?aj1+P17I2MN4sf3yYJ+HcU5Pke+HDx62cDFnK5Bj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 458d3b75-448e-4399-cea4-08ddcdabd67d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 07:53:28.5124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ct3fnAYjQpOq3P32r+7p/d2PRiJOd8b4Ra3XpSt73dikGR74KrXVF+dwE5AkThDEXyIiOSFZGd9p2pWEeik2Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6263
X-OriginatorOrg: intel.com

On Sun, Jul 27, 2025 at 11:04:12PM -0700, Kees Cook wrote:
> On Sun, Jul 27, 2025 at 03:04:55AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   d7af19298454ed155f5cf67201a70f5cf836c842
> > commit: 1ad483981776ff67e2b37bb6951412e608c55adb [12136/12319] init.h: Disable sanitizer coverage for __init and __head
> > config: x86_64-randconfig-077-20250726 (https://download.01.org/0day-ci/archive/20250727/202507270258.neWuiXLd-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270258.neWuiXLd-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202507270258.neWuiXLd-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    ld: vmlinux.o: in function `setup_arch':
> >    arch/x86/kernel/setup.c:987: undefined reference to `efi_init'
> >    ld: arch/x86/kernel/setup.c:971: undefined reference to `efi_memblock_x86_reserve_range'
> >    ld: vmlinux.o: in function `ms_hyperv_init_platform':
> >    arch/x86/kernel/cpu/mshyperv.c:496: undefined reference to `isolation_type_tdx'
> >    ld: arch/x86/kernel/cpu/mshyperv.c:494: undefined reference to `isolation_type_snp'
> >    ld: vmlinux.o: in function `acpi_os_get_root_pointer':
> >    drivers/acpi/osl.c:210: undefined reference to `efi'
> >    ld: drivers/acpi/osl.c:210: undefined reference to `efi'
> >    ld: drivers/acpi/osl.c:212: undefined reference to `efi'
> >    ld: drivers/acpi/osl.c:212: undefined reference to `efi'
> >    ld: vmlinux.o: in function `dmi_scan_machine':
> > >> drivers/firmware/dmi_scan.c:692: undefined reference to `efi'
> >    ld: vmlinux.o:drivers/firmware/dmi_scan.c:692: more undefined references to `efi' follow
> 
> This looks like a GCC bug that was fixed after GCC 12.

Thanks a lot for the info, we will ignore this issue on gcc-12 (and earlier)
to avoid reporting again.

> 
> All the efi references are present even though CONFIG_EFI is not set in
> the .config (all the checks are already wrapped in efi_enabled() calls,
> which _should_ get DCEd by the compiler and leave no references to "efi"
> nor "efi_init" behind.
> 
> i.e., with gcc 12:
> 
> $ nm gcc-bug/drivers/firmware/dmi_scan.o |grep efi
>                  U efi
> 
> with gcc (Ubuntu 14.2.0-19ubuntu2) 14.2.0:
> 
> $ nm gcc-bug/drivers/firmware/dmi_scan.o |grep efi | wc -l
> 0
> 
> 
> -- 
> Kees Cook
> 
