Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBAD3AEF4C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791288307; cv=fail; b=lQh7GKKgS3S1BGzlBr8f31S27w2lBhgLCdRHXmNcZHT6YjJdMsv9VOZRThnvznZ/+wYelsED47zv4df5bv8zF9lrhm9rm5J/5cWkNlLh6cxOESpWDtVoOaLO3iwOqfKFkwJoXxwmYwDwIoPr9t9Ki4zZ4hPH0bnvWqEzr4OoisM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791288307; c=relaxed/simple;
	bh=i0gcEP38ZVOMVeOSMKFi/SzbdX30XXrWdw+4/LPUCmE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Sa863dyc3DcQonj+OIKlUAzLAeiwpz6vCz9/W6Z33bFyN9UBgi8oN/cwaEWgCWi9J4mwUIF+hQSH0J4cZBqzo2gUkWUQesS0L+8R9qqC54ZLvmTDM/fkGjsnOq9+NH2J1A8PGtR2ov2OFvxiMT4cqYxlaIaKRvjIGObIzR8MwoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvVmL/8Q; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvVmL/8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791288306; x=1822824306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0gcEP38ZVOMVeOSMKFi/SzbdX30XXrWdw+4/LPUCmE=;
  b=kvVmL/8QEvQLpZyME04TlRiKqRItYa0mtLx4fUcDWpJJPp8wSXkJGe2P
   T01QtDkZj2OQWcJ7iyN3uhTRxYl9RhyaAQh4ys/h1zmvxU/GdZXvrzu4J
   09cgZWpLgqE+sDzEQWyJzO3QEVLbtZSntdMQ9Qz2mzF3ObuzkU57QnL5q
   t08l+rrE228oGUpFX8FTggkLbZs9tZqLL5aZC2buLDmT65S72plzLBoOM
   9cVz1K007b4w80brHOOAlU7H1LL7AzJ6ZNjmium4LwnWCdPBFj9ZgfkBS
   rauh6mw3VTFYw8TorvjaD7ZTUeNEg0msSIJxj4FD7BvpYVx6yExCYIJi2
   w==;
X-CSE-ConnectionGUID: B5Nmez7XRQKI0BkwjbC7Vw==
X-CSE-MsgGUID: CI+yrAV8T9WMUaovxowqiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="24613"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="24613"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:05:05 -0700
X-CSE-ConnectionGUID: 3MYMcJEEQu2XVJ8qctyo1Q==
X-CSE-MsgGUID: /pAVe+hJQvydZxK5Ooj5Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280421193"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:05:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:05:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 05:05:05 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:05:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEXD63SWW/jW1Bn0ffNSv+tNrWzSw0gkavIKWsLF+oG3QQADAC38hVYXBs3SPu5/Jvnz20H9si8mR0WQCJVDG51ssnvW+b8c34jSUXFzYag/pBPIz4CwMhltMx93l6xsrh8PvuAg2Xe/8lO3Y91U25KZi8bJXz6Kt8k5XJz24vDP1QljaxotFwrOcAGtcLRREhYtCsFIWVlPVCf/N5WBOAzGyk7boBbOb7W0hOdff8gtVuyoG4je+8X0F3IjgGrn+/D1dRddcWX8UAzDgP1vNPQG9cnXtb7bhLRQqUHMWrKvrqejfPbniSQaQQtbt9NUbjPLFC/n434aWa85T7FhMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ/fliopbgB39jPOLr0BeuVURxFv/j9zHNGSbDDMWEw=;
 b=m7pCPZ6qQb//BfC+PV2zlkEJQt5sqMu1ALdGAJ9OGOzH/Sgtu4xixfsIqeaD3qotzTReb7GHvttjZUTs/eTkRIozpf/D1rER7TSZ1tr8beyhN7FUjhgmskHsDMULUScYTI6IOETzABUd/1LLKeUZSc0WxggNcwzC+/C9dNLUGdqIRWv5OjubZZBTDKG9EE9wuiW+1yhUsBZvqWug0oFGbLjXyaNf63HgUZGfsJYJEBaPNSwS5E8viWeVkl/OPKPbg1hOvZ+EehXF6v0EWNVh2IwHvRAXK7oW5clT355Q+3chcfEE/YJJ47rm9YLJFOAUdbJ28Is93z1XdaLfnrLarw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 6 Oct
 2026 12:05:00 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:04:58 +0000
Date: Tue, 6 Oct 2026 20:04:51 +0800
From: kernel test robot <lkp@intel.com>
To: Adam Azuddin <azuddinadam@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/gpu/drm/tiny/ra8875.c:140:undefined reference to
 `of_get_videomode'
Message-ID: <asTj41dRbOhPUGqL@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0044.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::6)
 To DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d7c207-e3a4-495c-79fa-08df23a20b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: bT1H21+ynLMqD30OauRss/AzwqmpQoIieKXMPePW6HR60BgtLzhqdIstYfGBOviqp3i88B7+0vysgMzCUchNU4Vk2GGLK9KQjAh6i74NhAvMPkJG0+vM39W0G7fy63Gw9Daq4kD0joTksqQaUY4UXL106K9kASvUDm4udEl5suk782uDf+8ZBvI5Ry2QtJFRjav9aMMh4/l/yqLtICOa5hx0UInw+52IJv1MkHLC1hwUYXZe7aVsB94vomUluKA5ypKzyfY2yKMXj7Ub8RdHPQH20/7ZOcLloBJSBSnm08WnIIhX/m2zINbBvERKGMK/SsIw/Nz6Vq7789ndpHWudxX8NNJniZ2xuS2dRS/jNLZJahQfH3RAeG83phzLsJhU2DVVp/IXLqByCzZs8XIMnF22iPcVj4K6jkSzUHJbhLwauunN2Iy05GscyQq7uIcGQjA2NSEwCYsX7NdNkoU3as6/fW+DF/d7N060RkKgImzHC0O+v88eVeH2QkecXk7a4mfdv7MYvSD06iOU45vxyqAbSJX30Sgh7xlhMYyUNjbMiC/2n6oqv39UmNz9+PV8YtH7rCkx7O+kCK6EVY6K0YkT8BzVN01BvT5DtkTbwIgv/yQbwhsooTk5+ITPm9VA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YpGKHfeatilKtdpBUloKVTp5hFR3RChcSOC4WyeO3gnwSAuEBtm66MRT8zWe?=
 =?us-ascii?Q?l1B55qFeTmbxjAtILONVbjuIa7YXMyBiehKpCUq3ywD/tGHlOnTknTu4hpKO?=
 =?us-ascii?Q?R2FTJxK8G8HkTmRa+oSBFyet+Mm4KqKdqKRqsyMCfqEZQp5TnFwmH0Hm7X7W?=
 =?us-ascii?Q?3CTQUcP8EOPCsYfNSSnZjyIsVBG5J4rjLdVm+9V6JN3Smg6FDEWZcJoDGgGI?=
 =?us-ascii?Q?KYq/3MwTmoZprONWt4Gq5qBFe7Ht/vxuRd11vXf6P4RmoGsG9bYHDmCvEYHT?=
 =?us-ascii?Q?oybPwe0cjOQus4CDqGBB+IUXtguidUQGVRWUL1NXBU3laK3YTq1utcdP1LaP?=
 =?us-ascii?Q?alEqE660v+QY/0/Gbu1WrhXGAQsgv9H/k4yEVPO52YNxmAKbiS57q2ikr+nk?=
 =?us-ascii?Q?ME6Q2aviXL4sD/BULNePzCGAw1OgJGDjZjtn636K6hZvePgc3NXaHICfEUqT?=
 =?us-ascii?Q?eQf5rEfFuPjBGQmYbiZrmGzrmhaFYn7e16UiDSg82VxzZZeflE8fk2g4XUEL?=
 =?us-ascii?Q?jkD9P0h8TgMHYWmD3CvD4TfnFXl2aNMa1aVDb2BQ1N8iDJSO0MSIZHjraWlh?=
 =?us-ascii?Q?oh+6vOB830Z570do3eL9F7PakIlMgd3mVp8iXGVtWtwJH0BlED+IlGrdZ03H?=
 =?us-ascii?Q?A3D7VvLjzWo/AemTEYnioPxnyhWL0NyXMrOG065qjEsBGZyCdl4Fq+KPfp47?=
 =?us-ascii?Q?zmPOECPrfjVjIP5hjfQ9ahKC86/5bcQ1qqdJeJv17pfJXRYrNdu8uZRNTpJO?=
 =?us-ascii?Q?0KIH1Hr3UAJrLRQVi7dr8KEqS0ut3ybMve/zdgdbdmYEU/ymE0d/bc+wRSHl?=
 =?us-ascii?Q?jvoYNgf9uKXBpS4/YaudDKXWTCP6Y2KNhjUhcu38W5HYPaQQx44faT+JRIM9?=
 =?us-ascii?Q?vdjwfD+PSMmIOf31HR34EioT2WSvNU96ZMDO39ie7FUg+3My7+SZRFkvJEGX?=
 =?us-ascii?Q?zUSJkNuxRf+4U0nQDtHNkPz4HW24X5/BNtcaJtJ5tMHEx+554JrJXFsssfuZ?=
 =?us-ascii?Q?hmT9cdDpCiCQwiM8dQHNuctir+2WGFLQttQ7oGXJzMxtW2YMnh0cKD702PhX?=
 =?us-ascii?Q?f5HeMgZ1n2+HvprID8x5/aK9pnVjVQFuSpr17QZmVMLiVHMlqmMnh4V1fB9M?=
 =?us-ascii?Q?GajJrOvJYMFBR+AYsq7WavZ4Ch1k+fWvWP9bu8rWrr2DLb+YBWO+IpXR9dHr?=
 =?us-ascii?Q?NXmDRn1wQJqvH0rxvy5Sp+Xji5csOEExIzHA4E6LknXH1he1BvmkGL07h4A3?=
 =?us-ascii?Q?1PEqOrSe3VrG+I/JllWlq4EzDONlGnDRkOzLvSWu/3i3Ku0teCvC3B1kdUNE?=
 =?us-ascii?Q?k3UAzjQ+xqOkVKRwd8T49Kh+m0nh3vEnGXsnRxiEow0Qq859JDj7pwo1sCUm?=
 =?us-ascii?Q?yzunjvve1rAKXkoZc3YVa9j8UmR7UwjyftOuuPYRIimxfqdtgAEWxEx3jvR5?=
 =?us-ascii?Q?AmyFvWOGM8bM07Q4WG2G1CLxbKojrg7dTW1MnL1r+t1M99XNAM1/k5sblT5g?=
 =?us-ascii?Q?xr1QA07z9M+sdYdS0kt/J6hDvVNv/STit4lYb8jrrRW12TSBN6hjPgYhlAri?=
 =?us-ascii?Q?7l9f0DKiWulK8108Vg6OmhleQmB5I90FuWicn23dikHXloGS/rygZ5h6g/mr?=
 =?us-ascii?Q?1JEwkvXE19nJLqXqjY+30FjCPV60q/YrFUgr35E+E+ll6+SLbdnt/IcPK7Fz?=
 =?us-ascii?Q?53DsoswSHFkBPgVI1g1D3N/qabROv0gTrszKkjiv9iP8+1NnH2myibpwpqP8?=
 =?us-ascii?Q?TpJyEF8EOA=3D=3D?=
X-Exchange-RoutingPolicyChecked: QHTj7fdFyy1nuylG9JzNseM/7pV0+4S6zlprrj55WxfrD9EGsdefe6x1/3DoFeP8QfOQBaDan3+zMu5l+EbBMt7ScmjHsv9SAY3P+f6rAAnOXNSal6/E5QLSAhxHV5oVLKuUgrHyapab2fkiCrrQSSKF5LzlLLvYbVRPQKx5B0ubkgiZ3oza+S2pGmNSlP9e41kCW6T7yt3vRWEWREZU66S9ni+ywVn9EMgxrdmJG3zYf7DKuper+a42My1r4oeLeYAg1o2ScgHVyl1QDEi0JsFVPj8jJ4XAvHPTCKLry1V+jPgF8jAsuDnwgdpXzymzuXwup+ak0ynmYlBZo4RYsA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d7c207-e3a4-495c-79fa-08df23a20b12
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:04:58.8052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sC62CsR2Mm5MauaNk9tf9pbLliBu+jtYEYUUZw7CySIpHqmuy7nfE7HTgJV+3j5kvODV/KakWkAl5ygKb6T1Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Adam-Azuddin/dt-bindings-display-panel-Add-RAiO-RA8875-display-controller/20261001-224125
head:   9d03fa1e817a89924a845989503ebd78e0e6484e
commit: 9d03fa1e817a89924a845989503ebd78e0e6484e drm/tiny: Add RAiO RA8875 display controller driver
config: xtensa-randconfig-1000-20261003 (https://download.01.org/0day-ci/archive/20261004/202610042347.idGisdDW-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610042347.idGisdDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610042347.idGisdDW-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/gpu/drm/tiny/ra8875.o: in function `ra8875_connector_get_modes':
>> drivers/gpu/drm/tiny/ra8875.c:140:(.text+0x268): undefined reference to `of_get_videomode'
   xtensa-linux-ld: drivers/gpu/drm/tiny/ra8875.o: in function `ra8875_probe':
   drivers/gpu/drm/tiny/ra8875.c:614:(.text+0x3a2): undefined reference to `of_get_videomode'


vim +140 drivers/gpu/drm/tiny/ra8875.c

9d03fa1e817a89 Adam Azuddin 2026-10-01  133  
9d03fa1e817a89 Adam Azuddin 2026-10-01  134  static int ra8875_connector_get_modes(struct drm_connector *connector)
9d03fa1e817a89 Adam Azuddin 2026-10-01  135  {
9d03fa1e817a89 Adam Azuddin 2026-10-01  136  	struct ra8875_device *ra8875 =
9d03fa1e817a89 Adam Azuddin 2026-10-01  137  		container_of(connector, struct ra8875_device, connector);
9d03fa1e817a89 Adam Azuddin 2026-10-01  138  
9d03fa1e817a89 Adam Azuddin 2026-10-01  139  	return drm_connector_helper_get_modes_fixed(connector, &ra8875->mode);
9d03fa1e817a89 Adam Azuddin 2026-10-01 @140  }
9d03fa1e817a89 Adam Azuddin 2026-10-01  141  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

