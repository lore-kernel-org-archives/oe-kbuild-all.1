Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A6D368D67
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487233; cv=fail; b=URDWBjLOvH6reofTcF/i2l2TK735UZWKDS8z6L/aDN2CGT5yGOPjZq3BYK8u4jLvFCw5jUpJpgpWhjgysePsZrZ4rS0yHQTimGE0FM8Te8iXDl2B/1F5hNAG+MOPoljHvrgFJQ3/RD3Z/Dh90FO5vGdA/90wGAEjoqC+uc2P8Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487233; c=relaxed/simple;
	bh=lu3T9nwwKWu8Ri5lW8pSYesIHqocnTFwT+e0khPTV54=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ptf00K7GNWhb0pMxtdgcU/GpbfDPJLtMYDh+OlSxk41kpWObIW+S8lxpW/p2ja6mu9P99s/u60QSFNp33D3kwgNf+cYeAqezBDAbtCR2ru3nnaAWIWpi5rpyITx6Tk4+NFB4t/RPGzPzUuBSfuBXiT+Dn69epBnFZZieO6LLmGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oC2XEYTv; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oC2XEYTv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487232; x=1819023232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lu3T9nwwKWu8Ri5lW8pSYesIHqocnTFwT+e0khPTV54=;
  b=oC2XEYTvNJFaCFgW++/wFFCfXGziAACZyC1Ag1ZmTllTpYrXwrHGT02s
   XwZPaQ9TQUnBSN2UH2+d6vbfhPhZdlgz67bPviaI7sShqWSu5iHYKjl1E
   FKHa3dyG1jDtpefuhfj09mceShlmb4JSKq/l5VWTriEOvqtus0C8Kcnxx
   Uxwk3CM/M5dfaUZHOhMGVdA7lxrTFQ8fBfV351Z91rh+VunPd5e+anb6o
   dJ8UH3xKxIo5CIPaJlkpRRmwoot2BFdqDX4l0+JYHDG+8DCJwW+KvbkcX
   DKwbN4SoDD0hW+hB43DkIZ4TDmzxO15ZYmB7MsTvKEm7sQc6x6guJmN0y
   w==;
X-CSE-ConnectionGUID: UvXEn4E8SICPkYNZtws61A==
X-CSE-MsgGUID: lE/Fq5wZQ7qTXvj+LPKs6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88088836"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88088836"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:13:51 -0700
X-CSE-ConnectionGUID: rcTGIZOvTMG3919q7l7L/w==
X-CSE-MsgGUID: T+EIg2TASWOTIQrRk1MJhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="260603024"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:13:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:13:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:13:50 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:13:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIFagfnhCU2D0NIJPBl7rh7D+jQJPdSruPL45Yn602v4w4tT2vu3ndaQUXIjDA3I8HM0rbUWcelaj5gXNwXro/DEAzDSXF6RvUbo/O+TC5GgY3uVY74xVpRxaA+QsCVgsbC1cjgoDrIvdcVnSIGv3wnvJtpz+CevWZxK27bl4lqmg9iTYFFm+S8MSzQU0V5JyPg1vjB3qEOZE2lMXXcX5Rz9/WQnOde17oAt9IjGJjjm6A7ngMh6kjcgX9uoa6W/ZUEAOc/eBTVuRcQDRehBqawAz0upeY8VJu8eb5W/vbgZysI7FWKHJwLTo6dT3dzUGnr5ZLpDGGe2ifswXJ1s2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KizABdvSWSxW1t8F6/jy5irCrjt6rIaxNE3cUM+BWbg=;
 b=WSmeN+cz/herguyyIwXMkIosF/f9vupWURVXtJW942Uxzz/CxKg3eLTHiQc/lJkVUCYbba03fEUjdom+twg6hPquK9BQ4AqPY6B1Jvl7cdpsfAk+oLFrHM6a3UAGVh3WkjVrkTuOm6LL3KoQedeGMu1GHWKKHqPrqhv/xR+IlQz7NSkOz8cBvXCMp2zMUxBPoYT4kWYTV7N8URYAJqf6zBJ2oWD02Wm5ukcmNX4R1dQ58swy08Nm7pv5sHGugH+6KUGJpBQ3IHGPi30Am57y/JYeV7VtYwZ12mHJIFSGCeXnR2lecvdUlLu8c2IBv7fY5WFa+dkD8cDqiDbxVkWnsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:13:48 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:13:48 +0000
Date: Sun, 23 Aug 2026 20:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jimc:scratchpad-v10 15/24] kernel/locking/lockdep.c:265:64: error:
 macro "SCRATCHREC_INIT" passed 5 arguments, but takes just 4
Message-ID: <202608230950.LRDeeNvl-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR0401CA0015.apcprd04.prod.outlook.com
 (2603:1096:820:f::20) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc283bf-9926-4810-6d34-08df010ffc7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: WEuanR4tkdRnQHQ9frkZNqtoZYaYz7oZStztiizgNz/KLPIU2/sksixx754N78KPPwMOswLzelY26HDoIU+B+sOlWeZI2xRcL6AxdEAY3cKievTipandFM+fQ9RZ2UdJikloIBF3BnHH9HTrcAGSP7KN9a8gYnKobXCytfchbxs7uFHISDaqy41oObQLwTXTiL5u49DWQ2ZbOR55UXzH7F76ra4+nCi32//7TeH/4U4zkNtyrb6PUilT+3+vbsSi+VG6qZbErZBS+4+rHXS5gBSsxhei6wztYQDWLCHADEOq9H8zoHv6l2NHDqzd1wrsQTgDKxFPZL6i4OPWkCuVCHSwcXNWx2Z0ElKQeRispIZ6/p+YKpZEzBCw9j1bx55CeBxa3odP09TCu+pKlv4bKvmgaRoTZxYGN/FcnsmBYhngU5ZsH7xK9SlK5lETNzM66LxVG4TXcDVILP2D8T+YalwcyuFvdfVhD+bJLk+UXnmUkPPrm4UVMofMWRGaswX+VgKv9zEo/wFIfYrsEq3FZ/FtIKlRqcvVqY/3z3y6qNeYhVHEdpBapmmSEd5k3JopeWMseGQT6vi7iarrLoeJ8AUEENfdh5Ibw/aKC2tkc9ZEUlAWSf1xeE5v7URzvJEuth4HmB6JtBivhBTYEZFq6HXUKBoGJlv9xoY4Yc8hRWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?64gSBPSw78DWSFhGA7F10JMvPoU3J3er38Q1dgwSgIBn+1tecJ1I581Pip/w?=
 =?us-ascii?Q?LbkKmVyRwcuy0j7V22X8+XcPn2I9ggFj7+hPTF89pr6H0SchSdj3pNhh/ubW?=
 =?us-ascii?Q?l46Wv2SPvFoT7hp3D8pd7B0JjnZQTkmvUYQuRRXeSyoD0peR3A/RIxvVi6af?=
 =?us-ascii?Q?hIzd39ECbnlNus1esxIF7XNk0zcE3/LRsZoNCKt2gcMOhzNDnLUXGaX7BWEA?=
 =?us-ascii?Q?J1vnP+BeZU1Nk/CvT10sEDoHnh0ORdaiX9LySI0syAFDD1sNOhu6dfegLXgM?=
 =?us-ascii?Q?x336cK1LqCDbx5HvVIwhTdzjL675bixLSBD5OOlKtqQeC45r232t2kIk8rt1?=
 =?us-ascii?Q?+jo+zb+VF4kuhWZkvdZH36fVp+aGPkpJcZW2qKeWdfHwpABm2PVDZ1flFMwV?=
 =?us-ascii?Q?+rFhMOupO3ytN8nJE2NRxb9notcCX0Yuw0LRO/1gCNuHOwJAidJAy+yuU03q?=
 =?us-ascii?Q?qEXLGmKlHCORERuxcRaabW+IF4/Or1w8ikGMaUHpyvZkFTCjUt3ybfVYMwvU?=
 =?us-ascii?Q?i6o5x8/czk2U8Ld/CN5MFuxf3tud62YG8e7D6lwG6BuoP272uvuZfrd8OtVG?=
 =?us-ascii?Q?DmpQX00JsborUZUldH4a7qHWJDxmw5abFFxvBCT5LS3EwDggiKAn7lZheYAZ?=
 =?us-ascii?Q?hB470okV6Oswl6MY2cxQCquJwQryzqzgrHyDZgekRzRyDeTcuuzK91Xl/147?=
 =?us-ascii?Q?of/X1wiUHJPTMQeeI4SDf4lOUqH7IOGU7aROl2lGHGCuUczHlvSaOm1SCERf?=
 =?us-ascii?Q?n6yJNhxCGRlRb5nte2WKU0mQS6sjbIwj3eg3xXrWYZQKTZ+Cx/TrmFnYzjvW?=
 =?us-ascii?Q?jrzbab2p+U6g1+E2jmdr/dexscyvEkGc5yHXskclB2aE+dMq7GDgUZlPFt6J?=
 =?us-ascii?Q?fwNKpYRkp0VtAWoooEoowlnsZrQ+2b96m/n2VNMa5QNbufrh9zqzz5YHoaZ/?=
 =?us-ascii?Q?mc+81zo2jRW3eLg3zr2D+uK89UNf7lHQUVZPG/Mz36xin5LoiVXyBk21ZW/N?=
 =?us-ascii?Q?RnacniQMd7PjBSs2YgtpqVMbB+ahqEHt+JMKFzozaJbWvytMcfRqs1dr//3T?=
 =?us-ascii?Q?y3a9ynpF7QYRVjnZNguF5Ddg7oHD6RtPBC1eYbq5Nbqf3Rt0Df13MbEToE6f?=
 =?us-ascii?Q?bH61VtrDKaD57Jkh1PLk6v+oKmgaJ9yf1rSS0gCaO/HfjsKmSdcwU+3cAd3U?=
 =?us-ascii?Q?qfnVg4M9/Tk6oFH7Hbmeg5mwvyAPtg39rGudNwakK4E/tT4idLDJtlCIWi5h?=
 =?us-ascii?Q?+Rm9vrpjPXcREapCXrzqdjWWOZOeKyztKiE66MnUIR3oaIwZbEUPpa2dFP/y?=
 =?us-ascii?Q?MY0fUmB8ILomaOFbn7R+ODOKJ37zewp0hBlNotTxaEnlKodBJ9vseM/Ih478?=
 =?us-ascii?Q?U4Xvbx7sqCuHw0anhKcdo0PkjE3dvSI2qigapBhVsI1h/Mmdl1TBVavacgOy?=
 =?us-ascii?Q?ZCnf3NAN/6VhnGPZN0tS/5vqOvun6DaR1Z+YG/ZGdpxCRhWEGZy3Juwb0rh7?=
 =?us-ascii?Q?+rC60+hHVrS1eu2N25bGyajTUCWAD12cB+sHBf3VmwSlPCoR8pQs3GZ2NLnj?=
 =?us-ascii?Q?B5KJRhgye16vCUyvxbUkGO+GNnArLMe+3iXoRP2g7IYokLlbrt1o6VS3K8/X?=
 =?us-ascii?Q?HCQZ37wT2XVDtK9YSUiz/y+JlanFbMDvOuqWGC9yBVIzn/VPUgJ3RSvAl1ln?=
 =?us-ascii?Q?giRGQZ8Hh+leZj2Q/AIdcyRvZJNbimvdkROnISOzNaMHJVLxHyCx7U5Ak9ev?=
 =?us-ascii?Q?2mFurkwivA=3D=3D?=
X-Exchange-RoutingPolicyChecked: QDdpJ0aK80s2qWsj38TblitQDEqIxyTX/CSIMAiaAsZeIMfFbs2dlRxXdFIQpwCfPaJWcdCWHsYnbvbqHBnmtNimqtXFIrnXfWLGKUfYh2I9IFoNFHsKtIbEwATELJVJhIrXsXsVBcGc9bjDNbtfDm3JPDals743UAdl4D5yHCtU9wi9kNATbxtgIsax+VLQ6I0QPFJMDO2SAOBKVaOvyO3axVsJLOEcfStbgqYr1GzpgOzDGroXbxrpxfMtychNGIeoQCtpdJbCP5BbC8AlpYZYHRdyFfXGz3VJzO+y/0pj5IhnXCYaTuF//Y0yEuHTPsHd7y2EXo+FNPzOsLfDIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc283bf-9926-4810-6d34-08df010ffc7b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:13:48.4278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6tXLwQ8WxKRsTEmvyCp63LkIPjTSYglm1DkiihfAZlfb3tAhHuzvNlet6cy/efS+EYoayzpPyVUT4NDv3BQIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   a23fc077806416450fbeb0a5a534fd995e465430
commit: 468ef4eda872252a66884b59339c1331ded8a0fc [15/24] locking/lockdep: Back lock_classes chunk array with dynamic scratchrec pool
config: x86_64-randconfig-006-20260822 (https://download.01.org/0day-ci/archive/20260823/202608230950.LRDeeNvl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230950.LRDeeNvl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230950.LRDeeNvl-lkp@intel.com/

Note: the jimc/scratchpad-v10 HEAD a23fc077806416450fbeb0a5a534fd995e465430 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/locking/lockdep.c:71:71: error: macro "SCRATCHREC_INIT_STATIC" passed 7 arguments, but takes just 6
      71 |                                SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
         |                                                                       ^
   In file included from kernel/locking/lockdep.c:61:
   include/linux/scratchpad.h:360: note: macro "SCRATCHREC_INIT_STATIC" defined here
     360 | #define SCRATCHREC_INIT_STATIC(name, _elem_size, _static_buf, _size_bytes, _min_order, _key) \
         | 
   kernel/locking/lockdep.c:69:9: error: 'SCRATCHREC_INIT_STATIC' undeclared here (not in a function)
      69 |         SCRATCHREC_INIT_STATIC(lockdep_pool, sizeof(struct lock_list),
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/locking/lockdep.c:265:64: error: macro "SCRATCHREC_INIT" passed 5 arguments, but takes just 4
     265 |                         SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
         |                                                                ^
   include/linux/scratchpad.h:357: note: macro "SCRATCHREC_INIT" defined here
     357 | #define SCRATCHREC_INIT(name, _elem_size, _min_order, _key) \
         | 
>> kernel/locking/lockdep.c:263:9: error: 'SCRATCHREC_INIT' undeclared here (not in a function)
     263 |         SCRATCHREC_INIT(lockdep_class_pool,
         |         ^~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:608:49: error: macro "SCRATCHPAD_INIT_STATIC" passed 6 arguments, but takes just 5
     608 |                                &lockdep_pool_key);
         |                                                 ^
   include/linux/scratchpad.h:153: note: macro "SCRATCHPAD_INIT_STATIC" defined here
     153 | #define SCRATCHPAD_INIT_STATIC(name, _static_buf, _size_bytes, _min_order, _key) \
         | 
   kernel/locking/lockdep.c:605:9: error: 'SCRATCHPAD_INIT_STATIC' undeclared here (not in a function)
     605 |         SCRATCHPAD_INIT_STATIC(lockdep_trace_scratchpad,
         |         ^~~~~~~~~~~~~~~~~~~~~~


vim +/SCRATCHREC_INIT +265 kernel/locking/lockdep.c

   261	
   262	static struct scratchrec lockdep_class_pool =
 > 263		SCRATCHREC_INIT(lockdep_class_pool,
   264				sizeof(struct lock_class) * LOCK_CLASSES_PER_CHUNK,
 > 265				SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
   266	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
