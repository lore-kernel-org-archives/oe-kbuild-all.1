Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF2A16419
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 03:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720668969; cv=fail; b=AqhUc3zFrZxxu1lPIqSV47xHUycJyFGl4EbeaBzYRr8L/I2ioXrgL/weCm/nCjZVU9IbM3V1NZOTGMvOC4nfk4LQlA4cu2+5PeyNfV+Pep3qsZDlm+DmsbOVNszgU+3mobTp5aj+JeLEfRrx2gHiVrwDH71dOnb333429JBxcTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720668969; c=relaxed/simple;
	bh=K0jMapG0tD0KAmHeRwPGSyZdsJ3YK139/A3VV/FHbNE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=c/zcjPz+Rl8rD0iTycg8m6yLm/K20qrZQI7db42B8l2oPE+wzRz5wmVoSLQkjIJLDbjNe8ThLen7immHNWWN0ingNhj/0swl1a6LzXmM/LptcUz0HmnDHAZPasnybG/4oWorPfOmET3gXMv6XXBOSOQ6oNlgGYhfQDAJIEYWz9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvH8BnfL; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvH8BnfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720668967; x=1752204967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K0jMapG0tD0KAmHeRwPGSyZdsJ3YK139/A3VV/FHbNE=;
  b=YvH8BnfLcEof6QtLHYleXsxJ2VifZOs+Igk4Fe3+VZYZw46V/933Qi5Q
   wOOin34ewecHBJCJfwS7j0CEd4KgwC/Tett6dBOi5UHlPxX5VnwMcgXZg
   5wRDYaqY5Z/nBRc7Lh9Ssei9ghho/bMBMd7cN6FPOVtagCOX/gsgeSukA
   fD2fG/IeDIKd+GGipwOQmE3NmTxKiBK55IwbrjS2Njco6XZY1NLYnNMV8
   JNUDaW5O5dBdWFEuTIsaNxIidBkG9g+vZBg2aIBuzCT0KpSOYMF0UFpaF
   EMrHf3c9zZ1sUZW5H2Aay/olcfHglmI38BWy1OZEjb92aFEnQry74T4EP
   w==;
X-CSE-ConnectionGUID: vJVeHgGQQye20rYpvtyAXw==
X-CSE-MsgGUID: SwZNezPRSLeDyyPLLmQ/BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17974853"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17974853"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:36:06 -0700
X-CSE-ConnectionGUID: 14rl4ESgRPCDDKT6jn+AfA==
X-CSE-MsgGUID: IIvtCeHkSy+97ZSQ+vJVUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="71643322"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 20:36:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:36:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 20:36:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 20:36:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaGQeFtvyaSqEUJdj8rcWDQj3Ygn8cmDYBpol0Z1czul65S13OK+Ydhj5/8N0U1EjlOkP7tbnDgL3KALAb5qHBHJyiHhc1jim6ZiulF2iSLk0AqqIDiow8z0EojyeIgxv9NCSBkX7UzpcV+S7SAax6bH4fCjd5SAZ98LJnLseym4pCncImUgPwU+Ldge46dTpgpkUOsVpZ+tzFAdzW2m9sihT93qJS/O8H5u/EcEBxMcD5mvSlqYazq7KyDJ9TSHyyuRIl0jvxck8SyDC5ThL5GS2wTHaPyRG1jIvobb4SmjTraIJ+2LAJbA4GuLlTKjmxdxFg3DhUD8bfOl3c6VIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCKvDggF7/aRyh1p0+QmMI6EDX50P2y9Y4I6DSIBlAw=;
 b=goLTEE1d/GmvMUPMzmzApFwtdlUzJgNbQOD/k5sanFZ2OH9/7hV1e9mnlrha8iwi55C6AwPeXmAlqmoZF5W3Xz5KPnYSAlCmmSByGlLLTgnGn3hOcslXjuzfkih2gEO2wnVA4JfNrwJveFhqJW2R2pCBZsRO44KdEjMN1/7Z4SXjj8ah4ZIgZDcKxf+dy9IKD5UiB+6/NAnbzLOXQFgte+mbROYcn+56W84iDlO9m7P/XSwJs59KaOA7xYBeaU9nidwXjcA/KVeIlIRLlkMFfDqDCQq2xUEgjLEySUa2HfS3X++a8giq5aORCyvps6honiVTBHcHUBS8meL18KMT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 03:35:58 +0000
Received: from PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d]) by PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 03:35:58 +0000
Date: Thu, 11 Jul 2024 11:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:6.6-1.0.x-imx 3473/11740]
 Documentation/devicetree/bindings/phy/fsl,imx8mp-lvds-phy.yaml: port@0:
 Missing additionalProperties/unevaluatedProperties constraint
Message-ID: <Zo9TF//MRU8eauoF@rli9-mobl>
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
X-MS-Office365-Filtering-Correlation-Id: 15cb793d-2d62-4e73-ddc6-08dca15a940c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XBVZyq1FthlEV3xFQmbTpJHnvBVhSwlqihxAx/xPoPKx5c5YgKOtEVxEzPyF?=
 =?us-ascii?Q?T1TIikNoIZmaweQb/jp3sRDQa1Hb6sPH5sOxbyOgeeIXdX0nbAtukK/C0ogO?=
 =?us-ascii?Q?Hq+/0LmCTRYmtnctgqag9QdMZdhjMPsc8mc0dcTh9IO59O8euJUKJVe+8tMv?=
 =?us-ascii?Q?Mz46QdwRXaFNz3kOck8R5AQm0QQ3fE1iiZMqnO5+3tc7h1YbRQoNVlkBe2sW?=
 =?us-ascii?Q?BDnbvVgl1rMlY7d4J2WL+efWfoish+M8oTmlq8GJ58x3Dj4Nip1iAhvm9b5c?=
 =?us-ascii?Q?QSyoB1OpCdzpISEyqIytjPErscoSlyPNgiGz3yviQEhcU22MdoRuCiqC9KVs?=
 =?us-ascii?Q?h3FYEIENKA1Pl9m0iQIExyf8d6n2D5HyD0qRdGTjVvSkHUZJ5/HdjV5lCSXq?=
 =?us-ascii?Q?OvwOxwfXcmzXrToEym+Ou1KimVfRo+zwCSu4kVFyuU9zY8IlrRxpcHZh4YoI?=
 =?us-ascii?Q?eAVtKoXeuGBOKAG0LbfjXyVVtpyGQzSI7gvSj8/CASRA75nfXFMXnFlvQdZO?=
 =?us-ascii?Q?iyj2oYf7u6XnZHJqi9YgDa+Vy0ZpUBxpYZE/299T/uqoSPchnp8UpUApl+oP?=
 =?us-ascii?Q?h8ZWI2xaihhEwNE0AFCOFxPNp5B/OndmkQ6QoVdfL8ZiSt3/NBUH3lQYOte4?=
 =?us-ascii?Q?0I2yjiCGIojrygh5ty9GEox50ih/2SuRWzHI/v2zCglp6GgsPCmEABi0fZ/B?=
 =?us-ascii?Q?RcJ8netnjL5JaX73Goo3HA+CNLsZ2Vb0riaJN0t2Vtk0IodltcgvVdDs28KP?=
 =?us-ascii?Q?xlJyf50GGH80zJm96DLtdGuimj/CXO5LxC9kag82oS3PJiCan7vmhR7bHUNk?=
 =?us-ascii?Q?u6SysySukXJG8Mv64DMYBOGVX18lvmPfjbtFBnNIkoDx+DmBVDIHDyBi3pjD?=
 =?us-ascii?Q?rFSJ2wtq4uiCKroH4pvICD6Kb6gEi8bAQZsh/Tynhvoy0kewBOv6k8A6P940?=
 =?us-ascii?Q?+03zfY+W1GrtiYVbMZYlcFd4kZad71/BlJRT8p8kb4Em7bq1o6Yr/Q4q29rR?=
 =?us-ascii?Q?ZdA2OgZaBJVIcS7RcSAzhuF3xT5vg04Cpir4NF3urgde8wvdLfuvwk/BZ/ta?=
 =?us-ascii?Q?JQ0dhI1+2yOdwEqjcIv+evgxOKek6lxozt1x6dtOTeUyi6TE5F41oRt+dJJD?=
 =?us-ascii?Q?Uyulbn3JbvUtsYrIR24+DxogOGtDaiaihvGPzDRDZuSwpunvEyLTIONiG4uB?=
 =?us-ascii?Q?0O9XI8DOgOiGKa/XlOcb69MrEMryuBKsZJi6w/IP6xGMm5yKg4FbhWz5tPGV?=
 =?us-ascii?Q?87vf1QLGg+CIdqtWajSbx1IIfUhZCFe9SrHIGOyYvbcg6RHrSgUuSIsTiOLu?=
 =?us-ascii?Q?1Y+bJ5Rzcc8m+UH3BUSrpFNp+u2k2e8ybR41AUtUjcIuxNYpLeGxF1pD6LrP?=
 =?us-ascii?Q?xH1GYDk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sh4PBx5xafkpwYD03aT+eGCcYWOicnTIbuFiKxHRAiNq+JYhZcLz4T1AfTCN?=
 =?us-ascii?Q?hgij7YwpVwwRCYUduvLGJ/gbprkBnvX1cOCykYyfJkYgoPEgO6yIzBPgaX6G?=
 =?us-ascii?Q?EYlsPFoEsSy9di9pWRqhXKOtVcaVaSnh0bMzoIDo4CFluVbGlfwewl5eRsZM?=
 =?us-ascii?Q?hsLhY3a+lTwt9SDd6YTAEdUsFOFSIqgO1+7r9rD11bh4I6lp7f5qGpkqTsOR?=
 =?us-ascii?Q?1cotD76VtdGZIkzy0aJjHXZAy1KXgZmtxf2l7GyLEQEE430cyh6krjFdXLwP?=
 =?us-ascii?Q?8RKykRjucR5cwWg21Y5N+lXg8GOsL4eNh1aNoe5UE4dYTDfiBtd3wVYxBqJ8?=
 =?us-ascii?Q?6lmzieO/VB0bsdLvEh9U9fqHD473gkSmYgKj1rjiadcnHdk9TQh07xgNrMwu?=
 =?us-ascii?Q?NyqwSQy6eBO/cVsorFaiVxNUpQRtYfmP2VIJ7+17A8wxUxmUJpDBQ0ctSQqW?=
 =?us-ascii?Q?gqGRh6ziFsvkcN6F66t6KkfpF+Acghs5Vteug6OYm8ahKz53e2VP2TqlkxjK?=
 =?us-ascii?Q?EbzUX75zwhNHVKF2H3kWAWZF0UUa67bB5l9akAFl2GR2L+cWAZy0ArEoOp7R?=
 =?us-ascii?Q?/3WdDQtQ0OkNdcDEYzXhQoL5795BpW+pSciSdM9uB5tantrESVUJ5kxP6juH?=
 =?us-ascii?Q?M+fzPh1L3o4i9D+GBaIqOBaBRT+SqJ6ywHpTkf3lqAbbUgqc+Szu02zVEKEq?=
 =?us-ascii?Q?U1GQipUfraCvRaraNm71albOK0+pNaD3oA8hYr5Q7cWsm5/4//vZf3/6FFCk?=
 =?us-ascii?Q?BS4tpY6os4J/VzEE6Cz+vwEaqWXgoqlMzaHyHoQIHkWC10jTnrv/4HSdJsmY?=
 =?us-ascii?Q?37PEytV7q/2cCtQiPGs5i/vrlfnkxyJQjM3KSmi60sVCntIXdmoVf03tDuHZ?=
 =?us-ascii?Q?unyMp+kcFm+/KzqpYo3PiS8Z4yrXHGsVeHAh2cETe4qc+WPrPJmbbRKPQzkb?=
 =?us-ascii?Q?S0RwcwtrEQfLn1E05nYXZO5J5yHe3C2SR3Q7/SEMuQGbDOvdxaEWNl59rjBc?=
 =?us-ascii?Q?qZ8BZzUuoJ8nRsz/RzoOczyfkkeneZBxv95BvxMk8eVrUK7HqmAincZogXSz?=
 =?us-ascii?Q?8py0f7QiKbRHPiQGEIUjjFGKIqaADKLwbVHRbCx6laBkcsjI7t85IoT73SAH?=
 =?us-ascii?Q?KqnuXmHhcP/yCzvqqIpUkIsAf1GbZZPuIpbdQ+Lp4GEQnIe46cgZHw0WRzni?=
 =?us-ascii?Q?YgFxhVAqXkcQTLPIzMY/VvUa3MkyiTv+JNejw1QutTogi+cnURtuv03B59tc?=
 =?us-ascii?Q?PM45TtBgkc63t94JH+Vh0XHD6/StOngwRpjXgzuDFEKOnVBXFuiulwDWMId7?=
 =?us-ascii?Q?UyMUTfKtYQ7Coolr+qHEMHAmDs31+eWY0qxA8MWALt5yPbFCmaP3mswArQ5v?=
 =?us-ascii?Q?iHmg0Y0Pf+7jRwg6d1EndLlBQdg6WNVmnkz7CLuv3Eptiz0+WcBqkqABlr3O?=
 =?us-ascii?Q?IwodHx3cjT4m+qTNRUqnsS8cd5cEJsH6QNFm9ppfLOuiLp7Wdqr8tkYdSkuF?=
 =?us-ascii?Q?qWIQAij+lLPpM/BABYUk98jlpEFSIQ6CaldvXhyxadO60phP9lRED58iKUyL?=
 =?us-ascii?Q?arCWRqxsWWVxcuHfVQVkh+F394+32ydPeoclmoEDkBxRD+ZO5s2aBQC/2UiO?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cb793d-2d62-4e73-ddc6-08dca15a940c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 03:35:58.5161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljinFmWm+K/+hJSYEHgkvzZq6U4TqrE1B4cNZCAQ576kEt9C/+urv24svXkzql1mnP2VchWKzeOvyh1LWCFNVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   13ed4e83694299049a3d4449fdb61471292ef19b
commit: 1deece590adeda0de30270d217597a921831f853 [3473/11740] MLK-23252-5 dt-bindings: phy: Add binding for Freescale i.MX8mp LVDS PHY
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: csky-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110359.6EPJ9ANz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110359.6EPJ9ANz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110359.6EPJ9ANz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/phy/fsl,imx8mp-lvds-phy.yaml: title: 'Freescale i.MX8MP LVDS PHY Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/phy/fsl,imx8mp-lvds-phy.yaml: port@0: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

