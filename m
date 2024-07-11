Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7C015AF1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 03:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720669005; cv=fail; b=ibdfTDug06K9bmyclkx1xIUkSREu23WqKQavJNqOQl4G3NrJRuyHaN7NKNogQ2vXlw53QBjJjwbmtzFda+Xy/2Dm0HzTPk0GQwZBB5lT+5Z7p+RMfPAvBu3dvcnyCNid4brpUlYWjdGlbDdyiUvvtVdN7zdKhGqVY4T83r76PdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720669005; c=relaxed/simple;
	bh=gBRGbJIvnf6VfnqSbJ7f5knpVP29IKrycbsoElthZ0g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WeJN7DWZgrX2RqNLVRNVK7eWPZglJohPtAZ4gwO85pfXbAesiT5i26vwCC5Yp2d7GozGOlxHuh8rjYMItneY7YbbrHWJZR+Jn+MwAhjMqI+IMnhogMyS+hQukge9QZ8IbH93wGPLQadcsGxJXTr+AoLmmfSzoS+Hgkh2eYhO5Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwvbUfxJ; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwvbUfxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720669004; x=1752205004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gBRGbJIvnf6VfnqSbJ7f5knpVP29IKrycbsoElthZ0g=;
  b=cwvbUfxJSdlgZOLppun7U/a4XLqqDnYbiDTp3d+eaQsXuEPusRKmiLBV
   OD9NcLh6xsURSIY5lo4bbsMjR150PtgiGZ3vNRYajzfwh1UjUZT7U+jTi
   k+AdV1BQ0f0M9ASxOPJy/6mYi91RDksnU5cHrrjMAPAhWjdI9vA8fN6Rd
   gkomsXvSwYqKHW6DdOO1BnHhcR/IYyiSVwaHJbyy0kZJlk8ObIQcSJujp
   1ozlBlvs4duxMNowCFiPS2JyG/BFnf17jFUnhN2Le9b5rdQ6cUjfG487C
   /P4mXXmaay70y5poSrtYb85SGSLaP+wRAVcnkeyOFKRdckEA0UaEbGoDu
   w==;
X-CSE-ConnectionGUID: 80vUdX2ZR0CSOGr8t7vSaw==
X-CSE-MsgGUID: oXNTwUKLTPqTRrekr2S9tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18162028"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="18162028"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:36:43 -0700
X-CSE-ConnectionGUID: DTkCwRPpTSC3w59ImWAvPA==
X-CSE-MsgGUID: J8aBrrt7SmG7xDpaeyvd2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48180910"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 20:36:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:36:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:36:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 20:36:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 20:36:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPnlr+Ar0Nx4rkv71kVRGBD0KMzwWFRCsws55iTkHepM7B3ALU3y8lPwMMo6Xaebl4hWKNuKoEPZ2xpDz4xAVJcZj6DAD0Y4S5coOVSgd2N6kuFsGms3iu5d7MSsRn1ra9tjh7MaPS6iUONUDPUQ3JBares+m97Uz9MetYkE/+l2a3eiCw/FBJX6BZdh4OgAJrvMJSsEK/QvHjo2Ks4saXqf77nq4eZCYhIPtTxjp/r21wMVGdQd3COc81JD2Hdg7wI0XFERfRAH3ZQT0u7ybDcwGt5M6jkydRUUmftmyzjd6pfM/0WZQXY2PpQ99vl2UnMgTNO5OdO3fflqBi7gmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YazF6M6xzEHhVTCl5qsICdyvesajEXMk6irLSEJhKc=;
 b=gTd8DLw+UKXM7BQDulonhEeymYv9axPZQefyucrm4Q8+B+7pVUGJFuGvqlj+d/vgXOkd1YmYRNV2Ks70URoo4arVyiTswuBKDQERP+TzaSIN87H35rWN/izX6Ypq5Zzj/EFRd98RWeXavZO2+1SifjnaLQsM2q5RwjJhppquftOw/9r4LAOjTysSW2BLOJYibgslkMXhwDZn3siSJS0AuAdQiVCRyBwGm80YpuQeQpwSUPvHbQcsG5F7ucFCgWPK+WkPM7l8bmorEEji3m9umwFvuaRiPQRRVCG3HFCAMpRzirnm7WvBGb9TASzB7PYWlP/60rR7kpD0rNxcOPnPpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 03:36:35 +0000
Received: from PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d]) by PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 03:36:35 +0000
Date: Thu, 11 Jul 2024 11:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:6.6-2.0.x-imx 10984/11381]
 Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml:55:7:
 [error] no new line character at the end of file (new-line-at-end-of-file)
Message-ID: <Zo9TO8kv9Ax/z/qu@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
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
X-MS-Office365-Filtering-Correlation-Id: 79f9ef7b-1bd4-4c1b-a054-08dca15aaa04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FE08P5sYEpAb2KrTD893DC+M0jcqy9+cMxcF7i0qckZqguXt454WX0LmNz+w?=
 =?us-ascii?Q?jRQTtlJGlZoot/jJ39CG0A8la1+rllpKcp7GkUIsc8b6JnCVtHfePSJyWLXb?=
 =?us-ascii?Q?D0xKSQsJMWkqe3Qy6FM7pzGfAviu0kXZ50WYU1kEnGvgXhpV+AbzjUq8kFfC?=
 =?us-ascii?Q?u4deLrj65kP86HXIxqxho/Jw4V/uTMSGMq9m9IgxjgYIcvLCHM0sCNVySGkj?=
 =?us-ascii?Q?Rk2rh2YXQ3u9YeuyyGFC7ggFhAzxjFPZVJQpLphNitT1tnPP4rOY3FacFduj?=
 =?us-ascii?Q?s+f6TL+GHfqJnpQ5E6ATyHwBDbO/09HJbNwqgxDco3kqnuxIHyKhXFfJ35zS?=
 =?us-ascii?Q?GBGHR1Wia0fTWH7B7Ca5A89gkPMxrHpVfMQ5z2cjQHrEbhdKqEVozMK0A+xN?=
 =?us-ascii?Q?Ii3H0ehxT77KDXsBoVOcIiTfOkyYNVynnlOdIc/Ho5LBkdPJ4GMX2E9/rulc?=
 =?us-ascii?Q?5+9MaR1yi98LvV+5QCKf+NyKADb6JeFYSg/5DWS7v+rrDPU1WnQumrG3QAPB?=
 =?us-ascii?Q?ioXMgXpXgD5Z4VHciQTLqCcRM5d0Fgu35nab8oknHTLfRSmxi0HsUYLA7yDk?=
 =?us-ascii?Q?U5IycZSZ27xJLCik5NTFBfPzzvGb7osIy6fRfAhF/0lmTArdxKIxNsh9mQxs?=
 =?us-ascii?Q?lNAaO0goPJS4V9I7GJcLRkg8cjlfdxhzd3uck83Qk9WOpgxQNQaHRZFKQ9P5?=
 =?us-ascii?Q?Nb8p9+cSmZEBYt04TZ4ja37NPtH1UzHqLMSw4xsno4tu8m5Oz2bql/HDvXHf?=
 =?us-ascii?Q?oc2+iZOIf+MplmUzXBQuPmX4HOk56SyXJuBSB4npiwHo1TR18J0cdfQPYbOB?=
 =?us-ascii?Q?hGpVmM6b2TAQalK+3LW8N32wz/XpI4CwfHZLmgqNOvEHl/13aYhjxPXUNMrw?=
 =?us-ascii?Q?7QXWLEJibEZvHIRL0ERtKhyLqFHT1Ayt3Pe5JhWsGznMhFdTj6stmASbGHTe?=
 =?us-ascii?Q?BoRt2NITkbUok9KgJB70mbONLU+1Yh1Lqe2IUAjfcJMIN7S0v+A5sAu/RArz?=
 =?us-ascii?Q?N08wSWiL0UHdjRNziOTywNzNJu3SBsn2Su3tNvIqV7hdg2VWhwI1QiKdE6T8?=
 =?us-ascii?Q?5nzcUMKmupJStj/CRB1LN0YdcviDD4JpDyUWVan6UvYLj9jovK0biNwvB48p?=
 =?us-ascii?Q?W+IWmKfWxQ0zZpyN2ALaVhn28aDeCuXRNodAF+X3L7GWjWgdxFsH7HVIcMuK?=
 =?us-ascii?Q?SN0YoJjPBAPwywi31HomOH/+P3rr9rOcKqnZcRV/mRW6f94fHxW2+TS4vACv?=
 =?us-ascii?Q?hr0BhvtDE0uXGS+KQjXOvCS2M21u3LRUR+GTNU/VpeknGlfsFTpOp84WbMBu?=
 =?us-ascii?Q?bYA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i7Iwt+jS3xZ2mLikzWZMizem0aHVeANN0l3tGCRgK5VZbnUl1j1lRB1LEqm+?=
 =?us-ascii?Q?t4qKIofZ0ShsG+BQQ514WVxoBEWWGudRYCHkuthAdPOJGDqjNkYeb5GBPOtS?=
 =?us-ascii?Q?/oNazidu/2eUgHpfgGubQpT3UQKeEEW4qUQhNAdIMVM9RflxMofmyT4lQqPx?=
 =?us-ascii?Q?5bxlQCbLinL2TZ2xa8l8HQ2ckNPDQa9i3O7qrQHM/IftdXvTY9zFydsWnpFB?=
 =?us-ascii?Q?CiU+Eg0aR2tJOPdJH/IrD3Aj+nMZBXUYaNKDDlopLCLeZ5dv/k73Awmij2Az?=
 =?us-ascii?Q?31y2oHkUjo61p/9Kj0dXxgDeh2u1VJiOEsZsd9xexLH6ZnW01Ez9D0uCmfEm?=
 =?us-ascii?Q?O6z87ESV99dmSZ40MqWT9Ppv2ROilgRsKYzSQlmY3n/FaPD9sNESyJeJNyp+?=
 =?us-ascii?Q?QkEP8+ifju0ViTbWJOeYPSvfQoJI8YScO59FUt1bTYXIcRTbqbQzMFXc9WZM?=
 =?us-ascii?Q?DK/2jpIh4uxKBIZyX4Bkr7mNlhb+vQ1pujvL2971OJyVzbEGx1mBqg3EwSt7?=
 =?us-ascii?Q?XpgeYijWpGeFq2j6rpZmsRtMptQkG+V48g5nCUkbfN/kQDwzRyPE3Mq1YEpG?=
 =?us-ascii?Q?603vqYI80QVbIsGXVJ6r4oytOiUVdsCL62yuG25+Yan50ArIcJd7COdcNhux?=
 =?us-ascii?Q?iWsxCYPEXBt7tiLxnj2RJau4e0jn3AYb7dvko4kE+6i3uH/3YJY9dVjyJhqH?=
 =?us-ascii?Q?JsGbP57uHNUdpEPFxpLcnhTYB6KGwVJIzfePAEBrXmfSrOBAaco+S6Im/zwz?=
 =?us-ascii?Q?y25WqasjgYbxx0lv79mPgi/uFVoee+2sO7VhBYcUWu6s9/mELRnnPtQR6kif?=
 =?us-ascii?Q?a6eF5rCs97XSWf31ds5A0bvqY4a6l1zoQ6zP/AhI/alxR63fZEG6CTku0nt+?=
 =?us-ascii?Q?Uc8FNGZir+tlWt32e7tpJyJX/49tbgjGxB/WuzEoGdA0s8NKsgE5JZzHI5EA?=
 =?us-ascii?Q?NmM+Ful+TlsP3rxMoqdkzLDslUxyQs07NpwYbeqLiDRpgJDkfZg0IJ7s9LMp?=
 =?us-ascii?Q?eotS9m6BZl6IixsEagkQfHVHm+VsOjgHQM6tvSkdcwtuwHt7gA36T2VdDf3j?=
 =?us-ascii?Q?UgrFE1mNeojtc8v1XL6q/xQBXhFUmPIYIoyhd5jA2fXUHaOHtfhWJnhJOMVl?=
 =?us-ascii?Q?UupzqLYZyqJw9vFjBZwvnUKgsRbDRyRAJpSxGqhO+4PEyWuUAZaOdX4b1CwI?=
 =?us-ascii?Q?gGoXYBE5KTNU0aiCUEywojIzVLWK1pG77HWWkToQwExhJEPe1/nYpWDw4re0?=
 =?us-ascii?Q?wic60cYXvhDheyBgkJW93xF2NmUm4AbjRPq4M4xRRauekqzZt0DC5W4rjnjD?=
 =?us-ascii?Q?zHcjR40c20TmDRvuXZuT0lEyoC3cVZjziOKq2zw1gFLlxKwu27N5YHfD9AZF?=
 =?us-ascii?Q?j/6tVpF7SSFa56p+AB20tcxIrePqnN7T9LcHa08/zvqVkJh41gdh1Q5YQ4O2?=
 =?us-ascii?Q?w8kP5WSn7mEaD7bIgefn54w0XpL+0ImKggnmuwt10mE9ily3pILVK/H2GwOW?=
 =?us-ascii?Q?pLEsnWkc5JHjI6zn7Yl5VbWm754ZSUs91TuoPFelyntJw9vwhfBs5ZbyazQf?=
 =?us-ascii?Q?WLwieJGkpD7OUya0einDQSDptN6RaZopvxMuS00m9FChsv/JX4lqJMNATgxN?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f9ef7b-1bd4-4c1b-a054-08dca15aaa04
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 03:36:35.4283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC4xm8JvnRE/BORnK6A0dwooSZTfzHrN/0UP1opSnXACMaDNoyZZ1IUpBfaCAOeRpvsF2lhbJ2Y1m72zdBVs+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ee366aa641d84d61e265cd4f571394aa4e7d4e6d
commit: 97c48f97ddd6c52c9b348f183171c51c1f8caa60 [10984/11381] LF-11524-4: dt-bindings: touchscreen: Convert FTS touchscreen to json-schema
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110546.mYeeQTYf-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110546.mYeeQTYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110546.mYeeQTYf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:21:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:22:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:23:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:24:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:67:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:75:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:83:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:127:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:62:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:76:14: [warning] wrong indentation: expected 14 but found 13 (indentation)
>> Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml:55:7: [error] no new line character at the end of file (new-line-at-end-of-file)
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

vim +55 Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml

97c48f97ddd6c5 Carlos Song 2024-03-11  31  
97c48f97ddd6c5 Carlos Song 2024-03-11  32  required:
97c48f97ddd6c5 Carlos Song 2024-03-11  33    - compatible
97c48f97ddd6c5 Carlos Song 2024-03-11  34    - reg
97c48f97ddd6c5 Carlos Song 2024-03-11  35    - irq-gpio
97c48f97ddd6c5 Carlos Song 2024-03-11  36    - max-touch-number
97c48f97ddd6c5 Carlos Song 2024-03-11  37    - touchscreen-size-x
97c48f97ddd6c5 Carlos Song 2024-03-11  38    - touchscreen-size-y
97c48f97ddd6c5 Carlos Song 2024-03-11  39  
97c48f97ddd6c5 Carlos Song 2024-03-11  40  examples:
97c48f97ddd6c5 Carlos Song 2024-03-11  41    - |
97c48f97ddd6c5 Carlos Song 2024-03-11  42      &i2c {
97c48f97ddd6c5 Carlos Song 2024-03-11  43        #address-cells = <1>;
97c48f97ddd6c5 Carlos Song 2024-03-11  44        #size-cells = <0>;
97c48f97ddd6c5 Carlos Song 2024-03-11  45        clock-frequency = <400000>;
97c48f97ddd6c5 Carlos Song 2024-03-11  46  
97c48f97ddd6c5 Carlos Song 2024-03-11  47        focaltech_touch: focaltech@38 {
97c48f97ddd6c5 Carlos Song 2024-03-11  48          compatible = "focaltech,fts";
97c48f97ddd6c5 Carlos Song 2024-03-11  49          reg = <0x38>;
97c48f97ddd6c5 Carlos Song 2024-03-11  50          irq-gpio = <&gpio3 27 GPIO_ACTIVE_HIGH>;
97c48f97ddd6c5 Carlos Song 2024-03-11  51          touchscreen-size-x = <1080>;
97c48f97ddd6c5 Carlos Song 2024-03-11  52          touchscreen-size-y = <1920>;
97c48f97ddd6c5 Carlos Song 2024-03-11  53          max-touch-number = <10>;
97c48f97ddd6c5 Carlos Song 2024-03-11  54        };
97c48f97ddd6c5 Carlos Song 2024-03-11 @55      };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

