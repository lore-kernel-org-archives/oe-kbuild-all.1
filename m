Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05DA3D3D1B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488434; cv=fail; b=rfDxmXpQWysHTcpzvF1ASHZyONJm4iQuXeIgeerS+nplR2G/q6oUhYzbhvlbAK2J/v/VObrhNzprUAaX/bpHizRa0f+8PT+2mh7vj502B5LxwU5rfhGyrcNrI+o+nIwT3V9rDWQVJeUBqPX8zPhlk1P/GxeewmLQQcqsjC4OuKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488434; c=relaxed/simple;
	bh=aeddXVk/ymw0BMJyKlfuxtGSDnkcrxtoaaoeLYSn0CQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=mFl9tnysbFZmbxn4Dx/Lp33aJ4U+YjrgPOECUtnCBhI9zSzoqDVh5JE/4NHQBQ7VVO6FAx0Q+FcRJ6H2Winaq2o0ZvrqShEmErdttrdevXDNmPSzv36e6Re4JqJ9k1u0ZOfbXdwXSw63ab1FYDXoOG9WSPZNHvzm+5E0tDu0PIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ik2/f6mw; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ik2/f6mw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488432; x=1819024432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aeddXVk/ymw0BMJyKlfuxtGSDnkcrxtoaaoeLYSn0CQ=;
  b=Ik2/f6mwhI4r2Fl64umibHWeh5FuDYhEhDA0Zm+E+2bOti6Y+7BFs/v5
   U0AhFIAIKVeMvjkQlFp2Vr4ASmVVzc6vN4ZjWN83Msh/k1QHEAipQOVyb
   9UQTae3ierYoyuaiGbpsF1cgD2U7CVE1hJFEPGTx7zvukWH04UufBB0cK
   KihgyT3Socroyb/Gk6HzokAhmL7eq911wKynB9RUBKZ5MO1UqnJEUUmVh
   JLt3lUbMkynz//H6koGDQaA9t+Xm5LxtCBMypzKI7WEUDEytAC+7hBcfJ
   77FXas6vOpEpx5K8dhKNEkFHtjai0EGrSm3Ty31mx4Yvtmcpyy/Ag5o/o
   Q==;
X-CSE-ConnectionGUID: 0tQ4G0wbQtOtE8c1Sgcg1A==
X-CSE-MsgGUID: jFHTw8UMQLSkDLbYRe89FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="105497582"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="105497582"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:33:51 -0700
X-CSE-ConnectionGUID: r+6lLKBrT82r8EtTfFCykg==
X-CSE-MsgGUID: VMJ5Tf+yQbmYG6umlFHZuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="265461381"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:33:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:33:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:33:51 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:33:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDD8xo8kHehpeG+0kkBj/pFdedQijhcZ1Wb2L2W7juxesqeasDbvBxwPJ4PvAO06z4G6q1gAmwN3epcrEcBqyq5795B9/GEbmzRrkS4KJaJT+jNuPhRGDLboMb852CmKrFI/6TYpawlHPmimWg9yIhA+1o929w5rcZqQhtrOUW59o006RqHYTNvmX1+SYZTSXwEzTwOuGjmCqOT8Row/QcU1TnVKYREdIXWNXfRy+t48CxL765XmIe4uDCEJ6Ry3JJHXwnS9eY/4egl8Uxp/5RqNYB3Nxi2eKxwrhlu8SsBtW5mV3eYDdYPzXPJSI+7rrKV8Uj7c90afn3DBa+N5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3r1HyeVUDQJYXsPI0kIJjGY2/CjT2yB1yHTkqslhs8w=;
 b=X8RBdrzT/pGT9nuDj1wz69/0jfMzobIcosS/SHJD5QBl4eC8zm2Rh0oQ68k1Oj9Eriudi6tTpFQg/ZGxUhOZoGrdRrj3VtLJ1hUohTpZIvEeNehHIHkRoI+o/d4YpcvshaQSNfXFsT2n5ItldHpbscMDSG0XuMIAZ7kwPf+9HykrFkDIzr5I2JoxaFFb3nKmuAejB5U/fKe+rp3+B+tmXECezdW34d/6v5XcWJVNlzRGZbefgtEBi8CU9gjlLXIcrr8mslLCNsFzkJgZTqidhsststQQTvnav048IGX6VhjoqYyNGm6ELOJ9Civ/9SvU1aHyo5+ro/WeKgD96SQv9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:33:44 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:33:43 +0000
Date: Sun, 23 Aug 2026 20:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12 0/2] WARNING: modpost: module f2fs
 uses symbol d_drop from namespace
 VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not
 import it.
Message-ID: <202608221815.nLsHm0jK-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU0P306CA0101.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:22::6) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d98ae0-11a1-4d59-3e27-08df0112c507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|3023799007|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: GTbxRKRpRbFuBx3vmwLPrjDuohppEXqoKvOW3n959qlN3WW9PtYoSqq6dln8p/hQytO5aPejbSKPCu/0TwdQRTR7drt8W9GMhjy3G3vV8Xf4wge+CH+TizKIctX/xPrimXCQt8PunqggCv22JK92F07K73tQhU5OQyJM5u2N4aeHEKswXUQQEcXbaMiSyqBnY9GBM0TWynEwfWa98TEDqTMj4M1kzDWyPqeEr6vTinTgg+zq7JuQ0a4zHGu0uyWBrqje7G/0dFC5CwLpuZzyNu622BCxww7PYHQoKCwWkujVzAajoNh+t5GOgpY3OCW/lafJ4RVghMhkomSaUUUF90W72lGiTfQAVebnkGjrLxJ37tLnT4cIEPPKV2jefVrNO9Pw7jfcRkOyJ4teTU8ff6fEVQUJ3v5cQwcXWt2amRIT3vOEGYp7wqSLMLrwRQXpNQE4coCkNQh8qAj4Pll9nm3X1EeoHwoG+Ldzjg5e2Csve8LzA52Np8OYK2bVvadjP6w3jFHByqp9Bb0I1Hk7QO1boT1jOujz1wz/ph1+XFWDR8iyQAs5cTfpfWoTGrBOBQgSRfyUGB967dbuQvrPnJvh+FKLLDgvZ/hewOEz2tB8lIjbbjiUxGIkPEZhsaZ92kIvCr2hehO5OQBvx8hfI3MY7CYvDpYpLkP5jYdhqQg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D8Fsgyb6+Ej/6oUr63ydykTOexiaXLm1eDPrsoZ8YBBhW8dZliTFcVx8hkkb?=
 =?us-ascii?Q?PnxLI79Bx7w4QFBKYDhzy3V3FcSZAqcKGDB/t/7iCilqs4FCsp4AwfKvlwCh?=
 =?us-ascii?Q?3dCJt0O0bGzLCb44yUfR1cv74kDi436Vu+5RAyvshQDmqORZ/DngQP89r6kx?=
 =?us-ascii?Q?Xa0YP53pi/c9uPj8fzo/Gpapfeo9UGf37sZJEVGzo1BcNaaDygVLF4xlali+?=
 =?us-ascii?Q?VwARy8WPIWGA0A7gYJ6PHwczH5R8WH/l3PepBGbgCZkk84CN9CaoKjNA3ahC?=
 =?us-ascii?Q?nNUw0spZRq2Xw+i9XH9RKfhlvx1xWtI9iBHCbtAyGRZXR6XJC+xNBtrvf55j?=
 =?us-ascii?Q?OdrECA8oRCYL/AHTUYAfoQq3I6TQnLEViVGqCKXi4HHeZuTS1h5au/EFNmHq?=
 =?us-ascii?Q?r58wydnUuSGFNRqYbg/pp5CAjlWsGbJ5EcbSxFVbKnQozEgXuQj5weZgxN93?=
 =?us-ascii?Q?Fvo+u64uG2lowknC7ye9xyAkk7Gr28SKfEFXYyqJmiKPAyFHKGwGIGVZCVzG?=
 =?us-ascii?Q?D8O9y0mROHcsczr5EjLUTFVlDDc1zVmgvZ/HUuHBuEimzzbvy8L47PeX4ZSa?=
 =?us-ascii?Q?4i5Mm21FezF332bqSiqFp8oxFqa3VW4ZJVknX9/S8umSJKv/lUikeh7xRrIN?=
 =?us-ascii?Q?YJj1DKDT8364arkAj1Oud7vXBTNBxRaNiwoeitvhqQZR6MWktAqrdrz0BNF2?=
 =?us-ascii?Q?w0yyv3Dh+BUUCSHgRLDKY+LLdLq8WqBSFcuqjYD1z1AGXTqdUEhUqChU7y+C?=
 =?us-ascii?Q?5i9Jq2oN+dQcGMl34mB980PxUyO+0Dc2tm4dmJOhXFb4C+ECsvxRMV/QRWrT?=
 =?us-ascii?Q?fIHv3p9AQ5mTHHVUwDmubgDlv/ffWirer+bSurWcwz2A+XBrg0OyT0ADTC+8?=
 =?us-ascii?Q?MLVKNNRDyD2/saVMF0bbLfPoBdl7qJT/NcNaW0DDlwNd4uwVRZcG2riH2/Qj?=
 =?us-ascii?Q?369i8ZcnIVPNgpZgS194E6XEHeK11MAVG/mnXnZae9ojpt3UQbbalpYJ1yut?=
 =?us-ascii?Q?pbWmQiHwvuT+MoSWvYjQmCEAKykziLx5DloJcFzD5Jh8XoVGL+iNqYYMY7T4?=
 =?us-ascii?Q?cWoPjVQwQ1X1CsUPtv7VXSIbqKPfeMM2VvcTjSXUEoCeW+/gwtFz+3UNHfn4?=
 =?us-ascii?Q?aTyq9u4Lx7w+rytiXuQcanV8UeRHPAmZnu1JBB654Uz/U0LDwKWtDVuFYd+v?=
 =?us-ascii?Q?UO8Rc4oH6ACr/HGBKUC5pV6Hzsf7KYR8arNSsvU/9fh0o+NaJY9o9+Wg2jOy?=
 =?us-ascii?Q?6BLMhip0R6uz+EnseAFQBipf0yo4qL5XvDpyTqxGoPPjE+bAlYiImaob3KKY?=
 =?us-ascii?Q?S+jpkCyusuaqApyxNqmi/VCI/pxkOmD4tCLKpvgyCrBgYxhZwgLRUIL2lHuh?=
 =?us-ascii?Q?QSS3175NunmD4Pjugh438oXJNImBJt6dfBUkc5DK6x1z7P5Ffmy5JZ/O+x0A?=
 =?us-ascii?Q?E34TGql0lMe8wpdX45b1jPUdvHy08vV0QE7hwmE8530xyNiQknZ22KpQOv56?=
 =?us-ascii?Q?7tE8dgOoPCas2YcAXZmMX7Ine8vwaa0MBfY0TvtXXHoDid44LIv/MGouLKf9?=
 =?us-ascii?Q?DbmrCoAcpxm+GtBVT/H8mWfsskuVi+8D9H7pfvYLjqcenGp0F7hSowPl5yOx?=
 =?us-ascii?Q?ABdlqhwkfWp7wkfVaO7CDIRQsB8ohlDDkNQIvCbrBVIeQeKZuNPJYI6MVU/V?=
 =?us-ascii?Q?QPvzY3JvaZq6MfXABoIXHUjxpUQixBgVBCngo/SWwoMeqmg62XpHLhX/9Yl0?=
 =?us-ascii?Q?bMjAG0H8gQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: e/oMjFZxmPdPM+zIRe81lbFinykKnYchXzkNU35gtM8JNVL647WcAESX+1PQmqbRF+Q1I6xdF6XDTjYDRB8ND8/QrvsWH2OWA3jYpq4GTC+NDhCOL0puirlHCa/XRTaR1fCdW6HEibLn8Izo2QSZtRZUjn731cbXRLaBI2s1ClppCajDhYQLpl30Rz8aCfEYe/YtDMhz1/bZ6n791rTfaun9YVGnKdKw4jPJVkE/vhFi9dnhuF0f/FdDrSK4jc9K+3A8vrl/YBlV9n/r17xmlyw65cF7EwoesqDUaKRKLg3QUpO1obNbnU+QAqlr6XNv/wTarIPpCHZMYcXHDJ6fmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d98ae0-11a1-4d59-3e27-08df0112c507
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:33:43.8921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlpa1p/WkTU8Vtd+rfCo62j8kR0DtGFvUk/nKee5tHKQGf4iI7jYEJQW5tzbw5rz2uh/r8lVDS4wzoATXNPgyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e8c85685a629de4d09ae447b4fac9bfd315d3674
commit: ea1f41c3bdb92ba8e637951ac3e42f4255cb78f9 [0/2] BACKPORT: FROMGIT: f2fs: another way to set large folio by remembering inode number
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260822/202608221815.nLsHm0jK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221815.nLsHm0jK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221815.nLsHm0jK-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: module ext4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ext4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module coda uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module exfat uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module exfat uses symbol d_rehash from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ecryptfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ecryptfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ecryptfs uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ecryptfs uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ecryptfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ecryptfs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ecryptfs uses symbol fsstack_copy_inode_size from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsv4 uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsv4 uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsv4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsv4 uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsv4 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nfsd uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol d_rehash from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cifs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol vfs_path_lookup from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ksmbd uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module autofs4 uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module autofs4 uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module autofs4 uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module fuse uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol vfs_path_lookup from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module overlay uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module orangefs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol __break_lease from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module incrementalfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module kafs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module kafs uses symbol d_rehash from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module kafs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module kafs uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module cachefiles uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ocfs2_dlmfs uses symbol mount_nodev from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module btrfs uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module gfs2 uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> WARNING: modpost: module f2fs uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ceph uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ceph uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module erofs uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module erofs uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nbd uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module nbd uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ublk_drv uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module target_core_mod uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module target_core_mod uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module ubi uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
WARNING: modpost: module sunrpc uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
WARNING: modpost: module sunrpc uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
