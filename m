Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E937B29CF7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 06:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721888424; cv=fail; b=n07wi+BwO45eb9alTyK4SWxLN2lknqPMkiuSLR8cU9pkslGgQVFH/QFrX/Zwx6SkyFB7t93L+okx2breCF8Z+gknin7MZi7aaM86oEL2nvJw7xxc2ytQLLCPAHr69GlRCISncrEJCcZ2I2XC0Q2iKvr7CM5c0+nzaJ0FkISXzv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721888424; c=relaxed/simple;
	bh=60M89+fgeMt3z7YnJPIXGsQs+Rltc4+zRP3+f19z6Tk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZPNQf5I7S5M0/vZs6w0EFLeTAWPfXXi7JyT4mRx2MPcxtm140vykGn7R5fGQ4ptHp+Hux6MuVHaJiDQ88K63OBnupDr6g4bVhP9+3vCFwkFwIJrxjGYMeC8h7ItG+ugWW0gD+oSBln29SB+yIxWCc2spGWMQW/iQmkDGrPgLE0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWtsWnZj; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWtsWnZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721888423; x=1753424423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=60M89+fgeMt3z7YnJPIXGsQs+Rltc4+zRP3+f19z6Tk=;
  b=WWtsWnZjpxeDkCNywqaoef2NNdDviHaNym+BTMGyT2fN5OTaYgh80/Ql
   HSR3OtsYm/bKqUtiIEpZVOz6kVysYz9ybdla4wiT79EmdU7lO6aV+7xsY
   dXJTpq1GAPDaQipPm/kfhdPyym2nQTylYRcw8oRmLbivBcIUlQxuqcKRS
   SjkMSDQXfOgsl2C50HqwGlHWSDK4rLZLjcCmbJTao+GaxEfb5mR+PZL+n
   mWUSwfUqzTkerBWs37FgerIOjWrS3zwt34bzSWZkeSXTMvJcyra+meM5E
   uQDHLC9s6cHx5an6SKDqQZKg5KLAfOiSLiU98KDTNaH9fkNH0GepEfBkG
   A==;
X-CSE-ConnectionGUID: zbCUQbiXSnuo8ghsWgFHdQ==
X-CSE-MsgGUID: 0jiXYXJ0SCmryY0e+jFGbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19728237"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19728237"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 23:20:22 -0700
X-CSE-ConnectionGUID: +KpUW8VQSyKZKjqCetV6bA==
X-CSE-MsgGUID: DWF2w2UhRxqKBDdjQDCUcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="57121442"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Jul 2024 23:20:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 23:20:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 23:20:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 23:20:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 23:20:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQ8VtMOjs4o8MEEZyx3OtTwqviJJbDJF60zlNgu6QC1B5tz71LCTk7BO77rfeqY+wHIXkjjMG0kqztS6bU0FMxDYqsPEKL1Xgk8NiyBNln974qMQ74tJDiwLuCTBsFoRMkNhn2vzZMmi5ExbOxAbeGpHc3LD65QYAA7UV5i17+QYinEV0CheZCz3VCG9o3k7o0sb1L8/qz7+0JbOskBvcxnUt2xPFcCig2PTBuy/4sodZx4KNCrhERzC4Zykv4h305+MhxiBmeOONqNxppV+7BBoYUhUGRKcQHncjcBCln/qGHuULdkVkV1lsJIY+BGFq7CiD0QcndRU/b1xnAZgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Efz9KNRIydClMYOYL6Cn+xCBPor9+78SC344w1+9F/s=;
 b=eu6Rv1CPrYwJx0BouqdvbucnNXKo3c+F2juwXWN0H9H05J+61RNTMXHtbyp9USTwoQ20hxXWRJDBNlaLKUzhweQGsuGaFyrAFbRqeGDeb/FmELxfifCS94/rGlmtJ6zkF8Xjty4L7+b8AttJnuEbEgo+5Ju39VS8Ql7fMiR4P7E7zaxI0xYsyYtibuvoq9oGgCy/PnesQAHDLGfIz5R6B6xFacreObiXH5ElyZ7aRlxhs9NCEEoE+YAxRVpaLRKhNvS4RiEKuUeJD7qzEF6QGcAq7wFsBBs5s0Cg6lc8ipzdJBeG5HxD7EC1aZCS70X7QREW82NHQTFSELD0Els1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 LV8PR11MB8678.namprd11.prod.outlook.com (2603:10b6:408:20b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 06:20:18 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 06:20:18 +0000
Date: Thu, 25 Jul 2024 14:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [morimoto:sound-params-cleanup-2024-07-24 22/23]
 sound/soc/codecs/zl38060.c: sound/pcm.h is included more than once.
Message-ID: <ZqHumXeCGtHHcb9u@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|LV8PR11MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f9f71c-f0e9-4994-9da7-08dcac71da74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6KOhYGHpAxIDXCohNvH0gKFOcwrg+FOV1ObSBPWesWl2YkXk6Q3SSI9yRNm3?=
 =?us-ascii?Q?R7TKTazaYaOVHLW8l5AXowRS9oSWzpMF+VB2NKyTi2XceX1+WPohe1T4BP/i?=
 =?us-ascii?Q?Zwq0oiY/fnfVsQP2vgz/o9OASLLjbP8rN45B3TiXGgIt7KP3t4MfT/3eZZVz?=
 =?us-ascii?Q?xz44M66XTaAsq5tJGog+ZZjIXBfXANIzAMlEzWaix/0na1c9GdlooJOaDWor?=
 =?us-ascii?Q?PnQrwASt51Oyys+/n+Ii6/XU0E/kBbB00ib8nq6NW1yWzdY9AXidXpP1AXOo?=
 =?us-ascii?Q?BJJqR1TgRXdxNfMDMGqspliMoeNGCx95xtrWn/+VJXneLAvUlOWoChpNXD+V?=
 =?us-ascii?Q?vGbNQsgJ8IRG9SERtzSou1YRRMIPfhmZZdy4Cn1GfFcQiMlSNuXRVhMGekzq?=
 =?us-ascii?Q?mr6xi0bMoKtGsy4qbjMk6lScQka1z/AdllUVyc/PxhL+m/wKSVqsJ74TOIQ6?=
 =?us-ascii?Q?s+n4UWrTOqasyWv5rqojy+la0j8LaF08pgOsMEYNz8XLbT2DuppqxR6MYZnQ?=
 =?us-ascii?Q?w/w5djSJxZ9Pg1Xg9bXxiPTXMh1X1LBIo7IB9Z9lYudpr292Ek0qPEY+KHjZ?=
 =?us-ascii?Q?jpSJiC1y1NKXUKf0Hh5YuZgIT32+PZFf9lCg0IsoYjgXk5x90DaWbLqEEdn6?=
 =?us-ascii?Q?OXqMsbVtksKpVDCElAIaGzFN/SX/aW4MRZSyvhNXAbiLCaBxA+mSxd6hOHqY?=
 =?us-ascii?Q?SgIUbeoDzQ76+qDQ/FXeqrgux06U/i2hP4WKjI9nkFxgJEua3URFb7V+pwKr?=
 =?us-ascii?Q?ctxL5V/dPA3/yeQNHwShNIhcZD5atKxqb+YoRm3tR8TRFvog29kqTVf5OBwF?=
 =?us-ascii?Q?Oabm/5e6rTyr1DMKd+MOlyq5uBI4+9pEqsFm1OEvhSy1x9bgs1tQr3qo/AA2?=
 =?us-ascii?Q?vVEhw3Rl1sjuJL4lnVmp4yj1IoYY7lzuRkjLmKCj8dtJsL35+U96JqhNBG7T?=
 =?us-ascii?Q?oflL/9GHSbh5CszhK7QQ8R0xQXdyx32SW+XnVHc8BCWQS8TelygEIbiJrpSJ?=
 =?us-ascii?Q?7UTvP+TsV1B3pzhSsjWUbPw7SQIknSOpyRsCvotyNKrGtzaK7Irci3IN+1KC?=
 =?us-ascii?Q?3WTFFXcfszG0yEURc/XBtkaCSiywfsGoAaFQI1sv4jNC4wS9W0jqH7V+9tCq?=
 =?us-ascii?Q?ZuavsJp1APXOCbqFMebmX7zDtSwsUGksYW+1i6o0yQ7xVCGc7UdAkwQNJZKf?=
 =?us-ascii?Q?21ni2Y+tBpdOpmiSXdJC8wnPTCLZ/7/3GjONkP3aMgI62Ja3MC8E65djykZs?=
 =?us-ascii?Q?DNuOYhYGFo8Jm2v/Z7fm6I4QR0xDBAEkivgb/sBME1K0f63ypFAiyXK5dNc1?=
 =?us-ascii?Q?qEQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ydgYfIkcUcWBwkOBkVulbWnyGOWyB9cce8l+Qlv22MgXBucmfL9sCK8zM1vi?=
 =?us-ascii?Q?M+AtCfacaxtK+ccB2RzT48UoGvLyyJ4I3H2QSCYlwF3gAObtfO3wKGjDxYSc?=
 =?us-ascii?Q?2WNIvvZtP9qvHB7UqL9UkN75vBx7BPVoOdqxSBCX97L519ghj23Jj4l0Vjpi?=
 =?us-ascii?Q?Q0fF/3deupsR0ujjegu1qA3Kx1vtR7ZtdYp4d+ZKH5wjgHfh7mj9aHYzFn4J?=
 =?us-ascii?Q?LDrNzOQwFWEMiRrvyjdPIwId3RDt42jsIXt6F8j6RRPomgPJ/FUp3n2VRyVR?=
 =?us-ascii?Q?uQLKI7NjW9eME2KWpzDrix8gw8ymV9oTIN9OVS1JM1SFy+4/buwV+e3LsBay?=
 =?us-ascii?Q?OSIFpS62dmk4qm4mOIVtF+fbk2ntIK2perB2nG/MxM4Nvr5Bhz8qfCv9ifmS?=
 =?us-ascii?Q?1HGaCTfsGjpuelYh0twRsGarkwr3HGdIdGBNhebb94Axv3HhOEWUJO9mDFxZ?=
 =?us-ascii?Q?hC+0l3M2DyWBbO1N/adhuEFEjLa7WiGyu+GMudpMuejebhEa2Yf9+QIcHNnP?=
 =?us-ascii?Q?j82FqCklf+KHVaLacPBwxKXN6DqmNwoYUzUMKlu3OZ/rbc58qmQdCGM78B8u?=
 =?us-ascii?Q?zfwauLaTRMYpeCx6SVyf66agM9IZ3WEvnkQ/vW7Ey5XOuHVYTYSJ59mDPINp?=
 =?us-ascii?Q?Ho49olUoFAfxahJdB9OkyAgAhHDou9hRp0Y02YE2b2NzxnYnaEVTBB8UUWV+?=
 =?us-ascii?Q?yNS//I1394uWbPQhOhE5HqZJlyBQgMBt9i97F8ijANYe4Y5ko5s4UCbjLFSr?=
 =?us-ascii?Q?72ybSin43WY3LDEpeLz7clBpP5zvGsSjkZZrNQnziJ6j4zEpAQrEQyOUnCw7?=
 =?us-ascii?Q?fY77l4d/9Q0gYISSUwSUgBSlenIMK4xeRMcyjUuTlFXyTYt0Zvl8wwEk/8Fy?=
 =?us-ascii?Q?bGQaQn2SkMPTRzC8fHMv9P6hmJFQ+KYo+qhcu3Sv+eVikI3EVAkzNugDqFW+?=
 =?us-ascii?Q?TAzo4qHZvwn3RNFTqjhvpU2wUefOMbPkikmujNrOanTCvNPVLjPo5UM+KB/r?=
 =?us-ascii?Q?UcQo+hb2Tk624NX+yk/V8TR8lUQuOXvfoSz6rIaqTTIb+6ilpgNz4k8oXUW8?=
 =?us-ascii?Q?LFqrBCelQ+9Ax00FgQyxDd3D1zKYr8V6ij9uL7bSU07Y1z5Pot5SztGumQ6h?=
 =?us-ascii?Q?tzJ5mwus7EB3nLPyUAeZdoHZ31Tu4C9oiHDa0InYfAmJEgTA0F6FVb96AB7y?=
 =?us-ascii?Q?vVvV/WN3+8y6PM3X7ySYtdWdFXXdSZSPLFPlFNG0MLoUj6vWPMhian0j6APf?=
 =?us-ascii?Q?20vHoRWWBW7gG+WhcJSb5AWA4TsCR1WZzXMDb6vP2c+oIdL27LeF4URFLawe?=
 =?us-ascii?Q?8oPmwGQf/5quFKcTNR/o2sKATOd3BrblotNN4R52qTDioi4C5FDqik7Oqr/+?=
 =?us-ascii?Q?9lE4jBPPuAt6CQCTAMMyxw5OW/wAsC2UDbouDa1t/ZX8dBuOijpjj9dpjeWg?=
 =?us-ascii?Q?lKsab/GJ86CMmGLYB/p23BMsnc2VlNfTB9pdssKvXdzUgkq5/f2bGyIz4PV0?=
 =?us-ascii?Q?xhOijqU8wF0v1Kxfxha4f0LaYvgcbwbOo6xV5GgusOjJ/10+m+2pn6vM7fvG?=
 =?us-ascii?Q?YkWifiHbzOMgndO54Dxmqvfb42ojMeUshcyg9rzX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f9f71c-f0e9-4994-9da7-08dcac71da74
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 06:20:17.9037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tB7mAnNcVqXIuRr65WQaGc4aK3VWwOEUWaQzZn2N/g7lGHkFauC0xHSH5a7JdCf6WkERLWuwrLssPtBlCcRHRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8678
X-OriginatorOrg: intel.com

tree:   https://github.com/morimoto/linux sound-params-cleanup-2024-07-24
head:   eb5b1e5f3f2b93ad4fded2027de7e3bfe9129e0a
commit: d3caff0b57b2b132e7e651974a1584da6c2f5ee6 [22/23] hoge
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407251322.z21lPOEh-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> sound/soc/codecs/zl38060.c: sound/pcm.h is included more than once.

vim +25 sound/soc/codecs/zl38060.c

    24	
  > 25	#include <sound/pcm.h>
    26	#include <sound/core.h>
  > 27	#include <sound/pcm.h>
    28	#include <sound/soc.h>
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

