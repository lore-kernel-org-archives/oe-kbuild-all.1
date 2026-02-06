Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A8279917
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 02:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770345562; cv=fail; b=krga/UFZlK4sRzBGZzOtfmMv5v9ia6cSzZ6aWSRBlfjl6xripc03faXbsKM7iNkwkBa7VLBTioDHi30HIZZGfO/06c9LRenZwNU9KBFNQUNo3dTvfgQsFSnzRwCV8qVKiyiVEoMBF3E3OGsTUhF9giwFSRpxj2d5RibGTcsSyVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770345562; c=relaxed/simple;
	bh=1VWGuTglCbMAnlSqlbNTiuxle8UCVeUIocuLVHI5r9s=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=k69c+3hcdEzuVE7ycQ+P2tle7dlbqUR5/Y5UtpwJHXAvRZdtqJSoLrbUM77IXEjAgQB4Zx39pncQLoOfh/3rlfxU52GWKuVeBb3qNWZ5h9k4i72RphU4ccnjO3G3r+9a1pV8r17fw1XhlYTcuax1k1d5jVb0v6EmCABdKgNbfHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvLg5PnU; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvLg5PnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770345562; x=1801881562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1VWGuTglCbMAnlSqlbNTiuxle8UCVeUIocuLVHI5r9s=;
  b=JvLg5PnU0GJNhBc8hVmw3UdVmaFYLIHWKC4rHxTwWrb38OKQKqF/ieWp
   DK3eQvbHn8guWVG5+X6IWh1sBdErFMbT6lSgpEa92WmsJCXQgBiZg3MIH
   uBj4EB9U1WPFT0W6hhlhhFv5gcqXwKRzHOmopnWZRAntjX0kuYLnKbbV4
   kHBRfoR6wkD5R0NyQ4tRoAsZFtZ7O9juKm3jgnuFs0VkLMv9dnN7FwzOI
   5BhhMHw+4YzL8h3bbxshPTJr+L7I7fmkRdGzfslZAQfBPE/bqgb95x0Lf
   AmaLAiW3WJ6Rc/cqX82wIvFrHSwDRVfs8ERXSnlYzwALlbE3maOqLzs0/
   w==;
X-CSE-ConnectionGUID: 8ETUJuFRQX+XfgFtMtn4JA==
X-CSE-MsgGUID: 3mYx1yqRQfO9Ap2j1Z5evw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71455654"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71455654"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 18:39:21 -0800
X-CSE-ConnectionGUID: mwtKkVE5S6yrPBse0H+guw==
X-CSE-MsgGUID: 49uNqASZTiOfjGSbmmnu7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="215263453"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 18:39:21 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 18:39:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 18:39:20 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 18:39:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xX4VeX7zzo5K0QMPG9zhh0IsTFA0Ud5gaqItexa5zWOwP9L3oAsjUhc2BM3aM8nF4YQWGt6WJs2f68cu3qAysHDlxZT8FoDBrCxV2/5CghvEsTIiLcBnubOzYJwd0ZsGYaRCNiQ4eUfh+HsFc3omAqIWaTMaBkAdsjPVPD6xgHYqLe1Qz0bDeKRl3UBSZFP8JrtRxT/ZDwzwHurvhlb6bmxeDGQoNNqFhhKeW4anSLewB6mycLbZNxKz5w0kDdtkckZi8n2f3Ham08Ss70zDa/2JjTmkCrgIo5P/Yj9toZK3FOn8oHAoN0F3CRCCuDC/l/n+aEsXCJkki5rgfSyvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdkNmWS3xZWsynygtaPoqm0kqOgJ8V6T5Jbk0g65ztw=;
 b=duRigonq8VfoXslyKzHEIlYSvicaIvVlXB/LdGQEcdFLfYvDYRvcuCCbAfa+7L+0Eb8Ol/yvb2nuHQ9NFq6X9BcZVRI+k3qErJumUjIKVqQjj9TD7gx4qDZm4tGXywxr5NDL3zizbE5GeFo3aDKi85hHJqCo/xk62EQwGGUepcMo3Yy+iugdDBlQXVsybt3cSfKLbDv2+/d742C6JT4O7v7p6pmJV4o7YePlSZSzMuRGC5o8tRyGLiSJ9Ddv5W3viCi1h6pxxUPivnvqSOtMTnjIjy70FoXcN8YtFmzrJrf74xgfFVEChshR9qng1pmpF2QEOEVjd4mySV5e0A0iMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 02:39:17 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 02:39:17 +0000
Date: Fri, 6 Feb 2026 10:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-kiwi-6.1 105/105]
 ../../../lib/maple_tree.c:921:17: error: 'fallthrough' undeclared
Message-ID: <aYVUTcn0iL8RT/b7@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SJ1PR11MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 38869c06-149a-4588-6b99-08de6528ebf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RoemQvldZlwh998ogp2JtVMuROWHcZRw0mGWRnGeQGtR0GIhn6btq4fvDGXa?=
 =?us-ascii?Q?u1EKgBZHVU/gGYSC3drvRTeX4GiXOvMLQ3IwcseRrkMrsXbkPDqGVrOug8Yr?=
 =?us-ascii?Q?zE0XVAsp9EbBDOZVlauhA17eM5M0WEvWaG9rbYSRIwpopPyeYjf8t47v5IlI?=
 =?us-ascii?Q?QufefNkxG/g7h/cS3phSpDP1SNnj9VfYPvWKEP4OgMTx734vLdE9vsAr4DdE?=
 =?us-ascii?Q?h4yLHAYLWDsm4oNSJu+Xv4e+rWoR6uqagozMYirgTHYBX+XzKqGGGIrHmuIF?=
 =?us-ascii?Q?+gpqf23Q17Ee6VF5m5CWBnQcClMIoxo8NnJMzLdH5a8TvGBn3NNWi9vfPOu3?=
 =?us-ascii?Q?pSKVjkgkglxZiSvGZb2GKodwC9CCWAGJq7InxiF4dLhrO16p/DGXjizp7uKH?=
 =?us-ascii?Q?SQdQfyDhBGuxt203+xq/N94B9IF1nnCK5B0V28ESuOFFIVl4IeQyY/blWuXf?=
 =?us-ascii?Q?KjnirQadDSlsNz/xmibjU2IkQs+swkRaoQ+DgfQnTVM63nvwhz+HmUXs3h9M?=
 =?us-ascii?Q?CbL01satWIJ+HcyXQ61renkvku3e6ScpvrUxPB1wJHEOgzcVh905vJeSTv+q?=
 =?us-ascii?Q?Fep0rRGcPGjXoOtSX2bEiCrSR46FLYybt+29cJ6d91y0bsV5VeiSkda4nz2W?=
 =?us-ascii?Q?SbXrwkC7d7oIcEfmN2qj2GZorpCYvPvt0V/OeB3LNRGayoXTPRwVnP2yNnAk?=
 =?us-ascii?Q?tFma5ATFceD8T657VfFsTl7WAqRuHtucxju7BihKmeM9xRg3aIqRt6mIml7p?=
 =?us-ascii?Q?i2QEcSTQrGoLTFj5aVUtD3X4mfTiuVVXHLqbASx7pyATQtTBQrvaIxxOuET/?=
 =?us-ascii?Q?0tNC8vkLzAGJB26Y+REvmG02mMNFJ0o8fDgILbkV8tvdktPCX6JFmvxAC+cQ?=
 =?us-ascii?Q?N2XMknCdolqKjehJgDNeoDVSerrDsJnaRMCyBoAQsEE/xjDRemZGCGxaiiOu?=
 =?us-ascii?Q?2mnOXubrwTtKgVYNaVMsOL9jGhqHBl8PuQWVJMNhgTKgP2VT73EsnpurIuxN?=
 =?us-ascii?Q?P4y28YVpIh29bcGrLXxyXMo9uZUWzXMR1b+69QA7yvKev4dUESjGFBf3H2vp?=
 =?us-ascii?Q?mcQb7ZwrmFsY4gYFqhGaabJfJgG8TVD98LEfJbksiG+5HraIpK+V3DAW5RyK?=
 =?us-ascii?Q?G7yUrlDFhdq1MYcfEE7dUVBgkwcOVsAGbpj0k12RTxfhulzz+q/DXMHG/Zlp?=
 =?us-ascii?Q?8OmLXNz3cF+E0P9rhRyNt08gP6k3ZF+OCHIwRiZbppur9OGlZi26OaSQJ6K/?=
 =?us-ascii?Q?bQUiGrqRPRj+wWr+YIRkBaRCyFv/ObD7JWWm+BFmVntz+GYyFlDYij0Dunlq?=
 =?us-ascii?Q?2LGp4rJLgvDDFQiMr5ztEjlv4Z8uX3smoBtzSr+WJ7/2NTDjP34sYPUf1P+z?=
 =?us-ascii?Q?Hytk7UIeGXX52ICOskl21T2hf1LUuI9YCBmhiOqVuAKKJ3WSGS2N7Y1+zgnI?=
 =?us-ascii?Q?4iAQsM5Dd0/5pWIQYJL9XAvVjPOtb4leRmEGZTY1f2VjhKdFaaHPnBn6MEcD?=
 =?us-ascii?Q?a4g47j3zDN1Ga/Cgw/smvw2fHgWdetvwDHFH3guPt76BpvfEz0BZ784Mr7Di?=
 =?us-ascii?Q?a9WDMXBw16a1m1TsipMk38CXTYGoejE3BlH1Vum5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cps1PHcE3LDN1OuC/jfG327fG8fro6KuArvur5FpGWuE7wkqWU9m17weSRWo?=
 =?us-ascii?Q?PE50gJESb93ZmZZQxGsLn4pVSLeq+PJ2vosvB19DrEhSl9RlUnK+Bm6yj7gH?=
 =?us-ascii?Q?6JJwpUZyH68dozfRBnwvbIRgGUKW5UmiRwhRDGpCjqQJsCGVmtiqgL2qbsuk?=
 =?us-ascii?Q?aDY8I++2VxoimbW1fT9ZHDyfElGCOtx2NS7X7tUBVxv0RSqjjgp+q9tDRmKg?=
 =?us-ascii?Q?vE0xYvq3Hw9jt3mZVfHNOwMhYEIzSkAtO51aBeUvBWA9ec67HyPOxIjqqd9i?=
 =?us-ascii?Q?fI6q4hEnoAeBga1fMyohWnMu6XDGT59QHgb9gAJPM2VQjaLN3n1oupx6WrhD?=
 =?us-ascii?Q?fYWI4u1LNjoKRmi1R2uRwl6jkPGuPDnuHBsxQPqmZ1rP4mtFcb3KCqnC9004?=
 =?us-ascii?Q?+9rb1TeYwRqoyzShBLmA7lHZs+JEmqrWMhlflVcMvaY6TzZWQYycc+AWfRiH?=
 =?us-ascii?Q?GKp9AjiZ/9P0zEeJ03xBoQqGBZMS6Q3a6UucJRHVzMcUYKIrZnXIeDjY3olH?=
 =?us-ascii?Q?CRqMqvHd7eEENx1yioOc72H6BVJdB2/1qm016heP5u1BQCOuyBoudafPiBHu?=
 =?us-ascii?Q?g16RyiRHQ55Y7NWzK7eCOEUx8ad9pRQvI+5L1ijjJEk5B5m7u34h4U+3I0JQ?=
 =?us-ascii?Q?wuBLkEUM2Z/Lt7N5c7D5vjEWM0J05JmVgCT98bgh0u7SAQxRCP/svjEpBcPs?=
 =?us-ascii?Q?Z8gRiqBijoEbIV4Yni37x1YiW3NTxDJAr3R109P+0uW47Rs1v5migZJCDPBA?=
 =?us-ascii?Q?QGYFEeh/ynBM3N1qGqS7+YJbUwrFRL8vKwxYtKmRnrEFNghAnhEICoSOkzMZ?=
 =?us-ascii?Q?6v0fX3dyl90Bi/kul8tw+QFR3ilKDGapkdrDkZrbUEImjQ1WyIY/PITV7nNL?=
 =?us-ascii?Q?v0DG+88HrhDY5BuKPmzN0vSzkR4by4jOzC6UOwyndEwiKJ00vUsPJT4ycVns?=
 =?us-ascii?Q?0vtW6urnYUjWVZYYjLhTWz35kFAb+hsb+fWjx7uEQaJM10bw9ROt2T2BcVHx?=
 =?us-ascii?Q?9h4br0LAAkoAsr/g+SSyzMX0R/X52+6SDqfSMi3WsN8MBxXjF2UCKURX8jM3?=
 =?us-ascii?Q?TLI0mqZNF+fUporvvFor4nieFsMcX2EwPHQHqqJyqiDael7vgmbhKZz6z7nE?=
 =?us-ascii?Q?YcMJaNPZcVbyWnMmgfYSdELTjBRIEHAcZnKN3POLp2GuHt4fSLKi5Ze+pv1K?=
 =?us-ascii?Q?eYmxqD4lDy+yISxDcBikqwazEAzRS25NklsJQiGRKz9xYsoBtZCZ+DuKb5Uk?=
 =?us-ascii?Q?nMseDqYZmp5L5Ylxe4UiFzlN2PowhTIzzI0fP6bgZRTinAv3jegzOm8vR+DE?=
 =?us-ascii?Q?ep/szNrbvkjCVIF0Mhq0Ubbq0naFap+TkEDQ4qkCG9GgOytoLlvy2kyvitil?=
 =?us-ascii?Q?mQQP1EqtbvJ3IwxG66pJtyInMavhBswhZpMbdvv0Cad5OxVH1T21ZYb+f2XY?=
 =?us-ascii?Q?h6OyYNKkj94dVKcT4OPmoSTSBTdVWqV9TnSXiuNUGCZB36o8M2Jb4h2uUZwB?=
 =?us-ascii?Q?nnWj/3UEZsxhf/2acG85NusGd0yBb4Wx5xS6PwvfiGh9pFcZB7o/Rwfqn4Ll?=
 =?us-ascii?Q?PsvU4LpueF6jv67I4XK1lnC02E9l1aVbwQXHXwSDro/ur4VR9k7Fjme3RD0G?=
 =?us-ascii?Q?aBAotyR1d5JCybLOl0a4dTJ8V8lU2LLvUA1CTIshrJsQBLmsxy7fFJwF8rkS?=
 =?us-ascii?Q?Fm8DhwseAzKjIesDCWT53fZidL1xdQtPlIoRfgaJyhQFMe55Bh6zhNLOLm2O?=
 =?us-ascii?Q?TwAb4Tg3EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38869c06-149a-4588-6b99-08de6528ebf4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 02:39:16.8862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcA1B5YYpci2jKYGaDX048plHNlA0ouousf4jyCb5dMrPMaUiQMD4pCY64vXeoXrDlXuRkPSlz9FV6P6gtPlQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d9208b34f28d2b57c8c195fd5e1a9d0688f7eb78
commit: cc2f2507f3f05612c61c4b8f11bb91efbb9ad495 [105/105] maple_tree: fix freeing of nodes in rcu mode
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260206/202602060216.tkRq9Wj7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060216.tkRq9Wj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602060216.tkRq9Wj7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from maple.c:23:
   ../../../lib/maple_tree.c: In function 'mas_clear_meta':
>> ../../../lib/maple_tree.c:921:17: error: 'fallthrough' undeclared (first use in this function)
     921 |                 fallthrough;
         |                 ^~~~~~~~~~~
   ../../../lib/maple_tree.c:921:17: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from ./linux/scatterlist.h:8,
                    from scatterlist.c:9:
   ./linux/mm.h:113:21: error: conflicting types for 'kmalloc'; have 'void *(unsigned int,  unsigned int)'
     113 | static inline void *kmalloc(unsigned int size, unsigned int flags)
         |                     ^~~~~~~
   In file included from scatterlist.c:8:
   ../../include/linux/slab.h:13:7: note: previous declaration of 'kmalloc' with type 'void *(size_t,  gfp_t)' {aka 'void *(long unsigned int,  gfp_t)'}
      13 | void *kmalloc(size_t size, gfp_t gfp);
         |       ^~~~~~~
   ./linux/scatterlist.h:317:1: error: unterminated comment
     317 | /**
         | ^
   ./linux/scatterlist.h:2: error: unterminated #ifndef
       2 | #ifndef _LINUX_SCATTERLIST_H
   scatterlist.c: In function 'sg_init_table':
>> scatterlist.c:127:9: error: implicit declaration of function 'sg_init_marker'; did you mean 'sg_init_table'? [-Wimplicit-function-declaration]
     127 |         sg_init_marker(sgl, nents);
         |         ^~~~~~~~~~~~~~
         |         sg_init_table
   scatterlist.c: In function 'sg_kmalloc':
>> scatterlist.c:151:22: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     151 |         if (nents == SG_MAX_SINGLE_ALLOC) {
         |                      ^~~~~~~~~~~~~~~~~~~
   scatterlist.c:151:22: note: each undeclared identifier is reported only once for each function it appears in
   scatterlist.c: In function 'sg_kfree':
   scatterlist.c:171:22: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     171 |         if (nents == SG_MAX_SINGLE_ALLOC) {
         |                      ^~~~~~~~~~~~~~~~~~~
   scatterlist.c: At top level:
>> scatterlist.c:194:54: error: unknown type name 'sg_free_fn'
     194 |                      unsigned int nents_first_chunk, sg_free_fn *free_fn,
         |                                                      ^~~~~~~~~~
   scatterlist.c: In function 'sg_free_append_table':
>> scatterlist.c:243:9: error: implicit declaration of function '__sg_free_table' [-Wimplicit-function-declaration]
     243 |         __sg_free_table(&table->sgt, SG_MAX_SINGLE_ALLOC, 0, sg_kfree,
         |         ^~~~~~~~~~~~~~~
   scatterlist.c:243:38: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     243 |         __sg_free_table(&table->sgt, SG_MAX_SINGLE_ALLOC, 0, sg_kfree,
         |                                      ^~~~~~~~~~~~~~~~~~~
   scatterlist.c: In function 'sg_free_table':
   scatterlist.c:256:32: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     256 |         __sg_free_table(table, SG_MAX_SINGLE_ALLOC, 0, sg_kfree,
         |                                ^~~~~~~~~~~~~~~~~~~
   scatterlist.c: At top level:
>> scatterlist.c:285:22: error: unknown type name 'sg_alloc_fn'
     285 |                      sg_alloc_fn *alloc_fn)
         |                      ^~~~~~~~~~~
   scatterlist.c: In function 'sg_alloc_table':
>> scatterlist.c:375:15: error: implicit declaration of function '__sg_alloc_table'; did you mean 'sg_alloc_table'? [-Wimplicit-function-declaration]
     375 |         ret = __sg_alloc_table(table, nents, SG_MAX_SINGLE_ALLOC,
         |               ^~~~~~~~~~~~~~~~
         |               sg_alloc_table
   scatterlist.c:375:46: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     375 |         ret = __sg_alloc_table(table, nents, SG_MAX_SINGLE_ALLOC,
         |                                              ^~~~~~~~~~~~~~~~~~~
   scatterlist.c: In function 'get_next_sg':
   scatterlist.c:398:56: error: 'SG_MAX_SINGLE_ALLOC' undeclared (first use in this function)
     398 |         alloc_size = min_t(unsigned long, needed_sges, SG_MAX_SINGLE_ALLOC);
         |                                                        ^~~~~~~~~~~~~~~~~~~
   ./linux/mm.h:58:20: note: in definition of macro '__min'
      58 |         t2 min2 = (y);                                  \
         |                    ^
   scatterlist.c:398:22: note: in expansion of macro 'min_t'
     398 |         alloc_size = min_t(unsigned long, needed_sges, SG_MAX_SINGLE_ALLOC);
         |                      ^~~~~
   scatterlist.c: At top level:
>> scatterlist.c:712:34: warning: 'struct sg_page_iter' declared inside parameter list will not be visible outside of this definition or declaration
     712 | void __sg_page_iter_start(struct sg_page_iter *piter,
         |                                  ^~~~~~~~~~~~
   scatterlist.c: In function '__sg_page_iter_start':
>> scatterlist.c:716:14: error: invalid use of undefined type 'struct sg_page_iter'
     716 |         piter->__pg_advance = 0;
         |              ^~
   scatterlist.c:717:14: error: invalid use of undefined type 'struct sg_page_iter'
     717 |         piter->__nents = nents;
         |              ^~
   scatterlist.c:719:14: error: invalid use of undefined type 'struct sg_page_iter'
     719 |         piter->sg = sglist;
         |              ^~
   scatterlist.c:720:14: error: invalid use of undefined type 'struct sg_page_iter'
     720 |         piter->sg_pgoffset = pgoffset;
         |              ^~
   scatterlist.c: At top level:
   scatterlist.c:729:33: warning: 'struct sg_page_iter' declared inside parameter list will not be visible outside of this definition or declaration
     729 | bool __sg_page_iter_next(struct sg_page_iter *piter)
         |                                 ^~~~~~~~~~~~
   scatterlist.c: In function '__sg_page_iter_next':
   scatterlist.c:731:19: error: invalid use of undefined type 'struct sg_page_iter'
     731 |         if (!piter->__nents || !piter->sg)
         |                   ^~
   scatterlist.c:731:38: error: invalid use of undefined type 'struct sg_page_iter'
     731 |         if (!piter->__nents || !piter->sg)
         |                                      ^~
   scatterlist.c:734:14: error: invalid use of undefined type 'struct sg_page_iter'
     734 |         piter->sg_pgoffset += piter->__pg_advance;
         |              ^~
   scatterlist.c:734:36: error: invalid use of undefined type 'struct sg_page_iter'
     734 |         piter->sg_pgoffset += piter->__pg_advance;
         |                                    ^~
   scatterlist.c:735:14: error: invalid use of undefined type 'struct sg_page_iter'
     735 |         piter->__pg_advance = 1;
         |              ^~
   scatterlist.c:737:21: error: invalid use of undefined type 'struct sg_page_iter'
     737 |         while (piter->sg_pgoffset >= sg_page_count(piter->sg)) {
         |                     ^~
   scatterlist.c:737:57: error: invalid use of undefined type 'struct sg_page_iter'
     737 |         while (piter->sg_pgoffset >= sg_page_count(piter->sg)) {
         |                                                         ^~
   scatterlist.c:738:22: error: invalid use of undefined type 'struct sg_page_iter'
     738 |                 piter->sg_pgoffset -= sg_page_count(piter->sg);
         |                      ^~
   scatterlist.c:738:58: error: invalid use of undefined type 'struct sg_page_iter'
     738 |                 piter->sg_pgoffset -= sg_page_count(piter->sg);
         |                                                          ^~
   scatterlist.c:739:22: error: invalid use of undefined type 'struct sg_page_iter'
     739 |                 piter->sg = sg_next(piter->sg);
         |                      ^~
   scatterlist.c:739:42: error: invalid use of undefined type 'struct sg_page_iter'
     739 |                 piter->sg = sg_next(piter->sg);
         |                                          ^~
   scatterlist.c:740:29: error: invalid use of undefined type 'struct sg_page_iter'
     740 |                 if (!--piter->__nents || !piter->sg)
         |                             ^~
   scatterlist.c:740:48: error: invalid use of undefined type 'struct sg_page_iter'
     740 |                 if (!--piter->__nents || !piter->sg)
         |                                                ^~
   scatterlist.c: At top level:
>> scatterlist.c:753:37: warning: 'struct sg_dma_page_iter' declared inside parameter list will not be visible outside of this definition or declaration
     753 | bool __sg_page_iter_dma_next(struct sg_dma_page_iter *dma_iter)
         |                                     ^~~~~~~~~~~~~~~~
   scatterlist.c: In function '__sg_page_iter_dma_next':
>> scatterlist.c:755:47: error: invalid use of undefined type 'struct sg_dma_page_iter'
     755 |         struct sg_page_iter *piter = &dma_iter->base;
         |                                               ^~
   scatterlist.c:757:19: error: invalid use of undefined type 'struct sg_page_iter'
     757 |         if (!piter->__nents || !piter->sg)
         |                   ^~
   scatterlist.c:757:38: error: invalid use of undefined type 'struct sg_page_iter'
     757 |         if (!piter->__nents || !piter->sg)
         |                                      ^~
   scatterlist.c:760:14: error: invalid use of undefined type 'struct sg_page_iter'
     760 |         piter->sg_pgoffset += piter->__pg_advance;
         |              ^~
   scatterlist.c:760:36: error: invalid use of undefined type 'struct sg_page_iter'
     760 |         piter->sg_pgoffset += piter->__pg_advance;
         |                                    ^~
   scatterlist.c:761:14: error: invalid use of undefined type 'struct sg_page_iter'
     761 |         piter->__pg_advance = 1;
         |              ^~
   scatterlist.c:763:21: error: invalid use of undefined type 'struct sg_page_iter'
     763 |         while (piter->sg_pgoffset >= sg_dma_page_count(piter->sg)) {
         |                     ^~
   scatterlist.c:763:61: error: invalid use of undefined type 'struct sg_page_iter'
     763 |         while (piter->sg_pgoffset >= sg_dma_page_count(piter->sg)) {
         |                                                             ^~
   scatterlist.c:764:22: error: invalid use of undefined type 'struct sg_page_iter'
     764 |                 piter->sg_pgoffset -= sg_dma_page_count(piter->sg);
         |                      ^~
   scatterlist.c:764:62: error: invalid use of undefined type 'struct sg_page_iter'
     764 |                 piter->sg_pgoffset -= sg_dma_page_count(piter->sg);
         |                                                              ^~
   scatterlist.c:765:22: error: invalid use of undefined type 'struct sg_page_iter'
     765 |                 piter->sg = sg_next(piter->sg);
         |                      ^~
   scatterlist.c:765:42: error: invalid use of undefined type 'struct sg_page_iter'
     765 |                 piter->sg = sg_next(piter->sg);
         |                                          ^~
   scatterlist.c:766:29: error: invalid use of undefined type 'struct sg_page_iter'
     766 |                 if (!--piter->__nents || !piter->sg)
         |                             ^~
   scatterlist.c:766:48: error: invalid use of undefined type 'struct sg_page_iter'
     766 |                 if (!--piter->__nents || !piter->sg)
         |                                                ^~
   scatterlist.c: At top level:
>> scatterlist.c:786:28: warning: 'struct sg_mapping_iter' declared inside parameter list will not be visible outside of this definition or declaration
     786 | void sg_miter_start(struct sg_mapping_iter *miter, struct scatterlist *sgl,
         |                            ^~~~~~~~~~~~~~~
   scatterlist.c: In function 'sg_miter_start':
>> scatterlist.c:789:33: error: invalid application of 'sizeof' to incomplete type 'struct sg_mapping_iter'
     789 |         memset(miter, 0, sizeof(struct sg_mapping_iter));
         |                                 ^~~~~~
>> scatterlist.c:791:36: error: invalid use of undefined type 'struct sg_mapping_iter'
     791 |         __sg_page_iter_start(&miter->piter, sgl, nents, 0);
         |                                    ^~
>> scatterlist.c:792:28: error: 'SG_MITER_TO_SG' undeclared (first use in this function)
     792 |         WARN_ON(!(flags & (SG_MITER_TO_SG | SG_MITER_FROM_SG)));
         |                            ^~~~~~~~~~~~~~
   ./linux/mm.h:18:32: note: in definition of macro 'WARN_ON'
      18 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
>> scatterlist.c:792:45: error: 'SG_MITER_FROM_SG' undeclared (first use in this function)
     792 |         WARN_ON(!(flags & (SG_MITER_TO_SG | SG_MITER_FROM_SG)));
         |                                             ^~~~~~~~~~~~~~~~
   ./linux/mm.h:18:32: note: in definition of macro 'WARN_ON'
      18 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   scatterlist.c:793:14: error: invalid use of undefined type 'struct sg_mapping_iter'
     793 |         miter->__flags = flags;
         |              ^~
   scatterlist.c: At top level:
   scatterlist.c:797:36: warning: 'struct sg_mapping_iter' declared inside parameter list will not be visible outside of this definition or declaration
     797 | bool sg_miter_get_next_page(struct sg_mapping_iter *miter)
         |                                    ^~~~~~~~~~~~~~~
   scatterlist.c: In function 'sg_miter_get_next_page':
   scatterlist.c:799:19: error: invalid use of undefined type 'struct sg_mapping_iter'
     799 |         if (!miter->__remaining) {
         |                   ^~
   scatterlist.c:802:48: error: invalid use of undefined type 'struct sg_mapping_iter'
     802 |                 if (!__sg_page_iter_next(&miter->piter))
         |                                                ^~
   scatterlist.c:805:27: error: invalid use of undefined type 'struct sg_mapping_iter'
     805 |                 sg = miter->piter.sg;
         |                           ^~
   scatterlist.c:807:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     807 |                 miter->__offset = miter->piter.sg_pgoffset ? 0 : sg->offset;
         |                      ^~
   scatterlist.c:807:40: error: invalid use of undefined type 'struct sg_mapping_iter'
     807 |                 miter->__offset = miter->piter.sg_pgoffset ? 0 : sg->offset;
         |                                        ^~
   scatterlist.c:808:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     808 |                 miter->piter.sg_pgoffset += miter->__offset >> PAGE_SHIFT;
         |                      ^~
   scatterlist.c:808:50: error: invalid use of undefined type 'struct sg_mapping_iter'
     808 |                 miter->piter.sg_pgoffset += miter->__offset >> PAGE_SHIFT;
         |                                                  ^~
   scatterlist.c:809:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     809 |                 miter->__offset &= PAGE_SIZE - 1;
         |                      ^~
   scatterlist.c:810:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     810 |                 miter->__remaining = sg->offset + sg->length -
         |                      ^~
   scatterlist.c:811:44: error: invalid use of undefined type 'struct sg_mapping_iter'
     811 |                                      (miter->piter.sg_pgoffset << PAGE_SHIFT) -
         |                                            ^~
   scatterlist.c:812:43: error: invalid use of undefined type 'struct sg_mapping_iter'
     812 |                                      miter->__offset;
         |                                           ^~
   scatterlist.c:813:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     813 |                 miter->__remaining = min_t(unsigned long, miter->__remaining,
         |                      ^~
   scatterlist.c:813:64: error: invalid use of undefined type 'struct sg_mapping_iter'
     813 |                 miter->__remaining = min_t(unsigned long, miter->__remaining,
         |                                                                ^~
   ./linux/mm.h:57:20: note: in definition of macro '__min'
      57 |         t1 min1 = (x);                                  \
         |                    ^
   scatterlist.c:813:38: note: in expansion of macro 'min_t'
     813 |                 miter->__remaining = min_t(unsigned long, miter->__remaining,
         |                                      ^~~~~
   scatterlist.c:814:61: error: invalid use of undefined type 'struct sg_mapping_iter'
     814 |                                            PAGE_SIZE - miter->__offset);
         |                                                             ^~
   ./linux/mm.h:58:20: note: in definition of macro '__min'
      58 |         t2 min2 = (y);                                  \
         |                    ^
   scatterlist.c:813:38: note: in expansion of macro 'min_t'
     813 |                 miter->__remaining = min_t(unsigned long, miter->__remaining,
         |                                      ^~~~~
   scatterlist.c: At top level:
   scatterlist.c:837:27: warning: 'struct sg_mapping_iter' declared inside parameter list will not be visible outside of this definition or declaration
     837 | bool sg_miter_skip(struct sg_mapping_iter *miter, off_t offset)
         |                           ^~~~~~~~~~~~~~~
   scatterlist.c: In function 'sg_miter_skip':
>> scatterlist.c:839:9: error: implicit declaration of function 'sg_miter_stop'; did you mean 'sg_miter_skip'? [-Wimplicit-function-declaration]
     839 |         sg_miter_stop(miter);
         |         ^~~~~~~~~~~~~
         |         sg_miter_skip
>> scatterlist.c:844:45: error: passing argument 1 of 'sg_miter_get_next_page' from incompatible pointer type [-Wincompatible-pointer-types]
     844 |                 if (!sg_miter_get_next_page(miter))
         |                                             ^~~~~
         |                                             |
         |                                             struct sg_mapping_iter *
   scatterlist.c:797:53: note: expected 'struct sg_mapping_iter *' but argument is of type 'struct sg_mapping_iter *'
     797 | bool sg_miter_get_next_page(struct sg_mapping_iter *miter)
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   scatterlist.c:847:54: error: invalid use of undefined type 'struct sg_mapping_iter'
     847 |                 consumed = min_t(off_t, offset, miter->__remaining);
         |                                                      ^~
   ./linux/mm.h:58:20: note: in definition of macro '__min'
      58 |         t2 min2 = (y);                                  \
         |                    ^
   scatterlist.c:847:28: note: in expansion of macro 'min_t'
     847 |                 consumed = min_t(off_t, offset, miter->__remaining);
         |                            ^~~~~
   scatterlist.c:848:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     848 |                 miter->__offset += consumed;
         |                      ^~
   scatterlist.c:849:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     849 |                 miter->__remaining -= consumed;
         |                      ^~
   scatterlist.c: At top level:
   scatterlist.c:873:27: warning: 'struct sg_mapping_iter' declared inside parameter list will not be visible outside of this definition or declaration
     873 | bool sg_miter_next(struct sg_mapping_iter *miter)
         |                           ^~~~~~~~~~~~~~~
   scatterlist.c: In function 'sg_miter_next':
   scatterlist.c:881:37: error: passing argument 1 of 'sg_miter_get_next_page' from incompatible pointer type [-Wincompatible-pointer-types]
     881 |         if (!sg_miter_get_next_page(miter))
         |                                     ^~~~~
         |                                     |
         |                                     struct sg_mapping_iter *
   scatterlist.c:797:53: note: expected 'struct sg_mapping_iter *' but argument is of type 'struct sg_mapping_iter *'
     797 | bool sg_miter_get_next_page(struct sg_mapping_iter *miter)
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   scatterlist.c:884:14: error: invalid use of undefined type 'struct sg_mapping_iter'
     884 |         miter->page = sg_page_iter_page(&miter->piter);
         |              ^~
>> scatterlist.c:884:23: error: implicit declaration of function 'sg_page_iter_page' [-Wimplicit-function-declaration]
     884 |         miter->page = sg_page_iter_page(&miter->piter);
         |                       ^~~~~~~~~~~~~~~~~
   scatterlist.c:884:47: error: invalid use of undefined type 'struct sg_mapping_iter'
     884 |         miter->page = sg_page_iter_page(&miter->piter);
         |                                               ^~
   scatterlist.c:885:14: error: invalid use of undefined type 'struct sg_mapping_iter'
     885 |         miter->consumed = miter->length = miter->__remaining;
         |              ^~
   scatterlist.c:885:32: error: invalid use of undefined type 'struct sg_mapping_iter'
     885 |         miter->consumed = miter->length = miter->__remaining;
         |                                ^~
   scatterlist.c:885:48: error: invalid use of undefined type 'struct sg_mapping_iter'
     885 |         miter->consumed = miter->length = miter->__remaining;
         |                                                ^~
   scatterlist.c:887:18: error: invalid use of undefined type 'struct sg_mapping_iter'
     887 |         if (miter->__flags & SG_MITER_ATOMIC)
         |                  ^~
>> scatterlist.c:887:30: error: 'SG_MITER_ATOMIC' undeclared (first use in this function)
     887 |         if (miter->__flags & SG_MITER_ATOMIC)
         |                              ^~~~~~~~~~~~~~~
   scatterlist.c:888:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     888 |                 miter->addr = kmap_atomic(miter->page) + miter->__offset;
         |                      ^~
   scatterlist.c:888:48: error: invalid use of undefined type 'struct sg_mapping_iter'
     888 |                 miter->addr = kmap_atomic(miter->page) + miter->__offset;
         |                                                ^~
   scatterlist.c:888:63: error: invalid use of undefined type 'struct sg_mapping_iter'
     888 |                 miter->addr = kmap_atomic(miter->page) + miter->__offset;
         |                                                               ^~
   scatterlist.c:890:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     890 |                 miter->addr = kmap(miter->page) + miter->__offset;
         |                      ^~
   scatterlist.c:890:41: error: invalid use of undefined type 'struct sg_mapping_iter'
     890 |                 miter->addr = kmap(miter->page) + miter->__offset;
         |                                         ^~
   scatterlist.c:890:56: error: invalid use of undefined type 'struct sg_mapping_iter'
     890 |                 miter->addr = kmap(miter->page) + miter->__offset;
         |                                                        ^~
   scatterlist.c: At top level:
   scatterlist.c:909:27: warning: 'struct sg_mapping_iter' declared inside parameter list will not be visible outside of this definition or declaration
     909 | void sg_miter_stop(struct sg_mapping_iter *miter)
         |                           ^~~~~~~~~~~~~~~
>> scatterlist.c:909:6: warning: conflicting types for 'sg_miter_stop'; have 'void(struct sg_mapping_iter *)'
     909 | void sg_miter_stop(struct sg_mapping_iter *miter)
         |      ^~~~~~~~~~~~~
   scatterlist.c:839:9: note: previous implicit declaration of 'sg_miter_stop' with type 'void(struct sg_mapping_iter *)'
     839 |         sg_miter_stop(miter);
         |         ^~~~~~~~~~~~~
   scatterlist.c: In function 'sg_miter_stop':
   scatterlist.c:911:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     911 |         WARN_ON(miter->consumed > miter->length);
         |                      ^~
   ./linux/mm.h:18:32: note: in definition of macro 'WARN_ON'
      18 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   scatterlist.c:911:40: error: invalid use of undefined type 'struct sg_mapping_iter'
     911 |         WARN_ON(miter->consumed > miter->length);
         |                                        ^~
   ./linux/mm.h:18:32: note: in definition of macro 'WARN_ON'
      18 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   scatterlist.c:914:18: error: invalid use of undefined type 'struct sg_mapping_iter'
     914 |         if (miter->addr) {
         |                  ^~
   scatterlist.c:915:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     915 |                 miter->__offset += miter->consumed;
         |                      ^~
   scatterlist.c:915:41: error: invalid use of undefined type 'struct sg_mapping_iter'
     915 |                 miter->__offset += miter->consumed;
         |                                         ^~
   scatterlist.c:916:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     916 |                 miter->__remaining -= miter->consumed;
         |                      ^~
   scatterlist.c:916:44: error: invalid use of undefined type 'struct sg_mapping_iter'
     916 |                 miter->__remaining -= miter->consumed;
         |                                            ^~
   scatterlist.c:918:26: error: invalid use of undefined type 'struct sg_mapping_iter'
     918 |                 if (miter->__flags & SG_MITER_TO_SG)
         |                          ^~
   scatterlist.c:918:38: error: 'SG_MITER_TO_SG' undeclared (first use in this function)
     918 |                 if (miter->__flags & SG_MITER_TO_SG)
         |                                      ^~~~~~~~~~~~~~
   scatterlist.c:921:26: error: invalid use of undefined type 'struct sg_mapping_iter'
     921 |                 if (miter->__flags & SG_MITER_ATOMIC) {
         |                          ^~
   scatterlist.c:921:38: error: 'SG_MITER_ATOMIC' undeclared (first use in this function)
     921 |                 if (miter->__flags & SG_MITER_ATOMIC) {
         |                                      ^~~~~~~~~~~~~~~
   scatterlist.c:923:44: error: invalid use of undefined type 'struct sg_mapping_iter'
     923 |                         kunmap_atomic(miter->addr);
         |                                            ^~
   scatterlist.c:925:37: error: invalid use of undefined type 'struct sg_mapping_iter'
     925 |                         kunmap(miter->page);
         |                                     ^~
   scatterlist.c:927:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     927 |                 miter->page = NULL;
         |                      ^~
   scatterlist.c:928:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     928 |                 miter->addr = NULL;
         |                      ^~
   scatterlist.c:929:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     929 |                 miter->length = 0;
         |                      ^~
   scatterlist.c:930:22: error: invalid use of undefined type 'struct sg_mapping_iter'
     930 |                 miter->consumed = 0;
         |                      ^~
   scatterlist.c: In function 'sg_copy_buffer':
   scatterlist.c:952:32: error: storage size of 'miter' isn't known
     952 |         struct sg_mapping_iter miter;
         |                                ^~~~~
   scatterlist.c:953:33: error: 'SG_MITER_ATOMIC' undeclared (first use in this function)
     953 |         unsigned int sg_flags = SG_MITER_ATOMIC;
         |                                 ^~~~~~~~~~~~~~~
   scatterlist.c:956:29: error: 'SG_MITER_FROM_SG' undeclared (first use in this function)
     956 |                 sg_flags |= SG_MITER_FROM_SG;
         |                             ^~~~~~~~~~~~~~~~
   scatterlist.c:958:29: error: 'SG_MITER_TO_SG' undeclared (first use in this function)
     958 |                 sg_flags |= SG_MITER_TO_SG;
         |                             ^~~~~~~~~~~~~~
   ./linux/mm.h:59:23: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
      59 |         (void) (&min1 == &min2);                        \
         |                       ^~
   ./linux/mm.h:68:9: note: in expansion of macro '__min'
      68 |         __min(typeof(x), typeof(y),                     \
         |         ^~~~~
   scatterlist.c:968:23: note: in expansion of macro 'min'
     968 |                 len = min(miter.length, buflen - offset);
         |                       ^~~
   scatterlist.c:952:32: warning: unused variable 'miter' [-Wunused-variable]
     952 |         struct sg_mapping_iter miter;
         |                                ^~~~~
   scatterlist.c: In function 'sg_zero_buffer':
   scatterlist.c:1067:32: error: storage size of 'miter' isn't known
    1067 |         struct sg_mapping_iter miter;
         |                                ^~~~~
   scatterlist.c:1068:33: error: 'SG_MITER_ATOMIC' undeclared (first use in this function)
    1068 |         unsigned int sg_flags = SG_MITER_ATOMIC | SG_MITER_TO_SG;
         |                                 ^~~~~~~~~~~~~~~
   scatterlist.c:1068:51: error: 'SG_MITER_TO_SG' undeclared (first use in this function)
    1068 |         unsigned int sg_flags = SG_MITER_ATOMIC | SG_MITER_TO_SG;
         |                                                   ^~~~~~~~~~~~~~
   ./linux/mm.h:59:23: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
      59 |         (void) (&min1 == &min2);                        \

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

