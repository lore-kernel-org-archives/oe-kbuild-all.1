Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A255A171AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 03:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720669056; cv=fail; b=WpdqtVgUcwMnGYDA7J68+FEq6uQmiPuJyxaxPV4k2h2rTuKUpEFVtJorH/tXM3HNSKUgVD5NwZavk0+aApDpVfbnF2vr/x7+P79U4aF2dSv++kZEQxHFXxUzctlOuobBGv8bf0iGICUnfG8PYf7Y1to4kK0zcRnvPRoYoz4L3Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720669056; c=relaxed/simple;
	bh=pNXV8hkhX/K516fyTxkTki4MucqO/wHcvZp7WnQ+jzM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FyQMQdT/Nxwq9Bv3D2GoNN+hDPycyjHK2uJWUGafuKn4bVXkFd0rMdqMTAvPfmbSz7KIiKJz39TECxy1Z4juw70oE15gZTrsRQ+oaDYDNTx2wUECZCinJ93NCG/k76tvYOt+TlBHL+E2O3mk9ir18BPxgwMm1bl7o8iiLqeMDmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fn8PU75X; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fn8PU75X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720669055; x=1752205055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pNXV8hkhX/K516fyTxkTki4MucqO/wHcvZp7WnQ+jzM=;
  b=Fn8PU75Xv2GOqz0AI6j2d+u+gkAQRaiEDSMBsT/GlMFDzlhIJANznSiL
   iPvA5LzSn0KFqfNYmtWzoEc5K7/w++EllNx5FypLtmKb/Bm9kJ4MGb1sj
   NIRM29I6OmO+Np0AfmOsAIEEgkkXTEe/S+nDTaOaAo8KSrrawG7eLOwVO
   Pyi5ZyB9rTFxSxkrKJnUnlNiwsCpz0mVvYms108cDCBwmNg2W57v3uCxT
   MQMKU6pJAf6G/rhnm7EJEwq7EucfGTYNac1i5oggClz0PgPx0vSsyT++7
   rdBnHgTNQBhzzFSRcnQLAS2CcLFi9SGE+I0LSzVC+MuZo0LuQ/cA1m7/z
   A==;
X-CSE-ConnectionGUID: l6WRX7/nQc+0M7AtFF9AQQ==
X-CSE-MsgGUID: 8l2u9IicTMKEOKXYFtTD7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="20939184"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="20939184"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:37:34 -0700
X-CSE-ConnectionGUID: QdfrOFmNRMmmnQcJxhKmJQ==
X-CSE-MsgGUID: SkI6GTikRnWOXAX9qLdq/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48421959"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 20:37:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:37:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:37:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 20:37:33 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 20:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tg9TA2uShzEN2qsBayAydZA81Eld0EHt4j7DD5ZAlejWXDDx8ZyYUwSHRzU+zkQWR3mDygukccYSEVgE1bzEUPRj2tjOg1VMBRI2N3fQSe/HwlXoYe7wkhbe5un4Ue6QksTMO6SJ6YEi5FMXR2/D7gtibb/wpJCMHQ7i4xy9EqPtpi1GJYt/q3lDLXwUvxMmLPMDE61ZvK4HhFMzCXTJKAB133/zYYAy8tJMGib/Geo2we9xfIaSHTTrVEsOEUDeSnt2HjLtk7Mu9r6Yfjnl+aZ8jL2lFtP1ZD4LqAaNJCGKfD44tVLHl93mfJi4fOwesvaZwnxMUeciiaZV1NMstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpllRe2KsHw7VH2Xtu5XFjPsi1q6wbzcR27pCTTBeSo=;
 b=j7xZuyO9W0MghdFDJo0lpQwK8UL3aX+ebUIapDVTCfu20fV+zOsZllrguR/TNTlY27eC3TpJap+1iaSn9g2rpv6AhUwX79VE6XAh0KIX+sBI/X8Et5tkkinSa53JA/2duFlb264ZJH5nL8jZHxbtErXa/1EAJ0mwBS5g2kJXqUK7pk1iBu3tzlruMqifOEmu0zeSSer3OYAremJzoHqvG5MfH6clULRjEz6BqqBNIYxcZVTrifV0d9KIJjiNmfIkkFQw1SxEMp8TAaFpTqP1iN07Q/V+x8Wwfn7pO+FVldO7HxYjZSlZHb7EXUBL7oaoT+GfECpK/70HkU5B6WKUPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 03:37:30 +0000
Received: from PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d]) by PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 03:37:30 +0000
Date: Thu, 11 Jul 2024 11:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:6.6-2.0.x-imx 10988/11381]
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml:85:1: [error]
 syntax error: found character '\t' that cannot start any token (syntax)
Message-ID: <Zo9TdBojYMXm3Qj8@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6029:EE_|CY5PR11MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b1523a-9114-452b-c3d5-08dca15acabd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VOqYR5PnETQuG0bfUUwIuijlFabcVZenR0sTsSn+fon+SHONAUBolLwKnc0G?=
 =?us-ascii?Q?k7fKpWMFrXTW5XCmI396C6zbr5GI9rNOPouHyZv2UTT/Ss70XPH4Eej0dywW?=
 =?us-ascii?Q?pNrat+7QxoL8JSeLOEaWgOGReoy0sfxZAk569DoqMQWbAmNaBDKNzN+86QDA?=
 =?us-ascii?Q?KSRuQ1j38wqbKfC09rIh/8D/aI9JkoMqOcxbPs38PPvo1z7bototatijL8s0?=
 =?us-ascii?Q?GVVpmuNe4fFfv0YRC1VT87atm1nUgpHfW3ocFUvWINXsD1DhUtHy7TJHbrbt?=
 =?us-ascii?Q?TgwxFvsQhU7cgqgw95K84H2M/G2ScEbYjh8c78i3tqJIGf5Hji31fIPJN1p+?=
 =?us-ascii?Q?LQKAE91OIVnnpOSCkjA/rXxiWGUAiDyDa6iFuXrzGvyV1yw2IYoKObIrsYdb?=
 =?us-ascii?Q?Fuf1N20SsfykMq1troVEqbD/PgIDuJx9JijeBOx94Ko9dYkoVuPhOPluKX8R?=
 =?us-ascii?Q?ALHFL2AVkBV6uyamtyOgVUO/i4M9yjAvrBtNZMoi5RJMNa3YtpU36JO0kpoW?=
 =?us-ascii?Q?nUUK6QfCi2zSo6EbnlLeAN2R9n0MRCvWOws/NXqgZDlqMphyoKV2vU6Cb+cp?=
 =?us-ascii?Q?QCx6da+wmjgICgCykvyxTRgwFrIm6kIdl0+mpxwYg6LTCSjPmsb3ATBc8KOD?=
 =?us-ascii?Q?IcDYk2feTTmvqceqgJc6n8LwKTqqb6F9BPfHaHjpTkI7mn4Y4//IDZ3J/o7I?=
 =?us-ascii?Q?1qppMl8hQBcA3Yz3foZQAjrMrtB728yXI5TE7PQlHGef87Mm+BoNqtZIxZqn?=
 =?us-ascii?Q?kSm4VsTs3QEkLeTh7iUt69K5yBJTZ1HTlBg93s304X9Y6jSezwlbV2T/aMCL?=
 =?us-ascii?Q?WCggMMMpgzooOeG/rDmPYyOPd2oKAv+pG7i5by0VHeBozUpfjhjdrbRe/HSa?=
 =?us-ascii?Q?PS8fPLCPdi35CLL4zQLJZCga0JNcWVqv+bKJPipwEf1zMXY0jZfWqIfr7pkq?=
 =?us-ascii?Q?EZhPZ8GuLch4t3NCjIlWz05QcH10s60pKoGjgLTD+cLGqJHUolGe+r6pm+S3?=
 =?us-ascii?Q?W0OhpkJ412S4jwBR+HI+/SfC3stFqZT1rE2XEADDhi0u9yXdNE4NBNWODy/Z?=
 =?us-ascii?Q?LJHVsFtTAYt2A5svybb7HynfMg/dGTRJ3UCwlosuumgJuNhAKUpxJlyZVdZo?=
 =?us-ascii?Q?oJ/Bdsg0cwrqmFWwFTarSQJjS7IoNJSjbdxfO7JzTGZreoswD4Kse7FIkDVn?=
 =?us-ascii?Q?6pOx6LAhsz5rMSWFW4CJO18W06MPYyrk1ohHTiAqulXAAN8Gk8iKI6gkOdmM?=
 =?us-ascii?Q?GG8VfYQm+AOjDID91F7G615O5V5DesODn9b6cV1P/wFcpp/QHjgDBxPJPsjs?=
 =?us-ascii?Q?kLA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GfK6B9nbAax980I+eUSvi36BAW9RUIm2QK6HlRb7sLspOWzCe9QX26Tan67q?=
 =?us-ascii?Q?cfgeLvRDLmHtpZegpVmQJXS07IeUiFuHxXekhVGsMRLGztEe3NJVskBBQwIN?=
 =?us-ascii?Q?LyVqvmbeBQWilfBgzDqmN9lUp9ER+HG6ihfsTreJ5gzGdyIAWooY2WRbZqTU?=
 =?us-ascii?Q?1bTHEuPfpZWC1g0afcpjIKp66+2duxSnRS27rm2D1hR3gaUuNR00Yo22zYtP?=
 =?us-ascii?Q?gDfIVqJMdQELUOT1jFPaSI+i42l/qW94oqufAHWzHV1cmfknzFKK+1OeAllU?=
 =?us-ascii?Q?M+xsR9JWXoXnvlI1Vdemye7Ky2RdMsCYZ0KuvTtazFRumR4/Su2WGzGZsU1/?=
 =?us-ascii?Q?fQRsX0zXqCnoHIkr/qmlWDBIy0jr1rHqOVD6RyJIkRUmvTSi/RyVLm9qEuYR?=
 =?us-ascii?Q?KJDp4xoHMgxXdry9QhMFTpyOi3qbOKRT7Uzanwcl4+vu+ytEfQ9sREgbspUy?=
 =?us-ascii?Q?wZqcwDmszjfAgjVFlOO6uUM+ogLqiP9qIQeWl3NuwPqT0PFuqcd4gQ5BTljP?=
 =?us-ascii?Q?DwVY+PuOsRtXcr33xEo2igq2GBP9Tpw4hZuqDZiAQHf7Iu/DT/sytKmLoCX2?=
 =?us-ascii?Q?dRgUlMwLpDzW82vUG/2+Sd7mj6roYPrlxTCPrfTY840KKnJ9dZL3HdSDxf6l?=
 =?us-ascii?Q?p4Q4hJzGGFTAfFfBf/py6WcfZfZGlwRz7QyX9Vg7vj+20a3fyd0e+U5pxnfQ?=
 =?us-ascii?Q?A5an8MGH5ud3O5K1iwZ6s6sfr6w4MyjYzj+Mmd1FyljtUUppt74CjmJ8fBHF?=
 =?us-ascii?Q?XohoInqILNBZ78RIh0s97pfB4IkhnBcaHqQt+7V1e36WHqYRlWRiqf3KobG7?=
 =?us-ascii?Q?oztfOlVD+RonzVriddk5SHy89ZHe+GLprf9nxn0DhlYLB1teMe28ZM6SPp+3?=
 =?us-ascii?Q?VdCeg/3LG1hTMfYgMiJYSmGXubI2Tdy39n+W1xdCYwDpeZ2EwIqFbsmIgo03?=
 =?us-ascii?Q?C8xS7IJufB/qkYi21NK59pqZvrWGK9Lc3Lf/MtcVWhzC6VwHa+JO7hx8R+ef?=
 =?us-ascii?Q?keRGzl9h0Zf4wauQuJS7hjWou9eFSMEtDuDxFd2c2idsYWu0oXUQocJ2CZA8?=
 =?us-ascii?Q?UsmRgQ44w9ZWt0CUpOqoiFM5ly2bX9S2ETOgRJhiCsa6ssgfKXqYrRjnZuGa?=
 =?us-ascii?Q?z+DrDFFuUJ0QUtIJsJaC9VALlXSYJLn9OSxR/YMD6x63KURv6NCimhHQXvau?=
 =?us-ascii?Q?/0posqtvbtw8Im01aCQmDbxYZlvmv3QBIsPw20hvsGt8SjAjOfT/TxQ19Qin?=
 =?us-ascii?Q?miOPXlV64SHAD+RqkfxR93q/Rq8TwPHTdbOAumxh8KwcilLT+7HqVB++dLUz?=
 =?us-ascii?Q?2/SR9g894dsP3fkvcuGpeYAmHdlO9EXsxbUr91JRe0H8JVHp/09khBxcMUSV?=
 =?us-ascii?Q?O6SHta/ooPLZ6mhAP3ZJmYoK8PWa+o+Kqq28kDKKeiWZ7A8Ae/ETG69ak3As?=
 =?us-ascii?Q?ANPlz8K//loI2cYY/DM4lpl8fGmzX/wbnEnynKWlfKCRjfrftCXjqhanPd9r?=
 =?us-ascii?Q?D+jjnMEXMpg2W0ezjli2Y+hMXfdv/oZ20u1nq3/3dgXhDHR3b1bRoLLfg01F?=
 =?us-ascii?Q?bnbmLvBnvYPT9nOnLBEiZfz51McU0RqhGD3vZIVIMgkcb2/Y4kFuk9VUO3Kx?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b1523a-9114-452b-c3d5-08dca15acabd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 03:37:30.2872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvhL7byTE4qm3kBegCWx+q0VoDEMO4RheZ6kfy2nI+Wn6ZcW/XRvfI1FFs2/wI+PvPXIStDNWauK5KX3SZ6b/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ee366aa641d84d61e265cd4f571394aa4e7d4e6d
commit: 01857629f4043ca54bb4b1a6e860fb69017e4d35 [10988/11381] LF-11850-1: dt-bindings: i2c: i2c-imx-lpi2c: add slave node
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110600.KKLKMT8D-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110600.KKLKMT8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110600.KKLKMT8D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:258:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:259:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml:14:1: [error] syntax error: could not find expected ':' (syntax)
   Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml:68:21: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:62:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:76:14: [warning] wrong indentation: expected 14 but found 13 (indentation)
   Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml:55:7: [error] no new line character at the end of file (new-line-at-end-of-file)
   Documentation/devicetree/bindings/mfd/nxp,imx-flexio.yaml:44:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml:65:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml:115:13: [error] syntax error: mapping values are not allowed here (syntax)
>> Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml:85:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:18: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:20: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:22: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:18: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:20: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:22: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:24: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:26: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:28: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:30: [warning] too few spaces after comma (commas)
--
>> Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml:85:1: found a tab character where an indentation space is expected
   Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml: ^(DCDC_REG[1-4]|LDO_REG[1-3])$: Missing additionalProperties/unevaluatedProperties constraint
--
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml: ignoring, error parsing file
>> Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/phy/fsl,samsung-hdmi-phy.yaml: ignoring, error in schema: properties: clock-names
   Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml: ignoring, error in schema: properties: out-default: description
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml: ignoring, error parsing file
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'

vim +85 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml

c217cf8136c5c3 Anson Huang         2020-06-04  69  
c217cf8136c5c3 Anson Huang         2020-06-04  70  examples:
c217cf8136c5c3 Anson Huang         2020-06-04  71    - |
c217cf8136c5c3 Anson Huang         2020-06-04  72      #include <dt-bindings/clock/imx7ulp-clock.h>
c217cf8136c5c3 Anson Huang         2020-06-04  73      #include <dt-bindings/interrupt-controller/arm-gic.h>
01857629f4043c Carlos Song         2024-04-02  74      #include <dt-bindings/i2c/i2c.h>
c217cf8136c5c3 Anson Huang         2020-06-04  75  
41c38c272e2cc0 Krzysztof Kozlowski 2020-09-17  76      i2c@40a50000 {
c217cf8136c5c3 Anson Huang         2020-06-04  77          compatible = "fsl,imx7ulp-lpi2c";
c217cf8136c5c3 Anson Huang         2020-06-04  78          reg = <0x40A50000 0x10000>;
c217cf8136c5c3 Anson Huang         2020-06-04  79          interrupt-parent = <&intc>;
c217cf8136c5c3 Anson Huang         2020-06-04  80          interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
c04c2819dc3d88 Peng Fan            2022-08-23  81          clocks = <&clks IMX7ULP_CLK_LPI2C7>,
c04c2819dc3d88 Peng Fan            2022-08-23  82                   <&clks IMX7ULP_CLK_NIC1_BUS_DIV>;
01857629f4043c Carlos Song         2024-04-02  83  
01857629f4043c Carlos Song         2024-04-02  84          eeprom@64 {
01857629f4043c Carlos Song         2024-04-02 @85  		      compatible = "linux,slave-24c02";

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

