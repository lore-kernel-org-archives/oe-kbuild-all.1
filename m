Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056832D6E5A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488337; cv=fail; b=uKKg+OpKL2U0/O3WW+qLVOWIxosAnjmlalpVOdCKl7FQE7qUplPcyu67tm0LREVnDx4lclb8khhY3TwkWfa+3EOlbjnA9MxZ1T+vhTBwjlBFofM7RfcKZ6fU3sgbQPpAwGTK++GO6tdOmq6SLCJpDkZHJTrASlTOVknja686hyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488337; c=relaxed/simple;
	bh=/GaIshWruKjGqqT/X5b/w0Gn6MXtF2mJEY16vEuQG7g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Q1pK8a3thb/EygWF7yLpLLXx3EdHKWE7aqUXKnC4gs0mPwzOlAyX2dYqxX0fl/pdEH+IhEJyGHKNVBWAGJxeHF5vjWSMib3n38WRfVckralIVgIKp/32MlyOwKFK3aBd0pJrHKlCaxQm5PBl+E9O0wUXs8tVX1mjrnUR1ERC7Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRVl9Ahl; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRVl9Ahl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488336; x=1819024336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/GaIshWruKjGqqT/X5b/w0Gn6MXtF2mJEY16vEuQG7g=;
  b=TRVl9Ahl/on7ZmZcDYM6zGiVNxAkpMBRc/MurbORDgSH9PHuL8I9lVM5
   USrh+OyMUIq2uVaxTk7U9qyPBfGT+MkwAq3jQW3QcITT8a417DW1S7vEC
   6OXhmUCCcHMxMwSwZ5oILZUSbc5vOzA8uPYy5VfCjY22bB+yYo98s3RnS
   31pQj+1lNY7BLvrQvGTAFDozldfPdIB7K+F8L2YnjZxvbDIwCq0g7sGC/
   A2ljHMo80WAZtm5KnmGZgxTGzSjw7SMpOGqWxKmhsb35tqrgHbUsgOMyv
   sl0Pkb5I+Ey2+K1jTg3qIVDowtueKNL7/wNJauUSx4Ik7uOtCkRNGJLKu
   Q==;
X-CSE-ConnectionGUID: w6MLtGQdSO2yNUfcrkrSbw==
X-CSE-MsgGUID: DUtcsf4eSUKjKX9CcWfsLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="105497553"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="105497553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:32:15 -0700
X-CSE-ConnectionGUID: MP5mXA9HQ2q0g6rm1Q1ubA==
X-CSE-MsgGUID: EH0wq2YbRvSomAuvR+01aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="265461174"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:32:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:32:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:32:14 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ou0GBZLouYhx9Z0pQsNXD4WGPGmEs2aC1K2U02RILKiWXO8WhhQCkV4teK60fhA+WLi7dsBe1E4QJkuJ03DslhPp5vJdmJ0o3bEnWxWM4g2BK6C/EMko37lXkPHt76bQJRFLaP5nFZ/KJBTFsCWEW1GoARLR1UV8P8CH7fEtGL+m9JRFO7na7EeGJNCvwcEG2/UmviovzhZq/QTs3JMZp1uIS/difnZKPxAsZvSXtY8nIkCYpsP2wH4CmjgqR+6Z7AbtsmMozhj18oLa/RKAN6ThuP2o21c6Uc7y5yh1+io8zN/a43vkMT8M91HNq6flTmiak18cTB1Jjrb1e9Fe5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYS42SiQgk94JHLEagykv3pLbiwUis/l+vLmMFqg8YU=;
 b=UUFM98y1Fe6E6H1ZUXf5S2/qjIjXrNBaLQDewVZsnhjoE864qOhLxiBT9laEl68bFfpGmHA4iQdWVgy8MjrLme3bFs5kDGEfKj30UWp8rOnNjXMvIDNQE7KqHcAB5MYm6qmF5WggxbuHfB2bBz0m0fOuSooJWBUeVGKcyFUZUlzhWm9jW/U7384PCeCjh+U30n4jgBwDa9u2bGi8LHR3ey5vg5hZlE21e868eRuj2AlJsBD/AXSejE2g+4YOEbsZWqrmiNvSEYYKIug5BoPW0Ez5qtrC7qMUdGMiSLhrwgPGX9HzJMFhzOLOC/EGOavL28IMybMd5q8KBan2B4MmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:32:11 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:32:11 +0000
Date: Sun, 23 Aug 2026 20:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android13-5.10 0/2] arch/x86/kvm/mmu/mmu.o: warning:
 objtool: mmu_free_root_page()+0x18c: unreachable instruction
Message-ID: <202608221940.w1zAaW7O-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9)
 To SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 56384167-0bf9-45cf-288a-08df01128e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|3023799007|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: DIBkLX/LSOOeAi/eQ8i6cQKvKKM+xWafPBjkXy7C3jpCL82tCm6jj0GUeh4psdpzSYj3fAJWahgkqAxqQsP0/4JztdEb1T7YyBRBISN52PO4SoVcI3Y88Ue+cFOiPbvJjPvey2h0Y/Zmg2U9t3o2ACU/Nl3vNqCaRKhBNTo2bezYxG4nXG6EqD7kZVBnUOsnmO4UHpBW0cTCwRUSA7SSP4JQF00TjfQL2LqI1i23iV7NfhTxDmYIllzFhOZHLoaNSfHpON3XskXOL5ODEVah3CkG/0rrzeiROa+kppW827EF7jnINwjzvy1HI0lVV4PtJYyXYt7syfSDiuOO8s2LCYQ/nGel4RFPLXyowPZ+ktHjjR43V6pUcNi+tOQeCTlMCMtdyYxq6FQw0JFr0j1TJLDPjXaacH2ayd0wPs4/ktQ3G0r1IWFNd1Qw9AX9YIpC2ltxnmwo+ejzL/Os3t0FtxsUM995W8nhVQLTULqNfJkD2XRc6ohJgMQO6cEtimZC/VKdlFgNFVGv2bBNCWjwTNiiUGsN/V5hkuSLVO1CzUb5Wlg3mX0zrTfUgdXPjgstlHJfyhng/L+GdNrrVxYkMEm3abN8/MkK2pfDIcsywLob1ztghOv7XI/Yp9ptgFK4BFARoyX17INuu1TEtkUDX9lNe94MTad77rJb4dWGK/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SkKmx4GMIIEzzx0iPojCrJlhTuUtQ9CdXaYT6473pj1qBIIkCX0aldlHRvSY?=
 =?us-ascii?Q?0JNJ8fQSHlQXMgeiaS/a07b0sZBg5bDP4slLJABSZa5+4owzHaf17eAQ7i0b?=
 =?us-ascii?Q?3DWWHOcsZikn5O/FKf9PqHH+Rxx+jfi3RuCzPnvZa3jNSPGWPzf3Yb69P8nc?=
 =?us-ascii?Q?4eiT7m7Ix/qm5Z13ANkUkAiSSI2nWcJlfM6YB8dMuETHKw3vaC3lYpXUOiUT?=
 =?us-ascii?Q?AIpRyZtIKNhGHP+wVLqzzGLg7XWLny25mhU8RG1i4DRA9XD/+yOdQ9KvCnFb?=
 =?us-ascii?Q?8ApWa/XUJjq8tJkSbAjJNXzO3j9oqRQnDukU1hIsPRf/WPHorEhDXtIPa5qB?=
 =?us-ascii?Q?M+KUFoefqhN5XShZzCMSz16+ZjUESKVS3qaaAPGRFqkg/HUZLbskrklQE4tS?=
 =?us-ascii?Q?UFR0hcsrce+u6BG7DgGkCWPS6O2sdV7AEUhXMHHwPgWGxA98i4/nJOs6u7/o?=
 =?us-ascii?Q?Ixny3t0euV1GvHb5ZFMNtbsq8gBYT0Lm+kmUsD0hu1TzdfPY8wGSO4/fi0u7?=
 =?us-ascii?Q?+j6XeeSDGQ4zMOAi3ZQbKONWZ8stw08KV6B11d57IMBgvKXIMcvt8rf+Ra2p?=
 =?us-ascii?Q?w3fXLOhSHEjPKhuBld7f6xQZRV+H1gjVp72heXe4yo+Y/gjZAFvFHUrS2PyI?=
 =?us-ascii?Q?MPEnsneAwhqErCSBb4hsjG4CHy0ZnJtnIKOLm40BI7fXPyfnfSD3KL9+qjYG?=
 =?us-ascii?Q?+o36zq3ng2UpKrpGIKHhbTb5rf/ZwiUJSJNpn3DLIpkA4tvvW5EGm2KM/PbF?=
 =?us-ascii?Q?j+hX10nyiYQ0dGayadr9HAnGyfnFVCrBXL949wbcBCoVBuZHHYJ1Mg0l7Lv5?=
 =?us-ascii?Q?/A+vwHuaFJhMYpefKiy4hD6v+jMFxHRBX+vPf3phwlEpv4nyFzZu9U9rayva?=
 =?us-ascii?Q?eWgEIgq+3Sv/qzIaiV3SMrZ7zsVDCtl1Z9FRJSQuvXUIpZcq5x6+ogX5EUgR?=
 =?us-ascii?Q?bRfZpcabw610ySGs/icFAYabqKbvd9e9KkgBEUPp0NZ96+s445lhKqFoHO3t?=
 =?us-ascii?Q?t4Qhq7kHcF3bRj6WBvof4WEwFEMwURAR377cskV67bw+34dw0TU7RCvxw9Q4?=
 =?us-ascii?Q?knAqWt1TeTOk0TqLQQ6Bn1fzd8VZTLMlkc/lBnjcBDs218q1TAND8qoyPpfy?=
 =?us-ascii?Q?MCuS22bXD3jcxs2htMQDQOmDEUrOJ/hLusNWw5pV2e8KUEVjnKueRbY4Yaca?=
 =?us-ascii?Q?lOTk9npMQZr+bdV+YEQYuwDKCOZvyub+i/R+fkICLcu6Nkj2yFcZUcZyI/Hg?=
 =?us-ascii?Q?MYvOk0dH3deyywRmYT/R+50IZKYlRkx74Dx8VvOcX8kjT6AAYd6dyQEi8ZF8?=
 =?us-ascii?Q?DZWz3f/+do7ZtbHYuU4xG3IkpH/gD38yfxGozCkhl22yHMKWs4s/hCIRXp28?=
 =?us-ascii?Q?c58ceoPPlWKFEQi+/KRvJgGK58LxqzAWr1J2+UzHPp9v2sItBGAeOja6hSrV?=
 =?us-ascii?Q?adgHgHeRlXQdj47uZVBks/njJBV0XsMXIb4I15M6+oVBYOUF7LmrvNkc4TTi?=
 =?us-ascii?Q?ywVsN+hvMK+hNqS8Nq3H+bnSYs/3TOzs/s7Ous3WgAUnoFvnIBgoHK2vYOM0?=
 =?us-ascii?Q?iv3hV8mPc0iccpKZtr5LRy3Ff6IcU0nIVjNZHA5yG/Tanmzg/mEwcD2mklsL?=
 =?us-ascii?Q?kbwveNtgQcHIJoLX561XeyBf5mpXgJuLGko98XrOHM9k+VxSm6/AwRVeEu7I?=
 =?us-ascii?Q?e2BvqTInsKoHmIJegSBRxuXAGWzENWRH19cHV7bQg04wlEWYk+zcvjlNu3/B?=
 =?us-ascii?Q?mSGViOTYAQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: NOASgZT5hl/QNLs78Svt+VUH9sA1Bc3J2C3OqrVkujPerfGue0wxqbD3MPpDNBSqxp8KvOyomXe4ZwoWvvy0/1HRtGjunI1gM9uRJUENYDutwUsZUY4jHOqp35AOK6pneNPxWJ0OW5rqYepiS2hc/6RY7jQz5t6QrLTWTrXOeBmIgvSSLXsnwvyUCg4NGb1VrE0clqJbdUvaLZYKso6MPDYC2rTmHEuNJVbyET81GeQl/GSR2S969QyBeu+5d9nGJ1xjO1xn8rWDKFcKg0tv4oPM0NdGD1SAuwA0LM0MEeOErvzNJFSNo/QrBOvN0BODTvZ80uL6eo/ghsMjGnlqWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56384167-0bf9-45cf-288a-08df01128e05
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:32:11.6484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G866m9qIoz3MOjN4f8bjquEsuIsUPQ8w21jsAsXm3WuDhMDDw0fI/GDMM4COxxW1dHNsJEg0X9cZ7ZKL0SOcZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

Hi Paolo,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   233907fd00d20cb913bac974697845f18998af64
commit: 9c8474fa3477395e754687b3edb17ca0dfe46d6a [0/2] KVM: x86/mmu: avoid NULL-pointer dereference on page freeing bugs
config: x86_64-randconfig-002-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221940.w1zAaW7O-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221940.w1zAaW7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221940.w1zAaW7O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.o: warning: objtool: mmu_free_root_page()+0x18c: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
