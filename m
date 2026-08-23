Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13BF3D5656
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488459; cv=fail; b=gUbT9iawstxUo/jYCRTJzrF4OOJcFUlcpTyl/emdNIc46x+ppht7RCTRtVc8wba2jMMrlqZjsqg/y3ztj4MzrZq/5SnKh1UaJD53XTQFSUvrwtvI2CJMB6k9GvyRKqYbbGxcmvuAY7LMyXTVNkozFdXkaSaUY8LOCXIGLlrr3gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488459; c=relaxed/simple;
	bh=XwfQ/WLaYrfw7eHmXtJ2pWEfnL+z7HGdtkFXdWaDazY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ro8RFnDzHH9dtGXCcQCXXWo46qMTTIwqRMBn8TVkBBQnUs73BquhYmd+36FuEir0bSm1mPEBAYmpj9B2b9EIlTn1m+yudOjAFbM97tFj9S8o8Z2M0Tm+56mvKsZgPAwv2HZ8U5ESae3KWtc49uB3vQ+n5KH3Q0PeDCDrbIj+BVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnCqG7GH; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnCqG7GH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488458; x=1819024458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XwfQ/WLaYrfw7eHmXtJ2pWEfnL+z7HGdtkFXdWaDazY=;
  b=WnCqG7GH08RlWq6eq5BTIogWa96ppa929r82yvIhXtqDhQ9sR6fs6Sf4
   tayKLN+Lg/gKJ4eYW/DbWYXAW0ggDntDp4kbauvKxq7CP0RtN8bWX0UqC
   hM+ujA4M1HlhwHBudh08b8416NJbzQZjEe16jZ9PnRgXrYtsX3hDz8x/F
   z9/pGAMnCqNomD9afwV4ckgyFL/Ap7EyYz7dS2kUmIBtHz9zpMkeXXPFZ
   UiUvrgwSscEr+oCbwmEGzEdDj9wNVJweTeTl7kQDppcTv+q4IVXZA5OTM
   8/IwOVOuKhV05xdQ9UWilEnFA2I+zKqdfyeLm1cCodfEZ3viCWMdN3IMz
   g==;
X-CSE-ConnectionGUID: k0fV+0IyQpGYKyq8SlvjfQ==
X-CSE-MsgGUID: 3AnUMBd6QLe548P/Hgqvww==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87975162"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87975162"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:34:18 -0700
X-CSE-ConnectionGUID: p/MuvEDQRnehbvayOtAxLQ==
X-CSE-MsgGUID: OM4QdwLvRDiMwpUH+u5EmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264994206"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:34:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:34:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:34:17 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:34:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmldO7vHetB2DYjqK3Fq2XjOf14YnDT7IRBhKolsX+3llU+8tylpPEqPsi/yak+J1wMx2ZMmGdYGKMHFNLFxO8L9pCPxMYFXt9Gedkhx20M36NrWKLARSgR2ivYXM6DLJAOmRp65s29s2A1iHs4uOX9kp7sY2XdUBuIV3owSZ2W1fgu1gmOCZ1qUFyY0PaJdKqZTyxeP4bf9L7RpDKR5JJbQCvThunJkkrOxFnuuh28+P89LX2rIC/CGd+yBAxaIj777k1k8HcJNUYTEbssfj7hbLh+GTvHEkG9rtsFSiZezGl5wVumBPQooCdo3st2gN8292xXyT/yZdU8d27jweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnUYRBZHdHvR6R+3AWmVKik/PHxv9GH/VT0Hc3iotNg=;
 b=PC9Rqnr0TROHEoUTRHhxpthuLEdtVkQfW4ylDrkZ0YbPi7APPIeNTNIx2U0sbAW7v78zLgjGM18vWBTsMyavmRHnYD+i0zMNetcj1oIvMczHltHqpXmgt/i/6k3Sekwh4vgB+ECAdekxtpiVCyKO4el/oN59959FuRgK5rzBUzGdEdYIJkQ/b3FIb8J2ETUzYUHKqzTjf6Bm+E6kfZykISfnu6GZvwmxFYuO7Bo5O/QrwZ15SOzVzX/51QE7c3ckQq5dz3PT1yO22mtqFnhTNolXPKR+mckN+PsrIqLtx5okMqmdySbPErV+iYRMjQM8DQRrMDCqiJN1jBg40MZ83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:34:14 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:34:14 +0000
Date: Sun, 23 Aug 2026 20:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12 2/2] ERROR: modpost: module fuse uses
 symbol vfs_getattr from namespace
 VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not
 import it.
Message-ID: <202608221831.BMirUklv-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:4:188::15) To SJ0PR11MB5214.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: c9507f18-802d-44c2-fbc2-08df0112d72d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|3023799007|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: OzOe9VbTOWVpjS/Zw/2aSO2T4/upOgYu8EWnxJMjZXeCVJk9ZlKZLknnh3wl6+yV5Y0C/zOYezJ5jD3Wdyy9DuQYkXpiyR5b11sG/fdRhT+Bv1ruUsyBhlOOrgCYf8pm/9r/FOvINGiDmbIy6f6MvjwkLraxBg7UAOgu6eHU3XVZkv4W0AAmPRkPnOM71VwpEzZUN2AIyxn/vmuEKQoZbRuqkwT2atSvTXkX5IFgJ33bD91RQzTdgvuWZlIKvSE53P9wesz/z+4aMNnNNyJqwGEzCfnv/IOIKeUJ2vjLy8+76fwXLsu4KJcX4cS9SerthgaSCHy9215510E3Bj9LJwLBNSKFjVOsMDK5PVayIeg9cADeh9eY4K1mMnc0fNdSwWJ5KTTYdeL1YyztiFMggR09J+OAGicaneUa5+LRzci6auR4iu6fxkhWRCrMrCYsqrFLXLSSADjERKN49rw2pek8KWwitbv5sU9R0r1sD2UIlbkWCobtzZpA6stFTyTGMcd3tOga/puyo5CgkuukP3e43JKnz1lAeZTjljDfUe9PZNZoTKj1kAtiZRjVwRzQX5VRSSZEzRF5tq5Bzi3dxQyEwZvISTWLBAlyFJ2cogNgBnH6N2HAy4thrA+fDlmWcFkhaxHigsN+IQhWNPge44hg2An/HN+VKlf+mfi4smU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/3SDmsPvzW6nKGDmqFuqiEcdc74uL40Jcollm6QOO8TiNBVixkjEd0sPEUeo?=
 =?us-ascii?Q?F9sYpmsOkz/o9rGgEaX9UUkpCWWAY7FmB2v99MCoO/3j6FH8xwVs/Wcbx3+d?=
 =?us-ascii?Q?M8CCAuvPioyhTylgsFRhNk/o2RRCgwop2dti95udLzLxS+9ldLs6wRdw0GYc?=
 =?us-ascii?Q?CDPWJWzbzPZwhDHwGLLYbOKgYzEO17pBz3HhfPoUZjDFOEZ7vXpmkBDvRoK7?=
 =?us-ascii?Q?mbIVSUV2U4smrGy75RRo7M+dyj+bsu7rAB01VoX/Nf2G5rPZosYlUe0ibD4n?=
 =?us-ascii?Q?6tL9q83tDYa/IPvFsYh24Lv1ws7mxgCrFdkXwfTSify6ZE+RuTk6v+IG388Q?=
 =?us-ascii?Q?B4CPKZAhwvgNxePBUuAksVTuRJlCp+u9iVZxwchV5BLeKjAFmwYjnZEVz8bS?=
 =?us-ascii?Q?mZWRbWaSr9TSJI0CWIEq7Jz87aFl04H1WR0KH7gsMOuDXpl0nH8uXuHr6TmY?=
 =?us-ascii?Q?AaiB8c4dNT3BzDlpb/f1WAq3qAv6tCkvn1BI4JoNPcaQQq6C9PpmpQughNSJ?=
 =?us-ascii?Q?LIaOCYAS6PAYowTkuhk4/5wYQpaclUD5kd6QM29g5E7eLGLVDWAT0ojTxRTO?=
 =?us-ascii?Q?X7zKrSTA7TQsy4Cv2caPwm+kNDAvWSF3IWx9yRDO3ez9pb6HuJ7HVWVGHKY/?=
 =?us-ascii?Q?rbUuiHtfl+WDLop3clqYrJXdd2z6k1sMfv//rh2v5LEDfGJggWU6GzgUc2sh?=
 =?us-ascii?Q?Mhv0Qrjppjm+l+fa5VxSJh0M8fcmfh54O4BgPGWrA+ITdR8LLKv+Dp/Os03z?=
 =?us-ascii?Q?MSQzxWbBj6DpQkh7KJv/BUUKiLdWSxhTWlSMchi+poL4saBcdr1nxxJwUH0F?=
 =?us-ascii?Q?YcSYjZ8rya+6WTe97SlmD4SZhfvyFHwesDyX+20Rl1vZVok5PSUNBQQtYlUO?=
 =?us-ascii?Q?kpGGGgc5GoSxIdIxLHyTH3UaiRXT9591UGrmEtstmKsjoLI5FE6LPLQUYxzW?=
 =?us-ascii?Q?U3COXzbqpa80J0YhwISQJsxIgdiGpBEMQB5wYJjkfjMp/LXPymG8VVbnRSJB?=
 =?us-ascii?Q?acsUIsjnPkQ00sPw8ji5UaGsyP40ZGUU8cllTErJ50WN8lKbpBktHcuDGfwo?=
 =?us-ascii?Q?s2aLIGWGHPszQPhUNu410kyQYWAPr4EpcQ2ASOFH+9hYd+N+B+r2m1vza/K2?=
 =?us-ascii?Q?JlLm9l9xGxtWlFhYn3bXf/4ocXHzw648pRo7oPmKrCB1bOiYi77NO9qoB/p3?=
 =?us-ascii?Q?J5qs2psewHYwJvnCh4oYCjNjLB8BTZS7Ypjunxjl2y73sMi6lBc9EQg/moV6?=
 =?us-ascii?Q?6I4Xf/doh757rQ+O0w+JgiPWDuC2ryJH4e9xOAHZugq0bvXM0PqF9v5J79GP?=
 =?us-ascii?Q?5WCNqafcGWzKauTnpiw7Sa3651sPzsjTotOqRTdLM73Pzjaz6ojB5KbEM9HS?=
 =?us-ascii?Q?nAf9yc6T0kIczyrxVao3IDZUjSgoxrW9jNBCRPd7zwA+hiadh7fG8CBuXdiz?=
 =?us-ascii?Q?bV4aXt1wC7t3iJ64yd0aNWA2js7GQB/uPyVRkAGUYqxMEClUhxAiaPa+UYjb?=
 =?us-ascii?Q?MRNCDV6OMyCXupTMGccdC3BZZ9BbgiqE9cgTXF7f7nSRd5jJNziAeIXF+zVQ?=
 =?us-ascii?Q?SjGpwZaG/sbO+sqDKb3j3rh2x459RR7PR6TPhy30bhkuiNcvS/DGDQe5OdGs?=
 =?us-ascii?Q?4IzUbMk1XNsJ+5Eso4jZEs1HEL0+54Lzv9v2mNJTR7SWNo510eS4XzqAJKFQ?=
 =?us-ascii?Q?MJP0+e+FHL4e8L2R4heYmsRnjuINErMMmiSk4ZQeufsNX6G2Mj8hSav8s9yG?=
 =?us-ascii?Q?5F2qAO1+uQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: qEKVWpqPTEtbWl2i2URXA2HbyjrgMEHUTvBQWCHopTIbL3TiKozn4u1TLlBg+EhlBA6v5XeRQkbjIYIn+uqkiYjNh9uK71XbV+KLxZXyd6t82j57PvaXajXWP+e7pF554r19H5RFNse0luvZ1Ijc2D4p0TVuysdheBE/vSeYjKPsts28jAknte0J4rCXrfZkj/Zv1iZwXomKnDGiWPUTSZe32SN04okAI0VgXTsq0AQPHTfWFF1vSRAm9AM/SxPVdlCRabOPJK7+qkPVy2PmjgKVrXBq1AXAspRZr2im15NTImuyBSqo2ugDtLzPzBFrgO31HUFEBIYyTjam+6RNUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c9507f18-802d-44c2-fbc2-08df0112d72d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:34:14.3422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoCPyaXZwN77Y8vfwM96iUHpwfMz6JNEunTDb2de361KIKbsxij3vYQyhPd69Rz9oDjTeK9hEZz2w57vsqmYyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e8c85685a629de4d09ae447b4fac9bfd315d3674
commit: e2c81a7fa3cb3fe3ff19af6fcf11cf014a578f24 [2/2] ANDROID: Fix incorrect namespacing for ANDROID_GKI_VFS_EXPORT_ONLY
config: arm64-randconfig-001-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221831.BMirUklv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221831.BMirUklv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221831.BMirUklv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module fuse uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module fuse uses symbol vfs_statfs from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol d_drop from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol prepare_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module fuse uses symbol lock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module fuse uses symbol unlock_rename from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol path_get from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: module fuse uses symbol dentry_open from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol dget_parent from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module fuse uses symbol mntget from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module firmware_class uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module firmware_class uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module ublk_drv uses symbol vfs_getattr from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/rt9455_charger.ko] undefined!
ERROR: modpost: module target_core_mod uses symbol revert_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module target_core_mod uses symbol override_creds from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
