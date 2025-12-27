Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE5D1C5D44
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 07:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766821686; cv=fail; b=jRsnsRL5A7KNu80AEgJmbvHbme2dE6e4cKxr+F7TmaSrIp9CNa4cBa+L6M3ZH4ZgE72VfpInn92h3XVPZj20lTd8a73iYnvCymPALBfWehHruK3pcXH3Dkkd/kUs4ZXibmj4KKBbHD0HIdlB1zd6I75u2MP7icnu89EItNz7VP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766821686; c=relaxed/simple;
	bh=RN2xMkjxTuUj3W5w5Y8b5eavD9QO8RK7A0k1BsEY958=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VUl432uYY0MMaXsEj42xk9chp4C78+U5zVkq+DOql+NgZOyPKpUNl67sRD0mv1hxIC11Nm/RazWL/M9luKuTiEUgM5pXHEPXgps59WK3q/hBgABqEfB9vHYDs5hTVdaI9XCCPVLRe8U6KDOAbmhTQprcikttFHK8kDVVy429U5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2M7WTR9; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2M7WTR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766821685; x=1798357685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RN2xMkjxTuUj3W5w5Y8b5eavD9QO8RK7A0k1BsEY958=;
  b=C2M7WTR9/PbZgVaFr4eAF3sgRtZwl57P4tO9g9qHGMaZo7BGvrFALvjL
   eCCEQz5QeWg/Ue4+wW0FqhvaLHts+3arJd0hqZ57+iBoyoiNXlwqV9sgU
   WLP3Jia6GwsUgkioysXNyipWTONIoJnNQ2z84nye5kLexqO1LdFNXH1xB
   f0jIJUioy5QZ4zefide/ofNanaVFgLzijl4j50HhQCYBQ0vKPtnqbe9uw
   u/jlbxSzkYi24SFAn2kxbcmlH7O0LAwV50X2qS/8yWpfktkaoHzXpqemP
   WZ47ceaKVdancIYAQcIdNi3xHawULMZjJ5VRgIRoEPn9t2dXtXw0h077a
   w==;
X-CSE-ConnectionGUID: 6aIGoFb1S82kELqB73+J2g==
X-CSE-MsgGUID: xyfK3FmyRtuZgUD7RJzBrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="71121258"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="71121258"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 23:47:59 -0800
X-CSE-ConnectionGUID: 7+710lFiSiGAVlGuOlk8ig==
X-CSE-MsgGUID: CsaikdUwQt+07YBiBRy+yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="201445059"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 23:47:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Dec 2025 23:47:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 26 Dec 2025 23:47:58 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Dec 2025 23:47:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ag4Brqopz8r20Pb/yS7H+yC2nxfQr9yxWigisJlzGS5PuDoshCfa7NlZf+HUiOSSCS+afFfVW8uAEOAAVQ6Z8HK5P4fUT0EXOisUp+ciZh6P6v6+xER8JB4LbADPByr8aEBUdqg1aZFQlh878YSB9vZHEN27VOA9YntbAc/SR8xVTSqjdY2mdZ0VhKhQTRwprF2ZmVErr/nXNj7yQ04BB/SfPIbzXfFvh5N8YbbULMOdqB5qnZ7l0GIcUBmCv//GrCByz57NBQkRdtZn/6+u9j41I02DV4OqCjurC4/732R3S8odir+hPfbkPh6yiCJprHBhq0kF7wNf8tibCJ8YmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LB/szle3Z77y5C+BC46ucWO3dAwXj4zfwyHkAotOYNU=;
 b=hHh64cGTnL+0H7+SRIMHYUTgTExDq76Q841RObGMMg9HHPBa4NJHQUV0pfyVpB0sGFzsNo+ml/jjxTSB3e66S3h5MNd+NxBipZyj+noUKA23mwS+24WHiFugWjgFzyn53eNIe6mbcPS/qtaL8TmueLK56ps8bid/Fpg82g8IMA7fXwZs40APOV4Gw21fn+HkioD197OV/DE64L7Tk5PrIPs/Cpfpf3nds9w+YHYvb7zZVbZynOk8wChs9tWFUyBTz+xyuEiF9PEqE7OvvUMT/RI6eTLxY7wZ1ry936w/55j2ExY8Lri1qWfWQPCYCxmNqaedIGhI5LCE2rzhPshY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by PH3PPF740777B0C.namprd11.prod.outlook.com (2603:10b6:518:1::d2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.13; Sat, 27 Dec
 2025 07:47:56 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9456.008; Sat, 27 Dec 2025
 07:47:56 +0000
Date: Sat, 27 Dec 2025 15:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/dts/ni/169445.dtb: / (ni,169445): 'model' is a
 required property
Message-ID: <aU+PJM7D+7f6Xpx4@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|PH3PPF740777B0C:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e8a90c-5484-45a7-3a6d-08de451c3fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MBWmaTtSFlMlKwZRL2zxJ/jJWplcpwTUaE1vw6GEMnL87+yZp/8c7MdSLpH7?=
 =?us-ascii?Q?HLwl7gS0J2/P88pX7o5Ng3kwePxatfa7praWA1C4oaIKdNSS5xBdq66m6c8d?=
 =?us-ascii?Q?SNcRyDZc7WMzFEZ6hyAFHWv7K0jsaFw+6AGd2c7063wBLnE2c++Upi3MKlmj?=
 =?us-ascii?Q?HzZs8M8IQxZIyYCqlnw66itIYDovQoY1xivWUVmmJC0tR77t0kZXwFtYs24F?=
 =?us-ascii?Q?AKL4HZvx8Hx/v3ym2HJQVzhglWspNmU4VShmPDSO0Awmm9maUmTpfDh/ErkH?=
 =?us-ascii?Q?4KE8p1xpjSL9fybyayYdvHz2UdDhDhSCcUO9pZmITpfh/nbpFW8E0GHDaMdN?=
 =?us-ascii?Q?kc4u02JFOBZVEly3qAto5mWIeZH70wkWi2StTR8nYxTOl31fZU5rStHpKLoF?=
 =?us-ascii?Q?TyXbv0/xeNETrjuZyulj4AFaHOM3072cEC9jPSNqhB7VaIz1J55LsY6zva7n?=
 =?us-ascii?Q?HGYUmq6AwHzzo9jH/jSCJgqITWdpz9DHrEDGlGGUgxIzEO50dLody4qSe9uX?=
 =?us-ascii?Q?VkX0Zz0dKgYVtLrS+sIFEYX3/npKALEsNfJQV+Atd5lYsOHJwjalPgG1EY+l?=
 =?us-ascii?Q?EWw9Owschk9yAmh2/RZLazSN89zeD7ALkExcyHtfd6F2RwWQIW+MJy6oGi+y?=
 =?us-ascii?Q?KDq1FjJLBPQdZkxe/tKHx0Ib+lJNyhAjNHaL1bQgS7a1VY+yWGxQP/+DdOM8?=
 =?us-ascii?Q?typJdOTuoXZrY9A/t8wmj8ugYowA6M3kjtZGYhBOdDWKAMpBJjSqk6QrB14L?=
 =?us-ascii?Q?h7hQ6o5kP+hIM6AKugGZ3lQURv1iaSbBVyZTBijLmR99GXbxx7T9at68VmkH?=
 =?us-ascii?Q?f9Jfsghi54gc6ireKLq9rkEzRapU31YPl4ugK+mhWEXtvl10uHBQ7+YaTKHX?=
 =?us-ascii?Q?H6dvI6v8jnYvpUdw9V3955Yth/20U+qQkoUihSNsv9U+RfJcxVhVyfQJIKNP?=
 =?us-ascii?Q?XP5jLtKUwD6ghqmgzT11Vn/HIp7Gmsgg9XOHomg2T6x2Lm8ryaMOotC1XoV7?=
 =?us-ascii?Q?tUhsZ+GFgNsPvesox1vCf2ejiner9I3Gd6NcVEp3yFAxN9apfqv1FR4Txi/U?=
 =?us-ascii?Q?9uLKsXGlE2QapFZyQz5t/pWFqcwmLv6J5JdY0sbx3txlAGq5Bctdek9Bn/9s?=
 =?us-ascii?Q?E6cITwIgvcvjE1XnVtlEZ2AlxAy+tzhKHJnLinXeVd2fiPnsNqzKoNU9wOKY?=
 =?us-ascii?Q?EwiBZV8WvM3G0ol4a1LXd2xdKpgjL+F6du4nrtSI4vIFHoby46aDc/6o/bHG?=
 =?us-ascii?Q?Ss2Z/V8ocsuLXW7YYstPKivUYh2ida1gW8EWSAR8ZX1yKGvlWI8MI4bQHgez?=
 =?us-ascii?Q?ySCdf07FVWQhTvWMhjD2xYyfx6bouQ45BGT8l5Rk0cdJjDM6rO6YrPy0fAvj?=
 =?us-ascii?Q?cHeQ66Yyy4CrG/iHjQQsycmGY+ZzOVb0F/VH5YHjEx/UF47l5jNUYnTRVN3Y?=
 =?us-ascii?Q?Dnb+tBz19kkA2+3FuubYHJ2wrQI5D7QaTq80hCCrGi5qidmzq1xZhw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mp76bkGpjk4gr3Ebp61f5YNtTpsD6cZHx9PqlxBcVjMmHmYnLz/YnRQ0u3p6?=
 =?us-ascii?Q?+HJB/wL6f0ohCJlAjLKP6XzEcuxQ0aHdN/xbvRlZMhuG+eTNe3QD1Hh4ZCV6?=
 =?us-ascii?Q?rKmCGjtcExSEHshV6JlutJJn7P/+eEIq1co9294+KDOlCbNOr/dvVoykaTB0?=
 =?us-ascii?Q?7VqkndAUlCvURXFFSH3Qb+drMOmaqkp6Lw/Ncbtoi4bN64JwTuV1dU1QpW3j?=
 =?us-ascii?Q?S5Mvjxh/AnEG/kem9mnOEgPxO7rCEZk+5m3NP5MiSQX/mUo7WwfY7QJ8ODb+?=
 =?us-ascii?Q?PDaVA39EDM3GRWT1HLn7NBUX/Ne0fe9xqY6q8XO1/UXCkNvb/r8S/wDTImno?=
 =?us-ascii?Q?s0yxKMmUfDOw2P7VVwgBzqFj6q3vHctq9jVRhpicpSvO4wCP/mpirU6OUROo?=
 =?us-ascii?Q?+grLUlGsw3EkVjw0DcHn4AGry0LTmw2M2vPWyVxuW/m/Jd2X3lb7QYrrdf00?=
 =?us-ascii?Q?ne+Y0PkZX8M7hUEX72ZX8hyjjN68V0yzaR/i3tmyVL4z5MRyeMXC+xNmRrvl?=
 =?us-ascii?Q?ADlB7qpIZi9PXL+X5XJrvDZluNzMGhEPkAEBZrcGYlwBv71B8PNaY4kP/MnY?=
 =?us-ascii?Q?XCqpO4darHamA6ViJT/qk3buZB22LAG7Sey3pkStWe03amTga6+eqEyXuh7J?=
 =?us-ascii?Q?NZk8RA1ZSEnjARguLw0jycYlbP2nW2bLTzbBlEeJFbCUNNkpyFAelk3FIsHp?=
 =?us-ascii?Q?iwV3jWtn/E9AV9VWhUjHfRYKa9IDzxyE24oNgXBKOwMi+88uPioRKZR5Cs57?=
 =?us-ascii?Q?um6dafRYRRyOVP4T6/MZ4HC8i/+QlV4s2QysCAp9hr0GI8ekSLj3aPPcXpCS?=
 =?us-ascii?Q?TVVlu1cbF0Yg6qoZ/c6AChjvzmI/pF4lqxBubYYEufL1NCox36biulTu06Xd?=
 =?us-ascii?Q?aRc+EJ5NV/toPJhs8m8tKRvl3SHSCSLLaYC6WdFM3vu63Nc/L+6dUb/CoWbq?=
 =?us-ascii?Q?hSh3TOgcjaRhLMmmIYurkxsXc8iDuzbFFIYfyVCCqWV6H0saX4PCQU1peVcE?=
 =?us-ascii?Q?URi84YqAfDuKiXG15jZTNzUK9PoJKk6uJ/SQ6AsuKvTEYZPehHCSbOFL1MlN?=
 =?us-ascii?Q?K9Phc0jjt4AHgSIKmRpvExXPHDpi8BUW6F/Z7dnoJDW6allHg9fhwSI0+DSq?=
 =?us-ascii?Q?YtLa5CHc0dPe8VkoDgy/tS9g764SdVCL7mTqhR9k8t6hO41A9SDhCXXbDNPh?=
 =?us-ascii?Q?HAU8WkC4ZfK7xywiU7Aj9UL0H1KKoHgoLM+41zKbgRAGosx2G8qzVvAmIdI2?=
 =?us-ascii?Q?W7XUVeir7v2FmMexL9oQ/Tta6ISJ9MRlmjYf0sDo7x+jApyILX3OeBrYU6c7?=
 =?us-ascii?Q?hxUdS7nz9PM7gTFTBcNVDO/cHaU2McXNZN6EjaCLg1pWFcroo/SAz4RcRM/Y?=
 =?us-ascii?Q?NAOeCHjhox4kEusgP/Eio/fNLu8aOEMKxa4YWSPYGHwY431J4w5LRAM+H2l5?=
 =?us-ascii?Q?1myqZw7CqMURaAHByrmlnQaBi3u1+U9/gV6aH7c/DqEu5HJgGNsxlx0KQMRd?=
 =?us-ascii?Q?uI3sOZL6ePKWsDV3w3PQL7Qyz2MpAOfd6V5tc5ZqIDphELf+F7BRPSjxa1Sl?=
 =?us-ascii?Q?3LaLMnDzjmVUOceYlSA7Kp5XFgXjNineX5loj5Dj+6y+2icBJiJl8mnUwv4V?=
 =?us-ascii?Q?Km1dEQNqZjjdDmz9KARopEXazB8XYIR2r+JDaBbNlLP8PLbvnGvByQaDNYL1?=
 =?us-ascii?Q?j0ayrx/TKQ4Gzr2qu87bEhzh5kqOySnS0tIWOg6coKsIWTtYR2M13hZOZda3?=
 =?us-ascii?Q?DEhpjhsYCg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e8a90c-5484-45a7-3a6d-08de451c3fa7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 07:47:56.5558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nh3Kbn9OwZPc0RrQaoJk95AIbCBnTCSufhGBAOrYQFHVtEJj0u826M3pNcYvLCvubxI7tc9xRbljtyExT9ihfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c53f467229a78287efa5b9f65bd22de64416660f
commit: 4f0b3cd7b664e662e9c4480e8d58574ece8aea57 MIPS: dts: Always descend vendor subdirectories
date:   4 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-2051-20251227 (https://download.01.org/0day-ci/archive/20251227/202512270746.CisuHUSW-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512270746.CisuHUSW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512270746.CisuHUSW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ni/169445.dtb: /: failed to match any schema with compatible: ['ni,169445']
>> arch/mips/boot/dts/ni/169445.dtb: / (ni,169445): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ni/169445.dtb: /ahb@1f300000/nand@0: failed to match any schema with compatible: ['gpio-control-nand']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

