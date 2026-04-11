Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C678F175A6B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775916899; cv=fail; b=K367+7Pz9mdaP+oeOcwt29DOCXdVKn1asWpMA6kXs4sW6+mRzu584fosL0FQe1mCp4h/hxWlyctP7V+yIYVarm4hGrhrBJr6zC7o72yu6pSYJOXqTy/axhKzA/6DxPdQBIKgPvgFs9+QgfrPCP/NOvql7eHJW8uxuvH8tfYZ1rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775916899; c=relaxed/simple;
	bh=culS7qwtM3q1PqE6tbNhixi91zK1/pIaBMTAQ+/eAmE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dXG2NUxcr9JgVuAgGgBSTHOv/zgYyZoK9kb+jifJCBCScKv/ecTuN08+iQexLFNh2NfBdjM/4+IIAIazb09W9NiceK2qKVqyYk+wvsIKXeuJSv/48DDwQUqSzxDr+fogYFeZxbyrNfBrt7nCN91exAgrLNtWRQMemR6O5eNILK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1UBzY4C; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1UBzY4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775916898; x=1807452898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=culS7qwtM3q1PqE6tbNhixi91zK1/pIaBMTAQ+/eAmE=;
  b=j1UBzY4CrgDSIh2WsVyGX5UNNI45GXaMj1OtFgvkXIneiE3cNrvblvdA
   MlqA683SJ3iEO6za1HOx2GRD5fGPNccNQc30oH0HC7MIcZkJJBYBD4fk+
   vefOca76jhsI+mSCIJbyhpPe37WDneYzg+c+uzjXR+RW2KvELAROMv1H4
   UQQrcc5Q95Iy2wmEUm6XnanU53YtMpv0HkpgSVTZLl0YhkwHslo4/L+nU
   gR30ZNNhDQTbD/VIIeQedafgHg5UCEsWBxz1qI03nlxwXI/kX8Rnb30q3
   7hw18TfPYAGKB8pzf87ep6nS736uREwutf/6LvitiBCR30uZASYyciyrf
   w==;
X-CSE-ConnectionGUID: MTV+h5DET3yjZ6fFzCwInw==
X-CSE-MsgGUID: /ixvCfDmSVOujg75B653yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76875756"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="76875756"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 07:14:58 -0700
X-CSE-ConnectionGUID: wbG4OXW0TUKV1S07cdRs0A==
X-CSE-MsgGUID: vpfLhMTrTs+pO2rQAkvzBQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 07:14:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 11 Apr 2026 07:14:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 11 Apr 2026 07:14:56 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 11 Apr 2026 07:14:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/+KEqX/RBfhnRqC99c0SCxoIILez1QnRbvK6mLn+bi3dM8C3foGovpMWzUCW3FgbxmE/kN9669579i3uWogOcx21l9vZG0EjrTqQjEiUEoJFxBj4AfX5Jef2GDEwah2c3aQiRsuqJ/FK1ouxYw8i1noHjOr3ido9kvyW+DTrFiTt26DC1EIqwD4vaVtCACMxdo9w2ntkEQqVaNQzyr5lKBZtuwNOo/LgW5bvRNTJnuUH4BtutCoI+PK/0WufJlzXcvwjM7HpOHL4fJXzfaPXe905wSyk4ix34nEntULa9OnEQ58g5/62UQOyxbD/UaXgPmnwDeIM69a0egQEQWXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyK38unHZ2caLS11cLdHFA4gAUi65YJzUXuu1V9N7I0=;
 b=iftGo32l9k/8FdvhaoAmHwwjPp0uxRrfkl8J6UhNSUT2gE3r011+5b60oEfwwjve94sHDvnHk6A1eOd7JzqjkM1sUFJaP7E9jnzr/V3jVEQT2rlUFGF45SJ0PsF+UoXiAXb59WPWXb9kTFcXjbMWoy86En02d5nABxZL6SvAYFgQBKQJr5oXIh/6bba43Ytzgn5VnIQIOVlD406C5ozMlVbCuWSkNq9KYUrFD6ldMNJnv5h+AR+75sgJmMBvWx0dDsTvGSeR9237I2/tbCZcI0Ls+TPlE9gqqD67Xb4JR0hytzSkML2GKDULB5+Jmr+D9tSnGTWucLX29BXcaq79jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.17; Sat, 11 Apr
 2026 14:14:54 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.044; Sat, 11 Apr 2026
 14:14:54 +0000
Date: Sat, 11 Apr 2026 22:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [deller-parisc:for-next 9/11] arch/parisc/include/asm/vdso.h:10:10:
 fatal error: generated/vdso32-offsets.h: No such file or directory
Message-ID: <adpXViTnqpLXL3et@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d1bd5f-4e2c-4d3e-abcc-08de97d4b3c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: A8JcJooOjuIlWD6LOnxQXl4Vtx2seJHKKuHZI3R2gckytPK88biwAM51Z+sIQCOWq/VQ+li2LHR3YWw8RIN0vM/KBZJHRmnuff9kTH4gJ/qIAX2tCFhYJ/97U4W6TtYXqCcx26/krkK2Nrci2eBpJUx2rYp0SEOBaemRwvY21kx3qeVKYXX0SuRVNncAkwgPrUwzx42X5MMDeLvWYmZneL87Ch0QCKZF5CruuIAyGTKDbEqOkkhmuc/HqTfws0rq5YsDqZPWbrhskn/2dsL0r6sqNZYbTnkJ/ujSKJI539uZo5fc/YLf77Kg8ox39sU1uPhwlc5/XSLPbipPyJmrQm9R9V1HanFDgGUNNrUC7f209cq6YC9mOJGeNxJVMbucTByA5Tn6UkHkOgkeE/kpTKe3bvIGWMLrhTJtAhnXRHN2c5YojIlAWpJU5/HHVdWEJR4NVsstpo9IrvRTJOyhyo6aq3hcbKUDV8Hj+LgycGN9v+RDJX005AHIljhjpfLbPAzMdaM7EVZmL5eLMgQyMIhoF9Jbmx/lP6H2X6AM2T0vTuynjGLh+TqtUYgqpTkE0fh8OnXuK+f/mdMt+ZOa79aOCd+7X9bsgHC3fSk9+Oem2HEji8wDfNWEaz7p6BqxPZsoy+YJ2mziZtILy3WYjOFaqxF5RmD939TJ/9eLY9FPOTVdXdmjLczjwkwoaELo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5sIfoQC5PMAk+TP0inENKrXfsGTcP35YT8LL+J1e9yZcU3pr+0cBtWpWvKsE?=
 =?us-ascii?Q?R8fDOyDsxfFluRXUwYhqWZJV9kYgdpM1M6ksBVkIkC5ubxG9MMJojiO3A16f?=
 =?us-ascii?Q?KTnnHVA4w0GRJw+R2IPBpJ5w1CmIJuGKcHKVNY9bqfYbkbLfAYFW30tXv7om?=
 =?us-ascii?Q?8sNprj8K5tNMhSbx2yrDQotCAKyifdMv/iyCwDeOe6BSIIFq9dOWCoGHoYyZ?=
 =?us-ascii?Q?+TXVd5+ko3u+LMwl7LaO/ZLdQGB1SSI/lMT8gYkh5sHFJzS+8/G49gEQOzi+?=
 =?us-ascii?Q?3n3H1Tqx408GMtVzUpwKSRqDsaisDN1eDxuBg3TIffFar6jUq8qo4OHRjQTR?=
 =?us-ascii?Q?RPZREMUshuUBg5l26VnhXRR/Qe+wgYD7d8IDAut8Lt/zbA/ghXm6Rwq+RKS+?=
 =?us-ascii?Q?K0smvC7zRh5bv7QDVIYkIwK0Z9l/u0UlviQOUNzX+zQmyCC0ig2sF4UXJAQr?=
 =?us-ascii?Q?ic/G2UyBMyz6r2hox4fffu8dKnuL56gzcpGqFKLTAdwVgFpzRTzeMiybBVCX?=
 =?us-ascii?Q?wem47zSX8huZ2gqGw5zeYrmJrPc7DozI5TlNSCjf1LIKJK4h3umyxuta3u/w?=
 =?us-ascii?Q?vxfgchGIZGxitnLK6Hc2/NajkxkiJ48lg+2lEp3tLZkM5Fnr724XwRfx0hxk?=
 =?us-ascii?Q?MjRgM9nBwODiq74PT+4ynS6UO2iL8UjzguzVD66KU4lZ+V6XkTw0b6zkpGd4?=
 =?us-ascii?Q?JBpFRRv8ZSHd+57icgYMRaEwfw+swOiBTQcd6NxrOXqPE/1gWToCEYsE5UJ2?=
 =?us-ascii?Q?0XRZk0/DMJ7AZ25ZEvqGo6VpzWvFkAjGo+x7J5ArUB3EIH8VGW3Dal8ShgNx?=
 =?us-ascii?Q?ovkAgAJMbCHeFAiegKD4oMss+8LuCAIBt0LhutojB0POXZdvF+RX9mb5/8ui?=
 =?us-ascii?Q?LkxYS298ADGqcCfyV/bA6f0iCax7L/E4auXXwRNIBc93yA49WLmwW4mCAu39?=
 =?us-ascii?Q?Xz18ZTQgrxF9+wVhpcH1fb7P9GAFt/JyAzRzJ2M+GvHiGCDRL3KShPP7g9/b?=
 =?us-ascii?Q?kdx8131Xa4rtLzACVwP/Wfs6fZ5W3XOUsVDp4+Beacn7FzlVULfyXQbpMB3d?=
 =?us-ascii?Q?kK3IFG9UbM193SnV/0MDPCpiVBb3m9wwNNYJGHqG4d3MI+Tvhj6HoSo9uGF4?=
 =?us-ascii?Q?8uPgKlMk5kJhr6LgycLyd2zp09MoLFjdSJ60gimjv9guulRkGY6zNGECO6Aw?=
 =?us-ascii?Q?gBY9QfKRBpyTOLw/DT+aPK8JIlQ9d9R3T4dDKVrEdgvtllKMXukoC0MajMa2?=
 =?us-ascii?Q?PcTXJ7sjmO0BSeW1a1eUFv99RNhJ43qvZ4SJLVTGQrxkZu5Pk+bv8LW9okyT?=
 =?us-ascii?Q?gqXxEkVIB7QpGhpLIW5tvLbLhzGNR7qlPsOWT1eQu6e8xImgJz2YDK2RlT+M?=
 =?us-ascii?Q?2xMjzIboftHJi9kxNDloL6j2lB3Wnw2XwfYgj1BXQrT09K/Ea8zUi+eGVTpi?=
 =?us-ascii?Q?9j/OlNV8O/mB6tE8okH8N5wgB0WVnBDwjzuhRkuvHh5Klp7YDl1qM4WATPH4?=
 =?us-ascii?Q?aQNFF8ByqNC0cedo9qEzqBfUN7mnu6VhDQpoeXwmyzcpQB/cQ1qq+FUcFal8?=
 =?us-ascii?Q?PPFC8Qdhz5gXp2ofh1vJAilOvklZRzOYo94MSQHnfrWBCjED+gBl2s7CELX1?=
 =?us-ascii?Q?6UolkXs08v5xjziyDGMII0qYbPcnIvUi1XP28HJfZZZS8N2yIA+PsJn/kGu9?=
 =?us-ascii?Q?75kpO7vL/u8GurMfjTth53+aNnXxEFRkBn2DQ5I5+r9lJ5aS6JzSPhbXzSKa?=
 =?us-ascii?Q?jT73JYtcDQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: GXriSzgPcDDyb7fGujJE4ddIiih9UifnuB09dg3vCLjTdrKYL1zLlcw1TppwuY6Bs9nCErt/ACbvmIARilmsi5jlwsGyU4WkcKk7Hn/tvQTRNgXXtw2nwIUlPRajQpeHBMaT0MHQXwnWeFafVlW9rJtO3AVkCuNsr1y880qkEu1jCwjnd5vfSjSGeia8yISJAOv0biA8UIZpU46yXmM0Bw4a2WFCVGytzA6OVSIZuMNfN4EukjLcJGTS72rhNjE8Ie/IrvFtcfwrG0kNdp6SB8k8/sN1lEe5c0oYxk6gKjMtpE28A4j7w/AfcKAEkAtRcoIfg/6AmXdgcgQEAu6ldw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d1bd5f-4e2c-4d3e-abcc-08de97d4b3c5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 14:14:54.1682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtJMepOffv6lkCErCq7JVZEhoWxh2yIXgBpFmW8XlZyTJXqGFqNo2vYFyTvr2uzaq95jGlYFgqr87Zy8I6iAyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   c3eb6db10769872a5d01efe36ab67d3814e2af24
commit: 019d4ecb3887d434d9fac718555ff38ab2a32bed [9/11] parisc: Allow to build without vdso32
config: parisc-randconfig-r061-20260411 (https://download.01.org/0day-ci/archive/20260411/202604112143.RQcoJtEO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604112143.RQcoJtEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604112143.RQcoJtEO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/parisc/kernel/signal.c:32:
>> arch/parisc/include/asm/vdso.h:10:10: fatal error: generated/vdso32-offsets.h: No such file or directory
      10 | #include <generated/vdso32-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +10 arch/parisc/include/asm/vdso.h

df24e1783e6e0e Helge Deller 2021-12-08   6  
df24e1783e6e0e Helge Deller 2021-12-08   7  #ifdef CONFIG_64BIT
df24e1783e6e0e Helge Deller 2021-12-08   8  #include <generated/vdso64-offsets.h>
df24e1783e6e0e Helge Deller 2021-12-08   9  #endif
df24e1783e6e0e Helge Deller 2021-12-08 @10  #include <generated/vdso32-offsets.h>
df24e1783e6e0e Helge Deller 2021-12-08  11  

:::::: The code at line 10 was first introduced by commit
:::::: df24e1783e6e0eb3dc0e3ba5a8df3bb0cc537408 parisc: Add vDSO support

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

