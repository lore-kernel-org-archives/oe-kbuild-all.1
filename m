Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50FB81727
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 20:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333680; cv=fail; b=Trhe7Kxj9tBM1FkXoSjcP4Ui5v8S4hJAruzpRYEcFg+SfMVeD4Sl95zYeDr8WBpPgjlmDnQsCwBiJDNNfVQ3OYgs9FpLGT7Rv7eVxLlCeFrVFx6rvbWw3nXN7tYHzgs55rTemcY2/kIVj2hemUHyVFNscMnmVkGb2U663s8BA9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333680; c=relaxed/simple;
	bh=EO3013IXsOJ3TCqJsUq69dY4fe/JWurxTo5KH1h95Ok=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t0qBYXIOCQvfJM/AqyhgpBkD/lQTUAEWn63PC9IHMzTw1p7n5XVt86yis0BX2cIYU2PD6QnBW+OalHGktdXGkDk0obaY5MZYb7gQmub/bC6B087tkaepf0gJHLL3w7z3kLH8DwsEKfHOQpzbESH30lU8kPR/Z2lbFUL4o7I3l/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQKag7Rm; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQKag7Rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728333679; x=1759869679;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=EO3013IXsOJ3TCqJsUq69dY4fe/JWurxTo5KH1h95Ok=;
  b=jQKag7RmYx5BEPuNjCnImvJ/nVaemjci8GoJUaM9RnN3T5SE+bTtPJzA
   k71M8vvawmu87bPCXywNwOv+gYHPFU6pcxH1M4IsRkuFMxEmeniiqWAOz
   QWX6AML/uMp735G4R5HGEjT3SA80oz1hH997Mxc1iYDBDEDybsWcnCQAR
   tMN7eK+/lXLsW3dskWHsZtLzFg8UoaQtqyeW6UuO2Ql7EOWKqj9bTND00
   b75v0HM/UXTkma531aQmDazKDpkc5Qb80ckpnX3IHtoZw3ObW88PHuFEy
   nusjepYFc4LlVIeanSAg37c9pbp/5Qog09ZX7VHxFt9wH+mLWozRy6eGr
   Q==;
X-CSE-ConnectionGUID: qSk0LbYKR5SHRwrJ67gRNg==
X-CSE-MsgGUID: T8DVAA0KThy9J5Jo+l6niA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27445859"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27445859"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 13:41:18 -0700
X-CSE-ConnectionGUID: 1O4kOV83QJuNHigggNqdog==
X-CSE-MsgGUID: qrUli0FHRpm2TV6v+YTPww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75151728"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Oct 2024 13:41:18 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 13:41:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 13:41:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 13:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jd9lvjypL5fjm2C4MXtXT2aZs1ElzYh6gulUXFKgFtcoQR1eBvbdhdgohtlXdmoWYRQc2gbR5js2hu5epRMogxXIX32jsbqlQorzWQcehgDH03UJ9TniVUDtWpaXZ1aVIYzGZBVnLcIyb4BmKz7ny8BzCapMN/JkYmjURu+CSAa+AKpYtqL0LEb/YSQQFmHsOA+tJk2tUScPiwp7K+3+P2Itns0+4i7EoBJYnAFxPknY6F4rGpMGqOSE9rbeUPRtxkiFupeXhRbAGlPw4WDt718XVag/qpns1PXvMWppDgIDCvJe4Wj0cCUN4OPJV6uI6RVVLRCEwacDtLmIUJjiCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiIPgJKT/aQFh60SIBp/NSEkEfTObVpm2IcVn6y61bg=;
 b=fhbYrnFicwiw7CdVAbqsGE77lPccNy87QfAfHIv2W74kgfM6WU1jXmSRWaMnifVkPy/Ni9ZlLHy35Z9n0W9Pj0XjC+woPsP4scxu0uFK8jJgaYkspf89W37IQFVZ/pDYfyBlEzju8YnxOgJ+oPvOM0+bOg2mt/N1AH59NlMGCK9pyfhV1j6ql1aKRarDTlu6I6lRUjfB1HE7W/eJZ9mDp3GqvaSYphhkT5jHX0yunZQV4+OGG4M1no9Jn9oryeQzlqWH4hBfq1DKKP7KTCkyyEHLGFLtAublAbkFpkogeRB8uEzGyWsG/i/iA/gsIdCJxyAAhn9STDaY8hSVOA1wIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BL1PR11MB5319.namprd11.prod.outlook.com (2603:10b6:208:31b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 20:41:13 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 20:41:13 +0000
Date: Mon, 7 Oct 2024 16:41:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: kernel test robot <lkp@intel.com>, Jani Nikula <jani.nikula@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell
	<sfr@canb.auug.org.au>
CC: Francois Dugast <francois.dugast@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [linux-next:master 2050/2483]
 include/linux/fault-inject.h:97:15: error: unknown type name 'bool'
Message-ID: <ZwRHZVQr2PARUI86@intel.com>
References: <202410042155.On1ck1h8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202410042155.On1ck1h8-lkp@intel.com>
X-ClientProxiedBy: MW3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:303:2b::7) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BL1PR11MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d748a7e-b610-4e3d-ccbb-08dce71061a1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NCXodgy5FbkLLsDPtUuHJRPGD3joy96iyrIg8TWyXpu0rUenlJJobfCACHCj?=
 =?us-ascii?Q?ctAp4TtfxqcvOqbCNOCdXmG254XRzAtppi5nh377XszBj0KUP9hvlupaEN2j?=
 =?us-ascii?Q?80iBjtdKvf2ZfKeHVp4bEgu3wcLLAuw0mTCJWUUT6k7/70/VVsERI8UssAg/?=
 =?us-ascii?Q?xtaCSXYanQ26O1ENFnWWU+VlgXTVniFZmKYohSY6L7SsTS4Pwr/HLOKzTBZQ?=
 =?us-ascii?Q?KBIHhHCmDH87WljKIs9uE2bTdtdH6xanrUBOiTfcgjr7Nyux19CufiwhJQZF?=
 =?us-ascii?Q?ii0/BpmoIZSM2R+MPMZ2aRPhdIONFdf32OO9GOHvcMu51LJIIbv23eJBUv/k?=
 =?us-ascii?Q?PXl+3czdrlVzzLe3U+gSHEs4eVT3kM0UdDvHaXRPKqElCDkPjgXO2J9R/12B?=
 =?us-ascii?Q?ElMJ4jbogV2Hx+IprL903PQnsW8XdGYFHx2BqH0moE1ny7W7+rzmnq3IJA94?=
 =?us-ascii?Q?ntfPQilmddwaXpzynrmBkTAt9jSCxB6DIaqpd2v2JBd5ffmuQUT1LJpG9R7V?=
 =?us-ascii?Q?0TcgXOHuGqUecMc0YLYvZgg39N9MoC5mT6O6+R+w9Jmuc4aBS2YS0hpmN/qO?=
 =?us-ascii?Q?rZaF7N3DPrPdUVu9NB7HAZw7Pi6sR51jnxMuJobEjnpxHyc2DIBwW/yUDbhl?=
 =?us-ascii?Q?9Gajgp659JCxtbG7Lt1VhsKCw9bw/XZ8CeKV8Xda8J/LnBjj1lBDUFDeKMv5?=
 =?us-ascii?Q?UVpuOesHCc+EP9wy9jO+/896HUAfXOB/CeWfYyMMZKBCsq3dECBH+1cSFkYc?=
 =?us-ascii?Q?m1zvIXH0RvNvftcLwx0PjPmT8TPRMy85j5j9uUOCoxTQxTR30yH4Khw0XPw1?=
 =?us-ascii?Q?7Nhp4yTwC4uVD5GXYWvRg4C9jpUGlG9G6R6/bhUTOM24jdgQLMz7FJafwo6E?=
 =?us-ascii?Q?1ADTCl2zSCfzz1C4cMUQVYei+rzo3YK7CAIy+PrlGoO6t5gMcsy6ZtXuLD90?=
 =?us-ascii?Q?kY8tXWtxksVC0fNWXpJ5YN+msqInbwVWHbNHemG8yjiVk25S9RvukPzv3zWB?=
 =?us-ascii?Q?UK5cbT/EVRv9q51V3UEIoo0D685qbVxhgHtxuoYlVg0HdnXHdbAMc4+1BU8m?=
 =?us-ascii?Q?H/L86NcLc64p1YPlBNSXF9LL7N8a0u94h7NXh9q/hJTseKl+epLmbWhMNoyp?=
 =?us-ascii?Q?Ob5hXn4GASDt04hGdNsuvhoLtrU9QkB9KXmmQJPzKgA3B6GNWoeHS9to43Yh?=
 =?us-ascii?Q?/D1/RC5uNPjzL5fNOcQtrCh9O3eTP5yUxWmDGNg32TF39r9Qf9sL3uKbSI4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2854.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MgrXwPOC2e784Xfo2xwk9ObaCKE/sb84ibkcRppmFmWW/TK+nH86MbfwGhve?=
 =?us-ascii?Q?5AHBaSztyujwH2qmYxiAfM3XVsE0LFvcpH/mFqUXrKFnfNy6tFd9p4mvbRcE?=
 =?us-ascii?Q?74PgIrZZk5XIEGHENVhNVGdtfKqjY1ztD1YXkFarZKy5osQfyuPIa+kqlPlh?=
 =?us-ascii?Q?GtG3uIV91/UxaAWa1jEgUYXnM4e6FpLqnxdBAmh58gMFt+sA/fXi7Qel141S?=
 =?us-ascii?Q?PpHGykWEnoqUPhzexEU/1DAI9CWzTuascLDkHwEu5vvj5txw76ybDq27Dg5o?=
 =?us-ascii?Q?Hc6Dc/f8sgSbNmyyHWfoabBkzJx76o6q0PcuUzNEyTUWiCr8O3ewC4+TUe1X?=
 =?us-ascii?Q?S5iHZcKyNtySAGrRQ6C4kc8258kfz2Om/m3ATmXjCAKljoqTqJ2Nb+rlQSJV?=
 =?us-ascii?Q?gGDtzOoyYXj4zLkVUvnHq/mODfoFeB/LiE2jibRCnMaZkuFV/mg7wpSKht8/?=
 =?us-ascii?Q?vUUNadQcZ0d5B2z1yGhHGvjhDj/rxNpYgKwBUf7Gci7mwGceLsTbjcsjUdGj?=
 =?us-ascii?Q?j7KKJ+HidZTEMSeMKBTjBBv6e+GEUvIZuZGQC2EPRwcujifFkhMeLrs11aUV?=
 =?us-ascii?Q?PbwBrzJD0VLw1b8uCHh9vPDr99fsfl06AjkL/fqew1d9G9Oxzf+cZxtZc0lR?=
 =?us-ascii?Q?0Za6BQ10DsjlXDOKwl4v/YPLN3kVDMIhaXrqBVYeZdlLrh2TD3XrWHvpYWyc?=
 =?us-ascii?Q?0i3lfB9LC/LeqsZKSx9o3mPWRRkyOOT6jfsRXnLQ3HMpaL73elotL+9DWCds?=
 =?us-ascii?Q?0gV7NMIiIvGk3pHhrCnHt1ZBfEwDpyAVpZtQ51QcFGO7jis+G0ho8J6FMm8K?=
 =?us-ascii?Q?xSuW0tJm911htb4Zh9Nd0qDltuQyCCywoJOA68oEWMeZbWT0JG1N0/B5dy1S?=
 =?us-ascii?Q?hEtnl9M/I9o2zoW/VlKzGYTkfcPlD4SkdeiL/TPDkFjbzBgkiKXzfGOdzWWu?=
 =?us-ascii?Q?aZuWauklzTgUYDm7hMfMQiokBJw53/YDU57Jw4Fv03htGbrMcx4ZTbDpSZRH?=
 =?us-ascii?Q?Zb4ZAzQ3F40UOAyjPBpcRjLg85OP2o7/o3D4uBx6OFHPLlyfIwE+HFot1KOP?=
 =?us-ascii?Q?NDYLG37gozpXmgoQ62gnYF+tXmMoDmqXN+q31ydHF+ZMQWwQ1wQGNaBlmyDE?=
 =?us-ascii?Q?0x8bS5ExurNwaAbMLmpP1/pqEwetSLEtbZlRyuMQFq1iPSm/Tia5x2HKVW1i?=
 =?us-ascii?Q?5AAXfDfEgFtHApwcniToFARoxPd2WTrI5scuKSWArZhOiuNIC/Ks+T8eol4y?=
 =?us-ascii?Q?Xqoac9m7yk9pZXCzA4nfg2nXL60G35tXOOqZwhgQ9jsjXZq//rJgs/WfjqRC?=
 =?us-ascii?Q?KYEhJHLSgP1nu4Q82zhin7tCoUl66XyGrwEqxjC7KdZYRy8vvzqWpbSNM3Kz?=
 =?us-ascii?Q?dRul6sZhRGzT40kwC5/MvKJegYmnd546AuoGqHsSWpJoTLTAGigwCZO5Rbw+?=
 =?us-ascii?Q?OQbpiF54WWv9Z10NoKrh7mflbcNhIZ78pu5EfrFSCQMPiOXxNe3GAjJ9NQuw?=
 =?us-ascii?Q?FXkqcF/U6RYFSDKOUSyUXmMMf3dQPlE8D7mX9VnuBeeVdRacvBkiQ9uylAVF?=
 =?us-ascii?Q?tTKIIPp4H/hOu/s4pADuDzM6Iao/EetV0QqUzSrRd5kswi8Di4sJG5B9fk0M?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d748a7e-b610-4e3d-ccbb-08dce71061a1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 20:41:13.1205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePbKW61fbt1ZBEUnFp+W4VNsu5VMcNdYbc2FyNk+lX71ZxlUn+vrdJqJuvsU2yB0bqOrqpvaBB1n3qY5qnFZtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5319
X-OriginatorOrg: intel.com

On Fri, Oct 04, 2024 at 09:50:36PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   58ca61c1a866bfdaa5e19fb19a2416764f847d75
> commit: 91b2c42c214f570efaff80a666e30b8f6ce4f12b [2050/2483] drm/xe: Use fault injection infrastructure to find issues at probe time
> config: i386-buildonly-randconfig-003-20241004 (https://download.01.org/0day-ci/archive/20241004/202410042155.On1ck1h8-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042155.On1ck1h8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410042155.On1ck1h8-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 58ca61c1a866bfdaa5e19fb19a2416764f847d75 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/gpu/drm/xe/xe_guc_ads.c:8:
> >> include/linux/fault-inject.h:97:15: error: unknown type name 'bool'
>       97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
>          |               ^~~~
> >> include/linux/fault-inject.h:97:43: error: unknown type name 'gfp_t'
>       97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
>          |                                           ^~~~~
>    include/linux/fault-inject.h:106:57: error: unknown type name 'gfp_t'
>      106 | static inline int should_failslab(struct kmem_cache *s, gfp_t gfpflags)
>          |                                                         ^~~~~
> 
> 

I thought that had been fixed by commit
6ce2082fd3a2 ("fault-inject: improve build for CONFIG_FAULT_INJECTION=n")

but it looks like some config case missing still?

> vim +/bool +97 include/linux/fault-inject.h
> 
> cc689c5b352d4a Ingo Molnar     2017-02-01   93  
> 0866e82e40fba4 Kefeng Wang     2023-05-16   94  #ifdef CONFIG_FAIL_PAGE_ALLOC
> 53dabce2652fb8 Vlastimil Babka 2024-07-11   95  bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order);
> 0866e82e40fba4 Kefeng Wang     2023-05-16   96  #else
> 53dabce2652fb8 Vlastimil Babka 2024-07-11  @97  static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
> 0866e82e40fba4 Kefeng Wang     2023-05-16   98  {
> 0866e82e40fba4 Kefeng Wang     2023-05-16   99  	return false;
> 0866e82e40fba4 Kefeng Wang     2023-05-16  100  }
> 0866e82e40fba4 Kefeng Wang     2023-05-16  101  #endif /* CONFIG_FAIL_PAGE_ALLOC */
> 0866e82e40fba4 Kefeng Wang     2023-05-16  102  
> 
> :::::: The code at line 97 was first introduced by commit
> :::::: 53dabce2652fb854eae84609ce9c37429d5d87ba mm, page_alloc: put should_fail_alloc_page() back behing CONFIG_FAIL_PAGE_ALLOC
> 
> :::::: TO: Vlastimil Babka <vbabka@suse.cz>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
