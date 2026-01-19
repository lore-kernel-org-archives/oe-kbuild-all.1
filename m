Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0903378D77
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835969; cv=fail; b=iX+FMgvfTiVt+cjVPsCrjim3RoyV6Rx2nD4ZdIBHtEiMMndH4TVWid33hgT/3WZLqYcrwkvCqPhDEpe1QNsVx8b/aFShXI4RMv5yZsqHKFgV22ukqTdQeJJU+7EqKh+e7SvuazOcoaCIvlf6/Vwl/lGj+sIx9VVd6pkTVQJhk8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835969; c=relaxed/simple;
	bh=LU4cOFh8oJ2mTPcNztdlEPkewJCFG2ZT7LcJGRfXUVw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=g1niSXe3AU6GdAIvfluoGaBTQ+pqyvjFqVM1pxRgP+HJ6Rau3+gmV8KCZlUoaaOk5+8bfou1EuMCh64K7Zegu3b6Z5mbHoF/8Td6/pp9UNUfSWxvITLy0bbW/KQa5Mf1r9YCDlGFVyBB7rurjeA8LoFpx6cxvNbZbO5XYYIvx7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDGA8sFl; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDGA8sFl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768835967; x=1800371967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LU4cOFh8oJ2mTPcNztdlEPkewJCFG2ZT7LcJGRfXUVw=;
  b=EDGA8sFlAlCmEzQfpfIEnsj2cHuFH3C8DesgZHlvCjqwg+jjfkL0k90E
   aD/PME5exgY/VUiYXMYCOCUjH2YpQAca7NOcFt4ASuPbD3y2k0fNnp8ty
   hB9OJJPN8+qAOMpeV6qZXZlgXrptqglRhXrmEDRo0QvX0nKnQhWFaF3HU
   g8pdzA0Iq8N41N2n4UqQQPgmRMEKq1C472bEfe5b0dypB48tv5ce9l2VK
   Us72Qtav39iQsaf00un3UKSifq+WF/JRL4pwi+C4muwQCLd9iX45P3ZxG
   V4es4PE16+c41L8sCh8l7VnO9QmtBu4AGFkZjBIar9XA9jqmIPLRYb0qe
   g==;
X-CSE-ConnectionGUID: m9jL11HoRcajUWyZO1iMsw==
X-CSE-MsgGUID: DFC0hhuzQAqw3XXHWr/jLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57601911"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="57601911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 07:19:26 -0800
X-CSE-ConnectionGUID: zYv9vw0gRNKDnvkpMICbOw==
X-CSE-MsgGUID: N6GtGqESSUSPZcxEQYYflA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="243473953"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 07:19:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 07:19:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 07:19:25 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 07:19:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBeml8h5P2MWRZrzZhIo1Aa3wnGBb2PEmIS+SCpK3vRiI95m+frgAF/TGQ36TVG6QDj/e6dVzWFi5lOPXMgB0qIKNpk2A96lg4iTIH2zqs8wPja0sBeUp0T8mpj5Sg5DnetFvDE5/wkQI81BToHDRraL9v+rTBl4y6M84BUpPJB9Scb7KTLJ8Q0RKv3C4cqsmloeQbikJ5zWaK/ZRG0XFWDjn8WG/8QhEw906aJ0PPX8cgLV+CjQGjfje8E7w01/SQuc0B8Bi1rUsudu9jgSwnwWvAJ3Xf3KqnL+HpZ2t5JGEK7Fi6HC8DaYvyTEPHJtr4DAqgjUz91oJJQvvzQVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiop3DM4OX4KVsfs14DaldsSFC+a53EO3feC5EuauFA=;
 b=KYHIvQs6Z0hbB5jytgLS8Rh/jZbdTVNhtGo/rRlj84D9t0UWMSM0JiaJfwXX4DdOfIKKZ60wVjD7ASdPqaoRIn3HuEpEnh96j4FpBxBj+9HR4tfJeJ1zLGSeJLCZjKpSYHb7U9jHdBHu00gQ3MN/87TVTrdNBEUtUmlD/V6HXyy3dbVPAZYMS/V60WWdrSJLCMJmpjsFZJeX7CBNdRIIlf2lq7Fi7KzmcxlfI9stKQ/qQiZopGQlRpWQzfp3GvNtLQJVG5hknypYGwF17kDSvuI41ek+H4rBFvxAd6L3CODzjSeXiMtKUMGvisTKfExezeHQ8iyeG+KYFsgcfs1dXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DS4PPFA92F35354.namprd11.prod.outlook.com (2603:10b6:f:fc02::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 15:19:18 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 15:19:17 +0000
Date: Mon, 19 Jan 2026 23:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [hch-xfs:xfs-buf-hash 4/4] include/linux/lockdep.h:413:52: error:
 unknown type name 'lock_cmp_fn'
Message-ID: <aW5LbrCnfziIZwtX@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DS4PPFA92F35354:EE_
X-MS-Office365-Filtering-Correlation-Id: 049a007f-33c3-465b-6b76-08de576e1ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|18082099003|7142099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KLIRCrB7N6ggzJZwqGb8pqedPGlIHPwjfZVZbwhO/jr7OUr/mnqHw/UEzzEf?=
 =?us-ascii?Q?+4JShlqhUf0OSn30hYT90oc9kn4EIyrbmBqi/ltOED+AZYGJIXqJua1BNWTM?=
 =?us-ascii?Q?rYNLhSLGcUasZ99to87F+GeDpPFQjhro8S2IGZOvO37Pk7eMvJVkMoKyfaf5?=
 =?us-ascii?Q?PIn9DTthJQTygyfTI8j5hKd6nPOOl2iytRl7dIJipV6dlbINqYDcpWkjTiKS?=
 =?us-ascii?Q?LudHp2EEd4FWFcad++Q8o7BHm+Txg9rreI5KCUrxxBFulbJGEri4gJM5gZXT?=
 =?us-ascii?Q?jLhlFJGD92PYxVEKQqxC7gkmb9JSrCZclCS11G3R3WNH248euEHj69VFfKHO?=
 =?us-ascii?Q?6Q+8I12hV9RMjUA+3rhSHPB3fptPMd2A8IC8HzXCXP39m8kt6qA9+/waYd+U?=
 =?us-ascii?Q?xfwjV9YT70diGP0dL54cGvVpnzVf75l+7uW2iJg5l7+SVslT+Pr3a2cqo7+g?=
 =?us-ascii?Q?K7Lx+G7ZfalXGB5ZUsDIwG9zPiZahTKENayVv6Hz9grewt8T01qYfiZCgtwG?=
 =?us-ascii?Q?y041KHbFV38v4yrwI48J4BBHfBIRSHNljTpq0/XIxr48GejixvcjlQDfbgtk?=
 =?us-ascii?Q?BdT4IgqJTHdhF+Plc3mTPhYv8MkEMgowdvpIV/FWcHGB/h31fYXZbXB89/3U?=
 =?us-ascii?Q?rNQQnbrMaAtbXlCEBFA9BM1AEUfGnRBtg3AyF5p4FyV85uvyGy6b65gAebNG?=
 =?us-ascii?Q?uGw63QwQYPPeDCK0H2fAeWr1KYbugFOkXaq07ALSum9W1tJZ6X8JLxF/hkhY?=
 =?us-ascii?Q?C+KSSgSUawSuB5Cv711AFoZFtOynomMaUpUs5M1iRJSNqQ5NcsFDP/QhIJM5?=
 =?us-ascii?Q?iGxhr8jCcCj/5DOja+ISwoxhENKiC/C97TuM5wk6UGymCDw0MLNx5bUIZNAZ?=
 =?us-ascii?Q?ZEARVk9mMp8tFxAgzrI571qbzL+tqc3yvgfqFCLJTpLdwP5Wb0xShvOhxDjm?=
 =?us-ascii?Q?0rNlwXkyVPs9XXJ7F43cLOsPoj+puMsJVzT82kJU4Nt7eqsjV44jARvr20yj?=
 =?us-ascii?Q?XXpifstUhkwB7yGNPMLYgU7lki79FpdbENh0lFblASm+7AgVKEnuMF8e5Mtm?=
 =?us-ascii?Q?lN1fiaE+cBXjJjdPin0B4lxrENve6+SEnADDuNgpqm46eIjE8n2sdmpbk+E5?=
 =?us-ascii?Q?PNrVWSeDiN8DWRyKSny/B2lGgJkqNb34K2wMc7EsAP5bwa6oGTB3Na8fL8K9?=
 =?us-ascii?Q?8watzA6gOM/So//xtkD2MTq8Mf6CsFRXF1qOsYWSeGnLCvwcT1UGvEyW76cv?=
 =?us-ascii?Q?tndZT0JLP1Tx/KxhWNRNrYoLY4Nd28No6WHo9nkZxPCBzWJkl+vqT6HydkCE?=
 =?us-ascii?Q?err1SpIyPA1zPy0AEF4Bhg42PUO56EF4eajhK6CnDqw921yAGb40VJ9Uuyyy?=
 =?us-ascii?Q?gJasIpIY5MYhpsce+bqTF3KQwHJeVXiBlIxUQq0xvU9ex0wjDT0Ob+6E6GXN?=
 =?us-ascii?Q?j2ieIAk14Ylkl57s5b5nl88SiDgIONARbQgvBu1Miao23a3/hViR53T0oypP?=
 =?us-ascii?Q?EUomrqgl3vWvDPKs8B7Delqkf0PNGetkHGX9SFI9rEIaqEetnjc694gcrdsX?=
 =?us-ascii?Q?J8jLWsuZv4+4/9Nzuwc5NVSmQrAw+DG1ys7lLMSR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18082099003)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vs9jNJf7Ce8FiwV9MTWjKo16+cF54O9AW2orWrtORgRHF339DosqsnnjvoNn?=
 =?us-ascii?Q?17/Mm3VTY3+Sahf1CzdC7yBg8kxRP8LFRDVFGDuWI63zqFyUyBw2IWPxDMGC?=
 =?us-ascii?Q?/HfcKJ0XeykCQ/KF/+JVzZ7zAmKNR8R/NVBAwGG9SLfj4brhvCVAxmPRa+QQ?=
 =?us-ascii?Q?GwuLtGjwAxym4u7hx2u4I03dPOOuCrsn2lajZty0drCjyHzXl06AMaQfxZ9O?=
 =?us-ascii?Q?1Qky9mhMyH23fs7X0FAyTKvC97jULSEt/w32dhAS8+qT9Po7bXn3csuq13jU?=
 =?us-ascii?Q?US47Yk3vWnwSdCzlNci0YmZOrQMcmeC7UiHBwR+AgdudllFEmpWB0svNHqI2?=
 =?us-ascii?Q?Bban5DxReS/lbOdJH/zgdZyu+afkRSTMNhIQRi8Ot3rktDy1l143eyqK/NAC?=
 =?us-ascii?Q?euYZiQDn+i4jhNYigLsjaoSk2CCB/OwnlcyStROgLvPdVg38aGEUmJYU3WeW?=
 =?us-ascii?Q?/KinCzmfRU7mOQh/2wg4APHh67eCnFn4YWESKM8gWeWRLQDpoLcwXpWASjh+?=
 =?us-ascii?Q?8XPTlZJXJoCuTrAEOkk7QHkR5uOw5JgG8Bh2L/6Q1B1tmimNKXYB4PFybGK1?=
 =?us-ascii?Q?A1ufQI9BSnlpkB6sif7uHrNn/PZOFr2rxWnxOmv84f30tyHSRIPMlpX25R1z?=
 =?us-ascii?Q?zJMiq3vd/ca5FupJTTq5ZYg1HioYWRau6TZLT9Cj1QDg/2BrVxnf1gZrdV9c?=
 =?us-ascii?Q?XmGDC3Q77sEoZr5gHjNIhJq70V1s4Nmfk7H6iCnNzYe5ye7uV0qTLKRMCLIX?=
 =?us-ascii?Q?2A7saXiWc3cma5U8GMnqVpxCme5ZfuYYz4OrIbB/EBmcty6jtwwLRZ1xLhpr?=
 =?us-ascii?Q?va3AoW/JdDI+BRSgYao9ag1Yk0cQvNLmueSw+VHyhWJW2uqJv8EAyWbSKiWD?=
 =?us-ascii?Q?78cn7at0cDXmyUbFqo6F/HuZofbkl7oWWDQPG6DBeyDsCNUtOoZS1HRbJYoF?=
 =?us-ascii?Q?WHWPzNcvu2JmNb82WZZqToXTZE+9BjuFOUrG/5X6QR6+1m1jTU8dXEkaoPaZ?=
 =?us-ascii?Q?9qK6MDRMVJkXkQaOhHbU8jIY4JGA0qHTP7fJqgL17ChA72Xy0DoPkk908Wng?=
 =?us-ascii?Q?sNJqxKJjx2r4H5RbYTvWkNJXP93jG2GauLhEkSJQNzZBH7K26XiTqMfXHOVi?=
 =?us-ascii?Q?x4UVTL7RptUBbdME+sXgCEdnX57Jkwyj0lM4FvtcCuePPETvmiPVig4BidPB?=
 =?us-ascii?Q?j4lQezNB5v+DEeuetOnBuQd05vWcYBnjXlDcx1i6voncAAJOeTjtA+VJWSSJ?=
 =?us-ascii?Q?1ByETUvIrb2M9LWr5hd7sGtau2fogtJ58fbkzdUnNV4g8S59as5HlJmMC/s8?=
 =?us-ascii?Q?7nz8AvAneRXjPzhn+Q0UncYQcsiv+4HIfO8svPYPGKaaeeom1c+fQ8fxj3tv?=
 =?us-ascii?Q?KDqehZLgU3X4kTjT8UHyHBs5v7L6N+VxqDKuqrlBzpEWKq+6mQgeYz3GrXc3?=
 =?us-ascii?Q?rr92eo5Wgozix0AkZNA1Y4MWuzwE5T5MT9Nk2tFq5MTcYjRu+2B0QcInJAQE?=
 =?us-ascii?Q?WCxjLt+Kk6tgtzFlFdzfTB9VvRfI6WMxnoLIle9iX4fzt0HiKgMUEnRWNnB+?=
 =?us-ascii?Q?SYdOr6rPZ715O+DS8Myox5Yuy6Sq4jGLuWxYDH5hSVDtjx6pif7RIgGbjjYk?=
 =?us-ascii?Q?c6njJc+OZy9eMMT3avVnhMssrV0yrOA/rL81mF9r+mxzuuVBBFdqRzIDRPEt?=
 =?us-ascii?Q?kXD5WA7NTr0v30QyU2sHPgsKPl9LTMoUwvwRkzUS8Sb3E8VsSSdPwU1dkODg?=
 =?us-ascii?Q?ltN20Xxsbg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 049a007f-33c3-465b-6b76-08de576e1ce0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 15:19:17.9134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8wnAbypJToq64ijVExshrEFwQ1T1Qtbx0d+FrAB3GnV8wKAVZ5ISXq3RWVnWzgsxn6SFgILtwVyGC6SokE88A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA92F35354
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/hch/xfs xfs-buf-hash
head:   9f73447f84e126bcdeaff55933254bf36fc33136
commit: 9f73447f84e126bcdeaff55933254bf36fc33136 [4/4] disable lockdep
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260119/202601192151.5A30xg27-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601192151.5A30xg27-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601192151.5A30xg27-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from arch/csky/kernel/asm-offsets.c:5:
>> include/linux/lockdep.h:413:52: error: unknown type name 'lock_cmp_fn'
     413 | void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
         |                                                    ^~~~~~~~~~~
>> include/linux/lockdep.h:413:65: error: unknown type name 'lock_print_fn'
     413 | void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
         |                                                                 ^~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:7,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12:
   include/linux/sched.h: In function 'set_need_resched_current':
>> include/linux/lockdep.h:573:34: error: 'debug_locks' undeclared (first use in this function)
     573 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                  ^~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/lockdep.h:582:9: note: in expansion of macro 'WARN_ON_ONCE'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |         ^~~~~~~~~~~~
   include/linux/lockdep.h:582:22: note: in expansion of macro '__lockdep_enabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/sched.h:2042:9: note: in expansion of macro 'lockdep_assert_irqs_disabled'
    2042 |         lockdep_assert_irqs_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:34: note: each undeclared identifier is reported only once for each function it appears in
     573 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                  ^~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/lockdep.h:582:9: note: in expansion of macro 'WARN_ON_ONCE'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |         ^~~~~~~~~~~~
   include/linux/lockdep.h:582:22: note: in expansion of macro '__lockdep_enabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/sched.h:2042:9: note: in expansion of macro 'lockdep_assert_irqs_disabled'
    2042 |         lockdep_assert_irqs_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:17,
                    from include/linux/topology.h:34,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/csky/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from arch/csky/kernel/asm-offsets.c:6:
   include/linux/seqlock.h: In function 'seqcount_lockdep_reader_access':
>> include/linux/seqlock.h:68:21: warning: unused variable 'l' [-Wunused-variable]
      68 |         seqcount_t *l = (seqcount_t *)s;
         |                     ^
   include/linux/srcu.h: In function 'srcu_lock_sync':
>> include/linux/lockdep.h:546:49: error: implicit declaration of function 'lock_sync'; did you mean 'lock_map_sync'? [-Wimplicit-function-declaration]
     546 | #define lock_map_sync(l)                        lock_sync(l, 0, 0, 1, NULL, _THIS_IP_)
         |                                                 ^~~~~~~~~
   include/linux/srcu.h:197:9: note: in expansion of macro 'lock_map_sync'
     197 |         lock_map_sync(map);
         |         ^~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/csky/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PROVE_LOCKING
   Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && BROKEN [=n]
   Selected by [y]:
   - DEBUG_NET_SMALL_RTNL [=y] && DEBUG_KERNEL [=y] && NET [=y] && LOCK_DEBUGGING_SUPPORT [=y]
   WARNING: unmet direct dependencies detected for DEBUG_LOCK_ALLOC
   Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && BROKEN [=n]
   Selected by [y]:
   - DEBUG_WW_MUTEX_SLOWPATH [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y]


vim +/lock_cmp_fn +413 include/linux/lockdep.h

fbb9ce9530fd9b Ingo Molnar             2006-07-03  411  
eb1cfd09f788e3 Kent Overstreet         2023-05-09  412  #ifdef CONFIG_PROVE_LOCKING
eb1cfd09f788e3 Kent Overstreet         2023-05-09 @413  void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
eb1cfd09f788e3 Kent Overstreet         2023-05-09  414  
eb1cfd09f788e3 Kent Overstreet         2023-05-09  415  #define lock_set_cmp_fn(lock, ...)	lockdep_set_lock_cmp_fn(&(lock)->dep_map, __VA_ARGS__)
eb1cfd09f788e3 Kent Overstreet         2023-05-09  416  #else
eb1cfd09f788e3 Kent Overstreet         2023-05-09  417  #define lock_set_cmp_fn(lock, ...)	do { } while (0)
eb1cfd09f788e3 Kent Overstreet         2023-05-09  418  #endif
eb1cfd09f788e3 Kent Overstreet         2023-05-09  419  
b09be676e0ff25 Byungchul Park          2017-08-07  420  enum xhlock_context_t {
b09be676e0ff25 Byungchul Park          2017-08-07  421  	XHLOCK_HARD,
b09be676e0ff25 Byungchul Park          2017-08-07  422  	XHLOCK_SOFT,
b09be676e0ff25 Byungchul Park          2017-08-07  423  	XHLOCK_CTX_NR,
b09be676e0ff25 Byungchul Park          2017-08-07  424  };
b09be676e0ff25 Byungchul Park          2017-08-07  425  
b09be676e0ff25 Byungchul Park          2017-08-07  426  /*
b09be676e0ff25 Byungchul Park          2017-08-07  427   * To initialize a lockdep_map statically use this macro.
b09be676e0ff25 Byungchul Park          2017-08-07  428   * Note that _name must not be NULL.
b09be676e0ff25 Byungchul Park          2017-08-07  429   */
b09be676e0ff25 Byungchul Park          2017-08-07  430  #define STATIC_LOCKDEP_MAP_INIT(_name, _key) \
b09be676e0ff25 Byungchul Park          2017-08-07  431  	{ .name = (_name), .key = (void *)(_key), }
b09be676e0ff25 Byungchul Park          2017-08-07  432  
f52be5708076b7 Peter Zijlstra          2017-08-29  433  static inline void lockdep_invariant_state(bool force) {}
b09be676e0ff25 Byungchul Park          2017-08-07  434  static inline void lockdep_free_task(struct task_struct *task) {}
b09be676e0ff25 Byungchul Park          2017-08-07  435  
f20786ff4da51e Peter Zijlstra          2007-07-19  436  #ifdef CONFIG_LOCK_STAT
f20786ff4da51e Peter Zijlstra          2007-07-19  437  
f20786ff4da51e Peter Zijlstra          2007-07-19  438  extern void lock_contended(struct lockdep_map *lock, unsigned long ip);
c7e78cff6b7518 Peter Zijlstra          2008-10-16  439  extern void lock_acquired(struct lockdep_map *lock, unsigned long ip);
f20786ff4da51e Peter Zijlstra          2007-07-19  440  
f20786ff4da51e Peter Zijlstra          2007-07-19  441  #define LOCK_CONTENDED(_lock, try, lock)			\
f20786ff4da51e Peter Zijlstra          2007-07-19  442  do {								\
f20786ff4da51e Peter Zijlstra          2007-07-19  443  	if (!try(_lock)) {					\
f20786ff4da51e Peter Zijlstra          2007-07-19  444  		lock_contended(&(_lock)->dep_map, _RET_IP_);	\
f20786ff4da51e Peter Zijlstra          2007-07-19  445  		lock(_lock);					\
f20786ff4da51e Peter Zijlstra          2007-07-19  446  	}							\
c7e78cff6b7518 Peter Zijlstra          2008-10-16  447  	lock_acquired(&(_lock)->dep_map, _RET_IP_);			\
f20786ff4da51e Peter Zijlstra          2007-07-19  448  } while (0)
f20786ff4da51e Peter Zijlstra          2007-07-19  449  
916633a4037025 Michal Hocko            2016-04-07  450  #define LOCK_CONTENDED_RETURN(_lock, try, lock)			\
916633a4037025 Michal Hocko            2016-04-07  451  ({								\
916633a4037025 Michal Hocko            2016-04-07  452  	int ____err = 0;					\
916633a4037025 Michal Hocko            2016-04-07  453  	if (!try(_lock)) {					\
916633a4037025 Michal Hocko            2016-04-07  454  		lock_contended(&(_lock)->dep_map, _RET_IP_);	\
916633a4037025 Michal Hocko            2016-04-07  455  		____err = lock(_lock);				\
916633a4037025 Michal Hocko            2016-04-07  456  	}							\
916633a4037025 Michal Hocko            2016-04-07  457  	if (!____err)						\
916633a4037025 Michal Hocko            2016-04-07  458  		lock_acquired(&(_lock)->dep_map, _RET_IP_);	\
916633a4037025 Michal Hocko            2016-04-07  459  	____err;						\
916633a4037025 Michal Hocko            2016-04-07  460  })
916633a4037025 Michal Hocko            2016-04-07  461  
f20786ff4da51e Peter Zijlstra          2007-07-19  462  #else /* CONFIG_LOCK_STAT */
f20786ff4da51e Peter Zijlstra          2007-07-19  463  
f20786ff4da51e Peter Zijlstra          2007-07-19  464  #define lock_contended(lockdep_map, ip) do {} while (0)
c7e78cff6b7518 Peter Zijlstra          2008-10-16  465  #define lock_acquired(lockdep_map, ip) do {} while (0)
f20786ff4da51e Peter Zijlstra          2007-07-19  466  
f20786ff4da51e Peter Zijlstra          2007-07-19  467  #define LOCK_CONTENDED(_lock, try, lock) \
f20786ff4da51e Peter Zijlstra          2007-07-19  468  	lock(_lock)
f20786ff4da51e Peter Zijlstra          2007-07-19  469  
916633a4037025 Michal Hocko            2016-04-07  470  #define LOCK_CONTENDED_RETURN(_lock, try, lock) \
916633a4037025 Michal Hocko            2016-04-07  471  	lock(_lock)
916633a4037025 Michal Hocko            2016-04-07  472  
f20786ff4da51e Peter Zijlstra          2007-07-19  473  #endif /* CONFIG_LOCK_STAT */
f20786ff4da51e Peter Zijlstra          2007-07-19  474  
c3bc8fd637a962 Joel Fernandes (Google  2018-07-30  475) #ifdef CONFIG_PROVE_LOCKING
3117df0453828b Ingo Molnar             2006-12-13  476  extern void print_irqtrace_events(struct task_struct *curr);
fbb9ce9530fd9b Ingo Molnar             2006-07-03  477  #else
3117df0453828b Ingo Molnar             2006-12-13  478  static inline void print_irqtrace_events(struct task_struct *curr)
3117df0453828b Ingo Molnar             2006-12-13  479  {
3117df0453828b Ingo Molnar             2006-12-13  480  }
fbb9ce9530fd9b Ingo Molnar             2006-07-03  481  #endif
fbb9ce9530fd9b Ingo Molnar             2006-07-03  482  
e918188611f073 Boqun Feng              2020-08-07  483  /* Variable used to make lockdep treat read_lock() as recursive in selftests */
e918188611f073 Boqun Feng              2020-08-07  484  #ifdef CONFIG_DEBUG_LOCKING_API_SELFTESTS
e918188611f073 Boqun Feng              2020-08-07  485  extern unsigned int force_read_lock_recursive;
e918188611f073 Boqun Feng              2020-08-07  486  #else /* CONFIG_DEBUG_LOCKING_API_SELFTESTS */
e918188611f073 Boqun Feng              2020-08-07  487  #define force_read_lock_recursive 0
e918188611f073 Boqun Feng              2020-08-07  488  #endif /* CONFIG_DEBUG_LOCKING_API_SELFTESTS */
e918188611f073 Boqun Feng              2020-08-07  489  
e918188611f073 Boqun Feng              2020-08-07  490  #ifdef CONFIG_LOCKDEP
e918188611f073 Boqun Feng              2020-08-07  491  extern bool read_lock_is_recursive(void);
e918188611f073 Boqun Feng              2020-08-07  492  #else /* CONFIG_LOCKDEP */
e918188611f073 Boqun Feng              2020-08-07  493  /* If !LOCKDEP, the value is meaningless */
e918188611f073 Boqun Feng              2020-08-07  494  #define read_lock_is_recursive() 0
e918188611f073 Boqun Feng              2020-08-07  495  #endif
e918188611f073 Boqun Feng              2020-08-07  496  
fbb9ce9530fd9b Ingo Molnar             2006-07-03  497  /*
fbb9ce9530fd9b Ingo Molnar             2006-07-03  498   * For trivial one-depth nesting of a lock-class, the following
fbb9ce9530fd9b Ingo Molnar             2006-07-03  499   * global define can be used. (Subsystems with multiple levels
fbb9ce9530fd9b Ingo Molnar             2006-07-03  500   * of nesting should define their own lock-nesting subclasses.)
fbb9ce9530fd9b Ingo Molnar             2006-07-03  501   */
fbb9ce9530fd9b Ingo Molnar             2006-07-03  502  #define SINGLE_DEPTH_NESTING			1
fbb9ce9530fd9b Ingo Molnar             2006-07-03  503  
fbb9ce9530fd9b Ingo Molnar             2006-07-03  504  /*
fbb9ce9530fd9b Ingo Molnar             2006-07-03  505   * Map the dependency ops to NOP or to real lockdep ops, depending
fbb9ce9530fd9b Ingo Molnar             2006-07-03  506   * on the per lock-class debug mode:
fbb9ce9530fd9b Ingo Molnar             2006-07-03  507   */
fbb9ce9530fd9b Ingo Molnar             2006-07-03  508  
a51805efae5dda Michel Lespinasse       2013-07-08  509  #define lock_acquire_exclusive(l, s, t, n, i)		lock_acquire(l, s, t, 0, 1, n, i)
a51805efae5dda Michel Lespinasse       2013-07-08  510  #define lock_acquire_shared(l, s, t, n, i)		lock_acquire(l, s, t, 1, 1, n, i)
a51805efae5dda Michel Lespinasse       2013-07-08  511  #define lock_acquire_shared_recursive(l, s, t, n, i)	lock_acquire(l, s, t, 2, 1, n, i)
a51805efae5dda Michel Lespinasse       2013-07-08  512  
a51805efae5dda Michel Lespinasse       2013-07-08  513  #define spin_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
a51805efae5dda Michel Lespinasse       2013-07-08  514  #define spin_acquire_nest(l, s, t, n, i)	lock_acquire_exclusive(l, s, t, n, i)
5facae4f3549b5 Qian Cai                2019-09-19  515  #define spin_release(l, i)			lock_release(l, i)
fbb9ce9530fd9b Ingo Molnar             2006-07-03  516  
a51805efae5dda Michel Lespinasse       2013-07-08  517  #define rwlock_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
e918188611f073 Boqun Feng              2020-08-07  518  #define rwlock_acquire_read(l, s, t, i)					\
e918188611f073 Boqun Feng              2020-08-07  519  do {									\
e918188611f073 Boqun Feng              2020-08-07  520  	if (read_lock_is_recursive())					\
e918188611f073 Boqun Feng              2020-08-07  521  		lock_acquire_shared_recursive(l, s, t, NULL, i);	\
e918188611f073 Boqun Feng              2020-08-07  522  	else								\
e918188611f073 Boqun Feng              2020-08-07  523  		lock_acquire_shared(l, s, t, NULL, i);			\
e918188611f073 Boqun Feng              2020-08-07  524  } while (0)
e918188611f073 Boqun Feng              2020-08-07  525  
5facae4f3549b5 Qian Cai                2019-09-19  526  #define rwlock_release(l, i)			lock_release(l, i)
fbb9ce9530fd9b Ingo Molnar             2006-07-03  527  
1ca7d67cf5d5a2 John Stultz             2013-10-07  528  #define seqcount_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
1ca7d67cf5d5a2 John Stultz             2013-10-07  529  #define seqcount_acquire_read(l, s, t, i)	lock_acquire_shared_recursive(l, s, t, NULL, i)
5facae4f3549b5 Qian Cai                2019-09-19  530  #define seqcount_release(l, i)			lock_release(l, i)
1ca7d67cf5d5a2 John Stultz             2013-10-07  531  
a51805efae5dda Michel Lespinasse       2013-07-08  532  #define mutex_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
a51805efae5dda Michel Lespinasse       2013-07-08  533  #define mutex_acquire_nest(l, s, t, n, i)	lock_acquire_exclusive(l, s, t, n, i)
5facae4f3549b5 Qian Cai                2019-09-19  534  #define mutex_release(l, i)			lock_release(l, i)
fbb9ce9530fd9b Ingo Molnar             2006-07-03  535  
a51805efae5dda Michel Lespinasse       2013-07-08  536  #define rwsem_acquire(l, s, t, i)		lock_acquire_exclusive(l, s, t, NULL, i)
a51805efae5dda Michel Lespinasse       2013-07-08  537  #define rwsem_acquire_nest(l, s, t, n, i)	lock_acquire_exclusive(l, s, t, n, i)
a51805efae5dda Michel Lespinasse       2013-07-08  538  #define rwsem_acquire_read(l, s, t, i)		lock_acquire_shared(l, s, t, NULL, i)
5facae4f3549b5 Qian Cai                2019-09-19  539  #define rwsem_release(l, i)			lock_release(l, i)
fbb9ce9530fd9b Ingo Molnar             2006-07-03  540  
a51805efae5dda Michel Lespinasse       2013-07-08  541  #define lock_map_acquire(l)			lock_acquire_exclusive(l, 0, 0, NULL, _THIS_IP_)
0cce06ba859a51 Peter Zijlstra          2023-04-25  542  #define lock_map_acquire_try(l)			lock_acquire_exclusive(l, 0, 1, NULL, _THIS_IP_)
a51805efae5dda Michel Lespinasse       2013-07-08  543  #define lock_map_acquire_read(l)		lock_acquire_shared_recursive(l, 0, 0, NULL, _THIS_IP_)
dd56af42bd829c Paul E. McKenney        2014-08-25  544  #define lock_map_acquire_tryread(l)		lock_acquire_shared_recursive(l, 0, 1, NULL, _THIS_IP_)
5facae4f3549b5 Qian Cai                2019-09-19  545  #define lock_map_release(l)			lock_release(l, _THIS_IP_)
2f1f043e7bea3f Boqun Feng              2023-01-12 @546  #define lock_map_sync(l)			lock_sync(l, 0, 0, 1, NULL, _THIS_IP_)
4f3e7524b2e703 Peter Zijlstra          2008-08-11  547  
76b189e91845ea Peter Zijlstra          2008-09-10  548  #ifdef CONFIG_PROVE_LOCKING
76b189e91845ea Peter Zijlstra          2008-09-10  549  # define might_lock(lock)						\
76b189e91845ea Peter Zijlstra          2008-09-10  550  do {									\
76b189e91845ea Peter Zijlstra          2008-09-10  551  	typecheck(struct lockdep_map *, &(lock)->dep_map);		\
fb9edbe98493fc Oleg Nesterov           2014-01-20  552  	lock_acquire(&(lock)->dep_map, 0, 0, 0, 1, NULL, _THIS_IP_);	\
5facae4f3549b5 Qian Cai                2019-09-19  553  	lock_release(&(lock)->dep_map, _THIS_IP_);			\
76b189e91845ea Peter Zijlstra          2008-09-10  554  } while (0)
76b189e91845ea Peter Zijlstra          2008-09-10  555  # define might_lock_read(lock)						\
76b189e91845ea Peter Zijlstra          2008-09-10  556  do {									\
76b189e91845ea Peter Zijlstra          2008-09-10  557  	typecheck(struct lockdep_map *, &(lock)->dep_map);		\
fb9edbe98493fc Oleg Nesterov           2014-01-20  558  	lock_acquire(&(lock)->dep_map, 0, 0, 1, 1, NULL, _THIS_IP_);	\
5facae4f3549b5 Qian Cai                2019-09-19  559  	lock_release(&(lock)->dep_map, _THIS_IP_);			\
76b189e91845ea Peter Zijlstra          2008-09-10  560  } while (0)
e692b4021a2e48 Simona Vetter           2019-11-04  561  # define might_lock_nested(lock, subclass)				\
e692b4021a2e48 Simona Vetter           2019-11-04  562  do {									\
e692b4021a2e48 Simona Vetter           2019-11-04  563  	typecheck(struct lockdep_map *, &(lock)->dep_map);		\
e692b4021a2e48 Simona Vetter           2019-11-04  564  	lock_acquire(&(lock)->dep_map, subclass, 0, 1, 1, NULL,		\
e692b4021a2e48 Simona Vetter           2019-11-04  565  		     _THIS_IP_);					\
023265ed75d879 Jani Nikula             2019-12-11  566  	lock_release(&(lock)->dep_map, _THIS_IP_);			\
e692b4021a2e48 Simona Vetter           2019-11-04  567  } while (0)
f54bb2ec02c839 Frederic Weisbecker     2017-11-06  568  
a21ee6055c30ce Peter Zijlstra          2020-05-25  569  DECLARE_PER_CPU(int, hardirqs_enabled);
a21ee6055c30ce Peter Zijlstra          2020-05-25  570  DECLARE_PER_CPU(int, hardirq_context);
4d004099a668c4 Peter Zijlstra          2020-10-02  571  DECLARE_PER_CPU(unsigned int, lockdep_recursion);
a21ee6055c30ce Peter Zijlstra          2020-05-25  572  
baffd723e44dc3 Peter Zijlstra          2020-10-05 @573  #define __lockdep_enabled	(debug_locks && !this_cpu_read(lockdep_recursion))
fddf9055a60dfc Peter Zijlstra          2020-08-20  574  

:::::: The code at line 413 was first introduced by commit
:::::: eb1cfd09f788e39948a82be8063e54e40dd018d9 lockdep: Add lock_set_cmp_fn() annotation

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

