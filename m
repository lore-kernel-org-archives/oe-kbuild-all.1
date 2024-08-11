Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BEF149C55
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 15:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723389417; cv=fail; b=BFR5NRy8hfajs/c0Tk/OyBVh85by9xs1EBqE4/EIvUYkHNWTrVXW3qjZJM/r2U/Gt0IHrJv2w0dWay9JFSeAxF63ZOSvkZHA4NNYVGnXuAuZOsRjgLWOcUQX3B3B5/6PurzGq01hN51kXNbX19EdF1PVcsh58fhwUVxTn9hamug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723389417; c=relaxed/simple;
	bh=lpbOYeKqP2VxkAiGJDtC+RfbF7RiqJAYRMZ+/n+XdZg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OIA2ZArNmkWFexAggPNLYIZCfGL9GAq4kKB4HP76nVFLUTTvbNTX1/LeamRqzxd7jP3jAHiwgYDOyIN8k7GOkd8IknUx9KbLtBccxDSNfMB28iBU9SXmKeA6mfbB5SeZOABqnsm/Y6kHfhnKGN0HlNuIGVkZr5OKrtXabhs9Weo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXLiHEvI; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXLiHEvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723389415; x=1754925415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lpbOYeKqP2VxkAiGJDtC+RfbF7RiqJAYRMZ+/n+XdZg=;
  b=jXLiHEvIhxE6vZfWHHceFTMDePtlUrFS81OiPHsWnnXAfTDJDsaAJfGA
   OTJB45bqCJ7hZsXCX4Cv2fyPdbf09h5ILZhJl0riL2R2pxD77ioVFWaNs
   dJcQU+rf/2nhH5wjRkQ0Ydh7zgBDK9MIFDmJik+dr1SPKVy+26MOX/jiW
   ojahuDs+NPcWWxbj2hpmCbhfBouCdHrpuL0vEs7Me0s8KyErKpK0GjhbS
   TLwG5rtPODwWwMX+p1PCFWVTQPnU0FdQh8J9j/tD7uIigLe5T8yqkE3Po
   GqCDH9mE0I4GjTeBwZI5C1DxxbDuGrYjCyLT76/SAXcy/RykAFjZpNwgJ
   A==;
X-CSE-ConnectionGUID: yX2o+mSiTCmdtrmRMw4/BQ==
X-CSE-MsgGUID: aqzyINWOTa2ABoWvUwIHDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="12954063"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="12954063"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 08:16:54 -0700
X-CSE-ConnectionGUID: R/gDg4GeQjqIhL+Ml4JlRA==
X-CSE-MsgGUID: 3z047wucQVKqHA739uA3Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="57689977"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Aug 2024 08:16:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 08:16:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 08:16:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 08:16:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 08:16:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E29eGOP1MaHCB3PN0cxVv8tRVQL5TrWDJ9SRtXRdP1p2yFeZ7TWvyDE3St+aN+NAvX+U15IO+wNt1u9gkML/oCQAz8hTsKmezVI6kR0dhrILK1hdU1lsN0zo5P/1NAMXVFioCthqT3MyL1EnVpBRJlmO6ypdYhrfEV6rgAuACtUyxJRL3xA/OpWuN1yk69EHOkzx5WSpYYAKJaLMe2vJLOPvzc+++63Sw9XfGfsz5ncZ9frFlFmzbzjYQ9spJUHZ8R2bXJfEAIApLTbUFwVrZf4CSQAoqQpJBOrBAvWiKGDbSUG5pFRt5r8OQG04UvLkiHG4shYdEhHS+LEa1Zdg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tw1io14QSsbSQYW/HkESbszTUsasRJdV7Hb22Qv+MdM=;
 b=IAP1Ga3o+P7ghrNvkY9AMOg4wv4E1gkdHGbACfxtjtdZxC4s9qDVxdvGOM9N3qysKDvU6WOMmYFR94kGj5VTf9grE0zjFMnMHRCQb77fe6e84TWYFGi7FJ7vxRq4i05Par1dwBsuhz1TD3c0X3MmWZc0MoDDtC6xDFl9qTMnkkEChdG+lgzBEvRlAXpJr5HYg5z0ufvXTQyb86zfY5bxEFZzL0mlegwgPiQ8eykEy2gEkjnCm3owhAs43vyMjQH7UpQeFN8eswQRyNDKy9MUUyWHLxjaAOXFXKNJq5S8VCZun8b7tp+ANQthRHzacTcuxRx9jrWKmlJXK+wyvUwmlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Sun, 11 Aug
 2024 15:16:49 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Sun, 11 Aug 2024
 15:16:49 +0000
Date: Sun, 11 Aug 2024 23:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.1.y 23/91]
 arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level'
 is a required property
Message-ID: <ZrjV2jhCBEgofGnf@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ef8852-c2cc-4818-919f-08dcba189ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bhgUHxYSm1Y1LwZRzLlqc4+kIHe7vuWx2tDLP2MDvkPESCh304KqPxitgerO?=
 =?us-ascii?Q?8JkvcOj49walmqVaPqa+7HNKT2LnPo3qfJSddR/qNR0MYSIr6xwo3OjsucqH?=
 =?us-ascii?Q?FeRD9htxPkV2QpMjpFC+d3UEfI0vJbjuD8tUbAgsOUw6CjAA3aw/vwRfDX9a?=
 =?us-ascii?Q?VJEn5gqkhxFCT+XhEZleaOKi06E6qu6Op2OGJGjBJS4KN5WTkWTzWC4iJhik?=
 =?us-ascii?Q?3N23swjnmwv0Jfs96MLIpq5pZdc8L1g04NV/4WtSwV/9CeIZcJdYeEzZj0Ie?=
 =?us-ascii?Q?mxoMk0FTF1pzN9R4P/1hvx0leVnJtY5CNdvImDY7ZrGAWeOaq3LTY0lByIMu?=
 =?us-ascii?Q?8ct4aZKPHvqi4uPF5ZbeSSfAjg0DuVE7vNtn2/+wJz/UDjNpcdGwus2K9FUq?=
 =?us-ascii?Q?rgjEK3yZU4be9Id/9a0fLIyvg6HCoSktN29/lwkuVbz4ityK+AlvBlBUstr/?=
 =?us-ascii?Q?hYlnBBEvk8W5CoEM8yhNr+hyGGfNAD19Ryg301PqlvWLokfIG0PVuqpmiWL9?=
 =?us-ascii?Q?BAuliCeEccSfkhy0RgPIIC3P1kizBD494J9iFJY0ZTsdraUVegPU+eW6AyHi?=
 =?us-ascii?Q?4F/RCZtBS3uLl3vY+rwbHWXal0BKxUyw5IoX/iPWHDEjmA0h4q7PUX1ekeIq?=
 =?us-ascii?Q?AAWqE7tMHGev2Qsv6C2aQAbZCb8OWGrIGJa5fY+1ytdvkUf2/6rAd8bOWU/e?=
 =?us-ascii?Q?88UNB9gB+mCeIjJtaIaPMPnuMleWJe6nuQoQQzTKwcsdiPnYTyRVzOJnSiuJ?=
 =?us-ascii?Q?KalW+wVrEG2IINJgY54TSqOWkonTFbVw2C62uLR1e2w6PO3rt5lNUd4pNNMT?=
 =?us-ascii?Q?cLDfh34StuIvKdwtueOd16tG4AQzGIpnsxm0YfEXlFgb1mis5FdKhzPqYmoT?=
 =?us-ascii?Q?apJQz5MciBjwJPGn7bP+auROZ6dhAbFMMU1xRnfek5spdsiS5wzhfu4g4yPG?=
 =?us-ascii?Q?ByVFRMKe2F4EgLlp91/uiu7TdHKdwYN7iRhH3lqQCQrIa1f6mXdl59mVKrQg?=
 =?us-ascii?Q?qC8GM8mvd15BIZ3mYB/NIvcghQwQnPTJa7VzsFOUxPGZikII6mtPAiIZtIlY?=
 =?us-ascii?Q?dOWVFbiGpj20q2K6vddWXCmAiFGIdd9Swaud/euz9vsa5dWxXTJxMatxTkHE?=
 =?us-ascii?Q?/PGF4deFl8tn+TFH7CtYaPK99uIEu8hNfpihYE9r/+dWEJuSqN79xyb5d8aE?=
 =?us-ascii?Q?bSbyhYMjpokPuAj1rW0xUOkRKeG/vWAW/2vBQaOaFLtQOLSAPKzPUwcuML/m?=
 =?us-ascii?Q?2QM8YPNkUyJBpB5JxQ2HGwQh0wGLRwdb56dzL6F05aQj/YibNejpKKjB6ND2?=
 =?us-ascii?Q?Mv4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k2ZR6ke4WnIlSHKxrDiBpY4ZYv9RlTZaxYfFqofJkQ2wU8mvt3c3ejVWpxKi?=
 =?us-ascii?Q?31KeMHynwDheP8wKKkOv+GFOevQpt3+NmQHWf/HVp+qBoy5OhEjizj2WodxK?=
 =?us-ascii?Q?75TWavFLQ1ACkoUWlXxx2bKweGOs/Btszh8REwzeV+zkyJgTuDaA8apoGWK0?=
 =?us-ascii?Q?fSriyoNP/al9Oa5bbs69NLlTEOlLJXjvJdveOJGnDHmIDzTwuBbiiumouksI?=
 =?us-ascii?Q?r2t4ej4K326WEHM3/pCCVOaKgmXpSC2I2ek8+wvG8Gh6uG6VQ/tigE10M5Rr?=
 =?us-ascii?Q?Vh2Na+fRKOJuuyzT63tOM3/M/VIvC86Qz6erV4HdTm1nLsCT0EEHHEqota+s?=
 =?us-ascii?Q?enwxjohQZtJ6GakKNwMTpY9WMvi+bzHpUvU2/gLszMfAwINPQQ/Glgp54kqJ?=
 =?us-ascii?Q?mbvSp/bGzNmpBM5TaFvkZzCUwHlZqnSrqGaSVUjUb1PcTb/nypKf8qcL9b53?=
 =?us-ascii?Q?33tbJjufkVKY9cWyKW0EychnRqyBjhd7G1c2nXRIP5fd9peQ0O2YaSeEszLz?=
 =?us-ascii?Q?QD8ILqL9nYVJLqlmv935pC7UM0UCE9H9X/Wot9O9F4gLIVc5/YciRwI/qoAu?=
 =?us-ascii?Q?qQ4+oxYb+nz1PqwzKm90+TzWDMMdOSDSUqM/A0e/GcL8yCcd7yWRcfeq4uoD?=
 =?us-ascii?Q?MNgg4H75whbtpD1RsnLaM5dKEBTda+/pQKR6KetzNtat7VJlPaAc29oT8jmY?=
 =?us-ascii?Q?vwKNdNbol3I68wzJpqqpKvnHcpl3gWhKJqY3p5avab6WwF8GT0CaZd+Tbpda?=
 =?us-ascii?Q?w30LxnJethWp53eN+8h9EvCZnM8heOKwRfqtaSsBHE4u6114IhFzvdIcAwdN?=
 =?us-ascii?Q?Hz9AHW2qShGtYSXHkJqgBkhPSOzIAephncmbPu3KmoIoUiZHFRxk+G0as3t1?=
 =?us-ascii?Q?6UeyL3pq/pLh8KoPse6Umuh3csgRJEDX2bzXZpqFZRMh3pp4wrYd8NqYSDLx?=
 =?us-ascii?Q?NAR9pRyhJx6qdE2ttd40T4MjLhgywdw9zH11yhXkjamQsitrRyM0gpxLdtnt?=
 =?us-ascii?Q?7BdjuZqmiqHfnx/6Utl96bLfGJEJ5b5x363MqxSvaHEeOhtZcFhVSsSGghmT?=
 =?us-ascii?Q?ldsEkJ1c2HOUPSJ3vEe8y1eyUXjFBXK+PyoBipVVNRq0Q/x4lCkGRsCgCKYN?=
 =?us-ascii?Q?+tB3qsLdsPRda4dfyflOFsI9eRkS9kxU5J3mgmGAKahUjoHysCe4ethT4Zud?=
 =?us-ascii?Q?NeiZM5kYZWNiVo2SGlOo7vGQwoDJfSkdEMSFcTNQsX6QBwdf/y4H8LTdwakl?=
 =?us-ascii?Q?0li9kHYEw/s49UhOEAsmeA9YqNpv4noHBcBb6SyIiUhzOCZcdUdio1J0kIpf?=
 =?us-ascii?Q?gMajXSyat/AyfPHJPUbnFCco52lWzG5Ee6XE502h7x5+Oy9RseD7ICwSROQN?=
 =?us-ascii?Q?N+5h2z74+Qp4fj0M3x9ZXl0hC+Jz3FahmaYMhaK159qqyJvFwU+Ly+Wtt4LF?=
 =?us-ascii?Q?yPyz1QT4ZGIvdcRtA2jKNrjWF0Xb2rK7fNlpDzB8gWhvL7xYz44hPPOzCmrH?=
 =?us-ascii?Q?EQT83qWuidYXdZHdJVP0qHEk4miga/+PAJ3zsJoaiWNLELYStM+PhZVAohEt?=
 =?us-ascii?Q?YnKusBhU9seOwXC6LY4gemT3Ew4MX1ZldyYVJWjMYDuOK+mTdaUesPdQPCd1?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ef8852-c2cc-4818-919f-08dcba189ee7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2024 15:16:49.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8hSribLJRJMGfgzn+jCiYMoCMHR917Sfsxjz6DEC+vhVj5Q7vR9Tqk0JgbvbEnWTu4oXulIAJhYlmgTxS6vdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   2a5f985c90ffd8f4e2de3a2fd76f00c3e322aa6f
commit: 5e5c31f1c11458aabfa51021f3e0319bb051330e [23/91] ODROID-C2: arm64/dts: add 'meson64_odroidc2.dts' for compability
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240811/202408111926.kpiEbWCi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111926.kpiEbWCi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408111926.kpiEbWCi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:252.29-257.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:534.15-537.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-719.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:534.15-537.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-719.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /firmware/secure-monitor: failed to match any schema with compatible: ['amlogic,meson-gx-sm', 'amlogic,meson-gxbb-sm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /firmware/secure-monitor: failed to match any schema with compatible: ['amlogic,meson-gx-sm', 'amlogic,meson-gxbb-sm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /efuse: failed to match any schema with compatible: ['amlogic,meson-gx-efuse', 'amlogic,meson-gxbb-efuse']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /efuse: failed to match any schema with compatible: ['amlogic,meson-gx-efuse', 'amlogic,meson-gxbb-efuse']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: scpi: clocks: 'scpi_clocks@0' does not match any of the regexes: '^clocks-[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scpi.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/interrupt-controller@9880: failed to match any schema with compatible: ['amlogic,meson-gpio-intc', 'amlogic,meson-gxbb-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/interrupt-controller@9880: failed to match any schema with compatible: ['amlogic,meson-gpio-intc', 'amlogic,meson-gxbb-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8550: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8550: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8650: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8650: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@86c0: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@86c0: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/clock-measure@8758: failed to match any schema with compatible: ['amlogic,meson-gx-clk-measure']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0: failed to match any schema with compatible: ['amlogic,meson-gx-ao-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0/clock-controller: failed to match any schema with compatible: ['amlogic,meson-gxbb-aoclkc', 'amlogic,meson-gx-aoclkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0/clock-controller: failed to match any schema with compatible: ['amlogic,meson-gxbb-aoclkc', 'amlogic,meson-gx-aoclkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pwm@550: failed to match any schema with compatible: ['amlogic,meson-gx-ao-pwm', 'amlogic,meson-gxbb-ao-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pwm@550: failed to match any schema with compatible: ['amlogic,meson-gx-ao-pwm', 'amlogic,meson-gxbb-ao-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/ir@580: failed to match any schema with compatible: ['amlogic,meson-gx-ir', 'amlogic,meson-gxbb-ir']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/ir@580: failed to match any schema with compatible: ['amlogic,meson-gx-ir', 'amlogic,meson-gxbb-ir']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pinctrl@14: failed to match any schema with compatible: ['amlogic,meson-gxbb-aobus-pinctrl']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: bus@c8834000: rng: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8834000/pinctrl@4b0: failed to match any schema with compatible: ['amlogic,meson-gxbb-periphs-pinctrl']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c883c000/system-controller@0: failed to match any schema with compatible: ['amlogic,meson-gx-hhi-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c883c000/system-controller@0/clock-controller: failed to match any schema with compatible: ['amlogic,gxbb-clkc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@70000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@70000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@72000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@72000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@74000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@74000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-0:sound-dai: [[57], [0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-1:sound-dai: [[57], [0], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-1:codec-0:sound-dai: [[57], [1], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-2:sound-dai: [[57], [1], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^dai-link-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

