Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A802B23EA80
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 04:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764736659; cv=fail; b=r+7zLQsqgNP41JbFHVJE9vn7cTP9IzfH+SVjgyxFZS6kC3VSaDkexSUTx44hyhGsx0pgljiCfRkPsFSFRNLkHgbmTPJGCQQ0CJyXDzg4wEMJ4giMaixkHGw06irx1ndwlIlbvXOdeNbyZhELoccOOhBCo45xdr9lcSz0Il5ruzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764736659; c=relaxed/simple;
	bh=NYKt7+aLKLzBEVngExgqRnqY/iBm8pIwi2unnfDTHtk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Vzfbosxhyuclm8VnAqHL8haGV82hWx3mKZqWFmu7Iy6wepeGWdy9Nz1qgmpHTlNqed4H3lx5d8bkxf8W1Sy2qzNXire+SiKL/aznfuqg3t+A6CK0fHkp3du2B6F9wOrxZOCj/fqU71A7VODzhRSjqUsUFY28bETVIlBFdyN0BzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyChPiUa; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyChPiUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764736657; x=1796272657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NYKt7+aLKLzBEVngExgqRnqY/iBm8pIwi2unnfDTHtk=;
  b=cyChPiUafTKO/e72fZdQPlHddxjHi5y83ezWQsSVBjMW0MiScZEgwSnX
   63XDY7JW9VgDWKh6dNohwYdpJml9e+qVGSVv4OUHJWZY7J7/NNsA+5vsU
   fZoj0cge3I4Caee6kaXFv35J18DjfdJbga2bW565NP5UJW26zWhexvA7q
   8Q3XXoYm/BPQsRWINKkUCxaTdwIWYCVH/NNcNAZfSEz+1G95UPTXbSXox
   KUW9VjpORBWPy9CzlhqpGfL6p2hSTWry+uDoeLr5hmqTfyOvC8dk77n1U
   wECQ5S8Z9c/xftvgLufaymlDBrCnjqlTVjEG9NdHUuk02FzT7fNWYme96
   w==;
X-CSE-ConnectionGUID: v5pDE3K8R1utZ6aMOakEBQ==
X-CSE-MsgGUID: GwiLtlkvR1GUzjCuhEqjVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66796792"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66796792"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 20:37:37 -0800
X-CSE-ConnectionGUID: gDTGBos2RO2gnUU4fktRdg==
X-CSE-MsgGUID: Yc3C9BrAQtCeQLF/OvJ8DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194391334"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 20:37:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:37:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 20:37:35 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:37:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3vQOzfAaIwiB7rUCtV+bE3DNEdCAC6aRk25Pf06sMHQuCdD8gPkzr5ebs6NkdZ8BLfzJ9umqpeDVaoI4b3dEg90Z4rqqn2FWGaN+PeV+BHDEgumdS51I5ecqNp0HhakvTQFnXXUVH7gwoAPSvEZ8bx6ao+iqm+o31m4qUj/Chk3+yZPpbYEhnc0Q+7F/OZB5wdEYTcGO7m7yUFkZT5epBjH0vK85liAzOruHCqRPdO3WSxKVwMORgywnmBb8vKiVTIp+BZa2obOjgW8BniN59pMJeu8IrBsJhifoM0zgusYPw0OhVsUGpNfPfuJwBtOLxTn5NkWKFTxQGgWmnvFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAp4pNWKlLVN7RmfBRkJfwPJnuKoDQEaHUUmCzhhIxs=;
 b=WROsNy4ZxV8K+kOEK7QxIhQ3qpMQ09CegLP0C0Slzb9dTPoBQEaDAPhEyDTMoPIdAeXn8DPrkUVjfs7MT/9Z8ZztKOb8cqKz62XfI23HUkvmVZwRTDXibPdoMkFqSwJ4MzCl+LWXK0Eynh6pRulQcyUkRwGWLULyuhDzdbwkIMFDquyG2w7zTCXVc6MjZwJkLQus3RcZ7ix+y31K+2z7AsepblFER6QPaFOkMhXNfbs4d9OmTflybr8tGrw/WtGaJ/hx9Om+oxeakxqKwchdRxy9faJ1MEjNesVWwbstrgCXtgRpA2+kCr6JHKle3H08Ar4ur5Y8CCvQBr6ZWnEZTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 04:37:28 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 04:37:28 +0000
Date: Wed, 3 Dec 2025 12:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-lts 14/14] gro.c:123:7: warning:
 variable 'opt_ipproto_off' is used uninitialized whenever 'if' condition is
 true
Message-ID: <aS++gSL6MZAPs7E8@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: eed47c02-f1e3-4c62-89f3-08de3225aa3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lysZyNUJ/ZCFXpGFtYFt+jkLZka7Ppz2k6ALuA62MJ/RpZFqkisfSpGUQEDn?=
 =?us-ascii?Q?j7ILuM2azarrnAVryma3jezknSeXt0sfKDYYDwFxfAA3FtqdLl6u14+CokS+?=
 =?us-ascii?Q?gmlS3rdgKdpIFBwNu83A1Q5CLjmUoNmUrhG92OPQsI7ZIvZN+qL+i/lkg3FN?=
 =?us-ascii?Q?KXpLtVbihUkQN5M1kAC8B6rXu8rJkHBQ7N0pdjm8g2dnHDMq7V/KdMCvoYaX?=
 =?us-ascii?Q?QSEc74/qaISTho+m4YnaOQuTfaFYOQL4sGW9yDZjk5ZVh57vJLwOpD73wwL9?=
 =?us-ascii?Q?C2V1j5AqW0nGiMBFQYFjyoxN3NMPAhNpr2H51krDiY5sbJO8LPQGxvnIsxvd?=
 =?us-ascii?Q?Owm+ovofU5DUSsX5uu/6+hu2jp529F6avanDeJktDFkcpUOD4Zb81JJRtQWE?=
 =?us-ascii?Q?iGzWeaRiQXdSY2JVnKCdEt6qj6x9oLHgtQLQEPYlBDbI1xJlQsUbyPAHnKg2?=
 =?us-ascii?Q?TKtbE12HVTLLX9uPsVDKRpyrz9R0YGyiVVKJ/Q2rcMgWnMFjdKOeAvQkC/sr?=
 =?us-ascii?Q?P8wAmKXQ8ogjfAsG+46NSf17JoN1phRhl1Onuhzi+H7Dv4l6o+7ATnwFghIZ?=
 =?us-ascii?Q?EkKo/MRggsTmznHZwi5IF7uyMOcq8Sn2H2/jUIkdxPWxN4sL3hVunoVBpsyb?=
 =?us-ascii?Q?CjdLih17GRR8ktMsUhUeO9wvHHEKtkp+Eg87EkTRcODM5A9iRv7eI0eRFB9b?=
 =?us-ascii?Q?AijQ06hH2BUWxeUBZglvph0Ym3UNRTsMdvmYBrf95FtuuPPQpYWe3MfLvBgX?=
 =?us-ascii?Q?/RWWI7gt0oIitzJ7ikVmssiywgDs5JD+ikh5ZhEJSCrciZhvkmgZE0o70wu8?=
 =?us-ascii?Q?4Syop7P/KA+Bxo9p+RFEbynOEZ+NDK++tjLQL2O2SwLIgHrIJbi43nqnG//L?=
 =?us-ascii?Q?07YfMuece4u26iexiOmphDKWxuKYnYY9gAumrXrTdSOklzT6745GyAMTGo5e?=
 =?us-ascii?Q?NmlC/6798ocy4sbzv4egy3uU4K+X34V0q/M1+yANIl35kC/NhnQWpbtqoH/s?=
 =?us-ascii?Q?EiFIdouwXM5bSIZUtOZkcdRHYMAuj/R3poBfjNOpOuSFjRY0Pz8/i6r6dKes?=
 =?us-ascii?Q?iNsLTcobGF+/wTxs4NKJYs146pAXQHalOpTDnlds9cqBbR/NfsFQ2PVLWOUs?=
 =?us-ascii?Q?TiIT31SsBWXyOFA1N/d6GW380GL+1OeKr/Uoh4TOOYk6vMEXdqqEAC2Iu7ZU?=
 =?us-ascii?Q?7LO3alMpcLIWXjyCZXSwxEZfU7vv3Bh+3M2oihuEAw2FEN0UScW1nB9OfqOE?=
 =?us-ascii?Q?lDgjCK8d5c8QbI/G/NypVsnduGYqJZOnz0Y567Qv2+JBeEdDIyVp389kvNBE?=
 =?us-ascii?Q?OyDf4jNUWmEhfI/36BR99rrBdxiq5r1uvr4PNu0FqnUB068YJqlsrF0HEn/u?=
 =?us-ascii?Q?kjammCubHqszXvDCF6UHNCF6t50wAhagbP6ND5TAnT7ZeYOvnbGIz65atX4h?=
 =?us-ascii?Q?Mc5VU5qV1IMpLQZS8ujB4hdnpY5s7Qq62JtnSMgtQbgsH3uHS7JTNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z9tdVrHal9hHAi6NtuqyIFdbRTd+Qb5w9lZb16JCC58FIsiiG7ACBqkW7bjF?=
 =?us-ascii?Q?H6rv/O9sbrzyl98X72HW7wDw7TTtgY8HF3CLoq+FKVMjDmHjpzPCmvqyqBmM?=
 =?us-ascii?Q?zU0EZNp8FONdBf0Mn3oIDuWqqS3H7nDlWgNxOu6StzRoOVZkrTTg30PmO8Ay?=
 =?us-ascii?Q?d+Eaq63N9TVkny9xcCEJxrQBbhKb+AWLq4OxwXMFy3PVTeEKinnjjtgz+tiU?=
 =?us-ascii?Q?oa4nFQNPVk3/TylL3WfQJgKgnbYdhv/0z0d0sRAzYYjGu+POTV01j0I/hKhP?=
 =?us-ascii?Q?kIB44CdaSjU4j5krKnBO5QPu33ccbj5t2mStjY4lwqkj+yhGIxDcyLevaEC2?=
 =?us-ascii?Q?YlwytLOyJKaGdxfJUxCwuNSEbGr5oX0kGjaOX1YKpqAMg8AMHb80163VmRxD?=
 =?us-ascii?Q?UzqvxU9TRWRSgCKzC42b3dlmmZFRm8ycXJNfVn8a656jhHSYM3mAlSb0WBBA?=
 =?us-ascii?Q?A0uR2tXTMUXv/b5bSBAsCIsiPcmmnc/otnZRHRIzp4XMI2YlJHcj9hL6pfVF?=
 =?us-ascii?Q?jKp16TdmseNsA2N//pDfKAOuZzK2Hh6XZK59oqoaZimEYEU71zQK8HHBBfut?=
 =?us-ascii?Q?e5cGoEdm65tEhDr+xrbbpfNoDAuCtjwdJAPPEzyQ7asxx34f1edfM+hBY/uV?=
 =?us-ascii?Q?gofQjxHh9Z5C2vW6rNOEfT8drlMWGR4MeGt2AlMhC/hBDO3ajx+LKalhGS6h?=
 =?us-ascii?Q?fdQuTzLEwrmga8X7uSicp+UzU4NPhB1RcTGeTZPxzLZVQ4BZxIotKEF4llNK?=
 =?us-ascii?Q?M6V9zLZlssbeORdBNU8S00nuGVPLgRqPm72SG9KFQiuB3rMF7NuO6DcXhyzy?=
 =?us-ascii?Q?GUY2lnjNwk9j4OZzDRKU+V9ALmOy00GP9GD9gJQa/42BvlzlBxWk2Ady61Ol?=
 =?us-ascii?Q?IrMFdU1hZQihEKd16VOryt1x2YNyXwmrxTugNH2I/0nuKy9jeSzPbIByfg8d?=
 =?us-ascii?Q?zh0YgUNFxSQc5/h4ZZ69zhc4/t7RmI8A4TbX6SGxcnSSX5P+BgGcxFZqSTYM?=
 =?us-ascii?Q?PWXvbHm5TYN9eH7DlcP9RJ6zP/xHwKMksyAZxgCqT81EZyCCv2CTf4pS8gpe?=
 =?us-ascii?Q?Mr96HlPNrSGOod3ER0T51zCFRYJe/eYIhFVeQBlk8d2uAfzTqSdTQDcORKVj?=
 =?us-ascii?Q?V8oLRwTTKjOPvB/4XXJJ1iMkHVFakYlHzpXjPDuDSP53on1nP+CawWn/6zAo?=
 =?us-ascii?Q?skF8A0V+P4b/N6k75KHUWax23wl79REp6bc/c2yBJ8lE3u4JcGggeZ9hnQM6?=
 =?us-ascii?Q?6CtDV+Tv7fPptLaI8DS93uoLNmorhvDKZerm7FIyq9FxCp6phqk5kJUnrueq?=
 =?us-ascii?Q?yGRmBMKaIu+TOdx3PjGirJ/qdY8hoVw6rFjDa8Qi+dttaoe49NQJ0+YudOSO?=
 =?us-ascii?Q?tdipGai6EJ1r9viYcDjEDjb2tGWblI7LTLJBpRvGN9+xRNxh3dVut0QPUqPD?=
 =?us-ascii?Q?W9B/SQqrOzOGqC+YW920i+qiqTTJq+BIXWY5rhuCytBy2jNmBoIa0TiKDxvK?=
 =?us-ascii?Q?kCAMXE+QdKxOVC7RoAOSHO4p/+TDIhWRiFXHRXW9usUWARmoMRbOcEFqwD6Z?=
 =?us-ascii?Q?HW5FoHyeVZq6PA4OPtwcJHS83D+szvGYt/NBzwl8celLNuPrw0dhUZacITt1?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eed47c02-f1e3-4c62-89f3-08de3225aa3d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:37:28.7348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DrEMHmyRa7TskgN2Isi4o5Ae4mtZCcC8bBPhFrt3D5W2DglBgePHfcWB8ja6C2eKX5lPM9Ne2pBBjn7U0kCiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   dade86aa098b02637d657986340a2756688d21e2
commit: 28f2d15e27afd9b2f154d7a264b18666901c31f5 [14/14] selftests/net: fix GRO coalesce test and add ext header coalesce tests
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021523.pVePhA8v-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021523.pVePhA8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021523.pVePhA8v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from gro.c:60:
   ./../kselftest.h:355:6: warning: variable 'major' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     355 |         if (uname(&info) || sscanf(info.release, "%u.%u.", &major, &minor) != 2)
         |             ^~~~~~~~~~~~
   ./../kselftest.h:358:9: note: uninitialized use occurs here
     358 |         return major > min_major || (major == min_major && minor >= min_minor);
         |                ^~~~~
   ./../kselftest.h:355:6: note: remove the '||' if its condition is always false
     355 |         if (uname(&info) || sscanf(info.release, "%u.%u.", &major, &minor) != 2)
         |             ^~~~~~~~~~~~~~~
   ./../kselftest.h:352:20: note: initialize the variable 'major' to silence this warning
     352 |         unsigned int major, minor;
         |                           ^
         |                            = 0
>> gro.c:123:7: warning: variable 'opt_ipproto_off' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     123 |                 if (proto == PF_INET)
         |                     ^~~~~~~~~~~~~~~~
   gro.c:148:42: note: uninitialized use occurs here
     148 |                         BPF_STMT(BPF_LD  + BPF_B   + BPF_ABS, opt_ipproto_off),
         |                                                               ^~~~~~~~~~~~~~~
   usr/include/linux/filter.h:49:59: note: expanded from macro 'BPF_STMT'
      49 | #define BPF_STMT(code, k) { (unsigned short)(code), 0, 0, k }
         |                                                           ^
   gro.c:123:3: note: remove the 'if' if its condition is always false
     123 |                 if (proto == PF_INET)
         |                 ^~~~~~~~~~~~~~~~~~~~~
     124 |                         optlen = sizeof(struct ip_timestamp);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     125 |                 else {
         |                 ~~~~
>> gro.c:122:6: warning: variable 'opt_ipproto_off' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     122 |         if (strcmp(testname, "ip") == 0) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   gro.c:148:42: note: uninitialized use occurs here
     148 |                         BPF_STMT(BPF_LD  + BPF_B   + BPF_ABS, opt_ipproto_off),
         |                                                               ^~~~~~~~~~~~~~~
   usr/include/linux/filter.h:49:59: note: expanded from macro 'BPF_STMT'
      49 | #define BPF_STMT(code, k) { (unsigned short)(code), 0, 0, k }
         |                                                           ^
   gro.c:122:2: note: remove the 'if' if its condition is always true
     122 |         if (strcmp(testname, "ip") == 0) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   gro.c:113:34: note: initialize the variable 'opt_ipproto_off' to silence this warning
     113 |         int ipproto_off, opt_ipproto_off;
         |                                         ^
         |                                          = 0
   3 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

