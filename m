Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A2AC8E2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 06:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710137992; cv=fail; b=Nqdzte2ZnAivjqepKs37cwSdCvji3Jm3RIrFac0qKQC8lqUZApkYs2Ow0VcjnZXFXxNtuVd8jxsKpeQubwiGfWdgCxwiZCPUKTHqL7IfDwp0rQCmOXsgsnYAkd8FKjh4u+6+LVd8WqeIWqT0XNJSFIppnmTWHg1WVUtRbRF6wI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710137992; c=relaxed/simple;
	bh=PhARkqWetPxSdZKz7VjqZDWq8H0zFuJP0Z5BT9YrT14=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=A7r0VdVsEGd0KGDtNUZo/NyZ5EpJdxP/l5AUMkQv9QbNp7e5p+AGXer5z4jXLJAZCtkglJMRQFCC4bXDDoxiXeRctFN0HxGyhVBGcDUlKhPHR0SLwrInyObATrOEamM9k5R1dCIFkPSxCAdtSBp7E3HSFVNvueT+wTayf1akVhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxnwCwMD; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxnwCwMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710137990; x=1741673990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PhARkqWetPxSdZKz7VjqZDWq8H0zFuJP0Z5BT9YrT14=;
  b=PxnwCwMDdBaEptJeaq6OtyRE3iyf6WlP15zIQTkjTRRaxudH75OjGBzE
   UpFSCHwKp437XBUyLyqseddwwr4gvyHKZMteMFHISiRXM3IVuw8M1QEii
   rwCF9ibf562wA+fOzxb+vHNDLY+f71NEXg75GtotTGf9cRSmoa/oWpYmk
   JF2EpfTIPhL+MDEY7p36Ve7AtwdSpaxE8mQS4Kz1yhcTVySjdBTKXyg5o
   i9QmgTyzcEq58pEpGEmw+futyur0NART3T/AgbubhzJMqNEI2zxbYBegg
   lEjf4x6NOHv1mCs3gwwo9+/4Wi8Y3KEtheKC6enK/DtF4l51Xg/W4rYrt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="30226363"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="30226363"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 23:19:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15655500"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Mar 2024 23:19:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 23:19:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 23:19:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Mar 2024 23:19:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Mar 2024 23:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSDNWsI0MzdhEsfYj35u+NCVqAdZM7IwG3sn+h+aZRM/0BYWcT7IXVrrGP2UX4EqOL4dWkzZ1LwVwRgRa+ViXyWMZOXpWe8VF1qgcWwXEKNqvmjsZH+/1IUJKONe17+3RVs0VxSwMUh76xdvZhXuETZdHZ7ILQSYbJX9jpj+lApLe5bsC6e2fI8bhAcQLCBeLHB4k1qjMedVnaIMIyELx37oB6Avx4wLEHafaUf3oB56ei71rH8Kth3sn168l3QzkT4crkWQ4w3ORt+CGBxH3ohuBwi64WrkziJYdvv3LoSTKwhDh8VrvwXqKLcmlYBTIgABxN0NXyp5nMqKhqZqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCXIZL6CTW30QiAfO+rbhgG2nTkiEbeMpCBLkHkT8jw=;
 b=Ve54mjJkbZv+4H3x6iFeX7sgVAVB3puquuS6a8cgrqi2vXSy0Dk5hqiF45EFWxNxbiAfsPcd3EOTKUIaiuCmrtItdRSiSwKssA04HE8lDalsPRA5CTO1sY/Ks04hw1Pd3B/jYBmUlLpxcVIrHEMsB70huvUxtHP4HomH5SXb/1s8MElegmLQXwQQnWnYxkhnG4ySfK+oExbmrFI3RjJT1SBtT32HZhzHZoZ9jGkXkZRBIc2J5CTVWD+2bZ/Hgh1A70L5lgZmh93K/rDko2uBRkYQlNVFh+cR+x3WuU+PdQKR4MaXWiWb0dcjKtz9Oxny3VrLtJRnTNIEqRGl/iD4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB8000.namprd11.prod.outlook.com (2603:10b6:8:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 06:19:46 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%6]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 06:19:46 +0000
Date: Mon, 11 Mar 2024 14:12:58 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [bristot:tracing_makefiles 3/3] /usr/bin/ld: cannot find
 tools/tracing/rtla/fixdep-in.o: No such file or directory
Message-ID: <202403110244.EybNPC6K-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS0PR11MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: 6831cc43-5b37-4d71-7f48-08dc41933fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pksQm+Ik2KV47zwBdjae5Xrd389NI5vihGqaQe9IjnJIHG/TU4Lq9kEmmUYz8RPK4T7TuI77xG8Z3FGWaXgwDEK5i5uDfd8sBa+tZSynXIGAgjwPr3uAglbWObKv0dBahohXBHOivRPNK8mig2COelXVUFmn1nmmgNhfAsG0ocgLZ/ryOkVNlCiSQsNeHiAr3G6AqPNqXbXIFxIdbTB4/l3pzkYuF1ATXEjf4BVPuIpjE3VmRQd0hHKwv4Y9oMmNFhyQI21kvj+vSom0q6wmzl6urelxjRcNJZ0gaZY1VdKLjfS4q/A7khpWpJdBTcajwtX2ImLmMw3aDDm6MNtvqB1cVPCVgT+omi47jgkQuEEaJFVu4n4LUbIP4ZFsFoTgbzPpOgLje9svAtv2dZmRdXoJ7ie8O3KBvMQJ3uHz9Q/pKptlSrSnhiUps+XFGtOsrAM0F+LJrCyIS9VYdpOmMOroi4nZ41+iMnI3ccxLu/VMtE2/vWMwsMf6ZvnnC0r5VpbMBrRdguBjM3JT+nLTHzBWzrtyNu0c1hB3eJATH3JOo+4IPlhtfVgC0PSp/TBTLsXFiOp4WjmGF87jbiY1ocv9HUKitpxzbWbrYzkMQD11Wabj9tkVlmnavvq6EYNK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fXbk815ZpK7wjpTeYeHLC9kMXFvXRcQoF2Twq+5hEC5psEOWYXfO8ZzSPxQp?=
 =?us-ascii?Q?B/jxqgrZ8EgWWCV+tGsJVVDgisaWM4KwI7gv1ejQx1t2RnuYmNUPaXmn4lWO?=
 =?us-ascii?Q?dBxwksURfhAutU9QX7ivmSl8gaW94GRKIULaY6GsRavX4dpxNeMxPob4Ytad?=
 =?us-ascii?Q?hFWN48Zu+e6WqFoBrxHJsbwaCwZWpaChRR5xkrLmBbRAo3xK5YoykXba17VY?=
 =?us-ascii?Q?xreYR5EMS+r6j4DZXLJojcDRzCKgPilykKNuegNE0M7V2+bSA9P2u0n3hmSj?=
 =?us-ascii?Q?/wjdQDhXtvFZ7lUt50Brq3kEfXY4ZgxEGAZWnfd0bV1dlO9NrziwzQCTfFzH?=
 =?us-ascii?Q?rDtV6eH+b6sVXwI7Cqm2Avj6T3O94jLI2GQuwWA+lIp4kj8FMBYbszwpuy2g?=
 =?us-ascii?Q?+KmRTkBbBu4vDuXByMwUIEuQPPgHvTxtuJYRDzK1Qhj6r7/q5IqHh2hUcWyd?=
 =?us-ascii?Q?Yn7B6muBCHYEmGq7z0u/iB1p8B++HEzOOaHelN1y/ShNKQw9A8AcvhVMFzJQ?=
 =?us-ascii?Q?C3di7VwzTojOKeL1eu5AlZbsRACtLvP8ft4Sq7FX6iIPQA2ESk+80uObw7Rt?=
 =?us-ascii?Q?oigfizBbmwpDWPRsf9P90Kalj/YnOADvuMJ+pAl6yKItsoxjVyWndGBY6WLx?=
 =?us-ascii?Q?8GJo5Z790sfnk9xJmMgyK6i57GzqI7cRQfOAP0xwGu4uEvL++8/eIp+qXfo7?=
 =?us-ascii?Q?cR2kYnGhsgZ+b8jwvurmW35HaLCoIzwpJlwUB53PluOnC3Y26HHbMgeX/skd?=
 =?us-ascii?Q?e19KOMHhZYbgFLLuIdipckW3VPTmWwBCe51uCQVz1ObZqOMVDLZyxLlbopz6?=
 =?us-ascii?Q?VmGZrK9Ibj/bw6i7V2QOWwT++oFTYQbQI2/4psOzzTn2VHg4roiP01WGBoQP?=
 =?us-ascii?Q?QFn0o3+jozh6nzuR9gTSD/+DZnHRc5Fe50/4t5BFTkPYpCrxlIuyd+TKyxwz?=
 =?us-ascii?Q?TTobPHmPmVqh0ltq/DcRM3hYQn+WYSCAGxfAKgaPLFVZpyNL70qtyYoodUNa?=
 =?us-ascii?Q?fZHJt4lqLty7id7gWL41s5ucmAzgqVkfLsi3AxY8ZH/VKzLHtfXkx+4BzkrO?=
 =?us-ascii?Q?ONtnK4+Zr7MacvdFUDPYEwqLa+kRBfVKCyPzfkSICaBF/7c87QDYVLAgwfz6?=
 =?us-ascii?Q?OPV/hAJdk92TusAuKKHDkg4KWJtGKMHGpq82BFX/jGo5uJPRxwvJIuVY/6Lf?=
 =?us-ascii?Q?f/LV6Un2mqKvak9daDGHszOogu7qMQGmQixqH5nwE6E0mAP9p8FYB7hF3RHL?=
 =?us-ascii?Q?bZKKUY2akRHtdOlHV8oW1qPKFrrPrzhLWEnhgfWOybI6B9Nr2J/w4h/azUi7?=
 =?us-ascii?Q?QU7RfTae3pA0GnzD0k2Zo+GYPVfkYEnkGsak+9z9/+VsXXThLN2saCrjYmDQ?=
 =?us-ascii?Q?04Gz31PJQVKouAWZBFq3SZH5jKeol4Mx/yhob+aPAq8Nm+z4pphyMhFdcVFu?=
 =?us-ascii?Q?Ul94ZxndYwgNhyZ55503HsanPVemoeuUTmy4PU7EgMd7hYfhBJASZnMf3nCk?=
 =?us-ascii?Q?DIDwhIWXxH/T/5CR2X6BAdPuSwyX819xJ6jjLzursZyMaKKV36YPYPl5O3f2?=
 =?us-ascii?Q?ThL7pym+7d1beNUivldgvJM1IW4Falo23rHmHqHd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6831cc43-5b37-4d71-7f48-08dc41933fba
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 06:19:46.5597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yupskG3g+NWCPwyumTVwd7Usecj2BtkT4KsvCS4p43QK5FHOIEj1sQ3YvyLtpXbTYfdHoe0GKqqt3sH7kOv4Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8000
X-OriginatorOrg: intel.com

Hi Daniel,

First bad commit (maybe != root cause):

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bristot/linux tracing_makefiles
head:   4ab413bca202fe480bb9fb8e6e1e6a556d50b0c5
commit: 4ab413bca202fe480bb9fb8e6e1e6a556d50b0c5 [3/3] tools/rtla: Use tools/build makefiles to build rtla
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202403110244.EybNPC6K-lkp@intel.com/

New errors:

$ cd linux
$ make --keep-going -j$(nproc) tools/all
  
  DESCEND latency
  DESCEND rtla
...
  LINK    tools/tracing/rtla/fixdep
/usr/bin/ld: cannot find tools/tracing/rtla/fixdep-in.o: No such file or directory
collect2: error: ld returned 1 exit status
make[5]: *** [Makefile:50: tools/tracing/rtla/fixdep] Error 1
make[4]: *** [tools/build/Makefile.include:5: fixdep] Error 2
make[3]: *** [Makefile:20: rtla] Error 2
make[2]: *** [Makefile:73: tracing] Error 2
make[2]: Target 'all' not remade because of errors.
make[1]: *** [Makefile:1360: tools/all] Error 2
make: *** [Makefile:240: __sub-make] Error 2
make: Target 'tools/all' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

